Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F819EEAA40
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 13:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3HpcoTOv+qfBg+xfI1cbb4POrBPGZsbIU6W8kNHClY=; b=iBjYnetWoumJEnfubsOIeJDePO
	OnpGPqVzZYSWo1kdOhMp7I44X2GbCpenj4V7y79V8A0dPKvqiFSOvZLzFqk/HIGpB4+cR0NDddKt8
	A2ucmFFtJsVyvy2PKtGlFsQvmdxBg1jzvidYVAuWSxKO2tVhK8MLxlHaMIBE7x5kdiEiS1jHphnkz
	kvTjqEigYXYPQKXo7g6br7zAuGaFOkKVSkKW8kwYmU5ZqzQAGQCg4JG8547XI+p4rEw5rRu3phDFc
	jRW/bKMFf90MQHE0evWowe5F2I7OJ9/xP7a+x5yO1xw0NAHOe27W0ys5xe34/2xwm/fUxSp8qpBko
	CcCsvWoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmVI-008UDa-0X;
	Thu, 14 Sep 2023 13:35:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTd-008SNQ-0I;
	Thu, 14 Sep 2023 13:33:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=S3HpcoTOv+qfBg+xfI1cbb4POrBPGZsbIU6W8kNHClY=; b=WEbvueqa5osUqD/tnnf1FmQOsh
	L6NygodMulgHdlqWR3xAPZc6TokhudTGzexatdefc0d34oNhq/Xd5dIX/1QTX/9UVFjGwE3b4VgvD
	dqN4nBmf6C3quhXliHuQux4qerc0NXC3IM4/le9EJgew5M9seMpct/71XBwpBAujBavabEfC5MqNE
	iwK1vf3ZhcOzUnkWj9wK/aFyUy+DaNv91kZ/6iOg+A36BzA2WqRcs06TTY22hqZsh7WBl/bkOKsaF
	f2h8902ZVtpi+7fZo7GLHGbqTdfzRA5OY68zmr99+H7a9o9DyB8yIS1EjqCwmAW+fo5RQUEMWQxVk
	NlWcTBlQ==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTX-007ug4-1G;
	Thu, 14 Sep 2023 13:33:47 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:36f2:37bd:ccbb:373f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2BA32660734E;
	Thu, 14 Sep 2023 14:33:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694698423;
	bh=336tMZ/RUJb+ZhMa2C9VNJt3Yyz+CPMiBOLJjWSuFw8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BRJKAYVXwhZNav2giBo3pXHUXbWZNnNn/esMnZZ2OStWYOMBWFldVyUj23jt/lmcx
	 e5OD6YiVeO6dogFLYdEpRVfL68cYZxjBf4UunxHYT6Z5OMFEi40sl/LW8uJfsn4pQa
	 9i9CW0zfd+Gmr263fTeoi8z1PNRz9Hcznee662yWyritIFcleHr60lxGjsQlLryRwv
	 SBrXXl7CjYX+FbLzW4/TIYhye/FRpmihwZDDAQIDEGvTa2IRfYFGDN7TiwordjsM3W
	 HuQJKfcJPxkLlrUjPVoaVLdP0l660gp2RixoKoKgPlK2y0i/dPy6kDQB3aoq0v2Vih
	 8+dDET6Tb9gug==
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
Subject: [PATCH v7 23/49] media: pci: cx18: Stop direct calls to queue num_buffers field
Date: Thu, 14 Sep 2023 15:32:57 +0200
Message-Id: <20230914133323.198857-24-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
References: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_143345_803904_492F3755 
X-CRM114-Status: GOOD (  11.96  )
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
 drivers/media/pci/cx18/cx18-streams.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-streams.c b/drivers/media/pci/cx18/cx18-streams.c
index 597472754c4c..a7a7e006b3be 100644
--- a/drivers/media/pci/cx18/cx18-streams.c
+++ b/drivers/media/pci/cx18/cx18-streams.c
@@ -105,6 +105,7 @@ static int cx18_queue_setup(struct vb2_queue *vq,
 			    unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct cx18_stream *s = vb2_get_drv_priv(vq);
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 	struct cx18 *cx = s->cx;
 	unsigned int szimage;
 
@@ -121,8 +122,8 @@ static int cx18_queue_setup(struct vb2_queue *vq,
 	 * Let's request at least three buffers: two for the
 	 * DMA engine and one for userspace.
 	 */
-	if (vq->num_buffers + *nbuffers < 3)
-		*nbuffers = 3 - vq->num_buffers;
+	if (q_num_bufs + *nbuffers < 3)
+		*nbuffers = 3 - q_num_bufs;
 
 	if (*nplanes) {
 		if (*nplanes != 1 || sizes[0] < szimage)
-- 
2.39.2


