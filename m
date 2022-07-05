Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A5CC43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jul 2022 11:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/i0THs3tkuz8Cn7J2tkakHFla2qMfTe4o4B5oMU1Skc=; b=u4jofLSFnQX1xbatTPJxKDH9lb
	lX6tElDdvSf+xS13/v8G/zHiqedjIkmixph9YS0l5YOaHlPVVZ/lGR2gHZa33mkUKx1F7eodEXzSD
	RInkXdUjC9qtfeOq+iNa/7+GV+1bcWSykIsK7J3XSuDsWjur0KR8cAVfIo3m0QwSpECvlviSSK9Qs
	w6YWhFuP9YgVcIBynXNlX4iYNd2oDb4wNTC751KtV7W/EhmcN2IBUD/9LMGG6v5pVORvKSSWudTOx
	3lt4WIW+YKEp0KVEvog6avIr0xEVBLpYgSn312990arYIEAaTcgYtjEoWYMWCs6atqN8bdkyMaIbi
	bjD4/62A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8gXe-00HNkN-VV; Tue, 05 Jul 2022 11:16:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8gXO-00HNdw-NX; Tue, 05 Jul 2022 11:16:19 +0000
X-UUID: f5e358d55daa48d4975d474be4d27e4a-20220705
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:2cc85f81-c4eb-4e19-a4b6-9d6ece8fffa2,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:27b87663-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: f5e358d55daa48d4975d474be4d27e4a-20220705
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1508356740; Tue, 05 Jul 2022 04:16:09 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 5 Jul 2022 18:25:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 5 Jul 2022 18:25:30 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<ck.hu@mediatek.com>, <xinlei.lee@mediatek.com>, <liangxu.xu@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>
Subject: [PATCH v16 0/5] drm/mediatek: Add MT8195 dp_intf driver
Date: Tue, 5 Jul 2022 18:25:25 +0800
Message-ID: <20220705102530.1344-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_041614_807206_8799682E 
X-CRM114-Status: GOOD (  13.75  )
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

The dpi/dpintf driver and the added helper functions are required for
the DisplayPort driver to work.

This series is separated from [1] which is original from Guillaume.
The display port driver is [2].

Changes for v16:
1. Separate input_2pixel and pixels_per_iter to other patches.
2. Remove function "mtk_dpi_matrix_sel" and color_fmt_trans_support
   in patch "Add YUV422 output support".
3. Drop patches which are accepted.

Changes for v15:
1. Add a patch to remove support for output yuv422 for previous socs.
2. Only remain output format of reg888/yuv422 support for mt8195.
3. Adjust the order of patches.

Changes for v14:
1. Separate a new binding patch to modify mediatek string format.
2. Use GENMASK(4, 0) for INT_MATRIX_SEL_MASK in patch
   "Add YUV422 output support"
3. Change kernel doc description of support_direct_pin.
4. Change to use pixels_per_iter to control quantity of transferred
   pixels per iterration.

Changes for v13:
1. Change mediatek,mt8195-dp_intf to mediatek,mt8195-dp-intf.
2. Add kernel doc for mtk_dpi_conf.
3. Drop patch of tvd_pll enable.
4. Squash some color format transfer related patches.
5. Add new patch to support setting of direct connection to pins.
6. Change fix tag of "drm/mediatek: dpi: Only enable dpi after the bridge
   is enabled".

Changes for v12:
1. Remove pll_gate.
2. Add more detailed commit message.
3. Separate tvd_clk patch and yuv422 output support from add dpintf
   support patch
4. Remove limit patch and use common driver codes to determine this.

Changes for v11:
1. Rename ck_cg to pll_gate.
2. Add some commit message to clarify the modification reason.
3. Fix some driver order and modify for reviewers' comments.

[1]:https://lore.kernel.org/all/20220523104758.29531-1-granquet@baylibre.com/
[2]:https://lore.kernel.org/all/20220610105522.13449-1-rex-bc.chen@mediatek.com/

Bo-Chen Chen (4):
  drm/mediatek: dpi: Add YUV422 output support
  drm/mediatek: dpi: add config to support direct connection to dpi
    panels
  drm/mediatek: dpi: Add input_2pixel config support
  drm/mediatek: dpi: Add pixels_per_iter config support

Guillaume Ranquet (1):
  drm/mediatek: dpi: Add dp_intf support

 drivers/gpu/drm/mediatek/mtk_dpi.c          | 115 +++++++++++++++++---
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h     |  18 +++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |   4 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   3 +
 5 files changed, 126 insertions(+), 15 deletions(-)

-- 
2.18.0


