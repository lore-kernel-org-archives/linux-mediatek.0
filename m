Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BE0CDB482
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 12:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RNH8B9gPylxTtM01bKtOlQf9akbpmUzdDHvgh+kzWPw=; b=HHXBlewsNhZwu2//jE4Hf6CjL/
	+vqCxLZy/fHTpWWv3BJqNZFt4Ksfkd750ck3RXYYTdLmspxdyQnhpb2Wg+FELGxvHCud+jAguxv/0
	hRSHOz3kFiC79SWUOFisbTwOW2l/8vVJNzYLDFg3IyWcntUSshUCuJ3e/YSRz05kYIxf4+5qpxsiE
	PsX9Cm8rg8Y6QIi/gbEN+k7s/OwfNT0wh4i8hjRhcj5yHgJWFxs7VsIwSwW0XoNpqtnm+a/jLK90p
	V0r5KxPwfPzNytXw87lzwA26AiN2sJbb6lUCVA6S49GafbOLm8YvsdVGOQpdEJZmYpxUYpTQVjZyy
	om+E/eOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSa5-00HRaR-1S;
	Thu, 19 Oct 2023 12:56:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSWM-00HNmP-1w;
	Thu, 19 Oct 2023 12:53:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RNH8B9gPylxTtM01bKtOlQf9akbpmUzdDHvgh+kzWPw=; b=j1+2FkvbFhPAciI9TeHERzCAuU
	Sca8YfW374MvkBvOcNKZY5bW7QxmZF4gh3sVsHesF2GB+1B8/SVqGUtkvBGI57eg8b5wV9Gv4y+ar
	+HGiUW3xilxAwzhKxncAySp3wQT3h3d5rz/UdUbEZddd2Vdw8+HursX2f2/SQpnXYe1VrrnN8NFev
	sY4H+vj44h5xITIfHsTXkD7PdL1OQ/zxucsZAxpDDSkSaoYDwBq8R2xr+mgryfLVRxnm/r9HS8jjh
	AJIYn6DB6NWk69L3cpXtIYHNtOaLp0SsrWkURw1xiD7N49FLj6mbFx845yQwtMA+IHOW85oGgIdYS
	focwEktg==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSWE-009rWb-1z;
	Thu, 19 Oct 2023 12:53:00 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:ccea:1fb5:34eb:239b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 014CE6607382;
	Thu, 19 Oct 2023 13:52:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697719971;
	bh=KjApYJIBwjQar3zDS5eK/9rcHF3+Kx68u3lDScmGVYg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kcvKob/9JBRvVHTLOOOjKxOfUSntTeKcqSHyXPZc/HiO4dW78FIX29uqGvA0KmzQl
	 LhsQBcSzP7OKzT/4x9Z7+av++aoeAbmheKpbgfKo3Kq20IW5cUED7axibzT94EqRnG
	 OCwyhpvfpDNkJhKu5VdjBRfVoOIsJJXwaSEWPo+rZqaURnwb0yJrO128kZetbpPPb6
	 90dUMSdZ7rLE2kTIMjtEKXqyqCz0sQh13lMemFnrQefzrK4ZwUBtFLYso/WDZNKELL
	 hFTAOOYEJfSEq1p/wThdz8vPKiVggYoZ7af8QOVs/iHHtt5aDndWw3NEHaHdLDPDQ6
	 YEIirX7J9hpaQ==
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
Subject: [PATCH v13 39/56] media: usb: airspy: Stop direct calls to queue num_buffers field
Date: Thu, 19 Oct 2023 14:52:05 +0200
Message-Id: <20231019125222.21370-40-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
References: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_135254_927960_250A221C 
X-CRM114-Status: GOOD (  11.63  )
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


