Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15252C63793
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 09:46:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1FBA61222
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 09:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1FBA61222
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WLjjxZscB8Eq6A22nQH/84bdUycLZSEu2iS+SdZdOq4=; b=OxrByobhF0Picm
	EqHDc5olqKHO8wQurp6EG987HqL7oCnCWZWeCNznHLJuAKWCrObIsxBar0MrRdwi5w5MTGOcbDlWg
	PSPNgSkrzyWXbxACocDq5SexxnYlKhsGQMDVS3bM2zp2tvIdzvvpg4PkC6zYvH8y1Fye0hv9Ira2a
	uGeHyKxVGJPlllTwrH/F2I3g3nujUbr9StUP8O06UPsEd4D/LE1c4ejLIHEIEClcn2rR8NEDP/DfT
	PaDNdFf7CJ4EaNSbSZUthpgjyhOlMWnHO2AKJ+IMVjv/ViJDm/C7gD/B1k28a50OG6H1pXdQhxQbS
	SHueBerdJfnKCaDUICHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6VHr-000z5L-3B; Thu, 22 Jul 2021 09:46:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6VHC-000yoc-8F; Thu, 22 Jul 2021 09:46:00 +0000
X-UUID: 62ce9fe2d6b542daa30719ec405e8c4d-20210722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=MVbN+pO9WLwpdgv8+qviQ7XYjRidxKB/Hkm1L0rcXsg=; 
 b=o4OUPJom03WfmMODcJOx4P43uj9VxPLcNrJCDqtD/UP8szf23xayAOF/v8gnrWmoJJjJKxR11BfrVYbBpLi87Oz0/lKyyUZgG4FkFJQiDKYyZOhTeM2Y+S3qQd9pNsUwd1cBeM8sariRbxkBm0DxWBbd1uIKZxfE4l8/65K3wkU=;
X-UUID: 62ce9fe2d6b542daa30719ec405e8c4d-20210722
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1760378057; Thu, 22 Jul 2021 02:45:55 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Jul 2021 02:45:54 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Jul 2021 17:45:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Jul 2021 17:45:52 +0800
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
Subject: [PATCH v2 00/14] Add MediaTek SoC DRM (vdosys1) support for mt8195
Date: Thu, 22 Jul 2021 17:45:37 +0800
Message-ID: <20210722094551.15255-1-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_024558_369264_D783B86F 
X-CRM114-Status: GOOD (  15.80  )
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

The hardware path of vdosys1 with DPTx output need to go through by several modules, such as, PSEUDO_OVL and MERGE.

Add DRM and these modules support by the patches below:

Change in v2:
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
    https://patchwork.kernel.org/project/linux-mediatek/list/?series=516277
[6] [v5,2/3] dt-bindings: reset: mt8195: add toprgu reset-controller head file
    https://patchwork.kernel.org/project/linux-mediatek/patch/20210628113730.26107-3-Christine.Zhu@mediatek.com/

Nancy.Lin (14):
  dt-bindings: mediatek: add vdosys1 RDMA/MERGE definition for mt8195
  dt-bindings: mediatek: add ethdr definition for mt8195
  dt-bindings: mediatek: Add #reset-cells to mmsys system controller
  dt-bindings: reset: mt8195: Move reset controller constants into
    common location
  dt-bindings: reset: mt8195: add vdosys1 reset control bit
  arm64: dts: mt8195: add display node for vdosys1
  soc: mediatek: add mtk-mmsys support for mt8195 vdosys1
  soc: mediatek: add mtk-mmsys config API for mt8195 vdosys1
  soc: mediatek: mmsys: Add reset controller support for MT8195 vdosys1
  soc: mediatek: mmsys: add new mtk_mmsys struct member to store drm
    data.
  soc: mediatek: add mtk-mutex support for mt8195 vdosys1
  drm/mediatek: add pseudo ovl support for MT8195
  drm/mediatek: add ETHDR support for MT8195
  drm/mediatek: add mediatek-drm of vdosys1 support for MT8195

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |   3 +
 .../display/mediatek/mediatek,disp.yaml       |  38 ++
 .../display/mediatek/mediatek,ethdr.yaml      | 144 +++++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 217 +++++++
 drivers/gpu/drm/mediatek/Makefile             |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  16 +
 drivers/gpu/drm/mediatek/mtk_disp_merge.c     |   4 +
 .../gpu/drm/mediatek/mtk_disp_pseudo_ovl.c    | 593 ++++++++++++++++++
 .../gpu/drm/mediatek/mtk_disp_pseudo_ovl.h    |  23 +
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  18 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h       |   3 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  15 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 381 +++++++++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   9 +-
 drivers/gpu/drm/mediatek/mtk_ethdr.c          | 413 ++++++++++++
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       | 456 ++++++++++++++
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h       | 109 ++++
 drivers/gpu/drm/mediatek/mtk_mdp_reg_rdma.h   | 160 +++++
 drivers/soc/mediatek/mt8195-mmsys.h           | 122 +++-
 drivers/soc/mediatek/mtk-mmsys.c              | 138 ++++
 drivers/soc/mediatek/mtk-mmsys.h              |  11 +
 drivers/soc/mediatek/mtk-mutex.c              | 270 ++++----
 .../mt8195-resets.h                           |  12 +
 include/linux/soc/mediatek/mtk-mmsys.h        |  20 +
 25 files changed, 2996 insertions(+), 185 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_pseudo_ovl.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_pseudo_ovl.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_reg_rdma.h
 rename include/dt-bindings/{reset-controller => reset}/mt8195-resets.h (66%)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
