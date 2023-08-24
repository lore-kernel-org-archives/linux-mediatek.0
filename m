Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1CCC6FA8F
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Aug 2023 09:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQl8/bM14+DmHr/0YTeiP15jtuV7omqMrb4Kmo0IzSE=; b=hrKQYB0rkx1OGfdYNeLYRWCKbY
	Vp38XucLCv3BoIzRE4RfQMlXJKUuU2vntbCVmZpjz8Sj9WpFrykX1DygR+lbg74RTslbkIiTSyWdo
	zTfqZEkrdvdqlNFLSvhxlSwlilPTXkqBcGvKKxvIbH9EYEDGRPUBrt5hJzdzB6v5atn9LaX06xaJ2
	kLzYfRvn5KMRc6iOZChVlJ+FNu6ChyEBvrdg6Sy/lxKZbSR70UWQrDMs9+26QEfcRhO6wgXMHDe1c
	5KatxOuzAbUpfsRsPprZfcBWNrQkvmO1NnS69N6a3ULUpS7ZuExhlU72jLjTAeXsNtFvWWxBdIJzW
	Xq7XJQMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ6Xt-002gWj-1C;
	Thu, 24 Aug 2023 09:22:29 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ6XG-002g6K-0e;
	Thu, 24 Aug 2023 09:21:54 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:672:c310:4c8a:3a97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BCF0A6607308;
	Thu, 24 Aug 2023 10:21:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1692868905;
	bh=PWkYPK7UJF1YmVd+lrdWvCWfZPTYmEC52Q6H6L/2CpY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R/SPv0Dy0iBRcsZbWmQFlUA6N4JHkxVqimQXCK3Lrr/717kH60Foss4GfNKFEBoSD
	 1eodB6aWnxkSYjmgQj1eb6RxTj5F2+wRcc/I9JdPUKSNqbnC0U0I2sUda+Orre4sdq
	 BRXGCoqrWFY9E49TGHO0geQ8pmo9Mp2I+G9cghz6PzPFO7+OvbR4r8x9OJPYwGfVDk
	 Mdlx2jizNtqDtc5/LEbHtQ2bcwG/zow8v5zRXt948YmcJ/wG9wfJfPDy5bpD+sHjET
	 LY34+TAEByasLjenXpSJNT+0qjHJzwhFyT9W6vWYpSuTh1Uox7OFoMGrp6GFp5PzFe
	 jixgUT6/iNg+A==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	ming.qian@nxp.com,
	ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v5 06/10] media: verisilicon: vp9: Use destination buffer height to compute chroma offset
Date: Thu, 24 Aug 2023 11:21:29 +0200
Message-Id: <20230824092133.39510-7-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230824092133.39510-1-benjamin.gaignard@collabora.com>
References: <20230824092133.39510-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_022150_394783_AD0CCF22 
X-CRM114-Status: UNSURE (   8.39  )
X-CRM114-Notice: Please train this message.
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

Source and destination buffer height may not be the same because
alignment constraint are different.
Use destination height to compute chroma offset because we target
this buffer as hardware output.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Fixes: e2da465455ce ("media: hantro: Support VP9 on the G2 core")
---
 drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
index 6db1c32fce4d..1f3f5e7ce978 100644
--- a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
@@ -93,9 +93,7 @@ static int start_prepare_run(struct hantro_ctx *ctx, const struct v4l2_ctrl_vp9_
 static size_t chroma_offset(const struct hantro_ctx *ctx,
 			    const struct v4l2_ctrl_vp9_frame *dec_params)
 {
-	int bytes_per_pixel = dec_params->bit_depth == 8 ? 1 : 2;
-
-	return ctx->src_fmt.width * ctx->src_fmt.height * bytes_per_pixel;
+	return ctx->dst_fmt.width * ctx->dst_fmt.height * ctx->bit_depth / 8;
 }
 
 static size_t mv_offset(const struct hantro_ctx *ctx,
-- 
2.39.2


