Return-Path: <SRS0=NSCp=EM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0464DC55178
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 11:11:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 710CE2063A
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 11:11:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lnkVEfYN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XWZnoAnw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 710CE2063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WUYoV/peKwWq0fSet3M0MnZPmqpuLmPR5WVqTvMwX38=; b=lnkVEfYNb7t88HJ4mS7PMuAY/l
	E5rSXNclPaxa3Txb5O+7IEiAVIrYDS41hO5V2cfZOXwqWKxOJnHL/QA6F3AuTg9tG6z4DSKAqbeM/
	G9M946Rw9rv1EQBFVfR4nhNYCh5/XYyGlC2RsE6p/nkAsG8kOU3scPeVd5BOe1GxxUhn9zhanxoLq
	cx3nJfHm8srJkjHwlyCndFRHPdoHtQw6/+1kxVZ7mCULJxLKQNM3Xd+10HJ6DAEZR6RQ0aawwC1DC
	22hYfiaSwbgNVvWL2b9RWRTC+hE2jngN9RIujRUHZgsVz26U71TK+w9KutnfSWhP1WMyd6lCjFkRA
	rmU2hMKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kayx5-0000k4-DL; Fri, 06 Nov 2020 10:26:39 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaywU-0000O7-6s; Fri, 06 Nov 2020 10:26:03 +0000
Received: by mail-pf1-x442.google.com with SMTP id z3so894892pfb.10;
 Fri, 06 Nov 2020 02:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fuFh7v4DZWLJYDeYz2BQitAp+sMw0pW2PYhG2t9htnw=;
 b=XWZnoAnwIDjQYp2IpX38lwNk1lT8pCUa7EHvuc6n5L4gTVgt5Lub40ihU/sA9Ko4ls
 DQpn4gTLkh4AwnVPuQZ8yfEXBR0VowaGhzTCKaiF1jM0w7ylT62YfnZcPD33KCqUcstm
 7nZShXc8vOG0fs3a9ytA1U1yhBYCKEZi5eLk8GbGYmT9wZxFGIfSKUEB3eApr0CpXPIc
 0O/Ez6mapBaHXgOC6aqOou9+cHL2XEIy8zJgTLrjSvnhYgWLQJT8QHNaWqYURR5n1uHR
 uyAdGeV7dYouozaUrBc8S9zRu8+JQxn2QZsKH0wllhhXVxmxo9A814/Krc04IgEJKbLU
 jmbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fuFh7v4DZWLJYDeYz2BQitAp+sMw0pW2PYhG2t9htnw=;
 b=tHPdBIRRxcJOTG2R29Tts0IWrY98whD7hEZ0MilFLgsGjEXvNIP1IlIv0Yed1O8+EA
 GAdXnffQC5FZKKTniqasB5nq5xHSvhQNyAD6Jt6jP+IEUChthNQeePBdUw6piagxwzW/
 nOPpb4ECXzMS3IXI4pHQ0FcYJsjqgr6ZMlouEUmsqFnIrMnn6Kz2z6J4lYZfM1UU7m5n
 W882/PbK8+4hMqu+qt6PINZwcPAh9eREZG+ovIt64QJ5mIaEZwzpUZ7PX+CJDkqNmhOU
 oNLoL3FDObsg8b23gZKfP56cPiAmH89eRbsOhE/5V8EtT3+55YTHwzVCYcxtrjzrkeR3
 YSoQ==
X-Gm-Message-State: AOAM532kK2O1KaUrl6sNO3M7CH7MXrSRZcbH1nNhCDWhFdOs7mTSqWIx
 Ijni7OsGNAQWsoUq9No36hw=
X-Google-Smtp-Source: ABdhPJyhCMDQFDtdya5cGi/9aSMCufl+wRVtBNsdnZ38043nELmi95m21T/BFPpJWSserEN4c04vGA==
X-Received: by 2002:aa7:8d05:0:b029:18b:6f5f:1ea with SMTP id
 j5-20020aa78d050000b029018b6f5f01eamr1326589pfe.38.1604658360209; 
 Fri, 06 Nov 2020 02:26:00 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:57a:6823:8ab3:4b5d:4c53:f39b])
 by smtp.gmail.com with ESMTPSA id g3sm1260633pgl.55.2020.11.06.02.25.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Nov 2020 02:25:59 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: sre@kernel.org,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org
Subject: [PATCH v6 04/11] mfd: mt6360: Combine mt6360 pmic/ldo resources into
 mt6360 regulator resources
Date: Fri,  6 Nov 2020 17:53:45 +0800
Message-Id: <1604656432-10215-5-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604656432-10215-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1604656432-10215-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_052602_324577_BF058B85 
X-CRM114-Status: GOOD (  13.48  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, Wilma.Wu@mediatek.com,
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
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
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
