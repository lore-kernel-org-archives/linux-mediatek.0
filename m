Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C7B9C25B74
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 May 2024 10:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wuo82/CjSuzvS9rorGjFVfi+CheqmElwoEW/3RaeBDc=; b=BsLj5OGGXiyktf5iQT7sf6t3qv
	3ZXbRxUpGkskajxpejEggCMwwkw+/WUJc2Fu1dG2m9+DwpE6NDvlNGmlt+bx5iqt3/Z9ltKPfWynP
	78O5SFwnVF0YYjvkF5Ntwuae3tLJanqJ+6kgMFyy7e0QP4COjsRxepQzn7Awk4IucTiLUSOkwNedH
	0vi+pTYZBSTfiOjd45k0bk40zKHWrYmRESWrz7MjNJ4G4pAtqG2eX3nQjL5h7CI4KgNqRKawAM63b
	NPOffxeadsaWb+PXwxGtRUGIkcr0bICqWB9BZg2ombTKr1gTXbUG66i2oNUeH+KdcA2UueKkNl+Cx
	OLUfQa0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9MZr-0000000H3qR-0otX;
	Tue, 21 May 2024 10:18:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9MY3-0000000H2rK-3tbM;
	Tue, 21 May 2024 10:16:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Wuo82/CjSuzvS9rorGjFVfi+CheqmElwoEW/3RaeBDc=; b=cgiQKSWWJMD0QUslaoO+IcNWKk
	xa123w8h/TBIMbi1cgX4Dn6PNEGeAogshIdUZlyJLwnGjy51k+uTYEFLti6RTq62+mfLUCKD0rI/h
	2ReHvxIHjBkx4G1q0D7/tKh97upIkTN4PB3Z6Ge7UIEjj5sasSAy760PXQrwTV51vbj4nrcPYjX9x
	m12O7PY9vVPiFNjudumJ/4Na1ciALRmRRE1UrhIuClZqIXUiUGquGO5z+kKWdb+4ohc40h745fTgm
	cFhlnIH5h7R1J+Cet4xwdD7E0W4aO4lTEYeRDya47yudb2sH4xWfYd4TbGMjpUjNNHmNNwIwiI6nk
	GYnjc0eQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9MXt-00000006gAN-3DzC;
	Tue, 21 May 2024 10:16:44 +0000
X-UUID: 3085e812175b11ef9a78ddf43a9225dc-20240521
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Wuo82/CjSuzvS9rorGjFVfi+CheqmElwoEW/3RaeBDc=;
	b=Zs6huBgFqI9NtWlnNWWFIcpwBm3ePDKr9Bxi5Of/RpiFLxzB02NfttN7KRW+Cud14r7/Kc+epIecDMIjrSuCL6pRPEXg8yv8VAhH0TLZJLjLvc6v8jHU8rG1ppzoWOIAcxjSKhp/rzOAwEP+Kf81DA6H/YybHOoPoHQyx5c4dA4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:ceaf21e9-9f74-49a1-b798-24f49eb3f09d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:82c5f88,CLOUDID:da482084-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3085e812175b11ef9a78ddf43a9225dc-20240521
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 15126270; Tue, 21 May 2024 03:16:29 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 21 May 2024 18:15:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 21 May 2024 18:15:53 +0800
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
Subject: [PATCH net-next v4 0/5] net: phy: mediatek: Introduce mtk-phy-lib and add 2.5Gphy support
Date: Tue, 21 May 2024 18:15:43 +0800
Message-ID: <20240521101548.9286-1-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_111638_833318_F641D43B 
X-CRM114-Status: GOOD (  12.78  )
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

e-organize MTK ethernet phy drivers and integrate common manipulations
into mtk-phy-lib. Also, add support for build-in 2.5Gphy on MT7988.

v2:
- Apply correct PATCH tag.
- Break LED/Token ring/Extend-link-pulse-time features into 3 patches.
- Fix contents according to v1 comments.

v3:
- Fix patch 4/5 & 5/5. Please see changes in 4/5 & 5/5's commit log.
- Rebase code and now this patch series can apply to net-next tree.

v4:
- Fix patch 4/5 & 5/5. Please see changes in 4/5 & 5/5's commit log.

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
 drivers/net/phy/mediatek/mtk-2p5ge.c          | 419 ++++++++++++++
 .../mtk-ge-soc.c}                             | 528 ++++++------------
 drivers/net/phy/mediatek/mtk-ge.c             | 244 ++++++++
 drivers/net/phy/mediatek/mtk-phy-lib.c        | 385 +++++++++++++
 drivers/net/phy/mediatek/mtk.h                | 108 ++++
 11 files changed, 1387 insertions(+), 478 deletions(-)
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


