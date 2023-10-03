Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE0CE75434
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 08:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mxhqX9L/LTLjAo8r4FRZmw55ljZYm0j0MEPgb49dKlI=; b=M/0KVUE0bNzlCM9f3BIMPhm9Gv
	NPLr8Oku7rV65UqnLRsZtJa6WLtSFq1rmJVElxXoupz1lZJpTF8JhgygqDFAvZhIcvHxRnaVWYajp
	/QkPUJXOB2y4Fob+0r/Aewa27ZI8HJA+rQeDNZGy+ZBlwh515tu1BCQoIkWj0Alib6/XG6oz9GZGi
	V9JmcuYBWzRJWQ84aJCeKUrKIfys7Wv+JjKAopGkzRxmsXc0tP7qaf8vgnPbTk5FIaJ4oitsBNzy3
	Z9EjbDDrQi1PzbcOUbw4gTEyb1rkvaAV4qjwo4N9e/hgr8jO0hAzGsS4EhOfVe8ZPf/EsGTbwF5jk
	QzKnshgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaSX-00E4fl-1h;
	Tue, 03 Oct 2023 08:08:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaRH-00E3JF-1N;
	Tue, 03 Oct 2023 08:07:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mxhqX9L/LTLjAo8r4FRZmw55ljZYm0j0MEPgb49dKlI=; b=oj+nuTH1cAiT0V6hfujDuQv4SD
	msOlhphskLHdoPDEV7U/N1+Q7qb7hf5Q+JidyaRHhE8fp0TwBSqJekfmxXTS3pMRSyF/g7JMmC3yu
	X9WlBWZOHPMC2oAAWdj4xsdMBekYf5F+f8bzR1E1HlIYVdzp86nbQoYPO+5sKH13bZUiMIK+PX/si
	lhA3meNOYtuTsQPgiAJJOp5srB50JvGa9cA4eBe5jDD8j8BQOZvebLR8lSp0R46DHDWn5Z4Q5pKEz
	XCwxm0sWfbGa1jhnZN0pi93gjxK/JjnbDga8dYS5G9AExrX3uNNLymn4wZJaA9Ft0eyGJihDCtu0d
	DbKoTRvA==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaRC-009jr3-0q;
	Tue, 03 Oct 2023 08:07:30 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:b6df:b784:6a0f:8451])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5CFE66607358;
	Tue,  3 Oct 2023 09:07:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696320446;
	bh=7OP/lnsbD5MzPZ4L/gceSmxIzda3Ng9eLtu0phjni7k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hZ2VfmGYVHi/dnTP+YqWFYiyKF3JtP4EZM4tG4D84XQVdyGz+cgYIZsE1JY20DuSI
	 qQCI8LF/CoieabGlir1fILZuOeGnF/GG+kns46Su80aBUEssGGpt+vN0aD28g/EfFB
	 GuNoQKW9+z2I0xh+u6R5bm/TarSvCKrYqMI5EC4UiJB/nLzr6zj3RBbtd+cG7f8rnt
	 guOexMSvOG+H1ikLvyQTChUPMf5XB7eBU82nqinxPs6sQCRd4K1iRyS1HBdBT2lPpb
	 y6fGFLvHl3+waddovE0q/RJjLLRDKl5Q/OGB2Qj8njCFo40uFVYbljvIJsQamJJM6G
	 6FbuG4MPBq/dg==
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
Subject: [PATCH v10 26/54] media: pci: dt3155: Remove useless check
Date: Tue,  3 Oct 2023 10:06:35 +0200
Message-Id: <20231003080704.43911-27-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
References: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_090728_039335_355C3AE5 
X-CRM114-Status: UNSURE (   9.53  )
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

min_buffers_needed is already set to 2 so remove this useless
check.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/pci/dt3155/dt3155.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/pci/dt3155/dt3155.c b/drivers/media/pci/dt3155/dt3155.c
index 548156b199cc..d09cde2f6ee4 100644
--- a/drivers/media/pci/dt3155/dt3155.c
+++ b/drivers/media/pci/dt3155/dt3155.c
@@ -128,8 +128,6 @@ dt3155_queue_setup(struct vb2_queue *vq,
 	struct dt3155_priv *pd = vb2_get_drv_priv(vq);
 	unsigned size = pd->width * pd->height;
 
-	if (vq->num_buffers + *nbuffers < 2)
-		*nbuffers = 2 - vq->num_buffers;
 	if (*num_planes)
 		return sizes[0] < size ? -EINVAL : 0;
 	*num_planes = 1;
-- 
2.39.2


