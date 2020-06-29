Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A294C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 12:04:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48AE823D20
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 12:04:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tDb3sTIN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="s9kteNeX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48AE823D20
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1P67U67BMn9kkUx5gBb3MANpLU1CfrXnfTQYSXUGXHw=; b=tDb3sTINXhMNmLHaEcAaT/eLd
	bj5xL569pI7lpTufuXyvivh7Dy2GL/xQFCxJZ5jNAJLym+M55YbWW/UMd1yPs1jwNcOWHzeELjuJr
	hHy/4AqMFbaEw2NlxZKWKGYKhPv+hezaHCQZdDF8v3HwkSuf9ffUjlTjXqfz9I5bxW6/qTlXS5VYH
	ArPzuMUvemYkD9mknNAoy/aVByRManAPU5MZ8cTbdqvsn/+Prd3YWJZ7J0l7asTdjh3aiqqJHcayq
	3AXWAJugbJaA7OxVyijWSg23BgQJ5XbbNgfPMGrPg4r7+8GKFjv4unygKKa3O+bRQvjR1CZPAjirT
	AwOPZiVrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpsWj-0008DC-46; Mon, 29 Jun 2020 12:04:45 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpsWH-00082L-VN
 for linux-mediatek@lists.infradead.org; Mon, 29 Jun 2020 12:04:19 +0000
Received: by mail-wm1-x341.google.com with SMTP id 22so15124285wmg.1
 for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2020 05:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kk4GqzupyJ/zMhEjt50iMo8E42JSASWwyoRhFrVXFkw=;
 b=s9kteNeXi1zTwB+iA/Da/H/SPwbWFgSRcTYjOhHXHWF3DK4DgkjnWLtB3kXWUYcT73
 hrQ3sZLr45ONRMe37aZJiaJZqvsJkdNy022pJEVyvesHs/Usys8f1PNEbBh/x2TgLjW5
 MzXNu61KMK8OAc8kI7zqSWj6yUSfkkAeWvduGtmpBPGg5zflFGTAloz+lI6SH8ZeyaF4
 fgHItffrSY9r+xFcjDC7cJKNDoYT11AD7qfDTq0LviqPvjIASWNkM3GOYEhgZi13/HMO
 nbFl97jRYhP8AwnmUe5P7dnadnS6u8YZj+1fWhK6Oe2uxf6rzW6Igdl90lnBrDHpjR5z
 NqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kk4GqzupyJ/zMhEjt50iMo8E42JSASWwyoRhFrVXFkw=;
 b=gSnNvGy3pUEX/Kd5LVplLID4rRk/iuCJHHqO6YRtxrkXA8DrIlossioxoPebBQCMCp
 DbXHUURO7/2cYnL94j7NMsxPiig+/hzWIevFKXeFQMZISnfHSrHyja9D7JkhEdj9ZK0B
 DWFIxKoYL7wNjBihTYndJP2TtwCbszZyfZHVTTiLFSHqAj44nyIEn8Tsz5wEDBVJaTma
 dnpnGXtZQon/ucJLWfj0aIbCuaaiKsCrWcMZreWgaXQZJtrzU9v98H0/JZPhu4ScUe3W
 utF4TPuTQXEhYY//oFSvr72Tw46G9D4NyuZqbQonz8QobiD3zo9gWMjTNvdB6rSPyvnB
 ZddQ==
X-Gm-Message-State: AOAM531A7nMMRBxvTPbWdRUsIVVCjObbK6b3lwXAqIr8PS4w5lzICwXZ
 yad+bovXJX3Fr2tpuPzf8di5WA==
X-Google-Smtp-Source: ABdhPJyWDqDeFgVInuObhpy/Ftb/2DR2R2EIJXvEfaNkWasvMTcTlNr2GvJFRYK1k6XxTkq/Wt9wfQ==
X-Received: by 2002:a1c:cc0d:: with SMTP id h13mr17832883wmb.168.1593432256110; 
 Mon, 29 Jun 2020 05:04:16 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id d81sm25274347wmc.0.2020.06.29.05.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 05:04:15 -0700 (PDT)
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
Subject: [PATCH v2 03/10] net: devres: rename the release callback of
 devm_register_netdev()
Date: Mon, 29 Jun 2020 14:03:39 +0200
Message-Id: <20200629120346.4382-4-brgl@bgdev.pl>
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

Make it an explicit counterpart to devm_register_netdev() just like we
do with devm_free_netdev() for better clarity.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 net/devres.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/devres.c b/net/devres.c
index 57a6a88d11f6..1f9be2133787 100644
--- a/net/devres.c
+++ b/net/devres.c
@@ -39,7 +39,7 @@ struct net_device *devm_alloc_etherdev_mqs(struct device *dev, int sizeof_priv,
 }
 EXPORT_SYMBOL(devm_alloc_etherdev_mqs);
 
-static void devm_netdev_release(struct device *dev, void *this)
+static void devm_unregister_netdev(struct device *dev, void *this)
 {
 	struct net_device_devres *res = this;
 
@@ -77,7 +77,7 @@ int devm_register_netdev(struct device *dev, struct net_device *ndev)
 				 netdev_devres_match, ndev)))
 		return -EINVAL;
 
-	dr = devres_alloc(devm_netdev_release, sizeof(*dr), GFP_KERNEL);
+	dr = devres_alloc(devm_unregister_netdev, sizeof(*dr), GFP_KERNEL);
 	if (!dr)
 		return -ENOMEM;
 
-- 
2.26.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
