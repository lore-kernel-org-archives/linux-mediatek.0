Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22F0E75437
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 08:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGIyUnXfYlZrvHeWCo2ngnGTPgOrZHbbiv5X9rjqVAs=; b=09K7QOjHncXNQeXvvEuEtwq0qQ
	TRBZz0SWdon8FwpYXr1HnQp1VfYVoabU+FU1G9T/RSIw9voeMKY2FSEVEwKW/8JQ6Epk0hq/c5mpc
	CfnwxImIzGKIefONhv0tJJ09feEq2LMvQ1jpW1jKonJAZSPd+VlBP2iI2xIrImjQwcCQTvIz4Y19N
	WIDZJxTv+EKoxJE4Q/y6tAmI67nhFq43sESlj8P7OzPzk17WZ/wiLWOdS3Y+58i1ecFWpqbDbFMnj
	7rxatSQ4ECAiqdyNzxwv8iiE2UgZ5fJ6MnKGXsWH+tk9pyplee/2eqAz4YXf6dOI2RHLN/Xv+Tqdy
	g2qDQZMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaSY-00E4gK-0u;
	Tue, 03 Oct 2023 08:08:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaRJ-00E3MK-2e;
	Tue, 03 Oct 2023 08:07:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=EGIyUnXfYlZrvHeWCo2ngnGTPgOrZHbbiv5X9rjqVAs=; b=ETtBMmAdLviVXwwBHhZmeVyt/G
	5X4EwV+4pZf5WKnnuZWnHRRGnUr6vJ+fupaqymw2Mf7WI8PLbJVrC5MJwuyz1WovOjE/oHIfUnXil
	bB7ApkGboZSZHXy8vlWEacM2DQRYKenos71ux90OgGdxXCJ5YaQMtl8Tujoo0ZxnF0u0imuN9hqhV
	O4xNjprxBT+CIixsnq2dFGlg64YNtYoOYu9SCa6UeUJ16I8NMXyzYnrZEZFx6ykNi1QUNMU1efHE4
	oU2b77/wf5lsl7XGA0/mnTft8xdltmH4WqZO0pLBaU6fOzuIdzOIbGHUccwUNj8093ToiMndtO0s+
	V47Yl/iQ==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaRC-009jrg-2X;
	Tue, 03 Oct 2023 08:07:32 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:b6df:b784:6a0f:8451])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DFD2F660735E;
	Tue,  3 Oct 2023 09:07:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696320447;
	bh=ZWZu+iiWZeSR97TuxWAcPyCT2zWmqcsNlEZTasx6lQc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TM877k3dbdv5cZ3/+fzoBT0lguta5bDqCV9H8tQ8PNrG5rqShpGoZHosFKCqo+gR2
	 aNnRhEh910+mZEG615eL480UAWFDxh5mBICdi8AV1G2/xg53Q2C7SWF+7SmWfip1Mk
	 3q12j79ajrgx/XNulaWFbSKsJlmeAs34SBtQ7Rbz8u6zY48K68sA2uNRgIDumytrUa
	 vnN34JOqeZOMSddzFZGcz9Oiw3GCGautxBvRG3pHJoUiegtBBD/DDk1ds/db79eaMP
	 tF2MEa9LEcz3+IHiIXmLh++xqfhOqDLuGe9J63hN1PKcD6HAL8CG9SJd15m7vc4rRb
	 zFQtQW7z+30Zg==
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
Subject: [PATCH v10 27/54] media: pci: netup_unidvb: Remove useless number of buffers check
Date: Tue,  3 Oct 2023 10:06:36 +0200
Message-Id: <20231003080704.43911-28-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
References: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_090729_647459_6AE2C214 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
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

vb2 core tests this already so remove it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/pci/netup_unidvb/netup_unidvb_core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c b/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
index d85bfbb77a25..52de9b0af812 100644
--- a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
+++ b/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
@@ -297,11 +297,9 @@ static int netup_unidvb_queue_setup(struct vb2_queue *vq,
 	dev_dbg(&dma->ndev->pci_dev->dev, "%s()\n", __func__);
 
 	*nplanes = 1;
-	if (vq->num_buffers + *nbuffers < VIDEO_MAX_FRAME)
-		*nbuffers = VIDEO_MAX_FRAME - vq->num_buffers;
 	sizes[0] = PAGE_ALIGN(NETUP_DMA_PACKETS_COUNT * 188);
 	dev_dbg(&dma->ndev->pci_dev->dev, "%s() nbuffers=%d sizes[0]=%d\n",
-		__func__, *nbuffers, sizes[0]);
+		__func__, vb2_get_num_buffers(vq), sizes[0]);
 	return 0;
 }
 
-- 
2.39.2


