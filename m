Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1354BC3DA42
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jul 2024 08:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QW/oxVLzbpI7e2hTes/8OZU5hm6jkp/AMraA18UgH6g=; b=QWJUoA21uzOsceZdbZWxwveCOx
	QSPVI29TclzBSMN4G0gkDAxPBF8WAcITouVZcmSbqWqAJ3ntS1qkCZeqLegC+V1xzwBFHcul2MZMk
	vqaz/3w/42vdVaX5sCTSMBTdcmFwUJp/GJXeXqlFtmSKUYBGGtSptRLghcNP7HpsLe4ZsHXbBaAdp
	AHxvc+eJtN7TXHBgLqJKq4IYa35BIwgmC9pFElLr7Vze4ph17YLrkKMSS4BGjUXDenYHb3XvX8hLo
	d+B2pGGWEGWElhdVt98wX5YxJAAjJOAsojugMLsNXuf9QIeNy4lkg2EnWcabqVW0P/DFfN+fQm9Kl
	ktAKGqNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRT4p-00000009xso-38aq;
	Wed, 10 Jul 2024 08:53:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRT4J-00000009xfW-1zl7;
	Wed, 10 Jul 2024 08:52:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CF7E761741;
	Wed, 10 Jul 2024 08:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 818F6C32781;
	Wed, 10 Jul 2024 08:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720601574;
	bh=PhMCKB+xJTR+gWnIW4XNQs4NwAAVWihotq9v6lufwcc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=mIVsdcf9Wq8E3d8aADG4+Ad/topqdU/CzpA38t5GjNHBmlgrzJ7vQPmrlq+1NNZ60
	 5b64GvL5nk4XMFsyiQ3gIVvODP2fIWuRx1Niho4Y1gs9wEg/IYqgi5z4pvkF/tnIwP
	 ux8eyIsDwT5fN74oki5yn5pTldkTGGlFLzDs4O2tI39uMw9cVQymbgHlmqfMlH9aNB
	 d81d/dzO3Pbm6KdNvXnecazvXxfrkwnC5hQMBTMzvrhNy30aBdPOwHjNR+RSH5Hf/a
	 CiRrE4VJu21uxO6COyZLhWcyTgLp18i0fJtXc9v/g03+F8v65/G7kFX9vOw4iu4h5s
	 le0CBuq0+5+aQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71CFDC3DA42;
	Wed, 10 Jul 2024 08:52:54 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay <devnull+shawn.sung.mediatek.com@kernel.org>
Subject: [PATCH v3 0/5] Support alpha blending in MTK display driver
Date: Wed, 10 Jul 2024 16:52:50 +0800
Message-Id: <20240710-alpha-blending-v3-0-289c187f9c6f@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOJLjmYC/22OQQ6CMBREr2K6tubzgRZceQ/jotAvNEIhLTYaw
 t0tsDAxLmeS92Zm5skZ8ux8mJmjYLwZbAzp8cDqVtmGuNExMwTMQCbAVTe2ilcdWW1sw0FILPN
 cQiFSFqFKeeKVU7ZuI2afXRfL0dHdvLaV6y3m1vhpcO9tNCRru/sFwm7mIeHAJQoJILFWCJeet
 FETPU710LNVEvAL/jkWMBp0VuWQkygLUD+GZVk+xAF9pv0AAAA=
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>, 
 CK Hu <ck.hu@mediatek.com>, Hsiao Chien Sung <shawn.sung@mediatek.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720601573; l=1352;
 i=shawn.sung@mediatek.com; s=20240710; h=from:subject:message-id;
 bh=PhMCKB+xJTR+gWnIW4XNQs4NwAAVWihotq9v6lufwcc=;
 b=0Y6YJ9l6hxNTlX0eT4eoJURDFUA2bVcNpmPnbtUiNExoTDahpGjBRDE/4MJ2UbOapU7x5pPeU
 EEEFzTpFXvMBWiv6eU0YelHHmhb3XA8smpTagNVshdUtYeK+kQZXD6S
X-Developer-Key: i=shawn.sung@mediatek.com; a=ed25519;
 pk=VRlGZ3diQkQtpDd8fCL9/mx+TpZStm08pg8UPaG1NGc=
X-Endpoint-Received: by B4 Relay for shawn.sung@mediatek.com/20240710 with
 auth_id=184
X-Original-From: Hsiao Chien Sung <shawn.sung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_015255_648372_380A8357 
X-CRM114-Status: UNSURE (   7.55  )
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

Support "Pre-multiplied" and "None" blend mode on MediaTek's chips by
adding correct blend mode property when the planes init.
Before this patch, only the "Coverage" mode (default) is supported.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
---
Changes in v3:
- Remove the Change-Id
- Link to v2: https://lore.kernel.org/r/20240710-alpha-blending-v2-0-d4b505e6980a@mediatek.com

Changes in v2:
- Remove unnecessary codes
- Add more information to the commit message
- Link to v1: https://lore.kernel.org/r/20240620-blend-v1-0-72670072ca20@mediatek.com

---
Hsiao Chien Sung (5):
      drm/mediatek: Support "None" blending in OVL
      drm/mediatek: Support "None" blending in Mixer
      drm/mediatek: Support "Pre-multiplied" blending in OVL
      drm/mediatek: Support "Pre-multiplied" blending in Mixer
      drm/mediatek: Support alpha blending in display driver

 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 36 +++++++++++++++++++++++++--------
 drivers/gpu/drm/mediatek/mtk_ethdr.c    | 13 +++++++++---
 drivers/gpu/drm/mediatek/mtk_plane.c    | 11 ++++++++++
 3 files changed, 49 insertions(+), 11 deletions(-)
---
base-commit: 8ad49a92cff4bab13eb2f2725243f5f31eff3f3b
change-id: 20240710-alpha-blending-067295570863

Best regards,
-- 
Hsiao Chien Sung <shawn.sung@mediatek.com>



