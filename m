Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4B9EEAA45
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 13:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQ9dXAKW0tlc7bFOMFkmzr0Ker99sDGq/isfBpik07I=; b=IK1plOOc+nrxJmkNcdBOfMc/96
	2cNJ9gob+ZYGMegpRsucctZL03x6OD8JthHS/EgfLNc4KrluZP7qFDYATauU94K/UnpyV06SUa2td
	b3VkmeqeDj0NxFl/gpvChdGHptu2BLTN9N+Axvvg/k2R/m/RB8OXF9iiz+xDSwBzMdQ/+ihBn0Qt4
	/mekZtxvrfkaNpD2ApQmRylkfe59N1jKk7zi511gD5e8QNyckR7OzsCB6A2FRiR6VvfvbdporbzTr
	54WnAtA5tO+T3B2P3ep/4Afwlx1SmwDfsOcGfMscyUF/UICe82swmSRxgNzi2AyUwrM0FlLGy28J0
	uGyV17SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmV8-008U42-1O;
	Thu, 14 Sep 2023 13:35:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTc-008SMm-1X;
	Thu, 14 Sep 2023 13:33:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=lQ9dXAKW0tlc7bFOMFkmzr0Ker99sDGq/isfBpik07I=; b=XNLiUFe6hOLm+bZnqn2+6nQfLc
	5WuT7+9w0zvRZDyDFWk2+BU2KAe7QDz7c9y3UVaKb0OBAKRRZxLN7eDdKFM6f24KiLUpEwAhdBSPL
	EW3jcNbGfhsIkVMNPSbnR7pPANh+Bt5LwsA2k7o4uKKDZx7+aYufBb/60TCrYLYLhno5QYv//gEXk
	wxy9Sul8GEf85KEjUekXIjPKcHXbcv2kxa/g0rtKDP44HJVDGjoxX2KunHozEk3zfz2koB+2gH7Xv
	0tEK35oS88M6PgfUzhmt2j2sDdOwg4qBGTWgjAUGAioAezYS2Fue/eodo2EeiQIiGy6iGWd82++tY
	H3XnlJLg==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTW-007ufl-1z;
	Thu, 14 Sep 2023 13:33:45 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:36f2:37bd:ccbb:373f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9577B6607377;
	Thu, 14 Sep 2023 14:33:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694698423;
	bh=N8F0TVW71sKqYIUdg2i7jHGXNNiGuYTWU5qjY+j8Vz4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oFsDgzTcyrpxAlQlpxQ/2P4j2Ix+qcXNOxuNIVTdX9cEOU+1AnhgoyFAZ0JP9REkC
	 Q/fUx+vRTrNK0B5SGzPHltRe+aGb05x/P1VLmP196NpE4zMd5ivunjMB3JiKPIfpA7
	 ic1mCSv88L0jXh2UPG+oa497ijOIHDnmES/OdCKiI1Zasm7r4Zp2XQaJyY9MOXxpwO
	 Zh24HgChuFlwTu+pHvKEEtFlJOx8adD7d+6aB3ueY4OTlpLgP/R+QqSXsHtpYDeTgc
	 pIWUvnhR1K3jSDqGfAsdOaAiZJyqksjDbycmJPq0yYAWHWMloYhfbkZDkhHGgbvqet
	 nD03lIDSkdM0g==
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
Subject: [PATCH v7 22/49] media: i2c: Stop direct calls to queue num_buffers field
Date: Thu, 14 Sep 2023 15:32:56 +0200
Message-Id: <20230914133323.198857-23-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
References: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_143344_202560_419D6B3A 
X-CRM114-Status: GOOD (  10.34  )
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
 drivers/media/i2c/video-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index 537ebd9fa8d7..60d3e2f35afe 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -406,7 +406,7 @@ static int queue_setup(struct vb2_queue *vq,
 	struct video_i2c_data *data = vb2_get_drv_priv(vq);
 	unsigned int size = data->chip->buffer_size;
 
-	if (vq->num_buffers + *nbuffers < 2)
+	if (vb2_get_num_buffers(vq) + *nbuffers < 2)
 		*nbuffers = 2;
 
 	if (*nplanes)
-- 
2.39.2


