Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F827E784B6
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 12:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d+Zh7OhCiZiOOWKfbCvE9mpOVb6/vmByOpoeFDYFpv4=; b=2TPMYRtMaSEXBwChxhFn3S/+wc
	CRwsTm/dWPtUWWk7UgcO0saVRrtnHPFiEuQxhQH9FShdDb9Ki6X6lyWf7JTl76f2BB/slggRLurPi
	smWvFn8qB7nuBzy7qLtONZ1FXUrY/xSP+2PgUWcfq1Qt8t36fLwW+8QL9t69w/vQRKDQyH+ABCnlW
	okUyExVIQYBMycMaSw3B6gUNr86tAvZQRm19f9mn/v+RDe9htuOKXnFGPgCSLwy5CWgJ2uw5TXBuj
	hCvA2krnjZnAWiFPxMPGfuFssRQc3KX4x4fqFnEcRoGZOM7lqOBlxMIUHuf+gl+Y/drkUxt3RSI+F
	d5OzVwVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHji-00CeNB-04;
	Mon, 02 Oct 2023 12:09:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHhQ-00CbWy-04;
	Mon, 02 Oct 2023 12:06:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=d+Zh7OhCiZiOOWKfbCvE9mpOVb6/vmByOpoeFDYFpv4=; b=e/HbpzZse0wjPxYIkWtmvHZ+G8
	kP9JF1miVRAnQYM5AUteHVKYADQywx0cdUQGcY9kxPQUW6eHYyYQhGEyW2/bFbUS1RX6iwerb+xA0
	HBdquu3e++76I/eXMWTskQtopb9KYrU/uNH0fM/HvKtjFVtFj4V/+H2IGr9jRIZDmTom2edJruEKe
	PotJ2nWi6H6uqT4plO4EbpTqf2TMDLaOsb0hPbR7+1007xjDxbYZZ/dbgqPW621mgumke5B/2Bfb9
	v6GRXXHTld1TRCuXjGCzQJ0nyH7GBjcIn8cIwy19tI573UmDmb2BDfGz/MPgKosID/c9Y8/hElk7F
	G3aP0YRA==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHhC-0090N7-2L;
	Mon, 02 Oct 2023 12:06:54 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:9537:67ca:c85e:d0ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2C4916607354;
	Mon,  2 Oct 2023 13:06:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696248396;
	bh=o2sVtoPPYvq8hM/qyihWIqN4hasDvFA4zhZmTyTxJEg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LZoIr6Aa29WK9jtAi4bhWXVU09xGPozLHfM9AWyp2/4it88IbTUdyauEaVoCdH2xM
	 RA/pNdv9vT5YObLSD9479wMNz5cHkwRu8lAX1hRrkSDyL6kOKoQt7p1Y1TQ+EIpAUY
	 Zv4SESVakzfakl8yLNOSoJbJ5wxKu5HDHTBJBGfoQZdHWlnlgwgczGbxx2q5I5E3S9
	 k0y+fgM1doQWIzlEryyyfzoA8+WHBJwUTCzPGV/q6PUAZv1r8JPY8DcLLjF5KnVM+N
	 2ZykrRg/qi+3/kkpDEbLTCVBpRjmctEbBYrKjc6Xdn083+cjqN2UzOX2PROsjompQd
	 j9+9eLNMDaOaQ==
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
Subject: [PATCH v9 22/53] media: dvb-core: Do not initialize twice queue num_buffer field
Date: Mon,  2 Oct 2023 14:05:46 +0200
Message-Id: <20231002120617.119602-23-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
References: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_130645_631830_75518168 
X-CRM114-Status: UNSURE (   8.94  )
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

The above memset already zeroed all the ctx fields, it is useless
to do it here again.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/dvb-core/dvb_vb2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/dvb-core/dvb_vb2.c b/drivers/media/dvb-core/dvb_vb2.c
index 3a966fdf814c..a731b755a0b9 100644
--- a/drivers/media/dvb-core/dvb_vb2.c
+++ b/drivers/media/dvb-core/dvb_vb2.c
@@ -177,7 +177,6 @@ int dvb_vb2_init(struct dvb_vb2_ctx *ctx, const char *name, int nonblocking)
 	q->ops = &dvb_vb2_qops;
 	q->mem_ops = &vb2_vmalloc_memops;
 	q->buf_ops = &dvb_vb2_buf_ops;
-	q->num_buffers = 0;
 	ret = vb2_core_queue_init(q);
 	if (ret) {
 		ctx->state = DVB_VB2_STATE_NONE;
-- 
2.39.2


