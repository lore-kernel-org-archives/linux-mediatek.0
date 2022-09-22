Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884C6C6FA86
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 10:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b7eFIZlUIZNAXMcqsU5cqB9C2FReZfJrF2+WaffT5ZE=; b=u1h/b6jBabV6BiHRUCX+e6xZOH
	UrUf5dIzIbRgJxgH8XwCictoCVnfRUe0/g/DEE2rQhcdtoAxs+4yzyB5iqtOZk/iNt3+EqSnAhzA9
	ePBKmFmwFVwCtzsJR7d8JbNGWX73mz5WFv18ylCQTrFUDMrNoOieplyK9JAnYoMHB4L6p0D35w6oa
	5Au2lMOK3Gf+xHfuK+SMcsEc/1Z0wVzd8/GXxhX6LDU8Bel8ABL/55TOlMZF7kceb2o9pT+p8WfJ3
	AI3WeUkeu0m8g4QVc4/NGu5PZgXvGMySmED/IqN8QXROVMc8YgNLEjAbqHY/qdNI2iXhnvEn6S7y2
	Pc5ID6Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obJIx-00Eu7l-KH; Thu, 22 Sep 2022 10:19:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obJIu-00Eu4m-Ge; Thu, 22 Sep 2022 10:19:38 +0000
X-UUID: 3fa27d8a5626469e8051704d909d3bf4-20220922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=b7eFIZlUIZNAXMcqsU5cqB9C2FReZfJrF2+WaffT5ZE=;
	b=K9R4GkRPm8iL1KErBaSO1vq3yacXse9zuony2wQrcgi/cMo4adyQt2mJrIi338RrWyjqs3jcaFpxQA2nYSLwYDzLJkEsK5Kef2w7sH56tgsOmoYC/hCKZNx4bHLj2nLW1SX11BGNm/ocm5l93EyLO8PBDSAQRB5qAoOYZe+EG2s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:84709649-f095-44fe-81f8-17d2b87a1f4a,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:39a5ff1,CLOUDID:86e0e1e3-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 3fa27d8a5626469e8051704d909d3bf4-20220922
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 845153484; Thu, 22 Sep 2022 03:19:30 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 22 Sep 2022 17:18:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 22 Sep 2022 17:18:52 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-kernel@vger.kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>, Miles Chen
	<miles.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v3 0/7] clk: mediatek: use mtk_clk_simple_probe to simplify
Date: Thu, 22 Sep 2022 17:18:28 +0800
Message-ID: <20220922091841.4099-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_031936_592868_C22F0159 
X-CRM114-Status: GOOD (  13.51  )
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

Hi everyone,

This is v3 patches to use mtk_clk_simple_probe to simplify driver. It is almost
a RESEND patch, the only difference is adding reviewed-by tags and a tested-by tag
to the commit messages.

I tested the series on MT8192 and MT6779.
This patch is based on next-20220921 and [1].

Change since v1:
- Angelo's patch [1] already exported mtk_clk_simple_probe and mtk_clk_simple_remove,
so drop this part from my v1 and depends on [1].
- add a reviewed-by tag

Change since v2:
- add reviewed-by tags and a tested-by tag

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

Thanks,
Miles

[1] https://lore.kernel.org/lkml/20220921091455.41327-1-angelogioacchino.delregno@collabora.com/



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


