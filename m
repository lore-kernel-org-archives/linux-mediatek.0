Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A9FC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 11:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QdBXvulWSmdKT5VbidEtI6I0UVSLzXe6zhWNR8wvsRw=; b=NwsL74VsjFzyVp
	EqX9fAD3BZzjcqFEE4kmMehmseebS9CRQPQWd4geHqju733yO0iFSiAaJhzCL4RkA1s4bVGAoRHAf
	F6YA0ouQHpR8BN0AURWaNt9L2SR6zPPGJi5XPTHW6yhIETVmBatNtMjsRUSEMLDxz9a7IuXtUyqUG
	us1YNjLnIoad7VqanqNfiR1MSIaMxlrplK+dvtU4nh7HGx2X4ZY0gO6LOXq72cjBfN87mbY2aOFcF
	hDm3Le7qRjZoFofuPshuo8Og73h9e80RXZbLLWVR9eW66AfrzRKS3Qz/c4hJjidQ7hKRm9JexF6Lv
	DwaySlwylVgG5fScmm8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqYy5-007KHW-8g; Mon, 16 May 2022 11:32:53 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqYy3-007KGZ-Cn; Mon, 16 May 2022 11:32:52 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 m2-20020a1ca302000000b003943bc63f98so8439967wme.4; 
 Mon, 16 May 2022 04:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=caeR1d5UF/OVvqIoQomSco97tJ43m4mKPZrJZyYHxJw=;
 b=J9z9Eo4Uws1wL5DN7Apv1Nidg+AkLal3CFdoeL6/CmNOcfT+UuLdAwwacmvG72zOjp
 AJfH7g3i4BHKEG3vxH0OCHDxdgDOWHtmgZoSfTjRvEhAPgwsfzY0PgDT0uDPZ2QzGsSb
 K8e21Vw3Q/4L5V2DDzqveSFoIMTm4O8Z1Eg0AQxycGm9+FcRUhjuQvLyLzZLYXpZ8c+U
 nxHnJEoTyKSxHH6VU5jLYXW8Wi5vz+8KgiL1r73b+mqpC6r6bX72GL53a/Zhjf8iroFY
 FgUN9zRwN0Jo/Z88OXmjABQ34oU6ncA478+oJ1k1OXf0rZ3NbiEdheSVwWLMaHekGxx9
 PJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=caeR1d5UF/OVvqIoQomSco97tJ43m4mKPZrJZyYHxJw=;
 b=xonEC2g5gKWj5OoFqCBGiFWHYvtohmFPsuaIskoF0LXsYR/OtmoJqicrunRynFIpVS
 NKIV9dX6jYsnMOABcp617qNrTYEfYMHeDz29Y2kFDLuLFOs/Nps2hF7uQR/9+0K1eSu7
 TvGvWWwk8oKCzyeK1Pp+RvF0n4xes/dIsCyutS3VJcrVROk2PTkz5rQ4MBE1eBv44Rty
 aVDMLvPxZ3brP7lJG8Eu6BEp8Ee1DG/1ZdMUm3GXJ/zHqrULvlBmiAxhHYgp4oVeXJPC
 xdVTJ54wbxk1KC0IlEfnEUiepJrawQKlHTpjkprrFHvU4XPvLvf5q6u1v55vEn2qA7Y4
 VvzA==
X-Gm-Message-State: AOAM533UDtHGx8emmzK8WPNlNXrPMeOGPMAC0dKhlWV9kkCJGQ5mCw17
 brPwY27lJAh6zZoOJdhdYks=
X-Google-Smtp-Source: ABdhPJz3pErEXVh6c5jSOm5lb9urUb/kznpC3Pzf2jcgE4pcvIh1nDHvdVZVd+IKCii501ptpAeCxw==
X-Received: by 2002:a05:600c:154d:b0:394:8d64:9166 with SMTP id
 f13-20020a05600c154d00b003948d649166mr16485448wmg.102.1652700768735; 
 Mon, 16 May 2022 04:32:48 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 n12-20020adf8b0c000000b0020cdf6ecafbsm11529943wra.81.2022.05.16.04.32.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 04:32:48 -0700 (PDT)
Message-ID: <d602eb96-587d-5b1d-17af-2af83acde709@gmail.com>
Date: Mon, 16 May 2022 13:32:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 1/2] dt-bindings: memory: mtk-smi: Add MT6795 Helio X10
 bindings
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 yong.wu@mediatek.com
Cc: krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
 kernel@collabora.com
References: <20220513150633.387200-1-angelogioacchino.delregno@collabora.com>
 <20220513150633.387200-2-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220513150633.387200-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_043251_485015_A08E532C 
X-CRM114-Status: GOOD (  12.30  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 13/05/2022 17:06, AngeloGioacchino Del Regno wrote:
> Add SMI bindings for the MediaTek Helio X10 (MT6795) SoC
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../bindings/memory-controllers/mediatek,smi-common.yaml         | 1 +
>   .../bindings/memory-controllers/mediatek,smi-larb.yaml           | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> index a98b359bf909..71bc5cefb49c 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> @@ -32,6 +32,7 @@ properties:
>             - mediatek,mt2701-smi-common
>             - mediatek,mt2712-smi-common
>             - mediatek,mt6779-smi-common
> +          - mediatek,mt6795-smi-common
>             - mediatek,mt8167-smi-common
>             - mediatek,mt8173-smi-common
>             - mediatek,mt8183-smi-common
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> index c886681f62a7..59dcd163668f 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> @@ -20,6 +20,7 @@ properties:
>             - mediatek,mt2701-smi-larb
>             - mediatek,mt2712-smi-larb
>             - mediatek,mt6779-smi-larb
> +          - mediatek,mt6795-smi-larb
>             - mediatek,mt8167-smi-larb
>             - mediatek,mt8173-smi-larb
>             - mediatek,mt8183-smi-larb

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
