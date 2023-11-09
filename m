Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7EDC04E85
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 16:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zE7fFYDhk2KuJYo8YaOtNLGkkcBx3sSUAaNwWCk2z+A=; b=pLfyigj4wsb0JhkwhB+QaES12Q
	W2ufDjU1Gh/iOLiZIKbbCdRpgIZMqXrP+IGgA9eGZmw8TQExjyWxhIKeA/izBMKLuS3PhaKhNsyhf
	+1c3in0YuYiVAj/Ab5oKi9z9RIvr703pcp00xvYvEKcxbqAPE3ciGAdmvIPesFVsPa95GlEoQf7dj
	BKmkMi8hXq+z8owdH2msqel4y2QT6X+H+jzATyT+mo0feRpe+V0yFTJsNCLEs3h4DAS7uK9nr/Nf/
	vfemFtdaEB/N3G1QjaPF07aP9IJuR0tVnPeYyZbuUhdvQzY422pQ6rPUplg34OFT9XeunSKwptKvi
	a3uB8baA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r184D-006n8U-30;
	Thu, 09 Nov 2023 16:39:41 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r182q-006lbn-0O;
	Thu, 09 Nov 2023 16:38:17 +0000
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C3D5966076BA;
	Thu,  9 Nov 2023 16:38:13 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699547894;
	bh=VwZU4+ckcXzSAwnWbSC53r966DVTmWsb2+Sz1f2VGIc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dll9Owb3ybwYnDK8Q7X0yrqAA1cXb582B4OcCJoiE+pSC1HOjwsi9CO2kTjWfnHom
	 uT0rJ4Z/kXSD43XhiJ4hHQHjJ+gykyx7tC17X/qiCT8/M3Knfaqt1T7sPijJaonJzN
	 x9r7QJMgYi5I8wf40bQJEwEvp+Q+Ei5wkOETxRa2JEi99zC3uIN7D9XiDHkvT3sUbZ
	 NcxyM3l1WAvmwodoCbgjZ7YslUwgJZgyI19uy+fyP2Cfx87GKoqJ+ZJLlWMs18F2Y4
	 dO7nSMKy+hEc2aJxgswqPq+rPQdKI2ge+RHZ9dsHvmVsrDxYdj4OgsbQf3iLwNdUPN
	 lMxe+DWioTspg==
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
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH v15 34/56] sample: v4l: Stop direct calls to queue num_buffers field
Date: Thu,  9 Nov 2023 17:34:50 +0100
Message-Id: <20231109163512.179524-35-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231109163512.179524-14-benjamin.gaignard@collabora.com>
References: <20231109163512.179524-14-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_083816_315554_D2948009 
X-CRM114-Status: GOOD (  11.85  )
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
Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 samples/v4l/v4l2-pci-skeleton.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/samples/v4l/v4l2-pci-skeleton.c b/samples/v4l/v4l2-pci-skeleton.c
index a61f94db18d9..a65aa9d1e9da 100644
--- a/samples/v4l/v4l2-pci-skeleton.c
+++ b/samples/v4l/v4l2-pci-skeleton.c
@@ -155,6 +155,7 @@ static int queue_setup(struct vb2_queue *vq,
 		       unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct skeleton *skel = vb2_get_drv_priv(vq);
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 
 	skel->field = skel->format.field;
 	if (skel->field == V4L2_FIELD_ALTERNATE) {
@@ -167,8 +168,8 @@ static int queue_setup(struct vb2_queue *vq,
 		skel->field = V4L2_FIELD_TOP;
 	}
 
-	if (vq->num_buffers + *nbuffers < 3)
-		*nbuffers = 3 - vq->num_buffers;
+	if (q_num_bufs + *nbuffers < 3)
+		*nbuffers = 3 - q_num_bufs;
 
 	if (*nplanes)
 		return sizes[0] < skel->format.sizeimage ? -EINVAL : 0;
-- 
2.39.2


