Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C89C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Apr 2022 13:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f2gALrf+huOyjlOJZZWJnBEryxiheLsB/Jft8OVmCe8=; b=SDNl6RlGQ92wgM
	FqiO5zoFW8TMJ8ZzATT2iW0SNniPeM8kXnEk7E/BiNF8c7h/53CrkHGG4nyyejJkuwt1Fruz7HKYS
	LZetU9eGud9EhWxioi9rZq43nvQzGnQH4lIXLlOwPCOy1nHQrJq6xJPJbt89o9QXWb1oOaS4BtPjq
	c5LIq8b+mtljAl/6A4mwP/JbvUKtyZ+XeEz6bAkq2RMvrw5JmaKp08oZ0yiO2g7lpXbd7+Q85X2KN
	nWDvAmn/nY1jR4lgJMcCLjy1gTRMjHhRv/lQG3zOdFYlUNXiS+8ZxLWzuahqdzOgNmOTETAFplRIw
	Tydk/cANoysvDSL+dXYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngRLS-00H07M-7S; Mon, 18 Apr 2022 13:23:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngRKu-00Gzoo-HD; Mon, 18 Apr 2022 13:22:37 +0000
X-UUID: 5769b6c8fc804bd49d608f1867e2e769-20220418
X-UUID: 5769b6c8fc804bd49d608f1867e2e769-20220418
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1536095646; Mon, 18 Apr 2022 06:22:25 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Apr 2022 06:22:23 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 18 Apr 2022 21:22:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 18 Apr 2022 21:22:22 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
 <angelogioacchino.delregno@collabora.com>, <chun-jie.chen@mediatek.com>,
 <wenst@chromium.org>, <yong.liang@mediatek.com>, <runyang.chen@mediatek.com>, 
 <linux-kernel@vger.kernel.org>, <allen-kh.cheng@mediatek.com>,
 <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH 0/7] Cleanup MediaTek clk reset drivers
Date: Mon, 18 Apr 2022 21:21:47 +0800
Message-ID: <20220418132154.7401-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_062236_590867_F55740EE 
X-CRM114-Status: UNSURE (   8.05  )
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

In this series, we cleanup MediaTek clock reset drivers in clk/mediatek
folder. MediaTek clock reset driver is used to provide reset control
of modules controlled in clk, like infra_ao.

Rex-BC Chen (7):
  clk: mediatek: reset: Correct the logic of setting register
  clk: mediatek: reset: Rename reset function
  clk: mediatek: reset: Merge and revise reset register function
  clk: mediatek: reset: Add reset.h
  clk: mediatek: reset: Revise structure to control reset register
  clk: mediatek: reset: Add support for unregister reset controller
  clk: mediatek: reset: Add reset support for simple probe/remove

 drivers/clk/mediatek/clk-mt2701-eth.c |  15 ++-
 drivers/clk/mediatek/clk-mt2701-g3d.c |  15 ++-
 drivers/clk/mediatek/clk-mt2701-hif.c |  11 +-
 drivers/clk/mediatek/clk-mt2701.c     |  23 +++-
 drivers/clk/mediatek/clk-mt2712.c     |  31 ++++--
 drivers/clk/mediatek/clk-mt7622-eth.c |  15 ++-
 drivers/clk/mediatek/clk-mt7622-hif.c |  31 ++++--
 drivers/clk/mediatek/clk-mt7622.c     |  23 +++-
 drivers/clk/mediatek/clk-mt7629-eth.c |  15 ++-
 drivers/clk/mediatek/clk-mt7629-hif.c |  31 ++++--
 drivers/clk/mediatek/clk-mt8135.c     |  27 ++++-
 drivers/clk/mediatek/clk-mt8173.c     |  27 ++++-
 drivers/clk/mediatek/clk-mt8183.c     |  11 +-
 drivers/clk/mediatek/clk-mtk.c        |   6 +
 drivers/clk/mediatek/clk-mtk.h        |   8 +-
 drivers/clk/mediatek/reset.c          | 153 ++++++++++++++------------
 drivers/clk/mediatek/reset.h          |  32 ++++++
 17 files changed, 331 insertions(+), 143 deletions(-)
 create mode 100644 drivers/clk/mediatek/reset.h

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
