Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF16AC4167D
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Oct 2023 16:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+82y3HCRQe8p3qEO/CsxmOcUDerisIraRIWfK/NnGo=; b=Jh8yPgIsAmqL1bJkJbK3N/5xDl
	0iOmmMz6JBXKM3FMf0+S3qQCGP7c6fjoQ1/0TuXHmyNscM6dQ4LyZXyHGTFmo2Hw/Z7ZuZOJXlqwD
	+iomkM6cjBj7fuwTqUCItw4LOJtmlL6bDZ2E1bc9oyLkWkFIMw8V+GM69xhnYhQ4IgmORxaBmfQit
	KcccmhbyLdjKKkrbv5TttnaAOEhP6bBnse0ueBA9PCNiTJtCBO0j6LlqIJ2CJm02o6a06l1CVMKRD
	qAkDGsQXqMs7/whLliw5gGYuoxuMVmyetBUxO0W4ZQXq9Vbb19TgMvWGQkEoMMGGeiX+d/rN40Sue
	ZAb15MjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxriN-005ehd-01;
	Tue, 31 Oct 2023 16:35:39 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxreg-005cAf-2v;
	Tue, 31 Oct 2023 16:31:52 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:c562:2ef4:80c0:92f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4E6D166073B3;
	Tue, 31 Oct 2023 16:31:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698769909;
	bh=i3ojvf+oJl6EVNen5vztp4m8lCDNcxv0WJBCUcNAQzI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SL4ZlVSF4eEjyE3oSGYeLpPJYmytqNoRQYDnz5VZof1/cz8pE1TVnVD5KLEF5Gplk
	 u9p98cCDNqp+cUel7LvuEV/Tx1t5pRy7Qo7gGUJle+Bp+FIxl0Iv7t0QEPuBxWPFDq
	 8dBPf770Jkpytsp6IGJbAvBZ/WDNMFgU8T370Uh032FI5vbXgQbk3yeujSSWYkXy5i
	 QdHP6Sg+mjGc3U7M7DCb78UHFSXhTVBWdPwq4iCFcM6o4WAPlmSQfhyAQqkkwrHsoO
	 u3WeKwuNldeCvbx/WSjJTsE2O3j/MtDS0fLuGPgLD3+zobTIza3Id1bufClVGlapbO
	 QcuN+Hkm4PtdA==
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
Subject: [PATCH v14 24/56] media: pci: netup_unidvb: Stop direct calls to queue num_buffers field
Date: Tue, 31 Oct 2023 17:30:32 +0100
Message-Id: <20231031163104.112469-25-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_093151_089189_84EC4B73 
X-CRM114-Status: GOOD (  10.62  )
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
future.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Sergey Kozlov <serjk@netup.ru>
CC: Abylay Ospan <aospan@netup.ru>
---
 drivers/media/pci/netup_unidvb/netup_unidvb_core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c b/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
index d85bfbb77a25..557985ba25db 100644
--- a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
+++ b/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
@@ -293,12 +293,13 @@ static int netup_unidvb_queue_setup(struct vb2_queue *vq,
 				    struct device *alloc_devs[])
 {
 	struct netup_dma *dma = vb2_get_drv_priv(vq);
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 
 	dev_dbg(&dma->ndev->pci_dev->dev, "%s()\n", __func__);
 
 	*nplanes = 1;
-	if (vq->num_buffers + *nbuffers < VIDEO_MAX_FRAME)
-		*nbuffers = VIDEO_MAX_FRAME - vq->num_buffers;
+	if (q_num_bufs + *nbuffers < VIDEO_MAX_FRAME)
+		*nbuffers = VIDEO_MAX_FRAME - q_num_bufs;
 	sizes[0] = PAGE_ALIGN(NETUP_DMA_PACKETS_COUNT * 188);
 	dev_dbg(&dma->ndev->pci_dev->dev, "%s() nbuffers=%d sizes[0]=%d\n",
 		__func__, *nbuffers, sizes[0]);
-- 
2.39.2


