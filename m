Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B1FC4167B
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Nov 2023 01:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zx613whbRcvHwJRu+KDlj3qWu/B2xTU9Sffj+PGCEg4=; b=l4RSf3RayYfaBc/or3CKCWeNAI
	paMJW3BCstvOFhhAfaMPOheVfVJXE9YoCEX46sniPYB14RatxLw2VIoLjbqdYueZAa9WQDvu3+d7V
	/iuThmmC+khI1aQ7z2ZwTUgfrw4HyO9Lj8cnI7EvhQ54bUX7nlmSzIe4mePm+jlm70uVQyVtSj7uc
	kHy/NNcjhCQVcfhJuzv4+qRcMBvWtorjwNiR6uUc9ysrkl7JhXOotCFjeewwu5lNGX/ifIpGRhfTt
	tLl0jN7p90ucIjFx0rUklQER+RwQqMxwbcqCCnGPHKqyDcc2H/MGgNDnTUgmUqA24Wo6aOowPUd6f
	qB72mtew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r74Lh-00A4nE-0M;
	Sun, 26 Nov 2023 01:54:17 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r74LV-00A4cQ-09;
	Sun, 26 Nov 2023 01:54:07 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40b405699a9so4192305e9.0;
        Sat, 25 Nov 2023 17:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700963643; x=1701568443; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zx613whbRcvHwJRu+KDlj3qWu/B2xTU9Sffj+PGCEg4=;
        b=Tc8NdIkRLoPaQgg7cFJl4TLdrtGC2Fy5fejiQFFXRFZb3T0Z7hzK/A8hS46hRpTHgf
         VrwoWtmWlOnimo/mpXtlS+Mf/Q32khAA4Fgtm6l4SgkubX9LsoIRVriwJVhIF439avop
         k7SEFvRtqa1RPVJxUIG3JSrflvs9lqzM37qHhj8ZrzcxQcirbbcbiMRzV8IGXUU8hHCd
         qKP/XPROaiPUqVOqBVM7diyFT5F6VQaKp2m2AcqTLSQP8vzXBFlU1VwJSGtv7F5ol6eE
         IcMRJrphy06fQ633qNnkOqttu3WpvXqGMsLZGy3on5QGZtffDn/80PNN/WEKHmizwpUD
         VsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700963643; x=1701568443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zx613whbRcvHwJRu+KDlj3qWu/B2xTU9Sffj+PGCEg4=;
        b=qGCwgfN1yNH+2hMJuAN3Cp57EuSCCctuNLazvpdKrUML9kULYOAlQlT6pUVneXOG1Y
         paCmrxeBNltuE8biCkxT15LDXAwBQOF0buZVAJrIBqZJgfmc/bPfwy1T4rW26/uA85MG
         ruB2xp70Bg1Ek3VRAiQYNk43aILSchafqEkPzEVZjqUMVhDuREAtvlO7X+fskmj0kap3
         H3rKowNnx50AEQFdtsJQA2dbdHnvXUyhw4x0lt4WGF23M3So5ZEdlF9l+csKhXX1Vn62
         1oygtjy2tBoEo61t23L867pHBjYkBpleVDnt2KVZTa48GVLI3wl/cQ4xWvUNnk5fr/sm
         sC7w==
X-Gm-Message-State: AOJu0YxLG0QtUEQYB54Yq7I1f+R1hg8b6lEHr9NJUVQT8T6+5QmusDUS
	GyqJrSVJUs+gWzXWDNrTbbQ=
X-Google-Smtp-Source: AGHT+IEppVdgFBdrmKPjDgzJlLd5FpI40ucsVwSm9OSTRl19LbUuF+6d7eHsWRDkMx/3j4fENS/p6A==
X-Received: by 2002:a05:600c:1c12:b0:407:612b:91fb with SMTP id j18-20020a05600c1c1200b00407612b91fbmr2059247wms.30.1700963643104;
        Sat, 25 Nov 2023 17:54:03 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id p34-20020a05600c1da200b00406408dc788sm9875344wms.44.2023.11.25.17.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 17:54:02 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Robert Marko <robert.marko@sartura.hr>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next PATCH RFC v3 8/8] net: phy: qca807x: Add support for configurable LED
Date: Sun, 26 Nov 2023 02:53:46 +0100
Message-Id: <20231126015346.25208-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231126015346.25208-1-ansuelsmth@gmail.com>
References: <20231126015346.25208-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231125_175405_098366_DE63B6A0 
X-CRM114-Status: GOOD (  18.86  )
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

QCA8072/5 have up to 2 LEDs attached for PHY.

LEDs can be configured to be ON/hw blink or be set to HW control.

Hw blink mode is set to blink at 4Hz or 250ms.

PHY can support both copper (TP) or fiber (FIBRE) kind and supports
different HW control modes based on the port type.

HW control modes supported for netdev trigger for copper ports are:
- LINK_10
- LINK_100
- LINK_1000
- TX
- RX
- FULL_DUPLEX
- HALF_DUPLEX

HW control modes supported for netdev trigger for fiber ports are:
- LINK_100
- LINK_1000
- TX
- RX
- FULL_DUPLEX
- HALF_DUPLEX

LED support conflicts with GPIO controller feature and must be disabled
if gpio-controller is used for the PHY.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/qca807x.c | 382 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 375 insertions(+), 7 deletions(-)

diff --git a/drivers/net/phy/qca807x.c b/drivers/net/phy/qca807x.c
index be039d6de1fb..3c11b39ebe7e 100644
--- a/drivers/net/phy/qca807x.c
+++ b/drivers/net/phy/qca807x.c
@@ -79,17 +79,60 @@
 #define QCA807X_MMD7_1000BASE_T_POWER_SAVE_PER_CABLE_LENGTH	0x801a
 #define QCA807X_CONTROL_DAC_MASK				GENMASK(2, 0)
 
+#define QCA807X_MMD7_LED_GLOBAL				0x8073
+#define QCA807X_LED_BLINK_1				GENMASK(11, 6)
+#define QCA807X_LED_BLINK_2				GENMASK(5, 0)
+/* Values are the same for both BLINK_1 and BLINK_2 */
+#define QCA807X_LED_BLINK_FREQ_MASK			GENMASK(5, 3)
+#define QCA807X_LED_BLINK_FREQ_2HZ			FIELD_PREP(QCA807X_LED_BLINK_FREQ_MASK, 0x0)
+#define QCA807X_LED_BLINK_FREQ_4HZ			FIELD_PREP(QCA807X_LED_BLINK_FREQ_MASK, 0x1)
+#define QCA807X_LED_BLINK_FREQ_8HZ			FIELD_PREP(QCA807X_LED_BLINK_FREQ_MASK, 0x2)
+#define QCA807X_LED_BLINK_FREQ_16HZ			FIELD_PREP(QCA807X_LED_BLINK_FREQ_MASK, 0x3)
+#define QCA807X_LED_BLINK_FREQ_32HZ			FIELD_PREP(QCA807X_LED_BLINK_FREQ_MASK, 0x4)
+#define QCA807X_LED_BLINK_FREQ_64HZ			FIELD_PREP(QCA807X_LED_BLINK_FREQ_MASK, 0x5)
+#define QCA807X_LED_BLINK_FREQ_128HZ			FIELD_PREP(QCA807X_LED_BLINK_FREQ_MASK, 0x6)
+#define QCA807X_LED_BLINK_FREQ_256HZ			FIELD_PREP(QCA807X_LED_BLINK_FREQ_MASK, 0x7)
+#define QCA807X_LED_BLINK_DUTY_MASK			GENMASK(2, 0)
+#define QCA807X_LED_BLINK_DUTY_50_50			FIELD_PREP(QCA807X_LED_BLINK_DUTY_MASK, 0x0)
+#define QCA807X_LED_BLINK_DUTY_75_25			FIELD_PREP(QCA807X_LED_BLINK_DUTY_MASK, 0x1)
+#define QCA807X_LED_BLINK_DUTY_25_75			FIELD_PREP(QCA807X_LED_BLINK_DUTY_MASK, 0x2)
+#define QCA807X_LED_BLINK_DUTY_33_67			FIELD_PREP(QCA807X_LED_BLINK_DUTY_MASK, 0x3)
+#define QCA807X_LED_BLINK_DUTY_67_33			FIELD_PREP(QCA807X_LED_BLINK_DUTY_MASK, 0x4)
+#define QCA807X_LED_BLINK_DUTY_17_83			FIELD_PREP(QCA807X_LED_BLINK_DUTY_MASK, 0x5)
+#define QCA807X_LED_BLINK_DUTY_83_17			FIELD_PREP(QCA807X_LED_BLINK_DUTY_MASK, 0x6)
+#define QCA807X_LED_BLINK_DUTY_8_92			FIELD_PREP(QCA807X_LED_BLINK_DUTY_MASK, 0x7)
 #define QCA807X_MMD7_LED_100N_1				0x8074
 #define QCA807X_MMD7_LED_100N_2				0x8075
 #define QCA807X_MMD7_LED_1000N_1			0x8076
 #define QCA807X_MMD7_LED_1000N_2			0x8077
-#define QCA807X_LED_TXACT_BLK_EN_2			BIT(10)
-#define QCA807X_LED_RXACT_BLK_EN_2			BIT(9)
-#define QCA807X_LED_GT_ON_EN_2				BIT(6)
-#define QCA807X_LED_HT_ON_EN_2				BIT(5)
-#define QCA807X_LED_BT_ON_EN_2				BIT(4)
-#define QCA807X_GPIO_FORCE_EN				BIT(15)
-#define QCA807X_GPIO_FORCE_MODE_MASK			GENMASK(14, 13)
+/* Values are the same for LED1 and LED2 */
+/* Values for control 1 */
+#define QCA807X_LED_COPPER_ON_BLINK_MASK		GENMASK(12, 0)
+#define QCA807X_LED_FDX_ON_EN				BIT(12)
+#define QCA807X_LED_HDX_ON_EN				BIT(11)
+#define QCA807X_LED_TXACT_BLK_EN			BIT(10)
+#define QCA807X_LED_RXACT_BLK_EN			BIT(9)
+#define QCA807X_LED_GT_ON_EN				BIT(6)
+#define QCA807X_LED_HT_ON_EN				BIT(5)
+#define QCA807X_LED_BT_ON_EN				BIT(4)
+/* Values for control 2 */
+#define QCA807X_LED_FORCE_EN				BIT(15)
+#define QCA807X_LED_FORCE_MODE_MASK			GENMASK(14, 13)
+#define QCA807X_LED_FORCE_BLINK_1			FIELD_PREP(QCA807X_LED_FORCE_MODE_MASK, 0x3)
+#define QCA807X_LED_FORCE_BLINK_2			FIELD_PREP(QCA807X_LED_FORCE_MODE_MASK, 0x2)
+#define QCA807X_LED_FORCE_ON				FIELD_PREP(QCA807X_LED_FORCE_MODE_MASK, 0x1)
+#define QCA807X_LED_FORCE_OFF				FIELD_PREP(QCA807X_LED_FORCE_MODE_MASK, 0x0)
+#define QCA807X_LED_FIBER_ON_BLINK_MASK			GENMASK(11, 1)
+#define QCA807X_LED_FIBER_TXACT_BLK_EN			BIT(10)
+#define QCA807X_LED_FIBER_RXACT_BLK_EN			BIT(9)
+#define QCA807X_LED_FIBER_FDX_ON_EN			BIT(6)
+#define QCA807X_LED_FIBER_HDX_ON_EN			BIT(5)
+#define QCA807X_LED_FIBER_1000BX_ON_EN			BIT(2)
+#define QCA807X_LED_FIBER_100FX_ON_EN			BIT(1)
+
+/* Some device repurpose the LED as GPIO out */
+#define QCA807X_GPIO_FORCE_EN				QCA807X_LED_FORCE_EN
+#define QCA807X_GPIO_FORCE_MODE_MASK			QCA807X_LED_FORCE_MODE_MASK
 
 #define QCA807X_INTR_ENABLE				0x12
 #define QCA807X_INTR_STATUS				0x13
@@ -350,6 +393,320 @@ static int qca807x_cable_test_start(struct phy_device *phydev)
 	return ret;
 }
 
+static int qca807x_led_parse_netdev(struct phy_device *phydev, unsigned long rules,
+				    u16 *offload_trigger)
+{
+	/* Parsing specific to netdev trigger */
+	switch (phydev->port) {
+	case PORT_TP:
+		if (test_bit(TRIGGER_NETDEV_TX, &rules))
+			*offload_trigger |= QCA807X_LED_TXACT_BLK_EN;
+		if (test_bit(TRIGGER_NETDEV_RX, &rules))
+			*offload_trigger |= QCA807X_LED_RXACT_BLK_EN;
+		if (test_bit(TRIGGER_NETDEV_LINK_10, &rules))
+			*offload_trigger |= QCA807X_LED_BT_ON_EN;
+		if (test_bit(TRIGGER_NETDEV_LINK_100, &rules))
+			*offload_trigger |= QCA807X_LED_HT_ON_EN;
+		if (test_bit(TRIGGER_NETDEV_LINK_1000, &rules))
+			*offload_trigger |= QCA807X_LED_GT_ON_EN;
+		if (test_bit(TRIGGER_NETDEV_HALF_DUPLEX, &rules))
+			*offload_trigger |= QCA807X_LED_HDX_ON_EN;
+		if (test_bit(TRIGGER_NETDEV_FULL_DUPLEX, &rules))
+			*offload_trigger |= QCA807X_LED_FDX_ON_EN;
+		break;
+	case PORT_FIBRE:
+		if (test_bit(TRIGGER_NETDEV_TX, &rules))
+			*offload_trigger |= QCA807X_LED_FIBER_TXACT_BLK_EN;
+		if (test_bit(TRIGGER_NETDEV_RX, &rules))
+			*offload_trigger |= QCA807X_LED_FIBER_RXACT_BLK_EN;
+		if (test_bit(TRIGGER_NETDEV_LINK_100, &rules))
+			*offload_trigger |= QCA807X_LED_FIBER_100FX_ON_EN;
+		if (test_bit(TRIGGER_NETDEV_LINK_1000, &rules))
+			*offload_trigger |= QCA807X_LED_FIBER_1000BX_ON_EN;
+		if (test_bit(TRIGGER_NETDEV_HALF_DUPLEX, &rules))
+			*offload_trigger |= QCA807X_LED_FIBER_HDX_ON_EN;
+		if (test_bit(TRIGGER_NETDEV_FULL_DUPLEX, &rules))
+			*offload_trigger |= QCA807X_LED_FIBER_FDX_ON_EN;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	if (rules && !*offload_trigger)
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
+static int qca807x_led_hw_control_enable(struct phy_device *phydev, u8 index)
+{
+	int val, reg, ret;
+
+	switch (index) {
+	case 0:
+		reg = QCA807X_MMD7_LED_100N_2;
+		break;
+	case 1:
+		reg = QCA807X_MMD7_LED_1000N_2;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	val = phy_read_mmd(phydev, MDIO_MMD_AN, reg);
+	val &= ~QCA807X_LED_FORCE_EN;
+	ret = phy_write_mmd(phydev, MDIO_MMD_AN, reg, val);
+
+	return ret;
+}
+
+static int qca807x_led_hw_is_supported(struct phy_device *phydev, u8 index,
+				       unsigned long rules)
+{
+	u16 offload_trigger = 0;
+
+	if (index > 1)
+		return -EINVAL;
+
+	return qca807x_led_parse_netdev(phydev, rules, &offload_trigger);
+}
+
+static int qca807x_led_hw_control_set(struct phy_device *phydev, u8 index,
+				      unsigned long rules)
+{
+	int val, ret, copper_reg, fibre_reg;
+	u16 offload_trigger = 0;
+
+	switch (index) {
+	case 0:
+		copper_reg = QCA807X_MMD7_LED_100N_1;
+		fibre_reg = QCA807X_MMD7_LED_100N_2;
+		break;
+	case 1:
+		copper_reg = QCA807X_MMD7_LED_1000N_1;
+		fibre_reg = QCA807X_MMD7_LED_1000N_2;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ret = qca807x_led_parse_netdev(phydev, rules, &offload_trigger);
+	if (ret)
+		return ret;
+
+	ret = qca807x_led_hw_control_enable(phydev, index);
+	if (ret)
+		return ret;
+
+	switch (phydev->port) {
+	case PORT_TP:
+		val = phy_read_mmd(phydev, MDIO_MMD_AN, copper_reg);
+		val &= ~QCA807X_LED_COPPER_ON_BLINK_MASK;
+		val |= offload_trigger;
+		ret = phy_write_mmd(phydev, MDIO_MMD_AN, copper_reg, val);
+		break;
+	case PORT_FIBRE:
+		val = phy_read_mmd(phydev, MDIO_MMD_AN, fibre_reg);
+		val &= ~QCA807X_LED_FIBER_ON_BLINK_MASK;
+		val |= offload_trigger;
+		ret = phy_write_mmd(phydev, MDIO_MMD_AN, fibre_reg, val);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
+static bool qca807x_led_hw_control_status(struct phy_device *phydev, u8 index)
+{
+	int val, reg;
+
+	switch (index) {
+	case 0:
+		reg = QCA807X_MMD7_LED_100N_2;
+		break;
+	case 1:
+		reg = QCA807X_MMD7_LED_1000N_2;
+		break;
+	default:
+		return false;
+	}
+
+	val = phy_read_mmd(phydev, MDIO_MMD_AN, reg);
+
+	return !(val & QCA807X_LED_FORCE_EN);
+}
+
+static int qca807x_led_hw_control_get(struct phy_device *phydev, u8 index,
+				      unsigned long *rules)
+{
+	int val, copper_reg, fibre_reg;
+
+	switch (index) {
+	case 0:
+		copper_reg = QCA807X_MMD7_LED_100N_1;
+		fibre_reg = QCA807X_MMD7_LED_100N_2;
+		break;
+	case 1:
+		copper_reg = QCA807X_MMD7_LED_1000N_1;
+		fibre_reg = QCA807X_MMD7_LED_100N_2;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* Check if we have hw control enabled */
+	if (qca807x_led_hw_control_status(phydev, index))
+		return -EINVAL;
+
+	/* Parsing specific to netdev trigger */
+	switch (phydev->port) {
+	case PORT_TP:
+		val = phy_read_mmd(phydev, MDIO_MMD_AN, copper_reg);
+		if (val & QCA807X_LED_TXACT_BLK_EN)
+			set_bit(TRIGGER_NETDEV_TX, rules);
+		if (val & QCA807X_LED_RXACT_BLK_EN)
+			set_bit(TRIGGER_NETDEV_RX, rules);
+		if (val & QCA807X_LED_BT_ON_EN)
+			set_bit(TRIGGER_NETDEV_LINK_10, rules);
+		if (val & QCA807X_LED_HT_ON_EN)
+			set_bit(TRIGGER_NETDEV_LINK_100, rules);
+		if (val & QCA807X_LED_GT_ON_EN)
+			set_bit(TRIGGER_NETDEV_LINK_1000, rules);
+		if (val & QCA807X_LED_HDX_ON_EN)
+			set_bit(TRIGGER_NETDEV_HALF_DUPLEX, rules);
+		if (val & QCA807X_LED_FDX_ON_EN)
+			set_bit(TRIGGER_NETDEV_FULL_DUPLEX, rules);
+		break;
+	case PORT_FIBRE:
+		val = phy_read_mmd(phydev, MDIO_MMD_AN, fibre_reg);
+		if (val & QCA807X_LED_FIBER_TXACT_BLK_EN)
+			set_bit(TRIGGER_NETDEV_TX, rules);
+		if (val & QCA807X_LED_FIBER_RXACT_BLK_EN)
+			set_bit(TRIGGER_NETDEV_RX, rules);
+		if (val & QCA807X_LED_FIBER_100FX_ON_EN)
+			set_bit(TRIGGER_NETDEV_LINK_100, rules);
+		if (val & QCA807X_LED_FIBER_1000BX_ON_EN)
+			set_bit(TRIGGER_NETDEV_LINK_1000, rules);
+		if (val & QCA807X_LED_FIBER_HDX_ON_EN)
+			set_bit(TRIGGER_NETDEV_HALF_DUPLEX, rules);
+		if (val & QCA807X_LED_FIBER_FDX_ON_EN)
+			set_bit(TRIGGER_NETDEV_FULL_DUPLEX, rules);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int qca807x_led_hw_control_reset(struct phy_device *phydev, u8 index)
+{
+	int val, copper_reg, fibre_reg, ret;
+
+	switch (index) {
+	case 0:
+		copper_reg = QCA807X_MMD7_LED_100N_1;
+		fibre_reg = QCA807X_MMD7_LED_100N_2;
+		break;
+	case 1:
+		copper_reg = QCA807X_MMD7_LED_1000N_1;
+		fibre_reg = QCA807X_MMD7_LED_100N_2;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (phydev->port) {
+	case PORT_TP:
+		val = phy_read_mmd(phydev, MDIO_MMD_AN, copper_reg);
+		val &= ~QCA807X_LED_COPPER_ON_BLINK_MASK;
+		ret = phy_write_mmd(phydev, MDIO_MMD_AN, copper_reg, val);
+		break;
+	case PORT_FIBRE:
+		val = phy_read_mmd(phydev, MDIO_MMD_AN, fibre_reg);
+		val &= ~QCA807X_LED_FIBER_ON_BLINK_MASK;
+		ret = phy_write_mmd(phydev, MDIO_MMD_AN, fibre_reg, val);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
+static int qca807x_led_brightness_set(struct phy_device *phydev,
+				      u8 index, enum led_brightness value)
+{
+	int val, ret;
+	u16 reg;
+
+	switch (index) {
+	case 0:
+		reg = QCA807X_MMD7_LED_100N_2;
+		break;
+	case 1:
+		reg = QCA807X_MMD7_LED_1000N_2;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* If we are setting off the LED reset any hw control rule */
+	if (!value) {
+		ret = qca807x_led_hw_control_reset(phydev, index);
+		if (ret)
+			return ret;
+	}
+
+	val = phy_read_mmd(phydev, MDIO_MMD_AN, reg);
+	val &= ~(QCA807X_LED_FORCE_EN | QCA807X_LED_FORCE_MODE_MASK);
+	val |= QCA807X_LED_FORCE_EN;
+	if (value)
+		val |= QCA807X_LED_FORCE_ON;
+	ret = phy_write_mmd(phydev, MDIO_MMD_AN, reg, val);
+
+	return ret;
+}
+
+static int qca807x_led_blink_set(struct phy_device *phydev, u8 index,
+				 unsigned long *delay_on,
+				 unsigned long *delay_off)
+{
+	int val, ret;
+	u16 reg;
+
+	switch (index) {
+	case 0:
+		reg = QCA807X_MMD7_LED_100N_2;
+		break;
+	case 1:
+		reg = QCA807X_MMD7_LED_1000N_2;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* Set blink to 50% off, 50% on at 4Hz by default */
+	val = phy_read_mmd(phydev, MDIO_MMD_AN, QCA807X_MMD7_LED_GLOBAL);
+	val &= ~(QCA807X_LED_BLINK_FREQ_MASK | QCA807X_LED_BLINK_DUTY_MASK);
+	val |= QCA807X_LED_BLINK_FREQ_4HZ | QCA807X_LED_BLINK_DUTY_50_50;
+	ret = phy_write_mmd(phydev, MDIO_MMD_AN, QCA807X_MMD7_LED_GLOBAL, val);
+
+	/* We use BLINK_1 for normal blinking */
+	val = phy_read_mmd(phydev, MDIO_MMD_AN, reg);
+	val &= ~(QCA807X_LED_FORCE_EN | QCA807X_LED_FORCE_MODE_MASK);
+	val |= QCA807X_LED_FORCE_EN | QCA807X_LED_FORCE_BLINK_1;
+	ret = phy_write_mmd(phydev, MDIO_MMD_AN, reg, val);
+
+	/* We set blink to 4Hz, aka 250ms */
+	*delay_on = 250 / 2;
+	*delay_off = 250 / 2;
+
+	return ret;
+}
+
 #ifdef CONFIG_GPIOLIB
 static int qca807x_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 {
@@ -739,6 +1096,12 @@ static int qca807x_probe(struct phy_device *phydev)
 			ret = qca807x_gpio(phydev);
 			if (ret)
 				return ret;
+
+			phydev->drv->led_brightness_set = NULL;
+			phydev->drv->led_blink_set = NULL;
+			phydev->drv->led_hw_is_supported = NULL;
+			phydev->drv->led_hw_control_set = NULL;
+			phydev->drv->led_hw_control_get = NULL;
 		}
 	}
 
@@ -926,6 +1289,11 @@ static struct phy_driver qca807x_drivers[] = {
 		.suspend	= genphy_suspend,
 		.cable_test_start	= qca807x_cable_test_start,
 		.cable_test_get_status	= qca807x_cable_test_get_status,
+		.led_brightness_set = qca807x_led_brightness_set,
+		.led_blink_set = qca807x_led_blink_set,
+		.led_hw_is_supported = qca807x_led_hw_is_supported,
+		.led_hw_control_set = qca807x_led_hw_control_set,
+		.led_hw_control_get = qca807x_led_hw_control_get,
 		/* PHY package define */
 		.phy_package_priv_data_size = sizeof(struct qca807x_shared_priv),
 		.phy_package_probe_once = qca807x_phy_package_probe_once,
-- 
2.40.1


