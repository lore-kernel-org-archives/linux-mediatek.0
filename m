Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149EE606A334
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2026 09:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gKQZwnTX;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mLJTDD3H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ggqU2z0JBuwwyOOBFpelvoLoHdUUbWw3FkHf6dtYia8=; b=gKQZwnTXxw8pwM58DmGWwxyGNI
	EJpPYPtxh5K/eaC8tkGLh1WVAMur+lXTHwXB0cehCHPAsTusWhoXB3y+pzJUmewuwcQTwg9wNNB6o
	0+oLn+xxxSvXs/yyeAjvv/Ebuz2JBOEzmK76qXC2Pbj2WAD7yAV/sYj2AGR5iZeaSz1D9vYKlICaO
	2VlTdtC3WQXUhlKD6XHDQatSNFVog0ROgxjEYjsRD45sKI5lnDcRnFf4LxAbWHlk+EncWtksFczwV
	4iJKvX7i+BK3j9r2zdd7vPAW6E1tWokw2F0KU2M+b0y8MsoxcTgs030Nc4zdyQ9gnLWG2CdrqlXKb
	lOASEjvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPG7d-0000000BgPx-1ZR6;
	Fri, 06 Nov 2026 09:20:33 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPG7b-0000000BgP8-05hZ
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Nov 2026 09:20:32 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-36ff9c9da34so360180eec.1
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Nov 2026 01:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793956830; x=1794561630; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ggqU2z0JBuwwyOOBFpelvoLoHdUUbWw3FkHf6dtYia8=;
        b=mLJTDD3H4y+TeUqvZGXDtFf+anfIEvZWWP65fTSnnkPZwBmFrtyamlCK3D3zwLyT22
         C0k6YYqgRQC3+CD9EyV1lAz8huL/ByTceK00Qr9hTyOEYo4NfjstJloDaKFMLXx00wZS
         4FW9JEaKHrvdRMHQRZWaELvf0okkn8FuPUpNtDoxLO/xCsvV9gcTgxi5TvFGyjqI/UR+
         MoVIRu+JeYiwYT6iLTdw4IAIwXXFsOdsFwetI6cEfBGyK3R2GLDncQsj+bbruug3Qld4
         klvucAgB2KBSHwqZMqLUq1UjpbKFXJwVlhqjzXk8ktQ5hgGSCLt36K3wijrEWWojarq4
         0shg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956830; x=1794561630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ggqU2z0JBuwwyOOBFpelvoLoHdUUbWw3FkHf6dtYia8=;
        b=sl3Ug+Qgnq9uC73RrgKXTf7AOc7VUVuOYYgNmWUpFCPZzgpt8rS8WOylsNysMDBtBk
         UiIt0yU5JHf1WHz0DJxTdSCe/5HOKyZKloAqVIt5j1Xqb7vgCKx+w0ddc+/d1ZRMPAXl
         nTTSKXYCqPszuUE38NcrfnY4fNT6JQvv/R1aB4P8sHvWBnWu6SYjopEhW4iK6m/+2/ZX
         pFDQ4AjQlGHy7zHEGtQKtNmGZGZV//Y6jU77qIUFi0I388z9XcraFWPsCgpndgfO1bhk
         rzOyN5sxX86gqW8jbpBupIHeUj442Y+vXuVliAmkuT9mLXCoqccRsMSX2xqNB+MTluvc
         Zmsg==
X-Forwarded-Encrypted: i=1; AKwUvBxC5nF6VDvKiKdFj59u99BBAYd48eKMp71Z9PzsrhvgppTZsgrujdcdhPCX4O7O3P+OW55qqdjVhbBh8uMy/g==@lists.infradead.org
X-Gm-Message-State: APuU4Z+AtJTGoMudzOgUH/1YtS+HhZbn5I48wL2jpyp6GxRidMzS6BKK
	lTe5Oo+ULg0lSzvs2HxywhDOY6rLGWtaWRYXPa/A3xM4v4Lr5YYqTM8=
X-Gm-Gg: AYBFou1t+ZPPk0uUHPJ9NiIHtkie+VFm6ysU8ofn/s6k7JlpXchlmrAEshJpKQm1xhp
	N7YUiI6/tqqTJEqK71mPffO2jlW3y2ULiwt12dmby1ezyRGqn2XKAsmuLTgEjSKNc0d10VCaSj7
	C4BtENS7Dv+6hhb2anizcaJetGIgDXINVt9uM7j8Du/bzaaqWoXBdqoQbm/uz0njF9mKzzsLb0H
	k2LxZ4nONKsrHWMVCc0sKBabBezWLXpg92feWTb/ky0FSDtK+M+En6wn2DWBMAU4NTGUs6gejcy
	l8Z6pXo/y0VMLjZzZ+p3eyRQtx7mqPSmfbsLMhgtC7EFRc2NXL4mR1VxkWxos9kdujiFcaB/acX
	bOmct4+UgfCP3fGOf6xcEA8wFkGQjWCcAfDwhIkylSiilY4szJZTB/j/1K7AIDwSA+IC/knnGXo
	/C1bmyZoeUJAUUI+JCHYB6+bdPbJ4tKE9iBHyNnx8xCn3R1Qkk8ENdxVuszcHiTOO6yqsYICXIE
	fD0OX/W5InLZraAGPeRdRgrHcrD1yL0Rs5k9D475igjo+IHaPorDcboP9ISb15PgGekm0YC9gXO
	q9mkeBTcTjYUMyvxUSudemwjWzutim2XH2dE4GPSPCTYm45k4TbcAO2P
X-Received: by 2002:a05:701b:4507:20b0:1b0:f0f5:e38f with SMTP id a92af1059eb24-1b25d346c12mr2313612c88.34.1793956829858;
        Fri, 06 Nov 2026 01:20:29 -0800 (PST)
Received: from localhost.localdomain ([155.69.103.70])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a610fsm3783796c88.11.2026.11.06.01.20.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 01:20:29 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH] drm/mediatek: Keep the mutex node reference across deferred binds
Date: Fri,  6 Nov 2026 17:20:23 +0800
Message-ID: <confirmed-20261105-38-2e09963f1b23@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_012031_054152_36569871 
X-CRM114-Status: GOOD (  11.09  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mtk_drm_probe() acquires private->mutex_node and releases that reference
on probe failure or in mtk_drm_remove(). The component bind callback does
not acquire another reference, so it must not put the node when the mutex
platform device is not available.

If this bind failure propagates through component_master_add_with_match(),
the probe error path puts the same reference again. A bind attempted after
probe has returned can also leave the stored node without its reference
for a later bind or remove.

Remove the bind-time put and leave the node reference with its probe/remove
owner.

Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
Cc: stable@vger.kernel.org
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
AI assistance was used for analysis and patch preparation.

Based on next-20261104 (8b7179210b22).
Compile-tested: arm64, GCC 14.2.0, W=1, drivers/gpu/drm/mediatek/mtk_drm_drv.o;
baseline and patched objects built with no warnings.
Static source review; no hardware, boot, or KASAN test was performed.

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index dc8e3e917dd771b950167d04c1ab87c14dbabf72..64c912ba95899128bfb1a41765579d9d70979a27 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -630,7 +630,6 @@ static int mtk_drm_bind(struct device *dev)
 	if (!pdev) {
 		dev_err(dev, "Waiting for disp-mutex device %pOF\n",
 			private->mutex_node);
-		of_node_put(private->mutex_node);
 		return -EPROBE_DEFER;
 	}

base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4

