Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E2CDC47255
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 15:11:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F32C20746
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 15:11:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P9oYxyPW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="yAQ17n5n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F32C20746
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NV8dzL+Hr4s0Q4DmMzpBJyomTGNr7HfTMHvMMMhRI2c=; b=P9oYxyPWpOwkqK
	tF42fhrW7FxE5DLm0v3ZlR638WXiiju2MDiLUbDbXH4EGIWdGQUgTAR5sIlD+0bju7M+MuGr7JlHu
	F8eVDURg4zHxQjudrJm4OareX0JWsP1iYF3q8ImreNvrQcTHn5aYAHTR/wYfget6Cng+OYQDlwkaT
	OEaAtKKa5hr9+fXMA5ej6/YZZ2xKSsqkh+F5+ILVO3ksd5r7yPcJl8d3H8c4V8V5O8A7Uz4Db3CAo
	nH3zAn6Plar9lSmZ5TXxnsX64x1323Fi/m3IMCctkf74yjttmMBjxnUYJJsheEt/cY09tPBp1pWYc
	5N2qwalTta1k3yX1rdSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYA4z-00078D-Mc; Mon, 11 May 2020 15:10:53 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYA2i-0002bK-R4
 for linux-mediatek@lists.infradead.org; Mon, 11 May 2020 15:08:34 +0000
Received: by mail-wm1-x341.google.com with SMTP id g12so19702604wmh.3
 for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2020 08:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JWd28US49vQEgzroCkPuJ7+0dlvqHFnp/0U0KdCKzj4=;
 b=yAQ17n5n0Nlko9kUD5JQSnw1SO35zKfJ9pXExg53viUdxqF46z7vVVUbrm9CWq90zL
 +HofwZUQ8AbrUTRLoP8u6HuvjPcGWT1dWbdMdcEI78zuOFvRNeUhJIX4AVRT7hVXwaHk
 XWusk6ttYjMboQZLrX8kOFDqUbovXiFSXfu65aAk2VN4fPdxjQc0gOha7ctZgiP0eOGx
 dF3x26U8pZeznqL5/e98wKIPJGv1G8lqk4flKSM8JrivLFxREQL3SIRzc9H2gzU6YiwM
 I3OTfRJjC6rxKB4a9taLddxcX1g6NaMR3yg3mW3DPp2Wdo1cxWQOBlb6ABfVCkV2cl/0
 57Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JWd28US49vQEgzroCkPuJ7+0dlvqHFnp/0U0KdCKzj4=;
 b=nNLpVD/s0MNX+su8g9L8/LvGUzXLGtRNksr8uwA+lV+VRMBL+nysNzRCNUCuf94nRT
 0dxdge2qKR81UT2iAN52CF5CUhIQ0NhIuQAF2PKKaN82Y7/fikrFSXKIFFzlQg/WtOXM
 zGOXfJ3Q6dNWb4vjviNjkSfLU6RrhvQu6yshlz7ZqfJBQkj0jI8DbaZMk5U5rpvwyO1U
 XclvavrSNr3WNQwFVunSVEYhYywmn9em7fgmouzTAov68MxQQNEefnmZVf4a9Wdocv1W
 x30IFS/oRMyKuH62Uqa7wa9y6EllF2y+9DXH/zPVw1TZ6w5hYL9fEUo2AR9fAJUEumMw
 G5FA==
X-Gm-Message-State: AGi0PuZD6Wz8WSUqQyHD0DrCMn2m9IlFBlv2tkZVHEc6UlUB4d8S5sGx
 Kz1XHltj2DwjXxhMfp1nZ+e1dA==
X-Google-Smtp-Source: APiQypJeAulXahA6ibdKhNLx3DmiIqJmPwxXGG8leQ4jK/xVuJNuMwJOUsf0YZ2hS4FiT/g7qkEqmg==
X-Received: by 2002:a1c:790e:: with SMTP id l14mr31328411wme.174.1589209711412; 
 Mon, 11 May 2020 08:08:31 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id 94sm3514792wrf.74.2020.05.11.08.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 08:08:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Fabien Parent <fparent@baylibre.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Edwin Peer <edwin.peer@broadcom.com>
Subject: [PATCH v2 08/14] net: devres: provide devm_register_netdev()
Date: Mon, 11 May 2020 17:07:53 +0200
Message-Id: <20200511150759.18766-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200511150759.18766-1-brgl@bgdev.pl>
References: <20200511150759.18766-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_080832_937983_AE3AA117 
X-CRM114-Status: GOOD (  12.92  )
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

Provide devm_register_netdev() - a device resource managed variant
of register_netdev(). This new helper will only work for net_device
structs that are also already managed by devres.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 include/linux/netdevice.h |  2 ++
 net/devres.c              | 55 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 933c6808a87f..d3d1b9251ae5 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -4220,6 +4220,8 @@ struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
 int register_netdev(struct net_device *dev);
 void unregister_netdev(struct net_device *dev);
 
+int devm_register_netdev(struct device *dev, struct net_device *ndev);
+
 /* General hardware address lists handling functions */
 int __hw_addr_sync(struct netdev_hw_addr_list *to_list,
 		   struct netdev_hw_addr_list *from_list, int addr_len);
diff --git a/net/devres.c b/net/devres.c
index b97b0c5a8216..57a6a88d11f6 100644
--- a/net/devres.c
+++ b/net/devres.c
@@ -38,3 +38,58 @@ struct net_device *devm_alloc_etherdev_mqs(struct device *dev, int sizeof_priv,
 	return dr->ndev;
 }
 EXPORT_SYMBOL(devm_alloc_etherdev_mqs);
+
+static void devm_netdev_release(struct device *dev, void *this)
+{
+	struct net_device_devres *res = this;
+
+	unregister_netdev(res->ndev);
+}
+
+static int netdev_devres_match(struct device *dev, void *this, void *match_data)
+{
+	struct net_device_devres *res = this;
+	struct net_device *ndev = match_data;
+
+	return ndev == res->ndev;
+}
+
+/**
+ *	devm_register_netdev - resource managed variant of register_netdev()
+ *	@dev: managing device for this netdev - usually the parent device
+ *	@ndev: device to register
+ *
+ *	This is a devres variant of register_netdev() for which the unregister
+ *	function will be call automatically when the managing device is
+ *	detached. Note: the net_device used must also be resource managed by
+ *	the same struct device.
+ */
+int devm_register_netdev(struct device *dev, struct net_device *ndev)
+{
+	struct net_device_devres *dr;
+	int ret;
+
+	/* struct net_device must itself be managed. For now a managed netdev
+	 * can only be allocated by devm_alloc_etherdev_mqs() so the check is
+	 * straightforward.
+	 */
+	if (WARN_ON(!devres_find(dev, devm_free_netdev,
+				 netdev_devres_match, ndev)))
+		return -EINVAL;
+
+	dr = devres_alloc(devm_netdev_release, sizeof(*dr), GFP_KERNEL);
+	if (!dr)
+		return -ENOMEM;
+
+	ret = register_netdev(ndev);
+	if (ret) {
+		devres_free(dr);
+		return ret;
+	}
+
+	dr->ndev = ndev;
+	devres_add(ndev->dev.parent, dr);
+
+	return 0;
+}
+EXPORT_SYMBOL(devm_register_netdev);
-- 
2.25.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
