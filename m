Return-Path: <SRS0=tiIh=64=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B6FC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 08:03:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7013E20575
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 08:03:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FavaSRq3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="r+BJUHQI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7013E20575
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fn9d7urC4ln+sby1jK4/mkf6iaJ4XQTyeXwJiWOZGjA=; b=FavaSRq3KYCI6B
	Micg5Q74HKJYZGvqoVvUyTLmcqi2+TmLJeQAIxOLvdBbJIvFyTJQDooFLsQtmKUBT1jDTMcAwLC0r
	NDBUnr/VI+c3aO1t2rDODmoOE+Ooh3HeiV2zV9DBnm0B+0Ha0Q63TfULaTsdIyuq69vPCtzUmWd4f
	iv7Lxc2yed9Oh5IIeNvIKOJIsTrUcbYhHWR1pJEgIZ0+t0AlIFZIP6Q6Mr8bVjImGi4o7vHCFMPlR
	mrNHd3it3HpcDtS9iAqeY/gDC4SfscH2+RJL4pPIHl2IpM+Utd8QXtXSbs0SQOwoG1PtcEgWhHblC
	lEdW08YZcY6Vc6MJ4nag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZ8pl-0006i7-SZ; Thu, 14 May 2020 08:03:13 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZ8mx-0003tl-AL
 for linux-mediatek@lists.infradead.org; Thu, 14 May 2020 08:00:21 +0000
Received: by mail-wr1-x444.google.com with SMTP id l17so2627519wrr.4
 for <linux-mediatek@lists.infradead.org>; Thu, 14 May 2020 01:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fUZXOnych6qxhX4bjLeYEoW62tw45yoi4lvLz/fDZMU=;
 b=r+BJUHQIIa1axFh6WUc2DdvLc0SNaDkJzsiGYipq89vB/+fXNjYGdskx0PK6KLYu9Q
 fKqyJyLI0YmBJ0jHwnP7dK5acWOLOi3UNd/CPOVaw7M+6SLsx9FY7GKR+qTRSd+R2aB8
 FuCV9RfTAXq3uBTv2q4twSBcPYt3wgFVT3r6AQ6s6XQgoIEtpwHr8cohlti6kXbzhfHB
 kd48GeCqei40W0Fm+MvOL9jeeworbOzZdyEvqlQxglT7yd7TTjAGnpMoQPXWVR8/Yp4X
 aMUyp/vslroyFy0rg7y9UkmOjFbiD96xRByaMmYhOux1egWzjwBlEup1K1INXm1e7CnM
 oxrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fUZXOnych6qxhX4bjLeYEoW62tw45yoi4lvLz/fDZMU=;
 b=kBCjQ9eHObTE4DTeTUcoHAUUrF5e3y5dLMvzmqfo2LvdgSiH+vFJAs/J+/ohdE1eHC
 265xR7zzsxz+ZnHAZJejewfI1yibRmyKTtaLDQSJZqwadUofB4og/CNtZ4Ds+PRDkri8
 1W1zm89aAgS4caLLidHECi+rNXMhSOBtNvHwhebELx02gfiy4FHTfIN1svOU4RPv2SQn
 6sW55eubaigOsE7LDQBOLKucqrbJlVoTCDifWUMdutYFxFQOEoJP3OuItQD7OMKAhQTt
 L3Y/BdDcnUJVDxEfRGUVyflF7jyh85JnUmSmdiCfYXKDjcXXyaWPDRZazF7kdGLT/z/d
 Ymng==
X-Gm-Message-State: AOAM5315ItJAs93LQX3I4bTJMqB0vt3P35I3WIafQKsBkPxDQoUXP6kD
 g2rYef/gQeevgVFxZTKdBYMw3Q==
X-Google-Smtp-Source: ABdhPJzAzG6VyddDmgoHYvTU5SDSbk+AJ5I9Gy3n+7jEXEiPlpK/0wzyJd6PPnc4HGuK5CdsX1NyKA==
X-Received: by 2002:adf:b1c1:: with SMTP id r1mr3867472wra.76.1589443217531;
 Thu, 14 May 2020 01:00:17 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id 81sm23337446wme.16.2020.05.14.01.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 01:00:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Fabien Parent <fparent@baylibre.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Edwin Peer <edwin.peer@broadcom.com>
Subject: [PATCH v3 09/15] net: devres: provide devm_register_netdev()
Date: Thu, 14 May 2020 09:59:36 +0200
Message-Id: <20200514075942.10136-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200514075942.10136-1-brgl@bgdev.pl>
References: <20200514075942.10136-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_010019_766479_152E9225 
X-CRM114-Status: GOOD (  13.88  )
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
 .../driver-api/driver-model/devres.rst        |  1 +
 include/linux/netdevice.h                     |  2 +
 net/devres.c                                  | 55 +++++++++++++++++++
 3 files changed, 58 insertions(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index 50df28d20fa7..fc242ed4bde5 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -375,6 +375,7 @@ MUX
 NET
   devm_alloc_etherdev()
   devm_alloc_etherdev_mqs()
+  devm_register_netdev()
 
 PER-CPU MEM
   devm_alloc_percpu()
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 130a668049ab..c4ad728993dd 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -4208,6 +4208,8 @@ struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
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
