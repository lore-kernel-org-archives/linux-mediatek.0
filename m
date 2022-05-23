Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B97C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 16:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=12jyEwcevnMgkLYrbGP72sAA+RYIohi9TgARc4O2+wA=; b=WOOoTBSPzaRKPV
	1uF49n6g/TTh3uN1x6TAvmhWif0tyTdG5g3rUH+6DSAuVBhTqN1DzpW7vLxnRsmfWCEi3T6O7augS
	nrggGhgUHBitWvUsqDmD98ZZYSGQUlIuqJIWeTs6YOv4fxkbRMw+rCXCx64fjEF3q24n7fl7ByQCS
	RXqKyjk25Ga3mJkMiS1DlD6gTXZphFclzbx8x8q+pw6FgcwDAWXccEBXl16xx7wXev1lvq8My7tLD
	aSkd1OC4W3BpzjS2lC1RciQsIyb+zg0S/ef/6CVAvqO0puJl4qpEupGk6u0rXmDEfCI3Iokf1DweH
	MkodO6wbndxNt/aDa7Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntAdX-0058ic-89; Mon, 23 May 2022 16:10:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntAcb-0058Hv-Lj; Mon, 23 May 2022 16:09:32 +0000
X-UUID: aa4af5ae2e584b47a10af7e9b0e0a219-20220523
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:fdb3164a-d4b7-4896-9f7c-19134df17e0e, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:2a19b09, CLOUDID:3dd9507a-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: aa4af5ae2e584b47a10af7e9b0e0a219-20220523
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1044553957; Mon, 23 May 2022 09:09:25 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 09:00:56 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 May 2022 00:00:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 24 May 2022 00:00:55 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>, Miles Chen <miles.chen@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 0/8] clk: mediatek: use mtk_clk_simple_probe to simplify
 driver 
Date: Tue, 24 May 2022 00:00:42 +0800
Message-ID: <20220523160053.1922-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_090929_751965_724A56AF 
X-CRM114-Status: GOOD (  11.53  )
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
This patch is based on next-20220523, and it conflicts with the export
function part of [1].

Thanks,
Miles

[1] https://lore.kernel.org/lkml/20220518111652.223727-1-angelogioacchino.delregno@collabora.com/


Miles Chen (8):
  clk: mediatek export mtk_clk_simple_probe and mtk_clk_simple_remove
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
 drivers/clk/mediatek/clk-mtk.c                |  2 ++
 45 files changed, 432 insertions(+), 647 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
