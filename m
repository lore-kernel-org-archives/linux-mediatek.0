Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5480C32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 12:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2CjazNJKWxawIRrAspwhPS6UmjSbXOY3YGzYB4E+Plc=; b=sEdR956C07hIe6zUo4V6ESbwF/
	RzQ+dJPOr4sEoYr58h51uLEOoKH+m0G+VYdII+1lbbNOlRS6jZMNR2TCXqkYsk8Qkhh8Kw19Q15R/
	jhANWditTmWmEXeVlQlV9adg7yXuqJWv+5q3erNopekxsofN82KSAb2xsq40AvkTnYeFQ/+KYJqsP
	x1g+EeNGXq5NSYDgPQPEdgd3PAFwtZlEyH/KWL94l8QF+YJJgt4Glik8xyOKpYeijipm28DuNR/f/
	meHkKlJ8OPry4glRtkt1eoQXqn615Q5CrIrWOOgO4yllClF3hWUw8Z4/siLXauRcbd2OVtGOhhN2H
	QLbbWGMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQTNj-0063Yz-FD; Tue, 23 Aug 2022 12:51:47 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQTNd-0063U2-LH
	for linux-mediatek@lists.infradead.org; Tue, 23 Aug 2022 12:51:43 +0000
Received: by mail-lj1-x22e.google.com with SMTP id l21so13414136ljj.2
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Aug 2022 05:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=2CjazNJKWxawIRrAspwhPS6UmjSbXOY3YGzYB4E+Plc=;
        b=PPLvIhXyebaOzt5ZAgHRARuDpjE3QXcTZv8jgbNY3zvBxdR5T0KE8RXbL3ML0vLwwB
         utCyLkgq11HaiFzWK0PFjwBSeIkes+bOWEYJ3CaofriBJbCbD9Qhx0lN8j5/GtjKwYYb
         m2K9YR+tgW5R1pBYPlAQJkVPKATZjYOH/NCSBf2RhfXcTCWroHyMVa6FoWqCo3dP3inn
         CjTL8urZ46DjEbFoimD1Pr29eOLhWBHVc5d6dIC6RNja2OZ8AZ2wUPeQ61HgB2f6EfKk
         PETJTyGEGsqOX15mWMZcrVeKFaWM0VtdOfIdJzvG0XJ0xpUUwCviiqf1gi1dVUDnqb17
         Os5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=2CjazNJKWxawIRrAspwhPS6UmjSbXOY3YGzYB4E+Plc=;
        b=F7FhGVLkaUOeg3M6l3oFwMWuoNe7zL7Z756aVINtTU2yTpLhJbHU/+Veq3lbshuuoG
         H0W5BnFm6umQHXimWpWYpAeiGM9FPMA7fKq7HgQq2w9ypc/UwePs2tJSj6VNO29BS9pv
         4NXlLdElXup5EfXL4+9sDGjuGQTi9oLxdDcBy7z3ZmXomX8llCth3ZBuAfXfG3IRgw82
         7PbH5bybag5ieZkwFy3mZ6BfC1SSh/+R9CX3snKEXPvoJWblZiY5deINd+gUMVygAT1j
         JmfxMKTHNYf9D4uC2M8U1CCsuop/zgJRe4+tQj+LqRXqW22atFATyR4yAgXLaDP2NON9
         Ppsg==
X-Gm-Message-State: ACgBeo1/wAmJ9/vbgK75pi3+F+Rkb7G7mjzl2rLXHDANffdEme0QL0mY
	OxJV9h+4nFdCdTO/OfMVIIi1kQ==
X-Google-Smtp-Source: AA6agR58Hgvt7z3DYujhjrD2ZnvOcvvv4OymBiELF8Edk9l9F6qF62D2kPrhZN7V9Fcd3PvG3QDT+A==
X-Received: by 2002:a05:651c:b29:b0:261:d351:9dc4 with SMTP id b41-20020a05651c0b2900b00261d3519dc4mr1840748ljr.409.1661259099827;
        Tue, 23 Aug 2022 05:51:39 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id e9-20020a05651236c900b00492e148365fsm1234663lfs.294.2022.08.23.05.51.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 05:51:38 -0700 (PDT)
Message-ID: <05f99396-f6e9-a315-7264-c659e3ec507c@linaro.org>
Date: Tue, 23 Aug 2022 15:51:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 1/4] dt-bindings: mediatek: modify VDOSYS0 device tree
 Documentations for MT8188
Content-Language: en-US
To: "nathan.lu" <nathan.lu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: "jason-jh . lin" <jason-jh.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Moudy Ho <moudy.ho@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 wsd_upstream@mediatek.com, lancelot.wu@mediatek.com
References: <20220822033213.15769-1-nathan.lu@mediatek.com>
 <20220822033213.15769-2-nathan.lu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220822033213.15769-2-nathan.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_055141_749827_D6D7FB18 
X-CRM114-Status: GOOD (  10.36  )
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

On 22/08/2022 06:32, nathan.lu wrote:
> From: Nathan Lu <nathan.lu@mediatek.com>
> 
> modify VDOSYS0 device tree Documentations for MT8188.

(...)

> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> index 0882ae86e6c4..d0e6c0dd4dfb 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
> @@ -30,6 +30,8 @@ properties:
>        - items:
>            - const: mediatek,mt8183-disp-rdma
>        - items:
> +          - enum:
> +              - mediatek,mt8188-disp-rdma
>            - const: mediatek,mt8195-disp-rdma

Why do you change existing bindings?

Best regards,
Krzysztof

