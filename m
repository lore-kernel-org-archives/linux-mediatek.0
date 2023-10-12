Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A26ECDB487
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 11:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o96y52cxqh3GUQXV0vXJPlmMlIJubnqHdq2MDJskkE0=; b=nqmmWGjaz4H7GatjrdXXst9ylQ
	ivfQkjm0D4aBHOI+VAG93bsaJUByd4n0n7mdv4AX2onZ+bM7D83mUXbUmF/dTKAwpBzUeH7scbny4
	44ZWrFqHk6Typtr896DLmODx76Uw5xmJw91Udyg7BiecY0uJm5vzwA/k5HLvN1vuZE0fr+gtuTZb8
	Wk2YjPEe6a7NY4iwZ091Oll47sifvIHZ0lg4OY04YIGy+aQ3GzRzblTH8XgxoE+Jn4ENu2AfZUqIO
	WSApFA8Hk+L4rvYXCcr0Zw7CUePxD7e551XnEknyF/Cyx8OjAFIDJvMiOyzNO7z1pYyWofPULBMkD
	v0CJrupg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qquBa-000pm7-1U;
	Thu, 12 Oct 2023 11:49:02 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqu9f-000o2z-2Q;
	Thu, 12 Oct 2023 11:47:07 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7ae7:b86d:c19a:877e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2B9EB660737C;
	Thu, 12 Oct 2023 12:47:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697111222;
	bh=tcL10ushjZKOfejORLVlDBPX8x0SngzD2gGkivTGU0g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ldW/Ogjn9kC7gijcctJUy/y/+tFA0G7iAnA/ttNi0MVF+0mW3uyktXU526npAf3Wd
	 B8jXbM6qUhwD4mEpacvh2dWg6MJNrsnW6dpB5ib3/1mvycY4+CBfekkt4EjWGKu5tT
	 LrMbdQ+L9Qviv1A8u8gVDalkbsHMBXdPyTD3EPT/+xxlJxg+Prl3SfhCCQNm7zSf9w
	 NOw3TH2uk3HtGi0/wwAHViVKX8HCyoCNJdUba0qgVOCyqpbCbVO3pdmOz72ATTysmj
	 yb3MqZbn66e2YrfsDGI4rkDivBXmmL8PVFzGf7/LwkbgCG97VWKM9OLI7HX0Y612ho
	 dGi7FgsOFNteg==
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
	Sergey Kozlov <serjk@netup.ru>,
	Abylay Ospan <aospan@netup.ru>
Subject: [PATCH v11 24/56] media: pci: netup_unidvb: Remove useless number of buffers check
Date: Thu, 12 Oct 2023 13:46:10 +0200
Message-Id: <20231012114642.19040-25-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
References: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_044703_990427_465BE5BF 
X-CRM114-Status: UNSURE (   8.25  )
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
CC: Sergey Kozlov <serjk@netup.ru>
CC: Abylay Ospan <aospan@netup.ru>
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


