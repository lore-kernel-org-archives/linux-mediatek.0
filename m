Return-Path: <SRS0=lxeM=EJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25E8C55179
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 00:35:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 884B6223FB
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 00:35:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="scaVAfPB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="EQIyoffH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 884B6223FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5dk4CUf7ETsPQ9VWBgeB7XLiGGP9/4CSFBQjWdLP/TE=; b=scaVAfPB1VC0w9TbVMAhQ6JUUS
	slgEuJ4SKfhw+PsIYoBj0lOVH1BIQAaoGBqxkTeN6H2rj8MouKnH4yXnYdmathUjoEkc7iALJUrDl
	D7um9798DScxRe8lSrZbNLoqBZVQCrDxmf+3nfi6igDEmGQ79RjIvI6Zw/lL6csHayOm22NSv6UQq
	++KxHF1iWd2uIz+sOX1WC1lAity2Xe0ATf03lcdsFuSLrz8XxiGWpVWXRewNk9ns5Rd9jQwytWfQz
	rFrDyQ9qfMpPUW0vuSz4F0YgcZMO5xQMf3S1iy2l131+wlTpkjIocuS9hNsf9ZF2XxZaEmB6UFKmP
	rWx71Y9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZkHg-000145-Pj; Tue, 03 Nov 2020 00:34:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZkHb-000125-FP
 for linux-mediatek@lists.infradead.org; Tue, 03 Nov 2020 00:34:44 +0000
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 946442225E;
 Tue,  3 Nov 2020 00:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604363681;
 bh=zjbAVeWRYaUwxfwFsQjsM8GEoZULM41QxsHun96CCxU=;
 h=From:To:Cc:Subject:Date:From;
 b=EQIyoffH3k8mQp8PsmXEy/B0YcigmHwvFDNhivxurwIjIUDkJwyRlGn+vBqqFx2rI
 CwQKfp2q7MXU0UplGhYrdRU22YL42lVlsdwE3Xj3kZnTEZU+NMusVHF1jO717G7VPR
 RmRMBewngRmu3L0pD9bUlJ3wlseJpC3h3QKCU0QI=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 00/11] Decouple Mediatek DRM sub driver
Date: Tue,  3 Nov 2020 08:34:11 +0800
Message-Id: <20201103003422.17838-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_193443_621084_2D70F1E3 
X-CRM114-Status: GOOD (  10.13  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mtk ccorr is controlled by DRM and MDP [1]. In order to share
mtk_ccorr driver for DRM and MDP, decouple Mediatek DRM sub driver
which include mtk_ccorr, so MDP could use this decoupled mtk_ccorr.

[1] https://patchwork.kernel.org/patch/11140751/

CK Hu (9):
  drm/mediatek: Move clk info from struct mtk_ddp_comp to sub driver
    private data
  drm/mediatek: Move regs info from struct mtk_ddp_comp to sub driver
    private data
  drm/mediatek: Remove irq in struct mtk_ddp_comp
  drm/mediatek: Use struct cmdq_client_reg to gather cmdq variable
  drm/mediatek: Move cmdq_reg info from struct mtk_ddp_comp to sub
    driver private data
  drm/mediatek: Change sub driver interface from mtk_ddp_comp to device
  drm/mediatek: Register vblank callback function
  drm/mediatek: DRM driver directly refer to sub driver's function
  drm/mediatek: Move mtk_ddp_comp_init() from sub driver to DRM driver

Chun-Kuang Hu (2):
  drm/mediatek: Get CMDQ client register for all ddp component
  drm/mediatek: Use correct device pointer to get CMDQ client register

 drivers/gpu/drm/mediatek/mtk_disp_color.c   |  86 ++---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  69 ++++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 215 ++++++-----
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    | 169 +++++----
 drivers/gpu/drm/mediatek/mtk_dpi.c          |  44 +--
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  75 ++--
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |   1 -
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 389 ++++++++++++--------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 100 ++---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  30 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c          |  47 +--
 12 files changed, 658 insertions(+), 569 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_drv.h

-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
