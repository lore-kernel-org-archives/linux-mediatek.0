Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492AEC4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Apr 2024 02:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sVluxtdFfxvzOV3SS9bUZugPrDEZjGZyriZnqollBEc=; b=uiTlbEyWKu753qJtbKrg13ztw7
	kM3rmhQeEEWBjT7dym+uHL8V8dr/uRHZzshBuNiTYSRW3rrZjiSMsJlOU0t3UEYbUN3+/ppiLguqi
	m8/LmaZzNC8g06widsgZyUoZXKikc58oJqyHgHICwpe3OmTgJj7N6BouxbDGWWxoFe8z4NLC0DTOz
	/RTXEwOVXhcaYUgvrfkEI9z/NlHe+jM1roI4n1nX/F+FZFY5klLAEqWEVdBLE/+1PohCHOyfXz1as
	RDqzrldyBZR/SKheyeG0m/jzX9qb/FrVMyI//IN2qKfiFW3FJmnwBjnJvASTdMlBIZDj2HdI4p51A
	Fggtx/6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzovv-00000006iCg-2XkN;
	Thu, 25 Apr 2024 02:33:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzovs-00000006iBj-2t9o;
	Thu, 25 Apr 2024 02:33:58 +0000
X-UUID: 3ef6f12a02ac11ef96d5dfc950b7243d-20240424
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=sVluxtdFfxvzOV3SS9bUZugPrDEZjGZyriZnqollBEc=;
	b=S0NhkdMdngEvDDEDoI+1ij5N3DWOEskSEjPdVJHOsBuE8gR95b8YrICapBtX6LmuXi9k663+G6n//lUxySUlokFzSDTYhsQaIrtRdaVHIKwJEO5qmbPmyz5yYsYtnLOpThhxTDVubtSuKJ3Bwnvfx8IyeHSSamxy4HwAOezuAsQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:1ed01b6c-cdda-48dc-bd90-a13984637a6b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:82c5f88,CLOUDID:cf2552fb-ed05-4274-9204-014369d201e8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3ef6f12a02ac11ef96d5dfc950b7243d-20240424
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 472720773; Wed, 24 Apr 2024 19:33:48 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 24 Apr 2024 19:33:45 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 25 Apr 2024 10:33:45 +0800
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
Subject: [PATCH 0/3] net: phy: mediatek: Integrate mtk-phy-lib and add 2.5Gphy support
Date: Thu, 25 Apr 2024 10:33:22 +0800
Message-ID: <20240425023325.15586-1-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_193356_766544_28C15515 
X-CRM114-Status: GOOD (  10.98  )
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

Re-organize MTK ethernet phy drivers and integrate common manipulations
into mtk-phy-lib. Also, add support for build-in 2.5Gphy on MT7988.

SkyLake.Huang (3):
  net: phy: mediatek: Re-organize MediaTek ethernet phy drivers
  net: phy: mediatek: Add mtk phy lib for token ring access & LED/other
    manipulations
  net: phy: mediatek: add support for built-in 2.5G ethernet PHY on
    MT7988

 MAINTAINERS                                   |   7 +-
 drivers/net/phy/Kconfig                       |  17 +-
 drivers/net/phy/Makefile                      |   3 +-
 drivers/net/phy/mediatek-ge.c                 | 111 ----
 drivers/net/phy/mediatek/Kconfig              |  33 ++
 drivers/net/phy/mediatek/Makefile             |   5 +
 drivers/net/phy/mediatek/mtk-2p5ge.c          | 399 +++++++++++++
 .../mtk-ge-soc.c}                             | 522 ++++++++----------
 drivers/net/phy/mediatek/mtk-ge.c             | 191 +++++++
 drivers/net/phy/mediatek/mtk-phy-lib.c        | 330 +++++++++++
 drivers/net/phy/mediatek/mtk.h                |  97 ++++
 11 files changed, 1277 insertions(+), 438 deletions(-)
 delete mode 100644 drivers/net/phy/mediatek-ge.c
 create mode 100644 drivers/net/phy/mediatek/Kconfig
 create mode 100644 drivers/net/phy/mediatek/Makefile
 create mode 100644 drivers/net/phy/mediatek/mtk-2p5ge.c
 rename drivers/net/phy/{mediatek-ge-soc.c => mediatek/mtk-ge-soc.c} (79%)
 create mode 100644 drivers/net/phy/mediatek/mtk-ge.c
 create mode 100644 drivers/net/phy/mediatek/mtk-phy-lib.c
 create mode 100644 drivers/net/phy/mediatek/mtk.h

-- 
2.18.0


