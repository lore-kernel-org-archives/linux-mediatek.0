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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0441C4727D
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 10:21:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 267012399A
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 10:21:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tsnj2f7F";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2xJ/AS0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 267012399A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igBTbdkF4IFrTOxuaWOL7ENVmEkX8g8rGyrvNdQxnZ8=; b=tsnj2f7FqnZquH0ZZVe9a77JcW
	4trr/oyaOgHTH89WTEnYu01zLKKm+v9C5UJS+1Rk6LidNS+ePE8n93XQlOWlYk6vOyUYuva8jmJdA
	WKhqJ2z3Wet/EwDXWLmkTxjIwbx+ooOlw5MU0RdwpUw4lI1Va+tOAEqMfUHrqnqxzlL2hqTZ5PKVQ
	DVN5YOJ5xZCyqJnlOnF225htskkEjmP0fYUUWijmCA5h0/ya85G1a6WTQMcMjvuqO33C9e1oYfz52
	whs7djglcSlkhbd1Jb1uiDWRaKVdTN/V0vWyc7zjvSKEPw+TzH3kgiyzap9LsEbgMUvxT5gnHeohv
	+AKnHX+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKfQ3-00008r-4t; Tue, 22 Sep 2020 10:21:07 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKfPf-0008Ti-Hz; Tue, 22 Sep 2020 10:20:46 +0000
Received: by mail-pf1-x443.google.com with SMTP id o20so11996142pfp.11;
 Tue, 22 Sep 2020 03:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dBXfFm02ABja54Il3Ns8zFaadLu9ijtBeVpM6C5JJKM=;
 b=d2xJ/AS0OXnGh0GB5/37HpA/0bJdQ+zvN17J5kMYdFyOBp+Y3cSce21/YWN6gqowRS
 vzK3SCVQC5FU7KZX6/0Jb89YbaD+CEELfsso8VbeFiyUfz0aKtuCzIA5upTLBi6OHYRE
 PXC5GbA8XyNbfqDVbC58LghYM7EWPh85bDmPemUdvKb3L+EbieN3Q0lCM/oxCgA9BmRB
 +1oqJuraJ8DyZV30vfBGDaPaqrvqNetcp/IH88vuTsPdngA1nCxDU8MTcZlV3PxVd09y
 sMVV1bETd5/HkDmPTOY++vxzOvZptq8Ho6YunDumsiKQiLcpeNmqwB2NwD9GtTs28M/K
 2SgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dBXfFm02ABja54Il3Ns8zFaadLu9ijtBeVpM6C5JJKM=;
 b=r0wfmVyRwPF63QMnJcxNCcB5RhIIezhHVGlwtuuCXAgxc9YPEr+pTH+zsDf89ECxqx
 /bh3nk9O5dIvPMoPzBLZ7aOla0viF7JhLrxkzwDW3KFGR4wR14LiBWSbcUZxbBYPFOLH
 9uwwl9w6Xl7ui2RJhZqXfQqcGU6x7g+c8/q4UGd1XhEb8TG15tTAePQCy3HNVkKg5dOi
 frtuXzAtImnMtcX389QPMuXPJlaPbfXGAPk+XweIfI6QLEGn7U1IZesFGBxtDBjWtl0u
 1Hf4l9duKbXv6kTrIk4pC1GUGHuBd/A8Y5Mnh1tABvYp7mZvjBuKsqIhNtjDDa5NKeHx
 su1Q==
X-Gm-Message-State: AOAM530VE3xFXdnIRD0x7J6bgzf4/ybv2MuNRqXkDzrCvl0J/u0ospCt
 e7SDuHhHpDUQzhVjoED5IdE=
X-Google-Smtp-Source: ABdhPJx+dbzaWf232yxuvjzFKMUa5e9oNikBx07/hKGXRREufBPy4+N/4bRtLIQ5AUPqSiOXGfeXSw==
X-Received: by 2002:aa7:8dc9:0:b029:150:e9ad:952 with SMTP id
 j9-20020aa78dc90000b0290150e9ad0952mr2056365pfr.61.1600770041749; 
 Tue, 22 Sep 2020 03:20:41 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:489:56d9:501b:f524:c013:2733])
 by smtp.gmail.com with ESMTPSA id a15sm14859037pfi.119.2020.09.22.03.20.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Sep 2020 03:20:41 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH v5 01/10] mfd: mt6360: Rearrange include file
Date: Tue, 22 Sep 2020 18:20:09 +0800
Message-Id: <1600770019-11585-2-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600770019-11585-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1600770019-11585-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_062044_433464_F5344E40 
X-CRM114-Status: GOOD (  11.44  )
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

Rearrange include file without sorting by alphabet.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/mt6360-core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index e9cacc2..c7a955f 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -5,15 +5,14 @@
  * Author: Gene Chen <gene_chen@richtek.com>
  */
 
+#include <linux/crc8.h>
 #include <linux/i2c.h>
-#include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mfd/core.h>
 #include <linux/module.h>
-#include <linux/of_irq.h>
-#include <linux/of_platform.h>
-#include <linux/version.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
 
 #include <linux/mfd/mt6360.h>
 
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
