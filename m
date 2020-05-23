Return-Path: <SRS0=+XBv=7F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3194C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 May 2020 13:28:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40D8420727
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 May 2020 13:28:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QF2G8aGW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="mp9fRUIz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40D8420727
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xeKardh/GTb6NTkIcPcEUFgnUQPVfYITjVFtAN/Rhf8=; b=QF2G8aGWAPzQOv
	Xcj8FAvdXZcgFrgGPyU3T3i7Cn25E2IThClO+ThUx96P/bTGkXNJxD/bVe/r8ktLeVNjDLBLfCUt1
	iRs0osMHdhKQqm7YMFAG9NuIRplkHPmiEIARxifp38ykr0aEfqAJwZm/YQtWorJU4PxA9KJmjt2B3
	9St2eVkZ54n5/y32pBQMKXlkfU5JKHfqDWnvv5znGCet92Y/MBxSwJlqOWKMnhLkWCB5RdwVjIIpY
	qTm9ujdV1hKMEJ48HGT/0RGc3DQ0cOylZNLyu64u8jg2QN2U0mSccYTBT/BmExYs42jaskONdYks+
	XLFD/cVY5tirx3O5a9kw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcUCj-00044B-GF; Sat, 23 May 2020 13:28:45 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcUBS-0002xv-35
 for linux-mediatek@lists.infradead.org; Sat, 23 May 2020 13:27:28 +0000
Received: by mail-wm1-x344.google.com with SMTP id g14so6159276wme.1
 for <linux-mediatek@lists.infradead.org>; Sat, 23 May 2020 06:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=85LArQ1FkfasqQwvTGBUsmFOdZ74xT3FAzPREvSXT3E=;
 b=mp9fRUIz3f7zzigyw8CU4tWQdJuD/cNnqmRAvK/VRG+g0juXIdGy1ACtv8QzDSAVvX
 zZTtdlmptVqzrDUoGctCNcVv+sp+kvHHQLKobjmUSABO5WlVbnS7ZjDu5eL8ghHSECVm
 K66u1sz1Vvr9cojS1puCVm7MHqwqSP+KeNpcs0Ikin3L/OSp6a6ja1mHMqLhXZ7QSF33
 cmQ40C5Sb89UJ4E1ZZShWVrrBxftRA6RfclHz/BjVeWTuoRi2J+VvqnLv5AlUcR7mc7l
 F0zaODP7z0PlC5yJ+Y5QhZw5HjxWCqux45s0hgaopOwzgqaGcyNlp2dO1XJ/1y0vfKmZ
 FmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=85LArQ1FkfasqQwvTGBUsmFOdZ74xT3FAzPREvSXT3E=;
 b=o4IEKyHTlrD0WF7OOceS3wGi2W3ZRcu3Ihwk06u594KlRQ2F1ZgAnHpwJkrFN4TFiA
 jmZ5/QjL6zWD2gosBzPLmKwL9N6oshfVkKbRn5JrBEA4sXGZZ/w9VUKerFwpWUV17IFm
 6XwFKtBurm8o4DRsNwx/TniDByk3ArvkRdps53OwDxaQrVM4dt4CTrx2D/tgqbPUvtgM
 UUoL2FZtwlgta0gCnlcuDLEBpZbk9LoCGTCKidg9gLLMj/dCdATv5dL/ETPiYtbKJATV
 DpI8NDwwj3WxaSoOJzamX4LDfyJIJgP8e47yp9BlyB2xu1Tt3+aWpyINCZMjWSIvBtAu
 WHEw==
X-Gm-Message-State: AOAM533yWyYOGgfCYVL6j12/su2cWFQsO7hqzZK3FR2TvNsMBsQ6Y0kv
 llIuDVdzX2qPjGVxppVT9C6jsg==
X-Google-Smtp-Source: ABdhPJw0PA+P0HcUXiWXYQRZQG2lReeBtiQJfZFPYkFAcWtI7Dg+DCbBae2YfDUJLHDk1mI3Rm2NpA==
X-Received: by 2002:a1c:acc8:: with SMTP id
 v191mr18521019wme.154.1590240443748; 
 Sat, 23 May 2020 06:27:23 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id g69sm8098703wmg.15.2020.05.23.06.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 May 2020 06:27:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Jonathan Corbet <corbet@lwn.net>, "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Fabien Parent <fparent@baylibre.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Edwin Peer <edwin.peer@broadcom.com>
Subject: [PATCH v2 3/5] net: devres: define a separate devres structure for
 devm_alloc_etherdev()
Date: Sat, 23 May 2020 15:27:09 +0200
Message-Id: <20200523132711.30617-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200523132711.30617-1-brgl@bgdev.pl>
References: <20200523132711.30617-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200523_062726_140550_88CCCE40 
X-CRM114-Status: GOOD (  11.31  )
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
