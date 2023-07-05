Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5A1C0015E
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jul 2023 12:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yHgGPeTz0b5NJ2/HodHoF+FrbwufwKaWr6rDqpcbxws=; b=MTwD5gTXv52dMzaaE/H9u8cEG5
	uG/9OXLBZqy2S/z/1Ek4U6+vNADpLxDKYBxAbC75gaEY9tQi0S5QTd9XEvsqg5p0sb/c7+WaoBOBX
	RNx4Y5drZ6wZg/5gmVA3KJEBlzzu2d+hBaFpOV+jGBZOlTXQQeyqQJa8jpRCohHfvZw4HT2usfxAb
	edeeliYByQ/EYa3GFe6iTp2OS+UBludFcUGGCvNjwT06jtF+CHy2awp5NcWR6JTZFg4uaT6pCxmhM
	lb2xNqh90t4bIXL7YcQwUkusrVb7+5pQ90BWpMP/u9Z/WLf5XKUtV/iJSyb/X8ngbE3J92VQ/2sRv
	lhFeiJBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH1M1-00Fpjw-1j;
	Wed, 05 Jul 2023 12:11:29 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH1Lm-00FpWb-1p;
	Wed, 05 Jul 2023 12:11:17 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:cbfb:e358:222c:d8c1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5F1146606FB6;
	Wed,  5 Jul 2023 13:11:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688559066;
	bh=08pz2UKBXmFkMllWQeyJmK7L9R8AXzq83ydZhWVZx80=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R6pZ9c993XtQk914uQhpn088GBYIK0W6YxofCqv1NKy0heOsdBzG3sZJppsnSXPFj
	 p0aXIYIBhGIQsG2rwSuycV53WOF+tHtLOBFlDkuG88uLo5F5lhsIz+2+DF2ltbnddn
	 jjmdfNZ7cmxe0P3uCQRc41vX60gZ5K9NxUM1SsAmSUGce7VzpQ+7rR7xcpVjm46oBE
	 87H1Jk277U5gPbGvjo1hykSewirSdDL0ermsca4libtzSSbV3o2gjq8gdfETFRG0BW
	 X7wtKDVpdIwQpT8eCHEhj672vTNyFrj4m3HlpyhEGXoCSgijAsFz/e4ynS3KfIQkj1
	 aHpRkoqvwwdJg==
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
Subject: [PATCH v4 06/10] media: verisilicon: vp9: Use destination buffer height to compute chroma offset
Date: Wed,  5 Jul 2023 14:10:52 +0200
Message-Id: <20230705121056.37017-7-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230705121056.37017-1-benjamin.gaignard@collabora.com>
References: <20230705121056.37017-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_051114_780209_FF7030CE 
X-CRM114-Status: UNSURE (   8.63  )
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
version 4:
- Add Fixes tag
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


