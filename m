Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608F9EEAA44
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 13:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qzNrOqHsDWVtu/+m5mo+jpifKlOXBV0CR6JVjceXOZQ=; b=3CEN7I5EZhpw1Bzm+MFYNqninV
	oS+to2+BYixyoBMTVZGtTY0GbgiZKHaSvc69K8OxGlbWyY63r9inlHYmalXr8Aet7WfBa9ZE8U17w
	wHrJjIWi7uyToSyAFV43VpOpm77uzU3juQLhv/JYqZ8bp3jb40ecabn9duLhqvXM/v+qw/mtmo++W
	aHaEveSa/MA1CA1UzYMMhyLs1IIZPX3Fqli3kJmfIzWTjCsvAooF0m7rAIqI62zve/SfI3ytECDHo
	+r5LVx08gS5U4a7NOjqwHRgsRD0UUYkY0Jyrp8Jc78XiI0PqVAi5P6jHSUjVPPz90Voy3vhPghJP0
	8fdwF8Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmWZ-008VV9-2Y;
	Thu, 14 Sep 2023 13:36:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTk-008SWn-0H;
	Thu, 14 Sep 2023 13:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qzNrOqHsDWVtu/+m5mo+jpifKlOXBV0CR6JVjceXOZQ=; b=F7o32BK5krxiZ8tGrnzSXFmdi+
	jal01GbN0O0ctQjb2gj1qaLaQTWtACrkAITc8WN27B1Isf1IylSmzux6uxaipSsN+zgP4pxGbdJdb
	ZKmgpxyU1iHhpeH2Sp03A/Ezl+NNXDCK1gz42zff2Gi154g3b6Ufih7Z6m4Ru56kl7WR2Zbr6DxU3
	vOPEIE05i1oT2r/7EHVsBRl4Vg4CX0MBT2kh0aJ4vLq62el+AiCB7e9v0/aDwcQDD8xgPqfkCbZWB
	w5lCFNBI88/IGjwApMJA5URIQRLWO2uN/0kvwQChNrprSIcUKtdPqCeE8SojuSk6xdCn/VLZcOJCE
	/OB3N1Hw==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTd-007uhz-17;
	Thu, 14 Sep 2023 13:33:54 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:36f2:37bd:ccbb:373f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 672906607358;
	Thu, 14 Sep 2023 14:33:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694698429;
	bh=JMZx2uxA26BNI9i9E6OsCtWtCLTgVI42g2rsSFOFa8g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KMc3c3PZVLGDx78559nwmGzDHbm4s0tkKoSi47P9LzcBhzTYs2YRA165nqs1fGqzq
	 dfHzyavdk5PrKZDz/P2YvJW2CbDp5+8+mH7Pe4hZIjuWkqhOQJc/iQ/zRjJSzDReHv
	 IfIxknHFPLUfmDJtf85EWqFbXHsRdsIJgBwwkYEfwSNRxXdjgMgq3PjyXLqPzqAXKE
	 d7qmMSO4fTKRZaKIDf7HX2MOVR/SongSzbQfe2J+lblpTnefsrmk0RdeTMzIkw/MTf
	 op1DvFfCc246LfgbpGRiMzRHGUSDnbmbS5pR8WLXWHpLb8n91Q0P/jBheuzQVjjEXl
	 zEc5T1pYE8gVA==
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
Subject: [PATCH v7 35/49] media: verisilicon: Stop direct calls to queue num_buffers field
Date: Thu, 14 Sep 2023 15:33:09 +0200
Message-Id: <20230914133323.198857-36-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
References: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_143351_225358_109DEFF5 
X-CRM114-Status: UNSURE (   9.85  )
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

Use vb2_get_num_buffers() to avoid using queue num_buffer field directly.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/verisilicon/hantro_postproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c b/drivers/media/platform/verisilicon/hantro_postproc.c
index 77d8ecfbe12f..a242eedf9cf5 100644
--- a/drivers/media/platform/verisilicon/hantro_postproc.c
+++ b/drivers/media/platform/verisilicon/hantro_postproc.c
@@ -250,7 +250,7 @@ int hantro_postproc_init(struct hantro_ctx *ctx)
 {
 	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
 	struct vb2_queue *cap_queue = &m2m_ctx->cap_q_ctx.q;
-	unsigned int num_buffers = cap_queue->num_buffers;
+	unsigned int num_buffers = vb2_get_num_buffers(cap_queue);
 	unsigned int i;
 	int ret;
 
-- 
2.39.2


