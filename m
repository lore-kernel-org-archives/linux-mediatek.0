Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 818E4EB64DC
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 09:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4j39ue0qWkoQXKChqLhlwL+JOaigzxBG0E2V7p0YIYo=; b=ltryaWmVpKg7US4ctDKFgUo+PG
	hkUyxXgZ9THywchAWLwPJ33TVAkA8oII2W2seIDfRxLIQbPcKdim1AiRLnELp66Pc3aLrtsK1HaPh
	WJGJV/qIUIQFcxN4V75X97FUQxaj3PaCBgBU/Ih5KBBQudrz2MDRPwd+8OFBj4NfaQ7OvnPCVMpSI
	Fx/wItOwczkvng7SQ71s5yHWSXzZ8o+x3yGmOVf4K3ANnOUTNunxc/SVDxc2Rmg4PpKaQzDRdWJeT
	pT8SRGgqijE/dcRtdty/F8KVqGKyhU2HYUHdKFfjZHAOxj7E0msm2Dv7YkMP9SsIkld36GDsTnUBT
	FWo5dXpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMPnr-00AV12-1z;
	Thu, 20 Jul 2023 09:18:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMPne-00AUwH-3C;
	Thu, 20 Jul 2023 09:18:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4j39ue0qWkoQXKChqLhlwL+JOaigzxBG0E2V7p0YIYo=; b=AES6Z65YZKZw7uAWUhhpvGByGp
	1vleMKyo7lhZrk16jl2qFJDxcoAn/JnwpJsqdPyjQ8puvnpGiZE+7PGPkProv22uFXnorBHgIy+tA
	QNfBIACYXj/fFKg8mILZmxSpXPkIhKZWTLbpPyI8W+rNqBg0q7TVAgB/+DsMQ85kW+BtBzfQHcxTZ
	KU8gcVa64u5wKPNirC+TDt+L2ZDUFcsGqS2nEzWFNPSlDYVGB8pm2LWOMad6FtTTag2aXNE8TJYh+
	64dEXFjGaxLj4cegMudk24jbSLh88DGdMNfzY02BMpRkmoPeHfZIdY59x0wj/rMJfi6zOaTvQGzay
	Ws4jcwgg==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMPla-00FSY3-1y;
	Thu, 20 Jul 2023 09:18:16 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B92666607081;
	Thu, 20 Jul 2023 10:16:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689844566;
	bh=1kIQPzG/tgjCwU+YLIkNToFU9pBMo4SofHsQ5ly6SG0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MQnAfkGGXEG5PUrRuYzAjvqKysQcZLwLOUudeIAt3iL8xj2mi79zqtLcGwl7Pk8Em
	 zqV8QImm4LxIHHWtExZn964mPpZlFSHIDhKpEupOcow+JRlQzz/7cRV83VURKfIt/5
	 bWb/UfQhcPARvUNw9nLuADmOR5UKbCXSoUgFgAnJ2HnXVYESck8ItaEYHuEHS0v+8m
	 n/UfT/9erk1aPTxe3yWzKiJZEnKio4YzuxUWYd83pbjrbFsyQHq9L2m4E0Gk7EYl1O
	 A9kmOJVqXPcyEaiz8u9M0GzajhQByU0DQ7cLvfKrCv0aiY53PqyDzHAIpgBpTrIVTm
	 XpslNigPMyHTQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/3] arm64: dts: mediatek: mt6795-xperia-m5: Add display backlight support
Date: Thu, 20 Jul 2023 11:15:58 +0200
Message-Id: <20230720091559.86406-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230720091559.86406-1-angelogioacchino.delregno@collabora.com>
References: <20230720091559.86406-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_101811_036167_213B27CF 
X-CRM114-Status: GOOD (  10.21  )
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

Add the relevant nodes for display backlight on Sony Xperia M5: this
needs both the SoC PWM IP and MT6332 PMIC LED strings.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../dts/mediatek/mt6795-sony-xperia-m5.dts    | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
index b5746e6d0b15..ecdf00707a44 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
@@ -22,6 +22,23 @@ aliases {
 		serial1 = &uart1;
 	};
 
+	backlight_lcd0: backlight {
+		compatible = "led-backlight";
+		leds = <&disp_led_pwm>, <&pmic_bl_led>;
+
+		default-brightness-level = <300>;
+	};
+
+	led-controller-display {
+		compatible = "pwm-leds";
+
+		disp_led_pwm: led-0 {
+			label = "backlight-pwm";
+			pwms = <&pwm0 0 500000>;
+			max-brightness = <1024>;
+		};
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x1e800000>;
@@ -338,6 +355,21 @@ &pmic {
 	 * an interrupt on the companion, so we use the MT6332 IRQ GPIO.
 	 */
 	interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
+
+	mt6332-led {
+		compatible = "mediatek,mt6332-led";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmic_bl_led: led@0 {
+			reg = <0>;
+			label = "backlight-pmic";
+		};
+	};
+};
+
+&pwm0 {
+	status = "okay";
 };
 
 &uart0 {
-- 
2.40.1


