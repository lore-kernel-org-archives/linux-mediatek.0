Return-Path: <SRS0=eBCQ=PV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE52CC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 14:43:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A73DF610FC
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 14:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A73DF610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YJOflWiloUUPpdH+1AS8mBS+th7jK9Vvz82hoY9CBzI=; b=nfmi2D3f92oJyw
	A1CibEElirY6dBUdoQ9eX64KrkTEDtA9KoIVEf9hWPv+0zMB6FipI5RJlpZ3vKkBtxLbfschK8Yp4
	l8EZKdMNDxx2DmrsH/kTmvehLWAd/UOIYndZ8HREpqBw6wQIXL0BADGSiqdgr6IJ5FFtYJBupmz7j
	Vd8l+7ZuIQSxe6vpCSv+EA8UOypOTSr29w0HDGpQO8QtO5GLQSDXGxI8oCyrHFKecFB9+91OaN8MR
	Ecyvg57gWQ4Xv1Y4GgIp/gTBlhvDQw8yw5QPTq48t7AdgjFXEJDVsS0g+p8m6oortF98fRgHw7Sas
	L7b/V1mktjlJZAKPnXTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhv06-001y5a-C2; Tue, 02 Nov 2021 14:42:58 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhuzj-001y1J-V6; Tue, 02 Nov 2021 14:42:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 733121F44C5E
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: matthias.bgg@gmail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8173-elm: Add backlight enable
 pin config
Date: Tue,  2 Nov 2021 15:42:24 +0100
Message-Id: <20211102144224.457446-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102144224.457446-1-angelogioacchino.delregno@collabora.com>
References: <20211102144224.457446-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_074236_150743_EDB5B043 
X-CRM114-Status: UNSURE (   9.00  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the proper pinctrl for GPIO95 backlight enable pin and assign it
to the pwm-backlight node.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index f292ca459a9a..9c75fbb31f98 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -27,6 +27,8 @@ backlight: backlight {
 		power-supply = <&bl_fixed_reg>;
 		enable-gpios = <&pio 95 GPIO_ACTIVE_HIGH>;
 
+		pinctrl-names = "default";
+		pinctrl-0 = <&panel_backlight_en_pins>;
 		status = "okay";
 	};
 
@@ -825,6 +827,12 @@ pins_clk {
 		};
 	};
 
+	panel_backlight_en_pins: panel_backlight_en_pins {
+		pins1 {
+			pinmux = <MT8173_PIN_95_PCM_TX__FUNC_GPIO95>;
+		};
+	};
+
 	panel_fixed_pins: panel_fixed_pins {
 		pins1 {
 			pinmux = <MT8173_PIN_41_CMMCLK__FUNC_GPIO41>;
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
