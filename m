Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D653C27C6E
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Jun 2024 08:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OMQ+tY3zrYH6g+3R5g8ftQMhpYJEf2PnlLT3/tEQgyc=; b=lT8yPIw9U+t/e/3U8oUFkaP3KZ
	iEe3uZ/iMgTVmod/tKi/+bvNcvfZmsyYOBkLbmqwpimjCUF2BWKnTD+39t3Hg4BtuGwBzcx3m7UqR
	1TIjmluF49ULR/zon+iOvEju6nP+YDXmU7pUhKf19oH6Xz4lbKzTc7VBbksUR2ybky4zu7INtc9Gq
	7NH7ouhlbYF05dEJT18kSbVbY8537bgXwc2e76588kGTcOOoCqua2f7yvtwiemGfZzC7r2cNU9bit
	HCSM4SXjxYxAGyrmdtTnP48PmP5j3NmKDg+HbO0s1jJ3c6h635o8K99SF4hURCAiSVim/EPb5PIyU
	nZ/nm1OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIlI0-000000078t8-1CyN;
	Sun, 16 Jun 2024 08:31:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIlGN-000000077lc-1pbh;
	Sun, 16 Jun 2024 08:29:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5DAD360C7C;
	Sun, 16 Jun 2024 08:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7784CC4DDE2;
	Sun, 16 Jun 2024 08:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718526555;
	bh=HGD/YyvSyv29O14mwDPoDHHeYEPWb4sPouMX0i+8w4c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OP3VLo3l89iU4AYRBL585fnhDMdllV8vziZ5yJEvrI4Bp/jwe+Jp05dfpdCCx7gAQ
	 eBEdHvVcDoH3DK48OFmPGlY+2lQDcN0xsK7YXoGi2ifKiSYPxmnDK/B/qqBgdqpDx9
	 XYFLN0U7AIYuYL+AEZwwlr28lvskkggzDYTcMtb7iMeFnPLn9kqDjBYKUub5zNK2e+
	 IQUbDXJXI/0tUPTJbQK+rf033dVmIrGWjfGJECglNgcdYnyG0JHsJq529F57HZcbon
	 cia40tNdQN5fqF6Z+k4Rm01wZQo33KBpjas3UFHvEI/Zqc1XIs7n+CMHdKNEddTLA2
	 vdEHFj/K3tmRQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EBE9C27C77;
	Sun, 16 Jun 2024 08:29:15 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay <devnull+shawn.sung.mediatek.com@kernel.org>
Date: Sun, 16 Jun 2024 16:29:22 +0800
Subject: [PATCH 12/13] drm/mediatek: Support DRM plane alpha in OVL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240616-mediatek-drm-next-v1-12-7e8f9cf785d8@mediatek.com>
References: <20240616-mediatek-drm-next-v1-0-7e8f9cf785d8@mediatek.com>
In-Reply-To: <20240616-mediatek-drm-next-v1-0-7e8f9cf785d8@mediatek.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718526553; l=991;
 i=shawn.sung@mediatek.com; s=20240616; h=from:subject:message-id;
 bh=5BJt05q2olOJLyH/qGdDD53kmjnnoM3hvSVC/ZouM1A=;
 b=jCZ7lXGpv+AGtyowVT4z9RF57ghEL/4IapUmjqVDC/g1vyfBCShi0WXvzHVqwsGRGhY5JtcuO
 otzo4pze4POBtP+gxqYbkHSwA7//1+jksNg8PKDBFkHGUP+A3bEX0p9
X-Developer-Key: i=shawn.sung@mediatek.com; a=ed25519;
 pk=lq1w8BuWDINX+4JHjGHhhbAU5ICP+cL9VCj7wn+cEDA=
X-Endpoint-Received: by B4 Relay for shawn.sung@mediatek.com/20240616 with
 auth_id=172
X-Original-From: Hsiao Chien Sung <shawn.sung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_012923_642111_1C316D25 
X-CRM114-Status: UNSURE (   8.65  )
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

From: Hsiao Chien Sung <shawn.sung@mediatek.com>

Set the plane alpha according to DRM plane property.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 33b58da15ba4..f358dbfed5e3 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -450,8 +450,10 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 	}
 
 	con = ovl_fmt_convert(ovl, fmt);
-	if (state->base.fb && state->base.fb->format->has_alpha)
-		con |= OVL_CON_AEN | OVL_CON_ALPHA;
+	if (state->base.fb) {
+		con |= OVL_CON_AEN;
+		con |= state->base.alpha & OVL_CON_ALPHA;
+	}
 
 	/* CONST_BLD must be enabled for XRGB formats although the alpha channel
 	 * can be ignored, or OVL will still read the value from memory.

-- 
Git-146)



