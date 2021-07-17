Return-Path: <SRS0=8BsG=MJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B16C636CB
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 09:05:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 923B9613C0
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 09:05:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 923B9613C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oj/Bu1w3OnE8wa6QM2M+HIyN29cn42/Wvaw1RUdYumk=; b=ulOpV2nJJgx4Af
	ceGAEZHLvZSLXySA/BQpXTxfbXe+waS1Zme8wDgyOE2wac2gyYIHTJ2l31YXC7IMgNcyqZsNdyg7Z
	9yQCw2VQLon1Y+24AGnHAV1Wj2wx+AgQtjDufb6zhcxOq1BFyMkRSaaleyld0xOBD0VdXjqdyVBla
	2dWM4mxUJIUXTP2K0jo0LB5Vg1O31uxkZnlYZf6FVHrehV9/aNuT/gIjR+Ed/RDmW9XJ2M468c4xQ
	Ga5IzNPvdWdFLlvfsCatj0ehTNUDzfbiHx07/1BhAoP3FaLadoW0QewwOrjMjcBZLrzW6RjzTGbAV
	0Xd/+BJykBiv99RnSX/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4gG9-006GyH-PA; Sat, 17 Jul 2021 09:05:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4gFM-006GmX-Lz; Sat, 17 Jul 2021 09:04:34 +0000
X-UUID: c60916fcb430450b8f5df70258d5f0b3-20210717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=zib8/diS0pRoRu4dZMHQIjXxjpb1CZJ9pVKhnfLvW20=; 
 b=pdTbuN35AyoEfPyd16Cs+RtGcEZ2JCHoAuJ96QWH5Nwa9KetjM75raPnuPA7pwM3aTzbeNswWGrwt4Mqt9MYsbu3absCiPfTQ9WHPxW9snNpr6EQJtClXhclKGuPBZY2LVzQJbrpZ7XDOT2KZa90rRGeQJYqRFebUEPs0uf80J8=;
X-UUID: c60916fcb430450b8f5df70258d5f0b3-20210717
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2057975649; Sat, 17 Jul 2021 02:04:26 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 02:04:25 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 17:04:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 17 Jul 2021 17:04:23 +0800
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
Subject: [PATCH v1 00/10] Add MediaTek SoC DRM (vdosys1) support for mt8195
Date: Sat, 17 Jul 2021 17:03:58 +0800
Message-ID: <20210717090408.28283-1-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_020432_820260_B5F1AB79 
X-CRM114-Status: GOOD (  12.62  )
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

The hardware path of vdosys1 with DPTx output need to go through
by several modules, such as, PSEUDO_OVL, ETHDR, and MERGE.

Add DRM and these modules support by the patches below:

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
This series are based on the following patch:
[1] arm64: dts: Add Mediatek SoC MT8195 and evaluation board dts and Makefile
    https://patchwork.kernel.org/project/linux-mediatek/patch/20210601075350.31515-2-seiya.wang@mediatek.com/
[2] arm64: dts: mt8195: add IOMMU and smi nodes
    https://patchwork.kernel.org/project/linux-mediatek/patch/20210615173233.26682-15-tinghan.shen@mediatek.com/
[3] [01/24] dt-bindings: mediatek: mt8195: Add binding for MM IOMMU
    https://patchwork.kernel.org/project/linux-mediatek/patch/20210630023504.18177-2-yong.wu@mediatek.com/
[4] Add gce support for mt8195
    https://patchwork.kernel.org/project/linux-mediatek/list/?series=515599
[5] Add MediaTek SoC DRM (vdosys0) support for mt8195
    https://patchwork.kernel.org/project/linux-mediatek/list/?series=516277
---

Nancy.Lin (10):
  [PATCH v1 01/10] dt-bindings: mediatek: add pseudo-ovl definition for mt8195
  [PATCH v1 02/10] dt-bindings: mediatek: add ethdr definition for mt8195
  [PATCH v1 03/10] arm64: dts: mt8195: add display node for vdosys1
  [PATCH v1 04/10] soc: mediatek: add mtk-mmsys support for mt8195 vdosys1
  [PATCH v1 05/10] soc: mediatek: add mtk-mutex support for mt8195 vdosys1
  [PATCH v1 06/10] drm/mediatek: add ETHDR support for MT8195
  [PATCH v1 07/10] drm/mediatek: add pseudo ovl support for MT8195
  [PATCH v1 08/10] drm/mediatek: add merge vblank support for MT8195
  [PATCH v1 09/10] soc: mediatek: mmsys: add new mtk_mmsys struct member to store drm
    data.
  [PATCH v1 10/10] drm/mediatek: add mediatek-drm of vdosys1 support for MT8195

 .../display/mediatek/mediatek,disp.yaml       |  10 +
 .../display/mediatek/mediatek,ethdr.yaml      | 137 ++++
 .../display/mediatek/mediatek,pseudo-ovl.yaml | 105 +++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 206 ++++++
 drivers/gpu/drm/mediatek/Makefile             |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  24 +
 drivers/gpu/drm/mediatek/mtk_disp_merge.c     |  56 ++
 .../gpu/drm/mediatek/mtk_disp_pseudo_ovl.c    | 655 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  37 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h       |   3 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  63 ++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |  18 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 375 ++++++++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |  17 +-
 drivers/gpu/drm/mediatek/mtk_ethdr.c          | 537 ++++++++++++++
 drivers/gpu/drm/mediatek/mtk_ethdr.h          |  20 +
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       | 456 ++++++++++++
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h       | 109 +++
 drivers/gpu/drm/mediatek/mtk_mdp_reg_rdma.h   | 160 +++++
 drivers/soc/mediatek/mt8195-mmsys.h           |  83 ++-
 drivers/soc/mediatek/mtk-mmsys.c              |  11 +
 drivers/soc/mediatek/mtk-mutex.c              | 270 +++++---
 include/linux/soc/mediatek/mtk-mmsys.h        |   3 +
 23 files changed, 3166 insertions(+), 194 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,pseudo-ovl.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_pseudo_ovl.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_reg_rdma.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
