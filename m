Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01587EEAA41
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 13:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qtQrheDOTB5W1kECh5xWol0Np4SwhxAT7DqMouSjQ20=; b=cDB6SUPx1T9N3DuQ9N0w278UMe
	6sHj3HyCffQN1KjH7VDXZ70GFM4AIa4ua34nqSc0bS0pbDNfALyrMVDcOOA8/ox29X/OTj7j4iboQ
	E5aZxM/umHw1kc07Yi0tIaMqqYdT+8F47UBrlL4FYvjjqK0nr4KWkBWT1dyBlGSyX18ynTt7eOLAk
	ZgF8z4z8TTDvLob0a7EtAL7EUOsaaVGPG3hmOlFusVRfsR7B+ryJ9doK03pTWjjq7BTDR/UcNsHsg
	26vlJhFhZNFQ68UCqvcIrOWjurkaqMI8tiifU2X1bAtM56xb22Di9QAhFW6qUvh0vytCL5OBQOSkk
	ac6K0uLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmVu-008Uln-37;
	Thu, 14 Sep 2023 13:36:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTe-008SOt-12;
	Thu, 14 Sep 2023 13:33:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qtQrheDOTB5W1kECh5xWol0Np4SwhxAT7DqMouSjQ20=; b=GR7TsPCfbRhWy2QiV36tcka+0p
	ar1wyvk+GAnqnqZCp2r0tJftLv580F5cwu9xiqEmVxindAZW9Zv3abw2+f+RqDl9195ks/b44QwIc
	uNvdI+PYcPIpEStmHkOsDXm3BDlmIzNCa6UA61frU/RF1x8dELJ+JDPup76yQ6X3aRPkT3M4wZKMO
	kis48B+XL6U2oHV8hrdC2b8Ie6DIGAYlUuhDrQFjJWT0WladrlQZlwuDuyXpO8nKRxI8TvMlkf/BO
	L6lFmwVebCuIQAaUoT0Vi9tse9WLRlT9gyPQpF30UYD/1GZ88wskCVwz/8lZPWcSF146Huot8h0fI
	mhf3omJg==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTY-007ugM-08;
	Thu, 14 Sep 2023 13:33:48 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:36f2:37bd:ccbb:373f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 355306607379;
	Thu, 14 Sep 2023 14:33:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694698424;
	bh=m3sR68fD7RFMhs/9CpLuKCWbk5tpTajBvxLhqEExuTU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JslCudCijCNZbjg/QccsFInVeRarUdHdzzatKGlmYaf2IlaBwMKxs+ayDH1t3kGZ7
	 8N3M3Iq/vri4mZUXr13lAJH5HNrsKw0pVHZ4/Ho34xTL1/fYQzN1Vz3FQ2I+iF5oCo
	 tpxZOIcNjhRWRTT0+kwqrU7JE6cTY+loFqBLoypTd5N4gTm6ho5uGWom0Mp443EfRq
	 Kg9N2qfXsGs03r64YM8NvyfLuTrd4Gun5VoWf2r1M5gP3Ca2XdzKjIgDfTSFpl70n8
	 WshJE0HQfwhFN3QuyeVxKAAcUHFLRRl/NI1rCyRJkG5jomtFeUJkRG7n/Kzu8P7+qX
	 TjSROgV9SWezQ==
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
Subject: [PATCH v7 25/49] media: pci: netup_unidvb: Stop direct calls to queue num_buffers field
Date: Thu, 14 Sep 2023 15:32:59 +0200
Message-Id: <20230914133323.198857-26-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
References: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_143347_311239_9757924A 
X-CRM114-Status: GOOD (  10.16  )
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


