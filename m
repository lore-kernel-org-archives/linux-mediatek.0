Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEC0C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 13:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4K2FW2LhDRk2rEwYQC27e9CK0AkuNGay6UYFKa7Erug=; b=PWwhyRzQUFSPsy
	ru0MREtedBo2vDoo9gXccZnaIB/1SpYWwxk2WhB2z5RsSjEtXnIB5yZkcMWPgp9i6Hb8kv3qeh40+
	7qCY1Khsm47dhcV9klLLpUtP1+oNjcF9yn8GFewaQJG9GQ7tpNfoo1H7nPwB1O/Mp5QQKQtkLH/oa
	D+ZrtMZDNvYtPvWO3R/H2HH4vwZCRgmu0K//V5pRKcXEG7yNbS3DfJqfIvhAZvzkCQnn7VdlVx7nK
	r/tjmSTrFpTW/XmMkyjYJTwQyg+O5zhxiSCoPf0vKOzFgqwV8nneWPpn+E3m4mu5JhMOW3nzASnlv
	Zn6ddMte6TxzkLd4KbIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhADV-00998p-Vg; Wed, 20 Apr 2022 13:17:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhABK-0098Gn-2v; Wed, 20 Apr 2022 13:15:43 +0000
X-UUID: 7981574ed2e64a4482448eede22fe073-20220420
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:3ad6b9ef-196c-4ce7-9045-b614c58a37dc, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:f7135df0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 7981574ed2e64a4482448eede22fe073-20220420
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1555465145; Wed, 20 Apr 2022 06:15:38 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Apr 2022 06:05:36 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 20 Apr 2022 21:05:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 20 Apr 2022 21:05:28 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
 <angelogioacchino.delregno@collabora.com>, <chun-jie.chen@mediatek.com>,
 <wenst@chromium.org>, <runyang.chen@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <allen-kh.cheng@mediatek.com>,
 <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH V2 00/12] Cleanup MediaTek clk reset drivers and support
 MT8192/MT8195
Date: Wed, 20 Apr 2022 21:05:15 +0800
Message-ID: <20220420130527.23200-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_061542_163908_2A2FEC13 
X-CRM114-Status: GOOD (  10.72  )
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

In this series, we cleanup MediaTek clock reset drivers in clk/mediatek
folder. MediaTek clock reset driver is used to provide reset control
of modules controlled in clk, like infra_ao.

Changes for V2:
1. Modify drivers for reviewers' comments.
2. Use simple reset to replace v1.
3. Recover v2 to set_clr.
4. Separate error handling to another patch.
5. Add support for input offset and bit from DT.
6. Add support for MT8192 and MT8195.

Rex-BC Chen (12):
  clk: mediatek: reset: Fix written reset bit offset
  clk: mediatek: reset: Use simple reset operations
  clk: mediatek: reset: Refine functions of set_clr
  clk: mediatek: reset: Merge and revise reset register function
  clk: mediatek: reset: Add reset.h
  clk: mediatek: reset: Revise structure to control reset register
  clk: mediatek: reset: Add return for clock reset register function
  clk: mediatek: reset: Add new register reset function with device
  clk: mediatek: reset: Add support for input offset and bit from DT
  clk: mediatek: reset: Add reset support for simple probe
  clk: mediatek: reset: Add infra_ao reset support for MT8192
  clk: mediatek: reset: Add infra_ao reset support for MT8195

 drivers/clk/mediatek/Kconfig               |   1 +
 drivers/clk/mediatek/clk-mt2701-eth.c      |   8 +-
 drivers/clk/mediatek/clk-mt2701-g3d.c      |   8 +-
 drivers/clk/mediatek/clk-mt2701-hif.c      |   8 +-
 drivers/clk/mediatek/clk-mt2701.c          |  19 ++-
 drivers/clk/mediatek/clk-mt2712.c          |  19 ++-
 drivers/clk/mediatek/clk-mt7622-eth.c      |   8 +-
 drivers/clk/mediatek/clk-mt7622-hif.c      |  10 +-
 drivers/clk/mediatek/clk-mt7622.c          |  19 ++-
 drivers/clk/mediatek/clk-mt7629-eth.c      |   8 +-
 drivers/clk/mediatek/clk-mt7629-hif.c      |  10 +-
 drivers/clk/mediatek/clk-mt8135.c          |  19 ++-
 drivers/clk/mediatek/clk-mt8173.c          |  19 ++-
 drivers/clk/mediatek/clk-mt8183.c          |   8 +-
 drivers/clk/mediatek/clk-mt8192.c          |  11 ++
 drivers/clk/mediatek/clk-mt8195-infra_ao.c |   8 +
 drivers/clk/mediatek/clk-mtk.c             |   7 +
 drivers/clk/mediatek/clk-mtk.h             |   9 +-
 drivers/clk/mediatek/reset.c               | 175 +++++++++++++--------
 drivers/clk/mediatek/reset.h               |  36 +++++
 include/dt-bindings/reset/mt8192-resets.h  |  11 ++
 include/dt-bindings/reset/mt8195-resets.h  |   7 +
 22 files changed, 333 insertions(+), 95 deletions(-)
 create mode 100644 drivers/clk/mediatek/reset.h

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
