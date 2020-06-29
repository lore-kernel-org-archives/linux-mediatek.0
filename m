Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E3FC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 12:05:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2090323D23
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 12:05:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fekL8+34";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="wrrcCV/e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2090323D23
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tJtqwcEFkiJqGi0kP3/sWUhIXORpVL9f9LEwsZ1ASDg=; b=fekL8+34MYA6vshrPxt83+WIE
	upLrhxZt+4ZU2K1ZMgf+Z6f+HAAs5u84qZELSDNu4AMsrea590LfQzONq0qxOpQ16WIF7cfJfWY3/
	9ioAoQc0ZDKIgTNjOxQurJxpSSk3uXV1oIcrD7/ztDgaNFCiPAmx1XdMiYH5MfQzE+JKOQmNNCIF/
	gOtMKuJP4IF6KPgn1PhUOedYpNmCIDC+dXremZ6WFN2yuaNKBn4jwjxpSaInAH0JX5p0F3zdlSGDZ
	7yVO4syeRpH15Fn8t/lTRtEXDDgnfc6pLYdD1TqyK5bDewHzEYIHHh98si2jwqwq2KqphzKaq3bCO
	ZAgYt6jmQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpsWy-0008KC-9D; Mon, 29 Jun 2020 12:05:00 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpsWJ-00084F-St
 for linux-mediatek@lists.infradead.org; Mon, 29 Jun 2020 12:04:22 +0000
Received: by mail-wm1-x342.google.com with SMTP id l17so15140372wmj.0
 for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2020 05:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hztYQwCZoivzm5mGWlL7y58+THNI2tIqMQL/obqgBh8=;
 b=wrrcCV/eHtEzwZIw9VBAP2zQ1gydhl0t9E8l473TWC1k05eOBumji4Os1tiblAIJzO
 4wOzef0hZPVEX5d6XcKMyCLmyT1b7YyADt6ahskiop6YYNc4kCYECitUEPTZ2F+fGW7i
 6y8Uvfl5xMLYsCcJdugcnS3YtHoCINKs3ujOoex6Br78sdsqIuKWAPmqQBMdtMgzZc4Z
 IgDmjSTOStUefzpm8hIuT/c2k0/+8rBOE6qocp0QN+rhvRzXyv46oLIUH3XFLdMSc0fo
 EpUTI/q2/srGjYzlHBIkYZyaLKmmyxTE0lK2PPy6VX9gggVCK384yzLHsG9blwPMptuJ
 bl8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hztYQwCZoivzm5mGWlL7y58+THNI2tIqMQL/obqgBh8=;
 b=TwSoEfDTIoBpJeWcTRJdFY0GZ4+3KYeWPfdhr8cK63hxF4gu6QjOwynjaxzh53AcFZ
 01FmLDG3K0JJYhVMz6AnsLdpyHiAYDfEc5pe1xjOouXg9N1u71mU2x766ks+6o1Nyo7M
 +2tYObgKhCiesn0srp6dQcOFQ5fisMNFBNOaQCXS5BOXthnbljX8BQD9RhWbsYgXciaF
 QI8grY0dSP39tt0CC9L104CfOqlDq3b38DupLxS/LbW80weBOx1vtNgEJJQkJ8RCy91U
 gFLmOes94WOc/i3rs77TJaZhyUBETrPx1nSMjPJLj+7qyofHkoeejpZ7Sk52b5aZqBJA
 p3Vw==
X-Gm-Message-State: AOAM533OhBrpLHlQWPZPVm1HoN1EoxLkdZjHIkLgTUPXuE4Wg9VG1vR0
 pcp8s5vKQerQH+gmjnkGX9s8NQ==
X-Google-Smtp-Source: ABdhPJwFYLtezxZPsklmDvGqxvDLuEveoshSgJPr77DKJtvQVHg9COcCXF74kUionqbzZntdIBqycg==
X-Received: by 2002:a7b:cc8b:: with SMTP id p11mr17633011wma.180.1593432258934; 
 Mon, 29 Jun 2020 05:04:18 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id d81sm25274347wmc.0.2020.06.29.05.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 05:04:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v2 05/10] phy: un-inline devm_mdiobus_register()
Date: Mon, 29 Jun 2020 14:03:41 +0200
Message-Id: <20200629120346.4382-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200629120346.4382-1-brgl@bgdev.pl>
References: <20200629120346.4382-1-brgl@bgdev.pl>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Functions should only be static inline if they're very short. This
devres helper is already over 10 lines and it will grow soon as we'll
be improving upon its approach. Pull it into mdio_devres.c.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/net/phy/Makefile      |  2 +-
 drivers/net/phy/mdio_devres.c | 18 ++++++++++++++++++
 include/linux/phy.h           | 15 ++-------------
 3 files changed, 21 insertions(+), 14 deletions(-)
 create mode 100644 drivers/net/phy/mdio_devres.c

diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index dc9e53b511d6..896afdcac437 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -3,7 +3,7 @@
 
 libphy-y			:= phy.o phy-c45.o phy-core.o phy_device.o \
 				   linkmode.o
-mdio-bus-y			+= mdio_bus.o mdio_device.o
+mdio-bus-y			+= mdio_bus.o mdio_device.o mdio_devres.o
 
 ifdef CONFIG_MDIO_DEVICE
 obj-y				+= mdio-boardinfo.o
diff --git a/drivers/net/phy/mdio_devres.c b/drivers/net/phy/mdio_devres.c
new file mode 100644
index 000000000000..f0b4b6cfe5e3
--- /dev/null
+++ b/drivers/net/phy/mdio_devres.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/phy.h>
+
+int __devm_mdiobus_register(struct mii_bus *bus, struct module *owner)
+{
+	int ret;
+
+	if (!bus->is_managed)
+		return -EPERM;
+
+	ret = __mdiobus_register(bus, owner);
+	if (!ret)
+		bus->is_managed_registered = 1;
+
+	return ret;
+}
+EXPORT_SYMBOL(__devm_mdiobus_register);
diff --git a/include/linux/phy.h b/include/linux/phy.h
index b693b609b2f5..4935867f024b 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -313,20 +313,9 @@ static inline struct mii_bus *mdiobus_alloc(void)
 }
 
 int __mdiobus_register(struct mii_bus *bus, struct module *owner);
+int __devm_mdiobus_register(struct mii_bus *bus, struct module *owner);
 #define mdiobus_register(bus) __mdiobus_register(bus, THIS_MODULE)
-static inline int devm_mdiobus_register(struct mii_bus *bus)
-{
-	int ret;
-
-	if (!bus->is_managed)
-		return -EPERM;
-
-	ret = mdiobus_register(bus);
-	if (!ret)
-		bus->is_managed_registered = 1;
-
-	return ret;
-}
+#define devm_mdiobus_register(bus) __devm_mdiobus_register(bus, THIS_MODULE)
 
 void mdiobus_unregister(struct mii_bus *bus);
 void mdiobus_free(struct mii_bus *bus);
-- 
2.26.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
