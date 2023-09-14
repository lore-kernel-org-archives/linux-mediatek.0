Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD72EEAA42
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 13:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X4wPFySt/lU5j9AkoHLhqGTEN8n0F3jcw+kxHilaaRg=; b=mLX3AesosdGxTdJt+JiJG7CVSV
	NN8XsSXaxeU4rlZlZg7UgomgTQvkxdJAzjU6pIFzBYkHJh6R9LMpkUEAro/bC4ndKPRFZi68LrexJ
	AQ0UtjJPgpTNah9p61I95DihAQyDCJhZrqti8hzItKgGscq55EPmYdMluGiEYODvmMLvB/By4izes
	AJgIWTYD27LVMmDjRyQiYD72XReF08NjhPS2w+L9yJWo8W1lHiVYBLZrj4FQdii8OPYXkF0NMjUW0
	cXc5ZA7M0q26krBU0qpney3W1a4QhRZAa6jon8Y3yIt/xDKWrRFcLJo55CeHrwk7GJcJDODTi1udC
	ukYzjztw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmVJ-008UEt-0g;
	Thu, 14 Sep 2023 13:35:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTe-008SOm-0Y;
	Thu, 14 Sep 2023 13:33:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=X4wPFySt/lU5j9AkoHLhqGTEN8n0F3jcw+kxHilaaRg=; b=GPe2jZi/MWkrlLP18Q/pVJ0Hz3
	4gplIu9PpOrgTaC6WZ2gMg/G1YdcgSPRLW9kRCY1Jv/qwGmFnC+P1vwGzS49O6fl9DF+gZ5SrMKPk
	WopJWt9tefjKL0kqb4Y5ZqrdZ396TNosACQDDZ3vlho6E45sP7Fi5XnyjoGL6tOkSy3ocu84bMxJ6
	VxE20Z9C+FyQRlki9169gDFzbxOmyCWkViGoaIU+H4vC8HloVtoNdbKDjmNhdZKg4PbRfGnLDlVj4
	HygWV6S+3MmQU15NSgL3u1paiH0HYiLuEtsGPzbqBiXXLo555a8js6hOeZDesS8uJCXYZdR0lyBH7
	wsE5Ytog==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTY-007uga-1u;
	Thu, 14 Sep 2023 13:33:48 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:36f2:37bd:ccbb:373f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B5919660735E;
	Thu, 14 Sep 2023 14:33:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694698425;
	bh=KMPzPsH6nYT59+TnmiRbCQNg0tV3gkCBNX7OoLfQWFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n56v+JXLtBEX5Ogmuyno+QnMPo5soqucOknczK2gLaEl+yd79iAC9D4AfHRPTuCtO
	 xJjcxBuOKoffcBTTB/85iFW4CM3ZupfZWkGVp8bY3SFygB09E8Y1unNCk4h+pS9Iu0
	 vyOdJBUGC4Q7MzqUWh/iZ/7o4z1oAHrWMSVCp9Q0V3P4FRpez6BozS2DmFJbvul8rd
	 fNREY8IB7VzHqsoDVnqKZG5lSqJUrVlAZATDS95qjxvmV38m8ta87C4yEswKcFl3Pv
	 5X6SuUwtiu5chNbf4E6jak2yXfwTOxInmyl3V4EIi8XXeQVQWM5JOY73JkTBe7muQ4
	 IU+RWTcCp80Nw==
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
Subject: [PATCH v7 26/49] media: pci: tw68: Stop direct calls to queue num_buffers field
Date: Thu, 14 Sep 2023 15:33:00 +0200
Message-Id: <20230914133323.198857-27-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
References: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_143347_334871_3969A79F 
X-CRM114-Status: GOOD (  11.64  )
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
 drivers/media/pci/tw68/tw68-video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/tw68/tw68-video.c b/drivers/media/pci/tw68/tw68-video.c
index 773a18702d36..35296c226019 100644
--- a/drivers/media/pci/tw68/tw68-video.c
+++ b/drivers/media/pci/tw68/tw68-video.c
@@ -360,13 +360,13 @@ static int tw68_queue_setup(struct vb2_queue *q,
 			   unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct tw68_dev *dev = vb2_get_drv_priv(q);
-	unsigned tot_bufs = q->num_buffers + *num_buffers;
+	unsigned tot_bufs = vb2_get_num_buffers(q) + *num_buffers;
 	unsigned size = (dev->fmt->depth * dev->width * dev->height) >> 3;
 
 	if (tot_bufs < 2)
 		tot_bufs = 2;
 	tot_bufs = tw68_buffer_count(size, tot_bufs);
-	*num_buffers = tot_bufs - q->num_buffers;
+	*num_buffers = tot_bufs - vb2_get_num_buffers(q);
 	/*
 	 * We allow create_bufs, but only if the sizeimage is >= as the
 	 * current sizeimage. The tw68_buffer_count calculation becomes quite
-- 
2.39.2


