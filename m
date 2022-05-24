Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C20AC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 May 2022 08:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R235b9wLPjahqIQRIg6LBfm6qY+AuJqA37fbchmu/RA=; b=OEZJSKpdHO4nxN
	b/YyB6tiNdnlsq6vT00gYwoFTNDref9tv7iXihvwZk5V3XC91pXVseBVNmD0+s478sf0zC14BuOkB
	XZmTmbY++eiSY4fOb10hLQ9uLFJH9Iqi7nwqcQCGf6DFjlVZ+DCMS5BrDelyqv1Q4zeMEPR2V5XDO
	EWqiy3307jFu6FrzJJh62z+/b7UqrbrGNYhi7zRFjN8BzlrjaQf8QipDiN+PMioGwkqMZtgPVNdsq
	oq1H+vPkrlWf8xsCIuCr3wzM5mjJRLYNaWf+5sW2mx9dzV6746bdRRLKxOCmC4BsMG5pU8EkyTGFA
	zYKer4qwvdo3+BcXWnaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntQ4W-007FeY-Cr; Tue, 24 May 2022 08:39:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntQ4A-007FYf-FJ; Tue, 24 May 2022 08:39:01 +0000
X-UUID: 7c074c39638f472c9fb3a666c5df02a7-20220524
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:a8b56248-cc66-4048-a294-e8df6b63466d, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:2a19b09, CLOUDID:ad855ee3-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 7c074c39638f472c9fb3a666c5df02a7-20220524
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1201102290; Tue, 24 May 2022 01:38:50 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 May 2022 01:38:49 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 May 2022 16:38:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 24 May 2022 16:38:48 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>, Miles Chen <miles.chen@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 0/7] clk: mediatek: use mtk_clk_simple_probe to simplify
 driver
Date: Tue, 24 May 2022 16:38:33 +0800
Message-ID: <20220524083843.9994-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_013858_556088_83655DEC 
X-CRM114-Status: GOOD (  13.17  )
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

Hi everyone,

This is v2 patches to use mtk_clk_simple_probe to simplify driver.

Change since v1:
- Angelo's patch [1] already exported mtk_clk_simple_probe and mtk_clk_simple_remove,
so drop this part from my v1 and depends on [1].
- add a reviewed-by tag

mtk_clk_simple_probe() was introduced by Chun-Jie in commit
c58cd0e40ffa ("clk: mediatek: Add mtk_clk_simple_probe() to simplify clock providers")
and mtk_clk_simple_remove() was added in commit
commit 2204d96b1919 ("clk: mediatek: Add mtk_clk_simple_remove()")

With mtk_clk_simple_probe and mtk_clk_simple_remove,
we can get rid of defining the same probe function in clk drivers.
mtk_clk_simple_probe and mtk_clk_simple_remove are used in new platforms
now, let's apply them to old SoCs.

The process is quite straightforward: 
a. Look up probe functions which can be replaced by mtk_clk_simple_probe()
b. Add mtk_clk_desc and add .data
c. Replace the probe function with mtk_clk_simple_probe and mtk_clk_simple_remove

I tested the series on MT8192 and MT6779.
This patch is based on next-20220523 and [1].

Thanks,
Miles

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20220518111652.223727-7-angelogioacchino.delregno@collabora.com/



*** BLURB HERE ***

Miles Chen (7):
  clk: mediatek: mt2701: use mtk_clk_simple_probe to simplify driver
  clk: mediatek: mt2712: use mtk_clk_simple_probe to simplify driver
  clk: mediatek: mt6765: use mtk_clk_simple_probe to simplify driver
  clk: mediatek: mt6779: use mtk_clk_simple_probe to simplify driver
  clk: mediatek: mt6797: use mtk_clk_simple_probe to simplify driver
  clk: mediatek: mt8183: use mtk_clk_simple_probe to simplify driver
  clk: mediatek: mt8192: add mtk_clk_simple_remove

 drivers/clk/mediatek/clk-mt2701-bdp.c         | 36 +++++++------------
 drivers/clk/mediatek/clk-mt2701-img.c         | 36 +++++++------------
 drivers/clk/mediatek/clk-mt2701-vdec.c        | 36 +++++++------------
 drivers/clk/mediatek/clk-mt2712-bdp.c         | 34 +++++++-----------
 drivers/clk/mediatek/clk-mt2712-img.c         | 34 +++++++-----------
 drivers/clk/mediatek/clk-mt2712-jpgdec.c      | 34 +++++++-----------
 drivers/clk/mediatek/clk-mt2712-mfg.c         | 34 +++++++-----------
 drivers/clk/mediatek/clk-mt2712-vdec.c        | 34 +++++++-----------
 drivers/clk/mediatek/clk-mt2712-venc.c        | 34 +++++++-----------
 drivers/clk/mediatek/clk-mt6765-audio.c       | 34 +++++++-----------
 drivers/clk/mediatek/clk-mt6765-cam.c         | 33 +++++++----------
 drivers/clk/mediatek/clk-mt6765-img.c         | 33 +++++++----------
 drivers/clk/mediatek/clk-mt6765-mipi0a.c      | 34 +++++++-----------
 drivers/clk/mediatek/clk-mt6765-mm.c          | 33 +++++++----------
 drivers/clk/mediatek/clk-mt6765-vcodec.c      | 34 +++++++-----------
 drivers/clk/mediatek/clk-mt6779-aud.c         | 29 +++++++--------
 drivers/clk/mediatek/clk-mt6779-cam.c         | 29 +++++++--------
 drivers/clk/mediatek/clk-mt6779-img.c         | 29 +++++++--------
 drivers/clk/mediatek/clk-mt6779-ipe.c         | 29 +++++++--------
 drivers/clk/mediatek/clk-mt6779-mfg.c         | 27 +++++++-------
 drivers/clk/mediatek/clk-mt6779-vdec.c        | 29 +++++++--------
 drivers/clk/mediatek/clk-mt6779-venc.c        | 29 +++++++--------
 drivers/clk/mediatek/clk-mt6797-img.c         | 36 +++++++------------
 drivers/clk/mediatek/clk-mt6797-vdec.c        | 36 +++++++------------
 drivers/clk/mediatek/clk-mt6797-venc.c        | 36 +++++++------------
 drivers/clk/mediatek/clk-mt8183-cam.c         | 27 +++++++-------
 drivers/clk/mediatek/clk-mt8183-img.c         | 27 +++++++-------
 drivers/clk/mediatek/clk-mt8183-ipu0.c        | 27 +++++++-------
 drivers/clk/mediatek/clk-mt8183-ipu1.c        | 27 +++++++-------
 drivers/clk/mediatek/clk-mt8183-ipu_adl.c     | 27 +++++++-------
 drivers/clk/mediatek/clk-mt8183-ipu_conn.c    | 27 +++++++-------
 drivers/clk/mediatek/clk-mt8183-mfgcfg.c      | 29 +++++++--------
 drivers/clk/mediatek/clk-mt8183-vdec.c        | 27 +++++++-------
 drivers/clk/mediatek/clk-mt8183-venc.c        | 27 +++++++-------
 drivers/clk/mediatek/clk-mt8192-cam.c         |  1 +
 drivers/clk/mediatek/clk-mt8192-img.c         |  1 +
 .../clk/mediatek/clk-mt8192-imp_iic_wrap.c    |  1 +
 drivers/clk/mediatek/clk-mt8192-ipe.c         |  1 +
 drivers/clk/mediatek/clk-mt8192-mdp.c         |  1 +
 drivers/clk/mediatek/clk-mt8192-mfg.c         |  1 +
 drivers/clk/mediatek/clk-mt8192-msdc.c        |  1 +
 drivers/clk/mediatek/clk-mt8192-scp_adsp.c    |  1 +
 drivers/clk/mediatek/clk-mt8192-vdec.c        |  1 +
 drivers/clk/mediatek/clk-mt8192-venc.c        |  1 +
 44 files changed, 430 insertions(+), 647 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
