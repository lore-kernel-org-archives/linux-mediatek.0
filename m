Return-Path: <SRS0=i2Ig=7C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B68A7C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 11:46:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87E8420657
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 11:46:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FIeBw2P6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="QKJkcBbx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87E8420657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xeKardh/GTb6NTkIcPcEUFgnUQPVfYITjVFtAN/Rhf8=; b=FIeBw2P6/+GGIv
	vuS29+dzbhZ3olg/KoX2LsUDQaascB6N1lV5B/zppuP9DnTgL1KXwVpxeIgN1v1lFF8qLHCee8QBO
	Q4Nv0Lx8oQ9O7TCdb94TUA5JTYpD6aesd+AwVdKo0jvmO6lNhC6aWeiIa/bhPf3HhVENgQUULYpS5
	keWAyuwXmLFKuaR+P1gnR5qbK2XiegKWVzozHjLmGVz05mtOMNoscaBnyw7osOA3V3TdE3XLzt6It
	GZbvNl9SvgkUZ4AZkD20u1DyTdxwBmU950z0dBsMoT+fbiYXY7b2ISKKbSwvU4xmx2AqrJb+DGfQV
	7jPBt3JqrgllqHh0D7AA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbNAa-0007gt-TV; Wed, 20 May 2020 11:45:56 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbN99-0004EM-JS
 for linux-mediatek@lists.infradead.org; Wed, 20 May 2020 11:44:29 +0000
Received: by mail-wr1-x441.google.com with SMTP id e1so2816352wrt.5
 for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2020 04:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=85LArQ1FkfasqQwvTGBUsmFOdZ74xT3FAzPREvSXT3E=;
 b=QKJkcBbxZWCWLDG+YrYnBrkZXE/At601H5ASh1l5Ykv2TDwcxDwOGjyKJsXAUk5Ye6
 u9JtDQ7XjNeR8tEvIJPP7Dsnsf/DOUsYU0eQ1O9/8p1dFPiOjfYAQ7gs2/qv2DaWHJ4Z
 +jOzPTB+Cruz1bL6UuIiAubhlBSrq+VRpYTp04Nj55Wj8pVVVjXig9kitcMgGZ6q0YvQ
 bCZ6WMB0VizDGqrwGTeiW4x63tgAFYMpcxaw2qIfhl5iQEgvmZEXm6jEeFI3aaICjzzO
 G6Pxsib9tcNmBDhDTDV6DZqfrqxl3owEhBwBZOZpvRW9LCq4ua/rZhJZEuW9j91e6Zup
 IrBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=85LArQ1FkfasqQwvTGBUsmFOdZ74xT3FAzPREvSXT3E=;
 b=NkUpkheSSc0GZW1laa5qBzLv7su2VBJrV370D+Q2h/fKPCkRzHskAyLrhlSxl+vcMJ
 Lj4pByEPanbJFUVBrNi1JdCZBlFZh5be9vgd4uVqFNITngB2g2zWOqfGuA2Zd9lM6SKS
 D8uCct3OFgucuOu5YpBhRF5Rq1DO5R5uK1EWWFyxO1GSJfSxs28F7GoHUMJ7+dB1epX7
 D90I9FEIFbpBzC4nBA+arS6O0lae94ZOel1GWRi46OezvQxhZ85YHU4O+/qLJ/FSNnsj
 aZtNiGCfQoUookHvJxIIToS566k+t4Xf98bVT7sOE2GcjWCOxlG+m7lk4R5czvZt1MHb
 fjUQ==
X-Gm-Message-State: AOAM533nRCLbeE82VaQvgqfqSlHYk3CBd+kVSWm/bCaUYHMm6+Y46/kJ
 IlADrv+vXKaql8BTCAij4D/u7A==
X-Google-Smtp-Source: ABdhPJypM/wspBT4F6w8EO4JCWTG6tul8aOv8l7s4hm9WSskupdfPjKVvCbnp9cT4bd0cBC63dS4xg==
X-Received: by 2002:adf:9447:: with SMTP id 65mr3890042wrq.331.1589975066452; 
 Wed, 20 May 2020 04:44:26 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id q2sm2530782wrx.60.2020.05.20.04.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 04:44:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Jonathan Corbet <corbet@lwn.net>, "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Fabien Parent <fparent@baylibre.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Edwin Peer <edwin.peer@broadcom.com>
Subject: [PATCH 3/5] net: devres: define a separate devres structure for
 devm_alloc_etherdev()
Date: Wed, 20 May 2020 13:44:13 +0200
Message-Id: <20200520114415.13041-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200520114415.13041-1-brgl@bgdev.pl>
References: <20200520114415.13041-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_044427_669486_F72B4E0B 
X-CRM114-Status: GOOD (  11.41  )
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
Cc: devicetree@vger.kernel.org,
 Stephane Le Provost <stephane.leprovost@mediatek.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-mediatek@lists.infradead.org,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 Pedro Tsai <pedro.tsai@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Not using a proxy structure to store struct net_device doesn't save
anything in terms of compiled code size or memory usage but significantly
decreases the readability of the code with all the pointer casting.

Define struct net_device_devres and use it in devm_alloc_etherdev_mqs().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 net/devres.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/net/devres.c b/net/devres.c
index c1465d9f9019..b97b0c5a8216 100644
--- a/net/devres.c
+++ b/net/devres.c
@@ -7,30 +7,34 @@
 #include <linux/etherdevice.h>
 #include <linux/netdevice.h>
 
-static void devm_free_netdev(struct device *dev, void *res)
+struct net_device_devres {
+	struct net_device *ndev;
+};
+
+static void devm_free_netdev(struct device *dev, void *this)
 {
-	free_netdev(*(struct net_device **)res);
+	struct net_device_devres *res = this;
+
+	free_netdev(res->ndev);
 }
 
 struct net_device *devm_alloc_etherdev_mqs(struct device *dev, int sizeof_priv,
 					   unsigned int txqs, unsigned int rxqs)
 {
-	struct net_device **dr;
-	struct net_device *netdev;
+	struct net_device_devres *dr;
 
 	dr = devres_alloc(devm_free_netdev, sizeof(*dr), GFP_KERNEL);
 	if (!dr)
 		return NULL;
 
-	netdev = alloc_etherdev_mqs(sizeof_priv, txqs, rxqs);
-	if (!netdev) {
+	dr->ndev = alloc_etherdev_mqs(sizeof_priv, txqs, rxqs);
+	if (!dr->ndev) {
 		devres_free(dr);
 		return NULL;
 	}
 
-	*dr = netdev;
 	devres_add(dev, dr);
 
-	return netdev;
+	return dr->ndev;
 }
 EXPORT_SYMBOL(devm_alloc_etherdev_mqs);
-- 
2.25.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
