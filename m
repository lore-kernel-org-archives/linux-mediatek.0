Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A2161061B28
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2026 00:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x6KkVZ6avnq5JZYkKR1K26BH30WGfxU6tLWicybER9M=; b=eiCgKbbB1ZNQw31XAfBJtjVQY0
	8g+DU0a0J5MU7ISpYDMH6cch73wRx6C0R8rbLa8XV1gbcfgfH1+C0rzzw0DvAFBSp992Q3qcjfX1L
	jdRe1ZX0c2xBziy26cHVZQYjh92+SFTcnHXv3Flmg5HRJsL2ChzK3+O1CsJrGzvJ0bAlsH/cC3Njc
	J4bTa34Roc+DfYI+0gLm10q1skYJ+/jTjgr3Uwx+e5auKfxCmVOwvCK2Q7MaXc8tj0J7+ADJzXwk+
	RhS70CrHuXi6im52e07M0p5UBEMVbwOdddsNo+VUQ86exvZ3gzgnhL9SB+7O/Z3HKXUVDbix9KmsQ
	puDJvjuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Mu3-0000000C3wm-2SM2;
	Tue, 31 Mar 2026 00:24:19 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Mu0-0000000C3w2-1U22
	for linux-mediatek@lists.infradead.org;
	Tue, 31 Mar 2026 00:24:18 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-1271195d2a7so2295172c88.0
        for <linux-mediatek@lists.infradead.org>; Mon, 30 Mar 2026 17:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774916655; x=1775521455; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x6KkVZ6avnq5JZYkKR1K26BH30WGfxU6tLWicybER9M=;
        b=eOW7/xcDMiK33IuA3bnA7CLw8DBesx4x6LIuVCMrRnXb1vV7DUv6+bt80aJIOQ7ROr
         RrOiGtkG1RvH8vfyXi6rNzxwXb1IJgoJFBUUG1kyfGMDa7BnfsBfUXozaoQn58FsFZ6J
         DbZg0wv020b9QNwBEh5gnF8BNMIC3jefYXMXv/BuVTpX9ubyHNjqmv9EjPxHPZPqb/7/
         iWrRlPmpTc7Swd5U+XDgWQqtZGWsehQb3J1OmYiVCCyNDT0vEcgQNtL5jvvJSDbDHGX6
         gs9LreVf5ZjEStmncLjrgO4/CIv2wMvAFyO+jBpKe4iSChkzuZ9IEPvVLTGxKYMweo0j
         tr1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774916655; x=1775521455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6KkVZ6avnq5JZYkKR1K26BH30WGfxU6tLWicybER9M=;
        b=sukKt+tXe0Kw2WLNERquUqjLk/3PejFhGddehm00sT5G2xryYXtwf1XSsbDS0MOaJd
         RtKKGNt2/xfKRwy9mavjVZzdenEt8BTVO+njPllQeyX8zYfilWa62EurZrD7AVxDQRWV
         zBgah0fl+/C2z489xPmAExvUaOXoT914BQsaZt3nFG/4xQXE0b0T2pzEjR5aLbnmF81q
         Z1fHN6F6NPTpYLui7a5WYlyu7P5mbDRJ+ghhQ7RNjGI7MFygvCkiAwsrY2jU2O+3ai46
         wpo70FdFrJwDd9yv6vF7skG185cMH5gn55KS1I0GEs15j8+2OX0WoesK7/wmT5ji2LQ4
         E/ug==
X-Forwarded-Encrypted: i=1; AJvYcCW16TUOBpdeeyqByrnSMKJ+u3ohGZSQPevTmccmdxg9BSa0znbr2sBTVgi2NT2qoJHTJhy1UdRsFvyvUQ5DnA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPWD4qvVK+7Wz7sdGNH5VFnu6njpxpUaSe5svcoPB8iiAekFTV
	aO+FW6d5hIXVv9SyXyS0uwq42r1T8BSEmQ350+6GFLwdduIoybocOc94
X-Gm-Gg: ATEYQzyky7NcI4XpAy1BEBCGuS11wKukMOr1k+sAwCz7IHFt7FRceZHI6xstaCuxz2o
	OfhjWAU1p9naZEFgAAz5eSN01JrfR8A2Hlp0OMBxxt5tdCi3736RXi3SdMj9i4PAEHNMCrlGMda
	Nh8JuNZ56cF29vHKId+SJ4pYeiaBOXROQHydbSxF4n2nIKfovFtq7VD4mGsxfSAN07ICdrBHJjh
	TtrLMdRnGrG6RSHkKdqvhKzMWSaJWhb8nHOFtVlbbmof+/0znAAfhiUJKw/ibo0BWRVYrbWTvp4
	3PVhoEkkQrIINwYRR8IiysIdv7WiDrfVghZIOAYpzj2H5IKhVWuA7o2SPPqAhB4l1hCy56C4POX
	+GeYu1I4Cn9QPRDLeG2JuX8GiBVeywy2h21gzqep1C6iPaaJAJxeBQoE7cEebMWY5EoMvPNz1uq
	ki9r6rojklgMp13NLRm+fPYhY9RmhkNuHeumbYopfkIblaLvbKp3hPL8w=
X-Received: by 2002:a05:7022:2221:b0:128:d2a5:709c with SMTP id a92af1059eb24-12ab28f3331mr8407522c88.33.1774916655278;
        Mon, 30 Mar 2026 17:24:15 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab983f9f3sm13195709c88.10.2026.03.30.17.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 17:24:14 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org (moderated list:DRM DRIVERS FOR MEDIATEK),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] drm/mediatek: simplify mtk_crtc allocation
Date: Mon, 30 Mar 2026 17:23:57 -0700
Message-ID: <20260331002357.7995-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_172416_949480_7678E0EF 
X-CRM114-Status: GOOD (  10.29  )
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

Use a flexible array member to combine allocations.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index fcb16f3f7b23..914841d2396e 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -62,7 +62,6 @@ struct mtk_crtc {
 	struct device			*dma_dev;
 	struct mtk_mutex		*mutex;
 	unsigned int			ddp_comp_nr;
-	struct mtk_ddp_comp		**ddp_comp;
 	unsigned int			num_conn_routes;
 	const struct mtk_drm_route	*conn_routes;
 
@@ -71,6 +70,8 @@ struct mtk_crtc {
 	bool				config_updating;
 	/* lock for config_updating to cmd buffer */
 	spinlock_t			config_lock;
+
+	struct mtk_ddp_comp		*ddp_comp[];
 };
 
 struct mtk_crtc_state {
@@ -1048,18 +1049,12 @@ int mtk_crtc_create(struct drm_device *drm_dev, const unsigned int *path,
 		}
 	}
 
-	mtk_crtc = devm_kzalloc(dev, sizeof(*mtk_crtc), GFP_KERNEL);
+	mtk_crtc = devm_kzalloc(dev, struct_size(mtk_crtc, ddp_comp, path_len + (conn_routes ? 1 : 0)), GFP_KERNEL);
 	if (!mtk_crtc)
 		return -ENOMEM;
 
-	mtk_crtc->mmsys_dev = priv->mmsys_dev;
 	mtk_crtc->ddp_comp_nr = path_len;
-	mtk_crtc->ddp_comp = devm_kcalloc(dev,
-					  mtk_crtc->ddp_comp_nr + (conn_routes ? 1 : 0),
-					  sizeof(*mtk_crtc->ddp_comp),
-					  GFP_KERNEL);
-	if (!mtk_crtc->ddp_comp)
-		return -ENOMEM;
+	mtk_crtc->mmsys_dev = priv->mmsys_dev;
 
 	mtk_crtc->mutex = mtk_mutex_get(priv->mutex_dev);
 	if (IS_ERR(mtk_crtc->mutex)) {
-- 
2.53.0


