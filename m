Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D424EEAA42
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 13:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kRY1Y8UmuB3bOAVn1DjviZOqkQmeQ20ZSWWBbzh2Ejc=; b=KJUjDEDXHk8TMLshhgF/I8y6rv
	fEdUxt9vOOjiKsnJ6EQmDEufCESUbhfNt/9MLmxICSY+6kCdvgHMgB+y618vTx5mN7sC8bog491Nn
	4F+rH/j6dfMY+vCt9E2opN6/4lV7Y3QhhWLJlpj20F4xq1ox6M1IANS7y+uecSvr4Sm7Ywxfae6dm
	aFF1Oc9xCGJIBdjHF25tLvSvhcGvy9YOv1LOcZRg1f7Td3Kl4r+pktmCIqaqJuHzxhY0Efuc5ytir
	pFxgiPse/cAcrWoZ6KivjMLg84O446XgWgmpxD7j1uOCqPk5sgSRD57s8hkez1KNwezeXhkd6sHWp
	+nfItAFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmVx-008UoX-2z;
	Thu, 14 Sep 2023 13:36:13 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTZ-008SJY-2M;
	Thu, 14 Sep 2023 13:33:50 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:36f2:37bd:ccbb:373f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A9FD66607378;
	Thu, 14 Sep 2023 14:33:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694698424;
	bh=BcQqOPN9BFM33EPpszUjysR3LWc4nekHpVvypyNeDb4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HGrzjpCpmFxjKl+xk12MOrY+MAGIB4u3LD8uzE5j+yG7VVUQIygb4veFQ1xCJm2qN
	 7N6Tamio7lxOVD8pfP3gE5v7dD/QnlDk4KY8kejzl3Uo1uBCYl5lQO1D2EKwZ2ub9Y
	 LsMZl7uTJvHisiPba1wwyGF1/Bm040tvPT+fpBf9l94FVfVavC3Prnf5TqF+dz3FVR
	 VhZTziEGD29c1Z47nVHkMzJHfNDvohrqsrqkAelEfBTjRWeqbZFDfPxR6z5eo4TYlL
	 n8okpZR62/R9k08yiq/rRBS/x7JdONAbNeIjEb2VEESBf0BXjS9Ww6GjCSrbAIh8DC
	 ROYWEhkR+lq+w==
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
Subject: [PATCH v7 24/49] media: pci: dt3155: Stop direct calls to queue num_buffers field
Date: Thu, 14 Sep 2023 15:32:58 +0200
Message-Id: <20230914133323.198857-25-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
References: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_063345_929029_0CCA37A4 
X-CRM114-Status: GOOD (  10.53  )
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
 drivers/media/pci/dt3155/dt3155.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/dt3155/dt3155.c b/drivers/media/pci/dt3155/dt3155.c
index 548156b199cc..d3abb0e093c1 100644
--- a/drivers/media/pci/dt3155/dt3155.c
+++ b/drivers/media/pci/dt3155/dt3155.c
@@ -126,10 +126,11 @@ dt3155_queue_setup(struct vb2_queue *vq,
 
 {
 	struct dt3155_priv *pd = vb2_get_drv_priv(vq);
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 	unsigned size = pd->width * pd->height;
 
-	if (vq->num_buffers + *nbuffers < 2)
-		*nbuffers = 2 - vq->num_buffers;
+	if (q_num_bufs + *nbuffers < 2)
+		*nbuffers = 2 - q_num_bufs;
 	if (*num_planes)
 		return sizes[0] < size ? -EINVAL : 0;
 	*num_planes = 1;
-- 
2.39.2


