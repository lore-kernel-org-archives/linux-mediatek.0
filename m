Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE21DC5AD4C
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 15:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJJcNZQjoxDpL64YJUPbX5zAdxkULtiEGewpt5HLNRQ=; b=OG8sQwutM6Lkhuk2NeB7/G0mXn
	SlW2/KZSVx3hlXhV3sxXnkqEBA/kkWXDPANul/2Ib/5xJA5imfsmFZtMiuGRKqxlIGiMW3kBu1TYT
	802eTBcefANo+EG3/vuerE7iEgULv8cPkUqchctpCeD1lLiKMVljxM75CureXN9jjWf7y3QZ+B4q3
	FBC1B30B2cAz+YjjaY/OJuMOzsy8W0K1ux2LF2fdv2I79cBwen8hDl6VL/vi8Qb/u2fZw8ILhvodl
	bbDnE5RBVODdCuQboWI7U0/4d+sFpZEQ6ZZaxi5HgdNU1qe0UeBlOUdTJzgpmiz73IrYNgB7Alfug
	MNcMOJng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r55lU-00CRuC-1A;
	Mon, 20 Nov 2023 15:00:44 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r54gT-00CBil-2f;
	Mon, 20 Nov 2023 13:52:17 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5098e423ba2so6078832e87.2;
        Mon, 20 Nov 2023 05:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700488285; x=1701093085; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RJJcNZQjoxDpL64YJUPbX5zAdxkULtiEGewpt5HLNRQ=;
        b=VRz3J1O8yhWuND7sfSbWZKWbzDK/lbMlcoWb12sR/IbL+ptiev+7+S7jN9EUxrHmzR
         5LMTlQwYv6Qnv0EFcOYPjF4ylnZv9hAM8r9uQatzysHOM9jN1YMJsCQA2CjsVbRJbLlH
         j27CIGW6XAKDVxn0Ifyi4hQBhzanNCvWR2lzs/HhCK0jzjnQO5VcR5ubLQl3UMPIIw7F
         8RgZXyQqfZiI+Rinp5+yUwIb0PktLCB2mBByDpq2w2z9rZRHqLLAOK07Wgo6ac+Tyh9U
         5WJ/ZabseyNPrblEsJpcGrxCowScdtuwwvy2GAQbebsEiADUFLRjILQQ12wLGByP5Qz7
         qDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700488285; x=1701093085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RJJcNZQjoxDpL64YJUPbX5zAdxkULtiEGewpt5HLNRQ=;
        b=EQYfYrh9S1Y32v5wulzAklGK+meSRTUpZ1YDOyn5W+LwUWa/4M3kAaUlf1vixY2t/8
         yJLoTfysGF99+xq3SA/UU3YcCvRQ3lMuFHwjIkJg1gPkoxP7mM6Ul1ww8u8X5ia3LoyJ
         zRLKBtuAtNdXlOO8CkNui7rf9a/aTussj9XMkiRD+on4FHHlzH9erUXzF9SjjqWAoMqK
         Q1rpoSn4jv5s+xJ3Mi5Bbc51l/RYrbjaOOAUfPkOytFV/GElJsPgzUIGS1oqu8wNzQgn
         zj36v93QZPG9bF+Q/XtOhc2JJbuVyAZId5Fw85kcnBH3Oxzo64DWarEvGSqy4ysCU09w
         zBkA==
X-Gm-Message-State: AOJu0YxCliWeJ32t5QDZJ8kmbTaVAVxHjz85sRdQiOl/WSHZLm9ojN3r
	2ufuwrRuh+h819wbW0apSrY=
X-Google-Smtp-Source: AGHT+IHEV5yAbedHXZPHvi496M5AnmqBvoItl/mLTRfObKuQHz0eqFU2KUnKLxPwW2KQ8CFk9bb54A==
X-Received: by 2002:a2e:7302:0:b0:2c5:ee7:b322 with SMTP id o2-20020a2e7302000000b002c50ee7b322mr6395660ljc.18.1700488284849;
        Mon, 20 Nov 2023 05:51:24 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id j33-20020a05600c1c2100b0040772934b12sm18205846wms.7.2023.11.20.05.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 05:51:24 -0800 (PST)
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
Subject: [net-next RFC PATCH 08/14] net: phy: add support for PHY package interface mode
Date: Mon, 20 Nov 2023 14:50:35 +0100
Message-Id: <20231120135041.15259-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231120135041.15259-1-ansuelsmth@gmail.com>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_055129_975893_EDE0E411 
X-CRM114-Status: GOOD (  23.85  )
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

Some PHY in PHY package supports running only at a specific mode for
each PHY in the package. Add support for enforcing this special thing a
verify consistency with the requested mode to prevent misconfiguration.

To set the PHY package mode, simply set "phy-mode" in the phy-package
node. Each PHY on init will verify if the requested mode match the one
set for the PHY package and will return -EINVAL if this is not true.

If PHY package doesn't specify any mode, it's assumed that PHY in the
package doesn't have such limitation.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phy_device.c | 37 ++++++++++++++++++++++++++++++++++++
 include/linux/phy.h          |  6 ++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 0b7ba6995929..73af4197a7af 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -25,6 +25,7 @@
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_net.h>
 #include <linux/netdevice.h>
 #include <linux/phy.h>
 #include <linux/phylib_stubs.h>
@@ -1225,8 +1226,17 @@ static int phy_poll_reset(struct phy_device *phydev)
 
 int phy_init_hw(struct phy_device *phydev)
 {
+	phy_interface_t package_interface;
 	int ret = 0;
 
+	/* Validate we are requesting consistent mode if we
+	 * are in a PHY package and the PHY package requires a
+	 * specific mode.
+	 */
+	ret = phy_package_get_mode(phydev, &package_interface);
+	if (!ret && phydev->interface != package_interface)
+		return -EINVAL;
+
 	/* Deassert the reset signal */
 	phy_device_reset(phydev, 0);
 
@@ -1776,6 +1786,32 @@ void phy_package_leave(struct phy_device *phydev)
 }
 EXPORT_SYMBOL_GPL(phy_package_leave);
 
+/**
+ * phy_package_get_mode - get PHY interface mode for PHY package
+ * @phydev: target phy_device struct
+ * @interface: phy_interface_t pointer where to save the PHY package mode
+ *
+ * Gets PHY interface mode for the shared data of the PHY package.
+ * Returns 0 and updates @interface with the PHY package value, or -ENODEV
+ * if PHY is not in PHY package or -EINVAL if a PHY package interface mode
+ * is not set.
+ */
+int phy_package_get_mode(struct phy_device *phydev, phy_interface_t *interface)
+{
+	struct phy_package_shared *shared = phydev->shared;
+
+	if (!shared)
+		return -ENODEV;
+
+	if (shared->package_interface == PHY_INTERFACE_MODE_NA)
+		return -EINVAL;
+
+	*interface = shared->package_interface;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(phy_package_get_mode);
+
 static void devm_phy_package_leave(struct device *dev, void *res)
 {
 	phy_package_leave(*(struct phy_device **)res);
@@ -3270,6 +3306,7 @@ static int of_phy_package(struct phy_device *phydev)
 		goto exit;
 
 	phydev->shared->np = package_node;
+	of_get_phy_mode(package_node, &phydev->shared->package_interface);
 
 exit:
 	kfree(global_phy_addrs);
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 1849fc637196..8af0a8a72b88 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -341,6 +341,11 @@ struct mdio_bus_stats {
 struct phy_package_shared {
 	/* With PHY package defined in DT this points to the PHY package node */
 	struct device_node *np;
+	/* PHY package interface
+	 * If defined, each PHY of the package MUST have the interface
+	 * set to the PHY package.
+	 */
+	phy_interface_t package_interface;
 	/* addrs list pointer */
 	/* note that this pointer is shared between different phydevs.
 	 * It is allocated and freed automatically by phy_package_join() and
@@ -2014,6 +2019,7 @@ int phy_ethtool_nway_reset(struct net_device *ndev);
 int phy_package_join(struct phy_device *phydev, int *addrs, size_t addrs_num,
 		     size_t priv_size);
 void phy_package_leave(struct phy_device *phydev);
+int phy_package_get_mode(struct phy_device *phydev, phy_interface_t *interface);
 int devm_phy_package_join(struct device *dev, struct phy_device *phydev,
 			  int *addrs, size_t addrs_num, size_t priv_size);
 
-- 
2.40.1


