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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C4B0C433E1
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 16:33:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60D7C22B42
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 16:33:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lP9Wy1ix";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0jJXT0j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60D7C22B42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SIwRBmTYfHwvP8UQdm5unZnpsR071DH79OseBWNL+0Q=; b=lP9Wy1ix3I57MxGbGzJ/x5TFME
	y8BF+mMHtyKNrznFnweeGuTRT+LDgbMpENYDGsjPyfNA3il+aF6QciKUQxMcTJbqgnpS2SaqaK8LO
	4jVMMKVhvV4Cbp2NzW2egYdU3JcLIvkrnL3jhyGzu7GgBJNZ+P62/7wX353zX//JWTpIhANlYnFHy
	DS/SEKEtljcHpXKgegLk3cUmxP7ekx+1kvNxO1wNfUITM7XWXxVOYdpW4rZj9Zn/ZW1f92PmCOnwQ
	aw2a4D+7VWWaAgZ8SJCj2PaJ+spxI6VdQDQWDNKC27a1tW93q5PogMls2/pRYvMEfKNC2Xq1kNlFv
	98Uk5gFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2zsP-0008GW-RX; Tue, 04 Aug 2020 16:33:21 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2zsJ-0008D4-0I; Tue, 04 Aug 2020 16:33:15 +0000
Received: by mail-pg1-x541.google.com with SMTP id t6so22555082pgq.1;
 Tue, 04 Aug 2020 09:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wr09/zFN7INgSL/hkVohJfKLUB87eURQe5zN5T5ukzo=;
 b=B0jJXT0jtUj2/zo9XBQUyG9Kdu2EmQSJbRxb7duGHAWijyWMOh65XKfOh49n6LjnfG
 uAIZcH9qeltXn/9+qyDOPWmOIvH4Cz1eUrgsqvMvUDBepmPnNGkBUdX9MltM9v9bIOv3
 QBYDTBcY57lOpqriYV8yen5STihrd506+zE8DglgJcu2eR6EijFFGprI99ckzm4Vk5A+
 LLjjDPME987JPYAq1UwvNFA1To3AO5JRA7fSfUcTdsrHzR2KImeLIMYXMK2vrGQ2MJTD
 z6iJKdR450NkyaPy3Aw5RsqP05P+HdtxGXSBe9Jg0CVpBoE0+dc/cw9aOMisknlvHORB
 YTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=wr09/zFN7INgSL/hkVohJfKLUB87eURQe5zN5T5ukzo=;
 b=X5YUbT9QUxfbf9MchICBJaOpw2ftbjJcasl9Aq+TNTB2DAUZcmhD6ovp/Y/pAd8OjH
 DXi88bNRhSFXJG30HsJjmLaQy4B+plhxwNZdOpHohExUhDIQiz7F1H1pqH6hbQckOz0N
 Cc2OBBjsm8i+CMy01vDkGTSlw4Id3TWCnHWGKmb1A5MA64xCWBC3lFeLhYUyyHqynyBA
 /V8Eu0IEtF3glGMJafjln1rd+LavKHIqHg4091QjOQEOd8egp6y8EcnlRjsna68t7aYk
 49I2CKjJkcIe6Fnw0dgMgEv/JsZ0A+9nexhYtd9VEP1G2A54KK1Cp3PLSgwMZosWNfQI
 zjJQ==
X-Gm-Message-State: AOAM533p1iUq9qJLBLfu4aaLJuMvVhI8t2XeTqJvlL0QPVck7QL5OU5f
 bMxjP+gEdXRMWz0Il+We1f+JQoEs
X-Google-Smtp-Source: ABdhPJw1Pi3AXMVkSCaqPv5hExwHd2BxhzyFK6XiKYORGvLW802pSliKRXJSIuMPEv6iHBbTj1zYsg==
X-Received: by 2002:aa7:8514:: with SMTP id v20mr21774599pfn.18.1596558792756; 
 Tue, 04 Aug 2020 09:33:12 -0700 (PDT)
Received: from localhost.localdomain ([123.110.251.138])
 by smtp.gmail.com with ESMTPSA id m16sm657253pjz.47.2020.08.04.09.33.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Aug 2020 09:33:12 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com,
	rafael@kernel.org
Subject: [PATCH 1/9] mfd: mt6360: Rearrange include file
Date: Wed,  5 Aug 2020 00:32:53 +0800
Message-Id: <1596558782-3415-2-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596558782-3415-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1596558782-3415-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_123315_062746_452D963A 
X-CRM114-Status: GOOD (  11.16  )
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

Rearrange include file without sorting by alphabet.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
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
