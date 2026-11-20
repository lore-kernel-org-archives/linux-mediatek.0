Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705B3606A6E8
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 19:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P31ESA7R;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=OLQ5cme0;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y+N2r/iv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=T1YY2FHyplvq/pdZvQrVAOibFr5kT7poHAqRS/xwvsw=; b=P31ESA7Rz6uv1h
	TEfrbkAM35ZkNQDB0LNezU4FZLSHuWjCm8DLqDzBG12ebEiifVsxtN4h+50+/a3Fta+dfwlJf7HMv
	bb5s4FDYCwKMri0MekYSovzHNmAjbjmukOK/TajYWLzC2IJvJe3GKF7y+XMQG4WykDhLyvnGfz1Fm
	ZGUSVLrMuCREqwxTe2ejbDjN3H2/oxrUUj8zBTyM9InHlaBF70Zbu0tncda5YJmvxYs5Ph53lmLW/
	0sbA1pnrjiAcNTR/CF0QEbIB/hOBnTbl09EXjcDmqOYsuQNcYxgU8Q6RcAJN5pblPkUSR2rjtmw6s
	3sxeaAu/yfr3Y4uGG3/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUia-0000000G9nw-3Suz;
	Fri, 20 Nov 2026 19:56:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUiP-0000000G9f7-2s0Z
	for linux-mediatek@bombadil.infradead.org;
	Fri, 20 Nov 2026 19:56:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=T1YY2FHyplvq/pdZvQrVAOibFr5kT7poHAqRS/xwvsw=; b=OLQ5cme0JS/npFDv/bDnKDz9ul
	7PwM+iBOnNMsWxi1mUko94JBI8Kk86ZeH7FPxYw1dfRzeuvNnJrR+pUb4OJLrcYBPp8RwbP1BXCW9
	pMIOanGNJyDVwlnMmQq7qs4SB2+QK34fJF/U2onLSPH8fsBswWG9eSQYSdMurMCqL8cfob7PdsAl7
	9T5FB/r1YmoGA7eDMpCyZ2ac6/ODX68AzVM027cjOkVNYYwdVqcWIWSQ6t4wfos5jNIdETXY3Bj3D
	m8QyzsedcCmgESGkyRG5t3kMrkE3Y83UmW0bx7r4KbCrX6O51Yg0aHVtd+le6/Q57Emn54aNPYZZ5
	G/FQBMeA==;
Received: from mail-oo2-x07.google.com ([2607:f8b0:4864:31::7])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUiG-00000001ABc-0IQk
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Nov 2026 19:56:08 +0000
Received: by mail-oo2-x07.google.com with SMTP id 46e09a7af769-861b66a5ac3so114896a34.0
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Nov 2026 11:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795204555; x=1795809355; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T1YY2FHyplvq/pdZvQrVAOibFr5kT7poHAqRS/xwvsw=;
        b=y+N2r/ivCl2YjYJuE1G74XEoD73emdiIQqxX58jsrvtvkD4JwsjlfznEYdlQPIvPRg
         LF1caxmnkTXerjaYqEIk/DOgJBScMMjI8oYXgiHs9Nw8G8g/c8hkTtmUqpAqX5qtHUzL
         GkyNf6DYHQ2WvH97bNPTzcckZki1nPBIiJyB7lWvsl5dd+qHXY7Ct0Xc4J/In+9mQH6d
         PL7eIehkxybwK9OTOegx4rodYtTqxIUbb8WebgN7saHQJaLceYldKK30gErSAy4/zTlD
         fSoyq5TWmskYDxQzk0PKEPKZAAZkEAGLp6N23MWY1KL0ku//sAFMcD6vw90PKf79ODWU
         nrpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204555; x=1795809355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T1YY2FHyplvq/pdZvQrVAOibFr5kT7poHAqRS/xwvsw=;
        b=XQy8jyt3YEqdvDu1m+CgNvyJLkf741ADb9GLBq2ybvR+Lrm19EUBMc7Hxfhf6e69UQ
         nUJ84JBVNs1mY09O4usxi3IuBo6Bc0MX9h94XvPCIx7XpfLlPw1p9u50+RCNWlDwn+t7
         XHkr9N3dXZPrvqxJ04+aGQGNymZCMzp3I5/Xfvyys6pimHxEZszf1wMrowN2OFZtGN6j
         GyOaIm19PI3q+0jni8wuI027Z9LhnHV4srkf4ROU03F1R+BlhezqlW0CNPHTUgYbkqS1
         SHSQCE0FuvcYQxY5gVZYK5oLnMkTqpfgXRdn820gQHzC41DHTvlnuM5HQMSnFGgwiEJW
         vPGQ==
X-Forwarded-Encrypted: i=1; AL+hErF6UvyppQrSFm5Wm+Zkm1tbluNYhdJ4GFo541W2R61RK30IvLAgQyyJwCcsSdmgwPtHK6Zf3qIXT/DJTM3p5w==@lists.infradead.org
X-Gm-Message-State: APuU4Z8jHsvij9GodetQoP+7IzCtR17sPZVlgxAbuLIq2OuSKiz38+IC
	Ix5bvw5U3IHR0AMBMlacJyaH1xFwvXNjXhJAhyMWtGLIDyhq+zvHYxHn
X-Gm-Gg: AYBFou0iYOrkrN2HqRrKM8mbnMFTOsXE6ixaEQOamAIkEVnbqfJglEwJgW9BQ39+lOt
	AW/WtxAE5/TM35qVW8ai+F2MLa1m2KzvV/PWK6hdwPCoOPSxIATQy9SyUihnY5x/0sDXr8gB2vD
	AQBkcNBXysrBnNaCYiJGzR+Bnsta46f/spQpx/abDNOKRJjfdKlTucBc4Au+Auuu5+OLl3lYOvn
	q3VbHZSJx77BoJnuw4bMzjQ4n70aTaBYOS7Ve26jLdJeVrZn6tSZnSU2txY2oWoEeC/KahM+meN
	kNv8KG6lgFClwQ5H4CzghNaL9e50XJNIBKQvGjfsrE+1SjoQsFfXxgoYA9D8qOF6A9a3T9RHu4Z
	P9BitZDU6lV6uXN4HVXFf9/04Y/6WD8yk9warT255cAGznABT9kdc1KRd7N5ClxGRJW17aRVp/C
	tB9zh+jXcg0JO0h7uvfoqQtyeJWvy3JEdqSaQN3W+KmlX0aV//g16p1AB7ugDQSfKBRkS1sbLef
	5vs3L5znscAZDHzBu1ED9RwbnwjIPLuQVnLjN4mntZMSrKrpstw3PXrIlJijTSFaIMRmTqus4Gn
	siWTj0lIH5u/0CkbDdCiOx70WcIjmnYc2pXfZ6+0qftnVCSRH4DTc7wMJQPe01XBsI09SzU+yWs
	PjeACCmR+nfcxAJiFBwU=
X-Received: by 2002:a05:6830:2705:b0:863:588:fd47 with SMTP id 46e09a7af769-8631565526cmr4713565a34.16.1795204554951;
        Fri, 20 Nov 2026 11:55:54 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dcf38sm2703953a34.9.2026.11.20.11.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:55:53 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 20 Nov 2026 13:55:42 -0600
Subject: [PATCH 8/8] media: mediatek: vcodec: Refuse a format change once
 buffers are allocated
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-8-877dea14c3d0@gmail.com>
References: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-0-877dea14c3d0@gmail.com>
In-Reply-To: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-0-877dea14c3d0@gmail.com>
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
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795204536; l=1950;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=uxN8uWXPPsDNnitOTveJHbSyY9I0K+Jb1iUDHWdG5+A=;
 b=EgoxeLDbz0VfDWewlqSPzl6zYQWyndby+MOiqVsid5yzHe2cY8RvYuopyUvIg4MUWXFHgC1EY
 tUWmrjd4dQXCfC327gZfBpckWNpOajpETTR0BjM851h3zRyGb+5/mms
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_195601_487403_BFE9ACE6 
X-CRM114-Status: GOOD (  11.40  )
X-Spam-Score: -0.2 (/)
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
2.56.0


