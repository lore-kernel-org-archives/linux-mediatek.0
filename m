Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF73C27C4F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 10:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bYl5pSl2HjwLJjDCYGRQ01twN9nVzCw5LEjgUTb4KAE=; b=XrU6VvfuRHoI4TgUZT3YIo7TOc
	rqXvFsBeH2I47y+PhUUlMynQNTktsN3b54dyF8kV5vVJhGZlMDYrUrfvYdhWDSKbuoCNkkffJbSZ2
	R8yvg9a5JMQRwqAwLXs6qSJr9XCQd3j6CGLTJRJY/MpTLkfzy2szZKY4GjG88007ex4A003Nws60x
	pZ8yiyGrhnZGKyiU6qA5WuUnUloUCMMqHxTNdv9iUGck1vARmDxNa6yBxF2Q/NUBlzu2gXVNOind6
	wQzpIcMkdzsd+oCSYdFOazFWEmugP+XeK4mSLCTzZds35uaMwMA3a8MeUsLbpInj4LeKXalhVLJeS
	ANEGtD+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHhtY-0000000GBZa-1DCe;
	Thu, 13 Jun 2024 10:41:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHhtV-0000000GBZ9-3EYM;
	Thu, 13 Jun 2024 10:41:27 +0000
X-UUID: 7893e780297111efaf04eb0598667787-20240613
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=bYl5pSl2HjwLJjDCYGRQ01twN9nVzCw5LEjgUTb4KAE=;
	b=NoKSWkoMEhQHekNJc/erHEd2eUE97P7PlIhspp82F5v2iUZWrBfklNDQGIV2NFuMUuwu7VpjYYVi/ZdC2ny99wf5FBuOTLab2cJLRGfVPI+QfBHVoWtTYRuQvyhSOFwof20Vo/VbFCFabygdwsdpuqgWB259wQd4LI0bchT97Hc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:0ca68c85-bffe-4d42-b4d7-f3a14be717df,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:f7b60b85-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7893e780297111efaf04eb0598667787-20240613
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 927958209; Thu, 13 Jun 2024 03:41:20 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 13 Jun 2024 18:41:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 13 Jun 2024 18:41:16 +0800
From: Sky Huang <SkyLake.Huang@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Daniel Golle
	<daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, SkyLake Huang
	<SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Steven Liu <Steven.Liu@mediatek.com>, SkyLake.Huang
	<skylake.huang@mediatek.com>
Subject: [PATCH net-next v7 0/5] net: phy: mediatek: Introduce mtk-phy-lib and add 2.5Gphy support
Date: Thu, 13 Jun 2024 18:40:18 +0800
Message-ID: <20240613104023.13044-1-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.801800-8.000000
X-TMASE-MatchedRID: e1D+mFe0mXuGeTbGWdRz1qUebN0FQAbYvtVce6w5+K9xUZeguPBDQcbK
	+pu0ZYwR6NJ1g8TkaiY/4sXBdVnb/U2VnXMRzIBj4bl1FkKDELchotH7bEpEMmecrqZc3vabN1L
	b3d91KD/symnxq9L1AixzufF6vmDubw8f/jlV5scdxBAG5/hkW1sChor7BLiN10wPNIuvyi/Akt
	gDJtZ0AmMl2fVuI+54nGl+g77/qoc/REwOA9OGte7KTDtx8CggLE3mrqeLTCsOUs4CTUgKy0MHU
	R1yMHZ62JwKrFIIzlEaMs2ZphvTvQRCoiooUu1OA9lly13c/gHP5QiZIw0wxWRuoH6AAg50sSZN
	qeM/MnPi8zVgXoAltsIJ+4gwXrEtec3QM3secWb9FrvjN37cjs6dVk653dl9gVlcaoETd3QgU0m
	9IDxSzqeMhmfVt3m0lExlQIQeRG0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.801800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 7E0AEE2C83F0514728601953A5884EA2C46D46FA75B4FAADF7D439653A1F5D422000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_034125_867867_04FCBA76 
X-CRM114-Status: GOOD (  14.55  )
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

From: "SkyLake.Huang" <skylake.huang@mediatek.com>

This patch series integrate MediaTek's built-in Ethernet PHY helper functions
into mtk-phy-lib and add more functions into it. Also, add support for 2.5Gphy
on MT7988 SoC.

Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>
---
Changes in v2:
- Apply correct PATCH tag.
- Break LED/Token ring/Extend-link-pulse-time features into 3 patches.
- Fix contents according to v1 comments.

Changes in v3:
- Rebase code and now this patch series can apply to net-next tree.
[PATCH 4/5]
Refactor mtk_gphy_cl22_read_status() with genphy_read_status().
[PATCH 5/5]
1. Add range check for firmware.
2. Fix c45_ids.mmds_present in probe function.
3. Still use genphy_update_link() in read_status because
genphy_c45_read_link() can't correct detect link on this phy.

Changes in v4:
[PATCH 4/5]
1. Change extend_an_new_lp_cnt_limit()'s return type and all return values
2. Refactor comments in extend_an_new_lp_cnt_limit()
[PATCH 5/5]
1. Move firmware loading function to mt798x_2p5ge_phy_load_fw()
2. Add AN disable warning in mt798x_2p5ge_phy_config_aneg()
3. Clarify the HDX comments in mt798x_2p5ge_phy_get_features()

Changes in v5:
- Fix syntax errors of comments in drivers/net/phy/mediatek/*
[PATCH 1/5]
- Change MEDIATEK_GE_SOC_PHY from bool back to tristate.
[PATCH 5/5]
1. Move md32_en_cfg_base & pmb_addr to local variables to achieve
symmetric code.
2. Print out firmware date code & version.
3. Don't return error if LED pinctrl switching fails. Also, add
comments to this unusual operations.
4. Return -EOPNOTSUPP for AN off case in config_aneg().

Changes in v6:
- Re-arrange patch and changes description in cover letter.
- Contraint code inside 80 columns wide.
[PATCH 4/5]
1. Add LP_DETECTED so extend_an_new_lp_cnt_limit() won't be called every
time we poll the PHY for its status. It'll be called only when cable is
plugged in and 1G training starts.
2. Call phy_read_paged() instead of calling phy_select_page() &
phy_restore_page() pair.
[PATCH 5/5]
1. Force casting (fw->data + MT7988_2P5GE_PMB_SIZE - 8) with __be16.
2. Remove parens on RHS of "phydev->c45_ids.mmds_present |=".
3. Add PHY_INTERFACE_MODE_INTERNAL check in
mt798x_2p5ge_phy_get_rate_matching()
4. Arrange local variables in reverse Xmas tree order.

Changes in v7:
[PATCH 5/5]
1. Add phy mode check(PHY_INTERFACE_MODE_INTERNAL) in config_init().
2. Always return RATE_MATCH_PAUSE in get_rate_matching().
---
SkyLake.Huang (5):
  net: phy: mediatek: Re-organize MediaTek ethernet phy drivers
  net: phy: mediatek: Move LED and read/write page helper functions into
    mtk phy lib
  net: phy: mediatek: Add token ring access helper functions in
    mtk-phy-lib
  net: phy: mediatek: Extend 1G TX/RX link pulse time
  net: phy: add driver for built-in 2.5G ethernet PHY on MT7988

 MAINTAINERS                                   |   7 +-
 drivers/net/phy/Kconfig                       |  17 +-
 drivers/net/phy/Makefile                      |   3 +-
 drivers/net/phy/mediatek-ge.c                 | 111 ---
 drivers/net/phy/mediatek/Kconfig              |  38 ++
 drivers/net/phy/mediatek/Makefile             |   5 +
 drivers/net/phy/mediatek/mtk-2p5ge.c          | 436 ++++++++++++
 .../mtk-ge-soc.c}                             | 640 ++++++++----------
 drivers/net/phy/mediatek/mtk-ge.c             | 249 +++++++
 drivers/net/phy/mediatek/mtk-phy-lib.c        | 427 ++++++++++++
 drivers/net/phy/mediatek/mtk.h                | 116 ++++
 11 files changed, 1545 insertions(+), 504 deletions(-)
 delete mode 100644 drivers/net/phy/mediatek-ge.c
 create mode 100644 drivers/net/phy/mediatek/Kconfig
 create mode 100644 drivers/net/phy/mediatek/Makefile
 create mode 100644 drivers/net/phy/mediatek/mtk-2p5ge.c
 rename drivers/net/phy/{mediatek-ge-soc.c => mediatek/mtk-ge-soc.c} (74%)
 create mode 100644 drivers/net/phy/mediatek/mtk-ge.c
 create mode 100644 drivers/net/phy/mediatek/mtk-phy-lib.c
 create mode 100644 drivers/net/phy/mediatek/mtk.h

-- 
2.18.0


