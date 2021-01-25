Return-Path: <SRS0=y96F=G4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07E0BC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 04:44:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF8EA22C9C
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 04:44:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF8EA22C9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QiO4V7s+64NsYZhINFmdKrOtoQRze7BX67fwfgH9DnA=; b=od3Clp7HsnDppao0MFc9MsBnj
	GaRf5c4b7/ZRUfH2hpdY2gEigZRFWTj+mW2RaxSkoMC41g7DZfjxjhxMbtr/NS2yFIKYNfKXwBYGy
	+Tkdc8v3Vybo1nFloLF4GAPV3PgMPI9hUFbRSv4ltlkq9zcTvf3MvyME3+fpvFl5wJwSruQe2opRs
	UN0wA8OpWNPcjkxhxU8PeQFWdGnNX/gAkEGbfWZ6kfxlq6KjMO5HIM8ROSgQzjTw20Jfz73lHAG/Y
	klkr2VKC5QgSGZOpksZESID3GkigkxsVU0HIxr7XEPaunspGsuUc8jS/doTS/S/iXCpOdMkhFYakC
	K8+Y8Xc0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3tjM-0003Mu-MJ; Mon, 25 Jan 2021 04:44:00 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3tjI-0003Le-50; Mon, 25 Jan 2021 04:43:56 +0000
Received: by mail-pj1-x102a.google.com with SMTP id md11so7614698pjb.0;
 Sun, 24 Jan 2021 20:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v1/Q3zp3Vfmt/fjpAsCkjIhac3E9OrOmSYmVgqEy+nY=;
 b=DjTeAYy8+nMI8Nbot17ykSSuLqiNFKKXdoybG+PBjldm9uG1b4as6dK9WagdqVChb9
 76GJ7GcDt1rR1lPPX8v3s8N/A5V1NsOtocyoJ3jX7Lx2DkyRUDKX1jDCRGcFf5NMzANn
 hbB7DfqHW0psss6uiBJKqQB1Lne/DbAGQNGtONLcmb9lhV1jETUX1Hx422Z6pq4Tj1ja
 yixIoFnivlWZKU7ulKffFWU8L0hUei1zJV1lwphT68LP9DtwC0c2NQxjsSWZk+wG3+Li
 X2AjfSePJNIrd4/7weiC3291tFkkbeONUqEsU43F3MGnw+kOVgVyujkCsPvviZ67undV
 Pw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v1/Q3zp3Vfmt/fjpAsCkjIhac3E9OrOmSYmVgqEy+nY=;
 b=c9z9CmRQLl5EFXAtjktyolSDBEdfjYy2m4Yjcmm46JP3HVaFPczp754mMJIKR7cdvJ
 Hi8hr4Nesuzv/xTxj6BcbhiDK+MojMWlL5TB0YNkbUheW4M0m7EdIa9e4/lSDFT0VzEg
 pzXfe2eDRHDrVfmT4BktzG5o0hBfWIyN+dJKaXMX7ylRxDQ7aZ5Hzn//vgFBRo2P+VBk
 6wtEsqI47RuKjkY/O365LqStftLkoBkhEQ/6ogSwwN3Sl2q0v4Kmnof0VYuYxDLGDsr1
 F0tAPqRV11BqXCslVQG608cA1T8vNWQTpB9VZEDcnDr6ja45xJchUMopNBWnsd+CBSXL
 BK6Q==
X-Gm-Message-State: AOAM53028v0aRadtrxkHG9oAZUKeVX8qnMRwcxSJhdF3Qqq29Enbu7kO
 MXy36vaKA6/lPr+xRMV2ZZ8=
X-Google-Smtp-Source: ABdhPJyb+2sRlqhupesds+M5P26CjfYD4TSxkgTlYi/Lto8weoiFIg6Er55myXt/U4ASyEXwLSXJ2w==
X-Received: by 2002:a17:90b:2352:: with SMTP id
 ms18mr4380214pjb.138.1611549834379; 
 Sun, 24 Jan 2021 20:43:54 -0800 (PST)
Received: from container-ubuntu.lan ([171.211.26.203])
 by smtp.gmail.com with ESMTPSA id h4sm11913369pfo.187.2021.01.24.20.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 20:43:53 -0800 (PST)
From: DENG Qingfang <dqfext@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 2/2] net: dsa: mt7530: MT7530 optional GPIO support
Date: Mon, 25 Jan 2021 12:43:22 +0800
Message-Id: <20210125044322.6280-3-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210125044322.6280-1-dqfext@gmail.com>
References: <20210125044322.6280-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210124_234356_199852_19E3B8F1 
X-CRM114-Status: GOOD (  18.42  )
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
Changes v1 -> v2:

Set Output Enable after changing direction to output to avoid signal
glitch.
Comment mt7530_gpio_to_bit function.

 drivers/net/dsa/mt7530.c | 110 +++++++++++++++++++++++++++++++++++++++
 drivers/net/dsa/mt7530.h |  20 +++++++
 2 files changed, 130 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index d2196197d920..eb13ba79dd01 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -18,6 +18,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
 #include <net/dsa.h>
 
 #include "mt7530.h"
@@ -1622,6 +1623,109 @@ mtk_get_tag_protocol(struct dsa_switch *ds, int port,
 	}
 }
 
+static inline u32
+mt7530_gpio_to_bit(unsigned int offset)
+{
+	/* Map GPIO offset to register bit
+	 * [ 2: 0]  port 0 LED 0..2 as GPIO 0..2
+	 * [ 6: 4]  port 1 LED 0..2 as GPIO 3..5
+	 * [10: 8]  port 2 LED 0..2 as GPIO 6..8
+	 * [14:12]  port 3 LED 0..2 as GPIO 9..11
+	 * [18:16]  port 4 LED 0..2 as GPIO 12..14
+	 */
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
+	mt7530_clear(priv, MT7530_LED_GPIO_OE, bit);
+	mt7530_clear(priv, MT7530_LED_GPIO_DIR, bit);
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
+
+	if (value)
+		mt7530_set(priv, MT7530_LED_GPIO_DATA, bit);
+	else
+		mt7530_clear(priv, MT7530_LED_GPIO_DATA, bit);
+
+	mt7530_set(priv, MT7530_LED_GPIO_OE, bit);
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
+	mt7530_write(priv, MT7530_LED_GPIO_OE, 0);
+	mt7530_write(priv, MT7530_LED_GPIO_DIR, 0);
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
@@ -1763,6 +1867,12 @@ mt7530_setup(struct dsa_switch *ds)
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
index 32d8969b3ace..64a9bb377e15 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -554,6 +554,26 @@ enum mt7531_clk_skew {
 #define  MT7531_GPIO12_RG_RXD3_MASK	GENMASK(19, 16)
 #define  MT7531_EXT_P_MDIO_12		(2 << 16)
 
+/* Registers for LED GPIO control (MT7530 only)
+ * All registers follow this pattern:
+ * [ 2: 0]  port 0
+ * [ 6: 4]  port 1
+ * [10: 8]  port 2
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
