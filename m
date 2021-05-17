Return-Path: <SRS0=4pGO=KM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A202C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 17:36:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98F8C6024A
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 17:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98F8C6024A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MWOhzkv6cjSR4F1fF07Oh7BWOHkuxP/+Cnh7Pv7s9Y4=; b=rDOsBqwhw3TlR3W/RPAz1M39h
	T6sdLwujdQzMAB2I2YSNWjdxOEc1yxtaVUHmjEl8uyFeI4bXTisdi4X8ADBtJCFcmLQRSrb2LeVRj
	PQdti9QjPTjEUnQNx8RM7XoHLKOfd7xS8F9FSMP1+U0IU3Z6fgxRHa2ENqfl1F9kAUFXiWoTGndi9
	e9Nq4N/AQejl/eR0pwuTOrK1qtwsew0YDI5AmcYcJEqXuY7p/4dO8rNL1zLWdNfVfW/DdPkwG8n0D
	q2TMuRRftC475bOFdKch6ysLvi8Jngiq1iQHK9XV//79PxR/3gFs2x0nyyiwOZOmpcvlh1JMqymVN
	gO9iQRkHg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lihAW-00FgFE-14; Mon, 17 May 2021 17:36:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lih7l-00FfD6-3w; Mon, 17 May 2021 17:33:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=+SGZLC9XHUt+lZzTU9RZd8JyaaWpbIPUIXZL+8shzcs=; b=BuBdB/Xk9g9TvLOGAb1gWcdnCn
 FemfUu7Uvjz6E09P2rCllnENSorPrKQpTb7uI36uqw8oVkWg7JVbetsGcKs8AGPkMEAhlsh/ofvXE
 md91XI8PswVdcrv6cPmHtFJ9sc9wOA6AwbJBOqaoWvp0mpvv+YRWtPWuwz0nCl7vKGf/EffSvjix3
 xQAwy/AnYWJ5fL7U3uGWtBdhnzN7kHJJpJ74kVYOT1HcoP6xy9DtJRJyD9DstgxwykNwYoMwiFwrV
 NaYogxU7G3yIzZT0BIVeXcH1375v0RxILqKCHPTtPjw3OW4BY9113v2m235lk33jznZxUgiPUE1O+
 k768YcoA==;
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lih7i-00E1MM-KP; Mon, 17 May 2021 17:33:47 +0000
Received: by mail-pg1-x52d.google.com with SMTP id i5so5171678pgm.0;
 Mon, 17 May 2021 10:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+SGZLC9XHUt+lZzTU9RZd8JyaaWpbIPUIXZL+8shzcs=;
 b=kAa3R3VMavzYayCAWbgzmaYp4JMxpY+hSNqopUhEBzFXEHoaFAkofW0qq+74+L+Fn+
 0SCsuMU5FF+ao9/cA9QlnaIMXX+l1lvOEeLQR2RegcYvdaxuaZhVwZy5ka27cfU8MRrw
 MlivrWclkjQmDQcr0GStDYySsJPyIbIVRe1Xb9tEq/gUln9aSYEf1TgOFlSrRKXzl2D4
 +nRmhqzLIymGpxCCpdc4Hr80XCgcuOFjWz96crFnecuDcd04NZExEjig/7rHqTgznSZz
 dLSObErCpCrZ4OCI8/L29mOBnmzVPa9Ko8EnTSQaMW4OPTtVctuB89hb0row/NwoNmqe
 5K7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+SGZLC9XHUt+lZzTU9RZd8JyaaWpbIPUIXZL+8shzcs=;
 b=FsWzINTK9CyFpgurzlPb5DviJN1ot9d5Sre07O5XSnM69LI8VtC5igAPZPbnPXtD6V
 nY+cIbMrgKRKeL6TCht6lWpWCOQF4/pDx3W9OocTjoL4XyO2Iw73jvCJbJlo0NhCO0ym
 MacOx6Y5nBLGwEb5MB3cfEXQIe9LZiRTeIoLZ44PJ2I1BH7R8eDAnXp3SmLg4o7/3hoC
 h28uE5/rj45todbQvOo4q2ixAbuI79b8gpFtFVZ3Ya9lzG5CCBZdV3CRwT2FqDxS8OkH
 3s6Q2JdzL73b40ntkEr1oPEpk7AzDlw4xpITFaxPXnB1paPeugKmNOB0+++TU3vtAuTG
 bRGA==
X-Gm-Message-State: AOAM533cXKvLu+/9FfSJwvJ/gHVL4Rn5GHz3u35o13CoGYh93172vb5a
 mAhIbP8dTsou2nQnBPk6ONk=
X-Google-Smtp-Source: ABdhPJxtusr0DXLHM6IuD2qWOgDDxxA8Yvo6b0rH9EpdnC7wmWAhSu5aLnE6r6Wv0Ktn+alzLJJaWw==
X-Received: by 2002:a65:5248:: with SMTP id q8mr651292pgp.176.1621272826253;
 Mon, 17 May 2021 10:33:46 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:47e:c24d:6c72:a52:2c8:7df1])
 by smtp.gmail.com with ESMTPSA id
 c12sm10358296pfr.154.2021.05.17.10.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 10:33:46 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, gene_chen@richtek.com, Wilma.Wu@mediatek.com,
 shufan_lee@richtek.com, cy_huang@richtek.com
Subject: [PATCH v8 08/10] mfd: mt6360: Fix flow which is used to check ic exist
Date: Tue, 18 May 2021 01:33:12 +0800
Message-Id: <20210517173314.140912-9-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517173314.140912-1-gene.chen.richtek@gmail.com>
References: <20210517173314.140912-1-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_103346_692886_D835AAE9 
X-CRM114-Status: GOOD (  14.32  )
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
index 50a170065a98..cdd99770f94a 100644
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
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
