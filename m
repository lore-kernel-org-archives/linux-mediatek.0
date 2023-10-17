Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C90CDB485
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 14:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=03Fd8kKAqgdMMfzT5XgbPtxOOa7RZzbLW0FBpSwsGTk=; b=O0OOWl3GMFPCcGEvQxukCWQChD
	rXTRFmXRW4sMm2yfgphic4ofj8Mfqb6TZCZYzVjBqWnbaSJ/kCL4KUzkw3yH3w4DsfGDKL+T06tIU
	HWMhJ4VtDObBXe2pVhx6hTlwvWzsLAGsjXHtNHTE6maicT64DLswSAQdEtAlJEDeX1/CMIKN2sLPi
	TeQyNNaalg/e1XKGpi3GiPc/WptcOd/PCu1uIkGoXeb9iryIZxwJ5bcqhXECpcS5uthn9FVtglbqF
	gWp5bRxhoInWZMozljE2CPFa64wP5ftB3h51cXP20JmLqFRJnB4w3BEpufZYO/1Xv6SrQvnaX9nZF
	8Nu923sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qslPN-00Cbhf-2B;
	Tue, 17 Oct 2023 14:50:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslMw-00CZAi-0P;
	Tue, 17 Oct 2023 14:48:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=03Fd8kKAqgdMMfzT5XgbPtxOOa7RZzbLW0FBpSwsGTk=; b=NomA8szgQ8Z0aWfb0ewTsA7LlX
	5NLSLXrG89x0uq6+cxDy5ktNRffOWnVq8pKLe05huMhJC51cSYYUAF8TSLqs1nd1/pExmwjnYnZwX
	kKZTgEocutbkWPYqYqHW24E2tF/5m3y1cTx1dMmGUaZy/3MuN8HRInYw4/t3DWi7U1SFYL2LdSxAg
	90K9GZA9w/w+JW/R1ShwCpzZAx38jLploB51eVUP62HZL2CIWZsfH+GLW5C3lgCdua/o5G77BHxa/
	A7JVUzTAfkiRwn0T/PHzDofZevBXYL3FpX9QrgTCRWK8NtzK00BA/UQMIynyD1U1DvndhSp6rXVtO
	1Mpwr6EQ==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslMq-0079z8-1U;
	Tue, 17 Oct 2023 14:48:24 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7205:da49:a7e8:59f8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id ED4AE6607314;
	Tue, 17 Oct 2023 15:48:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697554097;
	bh=ChpcYCv3I3brbs3IQllzHDZkqVSelhB0M6hpuaYYPs0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JK66MekYPCGQJ+2GE5ce8BxsaIsxjT1GPeFyYe/52NRw1tWy67xjxKspeMyUVLap8
	 T91qerw+IcVbcxhR9y9E4gVjgpPyWPI0mwt9HqIYaSBuj4diCWWuWaKlz+9OtyDST+
	 Jdm+Le/veYxI9XS2fL5oG+/McilR/T2huCpVlcrhf7V4mePe+uo+exVmc7kkBZhTNR
	 96aQMp2TCIwyHd4PhKMS1ubQcTkLUzVxbPQuDsGXX5HNlrDZrWvAVJLq6/8cmtyu27
	 rUTvRdJukYxbWa0D1qXS9M2iEwinTkTYxg1+yloC6aymrooudfMistEnZyOe2S2Q8c
	 +FoMr4hYj8tCw==
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
	Matt Ranostay <matt.ranostay@konsulko.com>
Subject: [PATCH v12 26/56] media: i2c: video-i2c: Stop direct calls to queue num_buffers field
Date: Tue, 17 Oct 2023 16:47:26 +0200
Message-Id: <20231017144756.34719-27-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
References: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_154821_296192_24BEAC9D 
X-CRM114-Status: GOOD (  11.27  )
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
CC: Matt Ranostay <matt.ranostay@konsulko.com>
---
 drivers/media/i2c/video-i2c.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index 178bd06cc2ed..ebf2ac98a068 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -405,9 +405,10 @@ static int queue_setup(struct vb2_queue *vq,
 {
 	struct video_i2c_data *data = vb2_get_drv_priv(vq);
 	unsigned int size = data->chip->buffer_size;
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 
-	if (vq->num_buffers + *nbuffers < 2)
-		*nbuffers = 2;
+	if (q_num_bufs + *nbuffers < 2)
+		*nbuffers = 2 - q_num_bufs;
 
 	if (*nplanes)
 		return sizes[0] < size ? -EINVAL : 0;
-- 
2.39.2


