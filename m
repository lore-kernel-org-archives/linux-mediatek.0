Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25886CDB487
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 11:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B09KGIG+dGa9eyLZuv6Yc26Yj7bDl61pGIsQ9S5qtwY=; b=O9Q3fVJyIY95C8tGV+jyUl9Ura
	mjnutbWVfRa5Q5mlQ45joriYX5JusUjhaB+iebIUpDyqKJCjh63KmcmJpQPYq6gTdi12Os+/AIuSb
	nus+/KC7KSCvFvMlqNVMPxizH+WmdSy1bO8AYbrxyq75u27swsjQBGSxJrLwn6VS0qAX8/fC+yZhU
	mWlsafM/FzduUeavvKwDyhtj66Sq5d+i7N+1EjfDGKOuwjYNUU4oxJzbsNe/F9c0FCPMKmUY91WFj
	tZLdtow+xVuJSHbcjzsyCMFnSayu18rgG8Tv1nFTXcQ+pcivki1uhQSUSKhkzRhJu68vKFE5JA7ey
	a0UKHTGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qquAZ-000ovs-2a;
	Thu, 12 Oct 2023 11:47:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqu9f-000o2l-16;
	Thu, 12 Oct 2023 11:47:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=B09KGIG+dGa9eyLZuv6Yc26Yj7bDl61pGIsQ9S5qtwY=; b=HAN/5F54bO2g7Dnq/xdEi3C/S1
	MAfql+6doPrECQF3/N+iqUMzx9v9i56gfGk19eT+vgcZLseM7Dqg4+cGUPP3xHKZ80wLZeks5/tzV
	4vqtkYIZb3BKm/yQFEnprPCR5p6uOvq9ZCc9ae/tXgE/JX85CHuZLTZbU5kliDt0bZMXNGN9N33+K
	KujLhG8vmB7FJyOAYJKu5I7oUoA/oFz8ygOr7iuyq1FaobNEuE6V1n29UfqGIflpS5CIm03SwXRA2
	CsAs33xSuNq5weouvYl85Jfzx3m0oFsh8WoegFWgQPKVN11kTRkU507tdHGFU0HjiiIdaEkesvfm3
	8Jb+bYlg==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqu9a-001nHK-1z;
	Thu, 12 Oct 2023 11:47:02 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7ae7:b86d:c19a:877e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B96386607363;
	Thu, 12 Oct 2023 12:46:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697111217;
	bh=Hv6K096kuas0tXEWfFOtf8PobL2avYs7g7RnPKhbESI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZjxLpWSveTl5mI39YW3w3hnP4PhPurR3mMTD6rz5mEIWqdX9O6WD6n+3CP83NfN8y
	 epDyHS6WEw80cpQwfEfnCl1XUvTLXAHsGwpe10zZ7/7kzfBEbvkuLF8V6r585LLz5w
	 G7i3jTLIucF3X/OG4OWcenlXnCpI+gxPa/AwfI5KiD6NMEiK8enGegE0t50PmTT1AO
	 3Nfl+vYuqmUn+dxI3uu2OTZhHM8nIO5sCEn08tN7bxN79PYW+lZck69jHI/9XFpeLl
	 T2Q/EmJD1HGoi8TXEuWFTiKGDYzD2GgLI+OQcPLVZXjHw1GsaU33jHcdf4tnc7e8/h
	 qagE1kl/ECLTA==
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
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>
Subject: [PATCH v11 14/56] media: sti: hva: Use vb2_get_buffer() instead of directly access to buffers array
Date: Thu, 12 Oct 2023 13:46:00 +0200
Message-Id: <20231012114642.19040-15-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
References: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_124700_330780_14F3F4D1 
X-CRM114-Status: GOOD (  11.48  )
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

Use vb2_get_buffer() instead of directly access to vb2_buffer buffer array.
After each call to vb2_get_buffer() we need to be sure that we get
a valid pointer so check the return value of all of them.
Remove index range test since it is done by vb2_get_buffer().

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>
---
 drivers/media/platform/st/sti/hva/hva-v4l2.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/st/sti/hva/hva-v4l2.c b/drivers/media/platform/st/sti/hva/hva-v4l2.c
index 3a848ca32a0e..cfe83e9dc01b 100644
--- a/drivers/media/platform/st/sti/hva/hva-v4l2.c
+++ b/drivers/media/platform/st/sti/hva/hva-v4l2.c
@@ -569,14 +569,11 @@ static int hva_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 		struct vb2_buffer *vb2_buf;
 
 		vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, buf->type);
-
-		if (buf->index >= vq->num_buffers) {
-			dev_dbg(dev, "%s buffer index %d out of range (%d)\n",
-				ctx->name, buf->index, vq->num_buffers);
+		vb2_buf = vb2_get_buffer(vq, buf->index);
+		if (!vb2_buf) {
+			dev_dbg(dev, "%s buffer index %d not found\n", ctx->name, buf->index);
 			return -EINVAL;
 		}
-
-		vb2_buf = vb2_get_buffer(vq, buf->index);
 		stream = to_hva_stream(to_vb2_v4l2_buffer(vb2_buf));
 		stream->bytesused = buf->bytesused;
 	}
-- 
2.39.2


