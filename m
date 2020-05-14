Return-Path: <SRS0=tiIh=64=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A51BFC433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 08:03:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6299720675
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 08:03:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nC/MM8Jf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="IQRdwUqx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6299720675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xeKardh/GTb6NTkIcPcEUFgnUQPVfYITjVFtAN/Rhf8=; b=nC/MM8JfQo6W68
	l1ShDUFPZgszkZmti7Z+0stMtjPnTG7WCZqLIiiLX9Zg1asdPgUMXOxJ7fok6yQU+QjGhKroD+LUX
	bIw+8/pRuPqaj9vqr5RI2EQLnfbSb4XusJORuf8jq+xnQVMxRFonuxoEcJnADMrGWpBpHb/ohKfDC
	641A5DogiCn0ojHPscR83Fe2wogWMNLTOA92yjYbb7FGpPYSyMyT5NYv1VSe63xfu4zxxk/TgOHVW
	C5zPZXKN1/5J3g7cWV7yan8rwaLL3AK5hLXggqaD8RNRrTNijkq2AC++/n8v6f0Ya3lVqAK14Z16P
	6X2Osr0mIJqCIJ5if4+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZ8pk-0006gY-SU; Thu, 14 May 2020 08:03:12 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZ8mv-0003s1-Qg
 for linux-mediatek@lists.infradead.org; Thu, 14 May 2020 08:00:20 +0000
Received: by mail-wm1-x341.google.com with SMTP id g12so31303422wmh.3
 for <linux-mediatek@lists.infradead.org>; Thu, 14 May 2020 01:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=85LArQ1FkfasqQwvTGBUsmFOdZ74xT3FAzPREvSXT3E=;
 b=IQRdwUqxDe1qZmT8TGQLkrpl0kAdWhdhH11prXOwPTmEcd2xi6nmcFvKSdcBT3IQZY
 yRnKMO5FeNSeCf+SCHtG/N/4bKqB7p81H8ghcz05gj2Pwf2vXgntZAeQYV3l/jTSdocQ
 dPvmZEAfuzM8MzlXRUqGd/E7rGt2F1n4TM7+DJ6RnqP3U6YcLUe8aja3Yta4IW17s6Yy
 75hKtwdXvy9YC8snlGNetXjHz8nQEW6rafZF9NDCUU81TSHgCWq6rR7UDqYLVqUB6G9Z
 NxP5Y6Yp69XPoqS88noAVJoG/kGfFrZT6SAC3hTLsFU30y07APR+K/lBdiKhePIkHvpT
 9Kfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=85LArQ1FkfasqQwvTGBUsmFOdZ74xT3FAzPREvSXT3E=;
 b=Fboqji7q7Ueg8znKk8eZju38qZ1D9jV7MItiI25pYGVLjyay3fx8LCSMtucduLH60R
 nTh5FeEWzPwMfzhOvcxrTSEafanYVq+P+0TOg9FgSgN8UEz0YXwWm/KKfCRE+1zEq/HF
 aFa9Q2u5L+uHEEAZ3DjFsqp3SqM30ADJ0pc/PXu0yWM5N3gCgGhfgN4uNg74J6AAXnZW
 4NIoDjcxu6s8m1EY2CQZ7X2YyrpoPfInNBngs8fGYxvKLwUCK2S8yx+p8Z0NG4M0Dxza
 ugECaKy2GdKwN+aCSISeXabzdAEgWWdBFwCX0QL1N8sU47927m28ZAnD4gL0H0OGCDF9
 aGiA==
X-Gm-Message-State: AGi0PuY3s8pZZFEeY8lXy79xxsVc7eylY1us4aYpgNMEitdO7vPGGrTY
 zgk0MXYl8oKY8nHH7I9SI++9gg==
X-Google-Smtp-Source: APiQypIY9tAfCpn2AmTAwgro/2JmYcI8xIK57P9eBIyeDsZ7PCcAdgUe8VkM1x3xFdmKrxvg6IG6Gg==
X-Received: by 2002:a7b:c5d4:: with SMTP id n20mr49059541wmk.92.1589443216067; 
 Thu, 14 May 2020 01:00:16 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id 81sm23337446wme.16.2020.05.14.01.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 01:00:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Fabien Parent <fparent@baylibre.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Edwin Peer <edwin.peer@broadcom.com>
Subject: [PATCH v3 08/15] net: devres: define a separate devres structure for
 devm_alloc_etherdev()
Date: Thu, 14 May 2020 09:59:35 +0200
Message-Id: <20200514075942.10136-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200514075942.10136-1-brgl@bgdev.pl>
References: <20200514075942.10136-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_010017_984170_4EA6EE93 
X-CRM114-Status: GOOD (  11.78  )
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
