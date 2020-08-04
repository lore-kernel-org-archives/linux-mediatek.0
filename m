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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 471F5C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 16:34:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1497C22C9F
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 16:34:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="inydrDBK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dofzX/8j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1497C22C9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mdYD7c75ANpvM8Z56J9O8PdRWktBl7Va2gAB1gdADDQ=; b=inydrDBKoONBtlA4dUJuCthtLP
	lz6bcCiAqhHgSdtYy/FkcZqxom8C0w5paYhK08K8Ah6dlai4BjhfdI/5VZ+UeTcCXSpeEfez+yqUc
	SbIlr9KGPsUWE5RGkD9pQxSFQwF67Ovayfy1mTGBzrzowX3qjMgq5kCjgJ6804F3qIZfHhNDYbZGd
	GVEUugtwqg3PJl7uqJ9Xz1Ew21JC1NNyaSSRe8Orp/4L/29e41hS5fHhK5QmfR/kUqUrhz04nfLwz
	b27sFBi3wOm9hI9uEMvrsA1oA3MvsH+GWStJO7EOkXud+2IBVAXR5wCNbxyl1jkbGq1m3KTfpH2bZ
	mzUiLWfQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2ztT-0000Zr-6O; Tue, 04 Aug 2020 16:34:27 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2zse-0008OK-Qu; Tue, 04 Aug 2020 16:33:39 +0000
Received: by mail-pl1-x641.google.com with SMTP id g19so10749270plq.0;
 Tue, 04 Aug 2020 09:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=sPIOzSYU2pA/shBWLkg3uMxU0iGcVrzwOJmIFEIBLoQ=;
 b=dofzX/8j/y3zd4rnbPgoEyOo3X9xNcwVZZOSj+XtCWmEnMDc7DnG5c62WqfRz08+8M
 ZwrABnFgyTjIp9Fn7Fi0LdCW5ECjAbimZzTF6qvTScJRyicb/QbwyCPvBoGlbd3VZHCE
 KAsN0OuG+a4DA5yiPiegy6IS+oVaBvkOS0x/bPcCoUx56OyXz81hZiCvt3Tm9HxWViCB
 IsBriMgCt0CbCp4F4ugZknYc0mwrb0EqMLKnb2mwR45KsKDzl/5ZHpIQHFc/378MglJu
 xc1VbACdkmqqtk8BKMaHZNdap4K1k6QKGgGIhhIDjdGcydcufAXupIEFV4fcgMk+E9BS
 6XAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=sPIOzSYU2pA/shBWLkg3uMxU0iGcVrzwOJmIFEIBLoQ=;
 b=oue4r8diriRjPi7r6nYh/o3gInYCXC/bNa4BMObG9AAmn+Q0TUXt8RRHRH0OkJKdGO
 nCvGEC9tT7TYbAJIZ04m1avRDbRRev7L4BkzntM7hnz6CsJqgmlBMz7Ny3L0+O1lc9BU
 CHTU+J1LtfTWCyuFucBfqE351bpqKMGrjSBn+0bin5WLMo5zsyNXxnUk+YLubKULTEQS
 qN4nJrnlY39XLUQUCv3aTQ8ZE5tQt7CdegqCPVZGNCxmyhvChyCRZol/oeuapPoj5U8W
 W6B8EN4bATam2pbFSGsw//5VLS3EGbeoopHGY2LLCCBCO13g0s2bHGAL5nMETmvYGRh+
 hMxg==
X-Gm-Message-State: AOAM531MijI9eEfV01Qs5/FoBUnj52cdVrPLvHIUlasZhqsByEnp4GGF
 iHWZviAEzkuh+XrrRw6yTC4=
X-Google-Smtp-Source: ABdhPJxVpyamQPe8QZBWDZVCZhK6mVUocCsi7M32bZX/yUj88jF+LNTLuEoEcElYX0puGn6zuzf70Q==
X-Received: by 2002:a17:902:9a94:: with SMTP id
 w20mr21094155plp.59.1596558814544; 
 Tue, 04 Aug 2020 09:33:34 -0700 (PDT)
Received: from localhost.localdomain ([123.110.251.138])
 by smtp.gmail.com with ESMTPSA id m16sm657253pjz.47.2020.08.04.09.33.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Aug 2020 09:33:34 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com,
	rafael@kernel.org
Subject: [PATCH 8/9] mfd: mt6360: Fix flow which is used to check ic exist
Date: Wed,  5 Aug 2020 00:33:01 +0800
Message-Id: <1596558782-3415-10-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596558782-3415-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1596558782-3415-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_123338_029992_58368F21 
X-CRM114-Status: GOOD (  15.65  )
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

Fix flow which is used to check ic exist.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 drivers/mfd/mt6360-core.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index 2356d99..677c974 100644
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
+		dev_err(&client->dev, "Device not supported\n");
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
