Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43D3E784B6
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 12:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YG8UIc7986tkQFuUMGejFzD4ZJcuIJ8ekFnyind3zrw=; b=KUE0HTPy9j2TZOfejkqIzBQsVi
	gx+5gJNvc4SgEQGaDBEjqyNtNZo+mczYHaV2KDpDG2p9qOKsY8zZE7WMOn/sEiZzP2pGsIkuXQ5e2
	XZqdQeAIzfW8sL77UVDf5QyW0zLDLtYhVJ8ilKaULOM/3mQ1jLM4LrHrtQqqusLg/en/LVaYEMRJa
	+RIPNMOk/Zk+pAyuYEtQKSyUMt0sH/JkL3Vb5KN0Xn0k5X9gmSBodHLbZDJoaJ1LmKyZaFALroVXA
	Lp7mD9R9thJQinWxBtomPTYuY6kGPOY4VNAmjju8wLPBar/yqUvUDgHYghNJlALorWSuB5/LYTxBR
	yUDtuuhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHkJ-00CfDf-0T;
	Mon, 02 Oct 2023 12:09:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHhX-00Cbfi-0L;
	Mon, 02 Oct 2023 12:07:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=YG8UIc7986tkQFuUMGejFzD4ZJcuIJ8ekFnyind3zrw=; b=TKGI19bPfB0XJ3T6C7L9Xrpx95
	mSqVfL8EOK2g+8FiqjPny0PXR9066uIEXtpq8ERwg5rXBkOekd0IYh+ofKAhEIWBZX0GXaaAhUfMi
	uRIdqqxCSQBzMFbJM3f4yycalmVThjOWeVv6zQmylN+195YiZ2teTKNaXZC6dBnO+sGjGA2RQVBWn
	6c00JVtlhIqQpfhsdeqtOLzqG4uu+BN38gAnq+DhlE/jvRKURTxXF38drTM04yOXU8ZpbowAihODB
	T/WjTXuQmcuDi3a7XLLU+XQZH0VvTV9t7uCvm5lysDEG72gUNFRgaM+NkWN5zRnAiSPTlH2ocFbwN
	Ze/dX6Bw==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHhE-0090NK-0I;
	Mon, 02 Oct 2023 12:06:56 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:9537:67ca:c85e:d0ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9D7C1660731B;
	Mon,  2 Oct 2023 13:06:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696248403;
	bh=RTtrEWB+iCCua3F+YDyTtBODpNsAwbuQk2kDkvELWIg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b9MuuvaVQBy3u93YZ05RdLvVIEA1QanG9CwU5BFxKw/t0UKzW6lgYKXVUrP/KywYl
	 YXJnIvA+mLA3Siz+tZXcwej+IZWL4FXiyF4MigqKKTHRIQTsNhWBcazE90GS1OJC2d
	 iXzfeKvuJz+Hw+JjUvJPm4yimqdteLwQ+yK61uPjmP4AnkmKd6/R8s1xWn2+FZFY7F
	 MEQaND3XzxBSgmFI9p4hAXGH2FF48PcDuOFiSSW9TXBkFeOEStLujzEjBCU9+lxuMP
	 VWziQzsPm1VwGE68326/W9ljDyFXdtfJcBf+a1wZqNNwTpBldQaGAukGI4wGQs6HHJ
	 B45TrPB7Rcnqg==
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
Subject: [PATCH v9 34/53] media: renesas: Set min_buffers_needed to 16
Date: Mon,  2 Oct 2023 14:05:58 +0200
Message-Id: <20231002120617.119602-35-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
References: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_130649_282767_FA6D77B5 
X-CRM114-Status: GOOD (  10.15  )
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

vb2 queue_setup checks for a minimum number of buffers so set
min_buffers_needed to 16 and remove the useless check in
rcar_drif_queue_setup().

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/renesas/rcar_drif.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/platform/renesas/rcar_drif.c
index 163a4ba61c17..8a9a70565d3f 100644
--- a/drivers/media/platform/renesas/rcar_drif.c
+++ b/drivers/media/platform/renesas/rcar_drif.c
@@ -425,13 +425,9 @@ static int rcar_drif_queue_setup(struct vb2_queue *vq,
 {
 	struct rcar_drif_sdr *sdr = vb2_get_drv_priv(vq);
 
-	/* Need at least 16 buffers */
-	if (vq->num_buffers + *num_buffers < 16)
-		*num_buffers = 16 - vq->num_buffers;
-
 	*num_planes = 1;
 	sizes[0] = PAGE_ALIGN(sdr->fmt->buffersize);
-	rdrif_dbg(sdr, "num_bufs %d sizes[0] %d\n", *num_buffers, sizes[0]);
+	rdrif_dbg(sdr, "num_bufs %u sizes[0] %d\n", vb2_get_num_buffers(vq), sizes[0]);
 
 	return 0;
 }
@@ -1311,6 +1307,8 @@ static int rcar_drif_sdr_probe(struct rcar_drif_sdr *sdr)
 	/* Init videobuf2 queue structure */
 	sdr->vb_queue.type = V4L2_BUF_TYPE_SDR_CAPTURE;
 	sdr->vb_queue.io_modes = VB2_READ | VB2_MMAP | VB2_DMABUF;
+	/* Need at least 16 buffers */
+	sdr->vb_queue.min_buffers_needed = 16;
 	sdr->vb_queue.drv_priv = sdr;
 	sdr->vb_queue.buf_struct_size = sizeof(struct rcar_drif_frame_buf);
 	sdr->vb_queue.ops = &rcar_drif_vb2_ops;
-- 
2.39.2


