Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EB7C77B7E
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 20:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NiNTNWADcq8Wf9sTDfcLcaA78qUAbBkS8piCK+YIth4=; b=Yo8Ic7xdf7LbZE
	8qR0VDAcKqdJ4gGBGxVLTWj8A1UW3bcytYHGTzNSfIxL3vVUmTbJAArshV84t39e1DxkA+lTsShRY
	k7JwbFvWXKLdB7kSRT0szXhZPglwfW9i+CamnZW3SoMsmGsbkdeQfdwOdfQUKABCN7YoJ2tQbq/zu
	05qKOBGZGi8ZwVRI+xwIFnkcut74kjZsd+h/53UMTeMJkffikPY/bnT2RwEH5c+mypt6QTkSE7EO4
	iTz08SKKRXGBHg1KBrJAg9p4NB7SxFZxr3Ykr2w5jKG9lIC7GyLCIXqPRFtS5MqzjFvd2u5/+zAIs
	eLauwPndO0ia/DzB5viw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3jio-00BfAf-1w;
	Mon, 29 May 2023 20:44:06 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3jiR-00Bexe-0U;
	Mon, 29 May 2023 20:43:46 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout1.routing.net (Postfix) with ESMTP id 695513FC7F;
	Mon, 29 May 2023 20:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1685393015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NiNTNWADcq8Wf9sTDfcLcaA78qUAbBkS8piCK+YIth4=;
	b=X7uCk1A5RWowtoLg5C28QXGgBuPhnlgquA0AlaMFd43ibD+ZUiiExwvswPC2MKv8xwn93/
	lYdNhnN/6uXhuWKKJ1g57S9tFrJvZcprKeOWolnq3tU34kfnUUp1wV3Es+/nhVbwQv8nsJ
	lqZPUaqmWk5su9LXSJu66RUD+Zv4PZg=
Received: from frank-G5.. (fttx-pool-217.61.156.2.bambit.de [217.61.156.2])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 4483E1006D1;
	Mon, 29 May 2023 20:43:34 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 4/4] arm64: dts: mt7986: add pwm-fan and cooling-maps to BPI-R3 dts
Date: Mon, 29 May 2023 22:42:58 +0200
Message-Id: <20230529204258.65238-5-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230529204258.65238-1-linux@fw-web.de>
References: <20230529204258.65238-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: b1d02627-873f-44dd-a92e-df7ed1a9bf87
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_134343_357032_2AEEB859 
X-CRM114-Status: GOOD (  11.31  )
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


