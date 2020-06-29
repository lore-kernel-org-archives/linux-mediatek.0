Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA0CC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 12:05:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F362D23D21
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 12:05:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ui+iWnpE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="Lju5246x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F362D23D21
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7dIGonxH+YL7VzAJ8xGTjdztDl8lbGzL/iPWn7KoBbE=; b=Ui+iWnpEziWrFxfTLLIgHJnW2
	qUn/VR30ZqQvxSsc2Ece339yj3Y7fD1XZEsfbwLzx7A0+QRNn0F/BEu+Mghr+UGelT/nCYUzM/TTa
	uF6Jh+gjcZx1GWF+5l8EEYefpRf6n9I7bDM1hcq9E1c61Cz5KUdMC/cQK9rpSj3gh/2T/hVu3hNOX
	fKnA+iL5g8Y+/GcgzghXX3OH+1wQ0fLci/OXToJzrcWASASapTkipZcrPOnY2pbt7egz9wofBQMd4
	MPjrz5FkgErFVTU2tQxkCTN+XhKXn0XwLO6CmxMfugLBoV2111U5osaQ6CbAv5Wz2E4md1Z9M8iy3
	yVv0+dkbQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpsXI-00009w-T5; Mon, 29 Jun 2020 12:05:20 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpsWO-00086K-SF
 for linux-mediatek@lists.infradead.org; Mon, 29 Jun 2020 12:04:27 +0000
Received: by mail-wm1-x341.google.com with SMTP id 22so15124632wmg.1
 for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2020 05:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eg4utbhrf/3v6wZhuPotuFpmqRh7IC4ZAOzFVoP+DSU=;
 b=Lju5246xETI3n7x5ApaA2zIYYyPdv7uL89+PkXu5UmfdDnoJt/A+1kV4EnWbvWHsfT
 U0KiDkQo2C6/d8Ee7wMfJSSmn58uoqIdNiTjX8Hz5nTHyctnp2RJTz/wtYYsoJ+dtuhV
 XjmJm2KbsyS/VgCkUtqgfIB2Q8m9h6+TRtPh688uJ2bkMEAzy6TyrNqZ5+p0Jq6QQPRe
 TpitUFUM90jHaT+neQCa+q1jY5kpWoCkFluHE4al/HsV1lisaXYbrRjufnYUNHF7JcYD
 MtPNLz8KCHYZnMSa1RhX8WtsifRsmdGJ5BQYv8xh4yMTTQv22xrYgZ/0nqbMjj7pN0qH
 WHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eg4utbhrf/3v6wZhuPotuFpmqRh7IC4ZAOzFVoP+DSU=;
 b=fEQZheIeKhx2xZd6it6+tcIym3odXbRnzhzg3fZfohvpg9vvYMC3/v+RQ7IN3GkC2n
 +umfpdhl/Y1VnwE/LyCxBIXiKsDnsdgpxYd7wiVnXpicreJlQwysVkgtAeAqh1qMSAol
 /0vU4T+3usHIl97+mEfLkKWlbtAw3EdhcKWglHjAWNOx8IQGmXeb7szB6wQUlM93EW4N
 jw3FHH1NRdgIgQlH/WBXOIm2A+FsACw9lM/gFSVcdFGnNTrnG9B/bxCuDevpzc8ypnRa
 r8JmGTJ8gRUfqeTBKSIYyC4bSWg+UGSUieX+69jYi6DtRW18HM3vTTLFgzUgH9/oiwWf
 C/ZA==
X-Gm-Message-State: AOAM5308OoK07zvw00/YYzkEXr5g6DT5/Q6Hnx/nXK7nGjUsZ4f3pcJl
 aotSntAj6eiD/3X6ZoSbb+5GFg==
X-Google-Smtp-Source: ABdhPJyyXNydd+nOMTGEVlBmI0TP9I7QgzsG5vIU8vPWhBARI6Y2TnNfIwesmyvIGRb47dVl+VGcrA==
X-Received: by 2002:a7b:c3d0:: with SMTP id t16mr17776997wmj.117.1593432263901; 
 Mon, 29 Jun 2020 05:04:23 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id d81sm25274347wmc.0.2020.06.29.05.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 05:04:23 -0700 (PDT)
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
Subject: [PATCH v2 08/10] of: mdio: remove the 'extern' keyword from function
 declarations
Date: Mon, 29 Jun 2020 14:03:44 +0200
Message-Id: <20200629120346.4382-9-brgl@bgdev.pl>
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

The 'extern' keyword in headers doesn't have any benefit. Remove them
all from the of_mdio.h header.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 include/linux/of_mdio.h | 37 ++++++++++++++++++-------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/include/linux/of_mdio.h b/include/linux/of_mdio.h
index 0f61a4ac6bcf..ba8e157f24ad 100644
--- a/include/linux/of_mdio.h
+++ b/include/linux/of_mdio.h
@@ -12,27 +12,26 @@
 #include <linux/of.h>
 
 #if IS_ENABLED(CONFIG_OF_MDIO)
-extern bool of_mdiobus_child_is_phy(struct device_node *child);
-extern int of_mdiobus_register(struct mii_bus *mdio, struct device_node *np);
-extern struct phy_device *of_phy_find_device(struct device_node *phy_np);
-extern struct phy_device *of_phy_connect(struct net_device *dev,
-					 struct device_node *phy_np,
-					 void (*hndlr)(struct net_device *),
-					 u32 flags, phy_interface_t iface);
-extern struct phy_device *
+bool of_mdiobus_child_is_phy(struct device_node *child);
+int of_mdiobus_register(struct mii_bus *mdio, struct device_node *np);
+struct phy_device *of_phy_find_device(struct device_node *phy_np);
+struct phy_device *
+of_phy_connect(struct net_device *dev, struct device_node *phy_np,
+	       void (*hndlr)(struct net_device *), u32 flags,
+	       phy_interface_t iface);
+struct phy_device *
 of_phy_get_and_connect(struct net_device *dev, struct device_node *np,
 		       void (*hndlr)(struct net_device *));
-struct phy_device *of_phy_attach(struct net_device *dev,
-				 struct device_node *phy_np, u32 flags,
-				 phy_interface_t iface);
-
-extern struct mii_bus *of_mdio_find_bus(struct device_node *mdio_np);
-extern int of_phy_register_fixed_link(struct device_node *np);
-extern void of_phy_deregister_fixed_link(struct device_node *np);
-extern bool of_phy_is_fixed_link(struct device_node *np);
-extern int of_mdiobus_phy_device_register(struct mii_bus *mdio,
-				     struct phy_device *phy,
-				     struct device_node *child, u32 addr);
+struct phy_device *
+of_phy_attach(struct net_device *dev, struct device_node *phy_np,
+	      u32 flags, phy_interface_t iface);
+
+struct mii_bus *of_mdio_find_bus(struct device_node *mdio_np);
+int of_phy_register_fixed_link(struct device_node *np);
+void of_phy_deregister_fixed_link(struct device_node *np);
+bool of_phy_is_fixed_link(struct device_node *np);
+int of_mdiobus_phy_device_register(struct mii_bus *mdio, struct phy_device *phy,
+				   struct device_node *child, u32 addr);
 
 static inline int of_mdio_parse_addr(struct device *dev,
 				     const struct device_node *np)
-- 
2.26.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
