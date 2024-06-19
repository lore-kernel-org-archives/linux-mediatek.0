Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71776C27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 14:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gP3zF5otxMCgqPaFMXvDeOsW7D+gOiy3A1roOybY/kE=; b=nogqMKqSyU112XEHLj3ckhbNh8
	whUp7/T7FbuoBTaNHWHu0ifv6wPHFFCa8EEgiQXrcaSCDp8xOKa7E8TMIzANhGUUtNelegFLCANEx
	NNGO/dqG9VHSHqbFiBXcqKM+QgScA1XDGIZfCHo1KJg0MIGaaHbfk27hVyxc06cJkvc28ctEGh2fN
	HRd3dZdnBUxUsp+91p0X9SEgcX5AdD7Y5O8Z19rQM5nszubmzk15jSoKLthnDWYrD+9smdty9zyLE
	NbIfZGq+LaBKVr4s1V/7xOroyo1Sf+VSUaYjgC2MQ5XVqmhV18l9kJQajiGMh6gnKBhc30oOLun5a
	ZxgUryYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwNB-00000001YsB-235F;
	Wed, 19 Jun 2024 14:33:17 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwME-00000001YCY-0VLX;
	Wed, 19 Jun 2024 14:32:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EB561CE1E81;
	Wed, 19 Jun 2024 14:32:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 274FDC32781;
	Wed, 19 Jun 2024 14:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718807534;
	bh=Ex+r9nIcVGsNaV245AkMYgu2Uumjenu/XGyFtzZeBh8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=N50jyaLTG9PznN0A0dDA1e/+qkNYARvgyM7yIjEhzw5BwTilaJpfosYaivBWn1FI7
	 nZLVWUNxdjILMW8XQrAxwhVQryp0pk5B27U2mEDEPP5c0ji6Ns284M/hMJZk/67TAr
	 oLR4fwGxIPv2TUm8tGw00aHrbqY+DRYhqCYb7wz97h1Hjq6mmnb2uEyxcWlUOsSve5
	 FjuBp5Uywkn4g0P8YsrwJrDDJ+iPu2ZjC6TAkaosGzwMsch8MnpG5qsjZp9lXcak+x
	 SU8/J50sGOxynumhwZkGPYkeqIeX1NA+QAADFDZKMT19Nv8j5nzy3GwnGjVGj7CSjL
	 agOsyRBYlMyKw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1730AC27C53;
	Wed, 19 Jun 2024 14:32:14 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay <devnull+shawn.sung.mediatek.com@kernel.org>
Subject: [PATCH v2 00/14] Fix the errors of MediaTek display driver found
 by IGT
Date: Wed, 19 Jun 2024 22:30:41 +0800
Message-Id: <20240619-mediatek-drm-next-v2-0-abf68f46f8d2@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJHrcmYC/22NwQqDMBBEf0X23C1J1Kg99T+KB5ts6lI0kohYx
 H9vKnjr8Q0zbzaIFJgi3LINAi0c2Y8J1CUD03fji5BtYlBCFULLEgey3M30RhsGHGmdsbNayGd
 eNE7lkHZTIMfr4Xy0iXuOsw+f42KRv/S06T+2RaLAimrXGFfVpa3vZ+dq/ADtvu9f2iX4AbUAA
 AA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718807531; l=1878;
 i=shawn.sung@mediatek.com; s=20240616; h=from:subject:message-id;
 bh=Ex+r9nIcVGsNaV245AkMYgu2Uumjenu/XGyFtzZeBh8=;
 b=IEF5hiIG3ifgryrF+Y8MlCMNwmu37nVrxSNel1hAFKQ2wAABZithABFddvDCkn8Y1YnQgDEZp
 LDA1of5lYZGBDNJ+BZ1PmMzu1sfs+34qS65GE0u8ENXf099f8DQ9dUY
X-Developer-Key: i=shawn.sung@mediatek.com; a=ed25519;
 pk=lq1w8BuWDINX+4JHjGHhhbAU5ICP+cL9VCj7wn+cEDA=
X-Endpoint-Received: by B4 Relay for shawn.sung@mediatek.com/20240616 with
 auth_id=172
X-Original-From: Hsiao Chien Sung <shawn.sung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_073219_663820_2B92E622 
X-CRM114-Status: GOOD (  10.22  )
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
Changes in v2:
- Seperate the changes that belong to another repo (driver/soc/mediatek)
- Move the fix patches to the front of the series
- Link to v1: https://lore.kernel.org/r/20240616-mediatek-drm-next-v1-0-7e8f9cf785d8@mediatek.com

---
Hsiao Chien Sung (14):
      drm/mediatek: Add missing plane settings when async update
      drm/mediatek: Disable 9-bit alpha in ETHDR
      drm/mediatek: Fix XRGB setting error in OVL
      drm/mediatek: Fix XRGB setting error in Mixer
      drm/mediatek: Turn off the layers with zero width or height
      drm/mediatek: Add OVL compatible name for MT8195
      drm/mediatek: Add DRM_MODE_ROTATE_0 to rotation property
      drm/mediatek: Add new color format MACROs in OVL
      drm/mediatek: Set DRM mode configs accordingly
      drm/mediatek: Support more 10bit formats in OVL
      drm/mediatek: Support RGBA8888 and RGBX8888 in OVL on MT8195
      drm/mediatek: Support DRM plane alpha in OVL
      drm/mediatek: Support DRM plane alpha in Mixer
      drm/mediatek: Fix XRGB setting error in OVL

 drivers/gpu/drm/mediatek/mtk_ddp_comp.h         |  6 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c         | 93 ++++++++++++++++++-------
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c          | 24 +++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.h          |  4 ++
 drivers/gpu/drm/mediatek/mtk_ethdr.c            | 27 +++++--
 drivers/gpu/drm/mediatek/mtk_plane.c            |  4 +-
 7 files changed, 126 insertions(+), 34 deletions(-)
---
base-commit: 62fe4b067581d480e863191305f108bebffbc0e9
change-id: 20240615-mediatek-drm-next-ad601b349f23

Best regards,
-- 
Hsiao Chien Sung <shawn.sung@mediatek.com>



