Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A01BDC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 10:49:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7275620758
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 10:49:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vR1yB0Fu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTd3pBEf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7275620758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qgNKfCh0P/w92GnUOabKezTq9zB31tOHgvqc5WVt5Mo=; b=vR1yB0FuWFe/UQ7M9CyH80D40I
	aT5DXNXmTvo9q4dOXewt52++4HfvhKoNDLEMberqS0NmLWdPYAu/nuT82oo0d35Kvqqj/sHKidKTA
	zYTnD36qi6QcPmoWYTHj8HLc2lOsc+JSh/X+Pvf27kgft2DQy2jp0MDgKNbFBVi6e7Wx+aPsZZhEp
	Rme7LPSgl9x/WGCUj3owpQySaFvP7kazbhYtcKcXuixXzriCC1atFeB37PHdtljE8mIbcIJQk870q
	MOrHqbw+3SswxSo28i1e0JSoebh1HDtH6aoomq4yOCYeaKdDMxscn1G9k7YwcddUjBoCSHphdtfJH
	UsIUY+SQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7chZ-0001pV-V5; Mon, 17 Aug 2020 10:49:18 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7ch9-0001aS-En; Mon, 17 Aug 2020 10:48:52 +0000
Received: by mail-pf1-x442.google.com with SMTP id d22so8038380pfn.5;
 Mon, 17 Aug 2020 03:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Joo9G8dpZiV+ukJjlPwDuzRh/fKHk3sZ/ezTEfq1J4w=;
 b=cTd3pBEfcGOI0GUl+jGoJ9C1jxMlmWh9GPGRNVa87Suq21Jw1Uxy5NhHGeORvoyBdP
 coa4aiLyM8ttF+0vS8u/nG0tFlo4IhI2APHwnMmhf1NKoXQ6JURg5aupiOxSICS8Z+kM
 cGCi+wI8pQiigNOA7cU4sjYrvs6N3t/Zas9HmbPFD4AwAWU8jinfD3U/vC8NjF0qYhc7
 omz0UQ/RZlNoZqGKBreomIsg7fLrHm+c93tqoVYEMtKRHGj8E3Ltbwsml+todPzuspbT
 m1ySsGyOe+FkxH8Imm2LQQh+8fB5ihV6B6xc4g/ixK5/fY1lU9S6/F3nrC09OpkF51Fc
 slgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Joo9G8dpZiV+ukJjlPwDuzRh/fKHk3sZ/ezTEfq1J4w=;
 b=YpUB7nacinXVKHDbM6P2CSD/G+BHbxG4XGCHVvyiNGkwHuenQHzGB1BZH5qWNsrAy6
 daNBLekKPEm7xpBYeZ5MCYqmdmGcuWXZkD7HUmd2R0vZplSZVQ7FVWx9FQH79vlbSsFH
 nwo3DgiRHimvDU3i1bqA3fIuZyCsZkgaHqhEpcPbkBzFvcvvOByVakgCklcFm7CRAuyq
 2CcFwllCla/uwuDmPoZwAp0Jvk1HIyYMubmwj8aJzl8OOBHZL96UP0ZF0798ez4n+G15
 ifwbiJ6/XQmhD+EdxvZFWh4Cp+dliFI7Wgv4XAI0zp+xgjgKV65+fCyu97JY5o15pj15
 nCJw==
X-Gm-Message-State: AOAM5331JnKYA8R+1VWUXkbb+tnca0vZVZBRjXXe15omav3bRNUUjhk7
 6qU7Y3uCSkJjFi1ufTEc5ec=
X-Google-Smtp-Source: ABdhPJy2wGTTsSBWFh2L/UODY4F+cIhdd/jqxANXR9mTMHpI8OyDraUX2udy2lqxjSCPNYWA92Y4rA==
X-Received: by 2002:aa7:8b18:: with SMTP id f24mr10782555pfd.301.1597661329381; 
 Mon, 17 Aug 2020 03:48:49 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:577:c217:67e6:a40c:a3bf:1945])
 by smtp.gmail.com with ESMTPSA id k12sm16976528pjp.38.2020.08.17.03.48.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Aug 2020 03:48:48 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH v4 3/9] mfd: mt6360: Indicate sub-dev compatible name by using
 "-"
Date: Mon, 17 Aug 2020 18:47:51 +0800
Message-Id: <1597661277-27862-4-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597661277-27862-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1597661277-27862-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_064851_566269_3F2E1A33 
X-CRM114-Status: GOOD (  12.66  )
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
Cc: gene_chen@richtek.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Gene Chen <gene_chen@richtek.com>

Indicate sub-dev compatible name by using "-".

Signed-off-by: Gene Chen <gene_chen@richtek.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/mt6360-core.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index befee70..692e47b 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -292,18 +292,18 @@ static const struct resource mt6360_ldo_resources[] = {
 };
 
 static const struct mfd_cell mt6360_devs[] = {
-	OF_MFD_CELL("mt6360_adc", mt6360_adc_resources,
-		    NULL, 0, 0, "mediatek,mt6360_adc"),
-	OF_MFD_CELL("mt6360_chg", mt6360_chg_resources,
-		    NULL, 0, 0, "mediatek,mt6360_chg"),
-	OF_MFD_CELL("mt6360_led", mt6360_led_resources,
-		    NULL, 0, 0, "mediatek,mt6360_led"),
-	OF_MFD_CELL("mt6360_pmic", mt6360_pmic_resources,
-		    NULL, 0, 0, "mediatek,mt6360_pmic"),
-	OF_MFD_CELL("mt6360_ldo", mt6360_ldo_resources,
-		    NULL, 0, 0, "mediatek,mt6360_ldo"),
-	OF_MFD_CELL("mt6360_tcpc", NULL,
-		    NULL, 0, 0, "mediatek,mt6360_tcpc"),
+	OF_MFD_CELL("mt6360-adc", mt6360_adc_resources,
+		    NULL, 0, 0, "mediatek,mt6360-adc"),
+	OF_MFD_CELL("mt6360-chg", mt6360_chg_resources,
+		    NULL, 0, 0, "mediatek,mt6360-chg"),
+	OF_MFD_CELL("mt6360-led", mt6360_led_resources,
+		    NULL, 0, 0, "mediatek,mt6360-led"),
+	OF_MFD_CELL("mt6360-pmic", mt6360_pmic_resources,
+		    NULL, 0, 0, "mediatek,mt6360-pmic"),
+	OF_MFD_CELL("mt6360-ldo", mt6360_ldo_resources,
+		    NULL, 0, 0, "mediatek,mt6360-ldo"),
+	OF_MFD_CELL("mt6360-tcpc", NULL,
+		    NULL, 0, 0, "mediatek,mt6360-tcpc"),
 };
 
 static const unsigned short mt6360_slave_addr[MT6360_SLAVE_MAX] = {
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
