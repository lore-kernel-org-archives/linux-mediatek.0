Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2241C41513
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 12:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ts99oHtPdgNsMvrVJzeWI3ReICZfm5oisnFd3nbTPcA=; b=LRXFDjhLXBQ7mw4RTs8l42m4xL
	1jmXa5onP4x/U3SEwuIPbwA4RBrx+lJmUdSDvBxZUZps+J4RsZ6J2jqngsRfWEijKCs2Ss4kClDuJ
	2D6kVTu7am+5MSECvJ0DPwfIJUT64lJitS45srO+2kuhyuTW4xqEbwKjOkc/HBW13OQtofReAA3Zd
	WZf7nxBbGQUWbqQHWfJbQO4UB/5InpVlRzJrOxjRybQ7odg+ZkQATcuwqCActXwEq4tF/7BPe2FcU
	J79ESwxL3s7W+X4mv2ujFbcok7BeI9McrObARrhJeIvTG5E6whIw2WFXyNER604upHM0lw43Rx5Tx
	WddItGUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSYw-00HQSV-0J;
	Thu, 19 Oct 2023 12:55:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSWE-00HNcP-25;
	Thu, 19 Oct 2023 12:52:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Ts99oHtPdgNsMvrVJzeWI3ReICZfm5oisnFd3nbTPcA=; b=EyxCo1t4iEOpaJWaZBalxIS9+L
	1YedCglL5IUPcpuKxrr+W2uiLp/ITdomc5w40jGSQCMexPD7xWtxiQ87BCdwOSd+EQvmnEBZPgVyg
	35zrRSelUOJzw2X7P0sS8uG42L9H6veUp4d2aLs8ZB2i2RN2T36Hqw0ZFlaLxjWd2/UO+7wxyyNSe
	qOR30qJDoJCnuFhTwkGhG6gGzmajxzRvNUaD3cHzmfbHt4lPbIaJoTiC2wo9Bv6Dma1IAJVtaWTJb
	XCo230VKllxmYfSEdR4I72AAhYN+vCk2xce67gT+ld4ayX/u8P7wFO8liWZXMrZhpzyk6GIqhC4oO
	wp8wHuEQ==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSW6-009rTG-0v;
	Thu, 19 Oct 2023 12:52:52 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:ccea:1fb5:34eb:239b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 15AEA6607364;
	Thu, 19 Oct 2023 13:52:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697719962;
	bh=E5t1fwehdK/+tA+H+9HRw8QC5ks/Zk2E0Mm8Cosvu64=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nv4AwtLMo+ktvAsLvTwosXAV/XukDHsGhXGvIwQsqSuC8kLRfHhqFpKvx7wPdAYBz
	 tk1j49lyLcZqz5BNX1+GHhj2Tiem2APSkgRkWW+ikaxm+onkGc8nIXCUW6Af5woU3F
	 RRPtB0OADzbQFXMOIY8w4mpcLdbGuAdFGOqVMHJpwRdI0PqmAmKR4sT1IHLX8VPKIP
	 QViC9ns/Lbv668XYXbbEJMUMI0fv9iJOuGPVonQHEjuIULSrgdWYpBmnK7gHYFxuxm
	 NVxe2PHetu7HD2lgipemkoJAkiATJhgT2nx7PVhLCo7P2m/7IxMU+K37uVygqOxn93
	 T6QbQhqYIatzA==
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
Subject: [PATCH v13 22/56] media: pci: tw686x: Stop direct calls to queue num_buffers field
Date: Thu, 19 Oct 2023 14:51:48 +0200
Message-Id: <20231019125222.21370-23-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
References: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_135247_295279_0679F53D 
X-CRM114-Status: GOOD (  13.06  )
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
CC: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/media/pci/tw686x/tw686x-video.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/tw686x/tw686x-video.c b/drivers/media/pci/tw686x/tw686x-video.c
index 3ebf7a2c95f0..6bc6d143d18c 100644
--- a/drivers/media/pci/tw686x/tw686x-video.c
+++ b/drivers/media/pci/tw686x/tw686x-video.c
@@ -423,6 +423,7 @@ static int tw686x_queue_setup(struct vb2_queue *vq,
 			      unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct tw686x_video_channel *vc = vb2_get_drv_priv(vq);
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 	unsigned int szimage =
 		(vc->width * vc->height * vc->format->depth) >> 3;
 
@@ -430,8 +431,8 @@ static int tw686x_queue_setup(struct vb2_queue *vq,
 	 * Let's request at least three buffers: two for the
 	 * DMA engine and one for userspace.
 	 */
-	if (vq->num_buffers + *nbuffers < 3)
-		*nbuffers = 3 - vq->num_buffers;
+	if (q_num_bufs + *nbuffers < 3)
+		*nbuffers = 3 - q_num_bufs;
 
 	if (*nplanes) {
 		if (*nplanes != 1 || sizes[0] < szimage)
-- 
2.39.2


