Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE48ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 15:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DhU36xf+kkHEB9Z3O8FzZRfYoFwRwILvA55dsayFWs8=; b=jzX0MmJeLEuUqfSc7y6Z5PfbWF
	ernii9EtbtWdzO5eiSnLgk3InKUDtSUMUm+nan6Vf9Sc1DUDF248xs73gpdHWsSS0hqNhq6zMyMpt
	p8EOTYW9C4XL2AGW2YXTQHUaZ0lQIH4NkKbrPrERRFdzGT1cJd+fRa40BqgrQu1IcSKHxHWJtDx9z
	Bn2AiDAvMO60tdpqDgnp4lnIvbGDBy+SzszP53qqgEtAHIJiqqmSh1gdEfJiMNpkI30Dqm0/D/nwP
	GQQzBCDukD5N4HRpiFFoCfehfYPqUSSZ3s9hBnHf1s05RlUvaW9Zlggo2DNZkdqf86mCJTp9Jpwg3
	YZ4UlcbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaf7n-004r7Z-Sf; Tue, 20 Sep 2022 15:25:27 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaf7V-004r0Z-5T
	for linux-mediatek@lists.infradead.org; Tue, 20 Sep 2022 15:25:17 +0000
Received: by mail-lj1-x233.google.com with SMTP id g20so2229773ljg.7
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Sep 2022 08:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=DhU36xf+kkHEB9Z3O8FzZRfYoFwRwILvA55dsayFWs8=;
        b=a9N0xBcJWqgFz3GGJcXD8noE97lXy7QNax86oqqGfMegWL/Dh2tp9gz2Z3Ikqlukzv
         3e+4GE+r5E07iK9mF5PrtLSQCkKDewNzSaZLdic4FZ672ohjn3Z4xIqIuNgP3zihMtet
         vB6027D4Y+e4Y3aLvPV4tJNYvNEG9s3Y4g3fUP6EmVfdChD8jr46ymBXbn6sD5PYwMSW
         2QiCsGRFiCKAP3iaDo7gmf1+1bN3vhn9BPFkROD+laaz+nPyltaD3cDBhAbfrm0spB7Z
         bwKxuCE9boCqnhmqHhPQ4MyVzhUCkLoPeCKRbIba2oTAUI0ToIs39vvXjNMSbdHb3rP4
         6PXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=DhU36xf+kkHEB9Z3O8FzZRfYoFwRwILvA55dsayFWs8=;
        b=hoiIqUeKKwIeYj2uoqu2aY0pFsv8Mgfbw1Ope/OyT1a+iVlU/IK0C1eacmwJ3D3osb
         JS8kJdYbCxdOSDw7Ah67rH7WmRirG7QUbTrXZECqFXPA5KSv2YuCs4RRvQMiUutA+sdQ
         cMcwXCkxglc6pkZBzNOnTZ9R/WENI3Hwve2hOXsehhjStcefgM0sFpejElat6SKdL1bQ
         0cR9cYgHRf0ELp8J+IdETAK1Z/VvRx+vY0+nqln8LTbP5E7JiIDtPkcK9DKio144z8v3
         /NuNjLbe0TYHFcU6s1l1iG8WeHa0h+fcw3SAnyI5M33KyNL4rUGi/Dw0cSfvNjb/uvkv
         GWpw==
X-Gm-Message-State: ACrzQf2xrAJCb+FdLEXEnchiisYXYtp65y/xpYVhrYjFqgaq6Fj2TX0l
	2Fp8XzT4PN5qCHO7n0/aBwGX/g==
X-Google-Smtp-Source: AMsMyM6Cgpbl2F9f16R5noJsi+2UR6Jgk4PA7Ag+UQOv1ct+XWi4TWMoVvX8yvs6ZaX+q3DNo8e0LQ==
X-Received: by 2002:a05:651c:10a7:b0:26c:5d3e:d040 with SMTP id k7-20020a05651c10a700b0026c5d3ed040mr900959ljn.182.1663687505132;
        Tue, 20 Sep 2022 08:25:05 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s30-20020a05651c201e00b0026c453c51b7sm7459ljo.68.2022.09.20.08.25.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 08:25:04 -0700 (PDT)
Message-ID: <65c93c5d-941a-267b-408d-95be83dc2454@linaro.org>
Date: Tue, 20 Sep 2022 17:25:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 1/6] dt-bindings: arm: mediatek: mmsys: change
 compatible for MT8195
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220920140145.19973-1-jason-jh.lin@mediatek.com>
 <20220920140145.19973-2-jason-jh.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920140145.19973-2-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_082513_552812_A40DA7DF 
X-CRM114-Status: GOOD (  19.82  )
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

On 20/09/2022 16:01, Jason-JH.Lin wrote:
> For previous MediaTek SoCs, such as MT8173, there are 2 display HW
> pipelines binding to 1 mmsys with the same power domain, the same
> clock driver and the same mediatek-drm driver.
> 
> For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding to
> 2 different power domains, different clock drivers and different
> mediatek-drm drivers.
> 
> Moreover, Hardware pipeline of VDOSYS0 has these components: COLOR,
> CCORR, AAL, GAMMA, DITHER. They are related to the PQ (Picture Quality)
> and they makes VDOSYS0 supports PQ function while they are not
> including in VDOSYS1.
> 
> Hardware pipeline of VDOSYS1 has the component ETHDR (HDR related
> component). It makes VDOSYS1 supports the HDR function while it's not
> including in VDOSYS0.
> 
> To summarize0:
> Only VDOSYS0 can support PQ adjustment.
> Only VDOSYS1 can support HDR adjustment.
> 
> Therefore, we need to separate these two different mmsys hardwares to
> 2 different compatibles for MT8195.
> 
> Fixes: 81c5a41d10b9 ("dt-bindings: arm: mediatek: mmsys: add mt8195 SoC binding")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml      | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 6ad023eec193..df9184b6772c 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -38,6 +38,10 @@ properties:
>            - const: mediatek,mt7623-mmsys
>            - const: mediatek,mt2701-mmsys
>            - const: syscon
> +      - items:
> +          - const: mediatek,mt8195-vdosys0
> +          - const: mediatek,mt8195-mmsys
> +          - const: syscon

and why mediatek,mt8195-mmsys is kept as non-deprecated?

Best regards,
Krzysztof

