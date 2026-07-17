Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C905C44515
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2026 16:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQl5PVCGH7sIQlsUqjynV5DnMRSCC9HSJ3vmRORytzI=; b=LYIXImPsg9L04crr5AGblO8O4D
	OTxRJrnpcSrbY19Np1Was+tgZabm58t+2NKRdVI0um6aNx3BlBHzIfwjeL5XXAn8Kg/FtIbX/3Ooh
	TRWLADTZje+fsoGSxy0bs8/0dKjY1V3r8FWOrwJlrn3bATkDRCVMyL1Ss8b39ECe6M/YaSakHYB3c
	ZPqHdrRFE4EeEy4IOC0dO0knoZpcPl8Dkb0DKbWUMt0so5Q23wDxCbgoD8RIyoAkTNv2LYSoe47v8
	q0MGYgkefwlAW4T0CVrbPMGIM+5OzitpGFr5Qt10d0Bq3rTsOYxI4fJL5F5MkrgvKYb7oyZTnVevu
	ZSRlrqxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkldV-00000002lIV-1wjZ;
	Fri, 17 Jul 2026 16:42:05 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkldM-00000002lBG-12HA
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Jul 2026 16:41:57 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c15e03c2763so401987066b.0
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jul 2026 09:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784306514; x=1784911314; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YQl5PVCGH7sIQlsUqjynV5DnMRSCC9HSJ3vmRORytzI=;
        b=bQWowZbmRr519a90+Tf49LSjr0cC1SjFnQzKHoYDRxZP7jt5LgeHjRY+hV3X/eLrwx
         gBZKY+HnoGCyaH554TwLqNqAxgDDo8mm3QkOEuGboMFAw0/uK0jdOrdGI6ywYp6SBaEu
         MJMxTMt4TooSpaQ+a9zEfqrxVsdfjkhP+k7wSoVG4Ye1pjfveNp0eGEZdiGKoR+bPbOZ
         ddqlbZBy6NGKtGNHPE18B4aS1Qz4IlEeSVD64Boy9VMKOMqKwSETcKU5/lsTNBZE8GTH
         XbFR7ljD4Hxj6sjbI+6wC0UV01TnKpT8xCqrEHkktG0WT2IlFrN/qg2XIjRFPQ/1Sav0
         awBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784306514; x=1784911314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YQl5PVCGH7sIQlsUqjynV5DnMRSCC9HSJ3vmRORytzI=;
        b=r/fDjYhuYlAYqLPyxd917Y/Aol2zoGeseAdFStXGIl/dm4LympSWrldGQhEL3gPoua
         Ie/x0INispnHWRyba0C6BXucUIcJOuB+ndovGhfO160IJi3sEMGNY6R1JIyIS9VQmDKE
         TpQYPEVUz6Ebrjt+8kiukGWsFB9Df2fl/iypd2xalhNezZY4tc9fHUpgzzYoapXSqmH/
         XtFBDfdV91Bzq+ilHUS9K9zBahm3BtQvtwOve4g0oEBS9ugl/GoaJ5sysleRRiXPrAvh
         Mcw+pjePO4urQxN+XE8M6/igi1ipH0X/LMurVRdeuWxfapWg9CPfuo6QdQ3BiokeC3He
         Z1Dg==
X-Gm-Message-State: AOJu0YyR84mMDy68flaow3LWTBcxzKTV2uE3LacREZnNYUJzTWv5CW5m
	ijfP4BgDTFrlqjnTphNd3A2zf2ZNZfB/Qb2y6JakDaZe+edAuvdvvx99N4YcKFW4
X-Gm-Gg: AfdE7ckNWhOI0aA8K2FNPmO5RNVXQmZeTfKgQedFeQZgpEL+1iLnmg43Az9E9w+En8o
	wXKkM3NAztPXmVR6UhfMkl7CM6/ZGkh/9dtLHtyfKMOsTW9kwEDnlcQOuZL/kQOCj9eANjAtmlM
	+Uqf7bg420hnoheZzjctT/NnKZ0HsS/eqRdH+hZJynIglULfMkvA8GdNQ8eEadOhlUKWSu/FvpM
	iqfdhNRHW+gwtEWytlV5rWralm7K9gbIonWyeyxn0fTCTKN+N7w7b6OgttuBV2l72I479Xunedi
	t+fmHZXYHYSDqUUiolYVfIX369QfhXtGk/FNb4zMq5MviRxWQi0iQtIEemrkDDxXgsXb5qnCQpu
	/wdFVq2mLBsz7pUG7h8HlTLVpIUas1bqlHhQmjKLFGocYtfcFdrIsRh3qmK//jGBueEZE8q0DTA
	==
X-Received: by 2002:a17:907:9625:b0:c15:dd1f:f2d with SMTP id a640c23a62f3a-c1692413dd8mr352045966b.25.1784306513979;
        Fri, 17 Jul 2026 09:41:53 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705912972sm105880366b.14.2026.07.17.09.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:41:53 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/7] watchdog: mediatek: Add wdt/toprgu resets for MT6589
Date: Fri, 17 Jul 2026 18:39:13 +0200
Message-ID: <20260717163959.714561-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717163959.714561-1-l.scorcia@gmail.com>
References: <20260717163959.714561-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_094156_360018_D12CADE2 
X-CRM114-Status: GOOD (  12.02  )
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

According to Android sources, MT6589 has 12 reset bits in the
WDT_SWSYSRST register. Populate toprgu_sw_rst_num to allow toprgu resets
in device trees of the many compatible devices.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/watchdog/mtk_wdt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 91d110646e16..e61f6ae74327 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -10,6 +10,7 @@
  */
 
 #include <dt-bindings/reset/mt2712-resets.h>
+#include <dt-bindings/reset/mediatek,mt6589-resets.h>
 #include <dt-bindings/reset/mediatek,mt6735-wdt.h>
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
 #include <dt-bindings/reset/mt7986-resets.h>
@@ -88,6 +89,10 @@ static const struct mtk_wdt_data mt2712_data = {
 	.toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
 };
 
+static const struct mtk_wdt_data mt6589_data = {
+	.toprgu_sw_rst_num = MT6589_TOPRGU_SW_RST_NUM,
+};
+
 static const struct mtk_wdt_data mt6735_data = {
 	.toprgu_sw_rst_num = MT6735_TOPRGU_RST_NUM,
 };
@@ -493,7 +498,7 @@ static int mtk_wdt_resume(struct device *dev)
 
 static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
-	{ .compatible = "mediatek,mt6589-wdt" },
+	{ .compatible = "mediatek,mt6589-wdt", .data = &mt6589_data },
 	{ .compatible = "mediatek,mt6735-wdt", .data = &mt6735_data },
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
-- 
2.43.0


