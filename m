Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CB1606A32A
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 20:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iOhW7upY;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eufm2dp7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0Gf2EAUcJRVl7OuOkX2Dws1/ZTM9OuXnITDMSmBlcuo=; b=iOhW7upY02IW3l
	FEdZU2o9uswMV/z25zjQsRTqswwmPl5wwQfNVzwiiTv+Rp0haR4k3dqSh+pvGgphkAHeCigmhdbK8
	ozzgvCU7/1cptjOKvpcIkwngS5fQJmAALUZN/nlpHt5EKjGyAEieE7xXO5fe5eFhh+vMjGqhunvyY
	yVQfInNzKH0HSMNXfUGG/md3jYCdYKVk4wYUF+gCgxaiyc0lHTdlIO0Rfm9gH8f2xAkm4WJQ1xl8q
	k4NVASfw+The93fmL3p0SZQ1jV3xopuJxoqLohJP2Jpn0Nc9m49/2eKQxgPrmn51gujOhIoAaoBB2
	YrP3VNyDXJqpt2OU3VFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJQi-0000000BFUA-1jht;
	Wed, 25 Nov 2026 20:17:24 +0000
Received: from mail-oo2-x0a.google.com ([2607:f8b0:4864:31::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJPl-0000000BEup-21YW
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Nov 2026 20:16:26 +0000
Received: by mail-oo2-x0a.google.com with SMTP id 006d021491bc7-6f9b24c99b6so1924822eaf.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 12:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795637784; x=1796242584; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Gf2EAUcJRVl7OuOkX2Dws1/ZTM9OuXnITDMSmBlcuo=;
        b=Eufm2dp7/GQWyXLuOT8FqRhPvHq4FfedGpz72ZujN+W1lmzAXC31fRix92W2qkCKh0
         z5anwCMNXwFeJWK22YRlF024d4eKdvWgCxQFhT9k94JRK5igf5LIcBdG8kbqX/JkGi9B
         hqLUXEmB1qvs4T2nwNDsPPN+FJDC9qoUzMStti3ogREzmiV2kGkQiOFgtSpdimIAZWkd
         UG9WFdHChuXwRz80S/PmHpY0AqL5MkiIH1fFA6UC/UOvLuvYW6goxByRF14Y7U+hDiGH
         2h1HJS22v4OqJiwTuOKKp9u4ODdsuObkza2NX66t5HJi8iwetYK34pXUaPlKG0VneES+
         keaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795637784; x=1796242584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Gf2EAUcJRVl7OuOkX2Dws1/ZTM9OuXnITDMSmBlcuo=;
        b=uo8Mu+P8NLzeNjUUUKTDWixXlc5fVqdUifLFXRnBw68xRmkY2qKCN0Ay9lI0DGfP4g
         gyvEktNETHJazfh9u+1o1YEkGBxXC4uC9uwWcBDb4pfMvBYgsO4zgAy+YfuG7/x4tb3V
         4E8VzfQMA6O7Hur4MU0lnTy81ebdSbQGe2ZfhzNQnOau2USCp8o4AA2vq97Fx8QtgD4W
         nGfovF6N+NALPAcI+J8705CmD+cjlYVpAnEluspSYPXRC/LhGo6R4Hq7K06Y3XloXDXy
         XyQacLTBANLwO5dWrskBhLlNHH4uoZiO3NXFHtIJJsxpJbbYPUL3lUAXcv4sujRQ+T5v
         4d6w==
X-Forwarded-Encrypted: i=1; AL+hErGZSQrLfaCU0M6rnLSpWzhNdm0loF+SxeL+AmtvJJqLj1Hai5hACPeRyKdd9Yt5S8T9SMQW5jOodx0+ZaWZOQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+i/x/JNx7aIbVGamcVbXWi/BILlNOaEMZB0N+a7RDA0zicF9TC
	q95F+MrFk/8/JZj+zs48R5XgBIxBxiD1cJfQqVJ10bvpyNK1XK1Coqse
X-Gm-Gg: AZFdTZcFkLhdRMtnEY2vgib5mxHD6Jzn+AIuExLDpZzD/yGI/luMVeRooZJ0+CdMBLK
	qlQaHlixuK0hQf0t52maUz7kvx9cvfuCkuCOUXTHDMg8z2+MhLN9BcU2GmnpaErR90kjlwr6Gji
	J1IIXC+TvoN8YQ06GIMPRyTtJAm42IhtzohMLnOQBVR6fsof+r7qZpx81ciciJ13Hb9/fxo3MEC
	y2lIroJt9BBkI8DpRGjJgjf+lFQaZY/ycPdmiQdrWieF8OtMdr90AxqVdHC5tXUeaDPWKvjaoMH
	n6kviQ58P2o7iW2dYaFCdTtZ74LpwkAgXiNI4/tx08rIfuccdaX/7sVYc1cJAehPwzFka0rzFkX
	zD6kkF8efiUrg07sNLmOIVRfwvo4D2+7WuRuHU44i2/+5Ma1WEo0DOboou8+OiueKP0UUXzeIdV
	zql+n4vC0QW52LGCyNYIvuPTBqlQiH2BWkDoRjHrCE7UtR90IUetdVzoY5mu060yPS9CVx9MpTD
	zkur92ga0gAI0mWUbmHhn6mJHz3nndgx6s+Jeo0NcagvLhg9LXOM+Ibrsd0s8pNbbU/FeFSIJUu
	8LP0GlG22Whb+UwGTW4EZXeIJY8tPprUcTo=
X-Received: by 2002:a05:6820:1387:b0:716:df3b:e940 with SMTP id 006d021491bc7-71b3944022emr18067391eaf.16.1795637784658;
        Wed, 25 Nov 2026 12:16:24 -0800 (PST)
Received: from [192.168.0.98] ([50.26.120.197])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm11341859eaf.10.2026.11.25.12.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:16:24 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 25 Nov 2026 14:16:11 -0600
Subject: [PATCH v2 8/9] media: mediatek: vcodec: Refuse a format change
 once buffers are allocated
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-8-fdc047cf75a5@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795637766; l=1978;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=z9CNO4bCWGYjNQTDYVvQNuOaV1YRFSzVKYh+7SCdusA=;
 b=GzF6pMC0GCPOHve0CXuogF6oQG8hAnVLXT0K2N9Woit8cMr6jKke65a0sorZ6u3wiUe6HkT/F
 jNzOTZp9VN8A/BhNIpxCSQBMnSCT8Z7NjqdpvTXjWKfxIN/UV3Apuw0
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_121625_535214_FC75B2D8 
X-CRM114-Status: GOOD (  11.42  )
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

VIDIOC_S_FMT on a queue whose buffers are allocated sets the result to
-EBUSY, then goes on to store the new format and returns 0, so the
client is told the change worked, and buffers allocated for the old
format are used with the new one.

Return -EBUSY there, as the checks intended, and log it at debug level,
since any client can trigger it. The CAPTURE check applies to the
stateless decoders too, which now also refuse S_FMT on a busy CAPTURE
queue, as vidioc-g-fmt.rst asks.

Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index 1223738ece4e..71db692ed848 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -493,8 +493,8 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 	if (!dec_pdata->uses_stateless_api &&
 	    f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE &&
 	    vb2_is_busy(&ctx->m2m_ctx->out_q_ctx.q)) {
-		mtk_v4l2_vdec_err(ctx, "out_q_ctx buffers already requested");
-		ret = -EBUSY;
+		mtk_v4l2_vdec_dbg(1, ctx, "out_q_ctx buffers already requested");
+		return -EBUSY;
 	}
 
 	/*
@@ -503,8 +503,8 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 	 */
 	if ((f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) &&
 	    vb2_is_busy(&ctx->m2m_ctx->cap_q_ctx.q)) {
-		mtk_v4l2_vdec_err(ctx, "cap_q_ctx buffers already requested");
-		ret = -EBUSY;
+		mtk_v4l2_vdec_dbg(1, ctx, "cap_q_ctx buffers already requested");
+		return -EBUSY;
 	}
 
 	fmt = mtk_vdec_find_format(f, dec_pdata);

-- 
2.56.1


