Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD809C4167D
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Oct 2023 16:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d+Zh7OhCiZiOOWKfbCvE9mpOVb6/vmByOpoeFDYFpv4=; b=vwK1HnSY8GZduYhRK+BTRz/PnE
	nyu6OnuxgVoUaTFMNlocfOBVb3gfLsceQ/zFgKJgmOwvsiu9F8mn2Q8LIUwy+qmFBeQ88lzIrdOyj
	jBM+7UmlyF/1UuL3lf5c/gA0+S4w174PugrmfJ0Q2WuddPCItodRCkyx8Em0mYy2yfOLJZAhu6K7H
	tUQTp3DMJOlOlrinEy7+ZvkUdkwFDJj0gdBZQFJJ9CJtcXRov1NGGNCKctK9uoJfand1XRzPGepev
	XS+n2SXPFnY4cf9b/5mH5itW/KlwlYiAY1pJ7vTaCfTaUp0W4TgVjRY43LmCZZcXq/om+WTY/wuoH
	YXSxNvAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxrhT-005eBH-06;
	Tue, 31 Oct 2023 16:34:43 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxreZ-005c2e-2s;
	Tue, 31 Oct 2023 16:31:45 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:c562:2ef4:80c0:92f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 504AF66073C5;
	Tue, 31 Oct 2023 16:31:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698769902;
	bh=o2sVtoPPYvq8hM/qyihWIqN4hasDvFA4zhZmTyTxJEg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BcgGAMQCAd2SKRZWEVGqstcDhFsNkTEZCc+2A9vHHwhpV3vLPw/xsK+O2kOh0FWkq
	 BKFcCPblJtIOJ3CJKYgO5babpuggAMFjyFtiod0SbyIRyxAuds13usLyWbCqTZtrlL
	 QFMWtDt7w4+3Lh8erPtgWMV0ysfNkhjnyZ+cLQ6ADJD1G83uc8P6FQFQRkPITf2iWh
	 2VE1bFbG548bted2Es4DmC8th/f1sN+kePa3sZFK0fycpKZSYGdgRxyqtHWQZxsUKX
	 iaQ+ACsXekZqvVVv1pr1zUBshMmJ1RATK0IPDIMTPTPFIcDHZn0UsmKsMLRSgouAk3
	 EymbLhbNz1IwQ==
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
Subject: [PATCH v14 19/56] media: dvb-core: Do not initialize twice queue num_buffer field
Date: Tue, 31 Oct 2023 17:30:27 +0100
Message-Id: <20231031163104.112469-20-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_093144_064139_5503103D 
X-CRM114-Status: UNSURE (   8.31  )
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


