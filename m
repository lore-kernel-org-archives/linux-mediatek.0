Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7BEC352A1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 05:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oO5PI/Fj9lDxvpBZ4+z2h1v1CjMaqqoCf03Q8Z/fPUM=; b=1kA3bK3B6UidjN2ED07QW9GCkM
	tgPY1sThQA8f5jUOHgHhsvFTnpj6JQohX1X07RYwXK9aAJrSY0L5B3tpdKn2VxvgP0FTLIIeMCUnq
	QY5B3pmUQDMJ8fSYovvcxNnk6So6t2etNbKUg4xx2BiNJ8k0faTVdCtlaAd8gv1/i3pivGYaiLcKE
	VuNrDzF+XfW37Vi3Ay+qI7uN7yNbM8gKv1a/K1RU0zGsRb9HYY1y7BSbZbLq+ejw51/CUo3a/pvgw
	Tv3uEY65V9S0JEtr7qhYBlBF4zSjDwuiL9KQFA1WK5CGb02zYRrzU9YWCatkuzfUiYTm2XADoA5dC
	XYpLimrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2mwk-00BeNo-Fx; Wed, 07 Dec 2022 05:26:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2mwi-00Be2X-IL
	for linux-mediatek@lists.infradead.org; Wed, 07 Dec 2022 05:26:17 +0000
X-UUID: 679656379c114df98c4cc91dd7cc2028-20221206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=oO5PI/Fj9lDxvpBZ4+z2h1v1CjMaqqoCf03Q8Z/fPUM=;
	b=YH0Z8ZX3oNcEBWzI3SU6DGBNFsSpdrGyLXuy4FC+FRAddQGr1mZWaoj1NhJdAvPEw0uutaiclP12seMAm1BcYOzaiYaaXnxcuL3x9+3w3Wq3E/iWWboVpHPEmU9FZu2DjtD7ckq1597jeLhQP95Z/zqLm+w5dmqA4WyIzS1nAg0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:199f7a43-72ac-4482-8aed-00fe24b44971,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:4a7d8a24-4387-4253-a41d-4f6f2296b154,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 679656379c114df98c4cc91dd7cc2028-20221206
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <howard-yh.hsu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1390313311; Tue, 06 Dec 2022 22:26:02 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 7 Dec 2022 13:25:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 7 Dec 2022 13:25:28 +0800
From: Howard Hsu <howard-yh.hsu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.Lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Howard Hsu <howard-yh.hsu@mediatek.com>
Subject: [PATCH v2 0/3] wifi: mt76: mt7915: rework thermal protection
Date: Wed, 7 Dec 2022 13:24:57 +0800
Message-ID: <20221207052500.10855-1-howard-yh.hsu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_212616_636715_B4D6DE1E 
X-CRM114-Status: UNSURE (   5.89  )
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

*** BLURB HERE ***

Howard Hsu (3):
  wifi: mt76: mt7915: rework mt7915_thermal_set_cur_throttle_state()
  wifi: mt76: mt7915: call mt7915_mcu_set_thermal_throttling() only
    after init_work
  wifi: mt76: mt7915: rework mt7915_mcu_set_thermal_throttling()

 .../net/wireless/mediatek/mt76/mt7915/init.c  | 21 ++++++++++---------
 .../net/wireless/mediatek/mt76/mt7915/main.c  |  5 +++++
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 19 +++++++++--------
 3 files changed, 26 insertions(+), 19 deletions(-)

-- 
2.18.0


