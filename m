Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 728EFE75433
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 08:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ziV2hb4ohbfnjPJz2x4Pd4VE/hmi7lg5RaQe5DPV4Io=; b=hGRNqxqxyhiT45KXkPizEPedGF
	J0CtM1wy4pJDIfHJuNHq6lVy6xTDvnjz/jONo6HRFHEm+Gpx17LwlCqcd1CLi1uSfrTWsZ1QFyz71
	KT6O+odRTv9s44yyMEMAQuhi/Q7ry6meub7KKUO/CwuaJOZ8YDO8PnXQCdzfjYgkcgGnHOsNRH8E9
	8a6A91VlCQxXHGJ0Wdx3aHHRbXjV+9tR4SlF2GzLbDgxdXnrS14ul0mo3MA4oILQytc88Dwk+02UW
	dL4M7FZmBr/rqQqa8syBELahXqKrZbw1rjnkjbqoEjipBJFtbQ6LLCFF4M2EsUidxBse9hH8Hq5Jx
	DzhsSLuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaTJ-00E5hX-0S;
	Tue, 03 Oct 2023 08:09:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaRO-00E3SH-0Q;
	Tue, 03 Oct 2023 08:07:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ziV2hb4ohbfnjPJz2x4Pd4VE/hmi7lg5RaQe5DPV4Io=; b=V7LwMAf05LYPwsaeFiu2R0uTbA
	Lb5lp2cdkGfYVl4ocWeR83acr1QEqGOIE878P0JCIsgvckbjx+BEBiahvwklzi5ZRj9MUjQEDgHEm
	wntVD0Y5SDmnsWkqaymEHsOKWdJbkO4H9YaxcdB+7RZFLliCptmFAg7MVgch2Sv/3vEbDQl2T/j1o
	a4mKNQ9Up8/mL33XdtVccjfv7qLP2HmfuhIPC8zyHfTic16QIkXRwD2humrMONwZxo1gdEDfRibpK
	jJOjQFg4otInKqovdJDxBsRoFbQPb34Tq7zqUjGaZYZgMo+tXbHMlZ7xDmTsYoaAisiTFtsnMeaFV
	jyLb/kpA==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qnaRK-00DuGE-ER; Tue, 03 Oct 2023 08:07:36 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:b6df:b784:6a0f:8451])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6B0F66607362;
	Tue,  3 Oct 2023 09:07:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696320447;
	bh=zysh0fIOtYpsYqIRMileMUIIdpZZkRuacJmXooFftR8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=STmpSyYyHlwFkpXxLb/WqLEzqf//uE3Kj37tTlrx7Z3xznrZPmZ03hpIwzyIjou4d
	 uY1gEDUs3oocNkREoyJsbc9kRT4XwppQMvEXqqqC6irLDxFGquTN2TuO113X1zUKwH
	 2uFYQrNiV7wDFP0Qd+Q0skR0QEQg/FJ/hq27cU9bVYGX8y+TZqLmTcqGpbhckO4SW3
	 EsoXNfyIH9n4Cfb+koeQdOhNNN3GLCXgKX7vcIf6nPIyU9kzfw18Tjlt9cORjX3QbU
	 FEzwRxla4tW+52UTKK8eg+YRYkm7yKSov5+yezNgK8jwYKMWDIJEI+d/BH//JTk7FV
	 mS+eMOb0uBSng==
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
Subject: [PATCH v10 28/54] media: pci: tw68: Stop direct calls to queue num_buffers field
Date: Tue,  3 Oct 2023 10:06:37 +0200
Message-Id: <20231003080704.43911-29-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
References: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_090734_929340_CC9A79EB 
X-CRM114-Status: GOOD (  10.07  )
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
Remove tot_bufs < 2 test because min_buffers_needed is already set to 2.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/pci/tw68/tw68-video.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/tw68/tw68-video.c b/drivers/media/pci/tw68/tw68-video.c
index 773a18702d36..c0a8257b02ca 100644
--- a/drivers/media/pci/tw68/tw68-video.c
+++ b/drivers/media/pci/tw68/tw68-video.c
@@ -360,13 +360,11 @@ static int tw68_queue_setup(struct vb2_queue *q,
 			   unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct tw68_dev *dev = vb2_get_drv_priv(q);
-	unsigned tot_bufs = q->num_buffers + *num_buffers;
+	unsigned tot_bufs = vb2_get_num_buffers(q) + *num_buffers;
 	unsigned size = (dev->fmt->depth * dev->width * dev->height) >> 3;
 
-	if (tot_bufs < 2)
-		tot_bufs = 2;
 	tot_bufs = tw68_buffer_count(size, tot_bufs);
-	*num_buffers = tot_bufs - q->num_buffers;
+	*num_buffers = tot_bufs - vb2_get_num_buffers(q);
 	/*
 	 * We allow create_bufs, but only if the sizeimage is >= as the
 	 * current sizeimage. The tw68_buffer_count calculation becomes quite
-- 
2.39.2


