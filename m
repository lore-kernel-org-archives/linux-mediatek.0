Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA970C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 02:15:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C70320781
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 02:15:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HbXZjkjQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cmfI8JIw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C70320781
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u/vYgRaK3heWWTnBZq2qxzjW5SmCrd5Ha3DvXLeABok=; b=HbXZjkjQRJKIvwUMK0UzAQctPk
	n0TtQOT2lepAUuu+qkcxSV19z9cvqj4Zr9FxbYITjt1pEp94vmgdvUmCd0iSoca+qGOR9sVfuaI5f
	OWLJqQgqsxy1IcAuGCq1SxISQlVbPXP+b8FABoGon9sv0WQ1Eb9BelWoh0yVSDO5q+ED3DIWM0EMg
	lkYjdmuu8g4Tg4sZ2y2/c/YCN2ry6+fjVgodTAIOynN8u8EfWbbJC1XDGqttHWgukqDBcnE/qaqCh
	oLr5i5SOMJQF5lqhXB3wGnZwnRSj+2+gHOFQR+FYPhZ0iZk+pWeIOo5U331bvuamf1NUOxWBwFbCZ
	e9fB/+Ag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyQl2-0005Lp-Ic; Thu, 23 Jul 2020 02:14:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyQky-0005KB-L5; Thu, 23 Jul 2020 02:14:49 +0000
X-UUID: 1a1188e940d0403494ebebe24f4f7607-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=qFRLx/+6VxdIz+jDbGtfOLe8xjP4LdN/gpj4rcMmUbQ=; 
 b=cmfI8JIwFkr/D8XD5NZwO40/On5bPjuLxNN9km6PhG3V4HL6SwWkE4I6KqW2wNQWNZ02i//qJau0jxpqpgkfB+Tnb7/9SRv1WyzE4zMMV5Cq8rQ6UclapIL5+Fdl/+M5DilMV473QqXgS/F/XWaV+jiI1NPqQyYLo4589ayBUQY=;
X-UUID: 1a1188e940d0403494ebebe24f4f7607-20200722
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 36463223; Wed, 22 Jul 2020 18:14:42 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 19:04:41 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 10:04:40 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 10:04:36 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [v7, PATCH 0/7] add drm support for MT8183
Date: Thu, 23 Jul 2020 10:03:11 +0800
Message-ID: <1595469798-3824-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_221448_859529_FD202EA7 
X-CRM114-Status: GOOD (  15.38  )
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

This series are based on 5.8-rc1 and provide 7 patch
to support mediatek SOC MT8183

Change since v6
- move ddp component define into mtk_mmsys.h
- add mmsys private data to support different ic path connection
- add mt8183-mmsys.c to support 8183 path connection
- fix reviewed issue in v6

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


Yongqiang Niu (7):
  drm/mediatek: move ddp component define into mtk_mmsys.h
  mtk-mmsys: add mmsys private data
  mtk-mmsys: add mt8183 mmsys support
  dt-bindings: mediatek: add rdma_fifo_size description for mt8183
    display
  arm64: dts: add display nodes for mt8183
  drm/mediatek: add fifo_size into rdma private data
  drm/mediatek: add support for mediatek SOC MT8183

 .../bindings/display/mediatek/mediatek,disp.txt    |  14 ++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  98 ++++++++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |  18 ++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |  25 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c             |  47 ++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |  34 +--
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  43 ++++
 drivers/soc/mediatek/Makefile                      |   1 +
 drivers/soc/mediatek/mmsys/Makefile                |   3 +
 drivers/soc/mediatek/mmsys/mt2701-mmsys.c          | 250 +++++++++++++++++++
 drivers/soc/mediatek/mmsys/mt8183-mmsys.c          | 161 ++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c                   | 276 ++++-----------------
 include/linux/soc/mediatek/mtk-mmsys.h             |  48 ++++
 13 files changed, 756 insertions(+), 262 deletions(-)
 create mode 100644 drivers/soc/mediatek/mmsys/Makefile
 create mode 100644 drivers/soc/mediatek/mmsys/mt2701-mmsys.c
 create mode 100644 drivers/soc/mediatek/mmsys/mt8183-mmsys.c

-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
