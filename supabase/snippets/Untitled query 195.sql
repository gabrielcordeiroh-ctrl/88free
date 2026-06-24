SELECT 
    id, 
    funcao, 
    valor_pagamento, 
    data_diaria, 
    (data_diaria - NOW()) as tempo_restante
FROM public.vagas;