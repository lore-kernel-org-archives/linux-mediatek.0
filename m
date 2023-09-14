Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07630EEAA40
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 13:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5L3/AyXWBMargXezPo0FB+C5lfGWk8bpjOj4Q1JKDYg=; b=Zt/r9eM31c2Kym2fS75tfiV60f
	n0XfZmqYNl4LTtBe7272O5/AOp2Nx6Hrj/U1AT0EAlu2FjJ6DV8hv0qzO64hAPbxLwSZlX8ZCDOtw
	P4MjgHYVQfs79ziTiSuSwyJUNE2NGaK+EPnYctdvNeh2/DfkkqMbJsaa6G7YYzsPhMwLcf97tjW5V
	EEhrdPl/wY2YCu/O+WpQhONTf5zJpD/J/DbJRcEdZSGM3GdngGwO/GOTXjcrMAVyBYtdC4N6KgQLr
	uwrR0TXLioYJSqrHXmRLWF7SqG2HLbPmJzSxYFEjnCQDM7MU1hN5Vi4FEmne+hkovHBlFB3GmNtgI
	TlcDZPPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmU8-008T23-1s;
	Thu, 14 Sep 2023 13:34:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTY-008SIk-36;
	Thu, 14 Sep 2023 13:33:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5L3/AyXWBMargXezPo0FB+C5lfGWk8bpjOj4Q1JKDYg=; b=U2cJmwaQHL4UHMIA63LqLyCnVS
	ZZnveRJcFcFZFBtYbuXMhJcAX97+rs6HToiYsqVs/BgbzlnvOJKEdM7CIp9wGHtjo7Y/WKRvJFRJC
	JMXLAaNxjCJJrs6vw83hHbnQKcg3yDSC92nwoY0yKafjQBLW5u0+7j4f7bw2XoqhOPmafcvTy6Go5
	+qoFWJLXy3sl8/QdvitfDNp7BuHZvQBVoG0IsCTjd9WE+zY6RzSwM6umTL+DKIykinlwBcDQ+twl9
	K2KA7o+eo5DGiS7pD11AKgIycy/e/8RMWn9hIZe1pcR4/vNhL5/pnbiYayujhWMPExccVQsnsybry
	w6Fy1csA==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTT-007ueX-1c;
	Thu, 14 Sep 2023 13:33:43 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:36f2:37bd:ccbb:373f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 668DB6607369;
	Thu, 14 Sep 2023 14:33:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694698418;
	bh=gAzQ/SGzIm4inZNC+PXcs+p3IPzDsrNiBUGyKW1mkfg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lxrnhma7i8Ls0SAgQGTQPC1BsiJemQAXaFNVnm6fXZ5GrBZo+K8vxtcjrtDiBx2QJ
	 MM65w1/9WJ/gapuK+evfRQHEKwoMZNfRdb+rY3lIJBElI6S11/dc1UqudAAZO4CWg+
	 JSqnntZBc32UlhipMCto22SL+A6FZe5P3a4fn+D6PjTP/jTzAsaLYhnVXriSOyJB0e
	 DLWhCY8a3+RF9fU9LoN4XXaY6mXC66MjlpdfPN8C42xhazrb9IB+NP2GwmoyUsunDC
	 pvay/ga8Wo1R3ZEQc5YiEeEdj5gOTeCLtiYYOlAdJpCvx4rjVwPyQvAjAbij1eIhsz
	 FoAAWVA6CoAfQ==
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
Subject: [PATCH v7 14/49] media: verisilicon: Store chroma and motion vectors offset
Date: Thu, 14 Sep 2023 15:32:48 +0200
Message-Id: <20230914133323.198857-15-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
References: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_143341_348725_FAF3802C 
X-CRM114-Status: GOOD (  10.63  )
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

Store computed values of chroma and motion vectors offset because
they depends on width and height values which change if the resolution
change.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/verisilicon/hantro.h            | 2 ++
 drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c | 6 ++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index 0948b04a9f8d..6f5eb975d0e3 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -328,6 +328,8 @@ struct hantro_vp9_decoded_buffer_info {
 	/* Info needed when the decoded frame serves as a reference frame. */
 	unsigned short width;
 	unsigned short height;
+	size_t chroma_offset;
+	size_t mv_offset;
 	u32 bit_depth : 4;
 };
 
diff --git a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
index 6fc4b555517f..6db1c32fce4d 100644
--- a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
@@ -158,9 +158,11 @@ static void config_output(struct hantro_ctx *ctx,
 
 	chroma_addr = luma_addr + chroma_offset(ctx, dec_params);
 	hantro_write_addr(ctx->dev, G2_OUT_CHROMA_ADDR, chroma_addr);
+	dst->vp9.chroma_offset = chroma_offset(ctx, dec_params);
 
 	mv_addr = luma_addr + mv_offset(ctx, dec_params);
 	hantro_write_addr(ctx->dev, G2_OUT_MV_ADDR, mv_addr);
+	dst->vp9.mv_offset = mv_offset(ctx, dec_params);
 }
 
 struct hantro_vp9_ref_reg {
@@ -195,7 +197,7 @@ static void config_ref(struct hantro_ctx *ctx,
 	luma_addr = hantro_get_dec_buf_addr(ctx, &buf->base.vb.vb2_buf);
 	hantro_write_addr(ctx->dev, ref_reg->y_base, luma_addr);
 
-	chroma_addr = luma_addr + chroma_offset(ctx, dec_params);
+	chroma_addr = luma_addr + buf->vp9.chroma_offset;
 	hantro_write_addr(ctx->dev, ref_reg->c_base, chroma_addr);
 }
 
@@ -238,7 +240,7 @@ static void config_ref_registers(struct hantro_ctx *ctx,
 	config_ref(ctx, dst, &ref_regs[2], dec_params, dec_params->alt_frame_ts);
 
 	mv_addr = hantro_get_dec_buf_addr(ctx, &mv_ref->base.vb.vb2_buf) +
-		  mv_offset(ctx, dec_params);
+		  mv_ref->vp9.mv_offset;
 	hantro_write_addr(ctx->dev, G2_REF_MV_ADDR(0), mv_addr);
 
 	hantro_reg_write(ctx->dev, &vp9_last_sign_bias,
-- 
2.39.2


