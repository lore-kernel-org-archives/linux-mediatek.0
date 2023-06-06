Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3209AC77B73
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jun 2023 06:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lWZHLpwlZiyh0mbSg9UHrRROxQYp3ljP7tis5obXTpc=; b=wXQw0wZsxSTOG/HYpO60V9PfZc
	CETpGZYiSXJM5fG7c5eQhd1Ab0uAln623dDj8p7aywTUSdvBUnD3aAH1JxJcjuvdXCMC+yHT7k7wc
	FqdW5kjugpDtNZVX4ajyhp5owIrt9WvZ86NxThMcS5SC40t0Ff015Kglo4AyROlQ2aijJHCmkFXPY
	pstkCPrkAMCDR4N0y3kgb0TqFMhhZiq8fnlZFDoBx6rDlBsinsS2mtCTNxS5Fxz6ckYb3ti+U0ymJ
	LGrfHW8lsaeKjfk7PVkIz90dYHVG7eNVav8sNwT7FageiabA7FtFJK50exsdhhJ3sG7kDbXOPSUZK
	Okc3B6wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6QIe-000OBY-0I;
	Tue, 06 Jun 2023 06:36:12 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6QIb-000OAF-0J;
	Tue, 06 Jun 2023 06:36:10 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f6d7abe934so49387475e9.2;
        Mon, 05 Jun 2023 23:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686033366; x=1688625366;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lWZHLpwlZiyh0mbSg9UHrRROxQYp3ljP7tis5obXTpc=;
        b=I6uQYKAr4ZSDnsQ5/Tc2KorIc4lx/ptp3UP5pzJkKRNegwdUO9fao4Z8EvOQ4cukRp
         9ZIB5yjLuC43PvnRvt6PCiB+vnASb2VCAgTb5Bkpk34XJDn8xghPYDPLH6SYQjctRwvF
         7wc01KpZyH9UT8bzqjje08GtgR7I0EEo/+1kdcNuAAG/z2LNZHNuIdaXXuSDoGqgmYRc
         q5D/G8mwjBoHw+uKwakTnr0dr+XHzuEpTZlB2S0WVhipfxmtd8Ij7kAwPYyUTRmZnTkV
         2+9OXXdQzPFpWtcKCDXsWqv0HrHcCTXaPISw65V0+pnENpL53EPmHruQanvzpN0KYhYu
         QTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686033366; x=1688625366;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lWZHLpwlZiyh0mbSg9UHrRROxQYp3ljP7tis5obXTpc=;
        b=XcCWxjDPleQ6LbOC47k5UsO+dXZZ91Gxjh0KiReV3jishzNjp4RhyZ2G4FbEDb/zh3
         C7TI+UVpYxzVxrSTJfKrZdV3y66xzC6tj5CNKp9ThYfB3lKVkAVZ9bCDPoSJJWf/q+5D
         D0v0U2rYyKMhJE0BzhbxAshGF6S2VpSxywKR/3sbSmh6K/93SSQ4QZFKWSJ/Ielt0BGq
         4V71gpWEI/1aXCsAyTM7NW4YZz4JiWCTCGkqQ/gLvWurlZERGVmzVEXZ3zxKUUCqJQYI
         EycVuXnRPV0zLFCAU37O0LwI5oXhG00sq3aivZq6czCIFt9aQa4pRPThivFENyU/dvS8
         32uA==
X-Gm-Message-State: AC+VfDyyaKoKxx9hr2wRrYA8keOjg3BlmN/AT36u0qHjUxyE5pj0uRN+
	LDVmbtIaqOe0gj4bCOqn76A=
X-Google-Smtp-Source: ACHHUZ55SslIZxqqaCA3NchHhTQzQVFyP1VjU3PUlqivDduX4REkNysmvGxeH/m7wpDX3O04U76m3Q==
X-Received: by 2002:a7b:c858:0:b0:3f6:e59:c04c with SMTP id c24-20020a7bc858000000b003f60e59c04cmr1029053wml.24.1686033365945;
        Mon, 05 Jun 2023 23:36:05 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id o10-20020a1c750a000000b003f60482024fsm12966148wmc.30.2023.06.05.23.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 23:36:04 -0700 (PDT)
Message-ID: <23b38a9b-8e7d-446a-ca97-f4f60c971bce@gmail.com>
Date: Tue, 6 Jun 2023 08:36:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 1/6] media: dt-bindings: mediatek,vcodec: Allow single
 clock for mt8183
Content-Language: en-US, ca-ES, es-ES
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230605162030.274395-1-nfraprado@collabora.com>
 <20230605162030.274395-2-nfraprado@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230605162030.274395-2-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_233609_153294_FE858DAD 
X-CRM114-Status: GOOD (  13.61  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 05/06/2023 18:20, Nícolas F. R. A. Prado wrote:
> MT8173 and MT8183 have different clocks, and consequently clock-names.
> Relax the number of clocks and set clock-names based on compatible.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> 
> ---
> 
>   .../media/mediatek,vcodec-decoder.yaml        | 29 +++++++++++++------
>   1 file changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
> index fad59b486d5d..57d5ca776df0 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
> @@ -27,18 +27,12 @@ properties:
>       maxItems: 1
>   
>     clocks:
> +    minItems: 1
>       maxItems: 8
>   
>     clock-names:
> -    items:
> -      - const: vcodecpll
> -      - const: univpll_d2
> -      - const: clk_cci400_sel
> -      - const: vdec_sel
> -      - const: vdecpll
> -      - const: vencpll
> -      - const: venc_lt_sel
> -      - const: vdec_bus_clk_src
> +    minItems: 1
> +    maxItems: 8
>   
>     assigned-clocks: true
>   
> @@ -88,6 +82,11 @@ allOf:
>         required:
>           - mediatek,scp
>   
> +      properties:
> +        clock-names:
> +          items:
> +            - const: vdec
> +
>     - if:
>         properties:
>           compatible:
> @@ -99,6 +98,18 @@ allOf:
>         required:
>           - mediatek,vpu
>   
> +      properties:
> +        clock-names:
> +          items:
> +            - const: vcodecpll
> +            - const: univpll_d2
> +            - const: clk_cci400_sel
> +            - const: vdec_sel
> +            - const: vdecpll
> +            - const: vencpll
> +            - const: venc_lt_sel
> +            - const: vdec_bus_clk_src
> +
>   additionalProperties: false
>   
>   examples:

