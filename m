Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB645C432BE
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 14:51:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A17B6108E
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 14:51:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A17B6108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aSBFBJjgIDA6C+cXGudJTapUBwer6MlFMh9SQu7H1rM=; b=AqBDl50tvTk1Rd
	6CaLaSqyE9CX1aTmaY9pCzP32ovWA8Uwid/LD/nnauoLSVwDYhLNSW7KMXxfqhxHo4jQmBSeUNTdz
	ne9ohoR65SalvwLgKpRhsJ8f33Unltqdl8jXcE4lXwRd8aNzhgN8yUpajlpuQAMKmN1WwPe4rugYL
	o5IwjNt7fr7W5mmBt1oAZxO78tNPWaUWUN9fd9YbKJBRvBPxdjV2rW6uxhOwBpYFv4QApWRl507gB
	WUb0VWZH2VUv0ekVhydyGKZYwsBInj390SWxhWVBpiIiXKvei0jzvueAf4zX4IvCqJ4Yg9pMLHsh8
	SZjgIpqxc7fOTo8e+CLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIuFH-007KFg-PE; Wed, 25 Aug 2021 14:51:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIuCu-007J8G-H8; Wed, 25 Aug 2021 14:48:52 +0000
X-UUID: ebb8a573541148ab82b5f91e65fb3432-20210825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=gylM4nQVzGw+D9RYUcASwXAbzKCvLzp070PVT6vyrZM=; 
 b=F/frCnI/Xvp071HQcONNGrt8bGSkqfOY11QJxlodXf8eMt04nwjeB2iHXHsrfDzXOIUWpdeQmmyOsPsRpaxbPPvmDVbY490ttZS/14aAIdhyLdqtHb+K/BZs4tUrdE3A4UFP31xhBQUYd4g4kJiXGp8+3n1z86EV0z3ltly0EiY=;
X-UUID: ebb8a573541148ab82b5f91e65fb3432-20210825
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 220841225; Wed, 25 Aug 2021 07:48:37 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Aug 2021 07:48:35 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Aug 2021 22:48:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 25 Aug 2021 22:48:34 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>
CC: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Frank Wunderlich
 <frank-w@public-files.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Fabien Parent <fparent@baylibre.com>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Jitao shi
 <jitao.shi@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v9 00/14] Add Mediatek Soc DRM (vdosys0) support for mt8195
Date: Wed, 25 Aug 2021 22:48:19 +0800
Message-ID: <20210825144833.7757-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_074848_648439_3F8743C0 
X-CRM114-Status: GOOD (  18.32  )
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

Change in v9:
- seperate power and gce properties of mmsys into another dt-binding patch
- rebase on "Separate aal module" series
  https://patchwork.kernel.org/project/linux-mediatek/list/?series=516463
- keep mtk_ddp_clk_enable/disable in the same place
- change mtk_dsc_start config register to mtk_drm_ddp_write_mask
- remove the 0 setting of merge fifo config function
- add CCORR driver data for mt8195

Change in v8:
- add DP_INTF0 mux into mmsys routing table
- add DP_INTF0 mutex mod and enum into add/remove comp funtion
- remove bypass DSC enum in mtk_ddp_comp_init

Change in v7:
- add dt=binding of mmsys and disp path into this series
- separate th modidfication of alphabetic order, remove unused define and
  rename the define of register offset to individual patch
- add comment for MERGE ultra and preultra setting

Change in v6:
- adjust alphabetic order for mediatek-drm
- move the patch that add mt8195 support for mediatek-drm as the lastest patch
- add MERGE define for const varriable 

Change in v5:
- add power-domain property into vdosys0 and vdosys1 dts node.
- add MT8195 prifix and remove unused VDO1 define in mt8195-mmsys.h

Change in v4:
- extract dt-binding patches to another patch series
  https://patchwork.kernel.org/project/linux-mediatek/list/?series=519597
- squash DSC module into mtk_drm_ddp_comp.c
- add coment and simplify MERGE config function

Change in v3:
- change mmsys and display dt-bindings document from txt to yaml
- add MERGE additional description in display dt-bindings document
- fix mboxes-cells number of vdosys0 node in dts
- drop mutex eof convert define
- remove pm_runtime apis in DSC and MERGE
- change DSC and MERGE enum to alphabetic order

Change in v2:
- add DSC yaml file
- add mt8195 drm driver porting parts in to one patch
- remove useless define, variable, structure member and function
- simplify DSC and MERGE file and switch threre order

jason-jh.lin (14):
  dt-bindings: arm: mediatek: mmsys: add power and gce properties
  dt-bindings: arm: mediatek: mmsys: add mt8195 SoC binding
  dt-bindings: mediatek: display: split each block to individual yaml
  dt-bindings: mediatek: add mediatek,dsc.yaml for mt8195 SoC binding
  dt-bindings: mediatek: display: add mt8195 SoC binding
  arm64: dts: mt8195: add display node for vdosys0
  soc: mediatek: add mtk-mmsys support for mt8195 vdosys0
  soc: mediatek: add mtk-mutex support for mt8195 vdosys0
  drm/mediatek: remove unused define in mtk_drm_ddp_comp.c
  drm/mediatek: rename the define of register offset
  drm/mediatek: adjust to the alphabetic order for mediatek-drm
  drm/mediatek: add DSC support for mediatek-drm
  drm/mediatek: add MERGE support for mediatek-drm
  drm/mediatek: add mediatek-drm of vdosys0 support for mt8195

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |  30 ++-
 .../display/mediatek/mediatek,aal.yaml        |  76 ++++++
 .../display/mediatek/mediatek,ccorr.yaml      |  71 ++++++
 .../display/mediatek/mediatek,color.yaml      |  85 +++++++
 .../display/mediatek/mediatek,disp.txt        | 219 ----------------
 .../display/mediatek/mediatek,dither.yaml     |  75 ++++++
 .../display/mediatek/mediatek,dsc.yaml        |  70 +++++
 .../display/mediatek/mediatek,gamma.yaml      |  76 ++++++
 .../display/mediatek/mediatek,merge.yaml      |  98 +++++++
 .../display/mediatek/mediatek,mutex.yaml      |  79 ++++++
 .../display/mediatek/mediatek,od.yaml         |  52 ++++
 .../display/mediatek/mediatek,ovl-2l.yaml     |  86 +++++++
 .../display/mediatek/mediatek,ovl.yaml        | 101 ++++++++
 .../display/mediatek/mediatek,rdma.yaml       | 112 ++++++++
 .../display/mediatek/mediatek,split.yaml      |  56 ++++
 .../display/mediatek/mediatek,ufoe.yaml       |  59 +++++
 .../display/mediatek/mediatek,wdma.yaml       |  86 +++++++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 110 ++++++++
 drivers/gpu/drm/mediatek/Makefile             |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c     |   6 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   8 +
 drivers/gpu/drm/mediatek/mtk_disp_merge.c     | 239 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |   6 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   | 186 +++++++++-----
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |  24 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 114 ++++++---
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   1 +
 drivers/soc/mediatek/mt8195-mmsys.h           | 114 +++++++++
 drivers/soc/mediatek/mtk-mmsys.c              |  11 +
 drivers/soc/mediatek/mtk-mutex.c              |  98 ++++++-
 include/linux/soc/mediatek/mtk-mmsys.h        |   9 +
 31 files changed, 2016 insertions(+), 342 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_merge.c
 create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
