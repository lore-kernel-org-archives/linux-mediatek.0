Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92056CDB482
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 12:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qi0nDE9bMNN/N9JtsneH7OSkITzRhDazbSs/TwPJl7k=; b=WYE3aoDhynGlNSmCHLvBKj7Gv5
	JYRXAKElhPx8kQnrUqoYrij5rV8Sr4GsZO2NwIecGOrPZ9/NY1DlgaQrLXf2lTKM8Wrth0Ws3k7sO
	K2SQNmf9fRaw/KKrKoEeMITAZo71Wz0YnRHFuuKC5ASmYME0ukUnwqpPnHVpVpnh/MCVTAW0JAc/V
	d0trD4roscae9MJAeM6bxK/TXJNWqOumWfc/Y4ARFMnbYIMhP01jBYcUIar/JMTRJ3xL+y2qzoYOE
	Nu3cOF553Qe1u25Xngtu1QYi7Qnuc0S6ddTjZvFkbUOC3C8skoWvoTzmDCtUUNvtelcb+dH3pMiEw
	YsPE/OXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSaH-00HRn6-1n;
	Thu, 19 Oct 2023 12:57:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSWK-00HNjD-0r;
	Thu, 19 Oct 2023 12:53:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qi0nDE9bMNN/N9JtsneH7OSkITzRhDazbSs/TwPJl7k=; b=FAj0f4ax44pgjdSYzr0fv4sS9G
	h0FHPBaGWyloZTjeCPNtao+a0WjWvSZJr/hgiwY8rOAjxP5mAstqb+w7SxPQ1pR4YPIwESTelSVTb
	34vuH+zjqH+I8c7N+EZZWtvXHRep04PYeRXLwltMW+7N34kGRQwd87YeQncHgsg2jWe0yfDu895Nc
	4gBwAAbffBGkRPn3iaEWDsaLmPuh0bhcVhsN4KXrDlsEZ1OTpK75RrwqoCZKR/DlsDJMrYsbLjf8h
	1SV1ikBKI9ghHYTkOb6fbo7OnXj1W1NXtO1494Qrp9wOmaOzMoFNNd4PHZc0c6XCEPnWXIXEWbXbr
	rO+XAB8A==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSWC-009rTc-32;
	Thu, 19 Oct 2023 12:52:58 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:ccea:1fb5:34eb:239b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3099A660733B;
	Thu, 19 Oct 2023 13:52:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697719964;
	bh=QC82AXVc6xizeIJsB4Zdjgq5ICrOlS6NNBj04+AQSGQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nzQY/3yHzKSqzUJ/818B/ENYDwEWXb655pNJKShse15WkbIBah45tDltRimhXDOXF
	 FFioq7uxFmA0d6hPu9kCRES+odyRSa5DYsBqZTgfx9Di8kv9CuQd7GHdDzWfpLv4r1
	 yBrxjpXxhTBtwv2ADBTWvM/zhsKq14hELbsLn9dQ+G8030syc88oa/huHOH8T3O7Eq
	 6B9ESm9mdABUvtWaNw0vZoitj56FLQBeR8R/i2JBNFCzOyEKAizyyl/1zNoItuLMEm
	 aeZf/AIzspP8ZOuxl1UM/8ERHd3GpdpiYxReKsHVsELRgbSTrJty2EGggxtswHr+k3
	 cUMcw8VBxTscQ==
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
Subject: [PATCH v13 26/56] media: i2c: video-i2c: Stop direct calls to queue num_buffers field
Date: Thu, 19 Oct 2023 14:51:52 +0200
Message-Id: <20231019125222.21370-27-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
References: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_135253_463485_473564C7 
X-CRM114-Status: GOOD (  11.60  )
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


