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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D9A4C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 10:42:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA9C922210
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 10:42:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qtc3jGDj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WYPx0tv4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA9C922210
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hmlnBaFheoHLRHarDsTEJqZxFH566X9iA1OwAG6nGRs=; b=qtc3jGDjzeMl1TS0Xvwbm8m2bo
	LWBLW/18jZA5tSBrJ2iNI12Fs/Lm9lOAvKVMlQ8O56ZgddiTLkiQtSTAR5I6TlZ2nmdhv/y9cB0LO
	C2TS3fk8d+ZvYYQVvsXb4KpmPAvSmYZyR610cDevJLI1qXUJ1VUId1/+/faz00kd/eDZOppaQjgm+
	PxlmueLiUBqlak4G5fP+mpBXg9snYE013Nhmy+LrnNrQ5HBX2ZJ1edd96+I/hZ68qEcOQr3D9Jnbl
	qNKFu7DWMVxs+IyKTXE9TmdvoiJa/0KYjFRktgQUB/AJkD7dlJ+UgnaFerMd8StdSn+zNTRj0dN8m
	7lcqWZqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdA3S-0005Qk-0b; Thu, 12 Nov 2020 10:42:14 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdA1t-0004YD-34; Thu, 12 Nov 2020 10:40:39 +0000
Received: by mail-pf1-x441.google.com with SMTP id q5so4144641pfk.6;
 Thu, 12 Nov 2020 02:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Qvf5AIpXJgqzY8DsXinh6oVuEtLC89N/j7eeRIAQsYI=;
 b=WYPx0tv4IqBfoB6hq/h2N4Uajcn+oh92wnAaRlZLVyOe4JDjRHNFvAlNEGAH+lUDoT
 Uzk6jEKAkZamgzL5PzhO/u08Xv6PHtEI3w476txDvv4zSLm5VlHoBzEtfDR+xUnJdLPu
 N6s6nSnU/oQupTOsbQ0X8N/FDubL0FzCDdDuhv6IWg/e0c4qNbbnGEAKBkdLuT4fSTty
 eOUj3CaME5l5Cn1cwRwAGknuGIl5ZicjZQfZGqmbUTr79EJDFuCO3zy1GJhyQlr/SUHe
 7L5jRGEK0XU0BzG6YL/KoO7ot6FgXapZa95T+xKOZNc3cSG+JJvH3gJpYnJ4vBS/cr89
 SNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Qvf5AIpXJgqzY8DsXinh6oVuEtLC89N/j7eeRIAQsYI=;
 b=VBv5gQDSbZgAQsRHyoyicLJVoSTDJbvwl50dyA1Ce26FDeWxuDIgt/5QTk6vO+Wo64
 uE5gwceZSLhrvHGycvK7gqORYUxT3fX81mxh8ReV/0VgstZNCjA0g5fReprGrNTq1Uov
 aVNxgQKWC+o3yHxNs0vboQy3Grpy8iCzf1YK1wfAdEcXUwwrP4tXQP8/ROvJXjS9RK0p
 WDkwReZaFFzbltiu53EP251E0XxINQF0DQcUsEhY9t+xDbCnqHzGcR75G8RCduGLqtCi
 nnbbF4CJYfWmRVWxtke0ZYt3J+7hAyDa3M3BNxRE2uAqoYy+HsiwCfRRFSkYiZWrP+Yc
 6qtw==
X-Gm-Message-State: AOAM532F7Tnl+K0gXsWjxwuIt1ksDlcS0TpwUDrAJb2fdkHeUXwisKfZ
 wv72et2Vvs5jQwOwpBxzAuLHuaOWWgw=
X-Google-Smtp-Source: ABdhPJyyWVlHB+a2NshHyH/uS3Y/rLp30ezfS6MrZrvU1ScHUOqwdLKBr24cY5G+pZU+cJpykerNuA==
X-Received: by 2002:a17:90a:178b:: with SMTP id
 q11mr6688456pja.132.1605177634194; 
 Thu, 12 Nov 2020 02:40:34 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:47a:a27:cf8e:7817:51df:a883])
 by smtp.gmail.com with ESMTPSA id
 mp16sm6414094pjb.13.2020.11.12.02.40.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Nov 2020 02:40:33 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: sre@kernel.org,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org
Subject: [PATCH v7 08/11] mfd: mt6360: Fix flow which is used to check ic exist
Date: Thu, 12 Nov 2020 18:39:55 +0800
Message-Id: <1605177598-23501-9-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605177598-23501-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1605177598-23501-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_054038_648596_620E43A9 
X-CRM114-Status: GOOD (  16.05  )
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
