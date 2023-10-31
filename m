Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FCAC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Oct 2023 16:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ts99oHtPdgNsMvrVJzeWI3ReICZfm5oisnFd3nbTPcA=; b=NFpRMOfE/PUP8dblp5dFYqR17w
	mIafiMwZu0CulL6ZsEZOzCD/pAwvylVieoSJ3ZmtaSRjFkF4/rz5QdJX7nludsbmwjosuN9tAVg4E
	IzHLQa38NVx9rhAamUd1CmRJubgbEANDWU92rigyVnKRoJlUTQ4QgG5IDEfmTeALkuzhqgJNB4IfA
	nsLE2oZ2z2OwwYuxnw//ch2dnSHUCqNsTrLlFbG8BEupE1qfmrb8Vq+SQgTTs0U6pghd6/NErU6Kq
	60IdIrXCjnFkgq4SWTOFtpUJvTRGbSndawkKqxptXa6lNNcesZPwznmgYev1XxTpXeUnjbeXozsKa
	LXir82Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxri1-005eUW-0c;
	Tue, 31 Oct 2023 16:35:17 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxree-005c88-0p;
	Tue, 31 Oct 2023 16:31:49 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:c562:2ef4:80c0:92f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AA99A66073CA;
	Tue, 31 Oct 2023 16:31:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698769907;
	bh=E5t1fwehdK/+tA+H+9HRw8QC5ks/Zk2E0Mm8Cosvu64=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aOLb/kZi84KwygRqKPOTlZTb8hehC2pipcTIVM4XC7p4yzcFYVasbGADTTfDNl6LN
	 Fbhms33tFrb17yu2BwejjQ6Qe9qasy/Ty2iseT8B5j958MDVwMZJnwgJLR8zflO1ZY
	 iSEQuPzjuOuOg6rMQruhMv1IM2ABUi410FwFca/l5ZylPitJuPaY7eGp6l/ySqg7Eu
	 P+tDHT8C+Gu3yhy3Sk4O5XEzWMrLS3k2h9xMtgbsxWxFj5VMCqcjlCs7nFRiDF0aZe
	 wWByhFzn7U6UibrAq/9nSPp4UfEnTefMFSjxkoScGLwHkw8WgTc3Q9eXueErIOVvCv
	 zWzUOhLREPfrQ==
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
Subject: [PATCH v14 22/56] media: pci: tw686x: Stop direct calls to queue num_buffers field
Date: Tue, 31 Oct 2023 17:30:30 +0100
Message-Id: <20231031163104.112469-23-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_093148_421487_0B7DA287 
X-CRM114-Status: GOOD (  12.35  )
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
CC: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/media/pci/tw686x/tw686x-video.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/tw686x/tw686x-video.c b/drivers/media/pci/tw686x/tw686x-video.c
index 3ebf7a2c95f0..6bc6d143d18c 100644
--- a/drivers/media/pci/tw686x/tw686x-video.c
+++ b/drivers/media/pci/tw686x/tw686x-video.c
@@ -423,6 +423,7 @@ static int tw686x_queue_setup(struct vb2_queue *vq,
 			      unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct tw686x_video_channel *vc = vb2_get_drv_priv(vq);
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 	unsigned int szimage =
 		(vc->width * vc->height * vc->format->depth) >> 3;
 
@@ -430,8 +431,8 @@ static int tw686x_queue_setup(struct vb2_queue *vq,
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


