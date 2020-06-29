Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F12EC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 12:05:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4571C23B06
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 12:05:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r7B3hkwe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="bhKeRr58"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4571C23B06
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GbH85wjW8tPED81AqpEA7v6KOOgWGdHsGJQAhG1Fxpc=; b=r7B3hkweO6BoWfQOuNNG5cLry
	Fi2xPvybPtgCeoylnZbFpsp1T8NlVi//jklYJUPBkpf4FWBD8T6OWeb2xn6qnzIYEswROqzxzKllc
	x2B2ajmemXSqLUZgi7tG3GRmme0bsF2+0YQSBppfHUExSqklLJsdGW4C2pfrsa9JCat0omHdp2HoO
	p9GCFEGXg1yda/FSlSpmumaGlpgxUdEgY87FDi9sBDLpaU0KDEr77pY0oJPLzDA8aiky2ME45wg7W
	WEOtTgSYiYQcFixYnZi3RJf893DvxFGvqfOkrK0DUN+q+D/HFgJgp9469VrvtXboYiwN2YhTfy6pz
	0gyHU6z7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpsXC-0008W3-4M; Mon, 29 Jun 2020 12:05:14 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpsWL-00085A-7V
 for linux-mediatek@lists.infradead.org; Mon, 29 Jun 2020 12:04:23 +0000
Received: by mail-wr1-x443.google.com with SMTP id a6so16286686wrm.4
 for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2020 05:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rcgV1UNGKm4K4QD82m2Udcr1uoHRVa+LAuPxtdS553M=;
 b=bhKeRr58llmIS9VKgVFyB6mAC7XOTgR+vC4RJRrwyWIr5sh0Pep1GPWHLAgwGzpwAc
 MGPqTye+7rp41hJ0FSDOVSH+p83Zt/3ZFe7cwcMshyi04ZZeZpr/muoHkBS6d3gEFsqC
 gL9tprIlM/mTLQfg0PC3ySsy+WIP8DkfosTU4J5ojN9iLGjwYxKS/OZIJyN/rXYZmrgt
 b/PirIRVemOkzEXXswFvaL53RJkfuhhqpelHeBzIZhnZXZ+/gqm1xcXkTKom438Uu5E3
 dMbEgvGvBvjLo2LDuXkeV0gRZt75ZzMGwBn8D2w+jiehl1HPOVrLev1YO1EDLxfeZxlK
 6RTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rcgV1UNGKm4K4QD82m2Udcr1uoHRVa+LAuPxtdS553M=;
 b=eDgBTp9tduqSrFaqbQ2vqcjeithofkBm9vSGgOLbiYLthN6HNgy1bpU7NSVyBWhxi6
 aKH9Cs+fR9SSsKl/7k5SrWdu0SEHhW81zC936wHjS4xpGBkFlznnDAGlqh1eerwqit5c
 5lZg3LsCJj3eZKiomjh2Hw6sWlvrTBnfM30Bj3Qro6Jo8dEi15+1P/MlXrWb+XNEg5Lt
 F8Ro0+5R0wCQ6nIwEm5eNK+kZGxERlqgqS2CzcTXiaXNKdmRg6XtsKKsDOwzuwWZ2p5R
 c2ktq4xCKyDYnlqcveYgz2NbodWCIOY9g8u0w6iVf4y4wlB3rQr07+7uXaiOQWS6uykT
 dJfw==
X-Gm-Message-State: AOAM532JuRE9ag7nU7TniDcuY+oXe0cNN0uWjvw/ioEZJmEj2DXpyAn3
 lmfPfjbUTmnNhBFd9FpWQXZ3tA==
X-Google-Smtp-Source: ABdhPJwlADkzSAVFbK3JmZ+v+w78Y8jXO+OaWZ19/qk/J/aygV+blBomdVtOyQPcaDByMnxBjS6U2A==
X-Received: by 2002:adf:c185:: with SMTP id x5mr18180867wre.403.1593432260279; 
 Mon, 29 Jun 2020 05:04:20 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id d81sm25274347wmc.0.2020.06.29.05.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 05:04:19 -0700 (PDT)
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
Subject: [PATCH v2 06/10] phy: mdio: add kerneldoc for
 __devm_mdiobus_register()
Date: Mon, 29 Jun 2020 14:03:42 +0200
Message-Id: <20200629120346.4382-7-brgl@bgdev.pl>
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

This function is not documented. Add a short kerneldoc description.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/net/phy/mdio_devres.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/phy/mdio_devres.c b/drivers/net/phy/mdio_devres.c
index f0b4b6cfe5e3..3ee887733d4a 100644
--- a/drivers/net/phy/mdio_devres.c
+++ b/drivers/net/phy/mdio_devres.c
@@ -2,6 +2,13 @@
 
 #include <linux/phy.h>
 
+/**
+ * __devm_mdiobus_register - Resource-managed variant of mdiobus_register()
+ * @bus:	MII bus structure to register
+ * @owner:	Owning module
+ *
+ * Returns 0 on success, negative error number on failure.
+ */
 int __devm_mdiobus_register(struct mii_bus *bus, struct module *owner)
 {
 	int ret;
-- 
2.26.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
