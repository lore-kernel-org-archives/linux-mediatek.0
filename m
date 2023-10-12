Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B86CDB47E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 11:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tNAbg+knkabZcIfZKYQJcMQ9aVj2QfkLtg7kl/Xz8lA=; b=wyZGocXwbQ0ltsxxbJSXWWepx4
	7/VwB1nQw0AXKOMg13iI5AyYwqlcM4x9Lxm1vkMSUtUeDV/wDc0Eq/mB0rGSX8BNKKPOKahDPVnAn
	XkXHUtiJ6iuHnnjPZswUbMhGnWxMH9EucJP5AwRS9WQcU3smh/8tYj5Ype6v2MA+0okU0aFGODm8j
	D9k9c32Odd/ATSfvFqheEARH7dKDK4/yHtk0vud4ey7zauzNRcsKjvAdROLarAYAernX4rdduNGGY
	KjaoBl/qImOQTRp8dF+buWjCmmdHIG8IeYEJGHtRlk1aQhsa2b24wCBUwSmn8yLf0SfHPmxdRS2ZL
	dKITC7Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qquEq-000t9I-0p;
	Thu, 12 Oct 2023 11:52:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qquA1-000oTA-12;
	Thu, 12 Oct 2023 11:47:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tNAbg+knkabZcIfZKYQJcMQ9aVj2QfkLtg7kl/Xz8lA=; b=iWZq+H5B4XpTMeCmRi+yktTKw/
	jmFxInohL9KXFDWTOpUyPBm/ZBzyAWfOdbS/KaHPnfbquvtcLIvLoIoXzW1lov13BkiYZh09rik9V
	5VJJuuLW9HSBFosq1NbvAvioVshIIHpqluC5zlsnVclgH1SqLtm1KlJVyHtRFjKtQYTupBB0Ha6Dd
	LHwIGkDQfv+yDkqsWyP5TdqCVDm6bVoJnN4ikBOvPaegB2T1buR7oR41DQ7tsB1OmwBtnd2eGFM7M
	fAyk+Me33hnAn0hEJggOymrYKcHOkvZEhniG+4zIJcUMzSqI1Wqunqd2MOfFbhiGxOocZePTF+kEL
	vVKOSYoQ==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqu9m-001nMN-1q;
	Thu, 12 Oct 2023 11:47:22 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7ae7:b86d:c19a:877e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AE3C8660739A;
	Thu, 12 Oct 2023 12:47:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697111231;
	bh=ph7BpDmTndhVgQkibEyHEMgMXbFU1u8TVxC65OSPSxg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z4bQsHlwdarOoSvvE0kmFcZznJwFUJhIuX+KgZunxJkgDfXOPlDHVX44ksW3y/PI2
	 C4TXV6ACmIscGmOvecjSzPEufYgt1c8VGw/s2WirKIlFqriJQ7bzTQ5G8fGOJoBK9o
	 h2mLve2mjj6ddLPZVv+RdsNvkMnkAJPH3k6oEkIcG8t6v2HCLxDhiTTQs/i9l2CXRH
	 guf506zU5PWhuvJvMAxLFzykRNfboNOq5eLathYpb8LGwtXShfDfmkYocbKwBqE/3t
	 A8t1emGuE7C+0aWB0uFvTHpebv/iRK+6cy5YQqw2x3GYg7rcG0AsY8wMJhJMMZGqgJ
	 Gp49iEjaDVjIQ==
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
Subject: [PATCH v11 40/56] sample: v4l: Stop direct calls to queue num_buffers field
Date: Thu, 12 Oct 2023 13:46:26 +0200
Message-Id: <20231012114642.19040-41-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
References: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_124717_552768_25A43678 
X-CRM114-Status: GOOD (  11.15  )
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


