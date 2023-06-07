Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91A5C7EE29
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 06:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HHiIt6KcZrob2B/zrQRVJb5juS9lJddR2M2H5zQFyVk=; b=bglIJN5QjYcOKohjn2dLQhN4Xl
	JpACXRfCHRTBFwqwPbIy/ZMmTBCdyElFIktTESi0qh2DzZrgKkC/2IM9UdbIcM6yPvYxbYOjPDOEM
	4lfLK40JjE5MQZpQjJthQyW3KYK9EAgK1I4bPMt5QDUBuGe0Zmwy9cvCtWI4PTuvGZIpdE88iCUfp
	+Q4WyaumVws7f8uW/F3QP+9dcT7KteSdIT24kEtuOAmsj4y53F3vpzg9TQZF+KBRAjQL99L2JFTr8
	h3qtxP4nyEP6tehfkJqTZI1/f3/RcDLR2wqLv4CPpJKleEunf/XFIpB45P6HGkEE8aIexsmd5XdeJ
	GXRhaLKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6miM-004ZAS-2c;
	Wed, 07 Jun 2023 06:32:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6miK-004Z8s-1S;
	Wed, 07 Jun 2023 06:32:13 +0000
X-UUID: 06be051204fd11ee83ed1395ce914268-20230606
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=HHiIt6KcZrob2B/zrQRVJb5juS9lJddR2M2H5zQFyVk=;
	b=SW2De24aCS8oIbOQEXU0mk5Q5i55diHvSvxd7GBteD9u3AsKLJW5HrvGmSjT2gSKAVV4ZfHi3hMib7yyfKRjEowDYhNpmQcXtQI6j3bMf+ZkTyW6YbdcEToJ4g4eVmOIADL3QKUDvtpf3iGuWExhKPWkIfEiB1umlSpE6/U40s4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:cb318bd3-1404-4c0d-b241-ef417882edf6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:3a8a486e-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 06be051204fd11ee83ed1395ce914268-20230606
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1721868560; Tue, 06 Jun 2023 23:32:08 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 7 Jun 2023 14:11:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 7 Jun 2023 14:11:30 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Singo Chang <singo.chang@mediatek.com>, Nancy Lin
	<nancy.lin@mediatek.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>, "Hsiao
 Chein Sung" <shawn.sung@mediatek.com>, Fei Shao <fshao@google.com>
Subject: [PATCH v1 0/6] Add display driver for MT8188 VDOSYS1
Date: Wed, 7 Jun 2023 14:11:15 +0800
Message-ID: <20230607061121.6732-1-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_233212_507677_BF2D6965 
X-CRM114-Status: GOOD (  11.76  )
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

[PATCH v1 1/6] dt-bindings: display/mediatek: mt8188: Add documentations
[PATCH v1 2/6] dt-bindings: reset: mt8188: Add reset control bits for VDOSYS1
[PATCH v1 3/6] soc: mediatek: mt8188: Support VDOSYS1 in mtk-mmsys
[PATCH v1 4/6] drm/mediatek: mt8188: Modify display driver for VDOSYS1
[PATCH v1 5/6] soc: mediatek: mt8188: Support VDOSYS1 PADDING in mtk-mmsys
[PATCH v1 6/6] drm/mediatek: mt8188: Add VDOSYS1 PADDING driver

Hsiao Chien Sung (6):
  dt-bindings: display/mediatek: mt8188: Add documentations for VDOSYS1
  dt-bindings: reset: mt8188: Add reset control bits for VDOSYS1
  soc: mediatek: mt8188: Support VDOSYS1 in mtk-mmsys
  drm/mediatek: mt8188: Modify display driver for VDOSYS1
  soc: mediatek: mt8188: Support VDOSYS1 PADDING in mtk-mmsys
  drm/mediatek: mt8188: Add VDOSYS1 PADDING driver

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |   1 +
 .../display/mediatek/mediatek,ethdr.yaml      |   5 +-
 .../display/mediatek/mediatek,mdp-rdma.yaml   |   5 +-
 .../display/mediatek/mediatek,merge.yaml      |   1 +
 .../display/mediatek/mediatek,padding.yaml    |  80 ++++++++++
 drivers/gpu/drm/mediatek/Makefile             |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   3 +
 drivers/gpu/drm/mediatek/mtk_disp_merge.c     |   3 +-
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 143 +++++++++++------
 drivers/gpu/drm/mediatek/mtk_disp_padding.c   | 134 ++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  29 +++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   2 +-
 drivers/gpu/drm/mediatek/mtk_ethdr.c          |   1 +
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       |   1 +
 drivers/soc/mediatek/mt8188-mmsys.h           | 149 ++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c              |  13 ++
 drivers/soc/mediatek/mtk-mmsys.h              |   1 +
 drivers/soc/mediatek/mtk-mutex.c              |  51 ++++++
 include/dt-bindings/reset/mt8188-resets.h     |  12 ++
 include/linux/soc/mediatek/mtk-mmsys.h        |   8 +
 21 files changed, 589 insertions(+), 55 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_padding.c

--
2.18.0


