Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24BCE7849A
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 12:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mxhqX9L/LTLjAo8r4FRZmw55ljZYm0j0MEPgb49dKlI=; b=NrIl72e7vxeRL4qHY7e8Q1rqbZ
	/yU/yvcNDMHSI3ssF0FjqskhyHYxMstuqrTVzYziLJLUhFt7xHsqBKwcrjWlRMe8cnOd6lY4ZbZpN
	mvfFphNmAvnrJus8EQWJzm7n48OfGlfGveUth1ps98P3/IhXANNf4Iwtcwow7CisdOUFx6yoQe7MR
	x/ezBNq1xwGYnwPh45bgD1jr49UciOnSXU4mOsmSgMs2hhxjUPyeYI+5C97ZTyrT3FGMsfRKjeJNq
	I1s5AYqWS86NyWrG9W+AIrXRp/y1gi9lQEoxjY8YyNzMNnfikNoSuItLz0Ln6rA5EtZRiuIMqkTKB
	i4NBcKFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHj5-00CdaR-1Y;
	Mon, 02 Oct 2023 12:08:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHhL-00CbRF-2M;
	Mon, 02 Oct 2023 12:06:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mxhqX9L/LTLjAo8r4FRZmw55ljZYm0j0MEPgb49dKlI=; b=XZ/0bXVhNFyxQsWxPjZBImvJSY
	A5wc9pKX3YXxIaUYPJHfRDhg5z+IlaXXwNgrAVDeippe2U3EqRjKffwzMwWxfxsQAHEsANZ1IqRO4
	Bxp9kflw9gvOkRJ+54QDpHtzBLftkzLMHxNnlrKCtbUjoaKGsbJ7XykMp05RhI/0nE6TCkFLAP19t
	Y+XZVFmzZMm5YxaxRkqa97eM1CgX5ToNfwDEaYIiwtt9W5732faf35vlIm72BtNQIv5WbHk0LAzxP
	CNPzgGwsyc++J/b3nugK0V9nIf1kBaogffxx/4iw11Y3U4X4TBlYZajieFZq8qqpTpsQWO4lFqv7s
	qy8XUZaQ==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHhC-0090NA-08;
	Mon, 02 Oct 2023 12:06:49 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:9537:67ca:c85e:d0ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4E233660731D;
	Mon,  2 Oct 2023 13:06:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696248398;
	bh=7OP/lnsbD5MzPZ4L/gceSmxIzda3Ng9eLtu0phjni7k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f88Lkm0oKTrBkVS+11PzY0oHDtH24yH2hRy+ovgFH1RcJt5BuaKf6dhZxZLVj0d1m
	 pEzDe/zH34BjfmNCWHk1Svyw2F0rYKTA0eC9K3BsAvthcKPWLO/lVfpBVpCabDtXy6
	 rlKYM4QI0x7Qk85CCDVH9q6BouBVguyNbu+VOFQ0yAyJ2trsFPY0DuP4fZshU3ycxI
	 RhqyY6MdSIb8qkbL9MDzvwRW4iTiRZJI26o6YziZ7lkHlbOiT8kT8pdOhQoP461h+l
	 cYL1AwoinjFwZCpMScAjefTMXBVzvZ/bJY7xQ0t36JVzRr+x6xGZSgr4yqr9FwgL5N
	 5Lpd1ZJ/O0xVA==
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
Subject: [PATCH v9 26/53] media: pci: dt3155: Remove useless check
Date: Mon,  2 Oct 2023 14:05:50 +0200
Message-Id: <20231002120617.119602-27-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
References: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_130644_325789_80394BA2 
X-CRM114-Status: UNSURE (   9.61  )
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


