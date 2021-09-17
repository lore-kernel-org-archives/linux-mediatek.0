Return-Path: <SRS0=QZHK=OH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8E0FC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 03:28:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A1556103C
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 03:28:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A1556103C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QDDw1Yc3Io5anPB/7tIbKWFW74ZZ2fQJG1EIRP6butM=; b=gNzPq8N4ZqXlZ+
	RvkoNiXnwXOG+JGijdJO+NvHYUT5ClolYVw0y1cw1Q66ZauI8tMFmmvVW0xfZZ0kzTHi9kwAghLBc
	zLc2bo8bTvGhySILamYfF6Ur68qEZFlxXoSkNixNaZ2OOJRi3Pmy5HHXhIEgEjuQa2RsE9PSGPUEA
	MKeiPJ7SUPx6IgNQ7COq/K5CXlYhDI0caUd3bc9Ttvs7I52GZsTi/bkjjEzFqgmw/6cnM1CLrASJq
	WL7QnSQG1hOQamTeeFMuw9HJ06yoDS9GhWCjSG5hcPFM2cvH3Hw2Ymk2FePDbyrLVaZ4dZ+ybBsKA
	vdxGWw6oHrfEAGjWX8/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mR4Xa-00D8bh-AO; Fri, 17 Sep 2021 03:27:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mR4XX-00D8ai-6R
 for linux-mediatek@lists.infradead.org; Fri, 17 Sep 2021 03:27:52 +0000
X-UUID: fbebf83a881640609b7af7871cb9dfe1-20210916
X-UUID: fbebf83a881640609b7af7871cb9dfe1-20210916
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <roy-cw.yeh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1692858553; Thu, 16 Sep 2021 20:27:47 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Sep 2021 20:27:45 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Sep 2021 11:27:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 17 Sep 2021 11:27:44 +0800
From: roy-cw.yeh <roy-cw.yeh@mediatek.com>
To: "river . cheng" <river.cheng@mediatek.com>
CC: <linux-mediatek@lists.infradead.org>, Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
Subject: [PATCH v1 0/9] Add mdp support for mt8195
Date: Fri, 17 Sep 2021 11:27:19 +0800
Message-ID: <20210917032728.22367-1-roy-cw.yeh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_202751_285759_CD0F3D7F 
X-CRM114-Status: GOOD (  10.65  )
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

From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>

Add a chip independence architecture to make 
mt8195 mdp driver compatible with previous soc.

Add below patch to support MDP driver on MT8195
  [PATCH v1 1/9] soc: mediatek: mmsys: expand MDP enum for chip independence
    architecture
  [PATCH v1 2/9] soc: mediatek: mutex: expand parameter for mdp mutex function
  [PATCH v1 3/9] media: platform: mtk-mdp3: add chip independence architecture
  [PATCH v1 4/9] dt-bindings: media: mediatek: mdp3: add additional function block yaml
  [PATCH v1 5/9] arm64: dts: mt8195: add mdp3 node
  [PATCH v1 6/9] soc: mediatek: mmsys: support mt8195 vppsys0/1
  [PATCH v1 7/9] soc: mediatek: mutex: support mt8195 vppsys0/1
  [PATCH v1 8/9] media: platform: mtk-mdp3: support mt8195
  [PATCH v1 9/9] media: platform: mtk-mdp3: Add dual pipe feature support

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |    2 +
 .../bindings/arm/mediatek/mediatek,mutex.yaml |    4 +
 .../bindings/media/mediatek,mdp3-aal.yaml     |   62 +
 .../bindings/media/mediatek,mdp3-color.yaml   |   62 +
 .../bindings/media/mediatek,mdp3-fg.yaml      |   61 +
 .../bindings/media/mediatek,mdp3-hdr.yaml     |   61 +
 .../bindings/media/mediatek,mdp3-merge.yaml   |   62 +
 .../bindings/media/mediatek,mdp3-ovl.yaml     |   61 +
 .../bindings/media/mediatek,mdp3-pad.yaml     |   62 +
 .../bindings/media/mediatek,mdp3-rdma.yaml    |   22 +-
 .../bindings/media/mediatek,mdp3-rsz.yaml     |    2 +
 .../bindings/media/mediatek,mdp3-split.yaml   |   67 +
 .../bindings/media/mediatek,mdp3-stitch.yaml  |   62 +
 .../bindings/media/mediatek,mdp3-tcc.yaml     |   62 +
 .../bindings/media/mediatek,mdp3-tdshp.yaml   |   61 +
 .../bindings/media/mediatek,mdp3-wrot.yaml    |    2 +
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  672 +++++++-
 drivers/media/platform/mtk-mdp3/mdp_reg_aal.h |   24 +
 .../media/platform/mtk-mdp3/mdp_reg_color.h   |   29 +
 drivers/media/platform/mtk-mdp3/mdp_reg_fg.h  |   23 +
 drivers/media/platform/mtk-mdp3/mdp_reg_hdr.h |   31 +
 .../media/platform/mtk-mdp3/mdp_reg_merge.h   |   23 +
 drivers/media/platform/mtk-mdp3/mdp_reg_ovl.h |   24 +
 drivers/media/platform/mtk-mdp3/mdp_reg_pad.h |   20 +
 .../media/platform/mtk-mdp3/mdp_reg_rdma.h    |   31 +
 drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h |    2 +
 .../media/platform/mtk-mdp3/mdp_reg_tdshp.h   |  114 ++
 .../media/platform/mtk-mdp3/mdp_reg_wrot.h    |   18 +
 drivers/media/platform/mtk-mdp3/mtk-img-ipi.h |  215 ++-
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   |  759 +++++++--
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.h   |    1 +
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 1352 +++++++++++++++--
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   |  274 +++-
 .../media/platform/mtk-mdp3/mtk-mdp3-core.c   | 1085 ++++++++++++-
 .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |   47 +-
 .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |   12 +-
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   |  364 ++---
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |  268 ++--
 .../media/platform/mtk-mdp3/mtk-mdp3-vpu.c    |    2 +-
 .../media/platform/mtk-mdp3/mtk-mdp3-vpu.h    |    1 +
 drivers/soc/mediatek/mt8195-mmsys.h           |  716 +++++++++
 drivers/soc/mediatek/mtk-mmsys.c              |   44 +-
 drivers/soc/mediatek/mtk-mmsys.h              |    3 +
 drivers/soc/mediatek/mtk-mutex.c              |   79 +-
 include/linux/soc/mediatek/mtk-mmsys.h        |   93 +-
 include/linux/soc/mediatek/mtk-mutex.h        |    2 +-
 46 files changed, 6341 insertions(+), 702 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-aal.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-color.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-merge.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-ovl.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-pad.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-split.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_aal.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_color.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_fg.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_hdr.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_merge.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_ovl.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_pad.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_tdshp.h

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
