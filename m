Return-Path: <SRS0=1z9j=NJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81231C432BE
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 09:27:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46E6F60230
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 09:27:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 46E6F60230
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YBXY6hW6tJoqz3Yf6IQ9j0r0AQyog0wcUz1kl39R9iw=; b=LZuZjYKs4E34Es
	++KR4A4dQHiNXfmCTA0h9Xn2Y988bR6Wj9vbKcQ2RqheHL+O+S22/7yclwW8cC/hFcEVmV85rIYdv
	0n7IN87N+IEtztfyKxNxb/iwp+gWZ6FaYhtzChKCai1ipZDBxrz1g4mO0/d/WmzN3uSKAwxT52lvV
	HDInqVOH9iyfv1nE9qPt9VLgr/vt3pTzSSf0PZVt2m4vVCutexFvOQ1YKTCD21TzdfDxTGdQIEx4F
	hPgAWjPySzHiK7hcdycVGSqpcsescIxlzFbcolsLoGOdx6xZeWKA7VZZa1EgVNRKAFJIrxHpkU7dr
	0UKVBZuxvZm7ZOPyRhBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGHrA-004tEh-Vq; Wed, 18 Aug 2021 09:27:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGHj4-004pUs-Nl; Wed, 18 Aug 2021 09:19:15 +0000
X-UUID: ac7bf13e64424793b0d4bbb13daf7ad3-20210818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=MJQubNOmRl4Nn4UjbIdlBsFYR8BOo7LptbMxOyEvCGQ=; 
 b=Wv4VQLwJQQWnf6jMf+y3qGlBOTR36nFsHe6nt04fYvoJW02UaITd7CuuDsocyfBRtX8CO2E8q6ZuKPucmBlJK9ig7Wtnq+WW75CMFWG/AxSBg5V3TlqN8O/3JelfA6MxqwWGnnRZ7f04+8Ajm+Sl4QhxAe+U1wWRtlc4IkzGILw=;
X-UUID: ac7bf13e64424793b0d4bbb13daf7ad3-20210818
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 928122103; Wed, 18 Aug 2021 02:18:52 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Aug 2021 02:18:50 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Aug 2021 17:18:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 18 Aug 2021 17:18:49 +0800
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
Subject: [PATCH v3 00/15] Add MediaTek SoC DRM (vdosys1) support for mt8195
Date: Wed, 18 Aug 2021 17:18:32 +0800
Message-ID: <20210818091847.8060-1-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_021910_842385_A0920576 
X-CRM114-Status: GOOD (  16.43  )
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
    https://patchwork.kernel.org/project/linux-mediatek/list/?series=515599
[5] Add MediaTek SoC DRM (vdosys0) support for mt8195
    https://patchwork.kernel.org/project/linux-mediatek/list/?series=531695
[6] [v8,1/2] dt-bindings: reset: mt8195: add toprgu reset-controller header file
    https://patchwork.kernel.org/project/linux-mediatek/patch/20210806023606.16867-2-Christine.Zhu@mediatek.com/

Nancy.Lin (15):
  dt-bindings: mediatek: add vdosys1 RDMA definition for mt8195
  dt-bindings: mediatek: add vdosys1 MERGE definition for mt8195
  dt-bindings: mediatek: add ethdr definition for mt8195
  dt-bindings: mediatek: Add #reset-cells to mmsys system controller
  dt-bindings: reset: mt8195: add vdosys1 reset control bit
  arm64: dts: mt8195: add display node for vdosys1
  soc: mediatek: add mtk-mmsys support for mt8195 vdosys1
  soc: mediatek: add mtk-mmsys config API for mt8195 vdosys1
  soc: mediatek: add cmdq support of mtk-mmsys config API for mt8195
    vdosys1
  soc: mediatek: mmsys: Add reset controller support for MT8195 vdosys1
  soc: mediatek: add mtk-mutex support for mt8195 vdosys1
  drm/mediatek: add display MDP RDMA support for MT8195
  drm/mediatek: add ovl_adaptor support for MT8195
  drm/mediatek: add ETHDR support for MT8195
  drm/mediatek: add mediatek-drm of vdosys1 support for MT8195

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |   3 +
 .../display/mediatek/mediatek,ethdr.yaml      | 144 +++++
 .../display/mediatek/mediatek,mdp-rdma.yaml   |  77 +++
 .../display/mediatek/mediatek,merge.yaml      |   2 +
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 217 +++++++
 drivers/gpu/drm/mediatek/Makefile             |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  28 +
 drivers/gpu/drm/mediatek/mtk_disp_merge.c     |   4 +
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 528 ++++++++++++++++++
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.h   |  19 +
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  25 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h       |   3 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  15 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 375 +++++++++++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   9 +-
 drivers/gpu/drm/mediatek/mtk_ethdr.c          | 440 +++++++++++++++
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       | 275 +++++++++
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h       |  39 ++
 drivers/soc/mediatek/mt8195-mmsys.h           | 199 +++++++
 drivers/soc/mediatek/mtk-mmsys.c              | 137 +++++
 drivers/soc/mediatek/mtk-mmsys.h              |  11 +
 drivers/soc/mediatek/mtk-mutex.c              | 270 +++++----
 include/dt-bindings/reset/mt8195-resets.h     |  12 +
 include/linux/soc/mediatek/mtk-mmsys.h        |  22 +
 25 files changed, 2677 insertions(+), 183 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
