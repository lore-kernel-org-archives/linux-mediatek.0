Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661E9C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 12:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6mmJOm31tsjuTPjxjZJjr3ZtuLqHyAoHC21jcvg3FXY=; b=Ayps7si9hk7QYK
	HjM4e3A/dCTsm0thtBAxUKnrlnkQ3p+miRtHwDCbJ7JvYn6IxCC7Mc5sdgklogKlMRDURzGOhTzCV
	ZKl9QfH33PsB9579MrO1VqEdGPph0OCk1tUkAHE/uP3Rlw9tMb36qku+ebnkAvj6ZA72GXT1SzneK
	XJFHOvImQqN8T5EraMRwtv8htFeD9Cp0r8PCdFWRDXbjq0/dYwvLBuO3MENT8JyWdTsqFvGQAnv+k
	uIbUHK9Gygj2o7AjFFtgQKzQXY1+nVJW4ymrw04T/pi5yXTiI2htimFnPf5wydOQp9ISZWAd4ew4m
	5/yFeS4NRBtsitbmLqtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Fy3-00GCCS-2u; Tue, 11 Jan 2022 12:09:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Fxy-00GC9F-Me
 for linux-mediatek@lists.infradead.org; Tue, 11 Jan 2022 12:09:32 +0000
X-UUID: 3e5e93c08eb74219b30764528d98c0c6-20220111
X-UUID: 3e5e93c08eb74219b30764528d98c0c6-20220111
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1986932211; Tue, 11 Jan 2022 05:09:27 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 Jan 2022 03:59:26 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 11 Jan 2022 19:59:24 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 11 Jan 2022 19:59:24 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>, Sujuan Chen
 <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Subject: [PATCH v2 0/5] add mt7986 support
Date: Tue, 11 Jan 2022 19:59:16 +0800
Message-ID: <cover.1641901681.git.Bo.Jiao@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_040930_797625_3015BFCF 
X-CRM114-Status: UNSURE (   9.64  )
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

This adds support for MT7986 SoC which integrated multi-band
4x4 WiFi 6/6E.
Detailed link: https://www.mediatek.com/products/mediatek-filogic-830

Bo Jiao (3):
  mt76: redefine mt76_for_each_q_rx to adapt mt7986 changes
  mt76: mt7915: add support for MT7986
  mt76: mt7915: introduce band_idx in mt7915_phy

Peter Chiu (1):
  dt-bindings: net: wireless: mt76: document bindings for MT7986

Ryder Lee (1):
  mt76: mt7915: add Kconfig entry for MT7986

 .../bindings/net/wireless/mediatek,mt76.yaml  |   29 +-
 drivers/net/wireless/mediatek/mt76/mt76.h     |    4 +-
 .../net/wireless/mediatek/mt76/mt76_connac.h  |    5 +
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  |    6 +-
 .../net/wireless/mediatek/mt76/mt7915/Kconfig |   11 +
 .../wireless/mediatek/mt76/mt7915/Makefile    |    1 +
 .../wireless/mediatek/mt76/mt7915/debugfs.c   |    8 +-
 .../net/wireless/mediatek/mt76/mt7915/dma.c   |   28 +-
 .../wireless/mediatek/mt76/mt7915/eeprom.c    |   96 +-
 .../wireless/mediatek/mt76/mt7915/eeprom.h    |   13 +
 .../net/wireless/mediatek/mt76/mt7915/init.c  |   54 +-
 .../net/wireless/mediatek/mt76/mt7915/mac.c   |  209 +--
 .../net/wireless/mediatek/mt76/mt7915/main.c  |   21 +-
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   |   81 +-
 .../net/wireless/mediatek/mt76/mt7915/mmio.c  |  125 +-
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |   48 +
 .../net/wireless/mediatek/mt76/mt7915/regs.h  |  276 +++-
 .../net/wireless/mediatek/mt76/mt7915/soc.c   | 1131 +++++++++++++++++
 .../wireless/mediatek/mt76/mt7915/testmode.c  |   35 +-
 drivers/net/wireless/mediatek/mt76/testmode.c |    5 +-
 20 files changed, 1947 insertions(+), 239 deletions(-)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7915/soc.c

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
