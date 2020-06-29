Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD20C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 12:05:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F07AF235F7
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 12:05:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Iv93RuCJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="nQ9byLrD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F07AF235F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xo1vsfUzjeZh617JKE8S/bhMznKNVSrIkuS/yIakLNE=; b=Iv93RuCJgXlNTObMUCURUpas0
	Li/O4AwkQKHtiHLWB4tWaWT/2vCBqoo8i0jFIv4cMv/XcYKPzX1FF+fwmzFIrFcbwn34Vae+WdBqC
	G8ZhGSXrPtqZ4KQO7rWsjKvHdrHMXKG3TavOPl7E7kG3xgHBUX+TzA/6X3y8rqeefU/5/cEebHn7v
	/gj2n8jvZKqzVGOshyLEa/6/aBlqS0ZWhRJprxZB8PxSW2jw68YCvJnrDP0LXeLHBm0qbdC16+rP2
	dmp0MQwQ7h+JdiF6Q3O0+J9C2ZJOkCF7N5RM/8FKyWKThp1NJagvhtjj+O2XNxUNw47t689xAr9dH
	8x4r6cZtA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpsWs-0008HC-Jy; Mon, 29 Jun 2020 12:04:54 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpsWI-00082g-9Z
 for linux-mediatek@lists.infradead.org; Mon, 29 Jun 2020 12:04:20 +0000
Received: by mail-wm1-x344.google.com with SMTP id o8so15119390wmh.4
 for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2020 05:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vANIsXo74NzXiDIyR10LVPoVvN0SF3cCppVREngNaSg=;
 b=nQ9byLrDn58wjHMhoadRsTTETa0UhC6JF4a46q+PYUs7UZGZeUDV+Ialz0dd7h+UZR
 mhqFHyY0EbcDbESld8SYOxPhwBLpUwtVkb7pnzsNitFSbO7EEfGSOy2q2y7CP79Hex0H
 1b+M8CdLjEStcijSVXMq80kujGFckpNmUPo54ebhhky847n6l7blHRFboEfpPZTyy81E
 MMdTQ19QQn9i1JzgLPdR6Txwa+fNw+Wy8dARSM1y/DGypJ0Whb8UBnHg8y/LnybqbSGv
 f43pJWnxIJUXGw1WzhE2J9N+9sBt5Oq9JRyYdz9w5VzjVb+Gsr45rKUvPRAqZkU/fFCF
 warw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vANIsXo74NzXiDIyR10LVPoVvN0SF3cCppVREngNaSg=;
 b=ditaSeSqIpxXXfvzxoJYaP8AL0gwSOu/+KuIIOaHhIIbjxDJ2+xVRycCXh73FP2+CQ
 Mn2QoLN9S0IGUEkmZGRp4KM1HlxgYz1+i33zjXgthl6wyYqJ1XKy9uNAt/99FUjwPpDU
 HZdemI+hIG1zlq8uy+DCNan2QjeyFgU6khlTdwApZGNuFcMJbacNaYLJvOT0i27kUtOs
 2uwfk+pm/x0GKf3R7hHwlX2BqWRUt0CV9UqfQLwfGIdJRwJF8MQnq4DZcCqMdNWL6Krg
 GX+pLHmGEgO9LM8Z4PeLVdvXd0J2CF2OwR0D60V8wxnQd8Rn6TY/VewjeeaEGdWCYhfS
 GKJw==
X-Gm-Message-State: AOAM533P1YMqgEqPO3nXGDmpNn5r490dXrKaraBcCr13DCklKDk9A03l
 5Pq8eWlYzK7H2cwkZ7PX9iLcmA==
X-Google-Smtp-Source: ABdhPJzzIpHdKMTQ6SjqhWeqI//sR8Iftgms6VcGQcyabxIbGKuFkf8bRkm3ckDgSAITcNYh0w9Y4Q==
X-Received: by 2002:a7b:c746:: with SMTP id w6mr17250018wmk.171.1593432257471; 
 Mon, 29 Jun 2020 05:04:17 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id d81sm25274347wmc.0.2020.06.29.05.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 05:04:16 -0700 (PDT)
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
Subject: [PATCH v2 04/10] Documentation: devres: add missing mdio helper
Date: Mon, 29 Jun 2020 14:03:40 +0200
Message-Id: <20200629120346.4382-5-brgl@bgdev.pl>
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

We have a devres variant of mdiobus_register() but it's not listed in
devres.rst. Add it under other mdio devm functions.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 Documentation/driver-api/driver-model/devres.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index e0b58c392e4f..5463fc8a60c1 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -343,6 +343,7 @@ MDIO
   devm_mdiobus_alloc()
   devm_mdiobus_alloc_size()
   devm_mdiobus_free()
+  devm_mdiobus_register()
 
 MEM
   devm_free_pages()
-- 
2.26.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
