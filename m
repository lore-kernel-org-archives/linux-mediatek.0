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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 353A7C2D0E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 10:23:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF4C52399A
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 10:23:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OY0yaVFS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQWsrq6u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF4C52399A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wO0BFobni0Qs2kU7zU9mbr1uS4jTakYrIiBJYz9JOAQ=; b=OY0yaVFShbwgj8ZFoBpUeLcibB
	Whq08/M+nRX/ohsYRmmEAaUL8zPMZyBG9pQ+ZEf+sb+TQ7+dTBXaLeGHO5nEJIFKeOLkCJhGwRtlR
	gysRHmwr3N2cUGXY0V+H5dXV839kDR8j+HOgZ4Eyg0cpbmghMXUi9OjyhazVKlJOpCVni65Yc8fC5
	16cjHZ76WOfFAtv8tIp2PIoLzvTreEGZsnt3Yx6sIwoy36OHukVQidpK8MEC7BtBIRT8S2nRIaj/s
	9rgm0SPMCmron2ByuK8mEuZubuGsnEUd8t3XHq0PutncqfBNRTNgZzw5usWxkek60jzUHRO4bafA0
	oR4Htv1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKfS7-0000uC-BD; Tue, 22 Sep 2020 10:23:15 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKfQ9-00009q-4R; Tue, 22 Sep 2020 10:21:27 +0000
Received: by mail-pf1-x442.google.com with SMTP id x22so7192610pfo.12;
 Tue, 22 Sep 2020 03:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=eTozcscQct40BurorhsUtgIPXBxStv+/H/KVS2Q9tCE=;
 b=bQWsrq6u+hyFzIcLsfxU+jUSQq6Bgm7eQGESQazBKVb9Gmdg8YUmxFZ/RD914DIpXl
 9m1hHPDOZxSDcM2znik7ci5uh8wslt5vHtlI8O0OogNSv4Ey5cNbDwVo1ldIjHg4QO8j
 J6+X+UV+YbR9N1FdxLkE7pxIRpGuYXaBazwsvf5VnmRhdw1O48C6WCbzVbHEBUKC0FTH
 dJYzPHtK0n0YT33pBJ8gRjywpwEluoz3XpdoBJirTDTa5uYpOzCdiU4N950KhDo6rBkU
 iZA1JAXnxJKWcjZilwBEVFf6ZyjaCFx+VOqnz7eA3VUrOZaCSBvyGiadUeUxlElIiP9J
 5Dqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=eTozcscQct40BurorhsUtgIPXBxStv+/H/KVS2Q9tCE=;
 b=G9zWxVmfCkGbbcV62uOwORuWER+f2abpk2VjX7Xv8KTjozlCc1y0biZd9KghFn8PZq
 IULb8air6kGPxSNanwZcya/7dX5cQISm+f1zIYe7rDKt6HuL6uwzTzmfhD+vmaxvlQvi
 VNHm/S7jOvrbe+rGfI4GHH1NxM2t9QaQjo2YQOuJIwoz2ZQh/TYveb7iuw5uj7O0IhYp
 dG5iwHYiw0U250yDgFkETCRbP58+zXehGxvfmBAWAP7wFWfMD1z2W9pOvlU0qOOO7Ijj
 2NQlH00L3RpfM8VV8jmjjqBWqLeaDpQNajvGVKYTR2axhRYBnKaKIGVhLOWA9ZPaB7kL
 rzBQ==
X-Gm-Message-State: AOAM533FR6udzJMTxFt5HsINinRIpE0OYXsO7Dajqhr63ea9GlJvbWAP
 g4TbMu9fjBXLAn6o1l3yo1U=
X-Google-Smtp-Source: ABdhPJypDmOWsT5hKM5KgIgufpr2weGbFukeO4YcsU9r9mwe3wUTFuD1QUS+d8xIJVWG/OnYO4xGcw==
X-Received: by 2002:a63:e249:: with SMTP id y9mr2940042pgj.117.1600770071353; 
 Tue, 22 Sep 2020 03:21:11 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:489:56d9:501b:f524:c013:2733])
 by smtp.gmail.com with ESMTPSA id a15sm14859037pfi.119.2020.09.22.03.21.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Sep 2020 03:21:10 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH v5 08/10] mfd: mt6360: Fix flow which is used to check ic exist
Date: Tue, 22 Sep 2020 18:20:16 +0800
Message-Id: <1600770019-11585-9-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600770019-11585-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1600770019-11585-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_062115_086813_B705D649 
X-CRM114-Status: GOOD (  16.03  )
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

Fix flow which is used to check ic exist.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
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
