Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5706AC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 10:49:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 242682078D
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 10:49:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vvdJSTYK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="skok8w30"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 242682078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eArwXQg9cvJeVG7HFEizHcUvmFoHNOMvkfyA18n3XFM=; b=vvdJSTYK1utBrNA/Wpup2wKZ8r
	RSehPlPekSH9FLbu01OWI1A3CJZtgVnUOjl08POLmHnNHQQ9Iy49A8z2mCZBxMfbQ93m1XI/kV+VY
	5JMC65IoFubGbZCUYzM7sbPR80gOdrZMRxaCnJzGeMsszAO+bLm/YWuv9m0HlwAwzMKUSCKwI2AnF
	0PtR/wKQBRCXnilAq/N2L+vnngjJQgLRobHZBQfD07Y5Wb4XovgASWXDp1mJSDQ2Q3VbQsUw6ZXzv
	VpMZqKKO5AhQUp23fiouaCxAFZoFfS5Bc5KHT2deIq7ld3sNkqj0eP5EUUEuKbmE8K3MUwq1ZAEUX
	4kdc0MRg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7ch8-0001aV-7F; Mon, 17 Aug 2020 10:48:50 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7ch2-0001YX-Lk; Mon, 17 Aug 2020 10:48:45 +0000
Received: by mail-pf1-x444.google.com with SMTP id d22so8038189pfn.5;
 Mon, 17 Aug 2020 03:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=6l78lXwR/yjlw8bo2gFOnw4SGZQb3C/vx4zGLauS1as=;
 b=skok8w30JX83F/n0CTjywpZkjOauFx8e98U3T7xkSpAcx2wxT90ofOzO80ro0566IG
 BKWfbDesOgk8d3hUECshOfwo4bG0AsItZi7foV3vbE8wc8MbGopUvz0gTi2UVG90o7f2
 S0fnXrUgHt/LBmvl33phs5qfPVkaUViRiMo1L3NGyalsmL2POsEvDFjuwJRVBR/3z8hm
 1/wLPnHVnbMQ8Yn/4/7WsKdsEjR9o7vhFA2S72++Ff+4IQ3+vgw/vOw+jdWEGiAGm49W
 aJK/xR3ReEVeUET3G8W8Uj8E7L4Kjt7u5ehTWzZXgyRTlBHgl8MBLibjN1ZdXq07TItn
 tPqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=6l78lXwR/yjlw8bo2gFOnw4SGZQb3C/vx4zGLauS1as=;
 b=DHT7PFyKgUWmguH0AT4axIvYOIdJjpb/qwziufFuCVqEVXxcqGESQQDEVKs5s1pFP6
 SJMRCdFgrzty4jv/BXGDUcFSC9DYj3G2b/hCwfRH04SsMsLtYjhO2jzhsdlQV5sfSI9j
 Dp3K+fLIbIxIFM/pAQyqzf86uB/FCumc+ur9oywCOX74tMrq8/es5AYblMGi+y2WR440
 i8h9WWpvYN3lv3UNg3j7byAYaRgWKxzzYBfEn1WjqeL4r7g6xF97hiTUQrhG8WqeXl0+
 XM2csSZY0n5eHmihYALgGH5gP57hOnRh0eI2T9p3DdKlDU3ARnlS/2RLL6eTHE1X2jT0
 HCSA==
X-Gm-Message-State: AOAM533+Vmnc6qi6tvl+gFF9wzWsOBMES1uua8ymuBKXCPemvqU8LcnH
 +xJ8TsIMJpMK71ygDEnb57DDj67Dga0=
X-Google-Smtp-Source: ABdhPJxEwBbdlU1Kyyt1rmPfqNt8TJgGT5wdmGswAeFJAmpELOGqZ+rxlTl/nd+KcDgI4ZEdf6t1/A==
X-Received: by 2002:a62:7853:: with SMTP id t80mr10868286pfc.47.1597661319769; 
 Mon, 17 Aug 2020 03:48:39 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:577:c217:67e6:a40c:a3bf:1945])
 by smtp.gmail.com with ESMTPSA id k12sm16976528pjp.38.2020.08.17.03.48.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Aug 2020 03:48:39 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH v4 0/9] mfd: mt6360: Merge different sub-devices I2C read/write
Date: Mon, 17 Aug 2020 18:47:48 +0800
Message-Id: <1597661277-27862-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_064844_816771_58726CF0 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
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

This patch series merge different sub-device I2C read/write into one Regmap and
fix coding style for well-organized.

Gene Chen (9)
  mfd: mt6360: Rearrange include file
  mfd: mt6360: Remove redundant brackets around raw numbers
  mfd: mt6360: Indicate sub-dev compatible name by using
  mfd: mt6360: Combine mt6360 pmic/ldo resources into mt6360
  mfd: mt6360: Rename mt6360_pmu_data by mt6360_ddata
  mfd: mt6360: Rename mt6360_pmu by mt6360
  mfd: mt6360: Remove handle_post_irq callback function
  mfd: mt6360: Fix flow which is used to check ic exist
  mfd: mt6360: Merge different sub-devices I2C read/write

 b/drivers/mfd/Kconfig       |    1 
 b/drivers/mfd/mt6360-core.c |  550 +++++++++++++++++++++++++++++---------------
 include/linux/mfd/mt6360.h  |  240 -------------------
 3 files changed, 368 insertions(+), 423 deletions(-)

changelogs between v2 & v3
- Replace mt6360_data to mt6360_ddata
- Split I2C read/write to regmap driver

changelogs between v3 & v4
- Merge back mt6360 regmap driver to MFD driver


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
