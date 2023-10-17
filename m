Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828FCCDB474
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 14:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fVdBi80fJ4g+opCYHZnOPt8ZGBYw+nciJvr68ZP2UOA=; b=kIjuEWYx3a9KkYqQf1ubNRWFci
	vtO6n2eYFL1G6juiZ+n61kNdxc9kMQK6q1YSzDDTdDIkrgJkSYzTUAuUutdVEX25/vRK/s1OHE+I7
	fqe6DGN6dDIdnfY0wuhkPO6NR/UlBMgwUKX/NVPdJ4VggSgyEWiTz4Jnmsjz96X3QXN6OG9BIQk5K
	Z+3JtM+DkciIhll+lC2oJy7Wh8horOvZz/ED39Fs054PWlauhZTQVt6NVL3X/qdClmk+OiiYUv+1F
	akicbPT4jvLgMxsMsqYumLBLobTFEEEbOrfZB8ax7+3giza+U8RZqEfN3M961hInA2IYkODWiPOj+
	6hJozdmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qslQM-00CcqQ-18;
	Tue, 17 Oct 2023 14:51:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslMz-00CZES-0k;
	Tue, 17 Oct 2023 14:48:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fVdBi80fJ4g+opCYHZnOPt8ZGBYw+nciJvr68ZP2UOA=; b=VQRuD89ZqrNxQls9RGxlnUeVLY
	Nn6nkTZvS2hGeRRO/ZT89JFRZiNNwfe2QTkHCENsVzzc65oBLI3iz/ibh6/WioqIxuFtpmDufLHHu
	jZuUZhl/dxTqZdlBZxBb0FCnygQC6H9spcN8HxyN1XK9RfC+VVuTT3hxqBkNdChPTjmdhVIVN5IBf
	Yi900rM4rDkijUlRIcVI8ZbS8Clc8h56O0joeMA3RfsGb8Td3nWCc/R6ir0ADhvxljTIqlXVix5eh
	cIaW1hMrr0+Gqm03o4F/xUMmcAciesABWrrn8gOlR501t2zRv09972z+wOo9wj4qEMVIPMWtZL2zZ
	n2nhKaqQ==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslMv-007A1Y-2f;
	Tue, 17 Oct 2023 14:48:27 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7205:da49:a7e8:59f8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DE906660736A;
	Tue, 17 Oct 2023 15:48:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697554104;
	bh=EmDlcksu9sAQe9FqbVjRgYMb2Lj2aSXClH/X/fW3THQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mo9WhV0BDyXqlFfAo0GYjOr9+ZUXjRPS8Lbg36ii3eELJhJbgKSQ3UpCjyiu7BKRm
	 FKUOxzY0Agl1F6/+uaUu7WXMJHztDCAFUjY49don+4wqnP2jplWpAMFa5IHDNXlxj+
	 kmRN0R8TcGvQWWU5DvHPSJ8aSRQwiL4xDDUN7PN9SW4zymK9NFhF8RcdO2AaKoVUOR
	 oiKv1Pmh2DlqqzMSLbRBkNrFjy1ySQGOCr5GXQFXHgvbO+qqb+snlGWhKOnSMJmKPb
	 5BfzmTyAJHCqpA+BljnVI50xlMI1t5JNCXktghKU3DmNvuay81MmBOxvnydirYRjgS
	 ohBv18ydiAGfQ==
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
Subject: [PATCH v12 39/56] media: usb: Stop direct calls to queue num_buffers field
Date: Tue, 17 Oct 2023 16:47:39 +0200
Message-Id: <20231017144756.34719-40-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
References: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_154826_123853_74E077FD 
X-CRM114-Status: GOOD (  11.30  )
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
futur.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/usb/airspy/airspy.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/airspy/airspy.c b/drivers/media/usb/airspy/airspy.c
index 462eb8423506..e24e655fb1db 100644
--- a/drivers/media/usb/airspy/airspy.c
+++ b/drivers/media/usb/airspy/airspy.c
@@ -482,12 +482,13 @@ static int airspy_queue_setup(struct vb2_queue *vq,
 		unsigned int *nplanes, unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct airspy *s = vb2_get_drv_priv(vq);
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 
 	dev_dbg(s->dev, "nbuffers=%d\n", *nbuffers);
 
 	/* Need at least 8 buffers */
-	if (vq->num_buffers + *nbuffers < 8)
-		*nbuffers = 8 - vq->num_buffers;
+	if (q_num_bufs + *nbuffers < 8)
+		*nbuffers = 8 - q_num_bufs;
 	*nplanes = 1;
 	sizes[0] = PAGE_ALIGN(s->buffersize);
 
-- 
2.39.2


