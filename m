Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B226C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 10:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vbySbAm5WCRiuYUPc48XZmCsxK5A+rPGTU+MzxZXCEQ=; b=Uy2pdTezqgNQLe
	THyCAvCGKPbQhjQEd6fnx/SIv14g0Bzk+2q6egfdK4lDD7d9hWAfB8cmJss2gLQ/AUiG0bCIvT9AH
	Wyyn1AeP2U0ppDw+KGf9N+2N6/1GNT5n1MVeFxrFtgxgxxWeD3p6tybpoUDg+edwc6HQBseOH2q5B
	9q5LIHF54/O0DIDC2udFVLFJ7kLJ2T/7JSO3wTlmfsNcTyC9b3ppxjdTpE5jRvC1foF3oenfmevDE
	PHTslW4LN+wO2VbeTN1QvG1Y4SaX02VYLFoXzEOZoBw2J2VgZS00M02pHKg5HaA1VHGwtNa5oqtvH
	vUcYadzNKkswH9XPlM2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMS5H-008sqW-Sp; Tue, 22 Feb 2022 10:07:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMS5E-008sp2-Kk; Tue, 22 Feb 2022 10:07:50 +0000
X-UUID: d4d1357445374550907fb422695ad1fc-20220222
X-UUID: d4d1357445374550907fb422695ad1fc-20220222
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1388510808; Tue, 22 Feb 2022 03:07:45 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Feb 2022 02:07:43 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 22 Feb 2022 18:07:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 22 Feb 2022 18:07:42 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <singo.chang@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: [PATCH v12 00/23] Add MediaTek SoC DRM (vdosys1) support for mt8195
Date: Tue, 22 Feb 2022 18:07:18 +0800
Message-ID: <20220222100741.30138-1-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_020748_711785_272EDFB0 
X-CRM114-Status: GOOD (  18.69  )
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

The hardware path of vdosys1 with DPTx output need to go through by several modules, such as, OVL_ADAPTOR and MERGE.

Add DRM and these modules support by the patches below:

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
[1] arm64: dts: Add Mediatek SoC MT8195 and evaluation board dts and Makefile
    https://patchwork.kernel.org/project/linux-mediatek/patch/20210601075350.31515-2-seiya.wang@mediatek.com/
[2] arm64: dts: mt8195: add IOMMU and smi nodes
    https://patchwork.kernel.org/project/linux-mediatek/patch/20210615173233.26682-15-tinghan.shen@mediatek.com/
[3] [01/24] dt-bindings: mediatek: mt8195: Add binding for MM IOMMU
    https://patchwork.kernel.org/project/linux-mediatek/patch/20210630023504.18177-2-yong.wu@mediatek.com/
[4] Add gce support for mt8195
    https://patchwork.kernel.org/project/linux-mediatek/list/?series=537069
[5] Add MediaTek SoC DRM (vdosys0) support for mt8195
    https://patchwork.kernel.org/project/linux-mediatek/list/?series=587313
[6] [v8,1/2] dt-bindings: reset: mt8195: add toprgu reset-controller header file
    https://patchwork.kernel.org/project/linux-mediatek/patch/20210806023606.16867-2-Christine.Zhu@mediatek.com/

Nancy.Lin (23):
  dt-bindings: mediatek: add vdosys1 RDMA definition for mt8195
  dt-bindings: mediatek: add vdosys1 MERGE property for mt8195
  dt-bindings: mediatek: add ethdr definition for mt8195
  dt-bindings: reset: mt8195: add vdosys1 reset control bit
  soc: mediatek: add mtk-mmsys support for mt8195 vdosys1
  soc: mediatek: add mtk-mmsys config API for mt8195 vdosys1
  soc: mediatek: add cmdq support of mtk-mmsys config API for mt8195
    vdosys1
  soc: mediatek: mmsys: modify reset controller for MT8195 vdosys1
  soc: mediatek: change the mutex defines and the mutex_mod type
  soc: mediatek: add mtk-mutex support for mt8195 vdosys1
  drm/mediatek: add display MDP RDMA support for MT8195
  drm/mediatek: add display merge advance config API for MT8195
  drm/mediatek: add display merge start/stop API for cmdq support
  drm/mediatek: add display merge mute/unmute support for MT8195
  drm/mediatek: add display merge async reset control
  drm/mediatek: add ETHDR support for MT8195
  drm/mediatek: add mediatek-drm plane color encoding info
  drm/mediatek: add ovl_adaptor support for MT8195
  drm/mediatek: add dma dev get function
  drm/mediatek: modify mediatek-drm for mt8195 multi mmsys support
  drm/mediatek: add drm ovl_adaptor sub driver for MT8195
  drm/mediatek: add mediatek-drm of vdosys1 support for MT8195
  arm64: dts: mt8195: add display node for vdosys1

 .../arm/mediatek/mediatek,mdp-rdma.yaml       |  77 +++
 .../display/mediatek/mediatek,ethdr.yaml      | 147 ++++++
 .../display/mediatek/mediatek,merge.yaml      |   4 +
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 222 +++++++++
 drivers/gpu/drm/mediatek/Makefile             |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  29 ++
 drivers/gpu/drm/mediatek/mtk_disp_merge.c     |  89 +++-
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 443 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  55 ++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h       |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  31 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |   9 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 329 +++++++++----
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |  13 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c      |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_plane.h      |   1 +
 drivers/gpu/drm/mediatek/mtk_ethdr.c          | 376 +++++++++++++++
 drivers/gpu/drm/mediatek/mtk_ethdr.h          |  25 +
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       | 315 +++++++++++++
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h       |  20 +
 drivers/soc/mediatek/mt8195-mmsys.h           | 199 ++++++++
 drivers/soc/mediatek/mtk-mmsys.c              |  80 +++-
 drivers/soc/mediatek/mtk-mmsys.h              |  12 +
 drivers/soc/mediatek/mtk-mutex.c              | 296 +++++++-----
 include/dt-bindings/reset/mt8195-resets.h     |  12 +
 include/linux/soc/mediatek/mtk-mmsys.h        |  22 +
 26 files changed, 2572 insertions(+), 244 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mdp-rdma.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
