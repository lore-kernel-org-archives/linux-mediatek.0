Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C65606A877
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 07:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dyzXdI8K;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TjxjOceq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=T8BMjQzOIvYi6coC6cfEQ/w65JHYug0nfsYJkwPuKxI=; b=dyzXdI8K0SwJ4bxLtNrmnUqSMM
	rTNNk5vqIit4/SjHPjd/E4TkiUW1TMOG0kQwW4uTkTnBlTqCMA5E1nrPzWxPyINkGokgp9k5Uwbua
	pXGL4w8zHXt15CxPgjyCghvwTQCx1GJRApQT2LGcEwpIQOp+8B9ZTemdVO52oxA87VSM4S8KI+RXI
	Z+sg+CQJvIt0Rjr5E4/xFmlIysUYMDVQC7tzWVAmMb4f4+1diBhWDC03Tw5cRNplhShhhfiiFQvNz
	UD77xk9qZDFsoyrk9vMh5yyqckkHR689BS6aeimx+ahsSqmvoFTP1Js9T9hrIRaXbqCSAHI0QrwA9
	DjZgNI/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg7t-00000002pxE-2Dbe;
	Tue, 10 Nov 2026 07:18:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg7C-00000002pMy-3AuT;
	Tue, 10 Nov 2026 07:17:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7676D46A38;
	Tue, 10 Nov 2026 07:17:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295078;
	b=2S7GFvhX7dFYIgYA0PMhDCpG98TmBRm33nHhAuqyhsMnzuSPOnLW6mhdulWSejYBa/Zn
	 XgPNg+7KLVkPqlKobKRvzoT+g6JPSsepXUEialxB/OyhyfiJPtas6RPe+8UAMyuzy+j9u
	 tX6D6j6l+O21jVbP101dx70BVYRTEVGGxZEGZf9LeiVUeFuP5au0xJ5+xOA7O10ZXWchi
	 AAkPOJGdEs/HHIwAPYV1MglmDCI/CRGNX1j6I5E989FVzSvCMxwg86CpkCHSgbc7yqIec
	 Meqih73LTMUzSjPD06XMzFL36cqUsUwmh6bSQYWdKO5sf9tux55SooVA8xMzz3wJZdg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295078;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=T8BMjQzOIvYi6coC6cfEQ/w65JHYug0nfsYJkwPuKxI=;
	b=SNtQh/AqOkbef1sLFya+S66mJq6Cc6vzjm/5gCiP0jcsq1f645Sl95BTfREiAx+JoDic
	 MwMR+BgSNhJ/ukXa+IlzQ9lWTESGWMMzmEvcB8D5pH8edFtt7hJpAVb8BDJ1xX7YpkZhU
	 JD3norsbE+IXq7v8kZ0M1Cw2PLUzjvCBVSg3Gfg4fAzFjVBF4TJjAcz69dEwnoa/4XxUZ
	 JDsenFwVTL77ZCUts95wcnRswfzhoq9oT4nDodM2N0zG3LM0h0S0znhkVMyAlOfSj6w9A
	 ntqqAI5JeU0XyAuCgIDQklT7UD+7T3IrUjThzu913EEFD314sNG/1RgtZuetEEsbydQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BC8741F00902;
	Tue, 10 Nov 2026 07:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295078;
	bh=T8BMjQzOIvYi6coC6cfEQ/w65JHYug0nfsYJkwPuKxI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=TjxjOceqMKBehH/WOEZMWDJ9zPtXRUgz1CdekNOekeThwasgGoprXaQtK7HJry5rg
	 sifEDi4LVIwPeLK63b2SODEzWLqycaNIuWbrm6h0I7lxWbles2mcqPbxc0hHQmUcZY
	 JnaBSZiO/cgfnSSdv0gpKiDGWAC9Bp6pKW9MBqe1+ilOgBhDJDcD/AfrkdMyejQnVp
	 9h8tSDisdDmnLatVr/UrMopK2coobtLsuX0B+wyq80C3E6sLomk9VTDk8E2/FLEJZV
	 +9k73xz9tK5iNxly1hyocPZnG0RD31L1oo3mLth8mIvKwvl70MOvxbtnvjmtjrn9A3
	 SqRgILrqceF5g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 71BF74899C;
	Tue, 10 Nov 2026 07:17:56 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:18:01 +0000
Subject: [PATCH 6/6] media: verisilicon: rockchip: Limit the JPEG encoder
 to 8176x8176
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-hantro-jpeg-enc-fixes-v1-6-fc4dc7e985d2@gmail.com>
References: <20261110-hantro-jpeg-enc-fixes-v1-0-fc4dc7e985d2@gmail.com>
In-Reply-To: <20261110-hantro-jpeg-enc-fixes-v1-0-fc4dc7e985d2@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295075; l=2124;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=YcQepcs/kiqGO0VYJKSScKTM3/q57290AfxfFBFuGJE=;
 b=1+8p98vHStkEBOrBQLzikJyt9X7HUs6F5Qbcu93cIySUhBBC0ChChkoaPM+/PzBYUA0rxE/4r
 Yd2zb2U/jfdB1XlESEAqh0u4gswbvk48/dwzF8nON+0hXuT2otryzgS
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: aiyengar1990@gmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arun Iyengar <aiyengar1990@gmail.com>

The Rockchip JPEG encoders advertise frame sizes up to 8192x8192, but
both register layouts take the picture size in 9-bit macroblock counts:

 - VEPU2 (RK3399, RK3568, PX30, RK3588 VEPU121): enc_width is bits 16:8
   and enc_height bits 28:20 of the encoder start register.
   rockchip_vpu2_jpeg_enc_run() masks the counts with 0x1ff, so an 8192
   pixel (512 macroblock) dimension is programmed as 0 macroblocks.
   Setting the bit above each field on an RK3588 VEPU121 did not give a
   512 macroblock picture either, so the fields really are 9 bits wide.
 - H1 (RK3066, RK3288): the height count starts at bit 10 and the width
   count at bit 19, so a 512 macroblock height runs into the width field.

Limit the shared format table to 511 macroblocks, 8176 pixels, so
userspace gets the largest size the hardware can encode instead of a
corrupt or timed out frame.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/rockchip_vpu_hw.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
index 02673be9878e..f8079f96c398 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
@@ -20,6 +20,13 @@
 
 #define ROCKCHIP_VPU981_MIN_SIZE 64
 
+/*
+ * The H1 and VEPU2 JPEG encoders take the picture size in macroblocks in
+ * 9-bit register fields, so 511 macroblocks (8176 pixels) is the largest
+ * width and height they can encode.
+ */
+#define ROCKCHIP_VPU_JPEG_ENC_MAX_SIZE (511 * MB_DIM)
+
 /*
  * Supported formats.
  */
@@ -52,10 +59,10 @@ static const struct hantro_fmt rockchip_vpu_enc_fmts[] = {
 		.header_size = JPEG_HEADER_SIZE,
 		.frmsize = {
 			.min_width = 96,
-			.max_width = 8192,
+			.max_width = ROCKCHIP_VPU_JPEG_ENC_MAX_SIZE,
 			.step_width = MB_DIM,
 			.min_height = 32,
-			.max_height = 8192,
+			.max_height = ROCKCHIP_VPU_JPEG_ENC_MAX_SIZE,
 			.step_height = MB_DIM,
 		},
 	},

-- 
2.55.0



