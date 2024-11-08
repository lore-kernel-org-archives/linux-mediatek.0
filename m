Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41901D64064
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Nov 2024 16:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HJdxrHqrC5kEMbapK+RIRyuzCDjboqt8Pz02wTDuMpE=; b=LwGhbz+3a1E7wah8KKzqfGrs8U
	W+/X2U8XMCncTfR/3IOeCXzTaTmPug+riLtA/HLbjv03GH5RUu/fAMln/zoRsImj2eW3uV4gd56qi
	/xHd3I8NzXZgbg/ZJHUluRxun7JlVS1CZonJFAOOmpVtghCLfjLl6Q7zcr0eXlmgvpU5LO1Uva9H9
	TEDdGltyX6OF0ttF7zFC50nKQiwzMRFRcasDec8LIZCaeHefaoZQNQW6Cu9XeA038vYcidtRS99EF
	1iFescgpi5wFLfbBuE4ma12MVqniZXs+rBo0QNa9OEzx7xinNZSjVGX7QyYwELbrsb8S02I7JujTb
	6b9jJZcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Rys-0000000BGCP-18Ga;
	Fri, 08 Nov 2024 16:37:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Rx0-0000000BFZ1-2Ept;
	Fri, 08 Nov 2024 16:35:12 +0000
X-UUID: 67c5e7269def11ef82ff63e91e7eb18c-20241108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=HJdxrHqrC5kEMbapK+RIRyuzCDjboqt8Pz02wTDuMpE=;
	b=H1tQKaOpvb99NH2gs2KeXotcnS71Gp2C5T3QYofz7qfiJ6nv93JOa+Dfsp4qw4Yi6GJKxrjFQsTIh8DsHYQg7VLYR6YEb6447nxxqhqaCkoqAeB9oHPlNVZmJNGGcxMaGTJSTboWxz9On1GT0TcwXzj1XEny/hbfbPNwUujLsA0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:b10e257a-c69e-4b59-a13f-9be40d3db7e3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:8f91bfca-91e6-4060-9516-6ba489b4e2dc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 67c5e7269def11ef82ff63e91e7eb18c-20241108
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1424359068; Fri, 08 Nov 2024 09:35:03 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 8 Nov 2024 08:35:00 -0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 9 Nov 2024 00:35:00 +0800
From: Sky Huang <SkyLake.Huang@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Daniel Golle
	<daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, SkyLake Huang
	<SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Simon
 Horman <horms@kernel.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Steven Liu <Steven.Liu@mediatek.com>, Sky Huang
	<skylake.huang@mediatek.com>
Subject: [PATCH net-next v3 0/5] Re-organize MediaTek ethernet phy drivers and propose mtk-phy-lib
Date: Sat, 9 Nov 2024 00:34:50 +0800
Message-ID: <20241108163455.885-1-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_083510_799736_CE3D69B0 
X-CRM114-Status: GOOD (  10.35  )
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

From: Sky Huang <skylake.huang@mediatek.com>

This patchset comes from patch 1/9, 3/9, 4/9, 5/9 and 7/9 of:
https://lore.kernel.org/netdev/20241004102413.5838-1-SkyLake.Huang@mediatek.com/

This patchset changes MediaTek's ethernet phy's folder structure and
integrates helper functions, including LED & token ring manipulation,
into mtk-phy-lib.

Signed-off-by: Sky Huang <skylake.huang@mediatek.com>
---
Change in v2:
- Add correct Reviewed-by tag in each patch.

Change in v3:
[patch 4/5]
- Fix kernel test robot error by adding missing MTK_NET_PHYLIB.
---

SkyLake.Huang (5):
  net: phy: mediatek: Re-organize MediaTek ethernet phy drivers
  net: phy: mediatek: Move LED helper functions into mtk phy lib
  net: phy: mediatek: Improve readability of mtk-phy-lib.c's
    mtk_phy_led_hw_ctrl_set()
  net: phy: mediatek: Integrate read/write page helper functions
  net: phy: mediatek: add MT7530 & MT7531's PHY ID macros

 MAINTAINERS                                   |   6 +-
 drivers/net/phy/Kconfig                       |  17 +-
 drivers/net/phy/Makefile                      |   3 +-
 drivers/net/phy/mediatek/Kconfig              |  27 ++
 drivers/net/phy/mediatek/Makefile             |   4 +
 .../mtk-ge-soc.c}                             | 298 ++----------------
 .../phy/{mediatek-ge.c => mediatek/mtk-ge.c}  |  31 +-
 drivers/net/phy/mediatek/mtk-phy-lib.c        | 270 ++++++++++++++++
 drivers/net/phy/mediatek/mtk.h                |  89 ++++++
 9 files changed, 438 insertions(+), 307 deletions(-)
 create mode 100644 drivers/net/phy/mediatek/Kconfig
 create mode 100644 drivers/net/phy/mediatek/Makefile
 rename drivers/net/phy/{mediatek-ge-soc.c => mediatek/mtk-ge-soc.c} (83%)
 rename drivers/net/phy/{mediatek-ge.c => mediatek/mtk-ge.c} (82%)
 create mode 100644 drivers/net/phy/mediatek/mtk-phy-lib.c
 create mode 100644 drivers/net/phy/mediatek/mtk.h

-- 
2.45.2


