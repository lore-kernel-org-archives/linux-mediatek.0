Return-Path: <SRS0=HK5I=FD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B55AC3E8C5
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Nov 2020 18:39:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3369207FF
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Nov 2020 18:39:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mzwr/9os";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mess.org header.i=@mess.org header.b="BtmtWm4B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3369207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mess.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OcPFkyyD6xZ16AAMJir24OPAqc3UWM/15tT+WsGEqhY=; b=mzwr/9os8kj9sXSEBO8fxPRJvw
	LrAxeZzTyepDMSN81tB+Afh5GAM0fSsWIeGzqEZuDm/SwAvL04GqwB2Noz84pjJBSWXZKegCChS/w
	+QCkbL31kA+5fpzES4+OIbajRf4c3GIuW3lOqpw4r4b57XlO0RUUsT1ODvtjlyrAo7KLFQccpL6pd
	RqRQLhnR4LzsUuBaRmOILOZQb34Z1S65+ozYcxrIEdkzW5YneVm7aFFVF3x8RSlNNqt0b3bvWNmaM
	d7DQraa5V7vdKYDxSkzi9QDSHk23F/UYQIxHygTCRgSCCYfnI/dCHF6d2gHIzjbDyfgzpeEl0IeBS
	LudCog1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjRbl-0001U5-TA; Sun, 29 Nov 2020 18:39:37 +0000
Received: from gofer.mess.org ([88.97.38.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjRbj-0001TT-A0
 for linux-mediatek@lists.infradead.org; Sun, 29 Nov 2020 18:39:36 +0000
Received: by gofer.mess.org (Postfix, from userid 1000)
 id 5A0FCC6334; Sun, 29 Nov 2020 18:39:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
 t=1606675171; bh=lHOq9RtER7XLhVkW+pFfckH99vmmj9EuxXycxms+NvM=;
 h=From:To:Cc:Subject:Date:From;
 b=BtmtWm4B5eWG41IDghJlM7U4OJGf0zsYPBrkVOwGrGLmqpCSpjRFRdTyWzTK5l0SI
 Lb5kpp87cevijmtjAQgUtT+wXs+nMaiPThYCIjOaUu8MMRw1Npk9FtLnLTxF3vZEJt
 L2oMs/Nm1ZPGWN3HXi/f5IbwouZw8E69OLOjvSnTofPeKpw3RbyA9mX+RXOQuoXQI6
 roM2axC6NEvbKZ8/rqAHYx1jNfz+bZGsAgzfyy55TasvED3PWvqL+7G52yYOx7GiMP
 Tg9/hjPxwxOKWSXbYBWJT3iIXu5t68vL+gUKTpFZKXM+hhw0bq//to/bWpZuQDX7fy
 MxodARHeJE36Q==
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Subject: [PATCH v2] media: mtk-cir: fix calculation of chk period
Date: Sun, 29 Nov 2020 18:39:31 +0000
Message-Id: <20201129183931.19208-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201129_133935_556304_9B05B72F 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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
Cc: Sean Wang <sean.wang@mediatek.com>, linux-mediatek@lists.infradead.org,
 Frank Wunderlich <frank-w@public-files.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Since commit 528222d853f9 ("media: rc: harmonize infrared durations to
microseconds"), the calculation of the chk period is wrong. As a result,
all reported IR will have incorrect timings.

Now that the calculations are done in microseconds rather than nanoseconds,
we can fold the calculations in a simpler form with less rounding error.

Tested-by: Frank Wunderlich <frank-w@public-files.de>
Fixes: 528222d853f9 ("media: rc: harmonize infrared durations to microseconds")
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/mtk-cir.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/rc/mtk-cir.c b/drivers/media/rc/mtk-cir.c
index 5051a5e5244b..65a136c0fac2 100644
--- a/drivers/media/rc/mtk-cir.c
+++ b/drivers/media/rc/mtk-cir.c
@@ -151,15 +151,12 @@ static inline u32 mtk_chk_period(struct mtk_ir *ir)
 {
 	u32 val;
 
-	/* Period of raw software sampling in ns */
-	val = DIV_ROUND_CLOSEST(1000000000ul,
-				clk_get_rate(ir->bus) / ir->data->div);
-
 	/*
 	 * Period for software decoder used in the
 	 * unit of raw software sampling
 	 */
-	val = DIV_ROUND_CLOSEST(MTK_IR_SAMPLE, val);
+	val = DIV_ROUND_CLOSEST(clk_get_rate(ir->bus),
+				USEC_PER_SEC * ir->data->div / MTK_IR_SAMPLE);
 
 	dev_dbg(ir->dev, "@pwm clk  = \t%lu\n",
 		clk_get_rate(ir->bus) / ir->data->div);
@@ -412,7 +409,7 @@ static int mtk_ir_probe(struct platform_device *pdev)
 	mtk_irq_enable(ir, MTK_IRINT_EN);
 
 	dev_info(dev, "Initialized MT7623 IR driver, sample period = %dus\n",
-		 DIV_ROUND_CLOSEST(MTK_IR_SAMPLE, 1000));
+		 MTK_IR_SAMPLE);
 
 	return 0;
 
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
