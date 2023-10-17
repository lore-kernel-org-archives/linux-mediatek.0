Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E6FCDB485
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 14:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mxhqX9L/LTLjAo8r4FRZmw55ljZYm0j0MEPgb49dKlI=; b=Nn2xPZaE6tmWiritHcDKS7YhCV
	WWHWGagIo1PjWtZbF5uRYVZOC/HZ4FlCilwBKPRzj1ELJizrQDBVhHp5u0nJWoN/fuVxxKI/YRzhA
	4x7rzxWMDe7fQWP/lp657CGZx0qMVdbEVV8OamhBWYi0u5iZPJwwjavDhyJC6jtfdyXfOJpAcNIDA
	3fuFDWBVq1jvqwILacfejgtxy56oO/cgzV5v7fpzFtPAb15CZ++025276XdF0lhKLmMF4cPsIT+YE
	/ko2n4xUb4S6dq0ZLXz14zF3ez6jLM71OgHA460hmxLo3QCM7w3sIvJQVEg9zi7iKhNgSqEtzU9ig
	gOQO5CvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qslOm-00Cay9-0L;
	Tue, 17 Oct 2023 14:50:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslMs-00CZ4y-0I;
	Tue, 17 Oct 2023 14:48:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mxhqX9L/LTLjAo8r4FRZmw55ljZYm0j0MEPgb49dKlI=; b=T6nGXU3JsBH+K2iTkhemSz1Qpx
	gogu0WcokY8TFUnthaBvBym6huv96A4borHjAChr0gWhmUdJx4P79csEaj4WP+FrONfq/vGC8MYvZ
	Ungbwkpp82W/R2nPL3GdRS+QewXNaKLEzTd0uM1sdN4rVJJXyerXTGz5y7umlmpWcxDYtRANZJ6jP
	u9VGCI0V6GHAMEvXBJJL+Ezzi8ZOnscBAyOy2vJ6b+LmrA5bnWD1JDewaj8fWjLK//Hn9AkvxUYFk
	NrNMdsPtK1axIbYNDrHg8BG1KqXfRebVe3+cZ09qrPUCW++Kz/BdHiNYze3bN/cQUOxyVuuc1Uz+a
	fws5B8NQ==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslMn-0079yY-0z;
	Tue, 17 Oct 2023 14:48:20 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7205:da49:a7e8:59f8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 43F12660736E;
	Tue, 17 Oct 2023 15:48:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697554094;
	bh=7OP/lnsbD5MzPZ4L/gceSmxIzda3Ng9eLtu0phjni7k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SX47BSZBGXDJAl+hd+M3Pjc34xRzLFy24YoR5AdRaP6yg3ezZrcdlLcdlKlW7ZueX
	 5KM0nBjHjUwKlaRInLkoKlfLZ7HIu8y4v/5SmimgLG8oB9QY5fXmvwevRQ5VSxt5Z2
	 8C1qBMwSis4zQRO7d7zdP2BX77w7QnJXrpUHmV0KNX7Yy3y2zTpjtxVKWHpZyYww5Y
	 9Q+8ROdCCxDYMgH44oBco8lBR+P7B4xWxfT5J52Pnbetd+M0QhgLH7anVprhPs/hN7
	 5nwtiog0gPHw8FKkIqjY5TUY3XIFsJE5E5T1Ds+FqVUkOvy+AEtuLvJL9t+swy5M9N
	 5PXq5ywZ/XTNA==
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
Subject: [PATCH v12 21/56] media: pci: dt3155: Remove useless check
Date: Tue, 17 Oct 2023 16:47:21 +0200
Message-Id: <20231017144756.34719-22-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
References: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_154817_553382_345B2F52 
X-CRM114-Status: UNSURE (   9.21  )
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


