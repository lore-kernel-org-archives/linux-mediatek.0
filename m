Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3982D30016
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 15:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zep2EuvDBdAiZzmLhkCCAPTJ0RyrRJFef4D5N64eSCQ=; b=p7WBJhLcWz+Q+q
	ZAuhfmqLAZqCrS7odW1XLK1Qyb2C1OUTslpzIaebRPqi5vsUgGnBTDGVfL2NNisYAVuBY5ZtSthFe
	YHWu02GlnNvSuQS2WF36QGWUxJDK4ayY+LmXgQHd0acJn1bgstACQRSgWhQH7rS70oSTNuFliuR7i
	C0ciCcGBKZEnmdZgm5Pr/P3WC5xYCN7KTUcS8YbEd9KHrQlYdKesNsAS7locMsNzvCU2A5B5iQyna
	SL0KUGpj4aqAvP0LVByvhTt6uOEFz5BpRvzDqW61OCgEQoGq67o4XeCZ39emj2rnkpcYOC+aBc2nf
	m29MVEBUcDoiKvS0V2hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1oqn-00000001Bbj-1Mb5;
	Fri, 18 Oct 2024 15:25:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1onH-00000001AyT-1g6a;
	Fri, 18 Oct 2024 15:21:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 75546A43E1E;
	Fri, 18 Oct 2024 15:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28513C4CEC3;
	Fri, 18 Oct 2024 15:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729264894;
	bh=mx87PZ0fJUAC0aOMm3blO7HIkucZJPoFvoNzVO2DGLE=;
	h=From:To:Cc:Subject:Date:From;
	b=bwlbPMPmuPOb+/LqJ4WWncgzj2FxM9cJbcXhcNpVUBcuxbuOLQmxcIwfK2EQiaAM2
	 wFW+zK6d9BgpayW1uV2DDKEJzHDzPGQdwW5P5SbcxxSi/WWWP8RC218y679NVZFbve
	 Gfdf8hG7p2CdRRC4m/fW9y2L+cLdWsySOdOtalASlfjX7eu6p5RH7PmppentunxdkY
	 nMcB7FI2w4FI/qiI18Rje10jYVIg1m/VFNst5Tj/Gyl4dagpE9Mq+pQD6ZVTlL6lUu
	 rgE355uhVy6JVgvJFz5jlu3ThFMqgqjMIpfNaXquZ1lE9W1IiuWby/GpZjexiBoSfJ
	 tJhIEAUL6c7Qg==
From: Arnd Bergmann <arnd@kernel.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH] media: mtk-vcodec: venc: avoid -Wenum-compare-conditional warning
Date: Fri, 18 Oct 2024 15:21:10 +0000
Message-Id: <20241018152127.3958436-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_082135_514456_E5D7B843 
X-CRM114-Status: GOOD (  10.83  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>

This is one of three clang warnings about incompatible enum types
in a conditional expression:

drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c:597:29: error: conditional expression between different enumeration types ('enum scp_ipi_id' and 'enum ipi_id') [-Werror,-Wenum-compare-conditional]
  597 |         inst->vpu_inst.id = is_ext ? SCP_IPI_VENC_H264 : IPI_VENC_H264;
      |                                    ^ ~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~

The code is correct, so just rework it to avoid the warning.

Fixes: 0dc4b3286125 ("media: mtk-vcodec: venc: support SCP firmware")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../platform/mediatek/vcodec/encoder/venc/venc_h264_if.c    | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
index f8145998fcaf..8522f71fc901 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
@@ -594,7 +594,11 @@ static int h264_enc_init(struct mtk_vcodec_enc_ctx *ctx)
 
 	inst->ctx = ctx;
 	inst->vpu_inst.ctx = ctx;
-	inst->vpu_inst.id = is_ext ? SCP_IPI_VENC_H264 : IPI_VENC_H264;
+	if (is_ext)
+		inst->vpu_inst.id = SCP_IPI_VENC_H264;
+	else
+		inst->vpu_inst.id = IPI_VENC_H264;
+
 	inst->hw_base = mtk_vcodec_get_reg_addr(inst->ctx->dev->reg_base, VENC_SYS);
 
 	ret = vpu_enc_init(&inst->vpu_inst);
-- 
2.39.5


