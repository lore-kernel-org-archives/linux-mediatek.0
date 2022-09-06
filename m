Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4A6ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 08:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Sje/d4TLF7ey2l9yqoXnjTJMBDbqG2ItYyPcoX36SFg=; b=GFcypXRs5HgEXhWgWKU55bnvFX
	zd0q0QzeniUp9V4+muQzDbylap7ttcaMnmtLlSuau4qHo786yhb1JmdARBZmhNQX9xXv/4nLgmyMC
	CLDHpGvZO96dxMXXXK6Q/eMHXImP50UJabGAbjbFq+3Yv0x3iR8Pbr4X22UPtX8BR+MphRgE+WjS7
	ISlsh2Wpx3uuW0N32cPPUhXBYhLOmD2aVyHSfxvAqP4K2QwSZS2qhV5pfTjD6IiXTTBmcjwZVFX0V
	EwidKfDVYpys9M6nG5Dp6ssy4FE9tzPqxAIjsQC5/8oeukXn81+/1IZ6Jo3HlLaZPx8ajfoIkstdB
	vdGOM59g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVUEO-00BQxf-35; Tue, 06 Sep 2022 08:46:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVUDO-00BQJf-Dn; Tue, 06 Sep 2022 08:45:58 +0000
X-UUID: 334a5d097a0a46bca214d4e700ab5179-20220906
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Sje/d4TLF7ey2l9yqoXnjTJMBDbqG2ItYyPcoX36SFg=;
	b=AWIX5O007LNc4IFm/Y+xz9mv3RBrDxD8IuzIYcm6De6ohZsuqAfWZfTNyaY1IQkAiWZ8xOupJeP4qQxVYj8ayz0277HylMNCxeSNbCW/ttRG9KVVnSms4ByQLEuEx08EE9oGMm4JV8cXzf+iNoqTKB1xSaED2Jm9xhLHz5I2Gt8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:ffbfa186-9e91-4ea8-86d7-cd7da2dc4e89,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:1707cf56-e800-47dc-8adf-0c936acf4f1b,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 334a5d097a0a46bca214d4e700ab5179-20220906
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <nathan.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1758462589; Tue, 06 Sep 2022 01:45:42 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 6 Sep 2022 16:45:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 6 Sep 2022 16:45:04 +0800
From: nathan.lu <nathan.lu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: "jason-jh . lin" <jason-jh.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rex-BC
 Chen" <rex-bc.chen@mediatek.com>, Nathan Lu <nathan.lu@mediatek.com>, Moudy
 Ho <moudy.ho@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <wsd_upstream@mediatek.com>,
	<lancelot.wu@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 0/6] Add first version mt8188 vdosys0 driver
Date: Tue, 6 Sep 2022 16:44:43 +0800
Message-ID: <20220906084449.20124-1-nathan.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_014550_556864_13F5622A 
X-CRM114-Status: GOOD (  10.38  )
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

This path is based on [1] and [2]
[1] Add MediaTek SoC(vdosys1) support for mt8195
    - https://patchwork.kernel.org/project/linux-mediatek/list/?series=658416
[2] Add MediaTek SoC DRM (vdosys1) support for mt8195
    - https://patchwork.kernel.org/project/linux-mediatek/list/?series=665269

This patch is to add first version mt8188 vdosys0 driver
Modify and add new files include:
1. bindings documents
2. mtk mmsys
3. mtk mutex
4. mtk drm driver

Change in V2:
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
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  29 ++++
 drivers/soc/mediatek/mt8188-mmsys.h           | 149 ++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c              |  18 +++
 drivers/soc/mediatek/mtk-mutex.c              |  51 ++++++
 14 files changed, 260 insertions(+)
 create mode 100644 drivers/soc/mediatek/mt8188-mmsys.h

-- 
2.18.0


