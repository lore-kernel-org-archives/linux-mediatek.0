Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0933EEB57D
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 03:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P/xh8LLjglbBDLC4ylTbCB0rsbjDqqmy1RdqQs9RxwE=; b=YyTFodL2vlDfj82G5dEKIWemUV
	N8G2+CAdmuzKFv9D8MNv7YAWFv0ihHFAQxgc/9WJLX37gIPqPfTPHLlLmkaLOQG3nmkYZCirTzpJZ
	xr89wQGnn7OXir20wd1i4Y/EwYU23Z+MFuIGQ2UuSJwSA2BIQXXmlRRxCDfIVCy9saayOMub+l+Rk
	KbuL7IqcGHgDYLnTdA4wce128DC8Th7oDcrGZigi37xsYg1dHIUb3P2hBeMH7t+02Ske3TdDU/Kne
	J0huy9Bc8nZUw7oM4AXeNR1RjwK4LX8gPZcPnnwkWdn+vvmLg84WhMzzkyzZ1g0tbc4AhP0XfqqVa
	7imrnvsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfXQQ-00H9BA-25;
	Mon, 11 Sep 2023 03:17:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfXQM-00H95f-0N;
	Mon, 11 Sep 2023 03:17:19 +0000
X-UUID: b351aadc505111ee9b7791016c24628a-20230910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=P/xh8LLjglbBDLC4ylTbCB0rsbjDqqmy1RdqQs9RxwE=;
	b=F7zUcV/KfVzTGb08u2DL9cwk2oX0kRtj6Dlj1ff7vK2BKYzmbpRt/nlw7u8XEh6QRtygsAnjITiK8NGMW2oXc4PPGuSZsBSba86IbFcecV2tV/wwZV/yYUm8vqZZrPqa7dCSP1fMiUMI13fOCVGKJKAwOaKUWFDBi2LGtdZ7QQY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:f3cda9e5-cb3e-4486-acb2-f6a12e0984d2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:e9a8dec2-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b351aadc505111ee9b7791016c24628a-20230910
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1500711003; Sun, 10 Sep 2023 20:17:12 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 11 Sep 2023 11:16:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 11 Sep 2023 11:16:38 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Jason-JH Lin
	<jason-jh.lin@mediatek.com>, Hsiao Chien Sung <shawn.sung@mediatek.com>
Subject: [PATCH v6 00/20] Add display driver for MT8188 VDOSYS1
Date: Mon, 11 Sep 2023 11:16:10 +0800
Message-ID: <20230911031630.12613-1-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.619200-8.000000
X-TMASE-MatchedRID: a9kaGDGTtUZYXTxImR5ZvIa7OiQBC9buWjWsWQUWzVoOkJQR4QWbsO/S
	cgNpr80IQx8Td33i8d2uJFuPllf7ymjez20/QikW4bl1FkKDELdo3Yq5PCwLAjRCaZSKE/OsjBH
	2O7lhl4DL5aw8frs3tCsSrChctaUl7H2DvWppibMXKqR+w9a7UJFLUnnvueyB0pEcoXqJQB2QP7
	8+ZDAwILLAsxfbhF+E41HTVfNlY5/DmEfzPAj6Oh+WEMjoO9WWKhNpTcvbdUKbKItl61J/yZ+in
	TK0bC9eKrauXd3MZDWiZ3sWC9weZPl6k2ye1XLCUWVtiCFltaZlbKOMhqs+K4Dgg8P9QZMv
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.619200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 2FEFC1DCB34FB1A5D39A564376FA7000D2209471E1F4816C351A11C7081256DD2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_201718_168017_02B126B9 
X-CRM114-Status: GOOD (  12.38  )
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

Changes in v6:
- Separate the commits into smaller ones
- Add DPI input mode setting

Changes in v5:
- Reuse .clk_enable/.clk_disable in struct mtk_ddp_comp_funcs
  in mtk_disp_ovl_adaptor.c
- Adjust commits order

Changes in v4:
- Add new functions in mtk_disp_ovl_adaptor.c to enable/disable
  components and reuse them when clock enable/disable
- Rename components in mtk_disp_ovl_adaptor.c and sort them in
  alphabetical order

Changes in v3:
- Define macro MMSYS_RST_NR in mtk-mmsys.h and update reset table
- Fix typos (ETDHR -> ETHDR, VSNYC -> VSYNC)
- Rebase dt-bindings on linux-next
- Refine description of Padding
- Squash reset bit map commits for VDO0 and VDO1 into one

Changes in v2:
- Remove redundant compatibles of MT8188 because it shares the same
  configuration with MT8195
- Separate dt-bindings by modules
- Support reset bit mapping in mmsys driver

Hsiao Chien Sung (20):
  dt-bindings: display: mediatek: ethdr: Add compatible for MT8188
  dt-bindings: display: mediatek: mdp-rdma: Add compatible for MT8188
  dt-bindings: display: mediatek: merge: Add compatible for MT8188
  dt-bindings: display: mediatek: padding: Add MT8188
  dt-bindings: arm: mediatek: Add compatible for MT8188
  dt-bindings: reset: mt8188: Add VDOSYS reset control bits
  soc: mediatek: Support MT8188 VDOSYS1 in mtk-mmsys
  soc: mediatek: Support MT8188 VDOSYS1 Padding in mtk-mmsys
  soc: mediatek: Support reset bit mapping in mmsys driver
  soc: mediatek: Add MT8188 VDOSYS reset bit map
  drm/mediatek: Rename OVL_ADAPTOR_TYPE_RDMA
  drm/mediatek: Refine device table of OVL adaptor
  drm/mediatek: Sort OVL adaptor components
  drm/mediatek: Add component ID to component match structure
  drm/mediatek: Manage component's clock with function pointers
  drm/mediatek: Make sure the power-on sequence of LARB and RDMA
  drm/mediatek: Support MT8188 Padding in display driver
  drm/mediatek: Add Padding to OVL adaptor
  drm/mediatek: Support MT8188 VDOSYS1 in display driver
  drm/mediatek: Set DPI input to 1T2P mode

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |   1 +
 .../display/mediatek/mediatek,ethdr.yaml      |   6 +-
 .../display/mediatek/mediatek,mdp-rdma.yaml   |   6 +-
 .../display/mediatek/mediatek,merge.yaml      |   3 +
 .../display/mediatek/mediatek,padding.yaml    |  81 +++++++
 drivers/gpu/drm/mediatek/Makefile             |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   3 +
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 216 +++++++++---------
 drivers/gpu/drm/mediatek/mtk_dpi.c            |   2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   4 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   2 +-
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       |  20 +-
 drivers/gpu/drm/mediatek/mtk_padding.c        | 136 +++++++++++
 drivers/soc/mediatek/mt8188-mmsys.h           | 210 +++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c              |  23 ++
 drivers/soc/mediatek/mtk-mmsys.h              |  32 +++
 drivers/soc/mediatek/mtk-mutex.c              |  51 +++++
 include/dt-bindings/reset/mt8188-resets.h     |  75 ++++++
 include/linux/soc/mediatek/mtk-mmsys.h        |   8 +
 19 files changed, 764 insertions(+), 118 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_padding.c

--
2.18.0


