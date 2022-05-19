Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552F8C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 13:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HCubKHh9Q81hDzxKaUd6o2wQQK+T/LrcWAdiSdCJ/hU=; b=CDTE3tSF/edk7C
	LKgg+yxoOsK0v21WxDia/DY0LXYh43i4dTymGT2sPP+H4Gi7HUw373mM/DGyaCdbdLswaO3s+KfSh
	OBtljz5bsHLtDAe1/2nPMm4oR01FqcUB2AmW9Bxq6cgb/1nxR+F4/ez0WH11BZwQCHwimvjOlGO1G
	cSn7fFZ9s7YCWhrfmPUkSrbYGnw71IiSYqEJO2SAlTEHGqc7r9B7q8Wghw/ZFHPE+Kj80YIDTEz3Z
	l+WgM2WsrzVJPKKCPYtC81lsJe3Y4iqR7UUhHglhOcYX1XXz+o8axuhGdwUfkIZFYFAdazn67+ZNk
	f4JqtAg1uCFjIfiqznCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrfy5-006wEp-8C; Thu, 19 May 2022 13:13:29 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrfqd-006szx-FA; Thu, 19 May 2022 13:05:49 +0000
Received: by mail-ot1-f46.google.com with SMTP id
 v22-20020a05683011d600b0060aeae0b599so182659otq.0; 
 Thu, 19 May 2022 06:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=Q/j+6fWgTqD415mSRX9AX0OXoNhg/oIoVCv39xRaqdo=;
 b=aBRrKlOYpXVKIps6fQqtd7QvzdKDiEgqfqmnUycAKgF7zsHckA6n0i0J3GabOmt2Mz
 EHcIm2XkiFivyBLx5dYBF3/Oel87ElxIdemU8W2BXG3pWDW0WUw+pEdEtHYEBp/FEn+s
 fba6Blg+Z91KUPi1Ev9/NrdfFQKaFo0wWKONs8ZPy+vAMEdHcDQgpcKtTI0cuXRJbSqj
 YxWAslEEFHXYC1zDjRncXGI7QYEw+xooV6EzjU9clsSP/XtHNw+UbYa3e/fAirAd59I1
 K7uoiumLPMyYPp1NZydx2PsZz9Kerk4FS/Cd7QrRrDnCGLFDTJaw2yAKbzijTrkaeQ5g
 3KjA==
X-Gm-Message-State: AOAM531Rj9fJyJu16gK/DxUDJFKeMCtMY9ZfgIYoeznWFqyACk//W1Xw
 1UcD9t6MqgI3Kvkw1iVC0Q==
X-Google-Smtp-Source: ABdhPJyPEkqet1JAMCaueSPlwvRkHmeO55aWygzOBFDEVMu07vwehIQomdtoatme15/VpZ1w6QwVQw==
X-Received: by 2002:a05:6830:1e13:b0:605:f05e:d413 with SMTP id
 s19-20020a0568301e1300b00605f05ed413mr1876449otr.296.1652965543699; 
 Thu, 19 May 2022 06:05:43 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 r206-20020aca5dd7000000b00325cda1ffbbsm1752423oib.58.2022.05.19.06.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 06:05:42 -0700 (PDT)
Received: (nullmailer pid 1359569 invoked by uid 1000);
 Thu, 19 May 2022 13:05:39 -0000
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-serial@vger.kernel.org, gregkh@linuxfoundation.org,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20220519105928.22826-1-angelogioacchino.delregno@collabora.com>
References: <20220519105928.22826-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] dt-bindings: serial: mtk-uart: Convert txt to json-schema
Date: Thu, 19 May 2022 08:05:39 -0500
Message-Id: <1652965539.994674.1359568.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_060547_566228_58F20B50 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 19 May 2022 12:59:28 +0200, AngeloGioacchino Del Regno wrote:
> Convert the mtk-uart documentation from freeform text to a json-schema.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/serial/mediatek,uart.yaml        | 118 ++++++++++++++++++
>  .../devicetree/bindings/serial/mtk-uart.txt   |  59 ---------
>  2 files changed, 118 insertions(+), 59 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/serial/mediatek,uart.yaml
>  delete mode 100644 Documentation/devicetree/bindings/serial/mtk-uart.txt
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


serial@11002000: compatible:0: 'mediatek,mt6577-uart' is not one of ['mediatek,mt2701-uart', 'mediatek,mt2712-uart', 'mediatek,mt6580-uart', 'mediatek,mt6582-uart', 'mediatek,mt6589-uart', 'mediatek,mt6755-uart', 'mediatek,mt6765-uart', 'mediatek,mt6779-uart', 'mediatek,mt6795-uart', 'mediatek,mt6797-uart', 'mediatek,mt7622-uart', 'mediatek,mt7623-uart', 'mediatek,mt7629-uart', 'mediatek,mt7986-uart', 'mediatek,mt8127-uart', 'mediatek,mt8135-uart', 'mediatek,mt8173-uart', 'mediatek,mt8183-uart', 'mediatek,mt8186-uart', 'mediatek,mt8192-uart', 'mediatek,mt8195-uart', 'mediatek,mt8516-uart']
	arch/arm/boot/dts/mt6592-evb.dtb

serial@11002000: compatible: ['mediatek,mt6577-uart'] is too short
	arch/arm/boot/dts/mt6592-evb.dtb

serial@11003000: compatible:0: 'mediatek,mt6577-uart' is not one of ['mediatek,mt2701-uart', 'mediatek,mt2712-uart', 'mediatek,mt6580-uart', 'mediatek,mt6582-uart', 'mediatek,mt6589-uart', 'mediatek,mt6755-uart', 'mediatek,mt6765-uart', 'mediatek,mt6779-uart', 'mediatek,mt6795-uart', 'mediatek,mt6797-uart', 'mediatek,mt7622-uart', 'mediatek,mt7623-uart', 'mediatek,mt7629-uart', 'mediatek,mt7986-uart', 'mediatek,mt8127-uart', 'mediatek,mt8135-uart', 'mediatek,mt8173-uart', 'mediatek,mt8183-uart', 'mediatek,mt8186-uart', 'mediatek,mt8192-uart', 'mediatek,mt8195-uart', 'mediatek,mt8516-uart']
	arch/arm/boot/dts/mt6592-evb.dtb

serial@11003000: compatible: ['mediatek,mt6577-uart'] is too short
	arch/arm/boot/dts/mt6592-evb.dtb

serial@11003000: More than one condition true in oneOf schema:
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb

serial@11004000: compatible:0: 'mediatek,mt6577-uart' is not one of ['mediatek,mt2701-uart', 'mediatek,mt2712-uart', 'mediatek,mt6580-uart', 'mediatek,mt6582-uart', 'mediatek,mt6589-uart', 'mediatek,mt6755-uart', 'mediatek,mt6765-uart', 'mediatek,mt6779-uart', 'mediatek,mt6795-uart', 'mediatek,mt6797-uart', 'mediatek,mt7622-uart', 'mediatek,mt7623-uart', 'mediatek,mt7629-uart', 'mediatek,mt7986-uart', 'mediatek,mt8127-uart', 'mediatek,mt8135-uart', 'mediatek,mt8173-uart', 'mediatek,mt8183-uart', 'mediatek,mt8186-uart', 'mediatek,mt8192-uart', 'mediatek,mt8195-uart', 'mediatek,mt8516-uart']
	arch/arm/boot/dts/mt6592-evb.dtb

serial@11004000: compatible: ['mediatek,mt6577-uart'] is too short
	arch/arm/boot/dts/mt6592-evb.dtb

serial@11005000: compatible:0: 'mediatek,mt6577-uart' is not one of ['mediatek,mt2701-uart', 'mediatek,mt2712-uart', 'mediatek,mt6580-uart', 'mediatek,mt6582-uart', 'mediatek,mt6589-uart', 'mediatek,mt6755-uart', 'mediatek,mt6765-uart', 'mediatek,mt6779-uart', 'mediatek,mt6795-uart', 'mediatek,mt6797-uart', 'mediatek,mt7622-uart', 'mediatek,mt7623-uart', 'mediatek,mt7629-uart', 'mediatek,mt7986-uart', 'mediatek,mt8127-uart', 'mediatek,mt8135-uart', 'mediatek,mt8173-uart', 'mediatek,mt8183-uart', 'mediatek,mt8186-uart', 'mediatek,mt8192-uart', 'mediatek,mt8195-uart', 'mediatek,mt8516-uart']
	arch/arm/boot/dts/mt6592-evb.dtb

serial@11005000: compatible: ['mediatek,mt6577-uart'] is too short
	arch/arm/boot/dts/mt6592-evb.dtb

serial@11006000: compatible:0: 'mediatek,mt6577-uart' is not one of ['mediatek,mt2701-uart', 'mediatek,mt2712-uart', 'mediatek,mt6580-uart', 'mediatek,mt6582-uart', 'mediatek,mt6589-uart', 'mediatek,mt6755-uart', 'mediatek,mt6765-uart', 'mediatek,mt6779-uart', 'mediatek,mt6795-uart', 'mediatek,mt6797-uart', 'mediatek,mt7622-uart', 'mediatek,mt7623-uart', 'mediatek,mt7629-uart', 'mediatek,mt7986-uart', 'mediatek,mt8127-uart', 'mediatek,mt8135-uart', 'mediatek,mt8173-uart', 'mediatek,mt8183-uart', 'mediatek,mt8186-uart', 'mediatek,mt8192-uart', 'mediatek,mt8195-uart', 'mediatek,mt8516-uart']
	arch/arm/boot/dts/mt6589-aquaris5.dtb
	arch/arm/boot/dts/mt6589-fairphone-fp1.dtb

serial@11006000: compatible: ['mediatek,mt6577-uart'] is too short
	arch/arm/boot/dts/mt6589-aquaris5.dtb
	arch/arm/boot/dts/mt6589-fairphone-fp1.dtb

serial@11007000: compatible:0: 'mediatek,mt6577-uart' is not one of ['mediatek,mt2701-uart', 'mediatek,mt2712-uart', 'mediatek,mt6580-uart', 'mediatek,mt6582-uart', 'mediatek,mt6589-uart', 'mediatek,mt6755-uart', 'mediatek,mt6765-uart', 'mediatek,mt6779-uart', 'mediatek,mt6795-uart', 'mediatek,mt6797-uart', 'mediatek,mt7622-uart', 'mediatek,mt7623-uart', 'mediatek,mt7629-uart', 'mediatek,mt7986-uart', 'mediatek,mt8127-uart', 'mediatek,mt8135-uart', 'mediatek,mt8173-uart', 'mediatek,mt8183-uart', 'mediatek,mt8186-uart', 'mediatek,mt8192-uart', 'mediatek,mt8195-uart', 'mediatek,mt8516-uart']
	arch/arm/boot/dts/mt6589-aquaris5.dtb
	arch/arm/boot/dts/mt6589-fairphone-fp1.dtb

serial@11007000: compatible: ['mediatek,mt6577-uart'] is too short
	arch/arm/boot/dts/mt6589-aquaris5.dtb
	arch/arm/boot/dts/mt6589-fairphone-fp1.dtb

serial@11008000: compatible:0: 'mediatek,mt6577-uart' is not one of ['mediatek,mt2701-uart', 'mediatek,mt2712-uart', 'mediatek,mt6580-uart', 'mediatek,mt6582-uart', 'mediatek,mt6589-uart', 'mediatek,mt6755-uart', 'mediatek,mt6765-uart', 'mediatek,mt6779-uart', 'mediatek,mt6795-uart', 'mediatek,mt6797-uart', 'mediatek,mt7622-uart', 'mediatek,mt7623-uart', 'mediatek,mt7629-uart', 'mediatek,mt7986-uart', 'mediatek,mt8127-uart', 'mediatek,mt8135-uart', 'mediatek,mt8173-uart', 'mediatek,mt8183-uart', 'mediatek,mt8186-uart', 'mediatek,mt8192-uart', 'mediatek,mt8195-uart', 'mediatek,mt8516-uart']
	arch/arm/boot/dts/mt6589-aquaris5.dtb
	arch/arm/boot/dts/mt6589-fairphone-fp1.dtb

serial@11008000: compatible: ['mediatek,mt6577-uart'] is too short
	arch/arm/boot/dts/mt6589-aquaris5.dtb
	arch/arm/boot/dts/mt6589-fairphone-fp1.dtb

serial@11009000: compatible:0: 'mediatek,mt6577-uart' is not one of ['mediatek,mt2701-uart', 'mediatek,mt2712-uart', 'mediatek,mt6580-uart', 'mediatek,mt6582-uart', 'mediatek,mt6589-uart', 'mediatek,mt6755-uart', 'mediatek,mt6765-uart', 'mediatek,mt6779-uart', 'mediatek,mt6795-uart', 'mediatek,mt6797-uart', 'mediatek,mt7622-uart', 'mediatek,mt7623-uart', 'mediatek,mt7629-uart', 'mediatek,mt7986-uart', 'mediatek,mt8127-uart', 'mediatek,mt8135-uart', 'mediatek,mt8173-uart', 'mediatek,mt8183-uart', 'mediatek,mt8186-uart', 'mediatek,mt8192-uart', 'mediatek,mt8195-uart', 'mediatek,mt8516-uart']
	arch/arm/boot/dts/mt6589-aquaris5.dtb
	arch/arm/boot/dts/mt6589-fairphone-fp1.dtb

serial@11009000: compatible: ['mediatek,mt6577-uart'] is too short
	arch/arm/boot/dts/mt6589-aquaris5.dtb
	arch/arm/boot/dts/mt6589-fairphone-fp1.dtb


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
