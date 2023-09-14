Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529E4EEAA40
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 13:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7XtX/sqfuIkG3FCCUjhem5eiV5Jj3Kq1GFr/mKplDA=; b=nOnug/uocvpPSPwPmVjYG/ivAj
	hr6K8L8chQkoO5WoQAYMiXqSjI/ODyLBXyemM8oJbjOP0L6nO6rJmZ7Dmh/ZQHWE3FeXC6vHB+khi
	84V1JdgMhBRrTHg9l5SBwlX0WD3VT/b0TpDeaCzdEn4oMrYBUCOrc0Wfan9T9HYzGRhqAD3w8cnU1
	7Dzci/L8aAR+D6JMY7kmSjoo/lh+qYQRu18p3KceYlXIE+hDnjLc4pcOi6+xdvlkq7DStjPIgOHsL
	1eSFjdPjjdkuvTThJCHfRdTjOQsuYijC+PZJ35Pn9NoTN/oiagAx7p6cKFoqlqHprJITaWy+08WTp
	nMnaaDDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmWI-008VAp-1X;
	Thu, 14 Sep 2023 13:36:34 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTg-008SQl-0R;
	Thu, 14 Sep 2023 13:33:53 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:36f2:37bd:ccbb:373f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7C979660738C;
	Thu, 14 Sep 2023 14:33:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694698430;
	bh=qmWuuxIVaok5VOxLNiFLwq+P2WJDPc3grn0IjW7G8J4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NyhJ2dwtPDfal3GMOCQlY4W+pMVniX4P7qIMMF2pK5OTiWXQXvoNHek/ChDKkrmpE
	 tusvef3OC6i+UUb5ZwxTMrrzLxp3qiPcUN0NVdy6atRpaKm376uwRMwlO1NKwsPND2
	 GZw7MoUDZe9LMrutMBUBRq3tTA6NQThZ4mynhxaJyJWHpirnQ7/VheDKXdUfC9rcyE
	 rgd/MMe+25F9DYK57rnlmNOLCN+0RkhbK/ELmAdQ+SAHxGOkS9sCQFzcxPhdF/MvSn
	 KTDjfMqBcc+M57wKPUWxiyU35uVlabRPlaD505PVFEI/5QqnctZkt0piy+vPOdnCdG
	 n4JHeDZlhgzLQ==
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
Subject: [PATCH v7 37/49] media: usb: airspy: Stop direct calls to queue num_buffers field
Date: Thu, 14 Sep 2023 15:33:11 +0200
Message-Id: <20230914133323.198857-38-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
References: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_063352_328225_44B4612B 
X-CRM114-Status: GOOD (  10.40  )
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
 drivers/media/usb/airspy/airspy.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/airspy/airspy.c b/drivers/media/usb/airspy/airspy.c
index 462eb8423506..e24e655fb1db 100644
--- a/drivers/media/usb/airspy/airspy.c
+++ b/drivers/media/usb/airspy/airspy.c
@@ -482,12 +482,13 @@ static int airspy_queue_setup(struct vb2_queue *vq,
 		unsigned int *nplanes, unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct airspy *s = vb2_get_drv_priv(vq);
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 
 	dev_dbg(s->dev, "nbuffers=%d\n", *nbuffers);
 
 	/* Need at least 8 buffers */
-	if (vq->num_buffers + *nbuffers < 8)
-		*nbuffers = 8 - vq->num_buffers;
+	if (q_num_bufs + *nbuffers < 8)
+		*nbuffers = 8 - q_num_bufs;
 	*nplanes = 1;
 	sizes[0] = PAGE_ALIGN(s->buffersize);
 
-- 
2.39.2


