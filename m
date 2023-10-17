Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38CFCDB484
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 14:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6naI9jAgWYBGhWi1qqi3RabSUM4tX/YeV1rNn+0zlZU=; b=h2vtppuIjswGEustwi/Lz/NTXO
	7UMLsXiylV4cO/KgJfroS+aciUoV/tDsZrQVBktpGOfIV0FFb7jAdHNTsO0lkGkzUmfMNQIs6c3jl
	yEt+mFK3OFj3Ue63TYkFO74AKDLFGOZGsPGAcOoNx32Ophpr8uxmZIIZBuIHuMdxUmQ6gWKKNSp1G
	vhb8/lC3/RyhNnwCCfJmHR3GdDqAQNgI7W/1UcDJrmfALG14DR5wEBv6voccpXDBjdM9A44drabTr
	1gQtRJgiME1n8iY6/gnTbp4WYnGCKqC39Ch0+q9mFNYu8p0NgSANEZ+lXoa72rvZsk9XyAyjwssTi
	4QDLTzCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qslOj-00Cav7-0G;
	Tue, 17 Oct 2023 14:50:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslMs-00CZ50-0Y;
	Tue, 17 Oct 2023 14:48:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6naI9jAgWYBGhWi1qqi3RabSUM4tX/YeV1rNn+0zlZU=; b=IRHRJ5z2lj5Ot+V91BKjSLXly6
	ZF2phkFGGNcG+OsKpXqZB2ZDdTKTo7vyDqHj6RlVfcr5cftZHQ/qQJO6CWJy1toKy2Kh+l/yD3ENp
	tpX7EiYKAMQcJslyOGjf4BzMc8lEOLjB1KDEuWgkCR179arDFL9upPcM335Zhylmw1dtiMLzbNvib
	QR3bCmO6hKm5gidbVCDk0tGzVjrWDY/uAamhcePgAXRNWz7UoZ7CNnPDbg0ooOq+EWSfllxS1iKiR
	fEMBwAwjx0SNcBoMNI/OdprsBznJ6ZGwkb612eFX5j2P8803W7yf+OkxYSn1EykzPhD93hSqhv1eF
	e5k+OP0g==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslMn-0079yW-0z;
	Tue, 17 Oct 2023 14:48:20 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7205:da49:a7e8:59f8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B18FF66072F4;
	Tue, 17 Oct 2023 15:48:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697554094;
	bh=+SrUe883wLqq7v9G8MLuRZrzPHfSobRjkRT5Sxaur58=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FTrfzkYOUFEaypOirJmchtUF+AvoupwvBQrV8f1KDKYHMxDadGxipG60O9gy9GCnf
	 ozQGGLYmXJXb8lJEt2hyOPV/6PTCt/WdcNrpZTRY8hDOreYXS3xRJBCMmvHnGOKFj9
	 fG8oY1CRVJngNts00z3d6dOLpbgNJJKAyue9Ub0LtwycDZy+hXI9gAkGO0Z343TFIu
	 etQ6pS+2yfwiWD53upzlrn1TMULf8oxHiD9rfKL8kquK8slae2FkzZtTL5VzL6RBl8
	 64Ug6UOByQDoG1JJ4GrMA7ZI3iuwxMUhj+AWmhSJOf1fn/4UseCir+2vGoGEiEIYIc
	 ifU/87Db9cRMw==
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
	Antti Palosaari <crope@iki.fi>
Subject: [PATCH v12 20/56] media: dvb-frontends: rtl2832: Stop direct calls to queue num_buffers field
Date: Tue, 17 Oct 2023 16:47:20 +0200
Message-Id: <20231017144756.34719-21-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
References: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_154817_564868_C1229528 
X-CRM114-Status: GOOD (  10.48  )
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

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Antti Palosaari <crope@iki.fi>
---
 drivers/media/dvb-frontends/rtl2832_sdr.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/rtl2832_sdr.c b/drivers/media/dvb-frontends/rtl2832_sdr.c
index 02c619e51641..023db6e793f8 100644
--- a/drivers/media/dvb-frontends/rtl2832_sdr.c
+++ b/drivers/media/dvb-frontends/rtl2832_sdr.c
@@ -439,12 +439,13 @@ static int rtl2832_sdr_queue_setup(struct vb2_queue *vq,
 {
 	struct rtl2832_sdr_dev *dev = vb2_get_drv_priv(vq);
 	struct platform_device *pdev = dev->pdev;
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 
 	dev_dbg(&pdev->dev, "nbuffers=%d\n", *nbuffers);
 
 	/* Need at least 8 buffers */
-	if (vq->num_buffers + *nbuffers < 8)
-		*nbuffers = 8 - vq->num_buffers;
+	if (q_num_bufs + *nbuffers < 8)
+		*nbuffers = 8 - q_num_bufs;
 	*nplanes = 1;
 	sizes[0] = PAGE_ALIGN(dev->buffersize);
 	dev_dbg(&pdev->dev, "nbuffers=%d sizes[0]=%d\n", *nbuffers, sizes[0]);
-- 
2.39.2


