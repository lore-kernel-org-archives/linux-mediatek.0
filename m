Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C24EC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 12:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hFvOeZEdHEMwtC/89lvlNziodnm+dMJ6XRxDhXU68Bw=; b=21g/hg5acwwWhj
	Y78wugjyh1f4WX/u5/Fj994n682ZsIgO7rntnEYeTR8/76uaTj+tp/jTnt0qzI4iO1HUY4j6U3yFY
	3DNOpD/MAV2RmAHD6fAAR6CI57FnKAyhXLRBltVTmcT3P2JcHYZab8mno2q3Nntl1UqDM6Ab2VED6
	nrlMvwOKKHriAkIQRHve2jllKnB9cYXVsQjf5ch0zZa192ckZWivmQw0PVEVNDYFBC32ohGcJ7OYG
	/e8KiDL+O0kIHLphFnVsfcrngjrxzLka9s3NzA8q5jVv+JvLh5FXivEqpWWNcpUh+Az97KD3N3UWB
	THzewaVT2lo/qUYeQjqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt7Iv-004D5y-MX; Mon, 23 May 2022 12:36:57 +0000
Received: from mail-oa1-f52.google.com ([209.85.160.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt7Fj-004BDN-Hr; Mon, 23 May 2022 12:33:41 +0000
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-f17f1acffeso18232006fac.4; 
 Mon, 23 May 2022 05:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=X6MWkN+MXwESjJ8VLjim2DGGoViFUAGh9+IlVSr0qvY=;
 b=12UsGWVPv4GX4i9rra3IDreh8Lj+JOePumfvWD3z77ckIcUfVURC8aOk0iDx/POgeg
 QgdSKWSDfJV5ywnfDaGx2nMZrHNIyXh76FkO1BWEhEjepKMTCkdQQImePOtIWPxzP20v
 G1XEQDn4g115g8uUYMLmo3hwoyT7NcwXYkHppRyg+3PQzEc0x1DzOQT+n08vm4Pu2UOA
 BsRrBuGyYHWrlqHux+Ie2U3LdovrMrCeruKweqRnGYhwc5NX/Y+3XHEb2bbpGNwSZ3lE
 wiWMPT5zGpksQPbRgMGO+kHHVTmcKKHMD58eQ/mjP7pjqm0Z6+HSe2wlXUNx0V3NyDkd
 D3jg==
X-Gm-Message-State: AOAM5330h4nuDhIvQT/XPq1UAnJaWwBMPhbayDKvcXqPq2wBOWWUjjur
 NCAFKmCViM4KMy9StTIGxQ==
X-Google-Smtp-Source: ABdhPJwOO+O7zT8r+lLhmyii8LgBtwlqTtnM90LxBsJkZOoKNqifzuh0NKNv8CMKNI9UWvO60BSKmA==
X-Received: by 2002:a05:6870:d581:b0:f1:82de:958c with SMTP id
 u1-20020a056870d58100b000f182de958cmr12298708oao.27.1653309214834; 
 Mon, 23 May 2022 05:33:34 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 z1-20020a9d7a41000000b0060603221264sm3898554otm.52.2022.05.23.05.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 05:33:34 -0700 (PDT)
Received: (nullmailer pid 1378078 invoked by uid 1000);
 Mon, 23 May 2022 12:33:31 -0000
From: Rob Herring <robh@kernel.org>
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Jitao shi <jitao.shi@mediatek.com>,
 linux-mediatek@lists.infradead.org, CK Hu <ck.hu@mediatek.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Helge Deller <deller@gmx.de>, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-phy@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20220523104758.29531-2-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
 <20220523104758.29531-2-granquet@baylibre.com>
Subject: Re: [PATCH v10 01/21] dt-bindings: mediatek,
 dpi: Add DPINTF compatible
Date: Mon, 23 May 2022 07:33:31 -0500
Message-Id: <1653309211.141261.1378077.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_053339_636242_F460C83B 
X-CRM114-Status: GOOD (  14.60  )
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

On Mon, 23 May 2022 12:47:34 +0200, Guillaume Ranquet wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> DPINTF is similar to DPI but does not have the exact same feature set
> or register layouts.
> 
> DPINTF is the sink of the display pipeline that is connected to the
> DisplayPort controller and encoder unit. It takes the same clocks as
> DPI.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  .../bindings/display/mediatek/mediatek,dpi.yaml     | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


dpi@14014000: Additional properties are not allowed ('ports' was unexpected)
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb
	arch/arm/boot/dts/mt7623n-rfb-emmc.dtb

dpi@14014000: clock-names: ['pixel', 'engine', 'pll'] is too short
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb
	arch/arm/boot/dts/mt7623n-rfb-emmc.dtb

dpi@14014000: clocks: [[59, 26], [59, 27], [3, 6]] is too short
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb

dpi@14014000: clocks: [[61, 26], [61, 27], [3, 6]] is too short
	arch/arm/boot/dts/mt7623n-rfb-emmc.dtb

dpi@14014000: compatible: ['mediatek,mt7623-dpi', 'mediatek,mt2701-dpi'] is too long
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb
	arch/arm/boot/dts/mt7623n-rfb-emmc.dtb

dpi@14014000: 'port' is a required property
	arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb
	arch/arm/boot/dts/mt7623n-rfb-emmc.dtb

dpi@1401d000: Additional properties are not allowed ('power-domains' was unexpected)
	arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb
	arch/arm64/boot/dts/mediatek/mt8173-evb.dtb

dpi@1401d000: clock-names: ['pixel', 'engine', 'pll'] is too short
	arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb
	arch/arm64/boot/dts/mediatek/mt8173-evb.dtb

dpi@1401d000: clocks: [[57, 40], [57, 41], [8, 8]] is too short
	arch/arm64/boot/dts/mediatek/mt8173-evb.dtb

dpi@1401d000: clocks: [[68, 40], [68, 41], [8, 8]] is too short
	arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb
	arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
