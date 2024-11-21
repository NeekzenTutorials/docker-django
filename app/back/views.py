from rest_framework.views import APIView
from rest_framework.response import Response
from .models import Product
from .serializers import ProductSerializer

class ProductListView(APIView):
    def get(self, request):
        products = Product.objects.all()  # Récupérer tous les produits
        serializer = ProductSerializer(products, many=True)  # Sérialiser les données
        return Response(serializer.data)  # Retourner les données en JSON
