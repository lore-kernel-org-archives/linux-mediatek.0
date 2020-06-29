Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91DAAC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 12:04:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CCF823D23
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 12:04:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UrHUe0Nc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="W34A5EzI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CCF823D23
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cVD6qm82lron4jXjkB7BkOB0u7FbhVi/jm3fE8OoepY=; b=UrHUe0Ncti3C+ITyHtOM7Vw3yu
	a9jUZH88AYCO+vOwIovuP8hHTbCoJ0X2Hh+I96UGdO/SwnLb1tqYi5llsChyTtzKTLJK/a5jYiIWi
	NSGU+QXbDmCLhVtOKP7oULA0K5gnfeQnJiwdivXRiawqU2xNG9emu6DC6WyCye5i2ZB+tpGdN1muZ
	SWmaHQfC3p03o3aPLksazuOcwymAoNSZzF5jp0NwEJx9zDeHK4kNfkcQatZTC1+sr4chMQ24PEEk5
	zpR8GrVniga0xO8UV82xDA+DkmfgQkNttEssgsmZ/DnoD+9gRY4TIw0/gC6y75+86u+ZQed5fklmV
	IKnSoDkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpsWV-00088X-7f; Mon, 29 Jun 2020 12:04:31 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpsWE-0007zV-Cs
 for linux-mediatek@lists.infradead.org; Mon, 29 Jun 2020 12:04:15 +0000
Received: by mail-wr1-x443.google.com with SMTP id o11so16270515wrv.9
 for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2020 05:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C3SFeAEvbOoZI/xpVJ8MO71Sd1LqnSCGoIeWQbxnMQg=;
 b=W34A5EzIFj5HWi2O+Uu6ihBeBiDeWhpckbWrX2jnfqXAR3x0qNViaW+WgvnvpxwiWO
 MGqgE1enmwmS0gQxdKT5NnCo8pT8qbnyks2TEEdLnPjFm0OCLBWs+QPHAs9eXm7uQdat
 JWbhorZHQ3BtymX0aXM/lywfKu/bT8ZNk4SSMGwMY45YdISPCRJHVeIp8gOWUa6hI3x5
 yl2q7FCGF3ftBuUSxFt5y3sPjglhVa+3G49n58H+eBi39BWD3W01vtmugl+iYZj5MxaS
 mkrYBWhfSoM6r/EQlCIFuE/GmGSu3DIPQIVdw8C/+juCBxxelde4Yfeywt4RMER4CJbR
 0+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C3SFeAEvbOoZI/xpVJ8MO71Sd1LqnSCGoIeWQbxnMQg=;
 b=osEb+HBwARaqeq4uaIzpy0aEiz4K3rM46a1X1k9S0uUAgJqf6kwnJIwZ+UPoijf4h/
 3piTyvHRacMCtv27iNbTbHbN2PULsGNJQAOkHKWMlULH3YrIeBE2eXsZQd5ssM8p1UOA
 Q81wAbs8P60IzhmtogDXVmt8bkkqQwilooi2WHkzjNRB3cd0ViBNennJ2vE8DGb4tHEv
 9NxSnXu+Sl7bfz/KYBUHiR7mtfzd8BLGn5lTxPjSxjlmdepFZvDdAhWJZfw/8w+FG7CT
 mE1j+JT4rbMAB51lAi2MxtMCrK4GQVe6Gwaue9iCy+rh/ChddyHhQLTr2NSQ1jlG1XXN
 8aOg==
X-Gm-Message-State: AOAM533q+Yg+hymweDhevRHYLq3SJycqcgX6HkDb+wRc3XtvJ+CCoAcw
 RQdPXi+3YGzAanMUdm+PvT+5CQ==
X-Google-Smtp-Source: ABdhPJzvKPYK67MLNdl2CXmAriudaJFiLrZRmwhzT6FCEy4WwbiER21DP71IWFlJPEiw6dlp0MpaYQ==
X-Received: by 2002:adf:e40e:: with SMTP id g14mr18038664wrm.271.1593432250982; 
 Mon, 29 Jun 2020 05:04:10 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id d81sm25274347wmc.0.2020.06.29.05.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 05:04:10 -0700 (PDT)
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
Subject: [PATCH v2 00/10] net: improve devres helpers
Date: Mon, 29 Jun 2020 14:03:36 +0200
Message-Id: <20200629120346.4382-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
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

So it seems like there's no support for relaxing certain networking devres
helpers to not require previously allocated structures to also be managed.
However the way mdio devres variants are implemented is still wrong and I
modified my series to address it while keeping the functions strict.

First two patches modify the ixgbe driver to get rid of the last user of
devm_mdiobus_free().

Patches 3, 4, 5 and 6 are mostly cosmetic.

Patch 7 fixes the way devm_mdiobus_register() is implemented.

Patches 8 & 9 provide a managed variant of of_mdiobus_register() and
last patch uses it in mtk-star-emac driver.

v1 -> v2:
- drop the patch relaxing devm_register_netdev()
- require struct mii_bus to be managed in devm_mdiobus_register() and
  devm_of_mdiobus_register() but don't store that information in the
  structure itself: use devres_find() instead

Bartosz Golaszewski (10):
  net: ethernet: ixgbe: check the return value of ixgbe_mii_bus_init()
  net: ethernet: ixgbe: don't call devm_mdiobus_free()
  net: devres: rename the release callback of devm_register_netdev()
  Documentation: devres: add missing mdio helper
  phy: un-inline devm_mdiobus_register()
  phy: mdio: add kerneldoc for __devm_mdiobus_register()
  net: phy: don't abuse devres in devm_mdiobus_register()
  of: mdio: remove the 'extern' keyword from function declarations
  of: mdio: provide devm_of_mdiobus_register()
  net: ethernet: mtk-star-emac: use devm_of_mdiobus_register()

 .../driver-api/driver-model/devres.rst        |   3 +-
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c |   6 +-
 drivers/net/ethernet/intel/ixgbe/ixgbe_phy.c  |  14 +-
 drivers/net/ethernet/mediatek/mtk_star_emac.c |  13 +-
 drivers/net/ethernet/realtek/r8169_main.c     |   2 +-
 drivers/net/phy/Makefile                      |   2 +
 drivers/net/phy/mdio_bus.c                    |  73 ----------
 drivers/net/phy/mdio_devres.c                 | 133 ++++++++++++++++++
 include/linux/of_mdio.h                       |  40 +++---
 include/linux/phy.h                           |  21 +--
 net/devres.c                                  |   4 +-
 11 files changed, 174 insertions(+), 137 deletions(-)
 create mode 100644 drivers/net/phy/mdio_devres.c

-- 
2.26.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
