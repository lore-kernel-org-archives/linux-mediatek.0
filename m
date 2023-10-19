Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8034FCDB482
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 12:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cIauNEfyyc8ygY2CYOkqXtpUWGt5kjIwrFn6YVVwin8=; b=uQBH54+Z+RqN/dKOTiR3uZWixh
	EIPFFEiuydx7UPIsrABkkQ7MRxaQNe1pWsDw5Hqbf+LtGKV2hLtFzJx1DvWQD4M/jCzat8fBTrdsp
	QSViqt2bOWuqh0iRSHnQ398R7JKrjMxGjV2SpCHplH8V22NCnQxyI/IKqxlNcnXAZ4W4vPgNhlyE1
	nvYO3O5EHXT3I1ozF22wbOfBWwqz9f78rhpOUIkEJRvHhKPtGtZhxn6oK+0REbU09rMNn8fPWzC4a
	+el4TD6SOqIs5ldjpBjlwxi+M4lI7LM8CldLG2a+IDp0FLgetXFIcOoiTru2bWVesAq7rL8ldX63T
	zbOBfJPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSaA-00HRfz-2R;
	Thu, 19 Oct 2023 12:56:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSWM-00HNmQ-1w;
	Thu, 19 Oct 2023 12:53:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cIauNEfyyc8ygY2CYOkqXtpUWGt5kjIwrFn6YVVwin8=; b=Q8RwPE92Z9NaB1Ih2wFryzt/mX
	lbA2zZTczkZ/6hGE4E02E5yMaEmPY3ZLt+AumSKvp+SbV4Pb8YwvfVpPrSqGOAx2n6p1UD0aLau9i
	ZSh8WqJ7j0bFhK56vs0mvj143Z5jL2ZN1TmUwpeaQKxcizQ+8VQcZuTwsTwzO56zsrLd3GNlojhya
	Xq6IDCWuFmhn/AjNZ+gYfXFPHh/2y2w98EJdwWCMeFSP9g6JVBurF0dhERtLc4r514MMeoQJXI2iD
	NYYh9icmCphdl4G+gQvqimf/8tGiHalSuWKL58jq5QzaMzP7z8ejpcZ3gxccKWHI/DZbpRzIwA+CQ
	sDKuwHAg==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSWF-009rX0-0W;
	Thu, 19 Oct 2023 12:53:00 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:ccea:1fb5:34eb:239b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 825A66607387;
	Thu, 19 Oct 2023 13:52:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697719972;
	bh=KPoxd/SvOk21SjAKuo9XuAAvSFR2sEuxtH4tG5ksUhg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WNb2jdJZv+aIVwQ2TG0qLbsO44v0MNz6zFaBmdmv3PzVoLr7OfAB+/Z/+VorUA0J8
	 LuqF3pyZViUGEsjYYnFMkksprTGNBEvcGEe6z3ghkM6UHN4aIWnH3dBBqHJrl1qOa8
	 W/pvthI71yevvtGdbyp/VQ7ajxAEEfneNG/tXg/nxE78Ad5AxTi0avalXcklq5wUUQ
	 AIvhZCygpXVtvcmYQq3OrGwRbheJ1xKGnRrGBHTO1nOh5mm8rVvFPgItNBPvE3JHSC
	 SPhrDksE+xGaoNjgO5kWOMqV3eoejokQVFSaCIx2pTs3Sw4Bhc/9nYEvcI6mGHbInY
	 gf+zENHt0M00w==
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
Subject: [PATCH v13 42/56] media: usb: usbtv: Stop direct calls to queue num_buffers field
Date: Thu, 19 Oct 2023 14:52:08 +0200
Message-Id: <20231019125222.21370-43-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
References: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_135255_356158_BFDA079A 
X-CRM114-Status: GOOD (  12.08  )
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

Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
This allows us to change how the number of buffers is computed in the
future.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/usb/usbtv/usbtv-video.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/usbtv/usbtv-video.c b/drivers/media/usb/usbtv/usbtv-video.c
index 1e30e05953dc..62a583040cd4 100644
--- a/drivers/media/usb/usbtv/usbtv-video.c
+++ b/drivers/media/usb/usbtv/usbtv-video.c
@@ -726,9 +726,10 @@ static int usbtv_queue_setup(struct vb2_queue *vq,
 {
 	struct usbtv *usbtv = vb2_get_drv_priv(vq);
 	unsigned size = USBTV_CHUNK * usbtv->n_chunks * 2 * sizeof(u32);
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 
-	if (vq->num_buffers + *nbuffers < 2)
-		*nbuffers = 2 - vq->num_buffers;
+	if (q_num_bufs + *nbuffers < 2)
+		*nbuffers = 2 - q_num_bufs;
 	if (*nplanes)
 		return sizes[0] < size ? -EINVAL : 0;
 	*nplanes = 1;
-- 
2.39.2


