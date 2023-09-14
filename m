Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A61EEAA43
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 13:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EOLwZeOQyt9Z2OpMXoM+CKH/9zJiFeP4flDrP3qjOLw=; b=FaxZjcyG09/GPxORQAbzdXG9i8
	aq4LVHCSficeOgtljVvGaLzmRMpEcfa2fF72dzwzQnLcACcSjzjzmsnXvroUBHa++IlN4WcwnlnlN
	sh08O/tp3049qhpQz88SyPn0iEJSYyK4L5RTMFpd6OggMzAHnvT6pECldwl9iRRrxwMjVCO6vh3mg
	427bNELjdM4z5N5DUpvmZKbJr8TJPxyGpG8nR88aJ8nflTauGsnbkpP3eYxLpeWPucSTPKaio9X5C
	+Ch5a5zmEIDtYDZL4/ydl5YQwnj/tXpTyvNPYpUQsbCHiGyvP4hP4hPgSxvOTtTYwJZV/xiT21vj0
	UN8mbekQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmWL-008VEW-2h;
	Thu, 14 Sep 2023 13:36:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTg-008SRO-1T;
	Thu, 14 Sep 2023 13:33:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=EOLwZeOQyt9Z2OpMXoM+CKH/9zJiFeP4flDrP3qjOLw=; b=l+kay5UcIKpz8EK44lcNOB0DOs
	eZ3uGxUgCuTFlAJES3FrJlZ0RNVKxjjVvk5JOzYpo54se1cX4Mquhle8nJix/CLugT2c5pLrrJdPr
	Djzs811CEKLDQIs/rBwiRtW0O6DCMTTJP9Yegbq4ynbuBksBXJYHbSrLMvTep+QpOJwkdcJjYxnlf
	aZ8UrRAZ/FfHk4shHzDCi8J2ZnUXTFD6WCeROdSqOA880vd7g8fPlllHjjVRw55LnKgzyxnFNIfH/
	Edv6K75LQ0cUPy2drCJ+MJpAd3gfIcuFGNzPQ8eY+kbYpNnEzS3uVbiCyT+Z5lAzT5c8KrMrAxrjb
	wS3lg9fw==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTb-007uhf-2m;
	Thu, 14 Sep 2023 13:33:51 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:36f2:37bd:ccbb:373f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D66786607383;
	Thu, 14 Sep 2023 14:33:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694698428;
	bh=NPGIQWBbvKHkPrDtzyz0rTHCYJ8HXTuAbKhvtuCEFls=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nsLr5+8mLvfOrgpNrxeRPFIZBpS7RDRjBEkq2keyOtri/Y8m9Doex7VZ08sCyT4AS
	 uvsYBd/LNNaNa9EPqNFUhrdzadnCHcDCg3IbX2B1H3WguvsspTanWkkz4ISydPd6CK
	 d6EdGU0B6m+RJd1TeOpfeIP1Hmm2K55LkjG1rYXZIpIG4SP765J3hsLDdCll8bzCJK
	 BGhgRsPlI0FHlHuTn9EWaOD4Z9WZAwhXeHS5cLhEtQbwIVuLxKvubCRxJqOnHsJmS6
	 Li5AvmHOLLYsA/qf9VW7iszfL3vITXQdk+V/QKvqbo6oyyPqGrY4WVZv5AsmJbzFHZ
	 Vdbln3Or/evjA==
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
Subject: [PATCH v7 32/49] media: renesas: Stop direct calls to queue num_buffers field
Date: Thu, 14 Sep 2023 15:33:06 +0200
Message-Id: <20230914133323.198857-33-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
References: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_143349_463777_9FE2B243 
X-CRM114-Status: GOOD (  10.65  )
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
 drivers/media/platform/renesas/rcar_drif.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/platform/renesas/rcar_drif.c
index 163a4ba61c17..020845689ed3 100644
--- a/drivers/media/platform/renesas/rcar_drif.c
+++ b/drivers/media/platform/renesas/rcar_drif.c
@@ -424,10 +424,11 @@ static int rcar_drif_queue_setup(struct vb2_queue *vq,
 			unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct rcar_drif_sdr *sdr = vb2_get_drv_priv(vq);
+	unsigned int q_num_buffers = vb2_get_num_buffers(vq);
 
 	/* Need at least 16 buffers */
-	if (vq->num_buffers + *num_buffers < 16)
-		*num_buffers = 16 - vq->num_buffers;
+	if (q_num_buffers + *num_buffers < 16)
+		*num_buffers = 16 - q_num_buffers;
 
 	*num_planes = 1;
 	sizes[0] = PAGE_ALIGN(sdr->fmt->buffersize);
-- 
2.39.2


