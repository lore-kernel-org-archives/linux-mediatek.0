Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B093E606A875
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 07:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZNZJa9CY;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L+etW16e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Syq/VG6u0EUV0TyeNdEvx71To3HzGWr4DnR5Dla39eE=; b=ZNZJa9CYZOgaIeAk0BKsMtPhC8
	yl3PLZeT2PUubH9Mc6hCRXODaDQpH31E+XBT2g7KiFgVgCNsET3b4R0CluvOPhJhtWJzsAc43Y99G
	bdW6/YhhFc3UrzhZkuXlPObiwP1V/KjC9w2z/t7xTlVj9BZI9UGOunRHZo/YII5wH/eVTSsF0oz76
	VdBoWYxC+iOI3mcYPFIZV/gKy32bqHedjIWK+1p0W1NJxsmPPaK0iZBi7WdlJgUU4s5Rc3lPCr2ca
	ffVkfOo+4Hm2GWMm2NBy/Pv8jPkHR8Wk+n7V4w/NFleBKmgIoQAzAU/FfFztZfnmlr5LOJvCofFjH
	1oxvMN9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg7t-00000002pwt-1Aui;
	Tue, 10 Nov 2026 07:18:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg7C-00000002pMK-26UT;
	Tue, 10 Nov 2026 07:17:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E7214637BA;
	Tue, 10 Nov 2026 07:17:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295077;
	b=IC1ji7fHoUXbVCY4IjbAL2wwW7ENHWWQ0L7IbKRfN4d8mr0Iid0PCij0lFqVSQdVSFZj
	 LrqSSGhtmezOYIBMs+oXN+GwOqEcgk1fS7n0MKto+9WA75IkOjXVE7y06wCKalkQa/DYm
	 oojBPyo5VkbM4ovnwz2LS70yWp2cOCEd3zUUl9rPfr6+o/fvyyMsNJ2kuu9Ar6i+DarQu
	 ZTcIDvD0A2RkfB6Bxiv46KpntPr2ccp/KCjtUBVm46eRX/nYzVOQEHglgi2ckFTo9t5Li
	 z9Yei5AdIy3K989o3Ev6tyPcUnCa/Cwkd8VpUSeu9MC4VcZ8ltJv064ghc0lZl3HAsA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295077;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Syq/VG6u0EUV0TyeNdEvx71To3HzGWr4DnR5Dla39eE=;
	b=CKjcBWY4w8STpSFmJUwsbZ4uiymQG8ikP430WgqI7SFkcEFqIgF+TVqx+Qxs4Fnh5v/S
	 rvvn1Xn+74pufZbf+Nr3EEDE9wlP0/W6FBoICs5wZP6aoqcf+7ZWEP1C69/mfHf6SMHsv
	 wKGXbaoUw2n4jUPoEgQL2n/vdqf5LLNeoEolw+3HR3+VZ1GYBgC7UBKqNyw645H9w58OE
	 ydNl7684nf7QTLWtTsFJCf7lS/xOpmkJs8J/bSp00Y5eDwOZpGCv1nkyxbW5SqzVKFmjb
	 80r49xnh/5BqzQXsT+iIfHdO9s9TNa4wEABOLGbIguzXu59KvB6djn0mblRStlVqv1g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 849A41F00900;
	Tue, 10 Nov 2026 07:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295077;
	bh=Syq/VG6u0EUV0TyeNdEvx71To3HzGWr4DnR5Dla39eE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=L+etW16eG4+4VkLtKAey3K9Il+00A7ulPzRiUHYK0zwbWY4qW6Sl7Gyeej4PupoPU
	 Rrzkj9+4z1pCd8k2OvmqHWg9r7yVM0P7l+uK8ZuCznl14Zuuh6dcz55uZcqGnUSZr5
	 UveUqqpmNjrYtj84skD1UYsPk+KXa4Rhp4lcJQ2dSSM+4ZokNM/djEubGYY5HS0OWf
	 zX1dwhAbRBR97VhFTtRMaoa8B7ctvDyU6hxkKdV1kJGkUScc9xJHrZaht1/VYddITS
	 qX4wqN2NQFQ5VdUW4Msu7+pkbwr4Olyw7g8+79PXoBD68Kj8Zb379QG/KdkQnnUiie
	 mtRraqe5AV9fA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 17F4C48986;
	Tue, 10 Nov 2026 07:17:56 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:17:56 +0000
Subject: [PATCH 1/6] media: verisilicon: Enforce a minimum CAPTURE
 sizeimage for the encoder
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-hantro-jpeg-enc-fixes-v1-1-fc4dc7e985d2@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295075; l=2359;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=JZp96kO/mnNire/RWZRp8mhzguO6gPrOB+RSbq8LmyE=;
 b=GbglH2henZdZbatiRF3yY1AIw0wsgD91zd+CE6dFqdxAa6CQ9mIlW7YOuHV06xHuLDEKep/PX
 H5R85Dp/SW4AAeNQy0bqYU91qBlwXMq8eUa2JVAEJ57N9wj7NLD/zsz
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arun Iyengar <aiyengar1990@gmail.com>

For coded formats hantro_try_fmt() only computes sizeimage when the
application passes 0, and otherwise accepts any value. On the encoder
that lets the CAPTURE buffers be far too small for the selected
resolution.

This is easy to hit: "v4l2-ctl --set-fmt-video=width=1920,height=1080,
pixelformat=JPEG" does G_FMT, modifies the size and calls S_FMT, so it
passes back the 6768 byte sizeimage of the 96x32 default format. The
driver accepts it for 1920x1088, the hardware runs out of stream buffer
on every frame and the encoder only produces empty buffers.

The stateful encoder specification lets the encoder adjust sizeimage to
match hardware requirements. For the encoder, clamp the requested
sizeimage up to the worst-case frame size already used as the default,
while still allowing applications to ask for larger buffers. The
decoder behaviour is unchanged.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_v4l2.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 83af9fa1ce94..c022b978f72b 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -386,14 +386,24 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
 			pix_mp->plane_fmt[0].sizeimage +=
 				hantro_av1_mv_size(pix_mp->width,
 						   pix_mp->height);
-	} else if (!pix_mp->plane_fmt[0].sizeimage) {
+	} else {
+		u32 max_size = fmt->header_size +
+			pix_mp->width * pix_mp->height * fmt->max_depth;
+		u32 *sizeimage = &pix_mp->plane_fmt[0].sizeimage;
+
 		/*
 		 * For coded formats the application can specify
 		 * sizeimage. If the application passes a zero sizeimage,
 		 * let's default to the maximum frame size.
+		 *
+		 * The encoder must also be able to fit the worst-case
+		 * frame for the current resolution, so never let the
+		 * application go below it. Larger values are kept.
 		 */
-		pix_mp->plane_fmt[0].sizeimage = fmt->header_size +
-			pix_mp->width * pix_mp->height * fmt->max_depth;
+		if (ctx->is_encoder)
+			*sizeimage = max(*sizeimage, max_size);
+		else if (!*sizeimage)
+			*sizeimage = max_size;
 	}
 
 	return 0;

-- 
2.55.0



