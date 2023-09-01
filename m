Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D331CA0FE6
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Sep 2023 12:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GhnSqOiSmfX2a0e2tL7vBTe/pZHQ5iui/RY1FADwjgE=; b=sU9/Obo3MRlGcJhezvH/Pfrzrj
	5GiN8eGybNozRuT2ehIfvMaLgGWUz55fT/JIOexKxw+MSwoV2HKcN8ZxlfcZNO/NmnkP3DqxgY2ZR
	lXtHYCeNu2XiIp1vY2gFPoJ1ybLwXXj3js2zGpDoYSixD7o7dnCdgI7g1E0M/pOuV32vbdR6fgz5N
	QC9sjP7izdZq5oZT1Q/IoN/thQu0Q/8P70MruY6jF/SNlM4VaRXiZ6/vUko9eOgAWNf2/1PK4SqxX
	dRqq2dhg8ZBwm3u9WSeRNXZcLt78VnmR2vTuc47FzLyTW/0DbDaoYHCZOXdtWFqmHNie4NC/9ra9F
	08FeVC3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc3WG-00HUrK-35;
	Fri, 01 Sep 2023 12:45:01 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc3Vm-00HUHH-0b;
	Fri, 01 Sep 2023 12:44:31 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:4d01:31d2:de6b:d217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A1E8166072BB;
	Fri,  1 Sep 2023 13:44:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693572269;
	bh=iZqd1w+9hJa+OQD7BuHGMyLxr+up+MZt6k1cr275d/4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hm2IY74ADMxYH+WUnGfIG9YdDvJ+dismIO55Y54oCIsLhL8s4mpd51mMQHD++U50Y
	 v5ib2/JwRyzJXuc1iqBQLS4zLPLeFfJ9M9ByvSKr6C+HSHKnW07ZaanNXXnpuixJOi
	 PoF2vhdPmTRQkytmBxIP3Oi2KBm/kBSjLkSO68XPdzvDytSnDKZnAVXkLuYEx6tZMW
	 6vQWsaGb6dhSB8u7olFOzUsjKtwSffjg8sHVmq7R7eCZtudoJxsPo9KG7Y50wp4x6O
	 1gXmoFp8w9LrZM7bKMEeqOCN1jZk/ICot3tzAjUBxRgxGRVn9n1MOU+U4fbnRDw6LG
	 XPwFVErdrbUjA==
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
Subject: [PATCH v6 07/18] media: sti: hva: Use vb2_get_buffer() instead of directly access to buffers array
Date: Fri,  1 Sep 2023 14:44:03 +0200
Message-Id: <20230901124414.48497-8-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230901124414.48497-1-benjamin.gaignard@collabora.com>
References: <20230901124414.48497-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_054430_364806_C03C402D 
X-CRM114-Status: GOOD (  11.08  )
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

Use vb2_get_buffer() instead of directly access to vb2_buffer buffer array.
This could allow to change the type bufs[] field of vb2_buffer structure if
needed.
After each call to vb2_get_buffer() we need to be sure that we get
a valid pointer so check the return value of all of them.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/st/sti/hva/hva-v4l2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/st/sti/hva/hva-v4l2.c b/drivers/media/platform/st/sti/hva/hva-v4l2.c
index 3a848ca32a0e..326be09bdb55 100644
--- a/drivers/media/platform/st/sti/hva/hva-v4l2.c
+++ b/drivers/media/platform/st/sti/hva/hva-v4l2.c
@@ -577,6 +577,10 @@ static int hva_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 		}
 
 		vb2_buf = vb2_get_buffer(vq, buf->index);
+		if (!vb2_buf) {
+			dev_dbg(dev, "%s buffer index %d not found\n", ctx->name, buf->index);
+			return -EINVAL;
+		}
 		stream = to_hva_stream(to_vb2_v4l2_buffer(vb2_buf));
 		stream->bytesused = buf->bytesused;
 	}
-- 
2.39.2


