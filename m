Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E29C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 06:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qI0c24g1xBTExaWwqI/q6EiRpFuxIp41qba2WGXIjDg=; b=izt9/3wxm/LOR0
	EDxmtI0D1BDT5QM8L3IBP7BxU1qIaO4FPBv/LzgzTufVg8burf8G/3KIcEZxW+G2wNEuEZIlPtOp3
	L+KGTQ+tX1HmQ1+0isLp9d6iG+vd9y7LuUlZ40y8psiT5XgIE88wcVUljEesCUV/U+fiV0ojMBbkk
	vT4iP5CCGQ3B2XNzNFC40QG45zXfjykbMFup2c+qVE8fYWMax4TNJDD3N6T4WLUiPGgu9Mcx1kXEE
	1vl+1t/YSBb6uKX9MHu7OiHD5nycwJXrmsv6GDldM3J0P3MjXs3CYFbDP4e/9EqkN+CeLeqdyS+8/
	/3P7AdfkSJ2GVVnm03iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrZoW-005KrJ-7V; Thu, 19 May 2022 06:39:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrZoT-005Kpn-Ni
 for linux-mediatek@lists.infradead.org; Thu, 19 May 2022 06:39:10 +0000
X-UUID: c7dc4593912b43e1a25b007724fdaf92-20220518
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:07200d20-3708-43d9-97bd-4487bacb8463, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:2a19b09, CLOUDID:15bbd279-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: c7dc4593912b43e1a25b007724fdaf92-20220518
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1220276371; Wed, 18 May 2022 23:38:58 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 May 2022 23:38:56 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 19 May 2022 14:38:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 19 May 2022 14:38:55 +0800
From: Deren Wu <Deren.Wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>, 
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>,
 KM Lin <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
 <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Eric Liang
 <Eric.Liang@mediatek.com>, Stella Chang <Stella.Chang@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, "Shayne
 Chen" <shayne.chen@mediatek.com>, linux-wireless
 <linux-wireless@vger.kernel.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH 0/3] introduce BIOS SAR support
Date: Thu, 19 May 2022 14:38:21 +0800
Message-ID: <cover.1652941276.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_233909_816269_51BD4122 
X-CRM114-Status: UNSURE (   8.49  )
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

From: Deren Wu <deren.wu@mediatek.com>

Introduce BIOS SAR support for mt7921 serials.

Deren Wu (3):
  mt76: add 6G band support in mt76_sar_freq_ranges
  mt76: mt7921: introduce BIOS SAR support
  mt76: mt7921: introduce BIOS SAR config in tx power

 drivers/net/wireless/mediatek/mt76/mac80211.c |   6 +
 .../wireless/mediatek/mt76/mt7921/Makefile    |   1 +
 .../wireless/mediatek/mt76/mt7921/bios_sar.c  | 281 ++++++++++++++++++
 .../wireless/mediatek/mt76/mt7921/bios_sar.h  |  93 ++++++
 .../net/wireless/mediatek/mt76/mt7921/init.c  |   5 +-
 .../net/wireless/mediatek/mt76/mt7921/main.c  |  32 +-
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  22 ++
 7 files changed, 429 insertions(+), 11 deletions(-)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/bios_sar.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/bios_sar.h

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
