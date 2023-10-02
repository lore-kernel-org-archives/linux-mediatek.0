Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACC0E784AD
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 12:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zSeiYCcCe1j1lVfVdT6tCVSomRhCyxFccU4DHqKuZ+E=; b=UDyrZMf4RP/ekNoDbchwGv7OEc
	7o8r6Atui1xKrxMHgPOqX4JRwnQlnePdhyKq66OVVCZtO8Pekfw06+ftwpTiN04h3fzfJulTv0Mdj
	fOT8wFQUYqo9V8JtRPASPuyWGBDR+aae+22DUzDcyFBOsZIK2MFBgohqfdkLZYzZiBDHypKycaB3u
	aN1K2yHSMBfyBBlLJVJoBym6Rf7yq7Thc23h68uSobsFjr37e+9lQOLUT7hPWRy7qW0pSqm/yoRYv
	xeIxIYq+eOAe3GZ1D+T0DoX09oSuYR2QK8HwEESzG9lB8kDi0Ai7Dz5+dgYVmU2OywcPSDGpytsDw
	tDkkl5cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHkK-00CfG3-16;
	Mon, 02 Oct 2023 12:09:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHhc-00CblZ-1z;
	Mon, 02 Oct 2023 12:07:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zSeiYCcCe1j1lVfVdT6tCVSomRhCyxFccU4DHqKuZ+E=; b=lo6mXsuRpmyV2imaNL5s/8IH5i
	fmukD5zWE8HiFdUbckvfuzn3kaLyvQIvZMuYhlEt4pDXJAgI0wWQKe5tw78/4+trFS3JWsbaQB6wZ
	WQEQphz0C5DOs5iB1pzNVyymEo1ikr+Y1MAkOROySNnnBH76mA+N31v+6Ke8THJWX9Q1L+TpvCedW
	qYRwkJiI7+xgxiNh8LOSHHDu1Kde0LyWHAPmTLPf5ILXPqNJS1V+IllfpatUNmP6MVEYmTGskRvM1
	2zF87314L2sdfmXRP3ppU7zouOry9KSpg+WBKENaOKqkts06PsBYP6bUBNaGPfYLvnPSOFFBegYoR
	kAi2arNA==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHhC-0090N8-2I;
	Mon, 02 Oct 2023 12:07:07 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:9537:67ca:c85e:d0ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 426866607355;
	Mon,  2 Oct 2023 13:06:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696248397;
	bh=uLtpgbM1S6TEQd3BheD+tuaw3lVo9oisDECpkyjdDDQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hvOOZeZefC5zgF8PsAuDdhv3eEXQISDaTtsX3H9S3Cyo3bn/LEJcDR+tLROPWHkWO
	 aWwR64rHuAUE0GFlHbMqeb2grRFR2ng0LKa/ZrsMYXyuaU6Qg5QjnAeGCsw70MnYPX
	 2itfqb85Hw3Qt4EmDWVKlJK1M16MWYer28K1NUUrNpxOkYsiBqaRPlTX6LAqfjlzax
	 90xHKQg5g6jU5XHYqRx2oceyvuY/5+6gZYJcU/ci6wVGHjEtLnW3R1eSgE339my5Fh
	 QhjKNbM8XnNkfOZwh81cXYJXXxZPmY+EsvxTPnU5xlMi5XRqfJYLdxpbqIJPhZzNSk
	 ZQP/ZQuzMe0oQ==
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
Subject: [PATCH v9 24/53] media: video-i2c: Set min_buffers_needed to 2
Date: Mon,  2 Oct 2023 14:05:48 +0200
Message-Id: <20231002120617.119602-25-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
References: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_130701_104229_12884E24 
X-CRM114-Status: GOOD (  10.21  )
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
min_buffers_needed to 2 and remove the useless check in video-i2c
queue_setup().

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/i2c/video-i2c.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index 537ebd9fa8d7..5692d0b529d7 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -406,9 +406,6 @@ static int queue_setup(struct vb2_queue *vq,
 	struct video_i2c_data *data = vb2_get_drv_priv(vq);
 	unsigned int size = data->chip->buffer_size;
 
-	if (vq->num_buffers + *nbuffers < 2)
-		*nbuffers = 2;
-
 	if (*nplanes)
 		return sizes[0] < size ? -EINVAL : 0;
 
@@ -798,7 +795,7 @@ static int video_i2c_probe(struct i2c_client *client)
 	queue->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	queue->drv_priv = data;
 	queue->buf_struct_size = sizeof(struct video_i2c_buffer);
-	queue->min_buffers_needed = 1;
+	queue->min_buffers_needed = 2;
 	queue->ops = &video_i2c_video_qops;
 	queue->mem_ops = &vb2_vmalloc_memops;
 
-- 
2.39.2


