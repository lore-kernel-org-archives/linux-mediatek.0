Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1A3C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jul 2024 03:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11m/HeUZui+l9rC09B4iar2D4HclxMkveTVuMFSiXTE=; b=zrpwNqdsapUMDQGe6oTADH9QkK
	1uy3PbCf8uMzO5ALD6avfyYMn4Q3957P0ql4E724Fnjv+ZhKlXa+yXifVboAdCCCErIpElUYgVo2k
	18j24BTFUbTCv1E2pGSG9JCm/Fecz6SaXOAnJPj0aEqFiPtikth9AfJ/FY9RUP3rqjt1uEqahfJtk
	CW/5sh5qRQjR39NAH4q9nOfyK/OeOO97Cq0P2J9bPWy6iaH0AUTI4LBE+aUptb0gx/JEw2D+fst8U
	qPM9IY0cE927ObToRujsNjQSJV0QcP8wviFqMnbNYi6TwoOmzAImNaZfOXR1DWV7iq4DzZAm95a9l
	fYUrOrig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ0I2-0000000HCis-0YEs;
	Wed, 31 Jul 2024 03:46:14 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ0GN-0000000HCCx-2xT8
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Jul 2024 03:44:33 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-2611da054fbso3423335fac.1
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jul 2024 20:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722397470; x=1723002270; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11m/HeUZui+l9rC09B4iar2D4HclxMkveTVuMFSiXTE=;
        b=iZEN6xTY6Dvax17UFGJXqFM69M1Xt21nFaURc4srHhBMKOptFLFn+S7IhxldYh+dhM
         fBcilFRv7xSf3HxRV+gmrZA1C6IcfU+uJl19FiSBzwDhJ5lMRPAlrIj0cBJcvVsDp34f
         K8SFGC1o+Ci5IsMcOVfbEujg7IacwzpMiFILA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722397470; x=1723002270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=11m/HeUZui+l9rC09B4iar2D4HclxMkveTVuMFSiXTE=;
        b=NqN018JxOV/YrwGCm9LO9abaynCvEtKmqT5st9EwA2rYwuc/p8ZuZh8sjHnRr6QQKi
         3eSf485wtk2vXcNmyq+mT9270cBmLokgp11eQwmL2qANTnheRbF3iYOFdTHoAa5Lpewy
         K0M49+Oi8FSS/wXPwWbtFi9pcuKPKaH3rSJ9kxsVxxpoDP603r2TKUGK/S0CgqI7nfMW
         KpFRui+Sgqakecx5qVxvu3NLZIZh6cNftxxjwY2Sx8wHTm2pIEJHoyxwpSIhx4/k8GTl
         MdMrJ/jUHrDKpaWzdvMBm2TqbYdGFP3HqCqV85gdX7GpR6DCr1euefJIXisQ1dssFh5a
         +0nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDB8kNcqzfJid0GjT+j4InNyhN3IBpi+UgaAc/p7RyrfFUPb130XsV8HTaIll5Bog+m77iwKqL+mDILOitz+ZcUVHdxMfglmul8kRSnhu829vF
X-Gm-Message-State: AOJu0Yxyp2JkP+qXvEIK9e2pHhH3g/AhtkAr7t+gRjuUMiL03QVGYr64
	HIhXbOqZjdfBvAHERaHYEkPjriRVf/kTsKPqd0n62O0fQKzrkwrSvPb/GuT+Dg==
X-Google-Smtp-Source: AGHT+IEy47mf3dU8J89PBwPURHRmTajXHBhlXBEf4nsrJgQUp+s+hvQeYpO0EE6KZSG0treE+Z4MAg==
X-Received: by 2002:a05:6870:2cc:b0:261:113c:1507 with SMTP id 586e51a60fabf-267d4d5b51amr15027926fac.20.1722397470604;
        Tue, 30 Jul 2024 20:44:30 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:1cfb:e012:babc:3f68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead81230bsm9093008b3a.120.2024.07.30.20.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 20:44:30 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8195: Assign USB 3.0 PHY to xhci1 by default
Date: Wed, 31 Jul 2024 11:44:10 +0800
Message-ID: <20240731034411.371178-4-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
In-Reply-To: <20240731034411.371178-1-wenst@chromium.org>
References: <20240731034411.371178-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_204431_774322_56F638B3 
X-CRM114-Status: GOOD (  15.17  )
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

xhci1 has both USB 2.0 and USB 3.0 host capabilities. By default both
are assumed to be enabled when the controller is enabled. To disable
either one, an extra property is used.

Since the default has both enabled, both PHYs should also be assigned
to the host controller. If a specific design uses only either one,
the board specific dts file can override the PHY assignment together
with adding the "mediatek,u[23]p-dis-msk" property. This keeps both
changes together.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi               | 1 +
 arch/arm64/boot/dts/mediatek/mt8195.dtsi                      | 2 +-
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts        | 2 --
 arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts | 1 +
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts         | 1 +
 5 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index d3a52acbe48a..c98fe9a39b90 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1401,6 +1401,7 @@ &xhci0 {
 &xhci1 {
 	status = "okay";
 
+	phys = <&u2port1 PHY_TYPE_USB2>;
 	rx-fifo-depth = <3072>;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	vbus-supply = <&usb_vbus>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 2ee45752583c..61b3c202a8cd 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1444,7 +1444,7 @@ xhci1: usb@11290000 {
 			      <0 0x11293e00 0 0x0100>;
 			reg-names = "mac", "ippc";
 			interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH 0>;
-			phys = <&u2port1 PHY_TYPE_USB2>;
+			phys = <&u2port1 PHY_TYPE_USB2>, <&u3port1 PHY_TYPE_USB3>;
 			assigned-clocks = <&topckgen CLK_TOP_USB_TOP_1P>,
 					  <&topckgen CLK_TOP_SSUSB_XHCI_1P>;
 			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
index a06610fff8ad..1ef6262b65c9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
@@ -904,8 +904,6 @@ &xhci0 {
 };
 
 &xhci1 {
-	phys = <&u2port1 PHY_TYPE_USB2>,
-	       <&u3port1 PHY_TYPE_USB3>;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
index e4b2af9489a8..e2e75b8ff918 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
@@ -1111,6 +1111,7 @@ &xhci0 {
 
 /* USB2.0 M.2 Key-B */
 &xhci1 {
+	phys = <&u2port1 PHY_TYPE_USB2>;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	mediatek,u3p-dis-msk = <0x01>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index 096fa999aa59..14ec970c4e49 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -894,6 +894,7 @@ &xhci0 {
 };
 
 &xhci1 {
+	phys = <&u2port1 PHY_TYPE_USB2>;
 	/* MT7921's USB Bluetooth has issues with USB2 LPM */
 	usb2-lpm-disable;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
-- 
2.46.0.rc1.232.g9752f9e123-goog


