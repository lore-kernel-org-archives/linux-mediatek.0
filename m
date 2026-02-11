Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086F7ECD6E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Feb 2026 19:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L887ASoGk+SRq/zl6CDIjyzwXxgUSRpV2EZ36HcCxec=; b=dCpcauPAsnhWQYz55sXKU6IhDz
	xpnIoGVoDSBYoQ4IwJ2Yqr99AA+9syXJ4OILOXRTkbEWCopjlKOXGzlXNuPmYxuOx8vI8e0glkJOv
	I63K/yQHHnN6CDBZmOYPdge7drRcvuKWyGpgint3fTTD65vEKB42eRARe4nWQVN/sPX00aC0U4Nam
	+hvFF46BNACFwlzQBBfKaRSOCPvsIZzkAIorbedQW9l8FSnKcvDHfHwiIqSXZMURe0kuWCnKNN30v
	lUiNhVrPIZFwONQgeUH8VFLlquDeOXOP2LYAi3egXKyylJjSVoYte3c0aOoOUVJt6k2RubSfgPT6I
	55of3ruQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqFXi-00000000xUx-3URN;
	Wed, 11 Feb 2026 19:06:30 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqFXg-00000000xS0-46Ry
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Feb 2026 19:06:30 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4362d4050c1so5601170f8f.2
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Feb 2026 11:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770836787; x=1771441587; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L887ASoGk+SRq/zl6CDIjyzwXxgUSRpV2EZ36HcCxec=;
        b=ZuAmbML7ZbXpag+DaeVObdRAzWlmKxPvAVzhAno2tKQCf8jySqQAynPqTr8atPa2pD
         nsr1dYNjR3xpOViP5LvtpgF4CbWAMErD5e6VVCQQU+4cX8nXV4HZ/2Pn2KiAO38m0kIL
         7ZIONz3f4qSdDZ+PHziHQnmlCt7D2J3his3+yQ++U73Rjb7Rs+5D8XFccT7msL+DCKLH
         iW2Uj/NvK58U0d+V2hxl/noWxTqUnmoSQGO2DqtoH5Ow2Egxsh25qAcgqJdYjL1xNHHt
         u3YIruM2b0pRB+JX/3dcu68ynp1bnxX0hmqkNkiidZaYU21B5IwYTFGqj+fR+gaurufS
         5PsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770836787; x=1771441587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L887ASoGk+SRq/zl6CDIjyzwXxgUSRpV2EZ36HcCxec=;
        b=ZHYtXe5FPxXVNm+3jYMPCZpbSYHnP4L2dRg1qKgXEAOsfml6jvSGkhJZ/+IebhqNtF
         v10GmVCakF59lf0jRDiQAv8Ev86BQfzinwkYE1pXI6/IRRBd58ReUeo6Z7mljRdMBzWZ
         nEhwQsATPFOiwkP9ojIeVqgW/QW8S7cG7BHd4vsMlUpzaoJp7ZOMxcKpyprFLXJCxs0g
         3l3KhdGoiZWhrsoQ2wRGD5VCuqwJnMXmcJPPpvA8MOVHUSa/viXO/b/PescYcureB0zS
         P6UudcUbXHz2gygbfMDxXCRpEcRn1IhWNdx6wsNQNWSG2U9HBQSbYRnO0s8corVezo1U
         1Vrw==
X-Gm-Message-State: AOJu0YwVZulmPtMTXVHPESxVHhaJ9+/QQqTtDWMhyuvqid40fsgn0sKX
	AcZRZezb3RwR6JMCoK3LB4sPVmARXVcgwYS9R1ZwZo7xXNprOfRZ/9JgZVvMgTqs
X-Gm-Gg: AZuq6aI5oCTt/ojXdhJMVQyLNMeV5yCpA9fiAnqFZNODymYhMM32fir3Ig/PoGNFchR
	02mRbpkqnfekayo870kExJoxK+HOpwZhw4Ebe1lVBcMpOHzfn7LiQvdGhg95Qh6F/3szb8YLQ3X
	o7EKS4nyKWhMNs3u1zNr40RG+SOcpT75OE0N4hOxDMxJDlUVbkruyDZQvK8hPA9qSiChPFtiqM9
	nrwZuEQu3194Ur+S+vxB70DU1B+tAHPrJDNz91WYlOGvoc9PO7UAKHdxxmiIDmgvtBgZ/h5+GFK
	EHL3LEYiA5vkQrNEQMEetrP69OEW4DX93ZJMGE5ekNAq2SFpwELFjMyTRnfngeZiqHGzi8fhJ+Y
	Fq46+VnALsJL/xl2mxtrbnGF6kKKwwCrpcUa8Mlb9k2Z/jSG7L50i1CvAh3533cRPrPu3GqbiUn
	YjwC2QTQnPmkAeli8+0pU=
X-Received: by 2002:a05:6000:2888:b0:436:3267:3edd with SMTP id ffacd0b85a97d-4378acf76ddmr638334f8f.22.1770836786611;
        Wed, 11 Feb 2026 11:06:26 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4378e122df9sm211223f8f.15.2026.02.11.11.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 11:06:26 -0800 (PST)
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
Subject: [PATCH 3/7] watchdog: mediatek: Add support for mt8167 TOPRGU/WDT
Date: Wed, 11 Feb 2026 19:03:24 +0000
Message-ID: <77434edba7ab5050f5c0fd03302bf9eb4b1c60ca.1770836190.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770836189.git.l.scorcia@gmail.com>
References: <cover.1770836189.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_110629_054797_A0B919C5 
X-CRM114-Status: GOOD (  10.98  )
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

Add support for the Top Reset Generation Unit/Watchdog Timer found on
mt8167.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/watchdog/mtk_wdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 91d110646e16..ded16173105b 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -13,6 +13,7 @@
 #include <dt-bindings/reset/mediatek,mt6735-wdt.h>
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
 #include <dt-bindings/reset/mt7986-resets.h>
+#include <dt-bindings/reset/mt8167-resets.h>
 #include <dt-bindings/reset/mt8183-resets.h>
 #include <dt-bindings/reset/mt8186-resets.h>
 #include <dt-bindings/reset/mt8188-resets.h>
@@ -105,6 +106,10 @@ static const struct mtk_wdt_data mt7988_data = {
 	.has_swsysrst_en = true,
 };
 
+static const struct mtk_wdt_data mt8167_data = {
+	.toprgu_sw_rst_num = MT8167_TOPRGU_SW_RST_NUM,
+};
+
 static const struct mtk_wdt_data mt8183_data = {
 	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
 };
@@ -498,6 +503,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
 	{ .compatible = "mediatek,mt7988-wdt", .data = &mt7988_data },
+	{ .compatible = "mediatek,mt8167-wdt", .data = &mt8167_data },
 	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
 	{ .compatible = "mediatek,mt8186-wdt", .data = &mt8186_data },
 	{ .compatible = "mediatek,mt8188-wdt", .data = &mt8188_data },
-- 
2.43.0


