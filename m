Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28E8C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Oct 2023 16:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cIauNEfyyc8ygY2CYOkqXtpUWGt5kjIwrFn6YVVwin8=; b=0A043v/VVxxmO0h5dbht38h+Ve
	8pgeNFt+HGaNbEmQwmCZrTzXQ0KqXy4DnJ0xRJfkVeKg05N7quQRPI79jvo+r21/vM/3kNi33M7WJ
	+YawiwN8Iw726s4qrxJieCrqhXTSpOkY4xicS3B/kuzBz9MiJ6izpVlfhFnWdI9+5JoBn9pY92jwZ
	YJsgi3wr6XWHXsbTrnTwZqg6qeMqBFhPQBjbUnMq3R4L0RSzc8o2wwCVApOqiC+ri4wAQ1zQAvBq4
	v3gWsWDYqfrW+kHfQcUDdoCs7RG7MX+2dE2WNG3/9Zy3b6R/MJ/Ie4Xy2b5JpLsTOLAsFQEnE903+
	mYOeSZ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxrlb-005gQF-3B;
	Tue, 31 Oct 2023 16:38:59 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxrfP-005cqb-25;
	Tue, 31 Oct 2023 16:32:37 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:c562:2ef4:80c0:92f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D589E66073CB;
	Tue, 31 Oct 2023 16:32:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698769954;
	bh=KPoxd/SvOk21SjAKuo9XuAAvSFR2sEuxtH4tG5ksUhg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DpcRlo+g4zRXEYOU+WftkbigSJXhl2DKpriogjse66Na81yCRc8ckOsxrJsuNqmsh
	 ahmm4pnVx/ek+QMvXnX1zspZIlmexmrb+gTR78PgWsbEluJXieHA6XErfctUrMqwW2
	 hpx61fI7ObqfD48kfQFNCRIlS9/+QNjhvoTDFZnhRdiDkPZm3KWelD6Qr11ridmGFm
	 BdmN7aXIizxfjWSCHN5KIsLOj57mBNjCqNc3tDIVd3mhY+TWwDRQyF0MUhDgVAmwJj
	 9cVhAk0tOXEpNb9jkPK9bv4rj9+ykcyEzACOUF1GQfTIXtGsDbFZ+L2U7BoYSygClV
	 dLh3PLiXKnBjg==
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
Subject: [PATCH v14 42/56] media: usb: usbtv: Stop direct calls to queue num_buffers field
Date: Tue, 31 Oct 2023 17:30:50 +0100
Message-Id: <20231031163104.112469-43-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_093235_838832_74CFA0A1 
X-CRM114-Status: GOOD (  11.84  )
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


