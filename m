Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADED9C83F1B
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jul 2025 17:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J5lYrh8W1Zii9Ce5ASsVFQisW54QyB9tB9tNtmASyAw=; b=Ir8Y7OjUWBgmu7hTLEKnnq9HWM
	ooHR5JNVSAAfOxxcmPtKWRDuJMWR2BXwWBvU+KMd5R6uq0IyVF5y25AZDppn10Dk7q6901U6ogDqU
	ZQmpxwGlrUeWOStCRcGynjZCRa4VEuZlAru8uZUaU5b24QT9i2w/LgnMBTBYTAC9u5OxRgEmJQfx8
	E3o4R6hyHV4FAboLTcOXwRN1EX4CreTlLSZizM3D1GqPS9nIIZtwCmOvWt68/v0bxvm5Lzup9CSKe
	ViVigOB7P25poVGkNmDlIVGR2SNNewpkyGw7rzDu1AzAJGA67Uq2Bs9+td57EltXkYamtHaDWItLx
	XDfjTPwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubMgq-00000002vCQ-37iw;
	Mon, 14 Jul 2025 17:10:08 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKvJ-00000002cw7-1ZH2
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Jul 2025 15:16:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B3772A5720B;
	Mon, 14 Jul 2025 15:16:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D60ADC4CEED;
	Mon, 14 Jul 2025 15:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752506216;
	bh=cNl2G+4nID9VEq/SkN/gUiR1UE/E6bO8XMUjvivYSMU=;
	h=From:To:Cc:Subject:Date:From;
	b=Yv2k2zTkXByHZEoKL4c7km2DuInQFDAfQMJOk0h6uEpmR1gEIjWAnuF0lY9qwZAn3
	 3jxmnM/APPXVeiaRNQY7C2sXG9pJpCU8UePyDShfSC3HTJJRjlg5pfVWfIdvkgZ2bz
	 W4NjrhrlxdvldLLulBwnlYqBqGRRqYUDpNVTWyz61Hc6uS4n5HK3VvN6D9sgTPo/y1
	 aqWC8noOHSQvySVV0OiCWLGdxFzq0+2wxk9iPszT9igjSvkJKOXoxTZJNhlI/rPZMa
	 /G1a1JZ4s4Dr30d74QjNwcSsRALwj12qGMTXW6uOjNkP9KVkvrsfpNYc9Pd1tYiDcJ
	 s4t656AgRHFCw==
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
Subject: [RFC mt76 0/4] Add NPU offload support to MT7996 driver
Date: Mon, 14 Jul 2025 17:16:18 +0200
Message-ID: <cover.1752505597.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_081657_474914_1C2D1021 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
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
https://patchwork.kernel.org/project/netdevbpf/cover/20250705-airoha-en7581-wlan-offlaod-v2-0-3cf32785e381@kernel.org/

Lorenzo Bianconi (4):
  wifi: mt76: Move Q_READ/Q_WRITE definitions in dma.h
  wifi: mt76: Add mt76_dev pointer in mt76_queue struct.
  wifi: mt76: Introduce the NPU generic layer
  wifi: mt76: mt7996: Add NPU offload support to MT7996 driver

 drivers/net/wireless/mediatek/mt76/Makefile   |   2 +-
 drivers/net/wireless/mediatek/mt76/dma.c      |  71 ++--
 drivers/net/wireless/mediatek/mt76/dma.h      |  67 ++++
 drivers/net/wireless/mediatek/mt76/mac80211.c |   6 +-
 drivers/net/wireless/mediatek/mt76/mt76.h     |  49 +++
 .../wireless/mediatek/mt76/mt7996/Makefile    |   2 +-
 .../net/wireless/mediatek/mt76/mt7996/dma.c   |  17 +-
 .../net/wireless/mediatek/mt76/mt7996/init.c  |   4 +
 .../net/wireless/mediatek/mt76/mt7996/mac.c   |   3 +
 .../net/wireless/mediatek/mt76/mt7996/main.c  |  15 +-
 .../net/wireless/mediatek/mt76/mt7996/mmio.c  |  13 +-
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |   3 +
 .../net/wireless/mediatek/mt76/mt7996/npu.c   | 268 +++++++++++++
 .../net/wireless/mediatek/mt76/mt7996/pci.c   |   6 +-
 drivers/net/wireless/mediatek/mt76/npu.c      | 378 ++++++++++++++++++
 15 files changed, 855 insertions(+), 49 deletions(-)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/npu.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/npu.c

-- 
2.50.1


