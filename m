Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A4DCDB482
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 12:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VM4NzMJMGv79npf1U7MuzJpl4mPtUAdgVx8a3O8ahTM=; b=1SDfteIToR2cP5qcF0fs0NyVZp
	9LzvHsBfAuMmSnwS6h/dDv7HHGTtgo/ggcuzM8gXosDQeBPumjDtDOx/tdzPfPa7SA9Gva0VCzD+s
	LZnQeZQHCR0laBSni1NSRYi5Kc9l/8HPguoSWA0IggEacDvRnK+hsjYZxJsGolhDAjcerXI2YpiXj
	F8AdcEIG2Z+MhXuzVTLYHs8s6kfxZ7P76ZBTLWbE2bfYCqY+MOWjaSsTniWsvCY1W4hfKAD+YyKhC
	WP/pjGyxdRuJ4Jo6Kfve+bwH3N8932ISAsgCDARNbm2j6tH/hczn3nR280Jf8G7OfaaeSe9AfzoW4
	A2vpMvWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSX2-00HOUl-0p;
	Thu, 19 Oct 2023 12:53:44 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSW5-00HNQa-1g;
	Thu, 19 Oct 2023 12:52:50 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:ccea:1fb5:34eb:239b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CA2E66607355;
	Thu, 19 Oct 2023 13:52:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697719959;
	bh=NE9Dr0xaEnB6dw9lflcnBD1PZMhluEk9SDENx9Slyak=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MMIH1oazqYayxx+w2kPp81TINqbJbDetnZ4OYCkCDUGogjR6PlJZf1V1z3rtPGmHp
	 UIBHtxgjXelaAs7zg8kKzE2L/VmIRMe8AmfQHRQsnGiLYvRnPJWP2gGkYgEGbMP7QJ
	 UYcblL6E57NhMPQyTKtSLqPXEXxnpAwvlMNRNJuI8jHiPBZq6H2tvVmDZt2L0tU73s
	 3cJPQyVqsqJ2BFe784EfEiMrqeb1s4JEfiKsSraB0Wo/e7/rOoX9SItokDdQ/yLfwR
	 18ANMkw+f+HfUb+4eJQ+/+PivwNFXzhbbeH4AMZjuLQ3T8kS4CmXov5QgfKsM43E65
	 S5qfCSXlN817w==
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
Subject: [PATCH v13 16/56] media: atomisp: Use vb2_get_buffer() instead of directly access to buffers array
Date: Thu, 19 Oct 2023 14:51:42 +0200
Message-Id: <20231019125222.21370-17-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
References: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_055245_741330_588A3298 
X-CRM114-Status: GOOD (  12.32  )
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

Use vb2_get_buffer() instead of direct access to the vb2_queue bufs array.
This allows us to change the type of the bufs in the future.
No need to check the result of vb2_get_buffer, vb2_ioctl_dqbuf() already
checked that it is valid.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index a8e4779d007f..a8a964b2f1a8 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1059,7 +1059,7 @@ static int atomisp_dqbuf_wrapper(struct file *file, void *fh, struct v4l2_buffer
 	if (ret)
 		return ret;
 
-	vb = pipe->vb_queue.bufs[buf->index];
+	vb = vb2_get_buffer(&pipe->vb_queue, buf->index);
 	frame = vb_to_frame(vb);
 
 	buf->reserved = asd->frame_status[buf->index];
-- 
2.39.2


