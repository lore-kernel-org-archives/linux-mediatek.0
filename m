Return-Path: <SRS0=3cxa=PP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE6EFC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 09:10:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B088361039
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 09:10:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B088361039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DnZuWfbMCyzW/txvgLxVEg7o8eSRQMdnG9clLq35ocw=; b=q8GnIkcq6bZ3Um
	fZMcszyUl6YBZbg5WH7q10WfY2+WXqKdxPYBAvgoYq5ZLFsSSn5986kEvr3F8m1PL1dAov6k/2bF7
	srTaeCcggjQIOkkJwFy38DpbzdkYRLYHLDslBI1ZUiYw/CeOstS4zOfMig5f5TkEiAY1nWb9b4vL2
	JzXpabZ96Blml4kVYgjJcson20SMIXWkzRIwANKzEYPhGle3oQsJR9TNp45nzLbzNofQDEftLMOZN
	qmtnwKHYMFe14Az2PaJiagnEBBF+lRL6j5Sd5UxyEteKWiE7xo7aF//rOz3yDtsbILXJYYXki4Aaz
	pWIKyCD2P3mbiHlbkF3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfewS-004OZD-VC; Wed, 27 Oct 2021 09:09:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfewN-004OWX-Ll
 for linux-mediatek@lists.infradead.org; Wed, 27 Oct 2021 09:09:50 +0000
X-UUID: 4372d21f707d42dc88b743e01e67af82-20211027
X-UUID: 4372d21f707d42dc88b743e01e67af82-20211027
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 99302282; Wed, 27 Oct 2021 02:09:41 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Oct 2021 02:09:39 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 27 Oct 2021 16:40:32 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 27 Oct 2021 16:40:31 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>, Sujuan Chen
 <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Subject: [PATCH 00/11] add mt7916 support
Date: Wed, 27 Oct 2021 16:40:08 +0800
Message-ID: <cover.1635323366.git.Bo.Jiao@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_020947_738397_B882DC86 
X-CRM114-Status: UNSURE (   7.00  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bo Jiao <Bo.Jiao@mediatek.com>

This adds support for mt7916 PCIe-based device, which shares the same
driver with MT7915. The maximum number of client connections is extended
to 512. mt7916 is capable of WIFI6@160MHz, simultaneous dual-band and
all WiFi6 R2 features.

Bo Jiao (11):
  mt76: mt7915: add mt7915_mmio_probe() as a common probing function
  mt76: mt7915: refine register definition
  mt76: mt7915: rework dma.c to adapt mt7916 changes
  mt76: mt7915: add firmware support for mt7916
  mt76: mt7915: rework eeprom.c to adapt mt7916 changes
  mt76: mt7915: enlarge wcid size to 544
  mt76: mt7915: add txfree event v3
  mt76: mt7915: update rx rate reporting for mt7916
  mt76: mt7915: update mt7915_chan_mib_offs for mt7916
  mt76: mt7915: add mt7916 calibrated data support
  mt76: mt7915: add device id for mt7916

 drivers/net/wireless/mediatek/mt76/dma.c      |  13 +-
 drivers/net/wireless/mediatek/mt76/mt76.h     |   6 +-
 .../wireless/mediatek/mt76/mt7915/debugfs.c   |  20 +-
 .../net/wireless/mediatek/mt76/mt7915/dma.c   | 388 ++++++---
 .../wireless/mediatek/mt76/mt7915/eeprom.c    |  94 ++-
 .../wireless/mediatek/mt76/mt7915/eeprom.h    |   9 +-
 .../net/wireless/mediatek/mt76/mt7915/init.c  |  66 +-
 .../net/wireless/mediatek/mt76/mt7915/mac.c   | 273 ++++---
 .../net/wireless/mediatek/mt76/mt7915/mac.h   |  14 +-
 .../net/wireless/mediatek/mt76/mt7915/main.c  |  11 +-
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   |  98 ++-
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |   8 +-
 .../net/wireless/mediatek/mt76/mt7915/mmio.c  | 757 ++++++++++++++++--
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  37 +-
 .../net/wireless/mediatek/mt76/mt7915/pci.c   | 243 +-----
 .../net/wireless/mediatek/mt76/mt7915/regs.h  | 670 +++++++++++-----
 .../wireless/mediatek/mt76/mt7915/testmode.c  |  58 +-
 17 files changed, 1907 insertions(+), 858 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
