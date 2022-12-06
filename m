Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA6BC4708C
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Dec 2022 02:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h9vpf00nkT1FqhFNddOs6fidJI6QIuGaTmh82e2scfo=; b=nt9j81CJEaS9+r0H6UDZWG28fq
	Rq/fpZ+ZpHduWTpX8NOV7ooc+90Nx9GM5s65aW5Jn0RyGwF6A4Kd5rZ3iPGS3b2N1jJxm5kEur2fN
	N7w0m8otuBrAzdHQjdiek+blqB0bQeInjQoDCVUFanBB/Ey+GiJ0sEbzyWk0ePpCdxR1F+CGfaTxx
	Ns2rzR2zDQ9RfB9nS/dDOe5RroM9nU/w4Z3VcgDov5+6Rbbf6Ly+QmzDO3stoYjPlefvx5H2JybOY
	d9a8d0repLDuI555fPffHT040SjLcmNm/iFCJkdsOGxHqQeDBydssovzkXzkcJRo40seCKqhwpGKC
	xZO2MIrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2NkA-00FWra-MO; Tue, 06 Dec 2022 02:31:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Nk6-00FWkl-TT; Tue, 06 Dec 2022 02:31:36 +0000
X-UUID: a2e8ba4662f046adbbd0da8863dcfb6d-20221205
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=h9vpf00nkT1FqhFNddOs6fidJI6QIuGaTmh82e2scfo=;
	b=eKCXcfCYpnwZnLsgUpdaTJK+/GSxsUCFfoKZaPX2SB9qxW+sxD7y2EpbXTr3v1ulYeHYucMXaEFNjNuvvEYG9OIDVh1f78q5P4KGOAf8CpeKVVwjdYVPyYgHCEGDbXvZOiK9I4drl3h+5sAQi3OZas5nfYhhVEdTiX6sOa0m+1Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:2482c5eb-ef24-4c0c-80e5-3b210e548faa,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:b48ea216-b863-49f8-8228-cbdfeedd1fa4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: a2e8ba4662f046adbbd0da8863dcfb6d-20221205
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <nathan.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 223980950; Mon, 05 Dec 2022 19:31:29 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 6 Dec 2022 10:00:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 6 Dec 2022 10:00:55 +0800
From: nathan.lu <nathan.lu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: "jason-jh . lin" <jason-jh.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rex-BC
 Chen <rex-bc.chen@mediatek.com>, Nathan Lu <nathan.lu@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <lancelot.wu@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 0/6] Add first version mt8188 vdosys0 driver
Date: Tue, 6 Dec 2022 10:00:40 +0800
Message-ID: <20221206020046.11333-1-nathan.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_183134_970977_0BFA562E 
X-CRM114-Status: UNSURE (   9.83  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Nathan Lu <nathan.lu@mediatek.com>

This patch is to add first version mt8188 vdosys0 driver
Modify and add new files include:
1. bindings documents
2. mtk mmsys
3. mtk mutex
4. mtk drm driver

Change in V4:
- based on [1]
[1] Change mmsys compatible for mt8195 mediatek-drm
    - https://patchwork.kernel.org/project/linux-mediatek/list/?series=699386
- Modify mediatek,mmsys.yaml, move mt8188-vdosys0 to ****mmsys
- Modify mt8188_mmsysy.h DSI mux setting

Change in V3:
- based on [1]
[1] Change mmsys compatible for mt8195 mediatek-drm
    - https://patchwork.kernel.org/project/linux-mediatek/list/?series=699386
- Modify mediatek,mmsys.yaml mt8188-mmsys name to mt8188-vdosys0
- Modify mtk-mmsys.c compatible name to mt8188-vdosys0
- Add DSI mutex in mtk-mutex.c
- Modify mtk_drm_drv.c mt8188-mmsysy name to mt8188-vdosys0


Change in V2:
- based on [2] and [3]
[2] Add MediaTek SoC(vdosys1) support for mt8195
    - https://patchwork.kernel.org/project/linux-mediatek/list/?series=658416
[3] Add MediaTek SoC DRM (vdosys1) support for mt8195
    - https://patchwork.kernel.org/project/linux-mediatek/list/?series=665269
- Seperate bindings doucment into mmsys/mutex/display 3 parts
- Remove redundent char in mediatek,gamma.yaml
- Add another mediatek,mt8188-disp-rdma in mediatek,rdma.yaml
- Remove io_start variable setting in mtk_drm_drv.c and mtk_mmsys.c

Nathan Lu (6):
  dt-bindings: mediatek: modify VDOSYS0 display device tree
    Documentations for MT8188
  dt-bindings: mediatek: modify VDOSYS0 mmsys device tree Documentations
    for MT8188
  dt-bindings: mediatek: modify VDOSYS0 mutex device tree Documentations
    for MT8188
  soc: mediatek: add mtk-mmsys support for mt8188 vdosys0
  soc: mediatek: add mtk-mutex support for mt8188 vdosys0
  drm/mediatek: add mediatek-drm of vdosys0 support for mt8188

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |   1 +
 .../display/mediatek/mediatek,aal.yaml        |   1 +
 .../display/mediatek/mediatek,ccorr.yaml      |   1 +
 .../display/mediatek/mediatek,color.yaml      |   1 +
 .../display/mediatek/mediatek,dither.yaml     |   1 +
 .../display/mediatek/mediatek,gamma.yaml      |   1 +
 .../display/mediatek/mediatek,ovl.yaml        |   1 +
 .../display/mediatek/mediatek,postmask.yaml   |   1 +
 .../display/mediatek/mediatek,rdma.yaml       |   4 +
 .../bindings/soc/mediatek/mediatek,mutex.yaml |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  21 +++
 drivers/soc/mediatek/mt8188-mmsys.h           | 149 ++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c              |  11 ++
 drivers/soc/mediatek/mtk-mutex.c              |  53 +++++++
 14 files changed, 247 insertions(+)
 create mode 100644 drivers/soc/mediatek/mt8188-mmsys.h

-- 
2.18.0


