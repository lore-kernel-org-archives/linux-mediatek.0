Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856C3C56201
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2026 09:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yzil/Mlf3ePuxeRuT5OEh2LZy0rHiWskGCYU7Mq6F4o=; b=vKw4+LvdXaBhwwiUNxjI6h0wfJ
	0swb+ZdgReexIIPcPFjpYhYXpwMhYytRWVtcWrWEeH3N/wKowMy07+7YF4HbufwnKxtIXNbNogRCt
	qB1ThOsGJZBK2S7BoWHbJnnTvQg1eM98sW7EUwLTwkHsb7wtdK+FF1AyIose0CatvggR52PVbVWBV
	YOvSX183C91nS2mU3jNqVZKlY6MfNt1s8rC584F2UMIeafSOI7yfdmsu1GnUEu8zeKfrkTIItiW2S
	ie2Ql/PPRq6wBZnRjrsCKTiuZToyUnkY023PnCkwH3k+OXMJjk4K1r+MtatR4nfJYpNaUGdmKziLg
	cfpn2pcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrXsd-00000003c9y-1Kgf;
	Wed, 05 Aug 2026 09:25:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrXsa-00000003c8k-2UzM
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Aug 2026 09:25:42 +0000
X-UUID: 9d4fc64690af11f1acbe4559397dec65-20260805
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=yzil/Mlf3ePuxeRuT5OEh2LZy0rHiWskGCYU7Mq6F4o=;
	b=KnHpePGXcyZcamOUwQfzcxzCE/BNS4/HmtbFoEg6x9+w4eYZd24CUN8La8l4aBQHqHvp6N6Q20pn0jusDcCq9i+8A1P2SJMIIB0lnwVKQjOGcc11axH5mW0bP38iOWc1+gDaZjWwYjO8FI9AFLavPXj1sMHNIk05q1FyDczLCJQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:b5898cdf-ea2c-45b2-ac7d-e922e799de74,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:a0038df1-0685-46a3-9cac-19d8f3a05ae7,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9d4fc64690af11f1acbe4559397dec65-20260805
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <eason.lai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1111534564; Wed, 05 Aug 2026 02:25:35 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 5 Aug 2026 17:25:33 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 5 Aug 2026 17:25:33 +0800
From: Eason Lai <eason.lai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<kun.wu@mediatek.com>, <deren.wu@mediatek.com>, <sean.wang@mediatek.com>,
	<quan.zhou@mediatek.com>, <ryder.lee@mediatek.com>, <leon.yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jb.tsai@mediatek.com>, <ck.chang@mediatek.com>,
	<eason.lai@mediatek.com>
Subject: [PATCH v1 0/2] wifi: mt76: mt7925: Fix coredump issue and add coredump end collect mechanism
Date: Wed, 5 Aug 2026 17:25:29 +0800
Message-ID: <20260805092531.1490746-1-eason.lai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_022540_688190_A2B04269 
X-CRM114-Status: UNSURE (   5.86  )
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

From: "ck.chang" <ck.chang@mediatek.com>

This series fix coredump file size not enough issue, and add coredump end collect mechanism

ck.chang (2):
  wifi: mt76: mt7925: Fix coredump size not enough issue
  wifi: mt76: mt7925: Add coredump end collect mechanism

 .../net/wireless/mediatek/mt76/mt76_connac.h  |  1 +
 .../net/wireless/mediatek/mt76/mt7925/mac.c   | 52 +++++++++++++------
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 10 +++-
 3 files changed, 47 insertions(+), 16 deletions(-)

-- 
2.45.2


