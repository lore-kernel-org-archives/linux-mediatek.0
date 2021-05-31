Return-Path: <SRS0=FJ4T=K2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C02C47082
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 05:13:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC71861108
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 05:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC71861108
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gPrIIJs3ehJ/2Rim5qE0RHtIgpnqCOmdlO0U9UbKUOw=; b=uiyHiplIZw0oS1
	Y40arlD/7yufeBHNLXBkZgA5MlREDoIzXFmLail2URYTZsuxuSbKMlm7Oof/TZP/r4lAobjoy/1uw
	MP3Sklse0rab5lYEG5fyyk3m5kXkRkJ8D/g8NwyD2O+jar8xmEKAJwModSWnFB6d4K3A0Jlf/mO+A
	YRu4P5tM1ET2Rvo6nsWzf02h4AmGzwI9VZZD+Y9TLlrfChaL/EaYg7o58TpZXuNX4y+f2wfL+Io+h
	QsqysYQ9hxWYQPNwNWx0hdVr1psLEVjgi0VYLh3vBc1CWyzZ310W4eGSgexvgued+ylUt/YLDh2kR
	6bgrOWZYY/yJG5RtZ50Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnaEX-00Anf9-6B; Mon, 31 May 2021 05:13:01 +0000
Received: from mo-csw1516.securemx.jp ([210.130.202.155]
 helo=mo-csw.securemx.jp)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnaEJ-00And7-Oe; Mon, 31 May 2021 05:12:49 +0000
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 14V5CNfp012497;
 Mon, 31 May 2021 14:12:23 +0900
X-Iguazu-Qid: 34tKJKyADe5GNT5trE
X-Iguazu-QSIG: v=2; s=0; t=1622437943; q=34tKJKyADe5GNT5trE;
 m=2lw/G/MlYKmz8Fq4yFf0SvbqNLZ2UQr61H/jynzRH28=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
 by relay.securemx.jp (mx-mr1513) id 14V5CKBE005985
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 31 May 2021 14:12:21 +0900
Received: from enc01.toshiba.co.jp (enc01.toshiba.co.jp [106.186.93.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by imx2-a.toshiba.co.jp (Postfix) with ESMTPS id 6EFB01000B6;
 Mon, 31 May 2021 14:12:20 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
 by enc01.toshiba.co.jp  with ESMTP id 14V5CJkV024472;
 Mon, 31 May 2021 14:12:19 +0900
From: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Argus Lin <argus.lin@mediatek.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Colin Ian King <colin.king@canonical.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH] ASoC: mediatek: mt6359: convert to use module_platform_driver
Date: Mon, 31 May 2021 14:12:03 +0900
X-TSB-HOP: ON
Message-Id: <20210531051203.228567-1-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210530_221248_035293_4F29219C 
X-CRM114-Status: GOOD (  12.12  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Simplify the code by using module_platform_driver macro for
mt6359-accdet.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 sound/soc/codecs/mt6359-accdet.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index 4222aed013f106..b2354a613b1587 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -1057,22 +1057,7 @@ static struct platform_driver mt6359_accdet_driver = {
 	.probe = mt6359_accdet_probe,
 };
 
-static int __init mt6359_accdet_driver_init(void)
-{
-	int ret = 0;
-
-	ret = platform_driver_register(&mt6359_accdet_driver);
-	if (ret)
-		return -ENODEV;
-	return 0;
-}
-
-static void __exit mt6359_accdet_driver_exit(void)
-{
-	platform_driver_unregister(&mt6359_accdet_driver);
-}
-module_init(mt6359_accdet_driver_init);
-module_exit(mt6359_accdet_driver_exit);
+module_platform_driver(mt6359_accdet_driver)
 
 /* Module information */
 MODULE_DESCRIPTION("MT6359 ALSA SoC codec jack driver");
-- 
2.30.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
