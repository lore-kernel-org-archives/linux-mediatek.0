Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEA9C43217
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 07:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oweEFqigN+U719uGCWNCKXEWtGvCs9Y8Oq12/q4diEc=; b=10qJIeQVu9oHimZ/aeOfhwBlE5
	CwoE3MObViNgjIKVTdzvItdwcL+SB3GtVs89DRkZhuWK3tfF2NeSGQYHENokJGVrMycCsoGLAw+St
	vMLeU+Hk13jSwm3qbfDbrNh/slIIpK2oVPP1QmoQTt1VEfMHqsfwf+Wa5t+FGtvoodrjG52SRvR5A
	uczSw8EaKU0IPiDZ2U4zXqIWDHkdmLOdP7UNkkF/GrTOVUf1N61E0vAT6SHtdAuIrgD0lKBQmt6Uk
	AhPJ0gzofTEmDYDlP5uQd7V636p9jekTFADxY0iGrHVJaIQd0HM/tuZDguh1Wo9ZoByMCggDi9L3Z
	8wThHT2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orwUh-00CKvZ-UU; Mon, 07 Nov 2022 07:24:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orwTd-00CKJL-IY; Mon, 07 Nov 2022 07:23:27 +0000
X-UUID: 12dc8ab41b384eb7ba2ca97ae26c473b-20221107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=oweEFqigN+U719uGCWNCKXEWtGvCs9Y8Oq12/q4diEc=;
	b=jzSKNWhJH8tjajAi+2NaO7Qv2j4p6A4Q97Mvxbn5wASgydmMHu6YARE/ceAo5Mzgd0ZVxAQd2MlvF0fORenFzZmq7PvMcXpRde6QWaNUccViPP5P3/ccVJGWgq3BvME+ATv75zBK3Ag/g/KaZWFhIEEU3+2IH4PGjI2KXynhjy4=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:e8e38dd1-0471-4f19-ba74-21a894f72c63,IP:0,U
	RL:0,TC:0,Content:-20,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:80
X-CID-INFO: VERSION:1.1.12,REQID:e8e38dd1-0471-4f19-ba74-21a894f72c63,IP:0,URL
	:0,TC:0,Content:-20,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACT
	ION:quarantine,TS:80
X-CID-META: VersionHash:62cd327,CLOUDID:bb3be0f3-a19e-4b45-8bfe-6a73c93611e9,B
	ulkID:221107152312DQC4HZ29,BulkQuantity:1,Recheck:0,SF:38|28|16|19|48,TC:n
	il,Content:1,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 12dc8ab41b384eb7ba2ca97ae26c473b-20221107
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 599800916; Mon, 07 Nov 2022 00:23:19 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 7 Nov 2022 15:22:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 7 Nov 2022 15:22:46 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>,
	<nfraprado@collabora.com>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	"Nancy . Lin" <nancy.lin@mediatek.com>, "jason-jh . lin"
	<jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<dri-devel@lists.freedesktop.org>, <llvm@lists.linux.dev>,
	<singo.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v28 00/11] Add MediaTek SoC(vdosys1) support for mt8195
Date: Mon, 7 Nov 2022 15:22:32 +0800
Message-ID: <20221107072243.15748-1-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_232325_627177_CEEEB81A 
X-CRM114-Status: GOOD (  17.10  )
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

The hardware path of vdosys1 with DPTx output need to go through by several modules, such as, OVL_ADAPTOR and MERGE.

Add mmsys and mutex modules support by the patches below:

Changes in v28:
- rebase to next-20221107
- fix reviewer comment in v27
  - remove change id
  - fix mmsys config api typo

Changes in v27:
- rebase to next-20221102
- change mmsys compatible for mt8195 vdosys1
  - base on jason's series[ref 1]
- fix reviewer comment
  - only register mmsys reset controller if num_resets > 0

Changes in v26:
- fix reviewer comment
  - set mmsys num_resets to 32 for 8192
- rebase to next-20220819

Changes in v25:
- fix reviewer comment
  - refine mtk_mmsys_reset_update func
- rebase to next-20220708

Changes in v24:
- fix reviewer comment
  - refine mtk_mmsys_reset_update func
- rebase to next-20220622

Changes in v23:
- separate[7] mmsys/mutex and drm patches into two series

Changes in v22:
- rebase to next-20220525
- rebase to vdosys0 series v22
- separate dts to a new patch

Changes in v21:
- fix reviewer comment
  - fix rdma and ethdr binding doc and dts

Changes in v20:
- fix reviewer comment
  - update mmsys update bit api name
  - add mtk_mmsys_update_bits error message if lose gce property
  - list all mt8195 vdosys1 reset bits

Changes in v19:
- fix reviewer comment
  - separate mt8195 mmsys component to a new patch
  - separate mt8195 vdo0 and vdo1 routing table
  - separate mmsys_write_reg api to a new patch and simplify write reg code
  - separate mmsys 64 bit reset to a new patch
  - separate mtk-mutex dp_intf1 component to a new patch

Changes in v18:
- fix reviewer comment
  - fix rdma binding doc
  - fix ethdr binding doc
  - refine mmsys config cmdq support
  - refine merge reset control flow, get reset control in probe function
  - add ethdr reset control error handling and remove dbg log
- rebase to vdosys0 series v20 (ref [5])

Changes in v17:
- fix reviewer comment in v16
  - separate ovl adaptor comp in mtk-mmsys and mtk-mutex
  - separate mmsys config API
  - move mdp_rdma binding yaml
- fix ovl adaptor pm runtime get sync timing issue
- rebase to vdosys0 series v19 (ref [5])
- rebase to [7] for modify vblank register change

Changes in v16:
- fix reviewer comment in v 15
  - fix mtk_drm_ddp_comp.c alignment
  - fix vdosys0 mmsys num before adding vdosys1 patch

Changes in v15:
- fix ethdr uppercase hex number in dts

Changes in v14:
- remove MTK_MMSYS 64 bit dependency
- add ethdr.yaml back and fix dt_schema check fail

Resend v13
- add related maintainer in maillist

Changes in v13:
- fix reviewer comment in v12
  - fix rdma dt-binding format
  - fix dts node naming
- fix 32 bit build error
  - modify 64bit dependency for mtk-mmsys
- rebase to vdosys0 series v16. (ref [5])

Changes in v12:
- fix reviewer comment in v11
  - modify mbox index
  - refine dma dev for ovl_adaptor sub driver

Changes in v11:
- remove ethdr vblank spin lock
- refine ovl_adaptor print message

Changes in v10:
- refine ethdr reset control using devm_reset_control_array_get_optional_exclusive
- fix ovl_adaptor mtk_ovl_adaptor_clk_enable error handle issue

Changes in v9:
- rebase on kernel-5.16-rc1
- rebase on vdosys0 series v13. (ref [5])
- fix ovl_adaptor sub driver is brought up unintentionally
- fix clang build test fail- duplicate ethdr/mdp_rdma init_module/cleanup_module symbol issue 

Changes in v8:
- separate merge async reset to new patch.
- separate drm ovl_adaptor sub driver to new patch.
- fix reviewer comment in v7.

Changes in v7:
- rebase on vdosys0 series v12 (ref[5])
- add dma description in ethdr binding document.
- refine vdosys1 bit definition of mmsys routing table.
- separate merge modification into 3 pathces.
- separate mutex modification into 2 patches.
- add plane color coding for mdp_rdma csc.
- move mdp_rdma pm control to ovl_adaptor.
- fix reviewer comment in v6.

Changes in v6:
- rebase on kernel-5.15-rc1.
- change mbox label to gce0 for dts node of vdosys1.
- modify mmsys reset num for mt8195.
- rebase on vdosys0 series v10. (ref [5])
- use drm to bring up ovl_adaptor driver.
- move drm iommu/mutex check from kms init to drm bind.
- modify rdma binding doc location. (Documentation/devicetree/bindings/arm/)
- modify for reviewer's comment in v5.

Changes in v5:
- add mmsys reset controller reference.

Changes in v4:
- use merge common driver for merge1~4.
- refine ovl_adaptor rdma driver.
- use ovl_adaptor ddp_comp function instead of ethdr.
- modify for reviewer's comment in v3.

Changes in v3:
- modify for reviewer's comment in v2.
- add vdosys1 2 pixels align limit.
- add mixer odd offset support.

Changes in v2:
- Merge PSEUDO_OVL and ETHDR into one DRM component.
- Add mmsys config API for vdosys1 hardware setting.
- Add mmsys reset control using linux reset framework.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

This series are based on the following patch:
[1] Change mmsys compatible for mt8195 mediatek-drm
    20220927152704.12018-1-jason-jh.lin@mediatek.com

Nancy.Lin (11):
  dt-bindings: arm: mediatek: mmsys: add vdosys1 compatible for MT8195
  dt-bindings: reset: mt8195: add vdosys1 reset control bit
  soc: mediatek: add mtk-mmsys ethdr and mdp_rdma components
  soc: mediatek: add mtk-mmsys support for mt8195 vdosys1
  soc: mediatek: refine code to use mtk_mmsys_update_bits API
  soc: mediatek: add mtk-mmsys config API for mt8195 vdosys1
  soc: mediatek: add cmdq support of mtk-mmsys config API for mt8195
    vdosys1
  soc: mediatek: mmsys: add mmsys for support 64 reset bits
  soc: mediatek: mmsys: add reset control for MT8195 vdosys1
  soc: mediatek: add mtk-mutex component - dp_intf1
  soc: mediatek: add mtk-mutex support for mt8195 vdosys1

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |   4 +-
 drivers/soc/mediatek/mt8195-mmsys.h           | 146 ++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c              | 145 ++++++++++++-----
 drivers/soc/mediatek/mtk-mmsys.h              |   1 +
 drivers/soc/mediatek/mtk-mutex.c              |  37 +++++
 include/dt-bindings/reset/mt8195-resets.h     |  45 ++++++
 include/linux/soc/mediatek/mtk-mmsys.h        |  25 +++
 7 files changed, 366 insertions(+), 37 deletions(-)

-- 
2.18.0


