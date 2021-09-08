Return-Path: <SRS0=79RL=N6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1897C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Sep 2021 06:04:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D5E661168
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Sep 2021 06:04:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D5E661168
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fq2GxmABK8et/KwClI7b/b6gQ5N9qjhzB77nIcGYltU=; b=3qTA9na50cuZEP
	EqBvFXLGly/qyMowLXhQDZL+yKUGaWyxIyMzZf/e8zMin5YdlGZHj/rfIVABYWSvnN0aclbXyZhTA
	be3qZgWikBkHZWmYhT/hId/Z9C89foGBEC7yLD03C7YaN9dghWeVVF9Uh386OEJan/qWqNB7O4nnO
	7LwbdSIOfC0KGbnmPpScyoWkcl9abHxzfii/b8WRk79fp+2dCk5Uo9jxoHDox+kTQYVwRa79ZcCPC
	F/tV3bYvQXF7J/IDGnYZRdNvOyFqlKCJwAGchmhC2iZUWVAMnCX/11p94tIaIDqZUGDwh007XgXKD
	XXcTY35MxsMKUar8RUHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNqhB-005SKr-TS; Wed, 08 Sep 2021 06:04:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNqgw-005SHS-Tc; Wed, 08 Sep 2021 06:04:18 +0000
X-UUID: ece0a895dc9d4bdabfd1eac3482eb6c8-20210907
X-UUID: ece0a895dc9d4bdabfd1eac3482eb6c8-20210907
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 495874545; Tue, 07 Sep 2021 23:04:11 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Sep 2021 23:04:10 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Sep 2021 14:04:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 8 Sep 2021 14:04:08 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>
CC: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v10 00/17] Add Mediatek Soc DRM (vdosys0) support for mt8195
Date: Wed, 8 Sep 2021 14:02:55 +0800
Message-ID: <20210908060312.24007-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_230415_008004_CC7ACD39 
X-CRM114-Status: GOOD (  18.91  )
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

Change in v10:
- rebase on "drm/mediatek: add support for mediatek SOC MT8192" series
  https://patchwork.kernel.org/project/linux-mediatek/list/?series=529489
- rebase on "soc: mediatek: mmsys: add mt8192 mmsys support" series
  https://patchwork.kernel.org/project/linux-mediatek/list/?series=524857
- fix some typo and "mediatek" start with capital in every dt-bindings
- move mutex yaml from dfisplay folder to soc folder
- separate merge additional propoerties to an individual dt-bindings patch

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

jason-jh.lin (17):
  dt-bindings: arm: mediatek: mmsys: add power and gce properties
  dt-bindings: arm: mediatek: mmsys: add mt8195 SoC binding
  dt-bindings: display: mediatek: disp: split each block to individual
    yaml
  dt-bindings: arm: mediatek: mutex: move mutex binding from display
    folder
  dt-bindings: arm: mediatek: mutex: add mt8195 SoC binding
  dt-bindings: display: mediatek: dsc: add yaml for mt8195 SoC binding
  dt-bindings: display: mediatek: merge: add additional prop for mt8195
  dt-bindings: display: mediatek: add mt8195 SoC binding for vdosys0
  arm64: dts: mt8195: add display node for vdosys0
  soc: mediatek: add mtk-mmsys support for mt8195 vdosys0
  soc: mediatek: add mtk-mutex support for mt8195 vdosys0
  drm/mediatek: remove unused define in mtk_drm_ddp_comp.c
  drm/mediatek: rename the define of register offset
  drm/mediatek: adjust to the alphabetic order for mediatek-drm
  drm/mediatek: add DSC support for mediatek-drm
  drm/mediatek: add MERGE support for mediatek-drm
  drm/mediatek: add mediatek-drm of vdosys0 support for mt8195

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |  32 ++-
 .../bindings/arm/mediatek/mediatek,mutex.yaml |  83 ++++++
 .../display/mediatek/mediatek,aal.yaml        |  80 ++++++
 .../display/mediatek/mediatek,ccorr.yaml      |  79 ++++++
 .../display/mediatek/mediatek,color.yaml      |  89 +++++++
 .../display/mediatek/mediatek,disp.txt        | 219 ----------------
 .../display/mediatek/mediatek,dither.yaml     |  79 ++++++
 .../display/mediatek/mediatek,dsc.yaml        |  71 ++++++
 .../display/mediatek/mediatek,gamma.yaml      |  80 ++++++
 .../display/mediatek/mediatek,merge.yaml      | 101 ++++++++
 .../display/mediatek/mediatek,od.yaml         |  53 ++++
 .../display/mediatek/mediatek,ovl-2l.yaml     |  91 +++++++
 .../display/mediatek/mediatek,ovl.yaml        | 106 ++++++++
 .../display/mediatek/mediatek,postmask.yaml   |  72 ++++++
 .../display/mediatek/mediatek,rdma.yaml       | 120 +++++++++
 .../display/mediatek/mediatek,split.yaml      |  58 +++++
 .../display/mediatek/mediatek,ufoe.yaml       |  61 +++++
 .../display/mediatek/mediatek,wdma.yaml       |  89 +++++++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 111 ++++++++
 drivers/gpu/drm/mediatek/Makefile             |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   8 +
 drivers/gpu/drm/mediatek/mtk_disp_merge.c     | 239 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |   6 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   | 222 +++++++++-------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |  26 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 132 ++++++----
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   1 +
 drivers/soc/mediatek/mt8195-mmsys.h           | 114 +++++++++
 drivers/soc/mediatek/mtk-mmsys.c              |  11 +
 drivers/soc/mediatek/mtk-mutex.c              |  95 ++++++-
 include/linux/soc/mediatek/mtk-mmsys.h        |   9 +
 31 files changed, 2167 insertions(+), 371 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mutex.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
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
