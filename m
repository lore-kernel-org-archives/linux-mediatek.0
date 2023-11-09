Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFEAC4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 16:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UNE2NhVSXEPMI8rRmKuC4SF+fa5IUmikIoGx9xx7pjw=; b=NKGs2/YUA9KbtodUCDLmrceYNg
	vcYwWr5jGUhFaEMRqhVGpCjv5pHtkXfUE3kxQJRUTmPeIECYsgjJ7az0gtks5gdR9Y6eekJSBqKNA
	tK28ZM3yzRh2uQReKElWcCRQUGpd7zglSwOFWiBBt6SqCVqjWbI+p42Cx4luAiQgmxkVAmhlt4BU1
	MMROLd4b4cETv95SFvAEUen0LllrdoixpP4NiNptcWB+Kwo/InbubtN0j742kWxx37xQpRTcaWQ2T
	pLjqc6Kn0/ACwILtVNsqWF3FKXBA9UotfQ7/rKyJRMz65WY/MrBre6wAytOEgBiS6MW7iLNLRCP2Y
	BgCHMAdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r182J-006kzl-36;
	Thu, 09 Nov 2023 16:37:43 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r182G-006kwn-0l;
	Thu, 09 Nov 2023 16:37:41 +0000
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D7E3666076A5;
	Thu,  9 Nov 2023 16:37:37 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699547858;
	bh=bV0ERtEqdV4yHcsPhAjbGgZ+BzDtJjLwQFzfoOyB/fM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n5GvkQLlCM+m4Xl43QcH1akmp7cjecSe3ztlpuCREXLg1uS3msm9Vse6tcCr/pXsM
	 ol5GEKFBMW6gz0UHLPpBld/TQ5obsJKUaQXFTZzddvR8Kxau6yJlFYUpcKggK5tI7u
	 sblcvHwesYLJHGmgOSbLapbg/LR4YyK5elk8xwsRuoy+6W7Zm/Q/Dl+ELC97Yr5q/+
	 37KVrPg6reMWapTPKyelhKv47bi1oQwudRqlHaow5RuOXFdeuE46LVmo2ftXoQ8CAZ
	 htwbFEiSDwbAdQuij7SnLGVMv9teO//GHRQd+U06BbqrDh4IT59IQHuYVHUGt4QcIn
	 f3avZvAJTgbnA==
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
	Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>
Subject: [PATCH v15 14/56] media: sti: hva: Remove useless check
Date: Thu,  9 Nov 2023 17:34:30 +0100
Message-Id: <20231109163512.179524-15-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231109163512.179524-14-benjamin.gaignard@collabora.com>
References: <20231109163512.179524-14-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_083740_401566_7FFA3E8C 
X-CRM114-Status: GOOD (  10.43  )
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

Remove index range test since it is done by vb2_get_buffer().
vb2_get_buffer() can return a NULL pointer so we need the return
value.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>
---
 drivers/media/platform/st/sti/hva/hva-v4l2.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/st/sti/hva/hva-v4l2.c b/drivers/media/platform/st/sti/hva/hva-v4l2.c
index 3a848ca32a0e..cfe83e9dc01b 100644
--- a/drivers/media/platform/st/sti/hva/hva-v4l2.c
+++ b/drivers/media/platform/st/sti/hva/hva-v4l2.c
@@ -569,14 +569,11 @@ static int hva_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 		struct vb2_buffer *vb2_buf;
 
 		vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, buf->type);
-
-		if (buf->index >= vq->num_buffers) {
-			dev_dbg(dev, "%s buffer index %d out of range (%d)\n",
-				ctx->name, buf->index, vq->num_buffers);
+		vb2_buf = vb2_get_buffer(vq, buf->index);
+		if (!vb2_buf) {
+			dev_dbg(dev, "%s buffer index %d not found\n", ctx->name, buf->index);
 			return -EINVAL;
 		}
-
-		vb2_buf = vb2_get_buffer(vq, buf->index);
 		stream = to_hva_stream(to_vb2_v4l2_buffer(vb2_buf));
 		stream->bytesused = buf->bytesused;
 	}
-- 
2.39.2


