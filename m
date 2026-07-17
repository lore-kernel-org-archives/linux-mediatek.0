Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E33CC44523
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2026 15:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQl5PVCGH7sIQlsUqjynV5DnMRSCC9HSJ3vmRORytzI=; b=Tu69c49wsrIvLNAw4K1MvpUevT
	luvBYCtnBEIPETU3vGbRikS530FfwH1u6LmhQwPuzecwxMufC71/+oaa2+tejNh6E9ygRX10neKgY
	A2JyScOeuZDUxm4PopY0wv7VbrQJhuGNBj3TPRdONfIkLUguYFJPnRdgHQBvDd5GkdrFY9+snotEy
	FeW91zoB1fB71YsYZCiOJLFpXn1kjwV36K1beqFWsQgbDjyqJjdQDnVZGgCvo99g8TOq+NthsYEnh
	sQlWWAeQoGI5rDdQGUCdFwZwWuU0Y1tiS7enz4slIy2dvBM+3TufXsbMG/0htGDd14j1QjqLszVdY
	sjizftlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkHM-00000002Zfr-0che;
	Fri, 17 Jul 2026 15:15:08 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkHH-00000002Zb1-3qHV
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Jul 2026 15:15:05 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-699fbcd23ccso11288311a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jul 2026 08:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784301302; x=1784906102; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YQl5PVCGH7sIQlsUqjynV5DnMRSCC9HSJ3vmRORytzI=;
        b=YQO4hh2jiqSNnGC2Ozb02J02NGcWmXubpDS4SjS48CO3A1PXjfZzXc9jmiLc9/I8a5
         POvWgkOOzzVKsF4pbbd7BiPtZSdAmo/cofUtT/jOqgXq8Nz1RGONiAOq2FlbLa7y+miR
         5iHROuK14Zk3UIK/4cZoS4L7HMex+JwD1wjbiT2XXE2yLXXB4K8bwMTPaSnVrxG96kiN
         FUAR0dUvVKNE+UxYvoulag2jRAsnAmu5/yFiycUb9NHLuSpmvyCFTjN7APguMbaNwEVW
         lwXUmaJ+fVKXMJtvDCIJzhl9UiR0sNwRNB3j8mPMRyTqFjhJ+eg7VTtaZ1xY6d0dKusA
         Djow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784301302; x=1784906102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YQl5PVCGH7sIQlsUqjynV5DnMRSCC9HSJ3vmRORytzI=;
        b=ByG5cPujfauriJLAluOwxjtqAlwwd5ocPMJL36YQqj21E3f9cSf4EPf/BWf0xM9n7Q
         sSjJfzQESweq/A0VECeOoeCn8I8LLv8goTD4EP2mNHyB5RyCxycLNw84c009y3GT6aPz
         kktZRWP/iQ/KiZQf/OsIMmcHn5I89kEVKRnonmUTbCGYW9vf06nszCWzHVbNoN8Ku2lj
         tfHQNZify1M2oUIUnVvZ2Y3d1S5U+ElhwsZ/aVdqsDTUxn05lVHjyoYoguIKIrNKXGA9
         c2ZPrVeD60dg2M5NYKoFfmVzac7iqdqx7FcSTHKNsvvtjVKHHmjL1m4FGbL0gYXrG7hz
         v2AA==
X-Gm-Message-State: AOJu0YxbRbldzNCP2J547icLml3ERk7zz6jZ987LauATgCxflYgDRr4I
	iyyZW8uJQe5absCEcCy9k+KtioBzhrw4pcKmpoWh6VoocDoae0iSC2VnhoBU9vmM
X-Gm-Gg: AfdE7cl5TOocJTAFG1fAj6lhKk2BOiSylOqVFWsjzFTP4HATUP2SdzrkHmpDlXrkrRn
	DC/HWzxYlCxQy48g24YQiryqSQMQ1oEhO8bK540fz1NycnkVIKUoAJfY+fc9j7bsKh+S4uO8onQ
	++p59ppBexJTHrj2K6iOU1i8A9j4ivI4jJgfKUWR4fMfFMwx2eWMYZPdyShYoo6FHbrAhjyN89K
	gSGbBC/rurWHpGQjTf9n2zlTsoKuO/NFFx8Z9A+JYhErqJ+c/7MfjiSN0Hek+XWPuYAFLELjlHn
	vykfDJqt2CWM2uvZGCV10MLpxbTcLBsM2qkLDBKVUmchts1JYtCjp29AX5ZpE0QMhAonhT5wBZX
	juRO02lCDwCgLrOar1TMiFfUKrMU7uWiXvHIHlrcSvAvM1aAgHcYyig53bgGUs6XQ2kd0tXmzag
	==
X-Received: by 2002:a05:6402:504f:b0:698:e614:e4bf with SMTP id 4fb4d7f45d1cf-69e6516b4abmr1042998a12.0.1784301301694;
        Fri, 17 Jul 2026 08:15:01 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbab34sm931684a12.14.2026.07.17.08.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:15:01 -0700 (PDT)
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
Subject: [PATCH 2/7] watchdog: mediatek: Add wdt/toprgu resets for MT6589
Date: Fri, 17 Jul 2026 17:11:09 +0200
Message-ID: <20260717151134.678839-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717151134.678839-1-l.scorcia@gmail.com>
References: <20260717151134.678839-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_081504_009569_C671442B 
X-CRM114-Status: GOOD (  11.80  )
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


