Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB83C5B572
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2026 17:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SF4su2A7LBkgNyuJx7QC3c3F7wOlkzt5ypMNp2gqA1w=; b=VIsI2ZatbEvQUOy9mnE3tPnXRa
	BPAfkvDs+D3iFC5XXT6PX76gC/4+Z5lE6umw0Kxg/ZVQAhJf3nCSSlWJ/LczLDB/iSncM98eInUlt
	KarCaBkbp1PTCyUPbGC3W7Ma4DmK3f1ddQG+EjO9bdHsdyko4v7WPvC0uwUZ4aCZUm4JQicXTEu54
	Qi2U+KsE1skdiR2/50IXAatUT9fzwuqP1oz1Z1aDv2G16+kMoSKfPUspgmS9GNMUUOKNkg1p43X1y
	jKJYiC02BoVLXXvWZZVnmKvji2CrfSiL+ey0vpQiXjUvbwLzsZ93FLS4Qv2DKuoRkVa6KMdSa1TBy
	xw3514mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuZeJ-00000001KsK-09zJ;
	Thu, 13 Aug 2026 17:55:27 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuZeH-00000001Krf-0GHP
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Aug 2026 17:55:26 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2d049069377so2754595ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Aug 2026 10:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786643723; x=1787248523; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SF4su2A7LBkgNyuJx7QC3c3F7wOlkzt5ypMNp2gqA1w=;
        b=KnMExlRNBsqnxa2IQkYCuLToi7Rmk+O3336K0Hj9D3bSLvleb5zQlyLXT2x+jMe06E
         bzAin3HCD3Wq3xdtdCN6goXbThwRiM8EUr3Vq84BCtLJK02qEFoGa1fQ2JUY5b3fe/B1
         7Hv0iDnTzdP40SQbpVs65uLiIiHrvJ5GX+jYUJvw+Akb+ma1JrhCir4k58KlZwYuml6n
         tj3q3FYZNGqzavwQwHwaEy8+whqvtw16YxA/BfShA2kFXrE4meabfShzGW9Gxj44kD77
         MTbw6HK/GZOHIINZJla+fdVgOlXBeJOt7alfMxs1Ft1WIiEOOrfypRWamy7VlUikNGzH
         HHnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786643723; x=1787248523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SF4su2A7LBkgNyuJx7QC3c3F7wOlkzt5ypMNp2gqA1w=;
        b=D5bae+SpTGMp9s/nQg3YWpkN6CzY29W3BbAUWrRWxMRRjSMtw6D+CLJGHocnqOXomM
         HjrbgPRkwjd7p6fbnPz6exC70IPoklGKqXdAywVvZ6bA3ZcX5FqcHJviXZOYIWVAAEkM
         NmZrpvEKuTRPlnwx/DKMTyTtaau+gz5o1fAqrde2OGjWs9v2Tx8rbHtDgJ6Mocz7PIMS
         /suFg7bppeqQG6Y0/4NbaQX9QWuAhWk6q/sUGuc7eGpNmvVDxDJe1sWSaxjrncngSgQy
         IW2T9gkPv364DIqqwH/NVRmrpow0jKPVdHfJuY5ojZYJwBZC5cz2goQWq/CZKdtf8WM2
         xIjQ==
X-Forwarded-Encrypted: i=1; AHgh+RojJgdlnHuroQbLL9guR0Cx56Nh2QAh2JfQIOxYGvwpdr40XJ+jsPw7JcEfR/62i9aK8mQ5fuBbDAYVFrPlgw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQJ2jhyUbbfFyt+jVKz8yeEZl+g335aIpPS0BtV9u6xyC3tbrg
	H87wSVvL/thHuIxEkReCcUKn9iwFTE1WIUzrdELeDDWA1SzSXxQyJ53T
X-Gm-Gg: AR+sD119OuvRWdE3imu0PYqB158AF8bEfCbjQMJonTBx7eGshEnAWmipllk+G3eQAGF
	26jIW7aAI0uluEWx7R9T5SKofYmwYXMZ3K6x8DWYswhRVlgCKYe4r+0HkQx2ImjJAVeAPnfomhQ
	w21GSBZTB3eAgNb841HeAo6PcKnngYmvKn8TDXUiMvz+oZdorrtd0eDGQFCxGC8xlkBG4y7o1Pz
	HWLpR4D+AZllUF/Xd8rEjsrm06k2X7lqQkwTi0az9+HJB2E4imUhHRvDIDvTvLtmbAy4ZY+ELK1
	GLeefSGhollC64OX/hZmy8jDNVX2sKBLUx8eEWdOUVAMR9QLjzfC5RFdZCHD8vFgOdE5AOCWkZR
	jlg0Z+ws0lPERS7uMVihZ1yjjBEqmT1s5tZhpQKpvodEN+RjeyxTOyRxpv44mkwZHSPjUku00u6
	eEoLR/6ZKIqF2TAd+T+f/2bUS4CPC5KeChsEgvEx4sUJpoUZ10xFuLjNCGMtfWwbmS5117fZhHz
	/wtZZZIETZ19kpQhStK51f/zu2T5gtd2HRmvwV1wTkZHFrR3S1xnXn9XNNVeYmO2vLv
X-Received: by 2002:a17:902:c948:b0:2c0:b6c7:227e with SMTP id d9443c01a7336-2d37d52e1d6mr84044455ad.5.1786643723510;
        Thu, 13 Aug 2026 10:55:23 -0700 (PDT)
Received: from LAPTOP-M4N25KQ5.tail73068d.ts.net (1-160-237-124.dynamic-ip.hinet.net. [1.160.237.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3aec05197sm675935ad.81.2026.08.13.10.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 10:55:23 -0700 (PDT)
From: Sean Chang <seanwascoding@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sean Chang <seanwascoding@gmail.com>
Subject: [PATCH v1] drm/mediatek: mtk_dsi: Open-code drm_simple_encoder_init()
Date: Fri, 14 Aug 2026 01:55:17 +0800
Message-ID: <20260813175517.156893-1-seanwascoding@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_105525_108062_1AC8917C 
X-CRM114-Status: GOOD (  10.48  )
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

The drm_simple_encoder_init() helper is deprecated because it adds an
intermediate abstraction layer that only wraps drm_encoder_init() with
an empty or minimal drm_encoder_funcs struct.

Replace drm_simple_encoder_init() with explicit calls to drm_encoder_init()
and define driver-specific drm_encoder_funcs carrying the cleanup callback.

Signed-off-by: Sean Chang <seanwascoding@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 49dfc0f825cb..276d57f8407b 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -226,6 +226,10 @@ struct mtk_dsi {
 	const struct mtk_dsi_driver_data *driver_data;
 };
 
+static const struct drm_encoder_funcs mtk_dsi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static inline struct mtk_dsi *bridge_to_dsi(struct drm_bridge *b)
 {
 	return container_of(b, struct mtk_dsi, bridge);
@@ -918,8 +922,9 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 {
 	int ret;
 
-	ret = drm_simple_encoder_init(drm, &dsi->encoder,
-				      DRM_MODE_ENCODER_DSI);
+	ret = drm_encoder_init(drm, &dsi->encoder,
+			       &mtk_dsi_encoder_funcs,
+			       DRM_MODE_ENCODER_DSI, NULL);
 	if (ret) {
 		drm_err(drm, "Failed to encoder init to drm\n");
 		return ret;
-- 
2.43.0


