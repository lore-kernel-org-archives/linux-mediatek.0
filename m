Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A35BEB64DD
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jul 2023 12:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CGjZqnv5f04g8ybF/32ZW4B+i3AYe2YPeOze4GlzXGQ=; b=rn5X+8gtgMDE+B4lZp3hGv1xEV
	pAzalD82WKL0sD1p5rw9nh33EabMGbv7CvEp+UXnyxYAEp1JlLQrdrnIQz2ImGy/W+e92g3cRwTMg
	Vi4IQQHtFMf2RphjPzuvrLB8llly+dPm8tNBuvin1Eev6RYGMU0tNnQ7jxF7hKH+OfYQMY1a0nPf8
	kvOZiTaAEgCJYQmRRAuiEEJ82YeawSb+ZnfqrJX2ZAM36eHJnXdZmxXvYHmMaWaXmbaHWQkvNaaGd
	rHSueZgCoA1BRIRRrVLKL+LpPa/pc2NgZ3x564G+hmShBNebR8Vxj9Jc5p0dO2wROxqvJpNcj1UJO
	kyofbvxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHO87-001cn1-2s;
	Thu, 06 Jul 2023 12:30:39 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHO82-001cgC-0f;
	Thu, 06 Jul 2023 12:30:35 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3A3DC6606FC5;
	Thu,  6 Jul 2023 13:30:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688646633;
	bh=eiF+MPOcDv9CDEFKbz/2nzTwuFjo2RNY4YZzBre0LbM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OQNqTl/1PE5lx6QecqCAcVKxRo9TdiDhT7DlARV+Z4YqyJ/ya30FTg+bdZdACDtsm
	 7e0moLQLKsb/m+Dj3P5R/vDXNkajz/e2UAQmmftQqiWrvuDsa1knmlOROGvvaBvqpN
	 +2b5RROPznSuNeEFgL6CiSMwS6FndbuqHMifS2bx6egNtX7FMOaONukVQihSbkgXT3
	 KyUV8J7lylA+JV3qCTzARcLcThNe0r8FFdJ3HIQlcucYV17LRFWeCWskyNwH9S1kyE
	 tPndYj+Dzlhap/boYAmt5uvxAwzuiYmdd21EtyKNq6eT6XigOxydQti+tx22ScBvx2
	 7+ZjXq2nSSkqw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org,
	nfraprado@collabora.com
Subject: [PATCH v4 3/9] drm/mediatek: dp: Always return connected status for eDP in .detect()
Date: Thu,  6 Jul 2023 14:30:19 +0200
Message-Id: <20230706123025.208408-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230706123025.208408-1-angelogioacchino.delregno@collabora.com>
References: <20230706123025.208408-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_053034_379989_73594AE1 
X-CRM114-Status: GOOD (  10.05  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

If this is an eDP panel it's not removable, hence it's always connected:
as a shortcut, always return connector_status_connected in the .detect()
callback for eDP connector, avoiding a poweron, a check for sink count
and a poweroff.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 8f7d4af7076f..5b35a2e23896 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1957,6 +1957,9 @@ static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
 	bool enabled = mtk_dp->enabled;
 	u8 sink_count = 0;
 
+	if (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP)
+		return connector_status_connected;
+
 	if (!mtk_dp->train_info.cable_plugged_in)
 		return ret;
 
-- 
2.40.1


