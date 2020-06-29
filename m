Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E498AC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 12:04:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0CD523D20
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 12:04:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3gLwo6YA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="GHZrNXAb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0CD523D20
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eAXzZX4UC+I7OTdaofPENVXdPOgIbq0oaA7Q9prR9lM=; b=3gLwo6YAl3OqWy9CEgE8Q5i9l
	jzXIbWV8L6AWg8H6EvWmzNhEG5ZWCKgIU+CPQiSK3u9G7q8Ei+PKfZO+nyxGTG8FsoyzMk2WkG+Lz
	0Mc0yhHgSbkFpeFTY7sZIllUy6d0SWabI86s8zqP51IH6iLpEnXcJa5hDEi9JlWpmye1nHVkSfIFk
	B/lrp7oje+YeFFPR32ToCnw8DFHsw1+8aCJrs84T7ait8SmoSDx4zWtubVgP+IVxpE7iX6LFlhW4p
	DK6ujlscyLWPG7GVMou3baKCZP+VouUyAXq5U8D8N+gmPSBIaFEwRhyludY4Lh38q73c3wDTrJ7t+
	PKjWvwlAw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpsWf-0008C5-73; Mon, 29 Jun 2020 12:04:41 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpsWE-000819-Sr
 for linux-mediatek@lists.infradead.org; Mon, 29 Jun 2020 12:04:16 +0000
Received: by mail-wm1-x341.google.com with SMTP id 22so15124136wmg.1
 for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2020 05:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nZJ9RrYkX//UjOI/5YYylQYoHuaDDR4YnVJY1VbZiK8=;
 b=GHZrNXAbixM8hIlftssrgQxdDlC2R8smynvTThHUqsGw3QGlkt8NhoPhAOcQQGzRtw
 8UiJW8UelWWaFm3hR3IBZDUiETIQ4cw/d0cKQJ2t1YCJDD+35seh4iu5J6/ZnfNA9Cf2
 0PVuY8rWNQGb4TJy8iFdvM58AtK7sHgm7tkKp+d8JruntQqh4/uEGDPUikx3v8VCVX/X
 t0nKty1pn7Dat78dI2BiItZ4JxBDOUehXZ0nt2E9AXLK4007faqBTbkxlHvbnLr9M2so
 H+SDo8uHBGYBqIx7PHreVr5lgWWgBQR/mjyFndySyTN3eQfiaXuMtvjj/R5CALJQPX52
 cZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nZJ9RrYkX//UjOI/5YYylQYoHuaDDR4YnVJY1VbZiK8=;
 b=YLhIPRjbwRbKVxRHG/XRmkxXmbgYeersa40n/XD7oRYVWFwAvKKGhoFpfobS1N5C4Z
 PlEwVSFG20t38LbLQC1/TU04Mlysrud6qGlOX0UXq9c/tSQMyRezHTy0V1AHEDfMwhr1
 kpkwm0njxWhbrB+9KyKOhYX2EgrKiMvfrSwwTrrYQk3gZX5e3+N6sFIooNl8Nd6TbKUR
 HhKI3yoClkaVO4GI9SUJewJvtwRwk1vMx0yuckNwAf6COwuPpJJNz803w/c0tuNRy4eU
 o3jQZzt8BneZw3F/ujxghvOtNPBo8iPIJko5Vj9SzHgYGiL2r9cgHQ6pg9rXKn9cDPtP
 0uOA==
X-Gm-Message-State: AOAM533IzfhIlfLUvF+5UqEAzg0d7ZCchxVFZ4HjaHwwbgm1ad9t2p36
 nrWlvq7QHIEAXNY5fAN73X/sYw==
X-Google-Smtp-Source: ABdhPJxPsnR1q89EpF5XRsu5RI2Mrvn6hFviI2UQaVTUzem4LR886XkHZ07utmAJlfbggOLXkkyVfg==
X-Received: by 2002:a7b:c381:: with SMTP id s1mr17268979wmj.25.1593432254093; 
 Mon, 29 Jun 2020 05:04:14 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id d81sm25274347wmc.0.2020.06.29.05.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 05:04:13 -0700 (PDT)
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
Subject: [PATCH v2 02/10] net: ethernet: ixgbe: don't call devm_mdiobus_free()
Date: Mon, 29 Jun 2020 14:03:38 +0200
Message-Id: <20200629120346.4382-3-brgl@bgdev.pl>
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

The idea behind devres is that the release callbacks are called if
probe fails. As we now check the return value of ixgbe_mii_bus_init(),
we can drop the call devm_mdiobus_free() in error path as the release
callback will be called automatically.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/net/ethernet/intel/ixgbe/ixgbe_phy.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_phy.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_phy.c
index 2fb97967961c..7980d7265e10 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_phy.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_phy.c
@@ -905,7 +905,6 @@ s32 ixgbe_mii_bus_init(struct ixgbe_hw *hw)
 	struct pci_dev *pdev = adapter->pdev;
 	struct device *dev = &adapter->netdev->dev;
 	struct mii_bus *bus;
-	int err = -ENODEV;
 
 	bus = devm_mdiobus_alloc(dev);
 	if (!bus)
@@ -923,7 +922,7 @@ s32 ixgbe_mii_bus_init(struct ixgbe_hw *hw)
 	case IXGBE_DEV_ID_X550EM_A_1G_T:
 	case IXGBE_DEV_ID_X550EM_A_1G_T_L:
 		if (!ixgbe_x550em_a_has_mii(hw))
-			goto ixgbe_no_mii_bus;
+			return -ENODEV;
 		bus->read = &ixgbe_x550em_a_mii_bus_read;
 		bus->write = &ixgbe_x550em_a_mii_bus_write;
 		break;
@@ -948,15 +947,8 @@ s32 ixgbe_mii_bus_init(struct ixgbe_hw *hw)
 	 */
 	hw->phy.mdio.mode_support = MDIO_SUPPORTS_C45 | MDIO_SUPPORTS_C22;
 
-	err = mdiobus_register(bus);
-	if (!err) {
-		adapter->mii_bus = bus;
-		return 0;
-	}
-
-ixgbe_no_mii_bus:
-	devm_mdiobus_free(dev, bus);
-	return err;
+	adapter->mii_bus = bus;
+	return mdiobus_register(bus);
 }
 
 /**
-- 
2.26.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
