Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A66C7EE23
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 20:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BFfAo9ifBuoYhXH6mSTzgnU8pbkgDeuCzxPB9AR/n9k=; b=pouJL5nLDTTIBI
	dCcqmZSp2wj1qKmhVuH2szI2LShZQfN85NJPWBuGhlckVhSARcBESQYZg2w5GJd/yrZBeUv2j8E8l
	LlIM9E7f2NU41j4Jq1bqr1hzfZ6ahvrYXIf/7YJTs92AxfRs5GstJOfb3MO6DWxsfht4E82a6kDvW
	zwit5MHsjk1tZMzfibrCUiY8oNdDcFtxbvbkSZLau9yFPovx2WmK67mgpZ1Pgcb4YHpeSsvze9JYS
	QXzq1OCLTFmZHoXGv/csk+bc2mWOeEbjOc0Aja8SoAI5btK3vtuq8qNboYFrfjjKJw5MFEcOhPHEI
	1l7hBxF0DTHCjGi9f0+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q45jN-00F4ZB-0l;
	Tue, 30 May 2023 20:14:09 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q45it-00F4JC-1k;
	Tue, 30 May 2023 20:13:40 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout2.routing.net (Postfix) with ESMTP id 8E308615DB;
	Tue, 30 May 2023 20:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1685477615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BFfAo9ifBuoYhXH6mSTzgnU8pbkgDeuCzxPB9AR/n9k=;
	b=xDavmHBlUzSpXgjrFHSaDgVB7cl4BE8IpATNpSGSlAQya7VaW7RfjZjdZwWrLbLMCkItgh
	TGN3fRYeyQdF2vaxUvFsh6P8G5Yzv4SrqQK5fD5vhagK1GMHlQDc69arQzjbLNI/1aMT3g
	L22x3g/9HrNSiu4u3YM7euUr97QBojc=
Received: from frank-G5.. (fttx-pool-217.61.157.145.bambit.de [217.61.157.145])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 7E12C4062D;
	Tue, 30 May 2023 20:13:34 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v3 4/4] arm64: dts: mt7986: add pwm-fan and cooling-maps to BPI-R3 dts
Date: Tue, 30 May 2023 22:12:35 +0200
Message-Id: <20230530201235.22330-5-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530201235.22330-1-linux@fw-web.de>
References: <20230530201235.22330-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: eb43ed84-52f3-4a28-89ff-cb5b0bbaf3e3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_131339_722651_FF699C11 
X-CRM114-Status: GOOD (  11.22  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Lars-Peter Clausen <lars@metafoo.de>, Lala Lin <lala.lin@mediatek.com>, linux-iio@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>, "Hui.Liu" <hui.liu@mediatek.com>, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Jonathan Cameron <jic23@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Daniel Golle <daniel@makrotopia.org>

Add pwm-fan and cooling-maps to BananaPi-R3 devicetree.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
this is based on Patch from openwrt. as my PWM-fan seems to need 5v pwm
signal and r3 only provides 3v3 on 3pin-socket it does not work for me.
---
 .../dts/mediatek/mt7986a-bananapi-bpi-r3.dts  | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
index 782519429497..29c018bbf29d 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
@@ -37,6 +37,15 @@ dcin: regulator-12vd {
 		regulator-always-on;
 	};
 
+	fan: pwm-fan {
+		compatible = "pwm-fan";
+		#cooling-cells = <2>;
+		/* cooling level (0, 1, 2) - pwm inverted */
+		cooling-levels = <255 96 0>;
+		pwms = <&pwm 0 10000 0>;
+		status = "okay";
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -132,6 +141,28 @@ sfp2: sfp-2 {
 	};
 };
 
+&cpu_thermal {
+	cooling-maps {
+		cpu-active-high {
+			/* active: set fan to cooling level 2 */
+			cooling-device = <&fan 2 2>;
+			trip = <&cpu_trip_active_high>;
+		};
+
+		cpu-active-low {
+			/* active: set fan to cooling level 1 */
+			cooling-device = <&fan 1 1>;
+			trip = <&cpu_trip_active_low>;
+		};
+
+		cpu-passive {
+			/* passive: set fan to cooling level 0 */
+			cooling-device = <&fan 0 0>;
+			trip = <&cpu_trip_passive>;
+		};
+	};
+};
+
 &crypto {
 	status = "okay";
 };
-- 
2.34.1


