Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFD7C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 11:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Bdt/pZAOacqJuCFzII9rBWAKqWiyNAPCi+XwvqCQy0=; b=yVNXSdgSagWsvUFRvjDp8fAcic
	vPTLZheaC9gElqvrIKknctDRrWBCJUrNbDGbHoEt14DhHfnI280yByWrGxJM9hPdfsqCx/qiQKjEu
	BuE1FqGco8bXWyltwm8BWcA4nWbPXiG55617SGsS1dW+ILpOwxLY946LDrGVrUzk0pblX3WGT3+0L
	aky/GgCErdgxgLm02+9VyABIzzSyJqAIX5JcJXzTaza+fwNs9iHQFUXZBBWKOPnx1of2x68+ruYvM
	HnM0+vdQ5si3oBbpG+Pdh5oAMGxw7N4GaZXE5H1zplBYcFxbtWzoBMsX8uA20T0DTMlUSQGKDIkIH
	kMmbz/cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5mrk-000TgQ-K8; Mon, 27 Jun 2022 11:25:16 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5mre-000Tan-T8
	for linux-mediatek@lists.infradead.org; Mon, 27 Jun 2022 11:25:12 +0000
Received: by mail-pf1-x42b.google.com with SMTP id c205so8718032pfc.7
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jun 2022 04:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+Bdt/pZAOacqJuCFzII9rBWAKqWiyNAPCi+XwvqCQy0=;
        b=gND2N7zr6zJtFEQ1/Qh++AaC/I3sYIjuvDxr52m7Vusjymll7C22xQJnXtQSAgXqpJ
         r89NGcuSNrr6jtyaN6WQTCKIh/3bqzP4HhpSMrh/aHkJRp7fHeZuEPYn9tacdAUncKNg
         MRC5No3iihpOW7bs07Qq05whWNJSKaynJZWv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+Bdt/pZAOacqJuCFzII9rBWAKqWiyNAPCi+XwvqCQy0=;
        b=s3341STSVxftvWDzpO9/TYf0A/Nwm83tIvpqpWutvSraIqBu33qk84N9UK+WtHHZ/u
         p/gBjav7/gv9L7HB2HuGbGv8TZHC1/OvnhMJa+F+5iSZhATV3pRpuG+y1jNoFX1fEciG
         uETmXXl2r6cT1nWHtHSilRUEo+h3qljOstc5WBJo0coKSDE3gBmcjSVRZxsjvFzcJA+m
         LWvnDK+918JClMH7aQv5Ak6MBd+/uLrl8M/nDnJ8nEGQsoJe6sVLJ5l13Tnw0eu6hnZ6
         ammkn13dEtNQ/3MBjgZb+gfOewIXMuUqaFkQSNsR9jAYrRaNog+ewz9QCIxue3advQIj
         k4vQ==
X-Gm-Message-State: AJIora/mxfvq1N0z5rJCvfjN4De8k0o25hpMCrdZDgWrWcr6pwMgdGrP
	YhP6vN/2WpHxEY3Sz6ig9rLmbg==
X-Google-Smtp-Source: AGRyM1upMeiOln1K4lkc+rTedGu7rooW/59+/KUoBEA/D4qTE+BzMxTrodbWQsrklKjwp/RQ1Lgmcw==
X-Received: by 2002:a65:6045:0:b0:399:3a5e:e25a with SMTP id a5-20020a656045000000b003993a5ee25amr12685653pgp.139.1656329107880;
        Mon, 27 Jun 2022 04:25:07 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2dc1:c31b:b5ed:f3aa])
        by smtp.gmail.com with ESMTPSA id lj4-20020a17090b344400b001ece32cbec9sm9246889pjb.24.2022.06.27.04.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 04:25:07 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>
Subject: [PATCH 4/4] media: mediatek: vcodec: dec: Set maximum resolution when S_FMT on output only
Date: Mon, 27 Jun 2022 19:24:02 +0800
Message-Id: <20220627112402.2332046-5-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220627112402.2332046-1-wenst@chromium.org>
References: <20220627112402.2332046-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_042510_989627_8A111542 
X-CRM114-Status: GOOD (  12.21  )
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

Only the coded format impacts whether 4K resolution is supported: the
decoder does not support 4K for VP8, but does for other formats.

Update the maximum resolution in S_FMT only when called for the output
format. Otherwise we could set output format for VP8, then set capture
format, and then the resolution limit becomes inconsistent.

Fixes: b018be06f3c7 ("media: mediatek: vcodec: Read max resolution from dec_capability")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index ea951cb3b927..995c61d6a40e 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -521,7 +521,8 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 	if (fmt == NULL)
 		return -EINVAL;
 
-	if (!(ctx->dev->dec_capability & VCODEC_CAPABILITY_4K_DISABLED) &&
+	if (V4L2_TYPE_IS_OUTPUT(f->type) &&
+	    !(ctx->dev->dec_capability & VCODEC_CAPABILITY_4K_DISABLED) &&
 	    fmt->fourcc != V4L2_PIX_FMT_VP8_FRAME) {
 		mtk_v4l2_debug(3, "4K is enabled");
 		ctx->max_width = VCODEC_DEC_4K_CODED_WIDTH;
-- 
2.37.0.rc0.161.g10f37bed90-goog


