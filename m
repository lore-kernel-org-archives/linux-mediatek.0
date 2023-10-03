Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE61E75434
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 08:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s+kMPwU0Ob0ztoTAttuAaSUVI1oC9UCyetrTZTEeb8w=; b=4xmoD79X+a1FKvpYxSeg4l6+lT
	mgE0sggmHohaUi9BXmFXQWHdSorpWcr6fXx+efyIbw31Y1lp1beMbvSpD/1QX1tuBJYYQJdrbag03
	RQPNmRaGYa7LVKjlKxG399wQ5ldpXMaXNt8xAb80pYf/379sZYx9Lnlh/U5IsP5hcEvcLnhXno+v4
	52905fGqMrGE6226nwwwnsCAngk1JlekBktWMar5c0TrUH1XxU6YBzUvHAziYWvOYnUqKq338frs1
	2luj7OQDh7QcfeaaSaVnFmvEz6ymSx8/gWHvUJS6NDbp0qpykfKPutJelkL/KN3sNGhDgCjKqooev
	RN9s88Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaRd-00E3kX-25;
	Tue, 03 Oct 2023 08:07:53 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaR5-00E35s-25;
	Tue, 03 Oct 2023 08:07:23 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:b6df:b784:6a0f:8451])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EF994660731B;
	Tue,  3 Oct 2023 09:07:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696320436;
	bh=MAfzqnBElYsriZOe56F+JFfMksB0FEVAHWT7iRLKeFk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hu9hnDwWa3LgG1MmRZ4kExxD3sCgCOT6w1kdLJtauCr6h5M/r8h2i9nIZxEMWq3Zh
	 ixrqo5Y2Xyx2UbvflIeBBCU5WAjIDcstXx3oW/Imwn357J1hBvTAF+fh6SzifeF1FV
	 JXwOUZfz8GxohIEUpi+e1Oc37hK+KB1Q36tE542mlUmmL1OlDdaw0jLVir0BZHcajN
	 dVyM2PL8fFWqKbctO5VBkbPyfJewPStIQ8qEtOby7hj8FPc5W3e0uCbwd6rhLG1mOf
	 rbu1/o71sNRRz+bwtURolirHpmIsJfP09cKd1TxqvBafEiDKAvQbe9rbdQ4DWCz71H
	 Aj3tF7mPCTkHg==
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
Subject: [PATCH v10 06/54] media: mediatek: vdec: Remove useless loop
Date: Tue,  3 Oct 2023 10:06:15 +0200
Message-Id: <20231003080704.43911-7-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
References: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_010719_807924_EAD2CA44 
X-CRM114-Status: GOOD (  10.05  )
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

Simplify code by removing useless loop by using video buffer index.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c   | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index e393e3e668f8..69d37b93bd35 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -1695,13 +1695,8 @@ static int vdec_vp9_slice_setup_core_buffer(struct vdec_vp9_slice_instance *inst
 		return -EINVAL;
 
 	/* update internal buffer's width/height */
-	for (i = 0; i < vq->num_buffers; i++) {
-		if (vb == vq->bufs[i]) {
-			instance->dpb[i].width = w;
-			instance->dpb[i].height = h;
-			break;
-		}
-	}
+	instance->dpb[vb->index].width = w;
+	instance->dpb[vb->index].height = h;
 
 	/*
 	 * get buffer's width/height from instance
-- 
2.39.2


