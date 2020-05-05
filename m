Return-Path: <SRS0=+Wu7=6T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45BCFC47247
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 14:04:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CE2A20757
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 14:04:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EzvgKIgG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="a8DMxibR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CE2A20757
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1W1yQG0cXHcx2FDxr/6Fo6GON7lSfXv2asMmRBdQZgU=; b=EzvgKIgGeLJFbi
	aP6jpKDT3rS7UqoKzQ6NQy4aiZi/gMMLbFKVn0LVMqHZ5AES4QAJdV6B+QbXOdoWCYPUWbX0Ey5KF
	PjoZVzVePyY4b4zm8fibB0Q9vx8tqyqNr+yOWjZPLEPb7H2nkTSX9JLW6jgBRJ/3OJHMotifFi5av
	ERnzNH9BsHT2xAIkLvgrNeuyiiQKp4uXoIGnsotlAzJs/AvzYYHU8M+Ft4sPcGCD7hEx7XMkP/cD8
	/iseMAt5el69WM2tynzrZow6Uf5ADlOvTM2wADByJ7kHmi6p8hIucKUV2+2Fm7PvLzBWaEMWQM2Me
	ZylFTCR/TwrLb0nbD/pg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVyBF-0003QM-Ug; Tue, 05 May 2020 14:04:17 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVyA9-0002E5-6R
 for linux-mediatek@lists.infradead.org; Tue, 05 May 2020 14:03:11 +0000
Received: by mail-wr1-x441.google.com with SMTP id g13so2863395wrb.8
 for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2020 07:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PK31tVWfgrccN1MBhDjrbakpYyyD2tO24v7BYQEkurI=;
 b=a8DMxibRqTrZGmyZ0KLtsYlfgQSvtBtYx+i51AoL6kzVb3a3Zcw5KFc8r5emhX2L/e
 qLVl57SKF7PdhjnPEnfYmiBsHkXDn94m+UKH2rLq8YYGcxS7EN5GAv4eWBPvoY1byN7N
 QxZMFs3Qb+qVtydhG5IbCi+FEqOcJ0waPkxXqf2ILV3oLLL0N8BnwvrKySVqhV+H6q/X
 68KP5IqC6ZqPMnSBCsQ0mVeuFaW8UzGdm+AMBhfl1Jooa4pbk4UE+wnG551wvwjBL9yZ
 yo8Kq56xX0wXRuQs1Lf5bbGGIUhYjKU0+mCWMv1cZeNM2eZ0NXSh3Pl4lvUmp2tjq5pt
 c2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PK31tVWfgrccN1MBhDjrbakpYyyD2tO24v7BYQEkurI=;
 b=PQETGhyWFcdvsvjrOxtuTyal/4cUpTv5qLjAPu2LFMHkIYuVUk/fIOxBosCUlSbUAP
 v4O4y2eTcmf1U3IJcoNRvS0W3W6JEZAGhWiA/14+qvojAMMoRLH1PWbCbHeNL9TuAgqw
 jRb91KPHAFKjp6gh2vvs3V8oVrn4ke0LYVJvBlpfJFpsgesTmyC6f9acCt+HNd6c8s5T
 hzn4gPyW6aXqeCOLNi93ZneLlguugcNs2ofLQXtOJiW3q4jEwav/L/wykS2x/GIsoDT8
 4CEXz3x+8v9puEBd7RWC8bx+mwJLidbYU7Ga1WBr5RO72v3gCVsWJ5sTCFQcnfHER/V0
 APKw==
X-Gm-Message-State: AGi0PublZGSRg1o70Jpa2nynxn65FZESV6bGyIlmKRZuFjIBgQ4DSuyx
 cpBEb3kGCU9Gz3IWgH+tyhPWQg==
X-Google-Smtp-Source: APiQypJK0fRzPjzYsRI0o6WTCpJIb10ZVt2+vpQjB2QmGMKqpkl9pQ80cS/ZweDjU4zPMeSAzrIc8g==
X-Received: by 2002:a5d:4711:: with SMTP id y17mr3781592wrq.49.1588687383658; 
 Tue, 05 May 2020 07:03:03 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id c190sm4075755wme.4.2020.05.05.07.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 07:03:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, Felix Fietkau <nbd@openwrt.org>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Jakub Kicinski <kuba@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 00/11] mediatek: add support for MediaTek Ethernet MAC
Date: Tue,  5 May 2020 16:02:20 +0200
Message-Id: <20200505140231.16600-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_070309_230007_017286F4 
X-CRM114-Status: GOOD (  11.28  )
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

This adds support for the Ethernet Controller present on MediaTeK SoCs
from the MT8* family.

The first two patches add binding documents for the PERICFG syscon and
for the MAC itself.

Patches 3/11 & 4/11 do some cleanup of the mediatek ethernet drivers
directory.

Patch 5/11 provides a devres variant of register_netdev().

Patch 6/11 adds the new ethernet driver.

The rest of the patches add DT fixups for the boards already supported
upstream.

Bartosz Golaszewski (11):
  dt-bindings: add a binding document for MediaTek PERICFG controller
  dt-bindings: new: add yaml bindings for MediaTek Ethernet MAC
  net: ethernet: mediatek: rename Kconfig prompt
  net: ethernet: mediatek: remove unnecessary spaces from Makefile
  net: core: provide devm_register_netdev()
  net: ethernet: mtk-eth-mac: new driver
  ARM64: dts: mediatek: add pericfg syscon to mt8516.dtsi
  ARM64: dts: mediatek: add the ethernet node to mt8516.dtsi
  ARM64: dts: mediatek: add an alias for ethernet0 for pumpkin boards
  ARM64: dts: mediatek: add ethernet pins for pumpkin boards
  ARM64: dts: mediatek: enable ethernet on pumpkin boards

 .../arm/mediatek/mediatek,pericfg.yaml        |   34 +
 .../bindings/net/mediatek,eth-mac.yaml        |   80 +
 arch/arm64/boot/dts/mediatek/mt8516.dtsi      |   17 +
 .../boot/dts/mediatek/pumpkin-common.dtsi     |   34 +
 drivers/net/ethernet/mediatek/Kconfig         |    8 +-
 drivers/net/ethernet/mediatek/Makefile        |    3 +-
 drivers/net/ethernet/mediatek/mtk_eth_mac.c   | 1476 +++++++++++++++++
 include/linux/netdevice.h                     |    4 +
 net/core/dev.c                                |   48 +
 net/ethernet/eth.c                            |    1 +
 10 files changed, 1703 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
 create mode 100644 Documentation/devicetree/bindings/net/mediatek,eth-mac.yaml
 create mode 100644 drivers/net/ethernet/mediatek/mtk_eth_mac.c

-- 
2.25.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
