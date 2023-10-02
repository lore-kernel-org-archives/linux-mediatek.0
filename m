Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5B9E784B5
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 12:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qTuPHPU4Io44nAdkQT6nBOAqUL8jchiAXtKAUc5aY3c=; b=PP7pzNN3qFAilJ+b+lRlkSuCNE
	7ucGytdl4y+UAcy2k2IC/k6JTsWBOPGdpxIynJppXQBsEQJKFnwrhKHliTViGY+nySJ72f2knZkpL
	knYpoql9mo+g8Kad1541GBB4Aa6YeF0K2FKRGa4X/WugPxudBC4UZ3b0biUd6ICVAnP652L4gm9nR
	CXoR5XQVg81SJPEJdNlc6L4PeKZ6gu+9bdGbco0qLI/Cq7DHn3hSZgOzx+2L5aymbBy0G6w+QNz07
	onkgOCyv2PMuJnAKgpLBui5xUtXZcRSYgOJM50imJJD61p/mr4q8CzI39MIIuTp+r2jrbmQN7Irb/
	7NMbcQLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHjh-00CeME-1o;
	Mon, 02 Oct 2023 12:09:17 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHhK-00CbP1-0h;
	Mon, 02 Oct 2023 12:06:57 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:9537:67ca:c85e:d0ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 724486607359;
	Mon,  2 Oct 2023 13:06:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696248406;
	bh=nwepyznt8z6pxABzkpFHR6clGV59kYVToyX8aj6cN+w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XWIVFqhWOpa4B7VDWOVRJGz3fA17ClvB9LjIPQwm/0c8Kl9uyMI0ppriwDG9c22MR
	 FOI5dyNd7BekgAMf8F0Q4+jbg0QEodgR3S96WKOLELLdWNlrf2EdSjVfqLGWlWWETw
	 og7iUoEvuPrma5iT45XjpFobPF1YQPlx2710pE0Ho5SDD09tEYnW3JvI7cnVCIDbI+
	 y0gPcM4UR/uN3rwrDM928sxDIl++K9qR5tOnESOFRg7sT7E8AA1XqOuPZ3JymIb9hg
	 skTIYPbhzLEas0808uc5H0Pc5vCTZWZyMxUxvj6ZOZsA/Zneo/ko3gD5fBMvnmPQL+
	 uhQlrYixtszvQ==
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
Subject: [PATCH v9 41/53] media: usb: usbtv: Set min_buffers_needed to 2
Date: Mon,  2 Oct 2023 14:06:05 +0200
Message-Id: <20231002120617.119602-42-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
References: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_050650_483394_62F5B0C8 
X-CRM114-Status: GOOD (  10.79  )
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
min_buffers_needed to 2 and remove the useless check in
usbtv_queue_setup().

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/usb/usbtv/usbtv-video.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/usb/usbtv/usbtv-video.c b/drivers/media/usb/usbtv/usbtv-video.c
index 1e30e05953dc..0e9e860be47f 100644
--- a/drivers/media/usb/usbtv/usbtv-video.c
+++ b/drivers/media/usb/usbtv/usbtv-video.c
@@ -727,8 +727,6 @@ static int usbtv_queue_setup(struct vb2_queue *vq,
 	struct usbtv *usbtv = vb2_get_drv_priv(vq);
 	unsigned size = USBTV_CHUNK * usbtv->n_chunks * 2 * sizeof(u32);
 
-	if (vq->num_buffers + *nbuffers < 2)
-		*nbuffers = 2 - vq->num_buffers;
 	if (*nplanes)
 		return sizes[0] < size ? -EINVAL : 0;
 	*nplanes = 1;
@@ -892,6 +890,7 @@ int usbtv_video_init(struct usbtv *usbtv)
 	/* videobuf2 structure */
 	usbtv->vb2q.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	usbtv->vb2q.io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ;
+	usbtv->vb2q.min_buffers_needed = 2;
 	usbtv->vb2q.drv_priv = usbtv;
 	usbtv->vb2q.buf_struct_size = sizeof(struct usbtv_buf);
 	usbtv->vb2q.ops = &usbtv_vb2_ops;
-- 
2.39.2


