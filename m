Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B31C2BA15
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 14:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4hYEgc6wX6WrljnlkvMPkSYoxqnzkqXXBOFwkko4/WY=; b=TRFqjcw0MAKsFiiKdYvkXAAUAw
	NzaTejZU5U9agbwHxXFh9HX+jBiOARYQWcJg1Y3rUFkCSIPetcopuq9iZWEgrd/VXGCXigT4qbg+T
	lLSwUS2umJgsPr3LjXhhmm6f+KE2peurE7UvycGUiWmkOnoYe3O3+N1phHv/q2ABrbYWePFw93uMq
	8LyEks/NDmriY/J0pFjFNSeAi8zJ3LnHo52n6fRb0bV+/wSX6uenKp05yn3fLrlH1S4SHXCPwa0+8
	rS1gqvrNKsQHqr8jr3Mga7UtaQRDRXqI902SHBK2PYiRRmh17vjWHbUVLHxrXpqO6xB8zmMX9NfyD
	sbodfdrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwMa-00000001YTV-02cF;
	Wed, 19 Jun 2024 14:32:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwME-00000001YDA-0eC8;
	Wed, 19 Jun 2024 14:32:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D32AE61E4F;
	Wed, 19 Jun 2024 14:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91EC0C4AF07;
	Wed, 19 Jun 2024 14:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718807534;
	bh=w4HhvErl0+9KBEyLNkAXO343a8rNSOMKg9ZlSA5XdCM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oA31hkudzbjKhpSIxSL3fLWyFoHT1tsNFvy51lFWDbheca++vg7ermsMWTIpkrWOw
	 hxWqoSi1K056X9eZGwVZbMU9eB1ZJ4OoIFnwWJS3zyZ/Fox1pWjShiLnaFINfbxtP4
	 l0WSYcbh+mEBf2aCS7qJzHVqpX4c1nCWJ4gudBrSMv/F2wRv3Shc2phneX74BchaB7
	 r/ZkxlUKh8rN1fXI9XmeFtrK65MZXnRJB6YD4O1UpbZIGMPZxH8+SMIGC7gIH4jTgu
	 xkrjwj0t0XQzyHcnwbbMU+Udm+8EiUyfZPu6unMQo9AkTYnOKc3RdpsXgmHSQ/85Z+
	 sX+yCMeiE36Gw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A6CAC2BA15;
	Wed, 19 Jun 2024 14:32:14 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay <devnull+shawn.sung.mediatek.com@kernel.org>
Date: Wed, 19 Jun 2024 22:30:47 +0800
Subject: [PATCH v2 06/14] drm/mediatek: Add OVL compatible name for MT8195
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240619-mediatek-drm-next-v2-6-abf68f46f8d2@mediatek.com>
References: <20240619-mediatek-drm-next-v2-0-abf68f46f8d2@mediatek.com>
In-Reply-To: <20240619-mediatek-drm-next-v2-0-abf68f46f8d2@mediatek.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718807531; l=1050;
 i=shawn.sung@mediatek.com; s=20240616; h=from:subject:message-id;
 bh=BgdlkkD28fU8kVaiXpAjJEsbIm8CSiJsfkQTGRrkbL8=;
 b=nrDkN0T+6iVl3vSI8cuh8yGey8rxcZiI+R/SBD2LO/UWpIp5k8KvBn9DoKkxLtnGXScDdjCdR
 9WiQWMBlLzyB7oKGHHKHZ8uTDkqxcfl5HpKekKi7m+2sPczpep5f8HX
X-Developer-Key: i=shawn.sung@mediatek.com; a=ed25519;
 pk=lq1w8BuWDINX+4JHjGHhhbAU5ICP+cL9VCj7wn+cEDA=
X-Endpoint-Received: by B4 Relay for shawn.sung@mediatek.com/20240616 with
 auth_id=172
X-Original-From: Hsiao Chien Sung <shawn.sung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_073219_541790_1C941A3F 
X-CRM114-Status: GOOD (  10.16  )
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

Add OVL compatible name for MT8195.
Without this commit, DRM won't work after modifying the device tree.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index b5f605751b0a..8e047043202b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -743,6 +743,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_OVL },
 	{ .compatible = "mediatek,mt8192-disp-ovl",
 	  .data = (void *)MTK_DISP_OVL },
+	{ .compatible = "mediatek,mt8195-disp-ovl",
+	  .data = (void *)MTK_DISP_OVL },
 	{ .compatible = "mediatek,mt8183-disp-ovl-2l",
 	  .data = (void *)MTK_DISP_OVL_2L },
 	{ .compatible = "mediatek,mt8192-disp-ovl-2l",

-- 
Git-146)



