Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2E8E82CA6
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Sep 2023 15:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHOt7PQRA0EqPTIJ3sJv4yUzGbHmzKa5gMgXsSJImO0=; b=Demvjx7igpCKpWpH683tVa7boS
	+5Q/3Q1r2HuLI/p6VTaHk7IkoMSgUwpwxTqWPsYYyTroTuMI7jYF2Rb0pVBJNH0rwM6ehr2So6Xf3
	lQb6XTeHwq2HV2oldAMkMFMn3vUIkSi/vLjANyYDxlSxPE+tjYhtQwIcwjj8RzfG7+gnq9ca5X4oF
	a7Ict2x9aABRbfRbTwPBIjCFIzjOYBenwjaXwZkHB0imwdBgaAsmrc7ACgrpF2d1VcBfSmxnHECJ5
	lvclVc0ExPxnseXTjLQdNFPBBv3YVY1Q8q9ItrOGkVrLr43pQFllPfh70CnRnY7S4VGTrChcNRPfZ
	CjTBSs0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWeH-001KW2-2P;
	Wed, 27 Sep 2023 15:40:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWaa-001GgH-2A;
	Wed, 27 Sep 2023 15:36:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FHOt7PQRA0EqPTIJ3sJv4yUzGbHmzKa5gMgXsSJImO0=; b=UFS+arnxHVZ+pzJU0JA4jDdM98
	apLNotlTAe9qzIqBbUVc8jPv+kXvyESn/qV9IHNIhELPeiSqZ+a85mwD1SvBMf5x7dzLJrd6rRsjm
	r7zRQlBGSk52rPrANIy3v5VyYJ8G4yXYORht4a6mtG83XRxGB1XcFo+GnT+sFHmkjQahNUtMokbzY
	syhUtUf/aHNyURLvHxMqukbYandprpZyVZi5Nk0pYEpd5zWcsScpDCuVeS+V/RLIMPht5nWYUetIt
	Ax3UvsgQsPQCq3JmJ7Vmr3dV8E7jS4wmzWxoEtSywWjPfa4oebad3N7dQQUc3lC+NdjmY6UnDU224
	QNw3ckXw==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qlWaW-00EesS-Ja; Wed, 27 Sep 2023 15:36:34 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:672:46bd:3ec7:6cdf])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 944136607379;
	Wed, 27 Sep 2023 16:36:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695828989;
	bh=uwQYrGuMm2ejNz+6p1iPg1BLomW4NJekCoZt42bzvk0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AlqQgzobtesqfGrDxwhOqSYfYn2QQtcUygEczU7exug94O8iDwsanECUJ8iRrMj4F
	 9NFbx+V5AXelw+8SEPMa6XW+VPySUyhXEi45/9lhGnvdR4n2hGJ/4MOlKQ9UbojxZE
	 XFpTRhzXm8YSK3wssqLifIjWe7nCNXxPHH4iwdbyX3L40+8ZIBwX44kOIEJoVacGCL
	 RGcWMolRAl3kW68fvjhZLcGsBJCe+YgXmqAqoIRfy4XLM/Qso035ePPv/d8XmMNFgo
	 w+FZQg8L9eTKhCZASwBwvK/jUIGAf74yAShBfxBa2CdTqa8ByYm/rFfeQMl22OEnY4
	 qut9i7JQcC9GQ==
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
Subject: [PATCH v8 45/53] touchscreen: sur40: Stop direct calls to queue num_buffers field
Date: Wed, 27 Sep 2023 17:35:50 +0200
Message-Id: <20230927153558.159278-46-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927153558.159278-1-benjamin.gaignard@collabora.com>
References: <20230927153558.159278-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_163632_740833_312C9830 
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

Use vb2_get_num_buffers() to avoid using queue num_buffer field directly.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/input/touchscreen/sur40.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/sur40.c b/drivers/input/touchscreen/sur40.c
index 8ddb3f7d307a..e7d2a52169a0 100644
--- a/drivers/input/touchscreen/sur40.c
+++ b/drivers/input/touchscreen/sur40.c
@@ -847,9 +847,10 @@ static int sur40_queue_setup(struct vb2_queue *q,
 		       unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct sur40_state *sur40 = vb2_get_drv_priv(q);
+	unsigned int q_num_bufs = vb2_get_num_buffers(q);
 
-	if (q->num_buffers + *nbuffers < 3)
-		*nbuffers = 3 - q->num_buffers;
+	if (q_num_bufs + *nbuffers < 3)
+		*nbuffers = 3 - q_num_bufs;
 
 	if (*nplanes)
 		return sizes[0] < sur40->pix_fmt.sizeimage ? -EINVAL : 0;
-- 
2.39.2


