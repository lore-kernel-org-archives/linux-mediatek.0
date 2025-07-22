Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFF6C83F25
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jul 2025 08:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l9K5KtYGc/4e3o29w3mgEHcffAUZl1CYABAm8y3ELow=; b=d9P1WH71ySC9FoPtzwLBGEecH6
	Ak1XRsuw3FfMP2OMMoKhnuDPZjL1VqlvthGerP5+1Jffyd6PrK8E+FsIqENntvScwJnPAu3OXt6Ww
	2cJ+qHA7Cxau9vjUNHNH/Z9xRwiDbX2LxMQVHtwccqFRf7SoRLzvsUa6xfLxqOm5b7t3Yrb5kcD4J
	jYASkdbb1ziud5sCfnZLOkvrpNADRZ7/Uhs93iWuCX+cR5vOTfNzht8IsI6POA3ABHOfl8CAnT1ZN
	72F7SZGfNoi0cexLuSr53JeEyHlrm3onRTvmwWR8djcOKOcJIvvYYKD1VIfRDZ3z+VSj00zPDRInX
	TnUvTuLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8af-00000001rW8-0dda;
	Tue, 22 Jul 2025 08:43:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8ac-00000001rVX-12iq
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Jul 2025 08:43:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 64495A55E31;
	Tue, 22 Jul 2025 08:43:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D281C4CEEB;
	Tue, 22 Jul 2025 08:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753173789;
	bh=HoN/3y3SXLcKwKC3/dtyDNLJWjVXsQw8MjZvFf8nb/s=;
	h=From:To:Cc:Subject:Date:From;
	b=Q2owCAeH7MwmIn4nbNSRCAax4lZqFqDz0Uk8z8Ucll8L5lQ7x4ow3h5LJK9PMltM4
	 2c1QX+/I0t7sNNDaCtbYUhyNoGqHbdulM5LPTjFTXGMYoyn+GM/q4XLeCC2pLUdaI1
	 n1IM/3IfHmsYNsBs2VTd9TA0imerQBUpt2Zr5sAdO37ZAiJEe6a0wKrRDh1VPX/1MO
	 8IbsNtQasH+45mQcF5ZkEEb37GtNE7bj1S2RHCpITt7VHDqKn0PXNQm2CBAan3vO4I
	 hMwZbgl+wBT2kEHkpq8oWEakL78wpaYls228i682KNs6nh53elB4Cc02a6t3/XF9nM
	 +VLmuqU/uJvUw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	krzk@kernel.org,
	lorenzo@kernel.org,
	horms@kernel.org
Subject: [RFC mt76 v2 0/4] Add NPU offload support to MT7996 driver
Date: Tue, 22 Jul 2025 10:42:23 +0200
Message-ID: <cover.1753173330.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_014310_356919_23F0EFEA 
X-CRM114-Status: GOOD (  10.62  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Introduce Airoha NPU support to MT7996 driver. NPU is used to enable
traffic forward offloading between the MT76 NIC and Airoha ethernet one
available on the Airoha EN7581 SoC using Netfilter Flowtable APIs.
This series is based on the following net-next series for airoha_npu driver:
https://lore.kernel.org/netdev/20250717-airoha-en7581-wlan-offlaod-v4-0-6db178391ed2@kernel.org/

Changes in RFCv2:
- Do not compile MT76 NPU codebase if NPU support is disabled in airoha-eth
  driver.
- Remove dev_warn() in mt7996_pci_probe() if NPU support is disabled.

Lorenzo Bianconi (4):
  wifi: mt76: Move Q_READ/Q_WRITE definitions in dma.h
  wifi: mt76: Add mt76_dev pointer in mt76_queue struct.
  wifi: mt76: Introduce the NPU generic layer
  wifi: mt76: mt7996: Add NPU offload support to MT7996 driver

 drivers/net/wireless/mediatek/mt76/Makefile   |   1 +
 drivers/net/wireless/mediatek/mt76/dma.c      |  71 ++--
 drivers/net/wireless/mediatek/mt76/dma.h      |  67 ++++
 drivers/net/wireless/mediatek/mt76/mac80211.c |   6 +-
 drivers/net/wireless/mediatek/mt76/mt76.h     |  91 +++++
 .../wireless/mediatek/mt76/mt7996/Makefile    |   1 +
 .../net/wireless/mediatek/mt76/mt7996/dma.c   |   9 +-
 .../net/wireless/mediatek/mt76/mt7996/init.c  |   4 +
 .../net/wireless/mediatek/mt76/mt7996/mac.c   |   3 +
 .../net/wireless/mediatek/mt76/mt7996/main.c  |  15 +-
 .../net/wireless/mediatek/mt76/mt7996/mmio.c  |  13 +-
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |  21 +
 .../net/wireless/mediatek/mt76/mt7996/npu.c   | 284 +++++++++++++
 .../net/wireless/mediatek/mt76/mt7996/pci.c   |   3 +
 drivers/net/wireless/mediatek/mt76/npu.c      | 378 ++++++++++++++++++
 15 files changed, 921 insertions(+), 46 deletions(-)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/npu.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/npu.c

-- 
2.50.1


