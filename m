Return-Path: <SRS0=Fc+n=ES=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8ABAC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 10:41:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51AF820674
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 10:41:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jmUg+eEV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IcWuSIKC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51AF820674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WUYoV/peKwWq0fSet3M0MnZPmqpuLmPR5WVqTvMwX38=; b=jmUg+eEVaMCvyeWQPpJna37Xxg
	BlKN5m6K13Q+8DZv6Kgp0X/fkVYSRMSdfGUDxHa1XzW77Vc9AYtILzL26dHiePBYoARki4L6HSkiM
	zqkmaitUJk+39onxXcLykV224loQPtvwrQKL3eLdix7LWCQ631Br/qnM5acKGopjjWYU5xREVihtj
	m5aZYEXvUUZ2FBaBiyHoC2VHND2SQgRgvhhVptyS51012dQEa+7Tl8T/UbROpFWHXQLoG6Dhm8oi1
	yRYPDX/8o4RuanYH5UtT+Cg2BX7SjjUIcrZYmdcNN7MsAJtoP+wXKSRdAYsfCkbYCuIKGlA9fDqSB
	at3dIPDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdA2a-0004sd-4H; Thu, 12 Nov 2020 10:41:20 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdA1e-0004TP-2O; Thu, 12 Nov 2020 10:40:23 +0000
Received: by mail-pf1-x443.google.com with SMTP id w14so4142596pfd.7;
 Thu, 12 Nov 2020 02:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fuFh7v4DZWLJYDeYz2BQitAp+sMw0pW2PYhG2t9htnw=;
 b=IcWuSIKCZLcksR9lrAahz2mPNwRkx/fSgQeArXLiTuXXLAl3oHRhYeUpL4nifwyh92
 /XtfUTYAc4OETWVvkn+hPoBFSFDI8kDnMLW0K1AXo62qdowJ+l8SNEV0TRRxbtdSwyvf
 CtNd0l8nuXPnqsmrFpe/d/nT+s3ywg/CyxlWmog0yWc/Q9Hws+tg9vdVg8mhJwRi2sAx
 qvglKCskEiedDOTkdlvMJprn29ohhOeQogZpMqlnxIDvb2pifE59NDpmoIod34DgiKGJ
 NribVN3EpfsfDjFG8/uwDhnWeCp9oV+aKp70wQie6cXcrLeJswKex1Xw5BPWnelV/kL5
 59gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fuFh7v4DZWLJYDeYz2BQitAp+sMw0pW2PYhG2t9htnw=;
 b=JUC2cFQQr/DqJpWG4brjq+y27Y0Fe8Dsr9DrTcw3TDBXgiBysOpHVwBidZLGPOHnaH
 /scrrU2gsa0B5RUeoWA903xAIEhsCbrIh39FPi+2/QEB0Nxu/bGbKh5fqX1axjQC+fZd
 LfGF3aY8Xae8a17ZqNtpyI5WeWh0mbMzwedAJ6e5wFZK5wLXAcS60BXN1HYmGrYTC9kF
 bSYu1yzeQvkdxYfHBk20LYQhUhykSsqwbQSE1/izPHBvPz9dmHJLBruBqooMwwk39hLu
 ssbY2N1bRtnre1OAwwkOpt+EkV57lx4WZGpkxW2BJglB+t8pnveZGJvubISJTi4aQAxr
 FANg==
X-Gm-Message-State: AOAM531zG9/+FhAwVfUwMwZXG154B7WrotJ0jXTZNMGrRPCndwqAtrWN
 4ZTLys5GtmvXkRCbYerjAuS3UwXGe/Q=
X-Google-Smtp-Source: ABdhPJw3cjZGAPK5XbQoBb0M17MOCtgKgaYhpxCg582yemDVGdn/EVDpUPFOUS6KnfxvVbEr1cPsXw==
X-Received: by 2002:a17:90a:ef8f:: with SMTP id
 m15mr8801957pjy.33.1605177619640; 
 Thu, 12 Nov 2020 02:40:19 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:47a:a27:cf8e:7817:51df:a883])
 by smtp.gmail.com with ESMTPSA id
 mp16sm6414094pjb.13.2020.11.12.02.40.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Nov 2020 02:40:19 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: sre@kernel.org,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org
Subject: [PATCH v7 04/11] mfd: mt6360: Combine mt6360 pmic/ldo resources into
 mt6360 regulator resources
Date: Thu, 12 Nov 2020 18:39:51 +0800
Message-Id: <1605177598-23501-5-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605177598-23501-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1605177598-23501-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_054022_308374_EC25A68B 
X-CRM114-Status: GOOD (  13.24  )
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
