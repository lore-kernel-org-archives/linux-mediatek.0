Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA13F606A328
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2026 09:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OBebFhvj;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=d6BnUz4G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ZRGJdN+0ZU0Q+8Po4r5uRyGAvRT/GQRrEp1MKzJo7zw=; b=OBebFhvjayN58PUPslL1IMaXXR
	hTR/PVK3NoiSDn6+EKtPZGSV6gMA/7rdujcgT1tdaKQe2BVBKas5/oEQkN7UxWkgniWUWYyZ5C7/S
	PKJ7CMlc+ZiM5UnOxXqkP0W7yeU8+g3uk0Khy2Dny04/eYH43zJvNlp+1v/x3rnlfGf8eJVeAY8M/
	9ZwrkOjDZRWVhM2ZOtq3xZgRG20Qaqu/M+bOMM8DRWTWKHZtVa/0xafefwP3rUevyPCIL/MfwSqij
	iN6vNKaPUcYbjVuigj900DWAZ3Ci32NnIlg02AR3/kbWuXsIt+pBrRQwxDAYwEdOuyWOaNdqjCEZS
	3sEUtGbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtVH-00000008G1n-0Ntl;
	Thu, 05 Nov 2026 09:11:27 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtVD-00000008G08-3GIj
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Nov 2026 09:11:25 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-1a2761c69fbso873459c88.0
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Nov 2026 01:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793869882; x=1794474682; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZRGJdN+0ZU0Q+8Po4r5uRyGAvRT/GQRrEp1MKzJo7zw=;
        b=d6BnUz4GSoDzvKXFi3nJABLaY5E0bzbh0oi80FT3ykuNyXDw7N2aCwLJ0ywZG2NLvC
         E66l/GtMaFHqdMHwnR3AY0ku7nAxxn8DBw7RbJs5uR1JYvDawM52G+ML11cw019p35N/
         9rPZ+TUD69ZRVWHkm23d8XqXAzGvydzjx3wvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793869882; x=1794474682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZRGJdN+0ZU0Q+8Po4r5uRyGAvRT/GQRrEp1MKzJo7zw=;
        b=uGEHzhp40iQZZ+AsB6DcIUPpXouO2S88js1wv/60fjL9KlQFWRy3SwDdvowMZmMhQ0
         VPg9X/UciGORkPJYEZyjWhy3P5S9WQDmCsaDm/moO0+TJh8CggAgnd5pSfSEGWjXTjpO
         qJtwbdyxHNKmeFMaIBEoGTG1YpUckEckPfbql2DoKX/Zcow7jKdIRJeAbmLOkLfX6rQ6
         xe9G+A+OWLTsZxMy8sQQ8SnwQD/YlgoeMzMTRaSXPsYzMMLjs1CeykjsGsxaxYypBQEQ
         Eh6HjBzDorMmg86Cyk8f8brS0XxbQ/LpRJtcDa6xX8P8dWJpAuip3mfgfubCd7E0qMCZ
         ucuQ==
X-Forwarded-Encrypted: i=1; AKwUvBymmwfHLG5cFXkCJdhaYwjZyD7krft+53BaTwRT2j/vach7fjgnPH79ZvGw76CdwZdH5sJfNy8Y+tWiebKkrA==@lists.infradead.org
X-Gm-Message-State: APuU4Z89UOXbZiy/4azZXtJWZ0XMhHR7z1bjqFSMgVqaHS+caQ732XI1
	6q2cMAaxMKMpOM5Pi7BXAVfTm2j9j/kkyoqFcLjYhecBk6S9Fc0DigrttsGl0o1joQ==
X-Gm-Gg: AYBFou1eesIm1L1wXeNQdsAldDCDiuoC+csG7q+ds3M0vAzmVIgRUDLSDEgVsVKt4//
	fvGn1r17ZiGFEuu1gHxo0FdE5gShnMnMgGNN+pUf1wmJr8mPgYDODsvrYdC4Vanf3STPqTXdkPD
	pVVBX1z5tKwmGD+aY1kIQxuiSoapvuw2XKwiEgoleivt7vfY+U/Ai0oL0FHcACF1ixmDP0/E4b+
	SWfsZ0yHSxew7496VeNgraHVeN3rzVi3subN6OQZZ374eIYmgGRMVHyAfhTYqE9QrCCQBwMPz9R
	gTbScTNe2OqU0VxGVtlcA3H/UGkYrXS+18q7O0qGSk2far3r1P/Qixil1QtzLoQVRjnDFGV8K/B
	xdZzPcI+SguCrRsJXt92+dT8518gciLfpCjdKSr7dbFC+g2ABtBUq4mjmJbF96KsYtX8IqmCYxa
	8qzCibAlcJ08WQ2+h076JksdYSRblZrVADAaGOjNVIQrMYgu1uUmLWHY90afzV3wDamIXVez+PP
	KR756J2rffqEojzYky4S2eu+Qe6Ww87vHtV4T6eWaxXy1yDMEI3CANeUhDTe83kVZXd8xU5F8Pw
	+40wwLWhJy+1tCo08bZ1o9sOX5am3ax7ZK1fLGZ9BSyudAfbf337bJNOrkkJohgeFRibYaJSMK9
	IXpqbR1m9Fye4AdWV29GVizX5QhU+1857CIZNeQ==
X-Received: by 2002:a05:7022:eb42:20b0:186:4a57:94e5 with SMTP id a92af1059eb24-1ac5c272744mr29105381c88.34.1793869881711;
        Thu, 05 Nov 2026 01:11:21 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com.com (61.14.81.34.bc.googleusercontent.com. [34.81.14.61])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b8eb3sm20117002eec.27.2026.11.05.01.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 01:11:21 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] drm/mediatek: Validate gamma_lut size
Date: Thu,  5 Nov 2026 17:10:43 +0800
Message-ID: <20261105091054.3993611-1-fshao@chromium.org>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_011123_847085_BE61BC0E 
X-CRM114-Status: GOOD (  12.46  )
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

The DRM core only checks that a GAMMA_LUT blob size is a multiple of
sizeof(struct drm_color_lut), not that its entry count matches the
hardware LUT size. mtk_gamma_set() and mtk_aal_gamma_set() then read
the blob up to the hardware LUT size, which is an OOB read when the blob
is shorter.

Add mtk_crtc_atomic_check() and reject gamma_lut with invalid length.

Fixes: 2f3f4dda747c ("drm/mediatek: Add gamma correction.")
Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/gpu/drm/mediatek/mtk_crtc.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 2920f3198ef6..fd9b51fd00ea 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -880,6 +880,26 @@ static void mtk_crtc_atomic_flush(struct drm_crtc *crtc,
 	mtk_crtc_update_config(mtk_crtc, !!mtk_crtc->event);
 }
 
+static int mtk_crtc_atomic_check(struct drm_crtc *crtc, struct drm_atomic_commit *state)
+{
+	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	struct drm_property_blob *gamma_lut = crtc_state->gamma_lut;
+	unsigned int lut_size;
+	int i;
+
+	if (!gamma_lut)
+		return 0;
+
+	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
+		lut_size = mtk_ddp_gamma_get_lut_size(mtk_crtc->ddp_comp[i]);
+		if (lut_size && gamma_lut->length != lut_size * sizeof(struct drm_color_lut))
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
 static const struct drm_crtc_funcs mtk_crtc_funcs = {
 	.set_config		= drm_atomic_helper_set_config,
 	.page_flip		= drm_atomic_helper_page_flip,
@@ -899,6 +919,7 @@ static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
 	.atomic_flush	= mtk_crtc_atomic_flush,
 	.atomic_enable	= mtk_crtc_atomic_enable,
 	.atomic_disable	= mtk_crtc_atomic_disable,
+	.atomic_check	= mtk_crtc_atomic_check,
 };
 
 static int mtk_crtc_init(struct drm_device *drm, struct mtk_crtc *mtk_crtc,
-- 
2.56.0.455.g6c5a503b38-goog


