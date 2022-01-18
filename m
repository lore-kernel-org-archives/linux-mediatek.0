Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D91C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jan 2022 13:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hwvhoAxfcYEnnB4RKUtM4mKQkMRLYhnPIMDsSf/YwzM=; b=3jQQq+LF8Kri10
	s5VaYSJk9WZfzvz33WTfAnB7lEqW61ZagPjaeRibjYf1uzC/loXedWYdo7pdWEqtp9ncz1UjMyBEn
	GaUr2hDgh1bVS7LTCyxV2j6TgRO3a+o/SgiJYRpiKydvRctyO7Q+QW7vFmqddeogxK9Il0CsLWDtL
	SBa725ENpdXfFEWrfnVJ2Pakq60RfBt8MH6RK2Ud21YroUHB3WNJm3Iv530NUuic4HMyoiNXAaVwZ
	NSbKCRMrERDQCfNZ41H7cVVpa+ek4AiR2xUKsuoSJwvv5cuYQj6FZuo8U0O9SJaMXMubyu0uyslIv
	/h3Nd7QYKQ8WxpFQ4upQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9ogm-001gMN-0R; Tue, 18 Jan 2022 13:38:20 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9ogZ-001gJd-ES; Tue, 18 Jan 2022 13:38:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 980171F43F1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642513086;
 bh=gAJqDSZX33NiJSylH50FUmE5ljeiUi+EvyLQjN8gu0s=;
 h=From:To:Cc:Subject:Date:From;
 b=en6ZVaKEZ5/Pcq6HgkiyVqRZ/ISe6Mx4RYmT5gQQ1+x6gnXvJVHmWg0exmzoyqhvJ
 7prirfD4v9hYzp5XMmqJrbD/N+j0Ex5Ke3RPaWsww6YSLbc+5R6jC1y6XNDDiq1D0D
 woERW0SCrQa8NcH8w9osIcXVQz56C0dluayI0XUvsgbRxBzP72fzktTf1gdFNmzr3S
 3sqs6dbyBdjpARKvso0i2HYRiy4nDc4RwdrI5s6a4oyb7XCylZxytyXZEs3JW5PBsG
 2g6jXjZVV1Sb+OOFpuOCJpPyjlbhO1gZH3wRXPjSrKPHYLzFkBMnVUg+qxfenY707V
 QeGBbOq7IBg5g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 1/2] drm: mediatek: mtk_drm_plane: Use kmalloc in
 mtk_plane_duplicate_state
Date: Tue, 18 Jan 2022 14:37:58 +0100
Message-Id: <20220118133759.112458-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_053807_634680_9D9F3BAA 
X-CRM114-Status: GOOD (  10.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There is no need to zero out the newly allocated memory because we are
duplicating all members of struct mtk_plane_state: switch to kmalloc
to save some overhead.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index c74cb94e445e..39cb9a80d976 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -57,7 +57,7 @@ static struct drm_plane_state *mtk_plane_duplicate_state(struct drm_plane *plane
 	struct mtk_plane_state *old_state = to_mtk_plane_state(plane->state);
 	struct mtk_plane_state *state;
 
-	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	state = kmalloc(sizeof(*state), GFP_KERNEL);
 	if (!state)
 		return NULL;
 
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
