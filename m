Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC63C54E76
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 13:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BkZZkQ+fhxkG3W91GuOjhKRxuNJAr/jVw9bM/JNE+9s=; b=0Oz8ti9WbH3BgXYZ+8cqMbw6WE
	dZZO0h1pfEdUVJDmSXjPjN+x8AXJoiyaPP/urI+DxErvQwlk4HkJlVbDV8nvNHyETF0N0FjFCxpVH
	Eb1y3X5dQq3V07SMRFtfUDv8TseSBvDrB6JMkoRgBvAYrr9NKD07XyPFk0Ryurs9zCN3+mEcbLzVU
	xnP6biI97QuMuehkVqf7WLO7Vd4k6qwGziGgAnhnHcXkbkJXd8xiETsgQCY5dsEC7A9dc557kXmWc
	Fr8vqXC8YI7ythmn0lf8EtVFOJKXt1pfBUbxB8RkAkp5653lgP3ftGBDLxo3xbARclNOOPqG1lx75
	B9alWyFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r54gc-00CBqE-0p;
	Mon, 20 Nov 2023 13:51:39 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r54gO-00CBi5-2e;
	Mon, 20 Nov 2023 13:51:27 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40a4d04af5cso13387475e9.0;
        Mon, 20 Nov 2023 05:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700488283; x=1701093083; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BkZZkQ+fhxkG3W91GuOjhKRxuNJAr/jVw9bM/JNE+9s=;
        b=du6m0/XTnXvs1bFJ/TLHNwV3bJXMPQXXF0fKplc+JVrzZFUHgOHrrKGYfhT+nKGFHF
         /WIXfcXCXnC0XbilcZUOb48dIU9rsqrHXM57ZwvYQ12COrsKKqwxQBx7uIEwmF0EKrmp
         122afTuyG+3Fg6L8ay7Wh0xrA3Quy1BwjG9RomP0bHUslFgY3HmDBH6kedgQbWZjRMys
         zsug1cM+3M+DQeI/6hIgdi2PX3RUqKtRsMO8Feq93edPWTM5cFwGfUKqcsKVzaiYhpRP
         UD+EiasUv8MHerTHbwnsbNmMkzhCEq6vGQ0OwBVSoqjeFjOg7s6tD8W1flcDRCqh4u3s
         bUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700488283; x=1701093083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BkZZkQ+fhxkG3W91GuOjhKRxuNJAr/jVw9bM/JNE+9s=;
        b=ge7MjIB8TnGe90556KCU6lOkUPhCWri5zSCiiag8OHe5JLprnqHSRzvEE1oudxyVUo
         SQHbJMnVxLp98Pkhc+sUgnBGFh2K4e/RtDZiBwBuFkGSfCDmvq6JlnQ5F2VNl4ZUCBxB
         quVRDOsTcVNbsrPucnJistarYU3Ca/9ugSAQdzgwP5qZjkprJyDU7H8TRUy8hXlKJiL7
         Q2a3zImOi0MHltg3rHk+k+flayR2ISF3A5R7FlTyv5eZghVBgOPfuRgZhFI8iZXyXYrz
         MeppkzRvWOerhske4lAeNHXhZSY5JpoBDgmkFXClNVv66+Mqe7T1ncX6fYA1SnK/F9go
         f8aA==
X-Gm-Message-State: AOJu0YwCc1dExv+67qhg2f6DwIttBuXpwSzJKTR4LTZmH5ZrSKKaEl/k
	aEJXLse9/0TJKvDgI8BVjTA=
X-Google-Smtp-Source: AGHT+IHHHmLbo0ls+ZfdjXnfQDFKRg9UMz3ucecEJfw4iq5blHC0EFBdWzjf+AlCouNSkFhaXzhm/Q==
X-Received: by 2002:a05:600c:3b8c:b0:407:5b54:bb10 with SMTP id n12-20020a05600c3b8c00b004075b54bb10mr5935396wms.8.1700488283168;
        Mon, 20 Nov 2023 05:51:23 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id j33-20020a05600c1c2100b0040772934b12sm18205846wms.7.2023.11.20.05.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 05:51:22 -0800 (PST)
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
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Harini Katakam <harini.katakam@amd.com>,
	Simon Horman <horms@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next RFC PATCH 07/14] net: phy: add support for driver specific PHY package probe/config
Date: Mon, 20 Nov 2023 14:50:34 +0100
Message-Id: <20231120135041.15259-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231120135041.15259-1-ansuelsmth@gmail.com>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_055124_864553_5C9A3CF7 
X-CRM114-Status: GOOD (  18.82  )
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

Add PHY driver specific function to probe and configure PHY package.
These function are run only once before the PHY probe and config_init.

They are used in conjunction with DT PHY package define for basic PHY
package implementation to setup and probe PHY package with simple
functions directly defined in the PHY driver struct.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phy_device.c | 14 ++++++++++++++
 include/linux/phy.h          | 21 +++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 91d17129b774..0b7ba6995929 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1246,6 +1246,13 @@ int phy_init_hw(struct phy_device *phydev)
 	if (ret < 0)
 		return ret;
 
+	if (phydev->drv->phy_package_config_init_once &&
+	    phy_package_init_once(phydev)) {
+		ret = phydev->drv->phy_package_config_init_once(phydev);
+		if (ret < 0)
+			return ret;
+	}
+
 	if (phydev->drv->config_init) {
 		ret = phydev->drv->config_init(phydev);
 		if (ret < 0)
@@ -3386,6 +3393,13 @@ static int phy_probe(struct device *dev)
 	/* Deassert the reset signal */
 	phy_device_reset(phydev, 0);
 
+	if (phydev->drv->phy_package_probe_once &&
+	    phy_package_probe_once(phydev)) {
+		err = phydev->drv->phy_package_probe_once(phydev);
+		if (err)
+			goto out;
+	}
+
 	if (phydev->drv->probe) {
 		err = phydev->drv->probe(phydev);
 		if (err)
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 7c47c12cffa0..1849fc637196 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -924,12 +924,33 @@ struct phy_driver {
 	 */
 	int (*soft_reset)(struct phy_device *phydev);
 
+	/**
+	 * @phy_package_config_init_once: Driver specific PHY package
+	 *   config init call
+	 * @def: PHY device to use to probe PHY package
+	 *
+	 * Called to initialize the PHY package, including after
+	 * a reset.
+	 * Called BEFORE PHY config_init.
+	 */
+	int (*phy_package_config_init_once)(struct phy_device *dev);
+
 	/**
 	 * @config_init: Called to initialize the PHY,
 	 * including after a reset
 	 */
 	int (*config_init)(struct phy_device *phydev);
 
+	/**
+	 * @phy_package_probe_once: Driver specific PHY package probe
+	 * @def: PHY device to use to probe PHY package
+	 *
+	 * Called during discovery once per PHY package. Used to set
+	 * up device-specific PHY package structures, if any.
+	 * Called BEFORE PHY probe.
+	 */
+	int (*phy_package_probe_once)(struct phy_device *dev);
+
 	/**
 	 * @probe: Called during discovery.  Used to set
 	 * up device-specific structures, if any
-- 
2.40.1


