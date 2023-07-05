Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D7DEB64DD
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jul 2023 12:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bB/3hLtohdB802uCi52FVq0AL+y6QYpMc7PKnsKwbN0=; b=ZhLZp0tjIN5PyZWr57RCIt0YVX
	UebpJ2GOp5K4qPxDJw34WXwzihRRreyHscE+mX5XfY/xuwFrIpwcsx/dSDN8THlONt+VikKI5SljE
	ky6cmFqCLwq5R3hpWzjHXTGPTAHWeryJXN2+jgiR5EDuFhdA5xehZ9eIUvQFFbUsEFKvOv4M+ykQ3
	3hQnRTeatjEcln2n+REpIOt9CVgfqloGr551BhqYyI4xykJ30ki3kXJLC/Hkw6m5ljcq0B8i+ZJqn
	drUAZBzk39QMuAX7SkGwrvjxfan1XO2HVCLBMDxnNBI7XTuxirBBBFMm/JIAqDd8q3JR/RR2J0MuX
	qrDNFwNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH1M2-00FplX-2g;
	Wed, 05 Jul 2023 12:11:30 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH1Lm-00FpWn-1x;
	Wed, 05 Jul 2023 12:11:18 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:cbfb:e358:222c:d8c1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DC0276606FBE;
	Wed,  5 Jul 2023 13:11:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688559067;
	bh=6n9YDENO5tS9E5wXFuEEJQVmAp+420F/j+1xBut9kDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=By8WxvmRq50dxMjr2/Qp1PvcwEYlsrV3YglpBY1hUNNS87Lw+SrJeGbsuZSqJxTbO
	 ci2cphotQ+JxWPgnJ82DzDr6E8A0Et8Pd1EiVw7TG+JXs8/isxXVul8VqV9nn099v0
	 I6rAvuOpK+ZpVr/Kia8cxeiVh+VcAnvBvA94VsKwS4LsffbM77NgsvfoyxxFixSStD
	 f9LBWSvk1wPcJRQwquS+PVl9CkwRI8ggaHAiSQkWgGm/WmpQzJmMVEeBn23vcqUn8h
	 LOU1docdsKMHpfr+nRqg/EEEhWdLgi4FDrlHuL64ZyhurDNXISqpz8OOX8rZtfrj4x
	 ynicCG9VnoQhw==
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
Subject: [PATCH v4 07/10] media: verisilicon: postproc: Fix down scale test
Date: Wed,  5 Jul 2023 14:10:53 +0200
Message-Id: <20230705121056.37017-8-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230705121056.37017-1-benjamin.gaignard@collabora.com>
References: <20230705121056.37017-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_051114_813439_25D7F940 
X-CRM114-Status: GOOD (  10.81  )
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

Do not allow down scaling if the source buffer resolution is
smaller  than destination one.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Fixes: fbb6c848dd89 ("media: destage Hantro VPU driver")
---
version 4:
- Add Fixes tag

 drivers/media/platform/verisilicon/hantro_postproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c b/drivers/media/platform/verisilicon/hantro_postproc.c
index 9dfe3141a398..38e812089514 100644
--- a/drivers/media/platform/verisilicon/hantro_postproc.c
+++ b/drivers/media/platform/verisilicon/hantro_postproc.c
@@ -103,7 +103,7 @@ static void hantro_postproc_g1_enable(struct hantro_ctx *ctx)
 
 static int down_scale_factor(struct hantro_ctx *ctx)
 {
-	if (ctx->src_fmt.width == ctx->dst_fmt.width)
+	if (ctx->src_fmt.width <= ctx->dst_fmt.width)
 		return 0;
 
 	return DIV_ROUND_CLOSEST(ctx->src_fmt.width, ctx->dst_fmt.width);
-- 
2.39.2


