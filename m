Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F88C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 16:34:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBB252177B
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 16:34:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dTs1ZZbh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HE8MaqVH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBB252177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5VMse8tCiGPFBsoXhy95/VAdu2/VPcFqpldHQw1vW0=; b=dTs1ZZbh6kjtZleI8oGeOU7omj
	DPGS3/BBi2yCVN8yQRCO87AqRzrRdgi4ANlziynzX3Dwo3q9wDQsrYXoKwJcQpXvKviKhJn1q1ivd
	vpWwIHWzogIkXDPRdoF+HY7SElVAfbm3g2Tu6bXCHuNLASe3M+qbuP7Uxibp504YOuxmqJdYpKTi3
	fNCCHkt95Nuw5t6D3JaYR58iT7epW/RCFuuQhltiS0dERgaV03Ia0sGM5svnkhUy3siucCR4e1Saf
	ANP5OBVliUd+OpE8vCLGvWB3wPFpcmZx46qQmgrg3EpzoC1b0ND4OEqMpB9eY+lZh2T0kA6+pxcQ9
	B54CahQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2zsr-000083-OT; Tue, 04 Aug 2020 16:33:49 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2zsQ-0008GT-RT; Tue, 04 Aug 2020 16:33:23 +0000
Received: by mail-pg1-x541.google.com with SMTP id x6so7363786pgx.12;
 Tue, 04 Aug 2020 09:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=t5bxP7SBsyG/FaxnJHfQjTjpWsNLjhkZMYmiwNpRv5E=;
 b=HE8MaqVHt2WlTRoli0MbJ8ttSjwj6044ipm+DEd7YcNYTWOpsah5zMJfZQCPlQn3wq
 XxhahHcyq3p5FLARelylRaYJXxBCWlciVrqzyW0U56jhBb39035x84hglhGZbTN+Yrly
 7/zSio7SCngnV0d+TW7+pFQO7YMKPGlxS6v97LRnBuOZcybPsiDDyiF0cHDhWtQlhWSf
 FC3KP4zqbH0HtBynUlhYlC5FzXpxA98yZF350KPtcqu7T3mJFAmd7tSGA+GpffSlbJo/
 xUVkKriYlFWMIFqqjTiFw8rSZ8a9o5mHX+7ABKoN0jL01ETGWOZfwxsi+D0g60CjkoWT
 dsrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=t5bxP7SBsyG/FaxnJHfQjTjpWsNLjhkZMYmiwNpRv5E=;
 b=AcdT6XO5gEwmxkh1Y2NDZvDjv4hxQN6O1L8CEUcRdNxPl8gZCz/EAx/9U2TyjJ7MYt
 bzFCuVknLIhc3S7FWgC2jUpJhB5ZaVqKHLbFWzpP7V1cpPS6p/qlnCRblpv7ULTkESGo
 /rmxlN3ERqpEjPvJZgDKqUHR+uLQ/WP8bk/nEfiigG5E2Fkdh+iGd9VWYyfcKAeOIphR
 kdWEfInk8BfEe2NqKojK7BdkIOFjhkWRkREq9mh8GyxQdguFXFFnLGcgVrPmGfSZEcDx
 XdEzEiIAJ+5Q9L8B+WuCY3dCWINlnPXEzznCcW3i9KqPoS5mds+YCnUJGz4T0yNDN5aj
 xvsA==
X-Gm-Message-State: AOAM531GMv0WB73Pm1QqHmeM6+LBqNEP15onbm9Lh1HpuBl1eNxb6vSB
 p6ubi6ZXxebd0nozD1q46Sp2wyiw
X-Google-Smtp-Source: ABdhPJx7CIFp8JKIMAjtmU/77M+OIIHdfSIG/OH/cemvUAaQELVQzbig6KKsiD6NYzB8PGWrhFK46g==
X-Received: by 2002:a62:1ad0:: with SMTP id a199mr16504535pfa.56.1596558801103; 
 Tue, 04 Aug 2020 09:33:21 -0700 (PDT)
Received: from localhost.localdomain ([123.110.251.138])
 by smtp.gmail.com with ESMTPSA id m16sm657253pjz.47.2020.08.04.09.33.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Aug 2020 09:33:20 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com,
	rafael@kernel.org
Subject: [PATCH 4/9] mfd: mt6360: Combine mt6360 pmic/ldo resources into
 mt6360 regulator resources
Date: Wed,  5 Aug 2020 00:32:56 +0800
Message-Id: <1596558782-3415-5-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596558782-3415-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1596558782-3415-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_123323_026564_1E491269 
X-CRM114-Status: GOOD (  12.91  )
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
Cc: gene_chen@richtek.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Gene Chen <gene_chen@richtek.com>

Combine mt6360 pmic/ldo resources into mt6360 regulator resources
to simplify the similar resources object.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 drivers/mfd/mt6360-core.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index 692e47b..5119e51 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -265,7 +265,7 @@ static const struct resource mt6360_led_resources[] = {
 	DEFINE_RES_IRQ_NAMED(MT6360_FLED1_STRB_TO_EVT, "fled1_strb_to_evt"),
 };
 
-static const struct resource mt6360_pmic_resources[] = {
+static const struct resource mt6360_regulator_resources[] = {
 	DEFINE_RES_IRQ_NAMED(MT6360_BUCK1_PGB_EVT, "buck1_pgb_evt"),
 	DEFINE_RES_IRQ_NAMED(MT6360_BUCK1_OC_EVT, "buck1_oc_evt"),
 	DEFINE_RES_IRQ_NAMED(MT6360_BUCK1_OV_EVT, "buck1_ov_evt"),
@@ -278,9 +278,6 @@ static const struct resource mt6360_pmic_resources[] = {
 	DEFINE_RES_IRQ_NAMED(MT6360_LDO7_OC_EVT, "ldo7_oc_evt"),
 	DEFINE_RES_IRQ_NAMED(MT6360_LDO6_PGB_EVT, "ldo6_pgb_evt"),
 	DEFINE_RES_IRQ_NAMED(MT6360_LDO7_PGB_EVT, "ldo7_pgb_evt"),
-};
-
-static const struct resource mt6360_ldo_resources[] = {
 	DEFINE_RES_IRQ_NAMED(MT6360_LDO1_OC_EVT, "ldo1_oc_evt"),
 	DEFINE_RES_IRQ_NAMED(MT6360_LDO2_OC_EVT, "ldo2_oc_evt"),
 	DEFINE_RES_IRQ_NAMED(MT6360_LDO3_OC_EVT, "ldo3_oc_evt"),
@@ -298,10 +295,8 @@ static const struct mfd_cell mt6360_devs[] = {
 		    NULL, 0, 0, "mediatek,mt6360-chg"),
 	OF_MFD_CELL("mt6360-led", mt6360_led_resources,
 		    NULL, 0, 0, "mediatek,mt6360-led"),
-	OF_MFD_CELL("mt6360-pmic", mt6360_pmic_resources,
-		    NULL, 0, 0, "mediatek,mt6360-pmic"),
-	OF_MFD_CELL("mt6360-ldo", mt6360_ldo_resources,
-		    NULL, 0, 0, "mediatek,mt6360-ldo"),
+	OF_MFD_CELL("mt6360-regulator", mt6360_regulator_resources,
+		    NULL, 0, 0, "mediatek,mt6360-regulator"),
 	OF_MFD_CELL("mt6360-tcpc", NULL,
 		    NULL, 0, 0, "mediatek,mt6360-tcpc"),
 };
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
