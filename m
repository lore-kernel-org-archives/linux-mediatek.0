Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6ECBCDB487
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 11:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uG4E7/r1sBt2/JHh3VW9t07bzXinx1yTa+6SpOwLc5Q=; b=G61OxUL+D5olAWmmlyAhVKgzgB
	fvTHJaCNYIDjCC8JECF/mrycZ3eqmnYSxIM2S3zHdEMitDrLzSCuR+sK+1SfdhRuqQ3A83EGXNCWR
	bAG5xwEyPoPhFbCXDs7U/VXYJvEzMTvUdom44YR6CR9scmehWTZi9cOXJZIDdhy98O8/npfP0wqoe
	3NjVKtOW2y7hwjafPhZiUOvBYkY1d3sQuBE+H/tKEpXdh95v2HkwCuanW9Jzi6/4VNKBM54fTFFhX
	yRONcn7zxfZpFlfMscZOITd6l9R+zb/YgaYPnHQcsEKVbYF/gg5Rs0JRCD00jFcGYx0QpmY8oOamh
	Jf6SkJEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qquBo-000q1Z-1z;
	Thu, 12 Oct 2023 11:49:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqu9m-000oBZ-2O;
	Thu, 12 Oct 2023 11:47:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=uG4E7/r1sBt2/JHh3VW9t07bzXinx1yTa+6SpOwLc5Q=; b=KmSVzdPTnh8qM6PMHbBtkO1cG9
	DyUDtybhkN9agLhlJFIrx5XLL4ad74KSOYk+/ebNh3rQ4aysfOBxFLBKOx/k5xOrAf7U8I12+1j7x
	tGbmlg1qNn1iEfu/zQLKglN3hDRZeaYun+3enJloINAYErduVu8Qhl/rcI0rRjMo3eJM0gzJZ7v4w
	RayZVyU0xv0uTGpqpJj++xA6/Ga0HXHPGi7ZWVw3XylvRdYVXhj2jlcZJiES9q1J7hJdBdWuL8AoJ
	PIOcpC0JuzyWTkJMXw5rDcMYyJEamdyo7SDvSACF87Fu0/Y6xc9Y+1s/gBSctavKQo/JD7mwOZQtU
	Irie1V9g==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqu9b-001nHo-1H;
	Thu, 12 Oct 2023 11:47:08 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7ae7:b86d:c19a:877e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5C49B6607368;
	Thu, 12 Oct 2023 12:46:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697111218;
	bh=+ac6y9CN7AEDcWAriiIST3GyWqbq9cgUUTvdotEB6/A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Imzaqt52nbCypSbgVlMK7HiA7wfMRQz5QJ5l/b7I4hElPPTJ5r4DfxO/zMU55hCGp
	 Gf688FMecpuRjSxxtB3D1pTSjQ0LAuyhUdF7U4gKNMoR/PYNq5p/M+2nU/LTcOBJyO
	 fXs42nuD3dS3uTYKTkA02PWgRXCBOzci73PkRwhHHg6D9oQLXp7lI1nQgBB41NO9e4
	 buGTpx/3FcnbQ4qwHk3pakP73BEFc2UMjEEt4HB1l6k+uhzvR5j5GkVFSpspL2na/H
	 cj6Ur4UInc7HjGLiefWCj/jfJfyS6m5DD3l68GyNCcqOswydV4+Joq4uoMkcndvNsT
	 bOtRR17f7TYCA==
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
	Hans de Goede <hdegoede@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v11 17/56] media: atomisp: Stop direct calls to queue num_buffers field
Date: Thu, 12 Oct 2023 13:46:03 +0200
Message-Id: <20231012114642.19040-18-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
References: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_124701_043800_536CD6E4 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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
CC: Hans de Goede <hdegoede@redhat.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index a8a964b2f1a8..09c0091b920f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1028,7 +1028,7 @@ static int atomisp_qbuf_wrapper(struct file *file, void *fh, struct v4l2_buffer
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
 
-	if (buf->index >= vdev->queue->num_buffers)
+	if (buf->index >= vb2_get_num_buffers(vdev->queue))
 		return -EINVAL;
 
 	if (buf->reserved2 & ATOMISP_BUFFER_HAS_PER_FRAME_SETTING) {
-- 
2.39.2


