Return-Path: <SRS0=VH+m=2X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29451C2D0DD
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jan 2020 04:02:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF60720863
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jan 2020 04:02:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JnhSvKNW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fX9O1l0w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF60720863
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Je1UVLZziX4nL3kFYIxZhRZ7me5Q17ErAlBRPatGAaE=; b=JnhSvKNWtzsFy0
	KBNS2xdmxgRlAkVYYrurP6wmRHACcQHEtL5npxVIbygbOxJs4Z8OZ9Yb9lPL3bPfh8LzjwoWrNzzk
	QX4ch9D5CuJP8hsCRbnW1kZgmzOwa9/GdIr1OxYwfgJTsg9i8NXcUjz0q/3bHbvcJ0o6Il8rO9OAA
	BKQ/fkRjUyOchfOfpk0/xLcEh6lfSlaG8Jh+BDrUtWzd0jXeXv8qhhIg4jz8OBJqxfMhcIr4bkwMz
	BJaXG9IZ7H9ZHCwrTgHKVfibCb3S2I0oL2jhq9gaA+GhfpDxkF8osHYdop2aSdgVJWLFkhx2bcacm
	joOmqq/T/EmA6A9XSniw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1imrhE-0003ko-FF; Thu, 02 Jan 2020 04:02:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1imrgn-0003DX-NP; Thu, 02 Jan 2020 04:02:28 +0000
X-UUID: fd5efbd7aa4048e08bd81720696d0078-20200101
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=7wLu6VmQu6UVnJpXdVr9q3D+QkDfPwKQ1g0hCwiH1Ys=; 
 b=fX9O1l0wxhZS0z9Q2hiQnuXJMa0RutY8KiYdxZ6UFqGHrmMutfaGOG39HPROnj3qzpV1M6NovYvJKxZgygUTqks7dvIw3WXgwWaWSO7utLY9NmnSIQpR2C6a0OuMNBQh/JXJXgUwTYYKK7SNkmTeL9mTDq7XsBLXVcuUq0A7aSc=;
X-UUID: fd5efbd7aa4048e08bd81720696d0078-20200101
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 395783025; Wed, 01 Jan 2020 20:02:16 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 1 Jan 2020 20:02:35 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 2 Jan 2020 12:01:43 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 2 Jan 2020 12:01:32 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v6, 00/14] add drm support for MT8183
Date: Thu, 2 Jan 2020 12:00:10 +0800
Message-ID: <1577937624-14313-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200101_200225_772297_79CE3D86 
X-CRM114-Status: GOOD (  10.19  )
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

This series are based on 5.5-rc1 and provid 14 patch
to support mediatek SOC MT8183

Change since v5
- fix reviewed issue in v5

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

Yongqiang Niu (14):
  arm64: dts: add display nodes for mt8183
  drm/mediatek: move dsi/dpi select input into mtk_ddp_sel_in
  drm/mediatek: make sout select function  format same with select input
  drm/mediatek: add mmsys private data for ddp path config
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

 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 103 +++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c  |  18 ++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c |  27 ++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  |   4 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c   | 291 +++++++++++++++++++++++--------
 drivers/gpu/drm/mediatek/mtk_drm_ddp.h   |   7 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c   |  51 ++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.h   |   3 +
 8 files changed, 434 insertions(+), 70 deletions(-)

-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
