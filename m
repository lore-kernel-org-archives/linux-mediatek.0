Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A34C54E8D
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 15:11:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98EC320736
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 15:11:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JSfmbcSc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="TS/jxxw2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98EC320736
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xeKardh/GTb6NTkIcPcEUFgnUQPVfYITjVFtAN/Rhf8=; b=JSfmbcSc+LMJ0G
	IzJie/YceJ32cbsng0jBNzp8Ce8X/sC6BUzUhGGTBjIb3BtWjq3lTfMy0CMzGhPCmm6r4qnn/RmiB
	gt3G4/6ep8fjgi7TgUup/AqUr3rUrtklVJsXfUPjb+gBRmYA9xFxeFzPg5RmnbA+Hayol8i2YayrP
	fK9ZMBx+X6e/3WIUVaZegNtLySVEtGMKuKZxgib4ti8OLoKiizfNIEtqvvTNq8QTRo6+0YzhQQ27v
	ykuhNByGqUsojIJwhpvYYYHeXJylq1DmSHYVzv3zLhdstbejeyocIX9KiLGBsqlz/c80X0D25SFpj
	ysgvLNJfYMIkhg8lOtLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYA4w-00075f-99; Mon, 11 May 2020 15:10:50 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYA2i-0002Zk-2Q
 for linux-mediatek@lists.infradead.org; Mon, 11 May 2020 15:08:33 +0000
Received: by mail-wm1-x341.google.com with SMTP id z72so10107476wmc.2
 for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2020 08:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=85LArQ1FkfasqQwvTGBUsmFOdZ74xT3FAzPREvSXT3E=;
 b=TS/jxxw2AM8c/MW/14NfrNB+SUbDqKCeR6Tz9KN+jE/qC/yYIXQFmcqxM1np2Xwhd1
 6HzzHOawVFx9Avhhy9m+y8TIrHmrRiIGgsdRGMba4aTqK1P3Std1fQ15kyhU37lGQ4Gd
 /blU29VDw8JrGSg8cn8jWRHVrLGz1I02RRR881foQUGlY83hYx6HEVM8++7zYk9AB2gK
 kCA8E+nT8RvG/vdg9BjOvynD4T+aWghR+0uibegwQAvlB7FNBaDmFNw22bU9G5Dh38Sa
 blrzdx+xnrmAR8BnZBhhos2friW6xXn07zxAXVWX+4YWhBxExBXWL9JMoRRwyxerZJMn
 S1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=85LArQ1FkfasqQwvTGBUsmFOdZ74xT3FAzPREvSXT3E=;
 b=X32yOe/SoNS7ygAJ1aA+QYUaeYGSn5RWoLGosflHibLq82QoUDioNGWbrqO9h2ya/t
 Kjee66a8SHHezwDnqqkOo/iq0JgkyJIgZBhkQSv2SQ82p5VJP+awXALA43gx2dFWqzah
 f5amlXQckriK22VKpvhiOONMAA4GbmAvcsngG1YmnYQKUq84LmmgmXG+226igjns7CCf
 +SImA5X7H+1kBeQ+7QjKlsrLFc3OEKWZgtEdKTAg3uSexc6BIdhzE9g1CEbrEx6BGAeS
 Sl9EZvLkelQxIavbVsOtSZdU2mA1f5qOjnYLqNNuoi0R+Iv13dSkfylxMpF40IUv5gQa
 fN4w==
X-Gm-Message-State: AGi0PuYBI5p+g5AUVJfxVRDi9T9unoM5voe6cFOHuyxpZBsn7NM+djo/
 3+N+G6uVhEaBQJXIBqTf+bSvuw==
X-Google-Smtp-Source: APiQypIUoY5y9pMCyWMprTL71A7BiL4tQc7BbrlTT1FoaZIkxIS6pMCmPRg9IsmwTOLUcwtTuQxL3g==
X-Received: by 2002:a1c:abc3:: with SMTP id u186mr31368123wme.42.1589209710040; 
 Mon, 11 May 2020 08:08:30 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id 94sm3514792wrf.74.2020.05.11.08.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 08:08:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Fabien Parent <fparent@baylibre.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Edwin Peer <edwin.peer@broadcom.com>
Subject: [PATCH v2 07/14] net: devres: define a separate devres structure for
 devm_alloc_etherdev()
Date: Mon, 11 May 2020 17:07:52 +0200
Message-Id: <20200511150759.18766-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200511150759.18766-1-brgl@bgdev.pl>
References: <20200511150759.18766-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_080832_187697_EFC9C990 
X-CRM114-Status: GOOD (  11.44  )
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
