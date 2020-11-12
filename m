Return-Path: <SRS0=Fc+n=ES=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8114C63697
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 10:40:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 598E522201
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 10:40:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XRmC0FwO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cKWkLkHE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 598E522201
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igBTbdkF4IFrTOxuaWOL7ENVmEkX8g8rGyrvNdQxnZ8=; b=XRmC0FwOpKOWcepB3SsQua6U3J
	MkFOrNDGUS29hGYtD6N7jIY9DBmlxVgpuSmCbkTqOGMCkmwENOS70rEjpuXuXHpR6cVQgVQFLJp8k
	aOf4y3/Mwj+B75A9d7jG8YLQrMqx01cfNEmZzlUnBD1vDqFfYRuF5GERLnfUj4usUUmWSQo1Fj9v7
	lkQr0ZxsSxZIisCP4lcEVIYrpaG/Eu2+C02L460rOjPgAe28jTdoxCevO6TyW/pi6laDBlHWtYzci
	VCx+HH6XVZcUInskuuB+SPpcpigDa1pDPQjAaq8Y5oqxF9UOTtnuAJXrcaEjxwQEGdBRof7PZAQz7
	8DawekdA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdA1m-0004WJ-Us; Thu, 12 Nov 2020 10:40:31 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdA1T-0004Q6-AK; Thu, 12 Nov 2020 10:40:12 +0000
Received: by mail-pg1-x544.google.com with SMTP id i13so3819476pgm.9;
 Thu, 12 Nov 2020 02:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dBXfFm02ABja54Il3Ns8zFaadLu9ijtBeVpM6C5JJKM=;
 b=cKWkLkHEvo4/XIEEtU48nprSPCaj5mF7oXPQdNOmV3PM73+xUiRZJo7DBKkzJpdurI
 HfDr4hDHPlyoi71cyyp2xVvnspB5prgjfr903hgLX6dNlyrpkliWfNNyoKjUMW2jHOLN
 fgjb2XE48wb8V7mdxQbDI3K4cS+dVHDb+B7VrxMhwg4j15kJXSNJ6x3yTOrexwmjpamN
 ZBZ28IOjh+WiOA63HtIejDXPvd0hAD+ake/32gCgl1uokMaI5wL6/MP40SEQRBWnA8Oi
 JLB12qhB3NMN9X1KP518sgWjiYzNvHwEYJjTqfkbg9VzPDn8/KiHlvyXyTRsPvDSx5aH
 n1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dBXfFm02ABja54Il3Ns8zFaadLu9ijtBeVpM6C5JJKM=;
 b=NStjZmEAOqJjIC0AIBYp4iUHHWNfCLYH9sg/xX9mRnpU/SRNNdsYro+XtYNS6WWJpz
 cOqMUGWfmnMabtaaLZWhGYu6AAufeqJkuxneGHDzOpmwFD2u9IyAjjXBE2y8gTX2S3LG
 fc5iU+YtoDX+peZCa2o4Noc7TXufmBGtpAope8Nmpqzj3ZVBfzVIxnjztXBMonSHR9N6
 w1ZuPl93EHMaVjFi9sNDpV8KBE1Z2+hcJixlS7Hx0s8xV046BbQJtxLWxk01hIM4lEwt
 oTOVJVpEAmI7GrxA8Ljk52j2tQfBeCTJMSVDbbbY9FjGuDwzzLKWDm1mp9QF94IiuL2r
 JjDA==
X-Gm-Message-State: AOAM532ENVRb57z7BtugsipKIEhEyG3yzKaCaDP24YH3VjHR5iS52MMu
 NAckjlOtxfDLwjB0Eyw/Y7Q=
X-Google-Smtp-Source: ABdhPJxgVRlYPN5p4Aq+alIuGs7pZUdTkG1v3xdLLSq3H1rfkWqkWgPVFeDIN2XXK6ZZ/E8H3pNpBg==
X-Received: by 2002:a17:90a:e391:: with SMTP id
 b17mr8905685pjz.209.1605177609052; 
 Thu, 12 Nov 2020 02:40:09 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:47a:a27:cf8e:7817:51df:a883])
 by smtp.gmail.com with ESMTPSA id
 mp16sm6414094pjb.13.2020.11.12.02.40.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Nov 2020 02:40:08 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: sre@kernel.org,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org
Subject: [PATCH v7 01/11] mfd: mt6360: Rearrange include file
Date: Thu, 12 Nov 2020 18:39:48 +0800
Message-Id: <1605177598-23501-2-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605177598-23501-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1605177598-23501-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_054011_481009_031A81D3 
X-CRM114-Status: GOOD (  11.49  )
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
