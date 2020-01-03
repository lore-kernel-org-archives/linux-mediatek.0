Return-Path: <SRS0=lxIO=2Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8459C32771
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2020 03:14:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE5C021D7D
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2020 03:14:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q2JUAmvC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="n3S+s0Mn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE5C021D7D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E6anj/0fmfQgdpelueYGoaICOCtXYreefU064uEQlVU=; b=Q2JUAmvCuD1lok
	9BUoLoRT72xjJDpALx3tp8VYFSpwBWU2731XQdn9iqeJLQHsbiMtAZEy5uxRIQBd6Tvva5+26LibO
	73bcdkBTgDexfBl8YmF88MDyEAsfZYLa8O3+HW5FaaDuIaMlWUie7FAIHLcj9PwWKZLTlhC3Ymjlc
	XOeE9+M47AXBVKh1rzmKVONCJhSoCiw2qf+Uy0hIqxp/NqQytwS+9CgJsvdtRkCndtTO2p5k+pw+r
	hUiMcytTvz+PzH2o8Rr58skdhqcFNKnyff3w2crL8JQI/3X1+hQHeYU8XRXzTDFgee7inaDGVT7WG
	n2GsW94uKz1Wo5uGddew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1inDPO-0004YF-Ts; Fri, 03 Jan 2020 03:13:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inDON-0003Ei-1t; Fri, 03 Jan 2020 03:12:52 +0000
X-UUID: d000a9ff25be42bab383ee3dae315d71-20200102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Y87Ghi2q7lqLcNdble/73yvTJNLbvfLPEvasR6g7eVc=; 
 b=n3S+s0MnR2PzbD/oV1gWA13W9jg4kjBv2fWHmwe2Q9MWn+YGvAqb+666qLHSGcSbnJcdvUa3Ia3jWTaP4hH7gRpKXRcZeJ7jB+AANQQeNu+57cpWmx7qFm+udWUo4hsXUGtLLoYww5zIrKmrBDv7M0DKtZpKHIsMkX+7MoDDVHs=;
X-UUID: d000a9ff25be42bab383ee3dae315d71-20200102
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 156878775; Thu, 02 Jan 2020 19:12:38 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 2 Jan 2020 19:13:01 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 3 Jan 2020 11:12:10 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 3 Jan 2020 11:13:03 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [RESEND PATCH v6 00/17] add drm support for MT8183
Date: Fri, 3 Jan 2020 11:12:11 +0800
Message-ID: <1578021148-32413-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200102_191251_144201_65B7881E 
X-CRM114-Status: GOOD (  10.71  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series are based on 5.5-rc1 and provid 17 patch
to support mediatek SOC MT8183

Change since v5
- fix reviewed issue in v5
base https://patchwork.kernel.org/project/linux-mediatek/list/?series=213219

Change since v4
- fix reviewed issue in v4

Change since v3
- fix reviewed issue in v3
- fix type error in v3
- fix conflict with iommu patch

Change since v2
- fix reviewed issue in v2
- add mutex node into dts file

Changes since v1:
- fix reviewed issue in v1
- add dts for mt8183 display nodes
- adjust display clock control flow in patch 22
- add vmap support for mediatek drm in patch 23
- fix page offset issue for mmap function in patch 24
- enable allow_fb_modifiers for mediatek drm in patch 25

Yongqiang Niu (17):
  dt-bindings: mediatek: add rdma_fifo_size description for mt8183
    display
  arm64: dts: add display nodes for mt8183
  drm/mediatek: move dsi/dpi select input into mtk_ddp_sel_in
  drm/mediatek: make sout select function format same with select input
  drm/mediatek: add mmsys private data for ddp path config
  drm/mediatek: add private data for rdma1 to dpi0 connection
  drm/mediatek: add private data for rdma1 to dsi0 connection
  drm/mediatek: move rdma sout from mtk_ddp_mout_en into
    mtk_ddp_sout_sel
  drm/mediatek: add connection from OVL0 to OVL_2L0
  drm/mediatek: add connection from RDMA0 to COLOR0
  drm/mediatek: add connection from RDMA1 to DSI0
  drm/mediatek: add connection from OVL_2L0 to RDMA0
  drm/mediatek: add connection from OVL_2L1 to RDMA1
  drm/mediatek: add connection from DITHER0 to DSI0
  drm/mediatek: add connection from RDMA0 to DSI0
  drm/mediatek: add fifo_size into rdma private data
  drm/mediatek: add support for mediatek SOC MT8183

 .../bindings/display/mediatek/mediatek,disp.txt    |  13 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  98 +++++++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |  18 ++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |  25 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |   4 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c             | 288 ++++++++++++++++-----
 drivers/gpu/drm/mediatek/mtk_drm_ddp.h             |   7 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  49 ++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |   3 +
 9 files changed, 435 insertions(+), 70 deletions(-)

-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
