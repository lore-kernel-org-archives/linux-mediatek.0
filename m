Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1F3C25B74
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 May 2024 03:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cs05OID3e7uX2ZECYRsXuLx9IE5E1oSN2ODuOpcM6zg=; b=mA3PLpj6bdxnYFt7KRHrdxYO2W
	KtFgslS+ZXGLAezCehKmsX6wDZNuKBDK2TT0ssnV+A6Ju/Xl19gOJUrEu4KEhjHLOrlug8ryo+HCb
	izHw9JPQMRRB/zDQcM2JvfxExlatX827bh+UREHLtxEVC4rv+Xe/fjSeoO0I7S6s9oeo5JAx4ZYuO
	eB4KZL5vqBEW8Adrob0VxcqrakCNujCLA1W3cYL9Qc1BmwEonxjAsiEPl3icruFRGOw1qW/p4zvb5
	dpRmMZHlyUQEbqzQ3HyGAOwoUvDlzb6o5S319U2xdgPYYV1Cax1HG43jOTqzwqUtVlqtOEzfR++5K
	TVu0ND9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCWmp-00000006DsZ-1OaS;
	Thu, 30 May 2024 03:49:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCWmm-00000006Drp-2Ctu;
	Thu, 30 May 2024 03:49:05 +0000
X-UUID: 8a8b22fe1e3711efbf6c7d4f5c147266-20240529
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=cs05OID3e7uX2ZECYRsXuLx9IE5E1oSN2ODuOpcM6zg=;
	b=Ig67y8G76llzUydslvKh4BQnchTCbl0EB3beO6vgo2tf/pdDwAYTV6fUeKNTOc1Ffnazft0+Ah5fcaAgZmmFNMHzeDKqhebK3aA5OM+UeikBdM7pChlpYx4y8irhsXx71DGwtaxDS2x4NUAxdTrXjxEqiojSh6Fa1CBVnjVpuUE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:a36f6b53-e654-45f7-b9f4-4b8637618a5a,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:393d96e,CLOUDID:9aa3fd87-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8a8b22fe1e3711efbf6c7d4f5c147266-20240529
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 260751747; Wed, 29 May 2024 20:48:56 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 30 May 2024 11:48:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 30 May 2024 11:48:54 +0800
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
Subject: [PATCH net-next v5 0/5] net: phy: mediatek: Introduce mtk-phy-lib and add 2.5Gphy support
Date: Thu, 30 May 2024 11:48:39 +0800
Message-ID: <20240530034844.11176-1-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_204904_616286_7C0EE2B0 
X-CRM114-Status: GOOD (  14.52  )
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

v2:
- Apply correct PATCH tag.
- Break LED/Token ring/Extend-link-pulse-time features into 3 patches.
- Fix contents according to v1 comments.

v3:
- Rebase code and now this patch series can apply to net-next tree.
[PATCH 4/5]
Refactor mtk_gphy_cl22_read_status() with genphy_read_status().
[PATCH 5/5]
1. Add range check for firmware.
2. Fix c45_ids.mmds_present in probe function.
3. Still use genphy_update_link() in read_status because
genphy_c45_read_link() can't correct detect link on this phy.

v4:
[PATCH 4/5]
1. Change extend_an_new_lp_cnt_limit()'s return type and all return values
2. Refactor comments in extend_an_new_lp_cnt_limit()
[PATCH 5/5]
1. Move firmware loading function to mt798x_2p5ge_phy_load_fw()
2. Add AN disable warning in mt798x_2p5ge_phy_config_aneg()
3. Clarify the HDX comments in mt798x_2p5ge_phy_get_features()

v5:
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
 drivers/net/phy/mediatek-ge.c                 | 111 ----
 drivers/net/phy/mediatek/Kconfig              |  38 ++
 drivers/net/phy/mediatek/Makefile             |   5 +
 drivers/net/phy/mediatek/mtk-2p5ge.c          | 423 ++++++++++++++
 .../mtk-ge-soc.c}                             | 528 ++++++------------
 drivers/net/phy/mediatek/mtk-ge.c             | 244 ++++++++
 drivers/net/phy/mediatek/mtk-phy-lib.c        | 385 +++++++++++++
 drivers/net/phy/mediatek/mtk.h                | 108 ++++
 11 files changed, 1391 insertions(+), 478 deletions(-)
 delete mode 100644 drivers/net/phy/mediatek-ge.c
 create mode 100644 drivers/net/phy/mediatek/Kconfig
 create mode 100644 drivers/net/phy/mediatek/Makefile
 create mode 100644 drivers/net/phy/mediatek/mtk-2p5ge.c
 rename drivers/net/phy/{mediatek-ge-soc.c => mediatek/mtk-ge-soc.c} (77%)
 create mode 100644 drivers/net/phy/mediatek/mtk-ge.c
 create mode 100644 drivers/net/phy/mediatek/mtk-phy-lib.c
 create mode 100644 drivers/net/phy/mediatek/mtk.h

-- 
2.18.0


