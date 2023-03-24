Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13160C76195
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 17:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yHxr1lWW4/hZtKoDo+ymZ6Halxk36is2h5OEVuaDMrE=; b=SkdIlvpGQWCnckyZ+Zq9+HB4EV
	AMwC4FMmb8uJmHgBoCJaeh8U9dkCmcEvbAIxkTcuoUzCdDLEaTVDFp+x4J0s3uxsfiEkpwvkOxhoS
	EGc4cZ3eWivAQGK1GRlzS2RTPHdcBcpP64183/dhCCzYDajwCx9uGNYxmaXl8RYmjLHsmCBRbVLyq
	WOS1UqDqK9SnCqwBzFMrNJxOtS/R1aOLj3xPmjFZ4XlrIBefH3giBJ92tm2o8SvWbDMhHAYWOBl4o
	g6wObAz0P0rif25try7XOWuLwu8QqBaq9J3sPnAwo2BBIwzbZ4726ktar9FRjmttiaANgCAL3UzYc
	147qyopQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pflex-005BdA-0s;
	Fri, 24 Mar 2023 17:57:03 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfldD-005ANY-1Q;
	Fri, 24 Mar 2023 17:55:17 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 575636603141;
	Fri, 24 Mar 2023 17:55:13 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679680514;
	bh=M2x6XrfKatUDNCzi+SX1mFtgO/Okir8+l/Hd5u8MM30=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q5Qwgsjg8AYINobxCuKGoobK7lgFqgVaO38HO0RpzrQMMGsCSJU7V2uWZ+hmnUD1J
	 FDZFWN+8QZG/wU5QpuUNJ6avrHh/he9KPWRk/hwSfCw0PrhIku7xz0MrpvUpJhrW4/
	 5hfgekhpTF4rJUgtOwoM8dqYJHZzUxgcEXeVTRIhDBYmOohJeQe9fsFjCIz0oOBQzZ
	 ZvBSJ+1OaLfU2LdHFUcIvaxOuD0RSjfKarwpNG4AAzYaEyz6+9DwRNURVCrQB3d3Uf
	 jhWviIH9vyMFyyYRrpPJ4hvX5Rvzx8SiUdH0B7Ab0znN70mBztpP+9gcy4XVqcGoXW
	 Ti5hpG/O9fw1g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: qii.wang@mediatek.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	jassisinghbrar@gmail.com,
	houlong.wei@mediatek.com,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v1 15/18] arm64: dts: mediatek: mt6795-xperia-m5: Add Bosch BMA255 Accelerometer
Date: Fri, 24 Mar 2023 18:54:53 +0100
Message-Id: <20230324175456.219954-16-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
References: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_105515_642120_83646A02 
X-CRM114-Status: UNSURE (   7.56  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the BMA255 Accelerometer on I2C3 and its pin definitions.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/mt6795-sony-xperia-m5.dts   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
index edab90f06a24..54a1f7f306f7 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
@@ -99,6 +99,13 @@ &i2c3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c3_pins>;
 	status = "okay";
+
+	accelerometer@0x10 {
+		compatible = "bosch,bma255";
+		reg = <0x10>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&accel_pins>;
+	};
 };
 
 &pio {
@@ -115,6 +122,14 @@ pins-rst {
 		};
 	};
 
+	accel_pins: accelerometer-pins {
+		pins-irq {
+			pinmux = <PINMUX_GPIO12__FUNC_GPIO12>;
+			bias-pull-up;
+			input-enable;
+		};
+	};
+
 	i2c0_pins: i2c0-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO45__FUNC_SDA0>,
-- 
2.40.0


