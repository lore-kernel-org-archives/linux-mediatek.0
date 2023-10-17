Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B47CDB474
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 14:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T87t/s64H9A0cr1T8d1+Emo3XLIhBi9sxh0yHUCw2C0=; b=NwFile2aP5tUQN94ivTlEyRWOY
	hhvyHiyDLRABwwsDa2RXnFFxlTjDSK86L/fAEUEpkYSYDm3iF1d3QoqRLIaK7VbirsBZAonuIX4Kk
	Sn7yXKZPLHcfRoS5ZpIIP3wVdIAS2byWhlemM06DOvwO5dGJgxbHnc1X+oNgTB8LeWVXQRwdBbWEw
	FkjZpH700+50+l7Fe46fXLz2nblkmtptnuNcwvOVF6pxmRdMNeS1bIqqiz7jNk7ss9vAapRdQLfOU
	tjPyLtIeA3eRUfZ9mXpSFvvvRRvtamTYJMeMdFDWiSYKxjqFwOotuNHMdDhF05memFCOcjQaRHqSv
	soNBEO+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qslPY-00CbtN-1E;
	Tue, 17 Oct 2023 14:51:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslMx-00CZBv-1F;
	Tue, 17 Oct 2023 14:48:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=T87t/s64H9A0cr1T8d1+Emo3XLIhBi9sxh0yHUCw2C0=; b=Advc/r/YnpFvWhD+wU+Q5t1VXg
	oeNvFIrpCIQhXZv2Lq+3ws4OLUWte4wMM/0LEtnlxx/PpnuLpfzzn9MYklP9FWQul9vwcWfm9zI9O
	1HJoHGXcIx1Idk24C+/lmPxX+d4dm3cY3sDP30sFhEAblf6sCEJ0VcyUSkYE1nhOpI+nX1Pbc0Gju
	3DfPjxE/zryxZkkVynYg2DK7hr8yrLW83A4UI44VJMc5rPeb7+37ilETXZXYSCaoq86JwOWepiRMK
	FNOPA/PMPEw2qoZ6uBWbB1XV2NwvxG/pc/5T6QymKUJAy+2XVafxNNIB01d+9Su1/lZx0QvB8d43K
	s1rQDeyQ==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslMt-007A0a-0d;
	Tue, 17 Oct 2023 14:48:25 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7205:da49:a7e8:59f8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3CBB06607391;
	Tue, 17 Oct 2023 15:48:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697554101;
	bh=cNX0Uc/focM3lrX3oS9L9Q1ymhjMXLItiK8qS21I4NE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BCx+zH6n0Y75JloFAelQE+A6IWUdf52gtEuL3Lj8VXzDeSyU1BVmR7tpgPt+RgGC6
	 oQ/xrN6we7eq49q6nSXC7MK4GUrsU1zV3eWIl8a9yzmB+1wtKOSCONjY7CVZcwsnDo
	 BWfP/mb9mtUodjN1AMPQ9sFKpM6fVSMXGZhl160mDI9R/qNe/toFbDQDxgcJxo33hF
	 nkRhLnp/fQyT2JQ7VmGZMXEh9UVfOuF7npz6IlMXAu2JcyCW25LhM/DwR+2+7S6Og3
	 ZLhZOctgTEgWl1+xGDCsl1uRiD7OpjZpyhMi62WnO32Xow4ZdQPD9SrGisS8IVq1jA
	 uZa2rToIp6VXQ==
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
Subject: [PATCH v12 34/56] sample: v4l: Stop direct calls to queue num_buffers field
Date: Tue, 17 Oct 2023 16:47:34 +0200
Message-Id: <20231017144756.34719-35-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
References: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_154823_452351_56D65D5F 
X-CRM114-Status: GOOD (  12.06  )
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
futur.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 samples/v4l/v4l2-pci-skeleton.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/samples/v4l/v4l2-pci-skeleton.c b/samples/v4l/v4l2-pci-skeleton.c
index a61f94db18d9..a65aa9d1e9da 100644
--- a/samples/v4l/v4l2-pci-skeleton.c
+++ b/samples/v4l/v4l2-pci-skeleton.c
@@ -155,6 +155,7 @@ static int queue_setup(struct vb2_queue *vq,
 		       unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct skeleton *skel = vb2_get_drv_priv(vq);
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 
 	skel->field = skel->format.field;
 	if (skel->field == V4L2_FIELD_ALTERNATE) {
@@ -167,8 +168,8 @@ static int queue_setup(struct vb2_queue *vq,
 		skel->field = V4L2_FIELD_TOP;
 	}
 
-	if (vq->num_buffers + *nbuffers < 3)
-		*nbuffers = 3 - vq->num_buffers;
+	if (q_num_bufs + *nbuffers < 3)
+		*nbuffers = 3 - q_num_bufs;
 
 	if (*nplanes)
 		return sizes[0] < skel->format.sizeimage ? -EINVAL : 0;
-- 
2.39.2


