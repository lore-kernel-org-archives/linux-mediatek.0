Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F35FCDB47E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 11:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vErr4M751FH+ODJS8LWDgvO67SFFTD8IDaC6t+0qq54=; b=szv7G1wakybhNY2kGOy5hEyeOZ
	y5Eqo/CXAXozy/yLL+Lns28bMjQtBkuwyunQ27dp6fkJFJcbvCiTI0hVA/PQrT4cVYaoicalm+bZy
	A+vAbI2kKOAXXtrzltelTUQTMvcc6xCR0wNIh7ImFHtFdBp/sBjZ7tNxYoeQXAOnNaWSHDkxH0svt
	vSiwHu6ng6PbIPX5+R57KbgKjoZFOUX53XCqPzdjuyAKnQs5sTVAak4x8L/jKGonVTITgoK6qPCCC
	r6EvTNDX2N49N6iNg8WbGrGcouRU4Nhbow8vHeE0NVU4QKh173raOdBomr0bAsPugJdPd+Cn/Pvy8
	PLdexM2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qquE7-000sU3-1z;
	Thu, 12 Oct 2023 11:51:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqu9x-000oOS-0E;
	Thu, 12 Oct 2023 11:47:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=vErr4M751FH+ODJS8LWDgvO67SFFTD8IDaC6t+0qq54=; b=m0SlOmviWwSWGodfJtU/QLuSIs
	oqOAb4WC0rbyY3r9AXMszB79pHLhRXsac/KwJSclqYFWprcJmGY8zlv1iGVp9+eD/sxRTbwiW02bK
	1myy04RSK3CpZkQK0bqGKF3opkWETMAilM1H3CRrpTTCVueDDA7zUJ5cpNj4VqRVYPYHOWxAQM4fr
	UBL5Qwl81YOo4Hes+ihulPwXr9woAO2ZluOAt0pbkBRoPL5mZ6e2VXy9riYmx/SN6L+JcHe6S0UIk
	uSsha3GL55ASRXguW8947ccAm9w7skZ3GUHbmj7nukzoOnZvhDhhgkvsab4vsWVezlSBGW7cJYxuH
	J03qkILg==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqu9l-001nKz-1O;
	Thu, 12 Oct 2023 11:47:17 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7ae7:b86d:c19a:877e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9B8D46607396;
	Thu, 12 Oct 2023 12:47:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697111230;
	bh=4MapzpufjNHuzajAFVNf3Saky5QdXUM7N6XKbxHUF6E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sh+tqfZvlHLp4RcvFAWI9TPHsUUEe9c1wixy4BO4yMO0hJozj9bOKsGSQXh+OnQiy
	 5CPc19t4mO5swR+xnWDjpmM32c6UBTZz6g//8saMQp2jo0TZj+I7oEw48/qMKt8FCA
	 pcKP9rxYxYnHHj9AMBjY9ZocwGS/unlkoipm31of+R3Q8+UGxzqL1Ghp69eU/rnaji
	 rA2tYjRUuLXSF1LwrdW1wUi1RWQ++arkhFytt58RWW4g68M4Js1ItAiRXJFs2JTR2R
	 KRKtQRfqgm2dxgfUiLRMWylUMPIw72uCrBgb9GmctInuNi03HsKZpDLP07Gh49YQ+W
	 W6UQ0TZ8ypBRg==
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
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v11 38/56] media: meson: vdec: Stop direct calls to queue num_buffers field
Date: Thu, 12 Oct 2023 13:46:24 +0200
Message-Id: <20231012114642.19040-39-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
References: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_124713_824112_A2D7B600 
X-CRM114-Status: GOOD (  11.72  )
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

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/staging/media/meson/vdec/vdec.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 219185aaa588..1e2369f104c8 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -167,22 +167,23 @@ static void process_num_buffers(struct vb2_queue *q,
 				bool is_reqbufs)
 {
 	const struct amvdec_format *fmt_out = sess->fmt_out;
-	unsigned int buffers_total = q->num_buffers + *num_buffers;
+	unsigned int q_num_bufs = vb2_get_num_buffers(q);
+	unsigned int buffers_total = q_num_bufs + *num_buffers;
 	u32 min_buf_capture = v4l2_ctrl_g_ctrl(sess->ctrl_min_buf_capture);
 
-	if (q->num_buffers + *num_buffers < min_buf_capture)
-		*num_buffers = min_buf_capture - q->num_buffers;
+	if (q_num_bufs + *num_buffers < min_buf_capture)
+		*num_buffers = min_buf_capture - q_num_bufs;
 	if (is_reqbufs && buffers_total < fmt_out->min_buffers)
-		*num_buffers = fmt_out->min_buffers - q->num_buffers;
+		*num_buffers = fmt_out->min_buffers - q_num_bufs;
 	if (buffers_total > fmt_out->max_buffers)
-		*num_buffers = fmt_out->max_buffers - q->num_buffers;
+		*num_buffers = fmt_out->max_buffers - q_num_bufs;
 
 	/* We need to program the complete CAPTURE buffer list
 	 * in registers during start_streaming, and the firmwares
 	 * are free to choose any of them to write frames to. As such,
 	 * we need all of them to be queued into the driver
 	 */
-	sess->num_dst_bufs = q->num_buffers + *num_buffers;
+	sess->num_dst_bufs = q_num_bufs + *num_buffers;
 	q->min_buffers_needed = max(fmt_out->min_buffers, sess->num_dst_bufs);
 }
 
-- 
2.39.2


