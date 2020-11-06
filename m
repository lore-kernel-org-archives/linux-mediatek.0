Return-Path: <SRS0=NSCp=EM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7907C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 11:11:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C1FB2063A
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 11:11:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AiI70oQL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9vF4b9d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C1FB2063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hmlnBaFheoHLRHarDsTEJqZxFH566X9iA1OwAG6nGRs=; b=AiI70oQLtd4bO2Ky6IM2csuPUq
	H75K2SQt3FcNvVSWJ3P+4yUF5C7IncqeW/2lGW20Qhu9UHrWIE1SfWWzIyaRNSyfjSU8ka1Mgb2jr
	kND3MRzTZJm2VcTCYlmTBwBvmuVj2DuvPtlc5gBFvHtV1RqY0MvTjzDM4IKVChyjy8/woTwkODMDH
	MzCse7+NLE4X27XFX/c2lIA3HIfo+x18QqyFlwOjp2FBs1dhQhvp+H4ETtcfkAQOMN6r9ZgKc/IOF
	X1ugIxrqK/npxxObh5AUd5b1P3awLtIsdBV8WZbThLRJy5NKNys1ftY5lVQpseT96n1jVA+kLZ0Fi
	hnAtbsYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kayxo-0001El-EZ; Fri, 06 Nov 2020 10:27:24 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaywh-0000Ug-Ur; Fri, 06 Nov 2020 10:26:18 +0000
Received: by mail-pf1-x444.google.com with SMTP id q10so933707pfn.0;
 Fri, 06 Nov 2020 02:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Qvf5AIpXJgqzY8DsXinh6oVuEtLC89N/j7eeRIAQsYI=;
 b=f9vF4b9dp3uQme/w5xY/cT51qwABCSLiZX0aX49VsQm++wIeZYE407fmgwubudfJLk
 QJ8cNtrVP9/wy81aJxslXnfybgOWGAfQ9/sCET4KNNe2Uh85cVsVTs9Vo/HoubhjMjei
 ZfPAOgHbHITJIP9oNZTKf3UDBMYAfgH5pG8d8wsixp7qYnWWdDPk9CABZA2GfhMOKMNl
 CLvjJ/74CClkSSauGI20HLwvHkOwzfnE3ueFWjqysaL6/7jA/ooaXEUmGRMbE9oh/EzO
 1hTnboRRcmDRAA3+JYO3zMvWjcOpp8Cocu4mdv/vpCQ/6mZRt9+zVeg6b/Fu/96xWrmm
 v6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Qvf5AIpXJgqzY8DsXinh6oVuEtLC89N/j7eeRIAQsYI=;
 b=ivTCZyNiklqanBEWQSatJel6mSZN0km5E9fGP2AYTnnNjfxKuFj02waPqHwLhpAzSv
 z6SEG86LA5oCcKfRMe2ZDwxSPZWTY5qcWMTqAiOApdiLz+q0qvB7SOoI4sDAS/uvsEjO
 eoBwBicLtJRde3hkcAlmDFRKTnYlqSoJWX2z3ibmCtknoRX3glfZB2VpRjJcTMP3Vz3K
 CsPnHh/wR70gXV+omavmyaVCFt2oZHyQfhyUpI5fGFOPXOUZcHlFXTv+yP/wsZOKgnsp
 WMu7fAOklcYTo4ohm8nYs7rOlsa7+VPH7cvqkG+iyiRx5VVz3b2YHgu3WAyTh53XjLEw
 3sSw==
X-Gm-Message-State: AOAM533We20GDZmeHWt9Dk4pBiDKzhbUd7ykBnfefOhADNv0lW14J4eS
 Hpr1pgr4q0hPvtR9UQR7i/Y=
X-Google-Smtp-Source: ABdhPJw3RoUtfD0nlIQkGpZcbnul2ZU/MO5sxigtfBfXTBbjasXQsPDV4OuFCere+q5Q5cbZ8qOq2g==
X-Received: by 2002:a17:90a:e2cb:: with SMTP id
 fr11mr1833112pjb.158.1604658373956; 
 Fri, 06 Nov 2020 02:26:13 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:57a:6823:8ab3:4b5d:4c53:f39b])
 by smtp.gmail.com with ESMTPSA id g3sm1260633pgl.55.2020.11.06.02.26.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Nov 2020 02:26:13 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: sre@kernel.org,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org
Subject: [PATCH v6 08/11] mfd: mt6360: Fix flow which is used to check ic exist
Date: Fri,  6 Nov 2020 17:53:49 +0800
Message-Id: <1604656432-10215-9-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604656432-10215-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1604656432-10215-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_052616_186816_57DC90EE 
X-CRM114-Status: GOOD (  16.22  )
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

Fix flow which is used to check ic exist.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/mt6360-core.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index 2356d99..de002fe 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -293,6 +293,25 @@ static const struct mfd_cell mt6360_devs[] = {
 		    NULL, 0, 0, "mediatek,mt6360-tcpc"),
 };
 
+static int mt6360_check_vendor_info(struct mt6360_ddata *ddata)
+{
+	u32 info;
+	int ret;
+
+	ret = regmap_read(ddata->regmap, MT6360_PMU_DEV_INFO, &info);
+	if (ret < 0)
+		return ret;
+
+	if ((info & CHIP_VEN_MASK) != CHIP_VEN_MT6360) {
+		dev_err(ddata->dev, "Device not supported\n");
+		return -ENODEV;
+	}
+
+	ddata->chip_rev = info & CHIP_REV_MASK;
+
+	return 0;
+}
+
 static const unsigned short mt6360_slave_addr[MT6360_SLAVE_MAX] = {
 	MT6360_PMU_SLAVEID,
 	MT6360_PMIC_SLAVEID,
@@ -303,7 +322,6 @@ static const unsigned short mt6360_slave_addr[MT6360_SLAVE_MAX] = {
 static int mt6360_probe(struct i2c_client *client)
 {
 	struct mt6360_ddata *ddata;
-	unsigned int reg_data;
 	int i, ret;
 
 	ddata = devm_kzalloc(&client->dev, sizeof(*ddata), GFP_KERNEL);
@@ -319,17 +337,9 @@ static int mt6360_probe(struct i2c_client *client)
 		return PTR_ERR(ddata->regmap);
 	}
 
-	ret = regmap_read(ddata->regmap, MT6360_PMU_DEV_INFO, &reg_data);
-	if (ret) {
-		dev_err(&client->dev, "Device not found\n");
+	ret = mt6360_check_vendor_info(ddata);
+	if (ret)
 		return ret;
-	}
-
-	ddata->chip_rev = reg_data & CHIP_REV_MASK;
-	if (ddata->chip_rev != CHIP_VEN_MT6360) {
-		dev_err(&client->dev, "Device not supported\n");
-		return -ENODEV;
-	}
 
 	ret = devm_regmap_add_irq_chip(&client->dev, ddata->regmap, client->irq,
 				       0, 0, &mt6360_irq_chip,
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
