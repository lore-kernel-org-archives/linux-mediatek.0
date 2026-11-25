Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC31606A31E
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 20:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wl8u6jjW;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0D/WEpKL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GyPhjArj1GTlQH9QXFfb0KZ+rjDTIHoFzQ0QuyYeR+o=; b=wl8u6jjWU4JyOj
	jqGOtcsXPa3ZNc5LM4BtR28sFhcuGU5ug6Oeu5fyCdG34Aq9ovLFigUJ8np1h1KQvbB3EsXDoJdJJ
	9NbEQmADWRce9DZ2ODL06pS9OH7u/2+Txc/FempYqV6jwjk6YaUlgGpLe2so1X2lzJ+MypPHyLUJD
	q7ooR5XfwXBTDF47Aj8ZHgeDXu+mqAz3sSl+O6KEwZtLpFg8emNcrCqLOsIx0sJXPHSy641DPeNnC
	CkRMtjfQGCM9EUQA0o1dZxYNKOAaJkBGSCrXJZQcjJKGxhDMoV4h2mBF/Uf23dqDq+AGNPZjGgJ9e
	WTsTe/c77PN6xeelJqrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJQH-0000000BFBF-3Eig;
	Wed, 25 Nov 2026 20:16:58 +0000
Received: from mail-oo2-x0a.google.com ([2607:f8b0:4864:31::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJPf-0000000BEpe-3eVt
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Nov 2026 20:16:21 +0000
Received: by mail-oo2-x0a.google.com with SMTP id 006d021491bc7-716d85c01f6so2191077eaf.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 12:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795637779; x=1796242579; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GyPhjArj1GTlQH9QXFfb0KZ+rjDTIHoFzQ0QuyYeR+o=;
        b=0D/WEpKL7OPt1iiRnzykvpIlEmGpqeN2jDG//imzT0ilQu1z6MdFoZrlTR+xqjACR4
         9durT86n60PHSOygckbOQ8r8OqEtgi7e+0AM821SHjWg2jCP1ZpGBdjn0bYDlGD36dsC
         5vNounwqu7a0tbsw+AFfacC/uLG5Lv4PbKI1mWZCc4oSHYT+BzFSarBA9Rh/7a5mQiDI
         2rcpYCu4pGUPsgyS5vt/0XubPimHOwWxN84runVAekgMGe/m62w3npT4YGGuSIsrO0Ks
         xfUEQ4pEtT/4I4jDDvJV0F3E/3/iAk+uugz54m6V0WklL309Mzsz1e8rE2CJfLhKjKuW
         lZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795637779; x=1796242579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GyPhjArj1GTlQH9QXFfb0KZ+rjDTIHoFzQ0QuyYeR+o=;
        b=yvjnHfd5DrIaTxPVgVx9uJX9kV29/cy5ouHb2ztbJcGDDNCJTLKjAwpAeRFbHhWuno
         BJrRkCInA5LO9J4IQ6vU3wi3ZGkAKeXOFn84w+Y+j+y5hi04DYhYanFAwYcv6YrPZxXF
         kWNdUZbzE1bSn50QDqpr7NNuMVKMpYmQQW+JUvaDFgYPEuaBF49AF6dsG/CiNpm8RUPs
         evEj3dw+HA3EQdhbp5zgjtW9gmptgvf4M6Sf6UNcwOiynNGKwjlb9RDBpsOvklE9j3Kb
         D9gboV6mIlyR6k/1avH/qYfdTG8CoEdDql8Tj6eIMviMbCkSwL6l/k/U4RoxsSB2rnhm
         zJnw==
X-Forwarded-Encrypted: i=1; AL+hErFEhBbyppARADtFfJSi4IY3j8G3LNhyhK8IAr6V32PmYqwQGrGjHYQpQs6bbNbjruy3zoSUKoZVLNQTxrfRNw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8a42qP3bx8i/KyN7Y8Ij1mTRwnh9tb1CiO2EoEPeUt08jI2job
	dvVwJfWrgltZwfgnEkFM1rXLScDZtzEoMTnvyh6UkUVaOAfHfZiiUMDU
X-Gm-Gg: AZFdTZfXAfTnkBZ7Fd9b9UL7BTKaGKJk/sUmGDTTFMfd0Ywtea1z9RJvQtzeNRyLTig
	egejOgU+B5FcG5WTV+xn3OLqZTlqhZLkbycLZV3UXqUQKi7wWFmFqrJPEOX0Uib5P+X+c28FBFg
	AKbsETzg+HfYWbgbrW8qpYLXTWQ3siIKv+oeOXmgvNqac1N2OtBfgw7eouZFM2zskkwdPAi/w6o
	IFjH8i3ELjtHSsX6pGlHF6A7GzUqrQI5jznhuuehTh0tlV5xdEkLGfmRIUJozgvIqe7Q7GnwOCn
	ISUc34/TNM01ZR7w3PRXU9kY9LnAsJFR7JRrFwuyfA2C2Fuk/FAN3Ep96to+VZ+KUpNgB9NusSY
	BcDYftybXEINveRkgDY44I212Mj3o8rMudCz81TKXkuehTAKgQsDvUaEn0EcWAiIjm+Sz/UF58u
	qhZzJ5dFTBnShmgBSYBTFjQEFwgAtIGl1tApBgpAwEO+ZPDpBlVVMCVRApXdB/608oyMwG0c+sZ
	navmtKB1Vnlz12sIjisiceQbGpGrNwzQJHSNX2bPwDvnWCYRdv329ICGzA57+kHU6chzTbfYRIS
	bXt3XkwYo4ycj4A6gGLMbQwpJrr1qktv7oQ=
X-Received: by 2002:a05:6820:f028:b0:71b:85a5:c19e with SMTP id 006d021491bc7-71b85a5cb82mr1092887eaf.38.1795637778946;
        Wed, 25 Nov 2026 12:16:18 -0800 (PST)
Received: from [192.168.0.98] ([50.26.120.197])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm11341859eaf.10.2026.11.25.12.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:16:17 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 25 Nov 2026 14:16:08 -0600
Subject: [PATCH v2 5/9] media: mtk-mdp: Do not refuse a crop for the other
 side's size
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-5-fdc047cf75a5@gmail.com>
References: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-0-fdc047cf75a5@gmail.com>
In-Reply-To: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-0-fdc047cf75a5@gmail.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Eizan Miyamoto <eizan@chromium.org>, 
 Francois Buergisser <fbuergisser@chromium.org>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Youngjoon Lee <getfeus@gmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Ryan Brue <ryanbrue.dev@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795637766; l=6625;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=XOuHOSCr36tTQQTtaJ/3AJtVCp6ht5DQgA+DZFALOF4=;
 b=oaY2l5fays5eGSgaftJoWFoJ4IlX4oBaWoCZfHIUCCGgMM7EJzAGJOd6x8CAiH2/wyYOR+0aW
 LXre/yGAFy6BcP+ZV8WACa1tQ3KIGheFu71qB+Cz89/035gbPYmetph
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_121620_009581_B4BA43AB 
X-CRM114-Status: GOOD (  18.93  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Setting the source crop checks the scaling ratio against the destination
as it stands: the 32x32 default that open() sets, or whatever a client
set while probing. GStreamer sets the source format and crop first, and
a 1280x720 crop was refused with -EINVAL against that 32x32 destination.
The same holds for the compose rectangle and the source, and for the
rotation control.

Check the ratio once both queues are streaming, when both sizes are
settled: at VIDIOC_STREAMON, and for a crop, compose or rotation change
made while streaming. VIDIOC_STREAMON is the first point where both
sizes are known: before it a client may still set either side in any
order, and checking there leaves the queues untouched on refusal. Log a
refusal at debug level, since any client can trigger it.

Fixes: 0d1e342a17f5 ("media: mtk-mdp: Remove states for format checks")
Cc: stable@vger.kernel.org
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c | 121 +++++++++++++---------
 1 file changed, 73 insertions(+), 48 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
index 34d02de4453d..a40bcf61b7ca 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
@@ -727,10 +727,40 @@ static int mtk_mdp_m2m_reqbufs(struct file *file, void *fh,
 	return v4l2_m2m_reqbufs(file, ctx->m2m_ctx, reqbufs);
 }
 
+static int mtk_mdp_check_scaler_ratio(struct mtk_mdp_variant *var, int src_w,
+				      int src_h, int dst_w, int dst_h, int rot)
+{
+	int tmp_w, tmp_h;
+
+	if (rot == 90 || rot == 270) {
+		tmp_w = dst_h;
+		tmp_h = dst_w;
+	} else {
+		tmp_w = dst_w;
+		tmp_h = dst_h;
+	}
+
+	if ((src_w / tmp_w) > var->h_scale_down_max ||
+	    (src_h / tmp_h) > var->v_scale_down_max ||
+	    (tmp_w / src_w) > var->h_scale_up_max ||
+	    (tmp_h / src_h) > var->v_scale_up_max)
+		return -EINVAL;
+
+	return 0;
+}
+
+/* Both sizes are settled once both queues are streaming */
+static bool mtk_mdp_ctx_streaming(struct mtk_mdp_ctx *ctx)
+{
+	return vb2_is_streaming(v4l2_m2m_get_src_vq(ctx->m2m_ctx)) &&
+	       vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->m2m_ctx));
+}
+
 static int mtk_mdp_m2m_streamon(struct file *file, void *fh,
 				enum v4l2_buf_type type)
 {
 	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
+	struct vb2_queue *other;
 	int ret;
 
 	if (!mtk_mdp_ctx_state_is_set(ctx, MTK_MDP_VPU_INIT)) {
@@ -744,6 +774,21 @@ static int mtk_mdp_m2m_streamon(struct file *file, void *fh,
 		mtk_mdp_ctx_state_lock_set(ctx, MTK_MDP_VPU_INIT);
 	}
 
+	/* the queue that starts second checks the ratio */
+	other = v4l2_m2m_get_vq(ctx->m2m_ctx, V4L2_TYPE_IS_OUTPUT(type) ?
+				V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE :
+				V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	if (vb2_is_streaming(other) &&
+	    mtk_mdp_check_scaler_ratio(ctx->mdp_dev->variant,
+				       ctx->s_frame.crop.width,
+				       ctx->s_frame.crop.height,
+				       ctx->d_frame.crop.width,
+				       ctx->d_frame.crop.height,
+				       ctx->ctrls.rotate->val)) {
+		dev_dbg(&ctx->mdp_dev->pdev->dev, "Out of scaler range\n");
+		return -EINVAL;
+	}
+
 	return v4l2_m2m_streamon(file, ctx->m2m_ctx, type);
 }
 
@@ -810,35 +855,12 @@ static int mtk_mdp_m2m_g_selection(struct file *file, void *fh,
 	return -EINVAL;
 }
 
-static int mtk_mdp_check_scaler_ratio(struct mtk_mdp_variant *var, int src_w,
-				      int src_h, int dst_w, int dst_h, int rot)
-{
-	int tmp_w, tmp_h;
-
-	if (rot == 90 || rot == 270) {
-		tmp_w = dst_h;
-		tmp_h = dst_w;
-	} else {
-		tmp_w = dst_w;
-		tmp_h = dst_h;
-	}
-
-	if ((src_w / tmp_w) > var->h_scale_down_max ||
-	    (src_h / tmp_h) > var->v_scale_down_max ||
-	    (tmp_w / src_w) > var->h_scale_up_max ||
-	    (tmp_h / src_h) > var->v_scale_up_max)
-		return -EINVAL;
-
-	return 0;
-}
-
 static int mtk_mdp_m2m_s_selection(struct file *file, void *fh,
 				   struct v4l2_selection *s)
 {
 	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 	struct mtk_mdp_frame *frame;
 	struct v4l2_rect new_r;
-	struct mtk_mdp_variant *variant = ctx->mdp_dev->variant;
 	int ret;
 	bool valid = false;
 
@@ -865,22 +887,27 @@ static int mtk_mdp_m2m_s_selection(struct file *file, void *fh,
 	else
 		frame = &ctx->d_frame;
 
-	/* Check to see if scaling ratio is within supported range */
-	if (V4L2_TYPE_IS_OUTPUT(s->type))
-		ret = mtk_mdp_check_scaler_ratio(variant, new_r.width,
-			new_r.height, ctx->d_frame.crop.width,
-			ctx->d_frame.crop.height,
-			ctx->ctrls.rotate->val);
-	else
-		ret = mtk_mdp_check_scaler_ratio(variant,
-			ctx->s_frame.crop.width,
-			ctx->s_frame.crop.height, new_r.width,
-			new_r.height, ctx->ctrls.rotate->val);
-
-	if (ret) {
-		dev_info(&ctx->mdp_dev->pdev->dev,
-			"Out of scaler range");
-		return -EINVAL;
+	/*
+	 * Until both queues are streaming the other side's size may still
+	 * change, and VIDIOC_STREAMON checks the scaling ratio.
+	 */
+	if (mtk_mdp_ctx_streaming(ctx)) {
+		struct v4l2_rect *src = &ctx->s_frame.crop;
+		struct v4l2_rect *dst = &ctx->d_frame.crop;
+
+		if (V4L2_TYPE_IS_OUTPUT(s->type))
+			src = &new_r;
+		else
+			dst = &new_r;
+
+		if (mtk_mdp_check_scaler_ratio(ctx->mdp_dev->variant,
+					       src->width, src->height,
+					       dst->width, dst->height,
+					       ctx->ctrls.rotate->val)) {
+			dev_dbg(&ctx->mdp_dev->pdev->dev,
+				"Out of scaler range\n");
+			return -EINVAL;
+		}
 	}
 
 	s->r = new_r;
@@ -953,7 +980,6 @@ static int mtk_mdp_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct mtk_mdp_ctx *ctx = ctrl_to_ctx(ctrl);
 	struct mtk_mdp_dev *mdp = ctx->mdp_dev;
 	struct mtk_mdp_variant *variant = mdp->variant;
-	int ret = 0;
 
 	if (ctrl->flags & V4L2_CTRL_FLAG_INACTIVE)
 		return 0;
@@ -966,14 +992,13 @@ static int mtk_mdp_s_ctrl(struct v4l2_ctrl *ctrl)
 		ctx->vflip = ctrl->val;
 		break;
 	case V4L2_CID_ROTATE:
-		ret = mtk_mdp_check_scaler_ratio(variant,
-				ctx->s_frame.crop.width,
-				ctx->s_frame.crop.height,
-				ctx->d_frame.crop.width,
-				ctx->d_frame.crop.height,
-				ctx->ctrls.rotate->val);
-
-		if (ret)
+		if (mtk_mdp_ctx_streaming(ctx) &&
+		    mtk_mdp_check_scaler_ratio(variant,
+					       ctx->s_frame.crop.width,
+					       ctx->s_frame.crop.height,
+					       ctx->d_frame.crop.width,
+					       ctx->d_frame.crop.height,
+					       ctx->ctrls.rotate->val))
 			return -EINVAL;
 
 		ctx->rotation = ctrl->val;

-- 
2.56.1


