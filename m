Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A2CE75436
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 08:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d+Zh7OhCiZiOOWKfbCvE9mpOVb6/vmByOpoeFDYFpv4=; b=ndJvMmU0SLieNGjdTRMsvnOB1m
	jSV1RvHLDLD1wTZjpj67ZNPTBzNpkbjCI2dJ6Zs89ijE+xAirjty21BrMTMWqVnD2FAceCSTGdgtf
	zlEDS57qlQEkwrK1Y8ISdjnsprJy786LMGSKP/Swt3S0UuOJa2LKsf7kF3jY2WdYymKeY64anq5PL
	YKnQ8xTdTNnBlv9hjs19P/+UAsIZhtaVG+xz2jM0QFR8uqM3hesFO2fBRcsR0WuuBCt0RYuGFIZrJ
	NEJUuWosM+ywAGscixwNZPCtG+O4LEkbnm2N3ZMwXU0YQy91sbLH94y0NeiIK0Ah2iguJF8PLw574
	nhFtvxcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaSE-00E4OJ-1b;
	Tue, 03 Oct 2023 08:08:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaRH-00E3JD-0z;
	Tue, 03 Oct 2023 08:07:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=d+Zh7OhCiZiOOWKfbCvE9mpOVb6/vmByOpoeFDYFpv4=; b=ocaWqvaRj3SeYzEgz2kMgtYQcg
	nYB3xPoeHbPksugNKn1REqAYRyg/mvtLFu3HfTuQP37rTdwvTKZr6f+fsqd9XPZD+AACgqw8VYee8
	nMh51uT/hG1n4SrFMN3Fs8zXXQvF3rKkXzcGvc3hBNTX7Dj7brbfslQTmHFlcGfn4KgiZ8NiWWXCb
	6kMLiUljQ+6D5H7/15tD9dG1oDE9GZcAE1ortAH7DM6azqt4QvO8UGSCh8mGYCDMZvmXkfF/YmEk8
	a14xFurYb/OkoP8wJFGeLn8CdJR3r0GPt0zvYh3io/lP2MezZ3Iyc5yuyIbFSufkrresTKGESRV/S
	AAKf+uQw==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaRB-009jqo-0n;
	Tue, 03 Oct 2023 08:07:29 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:b6df:b784:6a0f:8451])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4D94A660731D;
	Tue,  3 Oct 2023 09:07:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696320444;
	bh=o2sVtoPPYvq8hM/qyihWIqN4hasDvFA4zhZmTyTxJEg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cXQBHl28z3w576xIMzmVcsgwiZ8Au8MHBX+w26WURG2hh2RMCuZclgWUu+GoY88kK
	 6tVKH7eeY3PoZm8I4E69QVXgzAaeOatVL7yKS46h5QbtIfcQcyDMb75slc53UJvJCm
	 VxHx5xsay8SzhetvZdjE0XPT8Oezi1tDGoxd1EmJIbyRlpfykXVMcp3gHb1f3MR+Ef
	 luY3UQtIyJuEI8jyDsEe0wgn7Sehrsb6r2pnCVaDhzEbwLr5kRk0FJEITuf411pNWK
	 j3rY7339Eb9pMFn+PMYcAii+mKPMEXazpThFtkYPilBuMqj/6Ce1vQrbIARoCsbtOf
	 JeOkuvBmqG2wA==
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
Subject: [PATCH v10 22/54] media: dvb-core: Do not initialize twice queue num_buffer field
Date: Tue,  3 Oct 2023 10:06:31 +0200
Message-Id: <20231003080704.43911-23-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
References: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_090727_655855_12C73854 
X-CRM114-Status: UNSURE (   9.05  )
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


