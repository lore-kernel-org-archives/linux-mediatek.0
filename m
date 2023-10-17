Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41844C41513
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 14:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ilPvtEnUL69w5rR7RXUzxNBn6AmWm95qKJTNwVlds8=; b=V0WFg28p+CghPvtWQILJAfTPnI
	Z9OTrpVwxT1te9GeeoHq2DOseACVKg6xaOZ92MU/ha0oOgqlQbJ4z0FuweEesip2XsNPzLIyaDRA+
	GXk8NMJ0UqY9fI5HcwDUmeJvZFGFsBqSw8ojqQhcS8sllW3+/T94W86qE6e2HlguqbkaT2tIQpsLg
	KcdxvocKQavsRhzat3geS9FSQxIvU8ciDMNkME6bvvh6D3VLDAHrAFzkiyfEFtw4eA0wB5eb3r1XF
	ohrkN3y62qDbddWFlTknPDl6X6Oi9Td0IJEaM7QXkrf5RdtihJM3WJfeU17CmVZmji49CKx//LOd4
	l+dXsnlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qslQM-00Ccr0-2f;
	Tue, 17 Oct 2023 14:51:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslMz-00CZEV-0z;
	Tue, 17 Oct 2023 14:48:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9ilPvtEnUL69w5rR7RXUzxNBn6AmWm95qKJTNwVlds8=; b=UVnM3HGuCdMdRSkonK4JJ+joGF
	EMESvnbCkmpFrSfr9G5QKaJsUluKHizCDXmNf7QxUl8ilnRw/1/FzzDpx5NZSba+DyF9IQowQfium
	wjHLV5imzqrqm59DJNrbWRc5sHDIt99cfHt108ixUkRLu2JFA4XmyvvMzgIdRQIkS1izbtRRigFsd
	FhGj1EcFpEzPXHXqw1Sw9VPYuduoP6VD40qOihP3kVJdVzHRvqKXKjMfLkeO6SPtDyLv8udCenrix
	+jEbTHCpc6myYXrH1cwadVtAEyvvoNRzxNc/+30Pl76WEgI4DZHGC/SL5+f5j94v3UJy5s60ZO/G1
	EgDZp3hw==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslMu-007A1C-16;
	Tue, 17 Oct 2023 14:48:27 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7205:da49:a7e8:59f8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CC2E86607367;
	Tue, 17 Oct 2023 15:48:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697554103;
	bh=4+G+ZvYPKr/Dnh+XVk1Qk/BAjD/ZzHkZphjgv/jA4CU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AD/Pl8C5XYpEYERlgScQlBCeYSobkd5BQbAx7O/zBNm9vOOVh4ql2NVYhazOis4fi
	 oofj0PqV/hBXs/rhcY3TugHdtx5VlDxdTYTcnsWBwhduTmp/xLyboinAYgrSv9CGdQ
	 6hWThQ6Ow3+K2kp6LL2yYe8sb42RTDMHcVnO07AB8f11XiMx3lQszkv/d0MyN7tuwv
	 D9TVanqFRnZcw4iWCzRW9gyKqXfikhbyXzYOetatzq5V28fQkA/Oxiq8qTgT1MJY9k
	 yUUtk9BTqrUm+hbZYSk7+2iTxNNytrXOtLo4NOTlU/olasrzFvtQ+MKOJe8CQIsxT0
	 0LDvVwkLCCg/Q==
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
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v12 37/56] media: renesas: Stop direct calls to queue num_buffers field
Date: Tue, 17 Oct 2023 16:47:37 +0200
Message-Id: <20231017144756.34719-38-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
References: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_154824_508988_C0FAE948 
X-CRM114-Status: GOOD (  11.50  )
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
CC: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 drivers/media/platform/renesas/rcar_drif.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/platform/renesas/rcar_drif.c
index 292c5bf9e50c..f21d05054341 100644
--- a/drivers/media/platform/renesas/rcar_drif.c
+++ b/drivers/media/platform/renesas/rcar_drif.c
@@ -424,10 +424,11 @@ static int rcar_drif_queue_setup(struct vb2_queue *vq,
 			unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct rcar_drif_sdr *sdr = vb2_get_drv_priv(vq);
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 
 	/* Need at least 16 buffers */
-	if (vq->num_buffers + *num_buffers < 16)
-		*num_buffers = 16 - vq->num_buffers;
+	if (q_num_bufs + *num_buffers < 16)
+		*num_buffers = 16 - q_num_bufs;
 
 	*num_planes = 1;
 	sizes[0] = PAGE_ALIGN(sdr->fmt->buffersize);
-- 
2.39.2


