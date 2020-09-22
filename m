Return-Path: <SRS0=fRkw=C7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E18C3C2D0E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 10:22:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BE612395C
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 10:22:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vtwbcw2H";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hjzB0Tn+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BE612395C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5VMse8tCiGPFBsoXhy95/VAdu2/VPcFqpldHQw1vW0=; b=vtwbcw2H2naZ1Q70zmvxIQHYHC
	CsX3hOc2H+yFOA+jPAROaOCWoRE+dfxZAlmAUqWv0uAo0nRLPzOGC11E3X6e0SW690h3PIfs7jlnn
	+EJ9DBPJZiKZ5Ay0scI/rIGInVN9tBED35k42phT/up0ik8V/mYrEkEi04jmHJj5QxuOsFv+jxRRU
	jd0FvtMFXQZ4hBjf/CUqmzGP8r/YrmByD7hSHGwXpWKdvQ33exX9Z46lk4d+Tgnr70oZOVn81Jf0U
	qi1FbvDeEhWckh+rWqnozJpGFyJ4CXrwcqiiN/+TpcSOzM6YbmXWzxI44+aRzC0rSxNSqv6K3OeQ/
	A4ZutOEg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKfQx-0000P7-Cz; Tue, 22 Sep 2020 10:22:03 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKfPs-00004t-Sz; Tue, 22 Sep 2020 10:20:58 +0000
Received: by mail-pf1-x441.google.com with SMTP id f18so12003192pfa.10;
 Tue, 22 Sep 2020 03:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=t5bxP7SBsyG/FaxnJHfQjTjpWsNLjhkZMYmiwNpRv5E=;
 b=hjzB0Tn+e1tqlMWN/8vAurHTJovCYlNFo33wzfKzxK/BSxjT+a6gJwTPsGAWYHvvKP
 CB2S3Yl2oe410H+Hw3kE2nXCgSX6aG+jJYSGohvOw2GJHHl1B7zp7OpWZGvCeqbqcpMm
 5uqt259jXkIexa0/jIwZe7+2VbfFZ1SbvoKLQJdafVOHuYhmNNPaOfluHhPC2WekjwUC
 Q2Fs1o52Og0j0m67TdEoYON34u6yya46oSjJ2dr37J3ATIhymi3Mv841xcRJbEsH9lDF
 crXaXYA1HRjd6vXEH0WbnrJc06r9bpDNIDWIiI0ZyJ3too8d0TIWR8o+ssEbFgWMu/RD
 IBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=t5bxP7SBsyG/FaxnJHfQjTjpWsNLjhkZMYmiwNpRv5E=;
 b=tguH7FXjMkLHQ46TV+iLxLxZnNxYYa8aUSuZ66UL+9aI5UI0RJN+TCGdsKSOBV503p
 1mNv8Jg9AmiZojp/Sfxx6fC/T0gVmAd5qzaEQMeGThOLmUtRMCxxbUly3lHmoIRLMWCW
 i1xXk/QnUKOLfM0JhMqe7CpI5PbMqPR/uL/P2rNTXD3TXCIMHnXRerFqPzH95Jza/jcr
 LuWVYpk3pipaH3HMTgkKEEdR1MZNKs2g+cwXfhz5uLW31Pmmwe5hXWvglnmRNGzuK0Ca
 ZwRujW+tY4cf6nqIpyNhIwIVQnhZWnehP8W6e6j9TNtO+pI0IGD3blTbkzd9CxD9F9Tw
 AevA==
X-Gm-Message-State: AOAM531pZXqCmYJTaI4YbgbeABrmXLJ8F9tuze4mySJaWSFzSqXHoy/D
 yMKbtEA0lst/XKvRm3Lf2bVOi22gAzM=
X-Google-Smtp-Source: ABdhPJyiL8lEbxFoQpmM4mEVqPw7egesz4ShUvdfOUira1TDWuI3zZOafQmiB9Ei2Nr05DRJr1wu4g==
X-Received: by 2002:a17:902:d913:b029:d1:f388:9fa6 with SMTP id
 c19-20020a170902d913b02900d1f3889fa6mr3938165plz.67.1600770054996; 
 Tue, 22 Sep 2020 03:20:54 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:489:56d9:501b:f524:c013:2733])
 by smtp.gmail.com with ESMTPSA id a15sm14859037pfi.119.2020.09.22.03.20.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Sep 2020 03:20:54 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH v5 04/10] mfd: mt6360: Combine mt6360 pmic/ldo resources into
 mt6360 regulator resources
Date: Tue, 22 Sep 2020 18:20:12 +0800
Message-Id: <1600770019-11585-5-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600770019-11585-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1600770019-11585-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_062057_330323_0A0D7A4E 
X-CRM114-Status: GOOD (  13.40  )
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
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
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
