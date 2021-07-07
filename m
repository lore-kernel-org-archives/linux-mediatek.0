Return-Path: <SRS0=DDi+=L7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00269C07E95
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 04:13:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B439261375
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 04:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B439261375
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jwKaPqgPYJpcEmZtW+XYMI5YjeMCvH1lQWkXtUsNDfk=; b=sPJWgwQcisqUWQ
	r1ZkhWRDf8GkFC1mUFT/+3pSMJubUIQ0ZVmVIACMhlU8rj9QbFWlAXfNQfgWmLO6MFIl9hpcIoHWB
	j6DuFhF+AhT4zDQvZQMvDyozP6Lvq7ZRzfxhg9f/6FTF3cSkrlwsAxnIFFGqQ0GVdlx6bnRJsURxJ
	BmY5HY/RHAbH2/5MlLhuYKvPUytqQ1DOq3FGDWX66Z3woUF67RNkn0ffmD5dc6bCDFDTp3QIfdsFw
	JxwTBAXqJYF97eBfIC8zObxUOneHhl2g/HyAUQcrooYnkZkfvSfS+IRPH7VOHQPkTEWOSbBbExYT+
	fayji9fTdF9giSXNy4xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0ywW-00DJ53-Dc; Wed, 07 Jul 2021 04:13:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0yvv-00DIt6-8f; Wed, 07 Jul 2021 04:13:12 +0000
X-UUID: 225c23277474429b8dc3278373cbf4f3-20210706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=bgftFWcYMJYwTRW6ud9DppD14f2jRSNms4J+OQCaGd8=; 
 b=BnwkjI8w3HkBj2dKw/MxxUf8gmU08s7Z/p1hY5tjl1hKBGxFKYg8sW3OpF4TWOHg2ktmIuhQYpR7rSacEVQfx1/CjS2Z1qT+e3QQ5Ts2Vr+57okpVtQMzWa7MNN/Z8GuS/ArocWLBN8/pPpBLQeTFN/oFjmJ8cOmuflv86Vqv2M=;
X-UUID: 225c23277474429b8dc3278373cbf4f3-20210706
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 167168898; Tue, 06 Jul 2021 21:12:59 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Jul 2021 21:12:57 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Jul 2021 12:12:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 7 Jul 2021 12:12:50 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH v1 00/17] Add MediaTek SoC DRM (vdosys0) support for mt8195
Date: Wed, 7 Jul 2021 12:12:32 +0800
Message-ID: <20210707041249.29816-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_211311_366354_2993FE46 
X-CRM114-Status: GOOD (  11.73  )
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

The hardware path of vdosys0 with eDP panel output need to go through
by several modules, such as, OVL, RDMA, COLOR, CCORR, AAL, GAMMA,
DITHER, MERGE and DSC.

Add DRM and these modules support by the patches below:
jason-jh.lin (17):
  dt-bindings: mediatek: add definition for mt8195 display
  dt-bindings: arm: mediatek: add definition for mt8195 mmsys
  arm64: dts: mt8195: add display node for vdosys0
  soc: mediatek: add mtk-mmsys support for mt8195 vdosys0
  drm/mediatek: add mediatek-drm of vdosys0 support for MT8195
  soc: mediatek: add mtk-mutex support for mt8195
  drm/mediatek: add OVL support for MT8195
  drm/mediatek: Add component_del in OVL remove function
  drm/mediatek: add OVL support multi-layer
  drm/mediatek: add RDMA support for MT8195
  drm/mediatek: add COLOR support for MT8195
  drm/mediatek: add CCORR support for MT8195
  drm/mediatek: Add AAL support for MT8195
  drm/mediatek: add GAMMA support for MT8195
  drm/mediatek: add DITHER support for MT8195
  drm/mediatek: add MERGE support for MT8195
  drm/mediatek: add DSC support for MT8195

 .../bindings/arm/mediatek/mediatek,mmsys.txt  |  15 +
 .../display/mediatek/mediatek,disp.txt        |  13 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 105 +++
 drivers/clk/mediatek/clk-mt8195-vdo0.c        |  24 +-
 drivers/gpu/drm/mediatek/Makefile             |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c     |   2 +
 drivers/gpu/drm/mediatek/mtk_disp_color.c     |   6 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  19 +
 drivers/gpu/drm/mediatek/mtk_disp_dsc.c       | 286 ++++++++
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c     |   2 +
 drivers/gpu/drm/mediatek/mtk_disp_merge.c     | 623 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  27 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |   6 +
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h       |  32 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  37 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |   2 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  48 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   2 +
 drivers/gpu/drm/mediatek/mtk_panel_ext.c      | 136 ++++
 drivers/gpu/drm/mediatek/mtk_panel_ext.h      | 344 ++++++++++
 drivers/soc/mediatek/mt8195-mmsys.h           | 191 ++++++
 drivers/soc/mediatek/mtk-mmsys.c              |  11 +
 drivers/soc/mediatek/mtk-mutex.c              | 107 ++-
 include/linux/soc/mediatek/mtk-mmsys.h        |   9 +
 24 files changed, 2029 insertions(+), 23 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_dsc.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_merge.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_panel_ext.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_panel_ext.h
 create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
