Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B60C54EBE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 09:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Gg8bWb1FimtqSa/S00NIuzeLTb9/WRlCLgNfTbeYtTQ=; b=zU5EJMkUQXrg6hlidzQ8F/rpHk
	qnwXOpi/ARre6PO+SbXYuRehEEcpU3TOZiZAS2yJPpaoyJZ9emxqOLDtppUlg5c8BF4SEGPz6qnUZ
	AlM4DTd9lt8ZLKCL4bQgsrn+70cgxzHR9toCkbdnyBd9eC9vJB6AqFlo4U4mKafwlw41jLpLu8Ur1
	eNZQ4iQzSqNaJDsKKKYCnyCo1l/FnNrHCte5KuMQtERcmPYY5m5ZtkEROxLcpWKh6M9YXkvY0gp05
	T58jK+vCPJZk5uY9LNMrI1Djg6J50cIQdoSm836/rckDgaoaZy889qbnrz8PqCrklHzG9NcGDVqDs
	rzpa2RRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFyz-001NCd-Ew; Fri, 13 Jan 2023 09:04:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFyx-001NAi-JL
	for linux-mediatek@bombadil.infradead.org; Fri, 13 Jan 2023 09:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Gg8bWb1FimtqSa/S00NIuzeLTb9/WRlCLgNfTbeYtTQ=; b=KLCv7Or6o/3wpypq3sNv4TEdS+
	UTzf9AKs9i4Mgtq4DWKXw/QyMbVhLc8eQlE7uiyUzKsi43sOYih/h3MKF/aukT1EJgncjK09O8p0U
	4ZUeq0YTcGuLpqE4mssG61s2UFFKb3Vu839v6Px0Ffdw+LBgsaHkgBmlaHLuccm0KkG03qkuLtGLb
	15Dj+tE32a90OcV4kSoEC5xEmOQMjdyIza7SWSvXnES+m/hSuH1UrVJzcCmgwUNM8oy4V4wBwmjfw
	eu6/7u/HRni5K1J27D7qkOtr9A2hDwHMya18IW2bBd/bibGKFnzlevYEwna4akF+0GiuLSlvOJw7b
	RY2UleYg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pGFyf-004IvB-0e
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Jan 2023 09:04:05 +0000
X-UUID: 3656723a932111eda08d4d6090ec5a5c-20230113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Gg8bWb1FimtqSa/S00NIuzeLTb9/WRlCLgNfTbeYtTQ=;
	b=pWV3Umt9NNcfcJwv1tSGe+bJogH9+aDxCuO0R9nmQdVictclFwDFTATK/vYJZxOUTvut8f3WZVugjSNzutIPIIC6BtZ99izlKVl6I8h6I5u7qYwqmDXZ0qAAso7zfr3dgHDOu/QSFlPBwy9+ihJK920URaMAC5xkJ0DfUkZ1LGA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:f212560e-e59b-4e19-8788-c9657c0464c4,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.17,REQID:f212560e-e59b-4e19-8788-c9657c0464c4,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:543e81c,CLOUDID:5e79baf5-ff42-4fb0-b929-626456a83c14,B
	ulkID:230113170324PQERBQG7,BulkQuantity:3,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0
X-CID-APTURL: Status:success,Category:nil,Trust:4,Unknown:0,Malicious:0
X-CID-BVR: 0,NGT
X-UUID: 3656723a932111eda08d4d6090ec5a5c-20230113
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2077759195; Fri, 13 Jan 2023 02:03:57 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 13 Jan 2023 17:03:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 13 Jan 2023 17:03:22 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, <linux-media@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v3 00/13] add support MDP3 on MT8195 platform
Date: Fri, 13 Jan 2023 17:03:08 +0800
Message-ID: <20230113090321.25128-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_090400_194041_F32DE72E 
X-CRM114-Status: GOOD (  13.84  )
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

Changes since v2:
- Depend on :
  [1] MMSYS/MUTEX: https://patchwork.kernel.org/project/linux-mediatek/list/?series=711592
  [2] MDP3: https://patchwork.kernel.org/project/linux-mediatek/list/?series=711618
- Suggested by Rob to revise MDP3 bindings to pass dtbs check
- Add parallel paths feature.
- Add blended components settings.

Changes since v1:
- Depend on :
  [1] MDP3 : https://patchwork.kernel.org/project/linux-mediatek/list/?series=698872
  [2] MMSYS/MUTEX: https://patchwork.kernel.org/project/linux-mediatek/list/?series=684959
- Fix compilation failure due to use of undeclared identifier in file "mtk-mdp3-cmdq.c"

Hello,

This patch is used to add support for MDP3 on the MT8195 platform that
contains more picture quality components, and can arrange more pipelines
through two sets of MMSYS and MUTEX respectively.

Moudy Ho (13):
  dt-binding: mediatek: add bindings for MediaTek mt8195 MDP3 components
  arm64: dts: mediatek: mt8195: add MDP3 nodes
  media: platform: mtk-mdp3: add support second sets of MMSYS
  media: platform: mtk-mdp3: add support second sets of MUTEX
  media: platform: mtk-mdp3: introduce more MDP3 components
  media: platform: mtk-mdp3: add checks for dummy components
  media: platform: mtk-mdp3: avoid multiple driver registrations
  media: platform: mtk-mdp3: extend GCE event waiting in RDMA and WROT
  media: platform: mtk-mdp3: add the blend of component in MUTEX MOD
  media: platform: mtk-mdp3: add mt8195 platform configuration
  media: platform: mtk-mdp3: add mt8195 shared memory configurations
  media: platform: mtk-mdp3: add mt8195 MDP3 component settings
  media: platform: mtk-mdp3: add support for parallel pipe to improve
    FPS

 .../bindings/media/mediatek,mdp3-aal.yaml     |  63 ++
 .../bindings/media/mediatek,mdp3-color.yaml   |  63 ++
 .../bindings/media/mediatek,mdp3-fg.yaml      |  63 ++
 .../bindings/media/mediatek,mdp3-hdr.yaml     |  62 ++
 .../bindings/media/mediatek,mdp3-merge.yaml   |  63 ++
 .../bindings/media/mediatek,mdp3-ovl.yaml     |  63 ++
 .../bindings/media/mediatek,mdp3-pad.yaml     |  63 ++
 .../bindings/media/mediatek,mdp3-rdma.yaml    |  30 +-
 .../bindings/media/mediatek,mdp3-rsz.yaml     |  11 +-
 .../bindings/media/mediatek,mdp3-split.yaml   |  75 ++
 .../bindings/media/mediatek,mdp3-stitch.yaml  |  63 ++
 .../bindings/media/mediatek,mdp3-tcc.yaml     |  62 ++
 .../bindings/media/mediatek,mdp3-tdshp.yaml   |  63 ++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 420 +++++++++
 .../platform/mediatek/mdp3/mdp_reg_aal.h      |  25 +
 .../platform/mediatek/mdp3/mdp_reg_color.h    |  31 +
 .../media/platform/mediatek/mdp3/mdp_reg_fg.h |  23 +
 .../platform/mediatek/mdp3/mdp_reg_hdr.h      |  31 +
 .../platform/mediatek/mdp3/mdp_reg_merge.h    |  25 +
 .../platform/mediatek/mdp3/mdp_reg_ovl.h      |  25 +
 .../platform/mediatek/mdp3/mdp_reg_pad.h      |  21 +
 .../platform/mediatek/mdp3/mdp_reg_rdma.h     |  24 +
 .../platform/mediatek/mdp3/mdp_reg_rsz.h      |   2 +
 .../platform/mediatek/mdp3/mdp_reg_tdshp.h    |  34 +
 .../platform/mediatek/mdp3/mdp_reg_wrot.h     |   8 +
 .../mediatek/mdp3/mt8183/mdp3-plat-mt8183.h   |  38 +-
 .../mediatek/mdp3/mt8195/mdp3-comp-mt8195.h   | 283 ++++++
 .../mediatek/mdp3/mt8195/mdp3-plat-mt8195.h   | 669 ++++++++++++++
 .../platform/mediatek/mdp3/mtk-img-ipi.h      |   4 +
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 453 +++++++---
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.h    |   1 +
 .../platform/mediatek/mdp3/mtk-mdp3-comp.c    | 834 +++++++++++++++++-
 .../platform/mediatek/mdp3/mtk-mdp3-comp.h    |  92 +-
 .../platform/mediatek/mdp3/mtk-mdp3-core.c    | 115 ++-
 .../platform/mediatek/mdp3/mtk-mdp3-core.h    |  33 +-
 .../platform/mediatek/mdp3/mtk-mdp3-m2m.c     |  15 +
 .../platform/mediatek/mdp3/mtk-mdp3-regs.c    |  18 +
 .../platform/mediatek/mdp3/mtk-mdp3-regs.h    |   1 +
 .../platform/mediatek/mdp3/mtk-mdp3-vpu.c     |   3 +-
 39 files changed, 3791 insertions(+), 181 deletions(-)
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
 create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_aal.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_color.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_fg.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_hdr.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_merge.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_ovl.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_pad.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_tdshp.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mt8195/mdp3-comp-mt8195.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mt8195/mdp3-plat-mt8195.h

-- 
2.18.0


