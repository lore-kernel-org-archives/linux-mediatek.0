Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A227CDB47E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 11:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o2J7dUrEgQsuh900jy30fGQFA4/dmEnjcts9KQQ/O6Y=; b=o+orMahbGSd1HEv8iWkytvxpSY
	VWMRahDcYa7ER8xMdISM+bE2/8YBZl7VM74ckBbZwZF14jKDjHBGZ2UNivdT/dENPv9pcq/Tn+R/b
	dMqO5mXXeD1im2BKW76b5coJP+MA3QoWiNbJbNLn6gq78zW7h9GDij8uvohx70Nca+rZ/xMDmK9PP
	UGlFZ7YdGYyKrUh90+AVNztTvTNqpzTF0l6/iluMPXWJK4i0jxzvoUZ45DnoGhqpUWVblSaxxGSz6
	fV1uzY1ROHvykhZvcmIEHsd1PP91SaAwJ1ffCwfWT86cVGbtgWWfA3if2aWUTl1NhAl6xxi4GAgtq
	edLkZPPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qquCc-000qwS-2U;
	Thu, 12 Oct 2023 11:50:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqu9p-000oDu-13;
	Thu, 12 Oct 2023 11:47:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=o2J7dUrEgQsuh900jy30fGQFA4/dmEnjcts9KQQ/O6Y=; b=ZwZaGxpxZoJs9YDqvW1y+YcyKZ
	dWWXVNndmm8PbVNgq2F9w/eDxS7QLj9ZcPpgwK5nJVswolLrNdUnOogSBKNAQ2M+mE3nR9ptXk5+F
	dBQ8+I2sLyYD9DxrquEEpKgDPkIm8njv0GH+z/fUHApIQgPcs1M7UKHiMFCtQU6pCBQ2FUfhUrIkv
	KWXO6nJ1kUbAMpR39vC3a1PFwLhEj2qTTi1srowKKOEDB0eyllabDiaBDUbArWpDhrDye7SB68bcO
	cHrxzO+6nf3ZdNdINwYhfwWEAfcw4MqWJdGVx3F3dmSZyjv1vVSu37vCdRc+nXDFnul00gIBF5iTS
	AKGf67Ow==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqu9d-001nId-1J;
	Thu, 12 Oct 2023 11:47:09 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7ae7:b86d:c19a:877e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 159826607375;
	Thu, 12 Oct 2023 12:47:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697111221;
	bh=RixrAQBOgKHoPu9fntvJtw2OX9PZEEsf/szxAuITdMY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OoqCZCxGG5mYLqH7BsWI3ks9lAvuN2A0vIWLC0g+B1qchAvXw3rEGBCIl/oue4HFM
	 cgeVXAHwqToHSGSY0lHLFv93r78jW99SwLlvH3ClkMT2sHvhEmBwlcodI7Ylun6Cr3
	 LQGRiWfYOqXOllevieIMsnB50EhzAmJt15tGHhNVxMNGtLujVUhM2ug8kBH7ddSq/M
	 evTYgma4Jv4k45A5+otebtqyjeTYRKBZWqyI08NJBhqakXAN+PGbrTzSX4574y5nB2
	 KBX09pSZyVmoZDyHKkotwbfmzhZF/a45AL7+RNTPqL9mDKHJgKtPDHk+9qllOzQg8R
	 YffczzznFjvUA==
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
	Andy Walls <awalls@md.metrocast.net>
Subject: [PATCH v11 22/56] media: pci: cx18: Set correct value to min_buffers_needed field
Date: Thu, 12 Oct 2023 13:46:08 +0200
Message-Id: <20231012114642.19040-23-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
References: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_124703_116627_1C2CF968 
X-CRM114-Status: GOOD (  10.80  )
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

Set queue min_buffers_needed field to 3 and remove the useless
check.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Andy Walls <awalls@md.metrocast.net>
---
 drivers/media/pci/cx18/cx18-streams.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-streams.c b/drivers/media/pci/cx18/cx18-streams.c
index 597472754c4c..6ed2c9fb882c 100644
--- a/drivers/media/pci/cx18/cx18-streams.c
+++ b/drivers/media/pci/cx18/cx18-streams.c
@@ -117,13 +117,6 @@ static int cx18_queue_setup(struct vb2_queue *vq,
 	else
 		szimage = cx->cxhdl.height * 720 * 2;
 
-	/*
-	 * Let's request at least three buffers: two for the
-	 * DMA engine and one for userspace.
-	 */
-	if (vq->num_buffers + *nbuffers < 3)
-		*nbuffers = 3 - vq->num_buffers;
-
 	if (*nplanes) {
 		if (*nplanes != 1 || sizes[0] < szimage)
 			return -EINVAL;
@@ -286,7 +279,11 @@ static int cx18_stream_init(struct cx18 *cx, int type)
 		s->vidq.ops = &cx18_vb2_qops;
 		s->vidq.mem_ops = &vb2_vmalloc_memops;
 		s->vidq.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-		s->vidq.min_buffers_needed = 2;
+		/*
+		 * Let's request at least three buffers: two for the
+		 * DMA engine and one for userspace.
+		 */
+		s->vidq.min_buffers_needed = 3;
 		s->vidq.gfp_flags = GFP_DMA32;
 		s->vidq.dev = &cx->pci_dev->dev;
 		s->vidq.lock = &cx->serialize_lock;
-- 
2.39.2


