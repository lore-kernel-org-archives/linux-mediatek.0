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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF18C433E8
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2020 11:04:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDCC320717
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2020 11:04:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EF/8ErPR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+pYvH00"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDCC320717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nKVB9Gkofin6Gn40sdzq131MinnyJlJpVKCXsi3f9qo=; b=EF/8ErPRhl3J2AIms77a4ibcew
	bP+Ws6/6qYZikhcRLBgQn69xkAo+CMXwUUnfLtiQhZkchlBi6Hjy6TL01VK8/bSG5kQdVUI6tnNLt
	ryVLpFMS3MGO9Ro6/32laW7HSKGUwKa4eSXGuiK9Ju0jeriQvOoIeE8MeANCenizvpJXZ9JYl5G3e
	Zk/9h9n0Rtdq8m8YJ/qYfSPR2z9Yo5i6d/G/SdfY37CdrZGcuBDXSapFqj0zfjyf7r4BghYUjfHMO
	zOLCocR5fpexjsMwGDYxrJn0XX/70HZKH62djLGTjB4HX9PouMmYiJ722eev5fLKU74PpeZ3JYxYs
	Hkrp0D0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwOA0-0006GT-QU; Fri, 17 Jul 2020 11:04:12 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwO9q-0006C9-7I; Fri, 17 Jul 2020 11:04:03 +0000
Received: by mail-pf1-x442.google.com with SMTP id q17so5223035pfu.8;
 Fri, 17 Jul 2020 04:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uLnTrj9P8ZHZAzkf1IzOOcrWyS/jGLTEfao1cVRtEdE=;
 b=A+pYvH00sdE1ibSY+vP5JFqrguLkdBxvKvodLpBZxBCcli+9COyYP6p7FbsYi9Ewo2
 R97d/XPocErCumfzCNmXA1cKNVS10cIhr2rz1ElpVeLld9fcF6UCf6V3qAOnODb4ojRv
 kvuaf2k1rxK9suIDJ+sOHrGlBGr0n87CYRF1WCKxKiINsAFt96MsDzKuh4k/BTwYgsQt
 W0d28uCOsw/NpoXMQbCbG976Mbb3zjZlIlJMx8faFoREbjVbfFVo0B68gL0kOmpytDwC
 ElzDhEhiYwsxcw9DF9k37a/07DVIFo0mF/IZUGW/Lx1FTs7PdIifTcsGIbpEOdbSCrXN
 F9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uLnTrj9P8ZHZAzkf1IzOOcrWyS/jGLTEfao1cVRtEdE=;
 b=j2l/YfAhTsYYDZRyCN0DlrlQaKJ16ZGJWhiVZvaPD0K5vixH/HURkdWt2D36PCw8eo
 fRdIb0PggmWwvp4mnRWIrAZORMwvStlAEy0EYzJNViQZ8XW2Wgy5oAnEC1cdwOoQSZ5M
 JiwAZSelwn7a4Aph1D5uCr9ZHPKua+r55ZzkbNiRcs5Bq7VCsrRYOaCF+0d+fOtmELyp
 vsbzIXHaZ/JrIAMAJ0lN4UpSB1UedF7pO5l8oMJkxGzuuLZ02cI9mutBW9Y59WI2bBqM
 LVdBYy0F6UIygh8qPw4/zYMejQIXSw0PqxE1JofykznExYe9LBCdGZzjuLjAGivjute1
 vbyg==
X-Gm-Message-State: AOAM531wqDZnJ/4CvEiRL58gn8f4GKHRVTD9TRY1Tin3BqM0gevW2C4+
 PZNUs83T+docL10e5q/oI7T8anea
X-Google-Smtp-Source: ABdhPJwev9PnQ2nCdUA13HuXVgbCleepBZAem5ZBQEAhDn5vE46ccVov8UwEEHpoBIvvR5SSAjn9dw==
X-Received: by 2002:a62:1646:: with SMTP id 67mr7497949pfw.281.1594983838788; 
 Fri, 17 Jul 2020 04:03:58 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:469:ae36:984e:c073:9d0b:7c09])
 by smtp.gmail.com with ESMTPSA id o26sm7619183pfp.219.2020.07.17.04.03.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 Jul 2020 04:03:58 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH v2 1/9] mfd: mt6360: Rearrange include file
Date: Fri, 17 Jul 2020 19:03:23 +0800
Message-Id: <1594983811-25908-2-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594983811-25908-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1594983811-25908-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_070402_293090_93C260E1 
X-CRM114-Status: GOOD (  10.38  )
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

Rearrange include file without sorting by alphabet.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 drivers/mfd/mt6360-core.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index e9cacc2..df4506f 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -5,15 +5,14 @@
  * Author: Gene Chen <gene_chen@richtek.com>
  */
 
+#include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/i2c.h>
-#include <linux/init.h>
+#include <linux/crc8.h>
+#include <linux/slab.h>
+#include <linux/regmap.h>
 #include <linux/interrupt.h>
-#include <linux/kernel.h>
 #include <linux/mfd/core.h>
-#include <linux/module.h>
-#include <linux/of_irq.h>
-#include <linux/of_platform.h>
-#include <linux/version.h>
 
 #include <linux/mfd/mt6360.h>
 
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
