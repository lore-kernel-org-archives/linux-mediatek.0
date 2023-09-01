Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF95FCA0FE8
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Sep 2023 12:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQl8/bM14+DmHr/0YTeiP15jtuV7omqMrb4Kmo0IzSE=; b=h78Sw77666FWz8CeYcmwLvnJ6c
	KHfkhs5WdolUa4v+5Z3Zmy4v3CYhkRf2ZLtEQqJAzcK6LeFTftQQ0yORIjSdzrroflwJrnae12oN0
	pyC5oB9pYZ+ro0HIQ3AV0+Q5dZVh0t0hgXD4RrDKoU4lYkUzDNMwPDK2MYD/gfWhyKVAQZdj+Hf7z
	vebX/OiWy7ZdANEz+oY+EA96y8Ec5ZJgi/KtbuR7Ne1mmlRYZ2p8TaEghb2N+qd5OMFHTPwwQpuwF
	hmdYzzjrcM9XZAJnHVuxbpgSvmm+2myr9GjYqyzJKxsbD+id/ZTmXvLHpeXVxZmjNTQolJoYyF3mj
	59NMabNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc3Wb-00HVId-32;
	Fri, 01 Sep 2023 12:45:22 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc3Vp-00HULk-2Y;
	Fri, 01 Sep 2023 12:44:37 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:4d01:31d2:de6b:d217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3567366072E6;
	Fri,  1 Sep 2023 13:44:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693572272;
	bh=PWkYPK7UJF1YmVd+lrdWvCWfZPTYmEC52Q6H6L/2CpY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S49BGjOcGyaMdIwRpWlHOylZ/QWpiVcWA3aOPwoNOF8CVnvLzUH2lT5g2Y6981dNH
	 KBKvr+pzhlbF/6YLUTvqsT0SLe4t95waFeUEghNtOWICOZ3n0a2Q4lwlUriGKq1o0M
	 6xIYV2jnCavBA9AAC/+mu4SdOtViJ/D2MNO8izvAflP4Xi9L+TbdfvtY1aHOStH6dr
	 kVAfnPbwDXXaB1cFMqZlwtJ7Pc8UeY9GyE4HTTiZqS3LkdRhgDC5PfqPYUNt0fE76T
	 NzoZ/CudgTKeS865Ykjelf+L11Q2vAsoEmh7cwWc5BBTSHBnJsgLKdDa94zNOsbj6d
	 jPP//HsNTEeiQ==
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
Subject: [PATCH v6 14/18] media: verisilicon: vp9: Use destination buffer height to compute chroma offset
Date: Fri,  1 Sep 2023 14:44:10 +0200
Message-Id: <20230901124414.48497-15-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230901124414.48497-1-benjamin.gaignard@collabora.com>
References: <20230901124414.48497-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_054434_133573_D1412E50 
X-CRM114-Status: UNSURE (   9.08  )
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


