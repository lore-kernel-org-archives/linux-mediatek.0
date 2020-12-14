Return-Path: <SRS0=EHBe=FS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A3EC1B0D8
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Dec 2020 05:06:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D7D222582
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Dec 2020 05:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D7D222582
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WzOVOH9Q94toB5scPDo9V8QjIQp0KU2Ajki1yiP0NRE=; b=sG9oBKQj4II7DgmofVjCrJqZ2
	sRzPxQKcK4oQpHrzG/Vc6dHA9kcklaAjxDqWUgqVNxFfN5HQ9o6DQsmxsDT5V+92mgChCDo/OvCO9
	tB2vPCyVXU5JvQBYHUcGIkmUplqNZP9Fg5949AMqP0Ual8bN8tjI9rNc+tgFoRUXJ9Rdg+qxAHRsv
	iFCi75drj+0W5D4HNADionxCiuckLPngzLVB86M505Cu1WeyXFXpnKWZQIqE0Qf5Kb1l0Ub41r8iO
	d/8mbsesRoF1QPn0xvStXAvc8TbJSGCf9jlY/bQgK4aQM2dc8S4LRwvQPit1MvekXtHFEiurySkEA
	riw276K8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kog3V-0003iU-Oo; Mon, 14 Dec 2020 05:05:53 +0000
Received: from mail-qv1-xf4a.google.com ([2607:f8b0:4864:20::f4a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kog3S-0003hW-AO
 for linux-mediatek@lists.infradead.org; Mon, 14 Dec 2020 05:05:51 +0000
Received: by mail-qv1-xf4a.google.com with SMTP id t16so11176816qvk.13
 for <linux-mediatek@lists.infradead.org>; Sun, 13 Dec 2020 21:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=GUtMS/yoA8AlX35KWXx+OtSpGWP4nVdoiq93Y3LhngQ=;
 b=An+eAZV+jljp8c47GZayDSqeDwsRylkUVZ4MKqRbHnCV51SXxfvmLoLhkx7S8IyQ5T
 itglr6QOCQ+UXv3TlO+pqxRGWAqlN3+sEifWjsO1ZR+fkIjMFUkSFKOdxoeUfEv56Jo8
 hzB0aVBmm4dbYULgrE1AND+4o0PKjjfJKLSt+MvkvmiV0eS2gmAr6UAaf29Bznvt/Vto
 z1Un4WItskkMwmtkNRgOiSPVhXhenIqis5W0JvIU/G49TLCPahvBPnvDFDsYqSEO+HxH
 CCpD0Tx8DlNblfv0uXYxrMxz8fTAuJtyKBPUZ70jqs/RrSKWHHFofTaFgWkaW4wFDYtu
 DzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=GUtMS/yoA8AlX35KWXx+OtSpGWP4nVdoiq93Y3LhngQ=;
 b=Ctn4GPo5NBR2za9wffGGtBAzaIq1makzx32aLQcC5MMOd//tXYv42/AjwgI80CCSQ9
 3+Pmw2ldGnrCCZAjG98NQf0/v00cpdu9R1YXId1AK3MnUSOGrR6f4RP2jNfw4N3s03GT
 Qc5lZwY9kNQPY9ZoXKM+DyKECY0Nly5xVOIo6AN4UCgHRaLmAbhYaeUiK3f6K23pyAZh
 xT3wZRmRHA2tKqAlw8qjSbSJgvVH+fa8LSkwLMyAe7fXVAkEyxIX5QyfKw66pF7HinZm
 Uvk0XsRTb/KukJIKdX6WUm5w0c8dfT63Flr1JFnHwLGStgClfpl8F1zE3/n5mv31lJSw
 SXRQ==
X-Gm-Message-State: AOAM530cq+Cnalc/2G0R8ggd0VkB2ldTxbkrMb2Q02ty+U1WmKv4/Xrn
 nZDGJ23TLhkvQflmH+viXUieN8b7gKPA
X-Google-Smtp-Source: ABdhPJxZkqsL5injXgfq7FIilIF3cOR4K4Sb1FhdSzaQnJhs6x8iVHpL1LCGl2mU/1BNaZKzYCSSLrxveN01
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a0c:df94:: with SMTP id
 w20mr29806672qvl.33.1607922347262; Sun, 13 Dec 2020 21:05:47 -0800 (PST)
Date: Mon, 14 Dec 2020 13:05:20 +0800
In-Reply-To: <20201214050521.845396-1-tzungbi@google.com>
Message-Id: <20201214050521.845396-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20201214050521.845396-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH 1/2] dt-bindings: remoteproc: mediatek: add L1TCM memory region
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201214_000550_382629_368952F1 
X-CRM114-Status: GOOD (  10.01  )
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
Cc: matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 linux-remoteproc@vger.kernel.org, tzungbi@google.com,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Adds L1TCM memory region.  The reg-name is "l1tcm".

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 Documentation/devicetree/bindings/remoteproc/mtk,scp.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt b/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
index 3ba668bab14b..3f5f78764b60 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
@@ -6,10 +6,10 @@ Mediatek SoCs.
 
 Required properties:
 - compatible		Should be "mediatek,mt8183-scp"
-- reg			Should contain the address ranges for the two memory
-			regions, SRAM and CFG.
-- reg-names		Contains the corresponding names for the two memory
-			regions. These should be named "sram" & "cfg".
+- reg			Should contain the address ranges for memory regions:
+			SRAM, CFG, and L1TCM.
+- reg-names		Contains the corresponding names for the memory regions:
+			"sram", "cfg", and "l1tcm".
 - clocks		Clock for co-processor (See: ../clock/clock-bindings.txt)
 - clock-names		Contains the corresponding name for the clock. This
 			should be named "main".
-- 
2.29.2.684.gfbc64c5ab5-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
