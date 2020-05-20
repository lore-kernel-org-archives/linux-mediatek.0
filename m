Return-Path: <SRS0=i2Ig=7C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2625FC433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 11:44:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9598204EA
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 11:44:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IjWoQcUL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="iA7PIL9m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9598204EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hIwy3vOtEcXt0fZ6BbfIBfBo8VoFQvTRpI/kyoAC+D4=; b=IjWoQcULpldMGG
	1kvImlO+0B3bLzt1PcnNXbd7kk6Vvd9BoIcleiYRWQpJzxYyP5lD5Ra/GoEcCekLbSbKfulXZM5SK
	8koHPXLQ5WpVYk1QfkLCOCUfdaiDpxPrKNhEIuh94AilGyeGDvqo++rV26M0JJKe3/7j6JTwjZ0T3
	KyywX65LcUPymsIT3NfBnnN+lsBUFPw6SsUiH5d8ig7q7ZLHrlFHHkUoR4mVedCM6xkFkySVPU0VE
	n9w1NtzpCGW/gORLJ1a3fAV4sXyguLeKnhJkLYmRVbDiXcs/MFZfshHfeZrnNMIUm3vAbTdO7zfgc
	i51ui/MxKnBORy9+hL3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbN9S-0004Re-Ev; Wed, 20 May 2020 11:44:46 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbN95-0004CZ-Sj
 for linux-mediatek@lists.infradead.org; Wed, 20 May 2020 11:44:25 +0000
Received: by mail-wm1-x343.google.com with SMTP id u188so2534924wmu.1
 for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2020 04:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6UO8846LBADOFjPscf273ixSDXaAAOc6agORXCpe8H8=;
 b=iA7PIL9mvAGiJIzT2Pq6EhZQNK50yl9l6lgYY6TkjfmiyQO+FovVbAOv/7wzEq+1X9
 mk2kx8kVrndLXYGlYRob3K37sWxWbqbnI8GWDIJLCTr5oUVIejD7J+mx3gMpB4DTpKoA
 FaRG8wrpDNLkbm99XKF5izs/ettSvwFAAZmYaIAIsUjyqyNHUMtk4Qx46M6ANLR+w5F6
 ezbE69fQTXSyyZKnlQbLkm9Hz8B7xUbu2oIoAQM7RfA9ZciAbdiNho0I/X5IwEbO3PFa
 0jKUay9jsKzznzMRBfuWpuhc5UJyj2/R8Ql6/EQ+pOSBZzl4zjCE2czpVX94eI+feqOM
 A9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6UO8846LBADOFjPscf273ixSDXaAAOc6agORXCpe8H8=;
 b=Dg59ILHEJdKUzVAbWxBg5FayT3KULeq10iM/5ZQTPyBUxoPkPoLgYRuMx0fhGWVPY3
 54AHkv3AC3lTrn0lNJQ49qI2vBRdmeD+2n+FcjcZl3XgP+Q1WqrKz+ms89zEAxmEsps5
 2r0WmkkLfIVLun7ESmeIGfcrXUrYo2OB5zZf7WIM8R975KXvXYxivgmE/rl+QK1Wdy64
 OGqUc1MRv1nOkRwTb3G1KJo49PCo2plrc64g4OEIggOts34L8kuAwgRhYgPYSliIcXcc
 hvgXQ6kagNcVfgU5thuWwMh0r5I4CZ3d/px8EegzVtwl7jUjt7BNqjg9Lf0LNtPrhPF/
 1heA==
X-Gm-Message-State: AOAM530H/BLhS7rAHDAHWo6c94LKQ37sny3mgUiEJmfbv/CTWpNYLqtO
 PZtXBTViXPfLOixkjDunzc+RVQ==
X-Google-Smtp-Source: ABdhPJzM9bN56A7SVl3pNrO/Ahl7zhy4npY69zCHarKqOc0WKvc7Va3/fmdS0rKJeLhFamtGgdLgcQ==
X-Received: by 2002:a05:600c:147:: with SMTP id
 w7mr4321322wmm.89.1589975062340; 
 Wed, 20 May 2020 04:44:22 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id q2sm2530782wrx.60.2020.05.20.04.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 04:44:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Jonathan Corbet <corbet@lwn.net>, "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Fabien Parent <fparent@baylibre.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Edwin Peer <edwin.peer@broadcom.com>
Subject: [PATCH 0/5] net: provide a devres variant of register_netdev()
Date: Wed, 20 May 2020 13:44:10 +0200
Message-Id: <20200520114415.13041-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_044423_925759_5EA06362 
X-CRM114-Status: UNSURE (   7.98  )
X-CRM114-Notice: Please train this message.
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

This series applies on top of my mtk-eth-mac series[1].

Using devres helpers allows to shrink the probing code, avoid memory leaks in
error paths make sure the order in which resources are freed is the exact
opposite of their allocation. This series proposes to add a devres variant
of register_netdev() that will only work with net_device structures whose
memory is also managed.

First we add the missing documentation entry for the only other networking
devres helper: devm_alloc_etherdev().

Next we move devm_alloc_etherdev() into a separate source file.

We then use a proxy structure in devm_alloc_etherdev() to improve readability.

Last: we implement devm_register_netdev() and use it in mtk-eth-mac driver.

[1] https://lkml.org/lkml/2020/5/20/507

Bartosz Golaszewski (5):
  Documentation: devres: add a missing section for networking helpers
  net: move devres helpers into a separate source file
  net: devres: define a separate devres structure for
    devm_alloc_etherdev()
  net: devres: provide devm_register_netdev()
  net: ethernet: mtk_eth_mac: use devm_register_netdev()

 .../driver-api/driver-model/devres.rst        |  5 +
 drivers/net/ethernet/mediatek/mtk_eth_mac.c   | 17 +---
 include/linux/netdevice.h                     |  2 +
 net/Makefile                                  |  2 +-
 net/devres.c                                  | 95 +++++++++++++++++++
 net/ethernet/eth.c                            | 28 ------
 6 files changed, 104 insertions(+), 45 deletions(-)
 create mode 100644 net/devres.c

-- 
2.25.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
