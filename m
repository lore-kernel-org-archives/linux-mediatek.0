Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64D64C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 05:45:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17EFC2251F
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 05:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17EFC2251F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fi+YVbMKyC4h1qByKIt/7QE8tAE74itYtmg7y9cowfM=; b=IVel2vrPg5+PJeBmLc1U4zCZk
	FCnb6RUO2RrPW64wvreF+kFkme7Ho0uQz8vnUIUvzFrh+9V90Uo0zLoQacfH+6iBXEYw5b4Xe40I0
	wnjomjdSVWPvnS9YUSHfSdzsWo0EEbOC5pHqcMXkn61E7BBEu6HINnSIBixvCPpduy+N1iXHBxEwQ
	XWeVHy1gVKi4qWwzbmd6mqBhpS3i1plBDliiCJ0OU7N7Bzm5wTNM3kL5sgG6iBDZrc4Fyc4vZsR4z
	f0fu17KpgFdoGSkLUE56cdMVOFbwVu5qf7lIUD/WHAyniL1qpIVgL4S61ri0jM29npWXmr2TLzNUs
	j34lU2f0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyq1F-0004T2-2p; Mon, 11 Jan 2021 05:45:33 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyq17-0004Px-Fj; Mon, 11 Jan 2021 05:45:26 +0000
Received: by mail-pg1-x535.google.com with SMTP id 30so11874367pgr.6;
 Sun, 10 Jan 2021 21:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/IG9QX0IHrdPUT/Mg6rywGJ37NO8HyXBbRa3ZgeBS9M=;
 b=oJ0fM+AcEpK6rJSSsNW6UOxHZphHa70yHtXPHyWvdLY1XXSpbAkPyFMvk/cDQE8A+2
 tZt3vxZ9ZPheMXFV1IabJFSHVsVWxv3q5TEj1TrdSzVUbZ11Su6ZKSg7p9TFn+GZlTa2
 6FsaH8vfNbNuyyJ+0d90UNxhAYzLhnBxXkaRV9dIfDUCm7/qlxembEgvx8VOd003H7xI
 FyUkugu7jh5NGYnfIqYRveGPj94wZ9HF00o5zfihBNFIl2Z9QzO9CPzFwXCUQkiXSzk9
 Sfh9vxSXeheOrl0o/lg5gY6BdyT64G59tDdeZHO3YyM9s1ds1kvvfuqnFmij5vuHb90A
 eu0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/IG9QX0IHrdPUT/Mg6rywGJ37NO8HyXBbRa3ZgeBS9M=;
 b=BZpMDyih6alPhz78jVGX01tKitJe5h6fE3JZtX0rmQ9q86+0UwcJcrhlqoCcr+tCXD
 0cu2PNUN59OLlP6cWwkyaRgu/VoZsvtXJiKzIv/cUkKW2H7/kjv9fPh9OVQS3TKNDEt+
 Mgeeu+aVYQLhxZQHhuHodGcgxeghPzVozBikAhur/EFVw+w8pyUkoRlHyU9P9Q2Mz2dE
 zNBEcWp8s68UKAZbhr4MZy0u7qByUDEc/nGZo4J4YTjX1o/ptHbDVRWpq9qDDtpcgCah
 3gwFn0uiSTTt4b66rMaaQN5GpETTA6sNs+3HwKBZ0W09crOs+X08zFCuyvjTY9nHaObH
 Buxg==
X-Gm-Message-State: AOAM533N1EMW9qqLfR152WKTz7hZtCNPqFh0QjpYjC0OimOMlo7w3HJr
 MBtl0MMkL0++F0bTohMk3k0=
X-Google-Smtp-Source: ABdhPJy/ZferhM6b1DXi1APDWQlpyda2XCQFyyhZemiRFgF70lMgurxMK2f9nMPlEU6bLiCTBi5X+w==
X-Received: by 2002:a65:50c8:: with SMTP id s8mr18467136pgp.68.1610343923559; 
 Sun, 10 Jan 2021 21:45:23 -0800 (PST)
Received: from container-ubuntu.lan ([218.89.163.70])
 by smtp.gmail.com with ESMTPSA id q16sm17548005pfg.139.2021.01.10.21.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 21:45:23 -0800 (PST)
From: DENG Qingfang <dqfext@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 2/2] drivers: net: dsa: mt7530: MT7530 optional GPIO
 support
Date: Mon, 11 Jan 2021 13:44:28 +0800
Message-Id: <20210111054428.3273-3-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111054428.3273-1-dqfext@gmail.com>
References: <20210111054428.3273-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_004525_544250_C5537D95 
X-CRM114-Status: GOOD (  17.66  )
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
Cc: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT7530's LED controller can drive up to 15 LED/GPIOs.

Add support for GPIO control and allow users to use its GPIOs by
setting gpio-controller property in device tree.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
 drivers/net/dsa/mt7530.c | 96 ++++++++++++++++++++++++++++++++++++++++
 drivers/net/dsa/mt7530.h | 20 +++++++++
 2 files changed, 116 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index a67cac15a724..0686d8cbd086 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -18,6 +18,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
 #include <net/dsa.h>
 
 #include "mt7530.h"
@@ -1639,6 +1640,95 @@ mtk_get_tag_protocol(struct dsa_switch *ds, int port,
 	}
 }
 
+static u32
+mt7530_gpio_to_bit(unsigned int offset)
+{
+	return BIT(offset + offset / 3);
+}
+
+static int
+mt7530_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct mt7530_priv *priv = gpiochip_get_data(gc);
+	u32 bit = mt7530_gpio_to_bit(offset);
+
+	return !!(mt7530_read(priv, MT7530_LED_GPIO_DATA) & bit);
+}
+
+static void
+mt7530_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	struct mt7530_priv *priv = gpiochip_get_data(gc);
+	u32 bit = mt7530_gpio_to_bit(offset);
+
+	if (value)
+		mt7530_set(priv, MT7530_LED_GPIO_DATA, bit);
+	else
+		mt7530_clear(priv, MT7530_LED_GPIO_DATA, bit);
+}
+
+static int
+mt7530_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct mt7530_priv *priv = gpiochip_get_data(gc);
+	u32 bit = mt7530_gpio_to_bit(offset);
+
+	return (mt7530_read(priv, MT7530_LED_GPIO_DIR) & bit) ?
+		GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
+static int
+mt7530_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
+{
+	struct mt7530_priv *priv = gpiochip_get_data(gc);
+	u32 bit = mt7530_gpio_to_bit(offset);
+
+	mt7530_clear(priv, MT7530_LED_GPIO_DIR, bit);
+	mt7530_clear(priv, MT7530_LED_GPIO_OE, bit);
+
+	return 0;
+}
+
+static int
+mt7530_gpio_direction_output(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	struct mt7530_priv *priv = gpiochip_get_data(gc);
+	u32 bit = mt7530_gpio_to_bit(offset);
+
+	mt7530_set(priv, MT7530_LED_GPIO_DIR, bit);
+	mt7530_set(priv, MT7530_LED_GPIO_OE, bit);
+	mt7530_gpio_set(gc, offset, value);
+
+	return 0;
+}
+
+static int
+mt7530_setup_gpio(struct mt7530_priv *priv)
+{
+	struct device *dev = priv->dev;
+	struct gpio_chip *gc;
+
+	gc = devm_kzalloc(dev, sizeof(*gc), GFP_KERNEL);
+	if (!gc)
+		return -ENOMEM;
+
+	mt7530_write(priv, MT7530_LED_IO_MODE, 0);
+
+	gc->label = "mt7530";
+	gc->parent = dev;
+	gc->owner = THIS_MODULE;
+	gc->get_direction = mt7530_gpio_get_direction;
+	gc->direction_input = mt7530_gpio_direction_input;
+	gc->direction_output = mt7530_gpio_direction_output;
+	gc->get = mt7530_gpio_get;
+	gc->set = mt7530_gpio_set;
+	gc->base = -1;
+	gc->ngpio = 15;
+	gc->can_sleep = true;
+
+	return devm_gpiochip_add_data(dev, gc, priv);
+}
+
 static int
 mt7530_setup(struct dsa_switch *ds)
 {
@@ -1781,6 +1871,12 @@ mt7530_setup(struct dsa_switch *ds)
 		}
 	}
 
+	if (of_property_read_bool(priv->dev->of_node, "gpio-controller")) {
+		ret = mt7530_setup_gpio(priv);
+		if (ret)
+			return ret;
+	}
+
 	mt7530_setup_port5(ds, interface);
 
 	/* Flush the FDB table */
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 32d8969b3ace..e7903ecc6a7c 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -554,6 +554,26 @@ enum mt7531_clk_skew {
 #define  MT7531_GPIO12_RG_RXD3_MASK	GENMASK(19, 16)
 #define  MT7531_EXT_P_MDIO_12		(2 << 16)
 
+/* Registers for LED GPIO control (MT7530 only)
+ * All registers follow this pattern:
+ * [2:0]    port 0
+ * [6:4]    port 1
+ * [10:8]   port 2
+ * [14:12]  port 3
+ * [18:16]  port 4
+ */
+
+/* LED enable, 0: Disable, 1: Enable (Default) */
+#define MT7530_LED_EN			0x7d00
+/* LED mode, 0: GPIO mode, 1: PHY mode (Default) */
+#define MT7530_LED_IO_MODE		0x7d04
+/* GPIO direction, 0: Input, 1: Output */
+#define MT7530_LED_GPIO_DIR		0x7d10
+/* GPIO output enable, 0: Disable, 1: Enable */
+#define MT7530_LED_GPIO_OE		0x7d14
+/* GPIO value, 0: Low, 1: High */
+#define MT7530_LED_GPIO_DATA		0x7d18
+
 #define MT7530_CREV			0x7ffc
 #define  CHIP_NAME_SHIFT		16
 #define  MT7530_ID			0x7530
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
