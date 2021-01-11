Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E72EAC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 07:48:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8668B229CA
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 07:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8668B229CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tF/RfwdoWAj2YZVOuYrEAN8p9GcgaqNHKUblUFrSOyc=; b=JrdSFs4Py4XCkHEXtYxPnI/PdS
	/5/IGP5lF1HBzKbXFjAbu4qXRCbPVfbho0gNdJrPqNvo5lXCxq3bvaHx7oWpwiC3V8RynbEytQBtV
	7HhZxkaKDsBC2+RsL8euucZXjvg9oKbznCvKRNGK1gqlhKAsdn4gFm5qZ1WXYcZMINFuOU+cc2tXL
	19kQXYXAOb8JXOFo5jbWQ6IZs9bLZNdIjhCqPZHPHzDxnrWiN3/8VZ8oZ2aYb0N5506Ig1uzJOwDZ
	plH2u2wFBBknU9FFAcen3B5LH5X7/6owTeItnvEr8tHVFHNgcvyMz1yzRzjfV54LGa5pCn2MsCt0C
	c8UY3uzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyrvl-00036W-2Q; Mon, 11 Jan 2021 07:48:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyrvh-000344-8Y; Mon, 11 Jan 2021 07:47:58 +0000
X-UUID: 7f06f82cdcfc4ea0969869d0eddf94ce-20210110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=9RRnlx4S0eztNKJ2CnLlY3X58W3O5sJsBTvvCSydeWE=; 
 b=YJFCZaAKZR0N2vwUOTseDr8oCrb8yb9RPVbNAqHA9BN4Ok0sRJy5KS11MxzTwG6IXfP+6L6IIvTmBY7OPIdwN3W8UOj2p8Kk+UgKSEBB1dh82iYjhjoyuHupau1KrGoOoJ1qwmh/pR9jfvlf7YIZ/fPg1b9VQYrQDRLVuL1b6kc=;
X-UUID: 7f06f82cdcfc4ea0969869d0eddf94ce-20210110
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 240472069; Sun, 10 Jan 2021 23:47:54 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 10 Jan 2021 23:43:57 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 15:43:55 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Jan 2021 15:43:55 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3, 00/15] drm/mediatek: add support for mediatek SOC MT8192
Date: Mon, 11 Jan 2021 15:43:36 +0800
Message-ID: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_024757_471369_FE6C3E46 
X-CRM114-Status: GOOD (  14.41  )
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Hsin-Yi Wang <hsinyi@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series are based on 5.11-rc1 and SoC MT8183,
and provide 15 patch to support mediatek SOC MT8192

Changes since v2:
- fix review comment in v2
- add pm runtime for gamma and color 
- move ddp path select patch to mmsys series
- remove some useless patch

Yongqiang Niu (15):
  dt-bindings: mediatek: add description for postmask
  dt-bindings: mediatek: add description for mt8192 display
  arm64: dts: mt8192: add display node
  drm/mediatek: add component OVL_2L2
  drm/mediatek: add component POSTMASK
  drm/mediatek: add component RDMA4
  drm/mediatek: enable OVL_LAYER_SMI_ID_EN for multi-layer usecase
  drm/mediatek: check if fb is null
  drm/mediatek: Add pm runtime support for gamma
  drm/mediatek: Add pm runtime support for color
  drm/mediatek: fix aal size config
  drm/mediatek: separate ccorr module
  drm/mediatek: add matrix bits private data for ccorr
  drm/mediatek: add DDP support for MT8192
  drm/mediatek: add support for mediatek SOC MT8192

 .../bindings/display/mediatek/mediatek,disp.txt    |   3 +-
 arch/arm64/boot/dts/mediatek/mt8192.dtsi           | 134 +++++++++++
 drivers/gpu/drm/mediatek/Makefile                  |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c          | 245 +++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_color.c          |   5 +
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c          |   5 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |  34 ++-
 drivers/gpu/drm/mediatek/mtk_disp_postmask.c       | 161 ++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |   6 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c             |  35 +++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        |  98 +--------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  52 ++++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |   2 +
 14 files changed, 687 insertions(+), 98 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_postmask.c

-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
