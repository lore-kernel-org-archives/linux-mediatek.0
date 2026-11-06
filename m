Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08B1606A331
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2026 10:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UTGEAgyv;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WEBPeHl2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=0jFx9X9ijYmEuuqlS+6ReLoSBlbDgO7KnvPAxuJX2v0=; b=UTGEAgyvd7WXsKxF8p2Sq0OAMp
	rdkfbeAlUibwPajVJItQPRQsWO6FVjn4+3yLlX/sypKueNi9oPGlAHeCWzQh0diAb+Myr5yKkZ/D4
	EN8eqmuaggKJ4JZyTIJAIPuJrLjXUSv8osogCN1baZRLzv8CWa3rDNJOwqv/N+a99lwuK8NAiB1xl
	+Kd2TwZhH0iE1CDfc9zqAp3qxfj5pTiqsm6Y5achrYRohUlj88z61md3+y5NB/6/9oT0m8tuKDAeZ
	CajRL1bJskCpl27W/dvI8mrboA1gGt3YaexfAE/sYuON2yd4eh/4N4w0/0UZLLi1XoIZFwWxcfNQ1
	vvQ1TQmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHMN-0000000ByT7-2p8z;
	Fri, 06 Nov 2026 10:39:51 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHMJ-0000000ByRj-2eZ7
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Nov 2026 10:39:50 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-1a8cc11ac42so475533c88.0
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Nov 2026 02:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793961586; x=1794566386; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0jFx9X9ijYmEuuqlS+6ReLoSBlbDgO7KnvPAxuJX2v0=;
        b=WEBPeHl2clFAhV3FvhFyJjIgaRfIsP20aIGOwMyxhVBg2m6jMvKt4T+RHWXT7HH7zF
         PjjsET6qsXmmAsYqri+Xmm4m2OYUcbxb7G4Fe21Y1lbRyui366xz/PaAp3VOfBkz83GC
         BmaryIL2nsGQ5+WlpMPjG2CBFGb9adrMyWTfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793961586; x=1794566386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0jFx9X9ijYmEuuqlS+6ReLoSBlbDgO7KnvPAxuJX2v0=;
        b=BA/8V1PTcp2lV9xFjHzBLDjQyKhv9IgO8+rVyIIAE+aSlIlI+8cZwJzgeH3UnVgga7
         reys7i7CkkHR8nET8kef4gxdM56ugdRmvpVffcJmMoJfDkzLQ6xhD8NFmS5qETOE0+xD
         WVWoXZ/htYTEEGb8rGVmKdKKTtjfsvm7XUEY49pSn3Ay/7Uo/5iZASRZ3rfAgrg+xDIv
         07brEb2id/bzcqs4nZuFZUrSEfUTMhNGtI2tTX/dDf/IS18Xmb2mg2vOqe6fCDYGa09c
         /5DNAt89h8Q9oRJAFMf4/ClL4xqFAYT1H8VO/x1rcF0/3CbNzBleqFBDZlEJUanGdGgs
         RNcQ==
X-Forwarded-Encrypted: i=1; AKwUvBx46R5801U/mOhy8ieMt+cLRCB5fVk5PCCRdNCKSKfuOPVOAuZi+5b9mZmt68cADqtnes8XKbcBCeZm+MwUSw==@lists.infradead.org
X-Gm-Message-State: APuU4Z87+a0p0d3HrSXBXKxdObvW1DQQm0d+n/+bIQSG9OJ5sB8iSvWg
	UlLdJYNtoDSNQUvwsZmv18CcqaTBvppzpZoOHyPSSbwrCqPxAt0EGDF++flcUEM2/g==
X-Gm-Gg: AYBFou08ICWQ6iktECFtf9ttmKXBr9YqF8II+ybDjpAvepwXuNED7ctawf/6oQNEtfF
	Ki9q8HzPh/bROH4RtU4SmD0bhkV8OIVgQfSg4lBDKkE9PolqzBFKT2lHzCnD3kEaT/+3KaesCD8
	BTQEFGMC1bKSpcjpy9/7Aq+bkMxrZyAS3IjhHf2ZT5Pr5hzJmeKnnZnV8pny8l7PpqyqxtuYt9k
	mx3IavIOqnEnyjSaWjZTwu0dI0BAZNiDVG33XfGa4KH1VmmpOQ/6EIVYJg7IhjX8L17xP9Vt0tc
	eovFGsWmomHMXnAesYcOTJypdoLvs6xGIe4wg6xPFrsOpGqs2sSrvFXUXbajfzZfXTQojv3AbKN
	12ERTtLGDt00Y90v4gVLucHGQ3dXhQYXdEPgt6U1JdVQ/eGaAGT6xRHLdAJGjlJCZLMJg1QvlnE
	4i5mdDXvxYulYkbVpCKdVp0Ag4xiIWg/ZqmT8yzNX1GVRwdoTOoyM1BahnqaJR569tNxbIpDHJq
	sjo5sLci6/Y88vj8EBwlN0YE4rLvK2Z3qlPlSkNGz1zxVvnkrt5wBoMxr6v38+/Cb+hz7J1RH8v
	EijYDG63qaF4fnB+aGGAv2qfVYtFvT/pMGun4gNz9Ry/SwyqTW3vBGM6iHKXLGBc3NCjUX3DbqM
	h/u3XCLDD0Qs8OCws
X-Received: by 2002:a05:7022:fc0b:b0:16a:c6f2:60c2 with SMTP id a92af1059eb24-1b25d315d2emr2054258c88.12.1793961586179;
        Fri, 06 Nov 2026 02:39:46 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com.com (61.14.81.34.bc.googleusercontent.com. [34.81.14.61])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4c1df6sm5133779c88.14.2026.11.06.02.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 02:39:45 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2] drm/mediatek: Validate gamma_lut size
Date: Fri,  6 Nov 2026 18:39:05 +0800
Message-ID: <20261106103932.1219696-1-fshao@chromium.org>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_023947_701559_7A1E549E 
X-CRM114-Status: GOOD (  11.33  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The DRM core checks that a gamma_lut blob is aligned to
sizeof(struct drm_color_lut) and at most GAMMA_LUT_SIZE entries, so
shorter blobs still reach the driver. mtk_aal_gamma_set() and
mtk_gamma_set() read up to the fixed hardware LUT size, which is an OOB
read when the blob is shorter.

Add mtk_crtc_atomic_check() and reject gamma_lut if its entry count does
not match crtc->gamma_size.

Fixes: 2f3f4dda747c ("drm/mediatek: Add gamma correction.")
Signed-off-by: Fei Shao <fshao@chromium.org>
---

Changes in v2:
- Use drm_color_lut_size() and check against crtc->gamma_size, which
  mtk_crtc_create() already sets for the pipeline. This drops the
  ddp_comp[] loop and avoids the NULL conn_routes slot before enable.
- Move mtk_crtc_atomic_check() before mtk_crtc_atomic_begin() so the
  patch applies cleanly both to linux-next (next-20261104) and on top of
  the mediatek-drm restructuring series.
  https://lore.kernel.org/r/20260714114414.184512-1-angelogioacchino.delregno@collabora.com

 drivers/gpu/drm/mediatek/mtk_crtc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 2920f3198ef6..67c2288ab8e0 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -841,6 +841,17 @@ static void mtk_crtc_atomic_disable(struct drm_crtc *crtc,
 	mtk_crtc->enabled = false;
 }
 
+static int mtk_crtc_atomic_check(struct drm_crtc *crtc, struct drm_atomic_commit *state)
+{
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	struct drm_property_blob *gamma_lut = crtc_state->gamma_lut;
+
+	if (gamma_lut && drm_color_lut_size(gamma_lut) != crtc->gamma_size)
+		return -EINVAL;
+
+	return 0;
+}
+
 static void mtk_crtc_atomic_begin(struct drm_crtc *crtc,
 				  struct drm_atomic_commit *state)
 {
@@ -895,6 +906,7 @@ static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
 	.mode_fixup	= mtk_crtc_mode_fixup,
 	.mode_set_nofb	= mtk_crtc_mode_set_nofb,
 	.mode_valid	= mtk_crtc_mode_valid,
+	.atomic_check	= mtk_crtc_atomic_check,
 	.atomic_begin	= mtk_crtc_atomic_begin,
 	.atomic_flush	= mtk_crtc_atomic_flush,
 	.atomic_enable	= mtk_crtc_atomic_enable,
-- 
2.56.0.455.g6c5a503b38-goog


