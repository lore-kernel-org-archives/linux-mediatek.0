Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72752C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jun 2022 12:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bSDinnzl56D9PFKDeB860nkVQnIp9oqH1T1HFaPBfr4=; b=0gIymmQTTQeWL3wra+5e8PW306
	uej7PdE6WLU5I8eG62haJGAZJ18CZBqxt7Tviq/ETjG/iSKkoXZL4cLTx11o3i1r/dgAMyx8AFXsP
	axjRFIvjjHz83cG2afZJ6HeXyAFV/zKopJ4uqYikong7sTPV4JVrcX7BD+eqVJVMkHNmMsUWwkCmR
	mLjTADOymK4QtSuwYfGpeJxoBQG7gR9dFGYIUERqKZFaZx6Uf0INYU9Ao1/DGlnNN0lOlOmrg+GH1
	Wgve7EYOfPzGANonLhpIovn+XFZiG3nE4h9fNoN6wziIx+alGXnplMzk+EIewUzKfSZmBIphJ4Sgb
	1QMCYyog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6A60-0067Td-Bf; Tue, 28 Jun 2022 12:13:32 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6A5x-0067Sc-SW
	for linux-mediatek@lists.infradead.org; Tue, 28 Jun 2022 12:13:31 +0000
Received: by mail-pl1-x62f.google.com with SMTP id m2so10903839plx.3
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Jun 2022 05:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bSDinnzl56D9PFKDeB860nkVQnIp9oqH1T1HFaPBfr4=;
        b=LZrAI0t9vW3GfRkSpY5xnTWBpPAMoPHypn1lKSOQhWtqPjmYD3IWl5ZGZwnfqNH4cA
         UNELUthAvR2LaChKvDDw8gu9lKukzIBW1qWYIakbZ2iOSuacjr0Xi5vGfhCIvf3edIoG
         Iym+3aKlyhlV8HgZaFldWhGZM/KL1pBVLab4Qn0wUwzNv22YkDl/2EmzqhDUVe8vh/d5
         CrdV9xvFs1eslvwDl+QI6nx6D4NFcuvzAk58AmdWg7p4DkFHRYMgFrunqJDT2eQ1POvO
         OvziMaJsAhq/Ued3JYdCr+Z+mQvn1bDRO6QwdMUH2j8tNCWzZPYpUhKlJZQM0Dvi2iiF
         FneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bSDinnzl56D9PFKDeB860nkVQnIp9oqH1T1HFaPBfr4=;
        b=QaXcBDfQjBBk0+P+8jCbRizKeK5IFulBsYd/3tSVOuae3BdDJYqdS09+dNqf4XIQBS
         XVrbqitFXtFhBkmRNdW7qQLJ9tfXnN3StAlJ0UCwrY1Q1wf3hBe5al25WYf3Jcx4agrk
         q22mhqtE7q0vyMl5g0R0e/brT9TCCjZIKd8IEmo7Xx8gJE6G8xHm1tcrIKZI3a2Xw1gw
         WT6m2icvNTNA9liYE6QG91idRGAcTMHNEwqJVC02RtRIEXqaTnQDAl2c7GHjrr4qA5q/
         I9EcbMGmDVhV0lq7XkSv5Udvau9TSREtl0XqdSMuKcYHpZb3NCnaOAfZ8TVK2KRmAhQR
         abLw==
X-Gm-Message-State: AJIora9MhdcY3OHNIr9nqjsr/0lV4dedtM2H3sRVvfkRbG3z/vED6AyY
	xmuagPFaNLpixQboUIVyV98=
X-Google-Smtp-Source: AGRyM1sAf5ZuIfFPHYHjm02zMm3ex+WsIGHP3DaH/nqnRS89Qycce/vuhFMht33UFBTpn5MzHyxBPQ==
X-Received: by 2002:a17:902:c40f:b0:16a:37de:89c2 with SMTP id k15-20020a170902c40f00b0016a37de89c2mr3505380plk.105.1656418408006;
        Tue, 28 Jun 2022 05:13:28 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net ([2601:641:401:1d20:37e8:2f95:a443:c532])
        by smtp.gmail.com with ESMTPSA id r19-20020a170902e3d300b00163f8ddf160sm9070496ple.161.2022.06.28.05.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 05:13:27 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Roger Lu <roger.lu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-mediatek@lists.infradead.org,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH] drivers/soc/mediatek: mark svs_resume and svs_suspend as maybe unused
Date: Tue, 28 Jun 2022 05:13:26 -0700
Message-Id: <20220628121326.2097912-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_051329_975227_9AA2622D 
X-CRM114-Status: GOOD (  11.91  )
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

This fixes the following build errors on platforms without hibernation
support in linux-next:

drivers/soc/mediatek/mtk-svs.c:1515:12: error: ‘svs_resume’ defined but not used [-Werror=unused-function]
drivers/soc/mediatek/mtk-svs.c:1481:12: error: ‘svs_suspend’ defined but not used [-Werror=unused-function]

Fixes: 681a02e95000 ("soc: mediatek: SVS: introduce MTK SVS engine")
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 drivers/soc/mediatek/mtk-svs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 87e05ab51552..363ab8bffa9f 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -1478,7 +1478,7 @@ static int svs_start(struct svs_platform *svsp)
 	return 0;
 }
 
-static int svs_suspend(struct device *dev)
+static int __maybe_unused svs_suspend(struct device *dev)
 {
 	struct svs_platform *svsp = dev_get_drvdata(dev);
 	struct svs_bank *svsb;
@@ -1512,7 +1512,7 @@ static int svs_suspend(struct device *dev)
 	return 0;
 }
 
-static int svs_resume(struct device *dev)
+static int __maybe_unused svs_resume(struct device *dev)
 {
 	struct svs_platform *svsp = dev_get_drvdata(dev);
 	int ret;
-- 
2.30.2


