Return-Path: <SRS0=jJra=56=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B67C352BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 17:37:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D43F82054F
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 17:37:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rXColgwb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0b/WcdPV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D43F82054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=rqZQJV5aqtO37eRAnQonO9HOfPgO4qzrq3qOMsESiSE=; b=rXC
	olgwbesCzdwdijk4XWJgsPH2wu2ujDKtMCoS5Wxisx+Sru2zK0ogYziLMXqZhl7OvLDzjANaQaERF
	g0lb3wT50tjXCnLbsjPUl7fnfvWKv7EGPGVescljaMMFty6uotsFPCtm6VEKhSj9Yw4QbJC3X2d0a
	ebmuVDO/hk7W8E9x1BWNVvX3qgRWqRPu0XiiOD/dSLuP1jPqZfFmLKPsZaZxkb5tfbxb4iERrVc2r
	k1Nwg2LNyG7B0TvtkhTvkOCx9tyd9VxShh5G7Jk3hwwkBjtxGZ9+WRWIaK7NUWPyRFUn3G3NAW9tC
	uP0BQjQcSi+vL+dWENoGDooXz+yXxzg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOPUa-0000S9-1l; Tue, 14 Apr 2020 17:37:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOPUQ-0000JC-Ep; Tue, 14 Apr 2020 17:36:51 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 956A02054F;
 Tue, 14 Apr 2020 17:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586885810;
 bh=atfGXc/+cClM0GBREiTZsOZeix3ptYsx1vBG0s8Qvgo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=0b/WcdPVEQTjlq7Osc3ueiALOavc/xEupuRtgO7xymolTojsL7sxk4GD/t8D0txeR
 xLLvnf4+VSkaXoh/oLUmsxh5C2/Fo+xyZ0WOA97P4EOj6DSXr4iyt5gcwWaOjDWjgl
 5mGcNRLgzhtWNX5mboV07DFkEwDHPh8fBDHrMN+4=
Date: Tue, 14 Apr 2020 18:36:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Jason Yan <yanaijie@huawei.com>
Subject: Applied "spi: spi-mtk-nor: make mtk_nor_exec_op() statuc" to the spi
 tree
In-Reply-To: <20200409085009.44971-1-yanaijie@huawei.com>
Message-Id: <applied-20200409085009.44971-1-yanaijie@huawei.com>
X-Patchwork-Hint: ignore
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_103650_514524_8BAC5B01 
X-CRM114-Status: GOOD (  13.51  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Hulk Robot <hulkci@huawei.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The patch

   spi: spi-mtk-nor: make mtk_nor_exec_op() statuc

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From afedb4b7282b4c532d8aea105943e71c0efb3a6b Mon Sep 17 00:00:00 2001
From: Jason Yan <yanaijie@huawei.com>
Date: Thu, 9 Apr 2020 16:50:09 +0800
Subject: [PATCH] spi: spi-mtk-nor: make mtk_nor_exec_op() statuc

Fix the following sparse warning:

drivers/spi/spi-mtk-nor.c:394:5: warning: symbol 'mtk_nor_exec_op' was
not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
Link: https://lore.kernel.org/r/20200409085009.44971-1-yanaijie@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-mtk-nor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index c15a9910549f..7bc302b50396 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -391,7 +391,7 @@ static int mtk_nor_pp_unbuffered(struct mtk_nor *sp,
 	return mtk_nor_cmd_exec(sp, MTK_NOR_CMD_WRITE, 6 * BITS_PER_BYTE);
 }
 
-int mtk_nor_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
+static int mtk_nor_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 {
 	struct mtk_nor *sp = spi_controller_get_devdata(mem->spi->master);
 	int ret;
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
