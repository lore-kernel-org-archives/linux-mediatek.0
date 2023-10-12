Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A30CDB47E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 11:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mZs75sxNyEMKxgyp24DosHVVPoQJidrdHhoLAIzZ8gc=; b=uNT0590K2IewOgUChCV7Wv8LFR
	NIvSJDlsD7OdrHJO/88MFgUSpkza8m2eyl4wV5ESCYGDj59Jgis09sTM45DjkAAHH+H1nbQ/Vtsk3
	UvY881SMp6ZeUTARsRK/oC/OAbImg0Vy3vaVzVAIffGA6LLQ3hDDnbaztnY/mYY3j72LfSojAYvmv
	nj1wbAwp1BSRsTDUKGZhAhTfZexkfpVpf9yVcZHoI4As7YjVaKbN89Dw37jxyH76q8IfzzPnWnv3m
	egiXTeqYT1H8eZ6P9FMC2CPSxdbol4bQ91Fupc16vABo5xsZtMwIzB69BuF8kA3S9LAYiIb5G5Zs4
	y9At2vOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qquCY-000qru-2a;
	Thu, 12 Oct 2023 11:50:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqu9o-000oDF-3B;
	Thu, 12 Oct 2023 11:47:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mZs75sxNyEMKxgyp24DosHVVPoQJidrdHhoLAIzZ8gc=; b=hSt5z9S6RjDXsQ3jN1d1lt33G2
	6h6tuXHaEDrFH7t1c7JmRZyo8tYzPMKTK5SFo3uaFF6lh1r8ASVvfk5fK8Dt/aqD0iFDW1CIAoiWf
	z8FfD9qfi/mlfchDbD/d8/Xw6mwsAsWWhOGlMY/mIPHxQdd6r7OLVlsNNaYB69/XFYiugEo4OQMWV
	AVbSAOwAy5pwR1ZjDy1mQNGrljQgpkpDDdv5Qs+Vy5T5WmT6M+HJ/QYmex3U0O1mqvTjjWTw21Y6t
	C0ZABj41jfmelQgVYYGzEzi+hCOgwi1ckjQ1JQURwoKWM5zvr3/KXgxFYrEk+FuwH19pD/zw7XMVM
	jWQbTWTg==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qqu9l-00GgrT-HP; Thu, 12 Oct 2023 11:47:11 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7ae7:b86d:c19a:877e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EC0CF660738C;
	Thu, 12 Oct 2023 12:47:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697111227;
	bh=2/0WQage6iY7ZIfSwpoGdnzQlJzC1UZq8fdQbr8LRKw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L8cYZ8LKwxDdQJC/fkFna0Z4loJWQY4rlLc2nv/Iu86jK57Dgo5nLbgWL6uzreecL
	 kXVb7RHCUVlKxJXrPlrZTBFj0wjGyXvpXiK45iRJ3QADd1AjZvZTBkp4lJ47u1w2tz
	 8LSUo+83BEFBQ9rAZKDCL3bHB+qY/PPmhiOLoehJZIQtbLpsWqyyk8XPRxj1K1ZTbY
	 xBeynsjCo2i/JM5xiLNWE8A8rfak1nxqGNM5ADSU/4GokgPl+JIZaITV8jQKANfJXE
	 vR5aneBs49rxfpAOgs6fzUVB2eslLVMTPIGMR8A6GyzQlfki+NJE+lFeWQ+IidYIrS
	 iFucW8Q+HNdxw==
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
	Antti Palosaari <crope@iki.fi>
Subject: [PATCH v11 33/56] media: usb: airspy: Set min_buffers_needed to 8
Date: Thu, 12 Oct 2023 13:46:19 +0200
Message-Id: <20231012114642.19040-34-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
References: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_124709_660669_797E38BD 
X-CRM114-Status: UNSURE (   9.69  )
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

vb2 queue_setup checks for a minimum number of buffers so set
min_buffers_needed to 8 and remove the useless check in
airspy_queue_setup().

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Antti Palosaari <crope@iki.fi>
---
 drivers/media/usb/airspy/airspy.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/airspy/airspy.c b/drivers/media/usb/airspy/airspy.c
index 462eb8423506..56bc1b23d39b 100644
--- a/drivers/media/usb/airspy/airspy.c
+++ b/drivers/media/usb/airspy/airspy.c
@@ -483,15 +483,10 @@ static int airspy_queue_setup(struct vb2_queue *vq,
 {
 	struct airspy *s = vb2_get_drv_priv(vq);
 
-	dev_dbg(s->dev, "nbuffers=%d\n", *nbuffers);
-
-	/* Need at least 8 buffers */
-	if (vq->num_buffers + *nbuffers < 8)
-		*nbuffers = 8 - vq->num_buffers;
 	*nplanes = 1;
 	sizes[0] = PAGE_ALIGN(s->buffersize);
 
-	dev_dbg(s->dev, "nbuffers=%d sizes[0]=%d\n", *nbuffers, sizes[0]);
+	dev_dbg(s->dev, "nbuffers=%d sizes[0]=%d\n", vb2_get_num_buffers(vq), sizes[0]);
 	return 0;
 }
 
@@ -1011,6 +1006,8 @@ static int airspy_probe(struct usb_interface *intf,
 	/* Init videobuf2 queue structure */
 	s->vb_queue.type = V4L2_BUF_TYPE_SDR_CAPTURE;
 	s->vb_queue.io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ;
+	/* Need at least 8 buffers */
+	s->vb_queue.min_buffers_needed = 8;
 	s->vb_queue.drv_priv = s;
 	s->vb_queue.buf_struct_size = sizeof(struct airspy_frame_buf);
 	s->vb_queue.ops = &airspy_vb2_ops;
-- 
2.39.2


