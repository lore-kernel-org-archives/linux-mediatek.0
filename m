Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A6CC54E8D
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 15:10:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F96120736
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 15:10:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ecmXcsSy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="SmAkdPP0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F96120736
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=osO2TCvHBkrbO6lMt3k/WsYCbtBaGadsq7UvqjOYOck=; b=ecmXcsSyjyM/fb
	962p5rISzakDu1lAoFKYWONPGykA1qv4hlk8OuHa7D4b5ye96fTgMONxIHwPG/MTImZ+pYUi1HXOH
	yCv2UmqrEHl+847qkz0/E+zShstLe39cBOVU+CxtbiML9P56wsebGqEk02aySnVXXa6fs8912GWqr
	lcpd9jCjQcjVR49y7bw07i3Xwr0Wadc+Ue7F3++IO+hQNLGJCqAdrOcHw7K/gcm9X7jgHk1dj5zpa
	HKvhjWJL/m5RhCcEnbmZj7O5QgKpKUtnYpUapB36lVPWKDLvTFsmkhGLPzImAMiV7kIEjihhf98CA
	vXGt+0WtFAc5n6IljKPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYA4f-0006o0-Mm; Mon, 11 May 2020 15:10:33 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYA2f-0002Xn-U7
 for linux-mediatek@lists.infradead.org; Mon, 11 May 2020 15:08:31 +0000
Received: by mail-wr1-x444.google.com with SMTP id l11so5512756wru.0
 for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2020 08:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s+yFWYJIlSICmhm10tVUfzLOMvlRQ6VDJMbx/0w2dnM=;
 b=SmAkdPP0jE3BYbiFt3lr72UkgHGUkjSuQm8bShe2tuyqXAzuCPDMDQyUFfoOcYJxQs
 X7/hfnmrZ+3CGGpg5PAx2pLMmsfVTHITKCgA78xfZKArQcBdLdGVSnXyQfRv4vZAamdc
 RfDgo6F0cOb2UUeOG5mKdiFwvngZ3aH5syHFicWSY33HRBFa3qPiMGALIb8BvnG2u1bm
 cGswP3fLQrQy3OVd8IY2Dba85GQi0ALNEgc0nfOq6XDhNG0SZ9nr4FjwHlHP2P0DAwKr
 ONbhAO+gxjP8fAt48rrAMTfhwY4oH+c1hpajtaunQsYwUq88GljRM6Frp4Okd3EgPbDo
 qsjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s+yFWYJIlSICmhm10tVUfzLOMvlRQ6VDJMbx/0w2dnM=;
 b=AmoN1+4cUtsOPfm2lVgBZl5Vj43I3ItvEHN8v/hBVC666iixST9EHxA86/+GgxVEma
 /sK3T9jke4LHUtxJrBgvpXOzQuv24421FqgMnY81eAN4c2asX7JgMvB5aUGFKroroU2P
 Qn39kCHqDxxcBfaPDM5gvP0lfoYB7RlwNLLvXEBCPmlzB7UndjKn1NBV+qC0WGz8rK37
 I9z0Krh1Gak7Z7HQ1b70j/WhWqh/NJBow2QHsNPugbdfQfNqVIPqlIpVlfu9/ejh4rS5
 RNW4pNWEF8+kIiTIsYCLKxH1hgfWF/YmnF7Lfus4UXKFgIvxIFY5z40aearG8xioMplJ
 bVAg==
X-Gm-Message-State: AGi0PuZKK7NH6zyBh1nutvNl1JR9CZL/Pzc8v2U2W2perVl6LtCaiRn9
 vJjKrlLJ5huPZzT4pfdjmT3aHw==
X-Google-Smtp-Source: APiQypL7U7FCIqoR+5fUOgb8Brn5/csPmcNbtYR6D1nX6AB5HzyaBv4cbIHTLjGUWxF2dpbb9P2Sig==
X-Received: by 2002:adf:9264:: with SMTP id 91mr19344203wrj.362.1589209708479; 
 Mon, 11 May 2020 08:08:28 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id 94sm3514792wrf.74.2020.05.11.08.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 08:08:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Fabien Parent <fparent@baylibre.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Edwin Peer <edwin.peer@broadcom.com>
Subject: [PATCH v2 06/14] net: move devres helpers into a separate source file
Date: Mon, 11 May 2020 17:07:51 +0200
Message-Id: <20200511150759.18766-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200511150759.18766-1-brgl@bgdev.pl>
References: <20200511150759.18766-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_080830_053921_344CE200 
X-CRM114-Status: GOOD (  15.08  )
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

There's currently only a single devres helper in net/ - devm variant
of alloc_etherdev. Let's move it to net/devres.c with the intention of
assing a second one: devm_register_netdev(). This new routine will need
to know the address of the release function of devm_alloc_etherdev() so
that it can verify (using devres_find()) that the struct net_device
that's being passed to it is also resource managed.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 net/Makefile       |  2 +-
 net/devres.c       | 36 ++++++++++++++++++++++++++++++++++++
 net/ethernet/eth.c | 28 ----------------------------
 3 files changed, 37 insertions(+), 29 deletions(-)
 create mode 100644 net/devres.c

diff --git a/net/Makefile b/net/Makefile
index 07ea48160874..5744bf1997fd 100644
--- a/net/Makefile
+++ b/net/Makefile
@@ -6,7 +6,7 @@
 # Rewritten to use lists instead of if-statements.
 #
 
-obj-$(CONFIG_NET)		:= socket.o core/
+obj-$(CONFIG_NET)		:= devres.o socket.o core/
 
 tmp-$(CONFIG_COMPAT) 		:= compat.o
 obj-$(CONFIG_NET)		+= $(tmp-y)
diff --git a/net/devres.c b/net/devres.c
new file mode 100644
index 000000000000..c1465d9f9019
--- /dev/null
+++ b/net/devres.c
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * This file contains all networking devres helpers.
+ */
+
+#include <linux/device.h>
+#include <linux/etherdevice.h>
+#include <linux/netdevice.h>
+
+static void devm_free_netdev(struct device *dev, void *res)
+{
+	free_netdev(*(struct net_device **)res);
+}
+
+struct net_device *devm_alloc_etherdev_mqs(struct device *dev, int sizeof_priv,
+					   unsigned int txqs, unsigned int rxqs)
+{
+	struct net_device **dr;
+	struct net_device *netdev;
+
+	dr = devres_alloc(devm_free_netdev, sizeof(*dr), GFP_KERNEL);
+	if (!dr)
+		return NULL;
+
+	netdev = alloc_etherdev_mqs(sizeof_priv, txqs, rxqs);
+	if (!netdev) {
+		devres_free(dr);
+		return NULL;
+	}
+
+	*dr = netdev;
+	devres_add(dev, dr);
+
+	return netdev;
+}
+EXPORT_SYMBOL(devm_alloc_etherdev_mqs);
diff --git a/net/ethernet/eth.c b/net/ethernet/eth.c
index c8b903302ff2..dac65180c4ef 100644
--- a/net/ethernet/eth.c
+++ b/net/ethernet/eth.c
@@ -400,34 +400,6 @@ struct net_device *alloc_etherdev_mqs(int sizeof_priv, unsigned int txqs,
 }
 EXPORT_SYMBOL(alloc_etherdev_mqs);
 
-static void devm_free_netdev(struct device *dev, void *res)
-{
-	free_netdev(*(struct net_device **)res);
-}
-
-struct net_device *devm_alloc_etherdev_mqs(struct device *dev, int sizeof_priv,
-					   unsigned int txqs, unsigned int rxqs)
-{
-	struct net_device **dr;
-	struct net_device *netdev;
-
-	dr = devres_alloc(devm_free_netdev, sizeof(*dr), GFP_KERNEL);
-	if (!dr)
-		return NULL;
-
-	netdev = alloc_etherdev_mqs(sizeof_priv, txqs, rxqs);
-	if (!netdev) {
-		devres_free(dr);
-		return NULL;
-	}
-
-	*dr = netdev;
-	devres_add(dev, dr);
-
-	return netdev;
-}
-EXPORT_SYMBOL(devm_alloc_etherdev_mqs);
-
 ssize_t sysfs_format_mac(char *buf, const unsigned char *addr, int len)
 {
 	return scnprintf(buf, PAGE_SIZE, "%*phC\n", len, addr);
-- 
2.25.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
