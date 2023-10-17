Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E3CC46CA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 14:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/pEvd4nMmJt1AF/l+YT4dreiYrspMzSxIYu8hu2Sfk=; b=zgLxCcSmDrzuRJPKk6mgCpPRyt
	XexWMX0d7cHCJ26vGVCPxuyQglyY1Kat8l/cyqi/AkCyY/YP5bruCt4fGtnqLe/8ShvU1b/7zWXQu
	/Mjdwqqnxn5C9v5zzlgzVmY+6w5q1Pr75cV4XKgdntgQoXoFtFjErlHFECArUFsVlZJ4A0Z84MNVU
	Gl75D1vPKedJQ0By0+aWTavF6V4U/uq6vSESCgRFBnnhsC/cJVCmxp1CapGOPahnXU675rI321Q9x
	7r5xOPNzw2E/U839g5AOmtixsuEUwe2ITtzbT+qC7tpYcXpVQjaV7q+g2+TzM5i0Eccfm9tzixLbn
	/m8I/aKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qslPI-00CbaU-15;
	Tue, 17 Oct 2023 14:50:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslMx-00CZBx-1G;
	Tue, 17 Oct 2023 14:48:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=k/pEvd4nMmJt1AF/l+YT4dreiYrspMzSxIYu8hu2Sfk=; b=pFyEhe30675vx0732oBVXWW1sg
	NPuKYyLTSjbAKxEbW/5Ju3rTErPxAcNupy+NfqhxFE35jndY55An7zznf50AVOMMir0/bnVg4U9lx
	FTcdkrggnSJ3YGrgi4nFC6yLbO0Qp6lmQzTM8ZXNdvYvtiN/XaZW6SQt4KeSwhUxv1v1vKXT/CUU6
	JB76/83LYg1iLr5H80JkvJvtaKiZMGeU2TEQeurqa5ZTYwS8BHnktq0QBm5F6wljxMTFfwmpi9y92
	vu4NjMoSOMBXdWgv3yFsnE5tEqCcZG0typc5TLisJDV1h7RyhYDvGYJa+XV4RNTmCde0aMog3q8vQ
	adqXDuiw==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslMq-0079z7-1U;
	Tue, 17 Oct 2023 14:48:25 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7205:da49:a7e8:59f8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6C70C66072F9;
	Tue, 17 Oct 2023 15:48:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697554096;
	bh=qCoNC8hqYXkxsdiQf6PWbtNmn3FrwS8iksBRd2sH5jY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nNen9FtDyagpdS8A6O7MJA6/LbfLBhbXCRcLkRrCf7VDOuhsIV/IjrnVJ1iVWIhtz
	 Wj1TMKCzlrniNN+xu3nlJ6d6xKu6LEayhaObbNqBdCTWRFY3fdAexzsj4WuHMb0GY+
	 RyEGqc50cM155+Lb21xEuXLHhzpmbl7eOo30V31ogBmJOoCmNKEmXkCvRmH8+D5NGm
	 OFDClmKdxBTjkeCp8cdpK9+NeNbN50MZ/eYN0Acz5sblJyYT3chZizPA1h9h4JS3e+
	 WvM/KDAgHgV0SZZi6gcJ9v0ZMx4JkaXgLY/vKjBMxuHaKI1PZq20KTD64YogRX6NNM
	 TMWsZmINLlSGg==
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
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v12 25/56] media: pci: tw68: Stop direct calls to queue num_buffers field
Date: Tue, 17 Oct 2023 16:47:25 +0200
Message-Id: <20231017144756.34719-26-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
References: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_154821_300498_5BEEA993 
X-CRM114-Status: GOOD (  12.46  )
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
CC: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 drivers/media/pci/tw68/tw68-video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/tw68/tw68-video.c b/drivers/media/pci/tw68/tw68-video.c
index 773a18702d36..35296c226019 100644
--- a/drivers/media/pci/tw68/tw68-video.c
+++ b/drivers/media/pci/tw68/tw68-video.c
@@ -360,13 +360,13 @@ static int tw68_queue_setup(struct vb2_queue *q,
 			   unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct tw68_dev *dev = vb2_get_drv_priv(q);
-	unsigned tot_bufs = q->num_buffers + *num_buffers;
+	unsigned tot_bufs = vb2_get_num_buffers(q) + *num_buffers;
 	unsigned size = (dev->fmt->depth * dev->width * dev->height) >> 3;
 
 	if (tot_bufs < 2)
 		tot_bufs = 2;
 	tot_bufs = tw68_buffer_count(size, tot_bufs);
-	*num_buffers = tot_bufs - q->num_buffers;
+	*num_buffers = tot_bufs - vb2_get_num_buffers(q);
 	/*
 	 * We allow create_bufs, but only if the sizeimage is >= as the
 	 * current sizeimage. The tw68_buffer_count calculation becomes quite
-- 
2.39.2


