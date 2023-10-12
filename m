Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E0ACDB47E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 11:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9xb2HxFyj1VWE4LL8F6mZIXiQjdsk4zJ01SDd/HcuPw=; b=IGo9sospeMW4yi3DLu13QSThJ3
	8g12Llu48YV4NcQHZwdggyUEQpiKJ8OtCnMoFJDRBvYkDm98LL3geBL/G+v49mBUjECF8N5slL8py
	TfuQDiscOofwGTJT6edwhtVtRP4yqHMO200A5O9NW5n2pmG1V8yDIE9ShNp9Uezcr2Rx8eMxh/lDg
	ivxdB97Dew4eSUnXD3pPfwyOKTZsxPquMBn8uCsSWKuQNX5vNgb1161I1866QM/W695Um0o5YevIZ
	AL3IjGzMEHg4LQHYuaHsrzB8K5Q4ITuy+2y0FONcKRP69pHH0QCJIvLS48coSKzbVlCQFVc3ZoymJ
	0paLWx6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qquBp-000q39-35;
	Thu, 12 Oct 2023 11:49:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqu9m-000oBv-2m;
	Thu, 12 Oct 2023 11:47:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9xb2HxFyj1VWE4LL8F6mZIXiQjdsk4zJ01SDd/HcuPw=; b=dpJiWojgiWdIXBNo5/PeLctBwj
	WphuYyAQ5hcdrahsQvepHJHPKmNYsK1TkHqQwWIHXjIBBIVhQ+Z6RZpvjUYdNgavRaVsW/iPEST+n
	ElKRVjq2uwUhCRBWLSSomYlLCeMffbY2wAuAf85B+ZsISH9l7gqdIKJYGVBNd2m7V6h9T5f6HUEO1
	zd9rEDiXsDQc4J796wFbBeGWAZpyfqYNp58+J4/fTYYyxuXeMlSh5+xNb+IqsWhfNsSeLv+rr8hBi
	SE0Z24vtlB+nte/cEYAme62VpsHZ65FTIZ5No2u7gPWz0TqXctsQ354XU+7BbemCAWtINyp9lkEnM
	Aj6fZOpg==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqu9d-001nIc-1B;
	Thu, 12 Oct 2023 11:47:06 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7ae7:b86d:c19a:877e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 87F366607371;
	Thu, 12 Oct 2023 12:47:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697111220;
	bh=Jt1mNMm36fegL/wBY23liBF0ngeSMzYwFlorrhK5AKs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ikpsd6wm0YYrF8nGwJim6Sv46Xxi4+ScsUHZDGZGFg11Xq2SIcNnZJuk8JxZjYeis
	 1dDxmHOF/e9SWZ2vztz3EwGYkBzKS253R+V/+GwZ2hWFFsD93tg2yIctLbvp0BeXcv
	 BGYfejgSuF20/iraRJ/0RSvSu5UBlJHtf0zjg5kyeA7bTHO1piM1KbtvRCpHMaT+qV
	 CQQcxvHf/hi49UYNaT/ndwxI53687YmNz08aGpUbvHR1txfHCs8KfZQvXSofhTjT5E
	 uR9MpIn01HNnQiYlZ9l9CkBIdPtUDlyqK5CShCdD4Mzgiz/BXMOwaUjYClBjruaA8A
	 r0IVcbFWDbhlg==
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
	Matt Ranostay <matt.ranostay@konsulko.com>
Subject: [PATCH v11 21/56] media: video-i2c: Set min_buffers_needed to 2
Date: Thu, 12 Oct 2023 13:46:07 +0200
Message-Id: <20231012114642.19040-22-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
References: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_124703_118695_B4F6C13D 
X-CRM114-Status: UNSURE (   9.76  )
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
min_buffers_needed to 2 and remove the useless check in video-i2c
queue_setup().

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Matt Ranostay <matt.ranostay@konsulko.com>
---
 drivers/media/i2c/video-i2c.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index 178bd06cc2ed..0a38b9614764 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -406,9 +406,6 @@ static int queue_setup(struct vb2_queue *vq,
 	struct video_i2c_data *data = vb2_get_drv_priv(vq);
 	unsigned int size = data->chip->buffer_size;
 
-	if (vq->num_buffers + *nbuffers < 2)
-		*nbuffers = 2;
-
 	if (*nplanes)
 		return sizes[0] < size ? -EINVAL : 0;
 
@@ -794,7 +791,7 @@ static int video_i2c_probe(struct i2c_client *client)
 	queue->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	queue->drv_priv = data;
 	queue->buf_struct_size = sizeof(struct video_i2c_buffer);
-	queue->min_buffers_needed = 1;
+	queue->min_buffers_needed = 2;
 	queue->ops = &video_i2c_video_qops;
 	queue->mem_ops = &vb2_vmalloc_memops;
 
-- 
2.39.2


