Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D938E82CA8
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Sep 2023 15:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NHwNkhr5QFK9GIbxnuRVaaAZiMba2Wdss9SCt91KwfI=; b=ec7XFNA/2bNOrvEBhy4I7YoaHR
	Fx5UPUrwQhqqu+5WEsOlgR4B4R/HvM/tsrXBLQkwRG0m+YBx2t6eFGgNBJuXsr99z5LHbeXVzMLkW
	NSSrstStW5fSCZtQ/80VyhwCWPakCDb3tc/F7oAxxZFbK8Wpg+DvGBN6YVxwN30nvFQjEG71JyZt9
	iFhElWr0Uke/AvCG5d/1/Upz1tQKqOkYNbbkH+zZRryfn9hdz3YDgc78GzlxlhUYVSQcDgjizy6g7
	/hV5nse2EZtmFzo28s9HLcCeB8vZnGRLmQJ8ZA0wUsWiSQ1L/KfNXmfatolOE0REyNwNK0QEMaJev
	qk4EneGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWek-001L5F-0b;
	Wed, 27 Sep 2023 15:40:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWah-001Gnb-2s;
	Wed, 27 Sep 2023 15:36:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=NHwNkhr5QFK9GIbxnuRVaaAZiMba2Wdss9SCt91KwfI=; b=nHkbo2eQA7pRa0wxpxVYbALDV5
	W6iA1IxdXB24eHhy7UmddIbOdIULRF53i5WmHLNFmmfih9foCZxEWDmdHnr3OooGypU+QnCXg9fXx
	kHoDH3E1G/V9LUvvMGZsTHZ2CIeXMv5tNBHHwU08DBJuXnknPOrGgNtjJKSk1SxYUtRkoxivO4Sh3
	Lux7AXYyoSr0P+phdB4VsZvq1v/+iVrZo5Qw+RYHquqkk2J1+cv0DoKBWMO1rpykcLTFMk4NkCvam
	xGH7d6p4qpVqgXP7lIlj2ALgY97y0cuZ3GABcH4AK2AXsAnQtQnk/p5PgHA1YGgSn2mDJIpoNr6m3
	Qtlt8WTw==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qlWaW-00EesU-VO; Wed, 27 Sep 2023 15:36:42 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:672:46bd:3ec7:6cdf])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 15D256607342;
	Wed, 27 Sep 2023 16:36:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695828990;
	bh=/cndzbQG0EfdVraDFE6iiWONWcwO1/xN2meedcRh5A0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TUGJ/6njYheEyRBcrcxVhaOeEcM1pEN+WH5MDCkOlOULZKJUl+oOvWpkW7vq9dWa/
	 wEWHQK6BR0F3pUnhnDZEtvx7vUnE+3WCTFnVjW0H1+/QbrdS+2u0dM2uAFhnLxQF0q
	 n8+N8tteqDcaGUASkIPoDXtxy1Oopytsx04d/YGrS3Hw0sD1jJSTlozBnD8UKQR3BQ
	 xe5fyhLA+M6/LfBmkJrDcfAzmZ9LudXFIgA7MSrarwHgqz1CBc7CrxCbV5zX0X3L0B
	 VrIIGcHlxkaPxNUmEB8T8/GXhfQLy13Ajw9f5mn12L+J8cLdf5EfGQGN4k10MPwtfN
	 ehDf7W0/j4bLQ==
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
Subject: [PATCH v8 46/53] sample: v4l: Stop direct calls to queue num_buffers field
Date: Wed, 27 Sep 2023 17:35:51 +0200
Message-Id: <20230927153558.159278-47-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927153558.159278-1-benjamin.gaignard@collabora.com>
References: <20230927153558.159278-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_163633_093450_B50DF522 
X-CRM114-Status: GOOD (  10.11  )
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

Use vb2_get_num_buffers() to avoid using queue num_buffer field directly.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 samples/v4l/v4l2-pci-skeleton.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/samples/v4l/v4l2-pci-skeleton.c b/samples/v4l/v4l2-pci-skeleton.c
index a61f94db18d9..a65aa9d1e9da 100644
--- a/samples/v4l/v4l2-pci-skeleton.c
+++ b/samples/v4l/v4l2-pci-skeleton.c
@@ -155,6 +155,7 @@ static int queue_setup(struct vb2_queue *vq,
 		       unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct skeleton *skel = vb2_get_drv_priv(vq);
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 
 	skel->field = skel->format.field;
 	if (skel->field == V4L2_FIELD_ALTERNATE) {
@@ -167,8 +168,8 @@ static int queue_setup(struct vb2_queue *vq,
 		skel->field = V4L2_FIELD_TOP;
 	}
 
-	if (vq->num_buffers + *nbuffers < 3)
-		*nbuffers = 3 - vq->num_buffers;
+	if (q_num_bufs + *nbuffers < 3)
+		*nbuffers = 3 - q_num_bufs;
 
 	if (*nplanes)
 		return sizes[0] < skel->format.sizeimage ? -EINVAL : 0;
-- 
2.39.2


