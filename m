Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301C6C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Oct 2023 16:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qi0nDE9bMNN/N9JtsneH7OSkITzRhDazbSs/TwPJl7k=; b=V4OPtIqnIk5ngnrG++Qxv5v5ui
	lREDqYSmUMzosH2TTZP3TRw8N8F5AiM0GT5bs8UX7knGfwbhk+yZUDc68//m9vXb7n2AfmqixgIPJ
	E4Ml3QUVL5zvG1IiP+ZTZPT16GjAecctmWZQKYNMl3Ul+fJgUvzRHADk0W0/YTuRO8duL7JgEExSd
	J+8AVlcIxDktye24KTQyhqmLnPT3cG0AWIVNufXoyoC36NruXp8mwsFFG7pneydAwFUwmdSe6Z7ec
	9NyAtY4q1OOl0wLGlhmIrjL3AvmuosLxsqeTYSlIpQzNOml1tc7+7GZ9UurmhbTIMNyms9LveWZAk
	CTIJNdTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxrii-005etp-13;
	Tue, 31 Oct 2023 16:36:00 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxrel-005cF0-0k;
	Tue, 31 Oct 2023 16:31:56 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:c562:2ef4:80c0:92f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A3D6C66073D4;
	Tue, 31 Oct 2023 16:31:53 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698769914;
	bh=QC82AXVc6xizeIJsB4Zdjgq5ICrOlS6NNBj04+AQSGQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cZkU1yaD6X7Q0pinG+R4/8/q3wT+GUj3BQ6kKWXxQJfXU0TcceSsl8sOtEtvebV1M
	 5ALA7DwdsJ9GRfJATTS41S0C1uioVBgjnvBz289ZOhMxWmMiWZpMUVoWVkMyjIY2LK
	 Uj0c3Sl0mDNXkMJbCaTWARshcVbqsrBsCgo3nkThNZciYOAw0XXHJmUxzSY9qKu2yH
	 BBduwU8Q74RM4FIl77pghSns2d8nc7zhX9ZNdQPxm36raM+CMRGAt1082qIU1m7iUh
	 szcgEsy/eh7PDzLGjDgaTYM/xW9Oy3TF789dQNmw6bmJGyGQsSF/HdTAwKl8yLqBvZ
	 DnVLcMdlvYVMg==
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
Subject: [PATCH v14 26/56] media: i2c: video-i2c: Stop direct calls to queue num_buffers field
Date: Tue, 31 Oct 2023 17:30:34 +0100
Message-Id: <20231031163104.112469-27-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_093155_432665_5AB2893A 
X-CRM114-Status: GOOD (  10.89  )
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
CC: Matt Ranostay <matt.ranostay@konsulko.com>
---
 drivers/media/i2c/video-i2c.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index 178bd06cc2ed..ebf2ac98a068 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -405,9 +405,10 @@ static int queue_setup(struct vb2_queue *vq,
 {
 	struct video_i2c_data *data = vb2_get_drv_priv(vq);
 	unsigned int size = data->chip->buffer_size;
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 
-	if (vq->num_buffers + *nbuffers < 2)
-		*nbuffers = 2;
+	if (q_num_bufs + *nbuffers < 2)
+		*nbuffers = 2 - q_num_bufs;
 
 	if (*nplanes)
 		return sizes[0] < size ? -EINVAL : 0;
-- 
2.39.2


