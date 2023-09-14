Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E31CEEAA41
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 13:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=quVGyklw9qjYlLNKcyjosW0fq/RVVduGZ4UbV730Ido=; b=xy3fCgEA5ZNQhGF0lUxr5KV3F3
	nSdoxAa47t2doEtaYTRUdJYSJv3Kr97LMlN8VlkDaPP+SBM4YdWsQaccOB/TZLwkn2sIePZfzgmI3
	uYGCwubjqbcU5LuOl4cn72RxVFuTdGC24UNR9b3QDMPhK5FcTzD/1uY0iQSOgZQ0u/1i18ZDj8dml
	++Yx2gfi+BEKWM+e3DIV59VqFcyM9lZWsV9yCnLwPHh+JRiacmV6nMwnO+cYm1Z3WRgm/vEHbmTW2
	rSRgarrgqp8BIow+uA8OJHJvZMSvuHkPVEp4DF4BojrwY+SkCubrBmThlWDQYO57v+aUP8sUW5fsF
	2EG3OIkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmWb-008VYL-2k;
	Thu, 14 Sep 2023 13:36:53 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTh-008ST6-2X;
	Thu, 14 Sep 2023 13:33:56 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:36f2:37bd:ccbb:373f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0D7676607350;
	Thu, 14 Sep 2023 14:33:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694698432;
	bh=8QdmTHdgoaFCZ92hWXIEL9hOaDrX90tCZOqZYUq2PdQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hIrpjdHHkd8DCsezUS6Db1t2mu//j9qGKSeanMJQE79X+olRQO4KTQpC5RaEVpaXZ
	 fuztA6tGqvwzZ1PtMQJtqVn2jR+bbTJlozFixJYdu64lOLpfm86pNS0Htz0Spop+Oh
	 Wd1Wevs9N5g1gGaXwynNkHxF6L1jjDQwlDyEa/bRvVS/GpyU3vGcaZXPNLG8YMeiEu
	 5/hrxlneaY3Pi+0si5lcj1NKHcHZuEhgQhhOdftaYznfEim3yrOBNLzUa5vLyhLISI
	 8jYt914ufA6p3QiSz+BypCIRLDedkOW6MUxydy9ude1UD5XADaX26eJ8LV+b3sRizY
	 n1nNnWMdKdXeA==
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
Subject: [PATCH v7 40/49] media: usb: usbtv: Stop direct calls to queue num_buffers field
Date: Thu, 14 Sep 2023 15:33:14 +0200
Message-Id: <20230914133323.198857-41-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
References: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_063353_975119_D3BC7D78 
X-CRM114-Status: GOOD (  10.96  )
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
 drivers/media/usb/usbtv/usbtv-video.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/usbtv/usbtv-video.c b/drivers/media/usb/usbtv/usbtv-video.c
index 1e30e05953dc..41704d45c65c 100644
--- a/drivers/media/usb/usbtv/usbtv-video.c
+++ b/drivers/media/usb/usbtv/usbtv-video.c
@@ -725,10 +725,11 @@ static int usbtv_queue_setup(struct vb2_queue *vq,
 	unsigned int *nplanes, unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct usbtv *usbtv = vb2_get_drv_priv(vq);
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 	unsigned size = USBTV_CHUNK * usbtv->n_chunks * 2 * sizeof(u32);
 
-	if (vq->num_buffers + *nbuffers < 2)
-		*nbuffers = 2 - vq->num_buffers;
+	if (q_num_bufs + *nbuffers < 2)
+		*nbuffers = 2 - q_num_bufs;
 	if (*nplanes)
 		return sizes[0] < size ? -EINVAL : 0;
 	*nplanes = 1;
-- 
2.39.2


