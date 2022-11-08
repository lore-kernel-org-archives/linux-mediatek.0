Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED3EC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 17:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4S8EZJDZbtM3oCAAcuZ31iTmiTXYW1L+lPMVCWl/GDk=; b=yCzla38gWBORYKpY3NdaBeQ9+d
	KUMJZ7PGaEIqvHFCTT6liSydtgzN3XxmeMCQV4OTNAD65DKMuWX2KCTNPd1oyO+lJvUUypRmG45H/
	7coiWa+oydBRP6nCMRS4/LMYzheORCgp/KMWdZjSQh8tkV6vTonKzc5bA4BLXC+pAehijWT6sbY0x
	7q+TgcpphSKg71vX4Itk23ygF1xjMy5jW8g3wUlj1svDnsPli6xIbAJV5HG2CzBii+7HSDrpZeU2N
	bFBub1Hv1E9nizvKTZ2BkQnNdcPZM/BRQrIGIS0O9+AuamieH0EisvmhZRQDbBc9r7waq9bAS8jer
	bG1sOITg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osSih-007Hus-1Z; Tue, 08 Nov 2022 17:49:07 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osSgg-007GLN-Nb; Tue, 08 Nov 2022 17:47:04 +0000
Received: by mail-wr1-x430.google.com with SMTP id o4so22176471wrq.6;
        Tue, 08 Nov 2022 09:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4S8EZJDZbtM3oCAAcuZ31iTmiTXYW1L+lPMVCWl/GDk=;
        b=dhZDqwf14fe2j9UdiqdGAWf/ff1Enkmy8X7284TTYgt4vFS5oxwGlWCk44cjNOIWeh
         C7X1k7EWwaNcYfTW7s6c2Asy79xj6KnQhtDGuXcw6iRSMJnLb8BfC1BPXc+f1CpfS3xD
         lGHz09ZV17PRqZYjpnOERIqukj8eVPBJfhKQbBWMtYRHGTA2BqHThsVGAsJoCZH8Saxk
         dDc3M+rhEaszbLQntXKf7vAtyFZzlOb0phkUD/JBrSuEPQMbGR379flWMVr+i7RBWLq8
         IS6zMymo8wmzuP+pZh5NlJ7HuVoFGgidpe7eW2S/X4l4ByZdmR+JdBMjOyeIJPvKh4lp
         jVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4S8EZJDZbtM3oCAAcuZ31iTmiTXYW1L+lPMVCWl/GDk=;
        b=si2y9G4qGEQ+tZAKZ3Vyxm/2GzzikvSfFlB3iehFaBTl/SLHew5s4Aj/+sl4whMYqp
         7sVZnrXKBO2kt0NSXZyxKZsFcIIiz8K0+Xob3Zhis4VKbyBUt/HzwVlNiqS1yWhR+lWW
         5pfHbIjG7aWJSmPWluvmtzSANSzKG8eADmHJDen0DxOsUWV3WEFI1i42Ac5F4PphxB8K
         Pf4bmAynVmCW+XRryknUgu+NLseqvbvJRynA+xiHUkYSEULssCc9Yd5ZzvRpiwrjnhvw
         Ce3UbnDObLb47dzLDgcT9PjQBnwXB/AVHeF7XTE7M1PGw6zjQrffzZMpdZoPHMoRAkEN
         5VsQ==
X-Gm-Message-State: ACrzQf3c2GamjTb1+jrTbxHTIqieK5KzbU0E1p2PoYB0fq0EBVOtd9Hb
	87x+NBY9bArTZ+TxNGTL5vk=
X-Google-Smtp-Source: AMsMyM6KcCnDX4sMDQZ66dZ+DyYmTDlrlRon5/4mXWx4R8J1wOheJBCVno0GUU2uAy7tiO5R+7rzEQ==
X-Received: by 2002:adf:f392:0:b0:236:2c41:d3f5 with SMTP id m18-20020adff392000000b002362c41d3f5mr37236832wro.596.1667929620336;
        Tue, 08 Nov 2022 09:47:00 -0800 (PST)
Received: from [192.168.0.25] ([37.222.251.204])
        by smtp.gmail.com with ESMTPSA id r17-20020a05600c35d100b003c6cd82596esm16687600wmq.43.2022.11.08.09.46.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 09:46:58 -0800 (PST)
Message-ID: <c6297a1c-e282-4a18-f16c-fa2df08b440a@gmail.com>
Date: Tue, 8 Nov 2022 18:46:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux@roeck-us.net, nfraprado@collabora.com
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, singo.chang@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221107072243.15748-1-nancy.lin@mediatek.com>
 <20221107072243.15748-2-nancy.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v28 01/11] dt-bindings: arm: mediatek: mmsys: add vdosys1
 compatible for MT8195
In-Reply-To: <20221107072243.15748-2-nancy.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_094702_881840_E46EFB12 
X-CRM114-Status: GOOD (  16.31  )
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



On 07/11/2022 08:22, Nancy.Lin wrote:
> Add vdosys1 mmsys compatible for MT8195 platform.
> 
> For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding to
> 2 different power domains, different clock drivers and different
> mediatek-drm drivers.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml      | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 0711f1834fbd..aaabe2196185 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -48,7 +48,9 @@ properties:
>             - const: syscon
>   
>         - items:
> -          - const: mediatek,mt8195-vdosys0
> +          - enum:
> +              - mediatek,mt8195-vdosys0
> +              - mediatek,mt8195-vdosys1
>             - const: mediatek,mt8195-mmsys
>             - const: syscon
>   

I think we had that several times already:
https://lore.kernel.org/all/6bbe9527-ae48-30e0-fb45-519223a744d7@linaro.org/

We will something like this, but please check that this does not give any 
errors/warnings:

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml 
b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index eb451bec23d3d..8e9c4f4d7c389 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -32,13 +32,22 @@ properties:
                - mediatek,mt8183-mmsys
                - mediatek,mt8186-mmsys
                - mediatek,mt8192-mmsys
-              - mediatek,mt8195-mmsys
                - mediatek,mt8365-mmsys
            - const: syscon
        - items:
            - const: mediatek,mt7623-mmsys
            - const: mediatek,mt2701-mmsys
            - const: syscon
+      - items:
+          - const: mediatek,mt8195-vdosys0
+          - const: syscon
+      - items:
+          - const: mediatek,mt8195-vdosys1
+          - const: syscon
+      - items:
+          - const: mediatek,mt8195-mmsys
+          - const: syscon
+      deprecated: true

    reg:
      maxItems: 1

