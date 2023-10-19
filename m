Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808CECDB483
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 14:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UcK1M6ba+qPsIpOiLnurj5VZil6Dh9wjABNphkn5ocE=; b=VvlEIGPs6qEK1Wfu/KQxjN42lp
	Yv45Uh0XdSruLr/f2ec4DfQFVaOuiBG3z6ZNi1nx5hBrbmNFg8H5TzAlHr3QqyBT+FZ0iZQcdfrX9
	a1yiVNlbExXcKE6YIYjc1/w3p+taCv+DhzHTchxb7tq/lBoLAHElzi3i9Lq3fC/v2ix/ne3dcJQrc
	EwFxv0djSzc7dxvLV1zxqddH9ZTMn89aLOfjeQ4+5+sSnj5k9nL8r4b51XK8AhWiqTyp+x8DHRJvA
	fWTTaxvp70nlJH46oclprMiD1fuLjfMz7uuDF2M0hFdyFuA6wfhR8vYWMnHe/DSD1vK0CyfJ3tsgu
	S+mwRIUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtTZp-00HacH-0o;
	Thu, 19 Oct 2023 14:00:41 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSVy-00HNHf-0g;
	Thu, 19 Oct 2023 12:52:40 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:ccea:1fb5:34eb:239b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 30B06660733F;
	Thu, 19 Oct 2023 13:52:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697719954;
	bh=lM3wXK65Q+RBpyeYExb53Y3bnLmIcGL+rErhrVO2B80=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FVNQYpwdc8DuSqvFyyhSDk4fL8gSr6zFuuBoaMyQuyI8raxmb86EuMNyJyYiaASMO
	 w0xlmdpID1lTgcgb2q8P5/fMHUzPRnHWRoVKp4wUn3J3jJIL4lLIXi92nqfgKTgHzG
	 T6euM+j9iaNxZWt2XKA9GNEP33kwhnVlalGfFBiLMGSUx07i05FkfC51+w1QDLMM2d
	 68ngutdxllUtGK9SCJ/nOTblUnwOj0oVsbTzpJKUZ3AJAaQqjoJcTXbja1KTv5Av49
	 7W9VgqnH9p89g3TPNngbgzsRW1imM+gM+bUiTimEUyKFVeDfbWwE9OxSW9FGcReLM6
	 v+v4Oqqe8KLFw==
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
Subject: [PATCH v13 07/56] media: videobuf2: Add helper to get queue number of buffers
Date: Thu, 19 Oct 2023 14:51:33 +0200
Message-Id: <20231019125222.21370-8-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
References: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_055238_396760_F24C127A 
X-CRM114-Status: GOOD (  12.34  )
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


