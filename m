Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D30FC77B7D
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 May 2023 06:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/glaAYXX4H+erWft+To6neKaAI715qTNEPgdTS04O/I=; b=qJG0tfNKCXJSE2JZJZbeoWRMmp
	U3i9NWQeL+mAqk7zIuUamD98nIZwaLMaHyUstmV4Ne8IaaDchoBV9E73dQ8cRfcVqAoWGlYpR1yE+
	aClHbmoHRwklrlajHDNG4nCC9gV/gpM2k8DZqd3QA9b08vGebZSYMY2bQko9eiyISRXirW+mzgJcO
	1E6R7hIw1NT76l8+4NTfDRhUAdOmSdeEayfpeTZLVT2ndQVSw+M80SOLQbnOHwEYzj2kAg9irZ8hb
	yM4zA58xe0TOW5vbeVQ3Obs1juCKOTAwRh0APA+9bK//fBoscs4mkgHILDKmGI4MbbWPcASEIM42v
	RzrqiVFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puona-009oup-0L;
	Fri, 05 May 2023 06:20:10 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puonV-009otK-3D;
	Fri, 05 May 2023 06:20:07 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R421e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045170;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0Vhnzfb5_1683267592;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0Vhnzfb5_1683267592)
          by smtp.aliyun-inc.com;
          Fri, 05 May 2023 14:19:58 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: matthias.bgg@gmail.com
Cc: angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] soc: mediatek: mtk-mutex: Remove unnecessary .owner
Date: Fri,  5 May 2023 14:19:50 +0800
Message-Id: <20230505061950.25977-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_232006_231354_F7370898 
X-CRM114-Status: UNSURE (   8.44  )
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

Remove .owner field if calls are used which set it automatically.

./drivers/soc/mediatek/mtk-mutex.c:1054:3-8: No need to set .owner here. The core will do it.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4869
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 26f3d9a41496..4aa0913817ae 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -1051,7 +1051,6 @@ static struct platform_driver mtk_mutex_driver = {
 	.probe		= mtk_mutex_probe,
 	.driver		= {
 		.name	= "mediatek-mutex",
-		.owner	= THIS_MODULE,
 		.of_match_table = mutex_driver_dt_match,
 	},
 };
-- 
2.20.1.7.g153144c


