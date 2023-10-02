Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3323E784AC
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 12:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KnK9e8ZFi3pebVdrAjDVtxSA0qCAi/hA6TDylmv0g/A=; b=j8wYjlXx8/1EuoYbyKjDocuooF
	qKEs1PDJtkC9CK8NSiAg02Ip4IezE6RCQ3NddxfDO4RN2Z1nBoxVKcVJ7tPX26BbUm5chUuWNu6nU
	tvFMF5OliOUX/JFgiHQYlCq7NrASLtzIZdZhdCeF9lb0SGP4ybZabP+C0sixZp4Ij8A71f9DtFB4p
	pVpcrUJ7a23yxjn/tBNzvME/TKZuCNP8FMjyGf25onqR0U1iLsd2eiM8rwYzGOrGJqCKTRRkvLs89
	tJeWQC4i02++SiRqxtwhVq/ZEv0v+5tof6sYBwdSuYn/pYCCNRU2JxBgbtr/7IQZpq1t4rmh4IyR5
	3gJvLURw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHiu-00CdL2-0y;
	Mon, 02 Oct 2023 12:08:28 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHhD-00CbFL-0T;
	Mon, 02 Oct 2023 12:06:48 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:9537:67ca:c85e:d0ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 07ED66607365;
	Mon,  2 Oct 2023 13:06:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696248401;
	bh=vej0xyoaRLN25qHgld1P1pTyfPCEtxO7zlLcrG23sig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fw9jwe6mE5CMng6H9Uf2U9XYpAuDHCLAU1sWxhAa/o6/BiC+1UOpkHZoy1Jc+3byN
	 USGMQbIaYODd+zNTk3pBdf1PdEU9xVreP7/94ROrqnIfRcgjsw5tOg1weiHlQ0wTJ+
	 naAtlt5ncEOGk5XsWsRKo9z9ncOyuZtklz+mW/ZCV21Of/WHveskbSSNOso0mfEA2r
	 JIhXEZjXkfzJ1QWF6pQuLDy210Yn8fPoRWxIu+0nzX71UItYrYD+NY2I9I4w2Bhqvc
	 nS5+UYtgpsImrMgjMLzR+Lf7OnjCL1b8MQTXvTkAN9BPWqeoffIkTFfQFkarRyEXVE
	 6uZ1QTy2NBSgA==
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
Subject: [PATCH v9 31/53] media: coda: Stop direct calls to queue num_buffers field
Date: Mon,  2 Oct 2023 14:05:55 +0200
Message-Id: <20231002120617.119602-32-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
References: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_050643_339060_2168491A 
X-CRM114-Status: GOOD (  10.00  )
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
 drivers/media/platform/chips-media/coda-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/coda-common.c b/drivers/media/platform/chips-media/coda-common.c
index cc4892129aaf..f1d85758f6dd 100644
--- a/drivers/media/platform/chips-media/coda-common.c
+++ b/drivers/media/platform/chips-media/coda-common.c
@@ -794,7 +794,7 @@ static int coda_s_fmt(struct coda_ctx *ctx, struct v4l2_format *f,
 
 	if (vb2_is_busy(vq)) {
 		v4l2_err(&ctx->dev->v4l2_dev, "%s: %s queue busy: %d\n",
-			 __func__, v4l2_type_names[f->type], vq->num_buffers);
+			 __func__, v4l2_type_names[f->type], vb2_get_num_buffers(vq));
 		return -EBUSY;
 	}
 
-- 
2.39.2


