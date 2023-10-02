Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87A3E784B3
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 12:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=APYp0uFJC2Cv/vh8gdm1S+i0NM5yJouihmXqf14V/JE=; b=Btt+8BigU3bOtqTlC60pL3f8w+
	A8UPKs+Sc/jWBkP6iAKRODTNywcowMox9X3coG7gcN31LwIX9deUoyf1jOnC0Z4VjVBqadr2Dx8Ca
	uZzQrExsDQ+7eAx5E7jnkoX850wI+5pbJNgJMfxVafiJEI9CobT/Ny2uV4okBy7pvBmTcpfopc0BM
	fyTem30njmGJXiYKMrvpAD4wzYQMgP8iy7UUkVkohaJqPkb2rCfQXjA4xjOsNdEa/vnjs0QNIns2z
	dbqhf0+V8KqT0QJk6DErLdpgM7otKiZaGzTvGtspw+JNTV71z566v44RE1CQxDbl2bFnVwYIpT1wV
	7RROxa0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHjm-00CeTl-1G;
	Mon, 02 Oct 2023 12:09:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHhP-00CbWL-1j;
	Mon, 02 Oct 2023 12:06:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=APYp0uFJC2Cv/vh8gdm1S+i0NM5yJouihmXqf14V/JE=; b=A7K3JxqRhvDT2LdzCfKzDmiCil
	+pVPgeKCpqv9xtbxJZcjCB5SIcrw7e2UOl+obMoHCJllbkmUTCgwib29TU4fr8rKq2uyuC7ImT84a
	KL8HZeGMUot/Xq+N4E01R5nYNMNHuYIMErxCxrt4ph9/gD1yFUheWmr0DkGOqGVhtL5M/CPHGCglz
	0e+rU/bcVBY297qXcLEL1k8fVpKSd/GyLBwjmijlyaNKD8kAF7hMFnBDNsFvo5p2dcheVNwd+4SqS
	Ghp/ARPfOVmGlhHpY6Eyh5jPBXx4vRDXbDVMV7o1sNe/LrMPBXZmxz8kEUhWN00879Nc2xZ6OwidD
	WFItdQ9A==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHhC-0090ND-2M;
	Mon, 02 Oct 2023 12:06:53 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:9537:67ca:c85e:d0ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 64E21660735D;
	Mon,  2 Oct 2023 13:06:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696248399;
	bh=ds3q8wqXSU9KVQQlLH/PuQAEX1eguF3zVlgf4I/w/H0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I5KklOKmAYqfs01UmjuHuRCO2CT7826IiucqUSUtoenKKJClyTm9F+QpyGPT/eHok
	 kWC/acVlpvrHnHBVFo/0OqGkSsRT5d7GGrSD+xXsWz2VslyZimIiz96aR85j04ve9c
	 oa2y1aOoApgBDSlj41f5Em214XY/av0kbDHcMWJUQcbw4OCZfbj3txGSFvQFsYL5Zo
	 jvk/h78eNLT7u7dLBwLMxYUXLH1aHeMueHCcdwfzTa+29yF3XyFEDZybui/SbkOz/u
	 yOUvaGnJNas+D7QtxU1X/kciRGNcf/CPYhPnr4LLIE30/jb4Mcgm2S5eMqO0HJP6oJ
	 YX9bjkzffpZUg==
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
Subject: [PATCH v9 28/53] media: pci: tw68: Stop direct calls to queue num_buffers field
Date: Mon,  2 Oct 2023 14:05:52 +0200
Message-Id: <20231002120617.119602-29-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
References: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_130649_001212_528CE655 
X-CRM114-Status: GOOD (  11.50  )
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

Use vb2_get_num_buffers() to avoid using queue num_buffer field directly.
Remove tot_bufs < 2 test because min_buffers_needed is already set to 2.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/pci/tw68/tw68-video.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/tw68/tw68-video.c b/drivers/media/pci/tw68/tw68-video.c
index 773a18702d36..c0a8257b02ca 100644
--- a/drivers/media/pci/tw68/tw68-video.c
+++ b/drivers/media/pci/tw68/tw68-video.c
@@ -360,13 +360,11 @@ static int tw68_queue_setup(struct vb2_queue *q,
 			   unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct tw68_dev *dev = vb2_get_drv_priv(q);
-	unsigned tot_bufs = q->num_buffers + *num_buffers;
+	unsigned tot_bufs = vb2_get_num_buffers(q) + *num_buffers;
 	unsigned size = (dev->fmt->depth * dev->width * dev->height) >> 3;
 
-	if (tot_bufs < 2)
-		tot_bufs = 2;
 	tot_bufs = tw68_buffer_count(size, tot_bufs);
-	*num_buffers = tot_bufs - q->num_buffers;
+	*num_buffers = tot_bufs - vb2_get_num_buffers(q);
 	/*
 	 * We allow create_bufs, but only if the sizeimage is >= as the
 	 * current sizeimage. The tw68_buffer_count calculation becomes quite
-- 
2.39.2


