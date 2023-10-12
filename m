Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4ADC41513
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 11:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UcK1M6ba+qPsIpOiLnurj5VZil6Dh9wjABNphkn5ocE=; b=sYX9BiY2oKBLmIlYIpJmx3enKS
	S9BQU5Wolq3zjA0aYr5SpG4C8PA/E/ROg3FiUW5lcPjJIzfluu7inOT9qxXtZTQi2wzCu2TrFpcmP
	4s6JVk8Shg1DjUEbaWxANW+Ds0B9QRE98qRz54V7Eye6f4M2LEFdRE/G3FntazD6yTQ7nNC6AeSMn
	248LJTMzDcQ8UecGGrNE4x1FrReOeNPneh+WqAIaUsFVbDrUz1JLjn+XDW8Jl5i3wrprK97RU3CJ1
	zdBwx9bMcaIv2iN0kb7Gn56e5/YFgPbj6Xyi7EkDLya8iwOG/icRjHe1eL6wRDNzUxDTUSU1Qls80
	fHjduTNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qquAF-000oeq-2o;
	Thu, 12 Oct 2023 11:47:39 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqu9Y-000nuX-33;
	Thu, 12 Oct 2023 11:46:59 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7ae7:b86d:c19a:877e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EF28A6607350;
	Thu, 12 Oct 2023 12:46:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697111213;
	bh=lM3wXK65Q+RBpyeYExb53Y3bnLmIcGL+rErhrVO2B80=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cgcyRpJVkzZnipPZ8a0wBHk4u4e5u/VyFtdTKHoQQNPvYdMqr55oBWzpZfHTh0e3a
	 giMKZFpip9opPC9lVsURFcU9P3Wj9XWNpC70hS6dpQ/r/WdgvcfN3HfOnj1OUc7CRt
	 lRpBSRFtvqaM58EaOSI2bJuIp6/U0sbtw6oyvepdoOf1EJr7aCkFzNg2gDCtVE+Kua
	 0LwWWKKKOOWsZALkqnbAtULrnrj8X8jT/sMTjNq1V3CFj1LZFhLSLr1lKWGxOCkUqO
	 RL2gN7+WDWiHGkxWzKUVdHEngBMOu03bnHiTG4kZD2u6Ifn2FRLFSaUTF1ye1+qWdW
	 gvmt79KyABSZg==
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
Subject: [PATCH v11 07/56] media: videobuf2: Add helper to get queue number of buffers
Date: Thu, 12 Oct 2023 13:45:53 +0200
Message-Id: <20231012114642.19040-8-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
References: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_044657_175700_5FED921F 
X-CRM114-Status: GOOD (  11.95  )
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

In the future a side effect of introducing DELETE_BUFS ioctl is
the create of 'holes' (i.e. unused buffers) in bufs arrays.
To know which entries of the bufs arrays are used a bitmap will
be added in struct vb2_queue. That will also mean that the number
of buffers will be computed given the number of bit set in this bitmap.
To smoothly allow this evolution all drives must stop using
directly num_buffers field from struct vb2_queue.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 include/media/videobuf2-core.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index cd3ff1cd759d..8f9d9e4af5b1 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -1139,6 +1139,15 @@ static inline bool vb2_fileio_is_active(struct vb2_queue *q)
 	return q->fileio;
 }
 
+/**
+ * vb2_get_num_buffers() - get the number of buffer in a queue
+ * @q:		pointer to &struct vb2_queue with videobuf2 queue.
+ */
+static inline unsigned int vb2_get_num_buffers(struct vb2_queue *q)
+{
+	return q->num_buffers;
+}
+
 /**
  * vb2_is_busy() - return busy status of the queue.
  * @q:		pointer to &struct vb2_queue with videobuf2 queue.
@@ -1147,7 +1156,7 @@ static inline bool vb2_fileio_is_active(struct vb2_queue *q)
  */
 static inline bool vb2_is_busy(struct vb2_queue *q)
 {
-	return (q->num_buffers > 0);
+	return vb2_get_num_buffers(q) > 0;
 }
 
 /**
-- 
2.39.2


