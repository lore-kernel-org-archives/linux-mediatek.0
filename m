Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81863CDB46E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 11:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ei78TxWOcTSjoFVP8g+Q8911l0kULI5hASOKgXFSt0A=; b=Wci+mtdaXgkZCRID3KBJol8VxE
	nj2qu1vp/bDyDrEq3zLsV2qvWmd5bsYNkfGAXJfH0dj0yj6UQ6U68LOGBtEgppBK7a+vonYDc2glW
	KLOWQhzqn8AH+aIM+ulxoZ49Uci60tYwXa4Xd68e0wXCL+6aW4T7ECaAPaViE6RYOlcEMIoClz0Lu
	fCi0EBIR9eWal/7KKgRFUU3JDrom3ncu/3Q0OEksUTJf9cobKCRQG6mPjq1a1JK19g+weUCJSXzTi
	hn2FsDC7ir4g/eHRbky/pdYaurum96YTdWixpmCnmCQb9WNkXM64ReSSGquc5VZNci1tRWp4hTq0h
	hUTAgA4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qquD0-000rKm-25;
	Thu, 12 Oct 2023 11:50:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqu9r-000oHK-3D;
	Thu, 12 Oct 2023 11:47:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ei78TxWOcTSjoFVP8g+Q8911l0kULI5hASOKgXFSt0A=; b=gDVPHqNW10xwvsm2efoI/dhNsg
	6ZVWlXymR6nmsj8VFhPQcDqRt3XkZPSqkysfytGWluB4jV24SVtWsLQWnnXlXYuFDr04YfG7ozYfl
	LJfbyknJ5j8k4gEQuY8AcH1Hx/aU333n52Wvzg5AEweR23CzauS5WxDlPsalGUt+N4zFWshU6nhbW
	c2AWb54GH33dfF/ztseJCBnifQoTOTrFzTI3TxGdc3wOM2q6l3PHkvFI8fTXNvPoKatyu3tA1gpdg
	6GYDeHbFeW3+E9cLcfo5KGE8zRrC6HCBHBzF6ZrOrYGi+SsYd9OmtIf0t8OTxZWeXTe19dg60rOqe
	ct2SWiMQ==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qqu9n-00Ggrn-Ex; Thu, 12 Oct 2023 11:47:14 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7ae7:b86d:c19a:877e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 25CF06607374;
	Thu, 12 Oct 2023 12:47:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697111230;
	bh=2ob6WtKtRZ9d5xOWNbdQXjkC4MZ/+NminFNhqg2q8Mo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JDqtYrtskHtqMoqYnBQk0pM4DnGyCO0oy5ec6FPZ7sNGN7fnhoDcH1rfICDYl0CQR
	 dKdZjf2SIjjt+pKu4gCeXXs+F/ZWtj/dPxGa+AHtoAipbAYBJliSL3+3H+undGUYzm
	 BtXwqOlkniaaehIuKp0NBIj4hcDDqS4Zmz6Wxd/azcGzmNKTcf3ET2qiKi3I87XOmr
	 mPw5ipD+zjXqg3cWrJlxnkR64AZ4UUyoZq15BmMfeSRITjb6cY58PDCFI80FgYQLVH
	 0a7qcPxP18972eMvvqIoc2nLNBxwHRgjB9RB/OAArsO86IcXoQNE0xymqA3QZ8Cl0B
	 HsF40gcYL9xjQ==
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
Subject: [PATCH v11 39/56] touchscreen: sur40: Stop direct calls to queue num_buffers field
Date: Thu, 12 Oct 2023 13:46:25 +0200
Message-Id: <20231012114642.19040-40-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
References: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_124711_572665_D69FAAB7 
X-CRM114-Status: UNSURE (   9.35  )
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

Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.

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


