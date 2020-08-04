Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F151EC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 15:29:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C94BC2086A
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 15:29:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3NsdS24T";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="g0VZY3Es"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C94BC2086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qEqx74SN1mU/x9mzwjIg0oXQvQY202W12ElZHba6Wpc=; b=3NsdS24TdHiCurnoLk1LttLN8
	jqcI2LVullNNwSFxp9xRIWSsKACC0+1g5AqY8AtStEj4TSVPxA4qIHAgmNOB47b0pC8SF1O8iId5L
	gcpbXmxbLBkkq36lqiSj8uBocOVu5UtG4j/8+bNhCWumNpfdCguuowHQMuAouqscknlvBSkGUji1S
	DT6Gg0M9l4QnrclHUYdDLd++nbM6Z6hX8G+YFXozkdVat75V6fpg2bDCD+V6pnKzP5TTWH7KPF7g6
	BW13JwENJ6ZP9RtLiYohaRHX4Kg+819E+SUJpaermStn06khyvz/c0e7qVyMd0Vyx907NQ2yNImqd
	JgrGK3npg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2ysW-00072v-II; Tue, 04 Aug 2020 15:29:24 +0000
Received: from mout.gmx.net ([212.227.17.22])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2ysU-000721-K4; Tue, 04 Aug 2020 15:29:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1596554960;
 bh=sjy/7cbvWFDMn93C7JAJB2eqqf8LM8odrGp9n3IbZGk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=g0VZY3EsUZEZyNRyV/ulMnGJDWB2MxMuMPQ7wog4KXLutTw5sv2NBfx3c+plIz7Cs
 NtF7kZ6JBjrHMFC4p5247YkSR909c95sy118DGFAwtT5ElevfN3V8BYZRkOJ41mfG3
 yvZ5DnKlN+5S549M7jUmuebBs4hE3QnJG1ILhEOo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.144.119] ([217.61.144.119]) by web-mail.gmx.net
 (3c-app-gmx-bap28.server.lan [172.19.172.98]) (via HTTP); Tue, 4 Aug 2020
 17:22:25 +0200
MIME-Version: 1.0
Message-ID: <trinity-e5fb1e73-2aa9-4dd2-a115-3ef216a6336e-1596554545050@3c-app-gmx-bap28>
From: Frank Wunderlich <frank-w@public-files.de>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Aw: Re: [PATCH v3 5/5] arm: dts: mt7623: add display subsystem
 related device nodes
Date: Tue, 4 Aug 2020 17:22:25 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <CAAOTY_9aDqz3muo6ynqX9r0VjW7tD5vvZOiQyR8UZOTUct8oVA@mail.gmail.com>
References: <20200804105849.70876-1-linux@fw-web.de>
 <20200804105849.70876-6-linux@fw-web.de>
 <CAAOTY_9aDqz3muo6ynqX9r0VjW7tD5vvZOiQyR8UZOTUct8oVA@mail.gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:7BhFM7ZWcvyKxzn6X4OC4HJ8PW9UUMcnuJQtOpn6fq0ut1vX7rAoKcI91P7RKJEfeCOqY
 I7ot1zQTlWvDkGkrGRSwc/lkJY+S4g36GnrQ5NxM/dnbOI8JKOzLX4hTuObrTliv53GWrt2CH808
 EB+hekE8X9q28nNguT6jIHaJrES3w4QS0pDwZOrkCZ2OW/g+CjeHYytnnCQu5LXkTmsN04KJPo0Y
 e+L5vmaIR6gKZMLOS2YdrJArq4nbjh33LgekvMS14m097X6q2beSmbCZ88D3fUNUe5HurO/Ctvje
 Sc=
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZyjfoH+Qh8c=:QXB9MmyBRvV+uRuYRWpn3q
 hxqgY2sTw/WNFqn57xV5lrwmZr7pToGgYPU+jhx4Nx/erJcrXln2UIG1gjmMzHCoa80qpJCFv
 4iSBEJdPLJlEwtfVaTwznDbYNc0J1SW5f7Fl/ixf6VhtEh6ARvbxMdI848pFD+BvNiSX2RpbX
 WrfoI2xfJVpDurejmOjOlTQ3cK3vjAdvOlk6bcG6me1ruaIPLAOfTi7scGwwoD2UUKzZq27S9
 dYuuP4/NPdZyleOupOSqTFavMnGhFJ7e3aFrKo7+paBj0W/PpEpWYkF8H2dKQeNDTo1we6NCe
 D7VsPTKDEJXUCTk8MFmvSU3vL4pfDbzeugqHMm4hir5d0wG/nR+WnKNFvAXb7bTsJTyx41sYc
 FUHDCBZbUBqhdydlq9zrHLerhR92CxAz4EUQMHWhR6A4j9rZoDs6IzwhqKf3knLomPwt5Qhuk
 zLPiQaNyrfOOT2MO5IQMF9LyNleQzSeKUp5v862kgBssrlrNdgoarqAJr9Rkh5J7bkalSNSWV
 Y6B2ZVaby7uUCWNwHQ8pQy01hlfIxFuH87Wstx+Aj8n01bvM03yVZHc13QZZPXoys8vVEAzRP
 1R7ylyj6RNSCmi9AjDV7JRTg3CoCDMIPmiC/IImjTbbqcRYVuw924Z9ED+bQ2xQQexOBJGe/m
 8uamtuYqJLWcct6LGAq30LcG9ozCqwqR40GTWxxDM0dkxQHRySoLdxucJw4KZnY020B8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_112922_886339_6DE33F8B 
X-CRM114-Status: GOOD (  15.36  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, chunhui dai <chunhui.dai@mediatek.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Frank Wunderlich <linux@fw-web.de>, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi

Except mmsys (i added in Patch #1) all mt7623-compatibles are not defined in code and fallback (mt2701-x/mt8173-x) is used. If i add it in dt-binding, it should be added in code too, right? or should i remove mt7623 compatibles and only add documentation for new mmsys?

regards Frank


> Gesendet: Dienstag, 04. August 2020 um 17:00 Uhr
> Von: "Chun-Kuang Hu" <chunkuang.hu@kernel.org>
> An: "Frank Wunderlich" <linux@fw-web.de>
> > +       mipi_tx0: mipi-dphy@10010000 {
> > +               compatible = "mediatek,mt7623-mipi-tx",
>
> In mediatek,dsi.txt [1], "mediatek,mt7623-mipi-tx" is undefined.
>
> [1] https://www.kernel.org/doc/Documentation/devicetree/bindings/display/mediatek/mediatek%2Cdsi.txt

in drivers/gpu/drm/mediatek/mtk_mipi_tx.c only the compatible for mt2701 is defined (which is fallback in dts). So should i remove mt7623 compatible here and in the other occurences?

>
> > +                            "mediatek,mt2701-mipi-tx";

> > +
> > +       cec: cec@10012000 {
> > +               compatible = "mediatek,mt7623-cec",
>
> Please explicitly define "mediatek,mt7623-cec" in mediatek,hdmi.txt [2].
>
> [2] https://www.kernel.org/doc/Documentation/devicetree/bindings/display/mediatek/mediatek%2Chdmi.txt
>
> > +                            "mediatek,mt8173-cec";

same here...only mt8173-cec is defined in drivers/gpu/drm/mediatek/mtk_cec.c

> >         cir: cir@10013000 {
> >                 compatible = "mediatek,mt7623-cir";
> >                 reg = <0 0x10013000 0 0x1000>;
> > @@ -369,6 +393,18 @@ apmixedsys: syscon@10209000 {
> >                 #clock-cells = <1>;
> >         };
> >
> > +       hdmi_phy: phy@10209100 {
> > +               compatible = "mediatek,mt7623-hdmi-phy",
>
> Ditto.
>
> > +                            "mediatek,mt2701-hdmi-phy";
same as above (./drivers/gpu/drm/mediatek/mtk_hdmi_phy.c)

> > +       hdmiddc0: i2c@11013000 {
> > +               compatible = "mediatek,mt7623-hdmi-ddc",
>
> Ditto.
>
> > +                            "mediatek,mt8173-hdmi-ddc";
> > +               interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_LOW>;
> > +               reg = <0 0x11013000 0 0x1C>;
> > +               clocks = <&pericfg CLK_PERI_I2C3>;
> > +               clock-names = "ddc-i2c";
> > +               status = "disabled";
> > +       };
> > +
> >         nor_flash: spi@11014000 {
> >                 compatible = "mediatek,mt7623-nor",
> >                              "mediatek,mt8173-nor";
> > @@ -766,6 +812,84 @@ mmsys: syscon@14000000 {
> >                 #clock-cells = <1>;
> >         };
> >
> > +       display_components: dispsys@14000000 {
> > +               compatible = "mediatek,mt7623-mmsys",
> > +                            "mediatek,mt2701-mmsys";
>
> In mediatek,mmsys.txt [3], this should be:
>
> mmsys: syscon@14000000 {
>         compatible = "mediatek,mt7623-mmsys", "mediatek,mt2701-mmsys", "syscon"
>
> [3] https://www.kernel.org/doc/Documentation/devicetree/bindings/arm/mediatek/mediatek%2Cmmsys.txt

as i added this in driver, i add this to documentation (and maybe remove the fallback because it results in wrong routing?)

>
> > +               reg = <0 0x14000000 0 0x1000>;
> > +               power-domains = <&scpsys MT2701_POWER_DOMAIN_DISP>;
> > +       };
> > +
> > +       ovl@14007000 {
> > +               compatible = "mediatek,mt7623-disp-ovl",
>
> This is not defined in mediatek,disp.txt [4].
>
> [4] https://www.kernel.org/doc/Documentation/devicetree/bindings/display/mediatek/mediatek%2Cdisp.txt
also not defined in drivers/gpu/drm/mediatek/mtk_drm_drv.c so again fallback used

>
> > +                            "mediatek,mt2701-disp-ovl";

> > +               reg = <0 0x14007000 0 0x1000>;
> > +               interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_LOW>;
> > +               clocks = <&mmsys CLK_MM_DISP_OVL>;
> > +               iommus = <&iommu MT2701_M4U_PORT_DISP_OVL_0>;
> > +               mediatek,larb = <&larb0>;
> > +       };
> > +
> > +       rdma0: rdma@14008000 {
> > +               compatible = "mediatek,mt7623-disp-rdma",
> > +                            "mediatek,mt2701-disp-rdma";
> > +               reg = <0 0x14008000 0 0x1000>;
> > +               interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_LOW>;
> > +               clocks = <&mmsys CLK_MM_DISP_RDMA>;
> > +               iommus = <&iommu MT2701_M4U_PORT_DISP_RDMA>;
> > +               mediatek,larb = <&larb0>;
> > +       };
> > +
> > +       wdma@14009000 {
> > +               compatible = "mediatek,mt7623-disp-wdma",
> > +                            "mediatek,mt2701-disp-wdma";
> > +               reg = <0 0x14009000 0 0x1000>;
> > +               interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_LOW>;
> > +               clocks = <&mmsys CLK_MM_DISP_WDMA>;
> > +               iommus = <&iommu MT2701_M4U_PORT_DISP_WDMA>;
> > +               mediatek,larb = <&larb0>;
> > +       };
> > +
> > +       bls: pwm@1400a000 {
> > +               compatible = "mediatek,mt7623-disp-pwm",
> > +                            "mediatek,mt2701-disp-pwm";
> > +               reg = <0 0x1400a000 0 0x1000>;
> > +               #pwm-cells = <2>;
> > +               clocks = <&mmsys CLK_MM_MDP_BLS_26M>,
> > +                        <&mmsys CLK_MM_DISP_BLS>;
> > +               clock-names = "main", "mm";
> > +               status = "disabled";
> > +       };
> > +
> > +       color@1400b000 {
> > +               compatible = "mediatek,mt7623-disp-color",
> > +                            "mediatek,mt2701-disp-color";
> > +               reg = <0 0x1400b000 0 0x1000>;
> > +               interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_LOW>;
> > +               clocks = <&mmsys CLK_MM_DISP_COLOR>;
> > +       };
> > +
> > +       dsi: dsi@1400c000 {
> > +               compatible = "mediatek,mt7623-dsi",
>
> This is not defined in mediatek,dsi.txt [1].
>
> > +                            "mediatek,mt2701-dsi";
also fallback used (drivers/gpu/drm/mediatek/mtk_drm_drv.c)


> > +       dpi0: dpi@14014000 {
> > +               compatible = "mediatek,mt7623-dpi",
>
> This is not defined in mediatek,dpi.txt [5].
>
> [5] https://www.kernel.org/doc/Documentation/devicetree/bindings/display/mediatek/mediatek%2Cdpi.txt
>
> > +                            "mediatek,mt2701-dpi";


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
