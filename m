Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D32CDB474
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 14:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFjO6uow6Obeup9D77EypxGyIrYlMpXGEHAdJ1lR1IA=; b=1X8XqCYvWSfnf9T3EAM4bIsvK1
	kIo98DNmTGaDw40/gpRt9VDMLV5WarE82RnLNBPESzgA/Tpk6auRvoi2hKNlx+mFMZzIYItgEZ+Mo
	ouTPKA7YebOvpt9Z1WEyk2pnHHqbS/MV0i5m1OYEuYcJ6nTMPRV4gomva6lh25eTSCrUyxipjS3uK
	p93GdgNypdu4nVreKdzE7uln+m3RsVT7qRSNYcLp39a1qLWFMjtZuLE6OHPaW6eYkvTY+S8+/rSGd
	BYPwnKDZlGnUbqTid5J4utS9Lohzjl2MYK0oQjVTVsV+gtReIbgZpBT8SEGIjSO+Cc7J+G5GwcvMm
	d0YMOTvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qslQ1-00CcPF-2b;
	Tue, 17 Oct 2023 14:51:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslMx-00CZBw-1W;
	Tue, 17 Oct 2023 14:48:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zFjO6uow6Obeup9D77EypxGyIrYlMpXGEHAdJ1lR1IA=; b=TN0Mgh0btC6OqdzUbMrhILCSqo
	2HK9vjgLmfM8uaNrfTpLBghG6zyCg+l1I/zZ9srt4tvJud4iMgfl1QTHRAcn+cCkGl41GG6hywUJ/
	nVCcKyyA5KxruSuBNOYCzK3LQ6x0XoCftnYIc7T064dxALbq+CniV+ZxC6I8Quw7ebOGeXYe/J+KP
	s1Xrafwna5vzC0KGZ+A8srqQRcazq5nM+EBpTk+MCNYjo6SPtlYW5OHOco7zkUGkYKHQHDVRaw+fi
	o6VQkmoZt0ZHU/Ds9yZ4qzLvxn3XrSOoplK2UuhDKZonyF9apzPn//bdOS1jHbT+8Bp5ETRfno0AO
	jrxrgcEw==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslMs-007A0K-0V;
	Tue, 17 Oct 2023 14:48:25 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7205:da49:a7e8:59f8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A7CFA6607390;
	Tue, 17 Oct 2023 15:48:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697554101;
	bh=YIO5Utop1dEZJgaFYl9UZxqPRCBrM01G+R+w/VTVKWc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JodZ1W+/1MbqIt8px5SfY/zz/ceq0+/YYscrHj0APiDCMrIIpxHNFklpHOTW0458G
	 ZcC6T6CQVZy1oAnY6RZggWDiv+GlOQ0v3/X9cVNW3n6YS4FU5KQJamq1Fd0Oa0AOBL
	 j9ryhOM/2jfwsZJIlpjQtFeP2dLk5/AcH9ocYtuSBTINvgaHZSmJicwY/dnzDzwPrH
	 +AMDJTfzr4jFDwscMLRdS5oYcSWdHPqFz0oZCP95IHsRHn6G07+tuELOip+AqnuKct
	 lnAwQRNQoWl1INUFxQJxpF8CLiQy7bveQEZpqWzLFJYd4FRriAJlmVYctcWIXlRRzG
	 RBcIHzBUChBvg==
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
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Henrik Rydberg <rydberg@bitmath.org>
Subject: [PATCH v12 33/56] touchscreen: sur40: Stop direct calls to queue num_buffers field
Date: Tue, 17 Oct 2023 16:47:33 +0200
Message-Id: <20231017144756.34719-34-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
References: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_154822_435339_203F5415 
X-CRM114-Status: GOOD (  11.69  )
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
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: Henrik Rydberg <rydberg@bitmath.org>
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


