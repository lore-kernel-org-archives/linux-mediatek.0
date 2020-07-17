Return-Path: <SRS0=RXgq=A4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE6BC433F8
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2020 11:04:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA6D62076A
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2020 11:04:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n8YkE8/h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CHi5f7k1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA6D62076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pc8jr2rJJnOVY1nYvDVt2ws2TqJORJ584DLxH46I7Z8=; b=n8YkE8/hAExoDL3kVRHp+NsuAR
	7j0UTlQqlJxphw703wf4H3Br0cWr9ec+TpneVa3aLEGAwbeFzU2guuVIEQTP5j2lnIUqEOdjiHRa8
	PJZZ+DhE1GmCGPbttQCGqlaJ5sad0bWzTpQbvHLVwn6i6hedIH6hkqyby4TzYTAUHWiTysGIrSlMF
	Jsi2iTfXsaUtCvoClq0vR4ofmi9t4j1aHt01DhUwJRvc/pdiCZElqnzMwZOXbEE0HLilWPs3q4Kt2
	t7jwQH3O5SnJu5ZdgXtyCsfFEBTGdPQ1H5Qjowv3nZ53fjENP3/fY4CGkmWAPlmPj1wnYD8v77kJo
	btj03Nog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwOAU-0006TN-Js; Fri, 17 Jul 2020 11:04:42 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwO9x-0006Ef-7e; Fri, 17 Jul 2020 11:04:10 +0000
Received: by mail-pf1-x443.google.com with SMTP id 1so5223625pfn.9;
 Fri, 17 Jul 2020 04:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ESlaLWruuMCRnjRqy6Z1yiMvTGKsQq4BBCkehiLzOpM=;
 b=CHi5f7k15qzUSk1+HeUcCRqBuek/IRZcqwhE5ljFzQXUWz45WPSQBr5UA95Bs1G9vO
 F/I7DbNABElTS+HekuqWB7CQUqG1JDXPcBrY2zz5YY/JkgmK3cQJdr0eB/GzFBkvD5cm
 bICHSLgg29qv0Ek5CDQHqf9gXb47DZITHjAjImjTZBgkbLKFyrIEsHn9RrSZo1Y6zEop
 dwSPAzMbgu32k7vRUxQovmLeud7UmPnWPq2z7FtuAdXqwM1+THiw6ip5+WRm2MyDVHhu
 xnzAXM+c5GTu1glP5Be0BiI/oax1rBgMeTiwfq1duy2kzVaqT3JKNUobNI4S1dRyBdr8
 wcFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ESlaLWruuMCRnjRqy6Z1yiMvTGKsQq4BBCkehiLzOpM=;
 b=Nwo2mspoQo3QlU8HxnaY93kAEPoWl3eXhC/vMIGPW+Pzf+IrP3ddYwDqvI6UoJALa0
 FzI57LJ8abjIP6CWYvcNXW1NXnLWagYWd9wdojUyC8zC6n3xPicEd77qEjdVoDYnso+1
 Bg6gyKdjCiV1cWjnNT7ml7SaDVBdkbBxox7F504V8YCdH1LIq9uWHcGxZabQ3Bn5XhmW
 oDh3b8ZWeN3kwrzY13nBF/JzZBhupxiSiPIXtBNP0p08wkhcqyY7vCzgiTyzSifRL5KA
 jji65+V8TIcMo9i745i2nViJLWXqtFG4Yx+MqZ4Hc9aD4FCk7gpglgJ5QsmYaHkliY9V
 YHHw==
X-Gm-Message-State: AOAM5308CXjAb7K1sSXsQi6NNURHyv/f7zTCtBIho4JJbBT9GWZ6H3En
 f2wYuDqrEfmQ6O4Kn+f20fk=
X-Google-Smtp-Source: ABdhPJxTrfHAwYAFyXBWhVGeXCB7UYp6gONrLWt3az7DBZoTpXgA5ZJiF+/xj6kSkft5vvUbdpgilQ==
X-Received: by 2002:a62:8c83:: with SMTP id m125mr7749098pfd.14.1594983847241; 
 Fri, 17 Jul 2020 04:04:07 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:469:ae36:984e:c073:9d0b:7c09])
 by smtp.gmail.com with ESMTPSA id o26sm7619183pfp.219.2020.07.17.04.04.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 Jul 2020 04:04:06 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH v2 4/9] mfd: mt6360: Combine mt6360 pmic/ldo resouces into
 mt6360 regulator resources
Date: Fri, 17 Jul 2020 19:03:26 +0800
Message-Id: <1594983811-25908-5-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594983811-25908-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1594983811-25908-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_070409_354680_6F8BC276 
X-CRM114-Status: GOOD (  10.78  )
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

Combine mt6360 pmic/ldo resouces into mt6360 regulator resources
to simplify the similar resources object.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 drivers/mfd/mt6360-core.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index 7cc1b59..665e26f 100644
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
