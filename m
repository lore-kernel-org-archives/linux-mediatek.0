Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29D3C27C77
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Jun 2024 08:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zj1wH+nXF0pnVlGOTTSkx2r9Df3CPzJ+6HiBU8VXhcc=; b=z+6QEdLXS3Lz2+7locCU7/nE1k
	G0+X0NQlL+VosVbW2HV0l0SbuGXT0cS9JDWMYa0KkpI8y9LsLMkj/S3XehuNIVIvAcWLxA0UT/gI8
	oRmYesblguW+2UNQRhzh5ptFV4F/i/qY9utxJ/OutbVmuEcx8IDv9EQWjiyspYM0GcMPbiPakgQ2N
	xruOdx6OVFxYkY1vpeOZCOeV9Q3Ug+qsJ/dxQO6cJGq0+qFVUAdCRvRSThU3eU60G8SqNhb1ptEeY
	hfu7BSBnIjQzK1m8LgumHrRoieUyjHY3zLZzKV0w6Zsg0bZRFs3ZUhovRoJgp9jakaDudoaGUyOBG
	nHfBlw/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIlHD-000000078JC-3foY;
	Sun, 16 Jun 2024 08:30:15 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIlGJ-000000077jA-2p8P;
	Sun, 16 Jun 2024 08:29:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CD6DECE0B4C;
	Sun, 16 Jun 2024 08:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C19DEC2BBFC;
	Sun, 16 Jun 2024 08:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718526554;
	bh=r10waYEMGAymNOh3QIyIV85JK6+0pN1kGYW3MVMVAVg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=JHhknxq0z6n0TCJmxlOa3vL7BhNIBTyulXx/ftmfPiZRB2t9ESD1JFIGqeXwFqRus
	 d85HzY1IviXo802XZvDksLD+yLAeo/t9NFF3sHkT5aVXdO43OhUsXgPcexfuxgXmNf
	 2Gy1r8Xrt8gMJTCy7F6lp7sJ4QPqGZ0Q+HM/RtdPItIx5RYuOZ0sW/C/TVUB290Y9J
	 eibkwV8tx8DVMjDLmXcs3h6VW/yYl+qWVtvq/4Hqcxv/6sy9O1BCFphtsDVqfUo0Uz
	 9il9Vne3rxX4j396JmfUKg2fy8Kmmpa2WYfKtF4mk1Ifb/ET8ezXaTW7M7A6cBrI5Q
	 aavpwTuyYGFNQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3EA9C27C6E;
	Sun, 16 Jun 2024 08:29:14 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay <devnull+shawn.sung.mediatek.com@kernel.org>
Subject: [PATCH 00/13] Fix the errors of MediaTek display driver found by
 IGT
Date: Sun, 16 Jun 2024 16:29:10 +0800
Message-Id: <20240616-mediatek-drm-next-v1-0-7e8f9cf785d8@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFaibmYC/x3MTQqAIBBA4avIrBtQ+4G6SrSwnGoILTQiEO+et
 PwW7yWIFJgiDCJBoIcjn75AVQKW3fiNkG0xaKkb2akWHVk2Nx1og0NP743GdlLNddOvuobSXYF
 Wfv/nOOX8ASDqfQljAAAA
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>, 
 Daniel Kurtz <djkurtz@chromium.org>, YT Shen <yt.shen@mediatek.com>, 
 Mao Huang <littlecvr@chromium.org>, "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Hsiao Chien Sung <shawn.sung@mediatek.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718526553; l=1639;
 i=shawn.sung@mediatek.com; s=20240616; h=from:subject:message-id;
 bh=r10waYEMGAymNOh3QIyIV85JK6+0pN1kGYW3MVMVAVg=;
 b=tingLMnjsTKtbIyzbXebc3jnQb0ioiL1lqGVFCw4e0VaknTStBGtN+rZoSzvDVFJUrNJ/nvBW
 txWOmGBNVd5AWc8Num1/KDshCYgGD3L1Kwcf8Ys7mnaoMpLEmfUC+Sz
X-Developer-Key: i=shawn.sung@mediatek.com; a=ed25519;
 pk=lq1w8BuWDINX+4JHjGHhhbAU5ICP+cL9VCj7wn+cEDA=
X-Endpoint-Received: by B4 Relay for shawn.sung@mediatek.com/20240616 with
 auth_id=172
X-Original-From: Hsiao Chien Sung <shawn.sung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_012920_199988_74A20621 
X-CRM114-Status: UNSURE (   7.19  )
X-CRM114-Notice: Please train this message.
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
Reply-To: shawn.sung@mediatek.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series fixes the errors of MediaTek display driver found by IGT.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
Hsiao Chien Sung (13):
      soc: mediatek: Disable 9-bit alpha in ETHDR
      drm/mediatek: Add OVL compatible name for MT8195
      drm/mediatek: Add missing plane settings when async update
      drm/mediatek: Add DRM_MODE_ROTATE_0 to rotation property
      drm/mediatek: Set DRM mode configs accordingly
      drm/mediatek: Turn off the layers with zero width or height
      drm/mediatek: Support more 10bit formats in OVL
      drm/mediatek: Support RGBA8888 and RGBX8888 in OVL on MT8195
      drm/mediatek: Fix XRGB setting error in OVL
      drm/mediatek: Fix XRGB setting error in Mixer
      drm/mediatek: Add new color format MACROs in OVL
      drm/mediatek: Support DRM plane alpha in OVL
      drm/mediatek: Support DRM plane alpha in Mixer

 drivers/gpu/drm/mediatek/mtk_ddp_comp.h         |  6 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c         | 85 +++++++++++++++++--------
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c          | 24 +++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.h          |  4 ++
 drivers/gpu/drm/mediatek/mtk_ethdr.c            | 26 ++++++--
 drivers/gpu/drm/mediatek/mtk_plane.c            |  4 +-
 drivers/soc/mediatek/mtk-mmsys.c                |  1 +
 8 files changed, 118 insertions(+), 34 deletions(-)
---
base-commit: 62fe4b067581d480e863191305f108bebffbc0e9
change-id: 20240615-mediatek-drm-next-ad601b349f23

Best regards,
-- 
Hsiao Chien Sung <shawn.sung@mediatek.com>



