Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63348C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 17:24:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EC31206D4
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 17:24:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="klWk6PfP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="XHBgbIiX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EC31206D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cxI0gvNnnHmJrqDL8DgKvrCLCwI5lIiSfacALb9pWIs=; b=klWk6PfPutaN0Gx8YZJHDAJ3H
	LMgrL1HvuCxukHR4vZtUqPBYyXmv9YRG/VNc6GiT7zwUdtBtuYnOu19DEa6FY6nsSaLNEvbAAQgYT
	+T0nI/7xGo3GCeSjtyON9WNPu26wCFydTP9v57CDChtxQVFnvJLcHz5PMmPVYsJ3+G6oCMTGI3ae+
	p2Tbzz+dfilEs7uSxbPQYayb7SLSfAYlXjoGkHvuI7rzjwj/I98Tac3G0wpl9IfHGbPecRRCm9NKK
	PJWUfIs/ehUaCQpo3fx7/B3EcrZmxv3fM4JNfMcKIZ/u2Mj4vp5vWiDJvDPmNEh4b/100w4hZ9J1f
	cSkfIDIpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k30fq-0001HD-LP; Tue, 04 Aug 2020 17:24:26 +0000
Received: from mout.gmx.net ([212.227.17.20])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k30fm-0001G2-Hq; Tue, 04 Aug 2020 17:24:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1596561861;
 bh=PfvJzRfka1xHALav28arWCZDate4GnXBbihee0+KhaM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=XHBgbIiXyUIFa1+nWNbGsOtUG2ML5RSd2HWkJTL3vavXzkKwXgzu1O5pAphUs8G/2
 QfLOmQ3r/Tki+X2LLFanEsguo8PUhjw8sZCgZgY5QCDe5/e0U5E4qP6Ucf7WdmZRpU
 DHXGineSSyueNIaUISqKR3yIevJ/5RGezpWm36zo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.144.119] ([217.61.144.119]) by web-mail.gmx.net
 (3c-app-gmx-bap28.server.lan [172.19.172.98]) (via HTTP); Tue, 4 Aug 2020
 19:18:48 +0200
MIME-Version: 1.0
Message-ID: <trinity-aa434d4a-b151-4595-93cc-a222bf12522d-1596561528040@3c-app-gmx-bap28>
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Aw: [PATCH v4 1/6] dt-bindings: mediatek: add mt7623 display-nodes
Date: Tue, 4 Aug 2020 19:18:48 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20200804165555.75159-2-linux@fw-web.de>
References: <20200804165555.75159-1-linux@fw-web.de>
 <20200804165555.75159-2-linux@fw-web.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:eCpOYYm91ycQQu1zE0e+aOPm1QDKgTJTaCDXAvupGT9O7b7zVueJh3Y7K+mn6AlKnxs2w
 fAJIySZyPMQMY1/Ca53+ViEmZwvy0/33JZgAdrdny3mU/HpI4uZ2AM2LMUMFh/TYQpEIHkUG6EI+
 aPetOKusURCqBbYXH4LzuQQl4BIO18tkt0UKlFiuhjkV5DemiPW9yT7mvCV1mpwdjz15r4ySI8bP
 Y0m/eB5qyaBQBLbgcjtt0k+PlxOvAFiyd2tOjl7se3+7q/fcAd8hLSq6+oqRGY4P5eWUlnO0Fm1I
 fs=
X-UI-Out-Filterresults: notjunk:1;V03:K0:13sm+glzaME=:2OHPw0jDk8DzlH9Gk3LkyJ
 NHuJhu9o4o7QsuF/KpZ3dPsFE7AfPFJCatsAWBRlsSaq4qhwaWmoyoyVmzUTWTJxrdfuo4WP7
 OmMkRPI3+2Huc2WGgzVslrHolLd4dqvDb2NA4h+vq8oDI7OGEbgIVzpFFYOY8io8M/NY9Mq7D
 jaDKZfGFQKtkZ8upJJs0ln+KtkiPMXdqhmFn3llPRsanPXnYIBAhaJaAGwFCiI6wFh6V1psm/
 HEq/DtJYyUUcpvs4oG/VjRRmUFIqZy9RLzMeHbcGEROSPZtEJOz4eIUTZJXUnHaWxGZtj7kF4
 uzA+hTq/6uSkH11PM9lOE7PYxMnCXr1wzP+V/KUGROyohjSuFKjeY+RcIhvFSMx9qp/ahO7yt
 vI3YVoB2kutJRErnaSgrOp1/0anNlIIU5Ls6W4L4wJg7tQdG93tfB20IsPmx3Rb1vOs574nRY
 BDI6/PABcvHQXnG9saOi4n1BdzEp9kj5mIOcSLqCexD2OqTt1LV1zVN2xE71d1htRbyK+gdxS
 dUs6DTfIyBsvdD3oeXnDXZ7MeOhfKjCnDjY/3eDURdQDEYTIZrTOXlpNtJOYGBEco/Xa5tqhh
 JN+ZYAmK2xei1KaMuBFdSUfMtMiEITXkgZGQVV/qzVbAzK9sNXFjHbimoXBBjj7tWT7C4Vd7W
 q29LtTDDONztdY9+17G42EHGeTdpaKc8qNDbtYIRFD3VfZBdAuYWdRWuXhxu5cKguBTE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_132422_820522_C68BCE8E 
X-CRM114-Status: GOOD (  18.31  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CC Rob Herring and devicetree-list

> Gesendet: Dienstag, 04. August 2020 um 18:55 Uhr
> Von: "Frank Wunderlich" <linux@fw-web.de>
> An: linux-mediatek@lists.infradead.org
> Cc: "Frank Wunderlich" <frank-w@public-files.de>, "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>, "David Airlie" <airlied@linux.ie>, "Daniel Vetter" <daniel@ffwll.ch>, "Matthias Brugger" <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
> Betreff: [PATCH v4 1/6] dt-bindings: mediatek: add mt7623 display-nodes
>
> From: Frank Wunderlich <frank-w@public-files.de>
>
> mt7623 uses mt2701/mt8173 for drm, but have own compatibles
>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,disp.txt    | 2 +-
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.txt     | 2 +-
>  .../devicetree/bindings/display/mediatek/mediatek,dsi.txt     | 4 ++--
>  .../devicetree/bindings/display/mediatek/mediatek,hdmi.txt    | 4 ++++
>  4 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> index b91e709db7a4..121220745d46 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> @@ -43,7 +43,7 @@ Required properties (all function blocks):
>  	"mediatek,<chip>-dpi"        		- DPI controller, see mediatek,dpi.txt
>  	"mediatek,<chip>-disp-mutex" 		- display mutex
>  	"mediatek,<chip>-disp-od"    		- overdrive
> -  the supported chips are mt2701, mt2712 and mt8173.
> +  the supported chips are mt2701, mt7623, mt2712 and mt8173.
>  - reg: Physical base address and length of the function block register space
>  - interrupts: The interrupt signal from the function block (required, except for
>    merge and split function blocks).
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> index 77def4456706..dc1ebd13cc88 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> @@ -7,7 +7,7 @@ output bus.
>
>  Required properties:
>  - compatible: "mediatek,<chip>-dpi"
> -  the supported chips are mt2701 , mt8173 and mt8183.
> +  the supported chips are mt2701, mt7623, mt8173 and mt8183.
>  - reg: Physical base address and length of the controller's registers
>  - interrupts: The interrupt signal from the function block.
>  - clocks: device clocks
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> index 8e4729de8c85..f06f24d405a5 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> @@ -7,7 +7,7 @@ channel output.
>
>  Required properties:
>  - compatible: "mediatek,<chip>-dsi"
> -  the supported chips are mt2701, mt8173 and mt8183.
> +- the supported chips are mt2701, mt7623, mt8173 and mt8183.
>  - reg: Physical base address and length of the controller's registers
>  - interrupts: The interrupt signal from the function block.
>  - clocks: device clocks
> @@ -26,7 +26,7 @@ The MIPI TX configuration module controls the MIPI D-PHY.
>
>  Required properties:
>  - compatible: "mediatek,<chip>-mipi-tx"
> -  the supported chips are mt2701, mt8173 and mt8183.
> +- the supported chips are mt2701, 7623, mt8173 and mt8183.
>  - reg: Physical base address and length of the controller's registers
>  - clocks: PLL reference clock
>  - clock-output-names: name of the output clock line to the DSI encoder
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
> index 7b124242b0c5..6b1c586403e4 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
> @@ -6,6 +6,7 @@ its parallel input.
>
>  Required properties:
>  - compatible: Should be "mediatek,<chip>-hdmi".
> +- the supported chips are mt2701, mt7623 and mt8173
>  - reg: Physical base address and length of the controller's registers
>  - interrupts: The interrupt signal from the function block.
>  - clocks: device clocks
> @@ -32,6 +33,7 @@ The HDMI CEC controller handles hotplug detection and CEC communication.
>
>  Required properties:
>  - compatible: Should be "mediatek,<chip>-cec"
> +- the supported chips are mt7623 and mt8173
>  - reg: Physical base address and length of the controller's registers
>  - interrupts: The interrupt signal from the function block.
>  - clocks: device clock
> @@ -44,6 +46,7 @@ The Mediatek's I2C controller is used to interface with I2C devices.
>
>  Required properties:
>  - compatible: Should be "mediatek,<chip>-hdmi-ddc"
> +- the supported chips are mt7623 and mt8173
>  - reg: Physical base address and length of the controller's registers
>  - clocks: device clock
>  - clock-names: Should be "ddc-i2c".
> @@ -56,6 +59,7 @@ output and drives the HDMI pads.
>
>  Required properties:
>  - compatible: "mediatek,<chip>-hdmi-phy"
> +- the supported chips are mt2701, mt7623 and mt8173
>  - reg: Physical base address and length of the module's registers
>  - clocks: PLL reference clock
>  - clock-names: must contain "pll_ref"
> --
> 2.25.1
>
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
