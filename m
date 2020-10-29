Return-Path: <SRS0=uLCs=EE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4802C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 15:28:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A2732076B
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 15:28:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yhqwK63Q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="aUc0qQBv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A2732076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RlSSGc1WxVeIPbfYVPZIMvrcH3nF5slczTpScuXjoKU=; b=yhqwK63Qb9ZSjTJi4U4bQHwixF
	H/7Wahb5v59b18e9uJSctoEmpzbiyJM2fHngA1N5jQTLypv8OlFDq9FibhBk1MNsPkBokepWnax1Z
	VqvSKBIl1vDd4HgAXKj//a6po0RWQSh8+6nHk30mflHYL05xS6k5fn+maE3+D1UzemurChTReun48
	4eADlYyor6g5U+daZmuWdqe+GoaJIWSWp+J0pAf8/ldVgOKcXjcmwHdVx7OeBqf7oFmey8llam3s6
	W+Nq23xrNCq1kZ3iMKuc1KdYcpRurGRUXGltgPkd85MwIwbTZu1YIx+0Olq0FWUXmsgImdM+sqmW3
	r1JqtTQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kY9qG-00018p-Tc; Thu, 29 Oct 2020 15:27:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY9qF-000180-6M
 for linux-mediatek@lists.infradead.org; Thu, 29 Oct 2020 15:27:55 +0000
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B7F2E206F4;
 Thu, 29 Oct 2020 15:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603985273;
 bh=5Dwq9VBI7Qs1RjpdmmRJuv1bZLk0Qmz9ychYpZvyTz8=;
 h=From:To:Cc:Subject:Date:From;
 b=aUc0qQBvuDFYnjIMpiu0ud1L8YbtRoaWvwBA4Cpx2ZaGdlxa0Wvux37wNwqvRymUP
 vnQPcq1hpkqVgGnTYIM/o1T97V4UbpyO/DmmdT7iT3RnBxW7u8o/mkBmHIvve4iEND
 A63kVVBJpthPyCxew7wgDk942dv+oXuTTKhf7oAg=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH 0/3] Move Mediatek MIPI DSI PHY driver from DRM folder to PHY
 folder
Date: Thu, 29 Oct 2020 23:26:59 +0800
Message-Id: <20201029152702.533-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_112755_363958_597C7816 
X-CRM114-Status: GOOD (  11.68  )
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

mtk_mipi_dsi_phy is currently placed inside mediatek drm driver, but it's
more suitable to place a phy driver into phy driver folder, so move
mtk_mipi_dsi_phy driver into phy driver folder.

Chun-Kuang Hu (3):
  drm/mediatek: Separate mtk_mipi_tx to an independent module
  phy: mediatek: Move mtk_mipi_dsi_phy driver into drivers/phy/mediatek
    folder
  MAINTAINERS: add files for Mediatek DRM drivers

 MAINTAINERS                                                | 1 +
 drivers/gpu/drm/mediatek/Kconfig                           | 1 +
 drivers/gpu/drm/mediatek/Makefile                          | 3 ---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c                     | 1 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.h                     | 1 -
 drivers/phy/mediatek/Kconfig                               | 7 +++++++
 drivers/phy/mediatek/Makefile                              | 5 +++++
 .../mediatek/phy-mtk-mipi-dsi-mt8173.c}                    | 2 +-
 .../mediatek/phy-mtk-mipi-dsi-mt8183.c}                    | 2 +-
 .../mtk_mipi_tx.c => phy/mediatek/phy-mtk-mipi-dsi.c}      | 5 ++++-
 .../mtk_mipi_tx.h => phy/mediatek/phy-mtk-mipi-dsi.h}      | 0
 11 files changed, 20 insertions(+), 8 deletions(-)
 rename drivers/{gpu/drm/mediatek/mtk_mt8173_mipi_tx.c => phy/mediatek/phy-mtk-mipi-dsi-mt8173.c} (99%)
 rename drivers/{gpu/drm/mediatek/mtk_mt8183_mipi_tx.c => phy/mediatek/phy-mtk-mipi-dsi-mt8183.c} (99%)
 rename drivers/{gpu/drm/mediatek/mtk_mipi_tx.c => phy/mediatek/phy-mtk-mipi-dsi.c} (97%)
 rename drivers/{gpu/drm/mediatek/mtk_mipi_tx.h => phy/mediatek/phy-mtk-mipi-dsi.h} (100%)

-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
