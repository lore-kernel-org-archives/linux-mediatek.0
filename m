Return-Path: <SRS0=/0MH=ER=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F93C388F9
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 04:15:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEF1D21D46
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 04:15:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WkNSKH7R";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="P3HoxGXg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEF1D21D46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zdKmQgcyKULuoiIM9ezhCrYtO8/rOMjjTPghJ1aQVSE=; b=WkNSKH7RPjvT51kOoTHG+vXIzs
	BSeyz5lW6GcMMha3WiljZVTZtDJHUR11eBO2+tQpSLodI1+HUCZlNq18ehaIX5uztYkleMyznhvBk
	evsqRCLRnTnIa7pSbtSIJpBkWcwRAIV559bYhysIl45sf5qu/Zyg2l9wvutUauhQ9bscbfTvD7p1C
	AEJUS05ZGu2sy26c9ClJZU3p+z/ltdcHC7hfxyJHExa3kDdnCjYBe4hxZjK89R4Z38yDlNxywJjXv
	E6wQycfN0u7FKDD6jadCBIxkgi2Gli6/dnoseSkazo5VNyF6v2eJYep/uEkRn/BxWQ2aXuSubQN/s
	j19EDZNw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kchXS-0001NC-Iz; Wed, 11 Nov 2020 04:15:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kchXN-0001MU-RG
 for linux-mediatek@lists.infradead.org; Wed, 11 Nov 2020 04:15:16 +0000
X-UUID: 9ac621ff174d4987a8b7443b2677699d-20201110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=XhvoJRx64HT8sYxTDYoQZq7KYXPTuk7jUFfjY8XPH94=; 
 b=P3HoxGXgHqmil5lL3TGlizIG1JhG0C0e419daydbDjqePS+Dv0SFBTY8v3/EDArjv8IazV4r/fbWty5SJRkJ6U2EWzjF6sgvBR6DYsXXkw4H0596AUoepTfouhMWIb9DCj/fAP24VEzatmmjN9N+D3nsszMj3rFLqJ+cmUXFtuY=;
X-UUID: 9ac621ff174d4987a8b7443b2677699d-20201110
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <shane.chien@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 10537973; Tue, 10 Nov 2020 20:15:01 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Nov 2020 20:14:59 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Nov 2020 12:14:58 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 11 Nov 2020 12:14:58 +0800
From: Shane Chien <shane.chien@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown
 <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: Remove mt6359_platform_driver_remove
Date: Wed, 11 Nov 2020 12:14:56 +0800
Message-ID: <1605068096-12587-1-git-send-email-shane.chien@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_231514_745226_933269C4 
X-CRM114-Status: GOOD (  10.69  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 chipeng.chang@mediatek.com, linux-kernel@vger.kernel.org,
 jiaxin.yu@mediatek.com, shane.chien@mediatek.com,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Shane.Chien" <shane.chien@mediatek.com>

remove mt6359_platform_driver_remove due to it is
useless.

Signed-off-by: Shane.Chien <shane.chien@mediatek.com>
---
 sound/soc/codecs/mt6359.c |   12 ------------
 1 file changed, 12 deletions(-)

diff --git a/sound/soc/codecs/mt6359.c b/sound/soc/codecs/mt6359.c
index ecdfd57..d37dbd2 100644
--- a/sound/soc/codecs/mt6359.c
+++ b/sound/soc/codecs/mt6359.c
@@ -2817,23 +2817,11 @@ static int mt6359_platform_driver_probe(struct platform_device *pdev)
 					       ARRAY_SIZE(mt6359_dai_driver));
 }
 
-static int mt6359_platform_driver_remove(struct platform_device *pdev)
-{
-	struct mt6359_priv *priv = dev_get_drvdata(&pdev->dev);
-	int ret;
-
-	dev_dbg(&pdev->dev, "%s(), dev name %s\n",
-		__func__, dev_name(&pdev->dev));
-
-	return 0;
-}
-
 static struct platform_driver mt6359_platform_driver = {
 	.driver = {
 		.name = "mt6359-sound",
 	},
 	.probe = mt6359_platform_driver_probe,
-	.remove = mt6359_platform_driver_remove,
 };
 
 module_platform_driver(mt6359_platform_driver)
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
