Return-Path: <SRS0=ptZs=FZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A51D3C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 10:52:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5008722BF3
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 10:52:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5008722BF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGqcDbcSG3rhE6AF0723bXWZFiblpOKwjgNDNUBzdSI=; b=afsBDwHaFcFrjbhNVDzjmHyo/A
	c2cdzJv+kVdCrOUMwoxLjZU2Ra0cVjSouWRmjwsYSf1VaCtfF1a1r5ss3VWJsrsiDHB2qMkqFVAQi
	X8/RMpkWpYTEAywMz/xGyKnKQBnR6G67trnkg/gMdasg5pz1n9uSqt2942lgg/CWUSl8zhF3Op9T3
	8CdehZcytxvQcy9gRwYgFr+jW+FLaFGRY1Hy7pEr9hDFJjIX4FMy41gj1/JEKHUvbQnShLCsU0sAo
	qneWRtZQm98e2XYS3bMiGHalNFcmpBK7TV/knxYQ63GLBSq0pp4DwoRzJKYgHb+KzLX+YJhuu4m9N
	INOrYw5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krInb-0005ZL-HI; Mon, 21 Dec 2020 10:52:19 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krInE-0005RO-Pd; Mon, 21 Dec 2020 10:51:59 +0000
Received: by mail-pj1-x1036.google.com with SMTP id lb18so5948009pjb.5;
 Mon, 21 Dec 2020 02:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=S08RLDHwV3/dF7+XO13dHwF7/fsUpwvF4WzmBuKer30=;
 b=lVENUt/1Vfzn4ItyxvSALGab79XYUxUjTr9B2AjlXUGHNLWLj+grkw4dLA+La/loh4
 asFegJTVxB2VvYd2bxdsUj/Aprw6VPKKKntdnacq0eg5n0+4mtnRmZH6BKAuwS9jHmAk
 buAD0h+R3tOQy1tnGZu5DA4K4HTdcpq/nv6crr1WnW1R/vZcPsVq8hMpHZssTQwQ4fFf
 XUXyefz5tz+vtL3S5TMDxOFpF/pY4lo2Ka/zWBHp4q6ShFH6zGP4c3he1uocNVcsaLUT
 /slHpqxNTYVHD9g9Vuwh3C8pgfnsCnAPRlBIgt11EHvScM/3Huut/MxIISyynqIH2WZO
 g+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=S08RLDHwV3/dF7+XO13dHwF7/fsUpwvF4WzmBuKer30=;
 b=MffksbcO85x7KQBFPtJrjtYnRM6jbsUfzR7jJ/R7PU7xVoNphGpi+MNY5EPz7e6SDW
 0mFpZI34EQnQrjjOF//T/GMPlFLg1rZAAEQSCqUADpMKiMwt5A2UCKdSQEaj3p017jii
 Uc/HZlUw5hWKxvVg764Imcd5lpTsFoyUDQWWEtC7qsbAX+GJbzDc9rGO9lRqKjZx2plA
 LpdxfDCA7SE3Q9rtkaehz1UgxsjGMt9yVH/0IO8Sk/AW1awGUlyQfnxZH9k92JHvU/85
 6esJBqWDuVFWc5g5CB1oHyhchIgXZ4OwTuLf26HW7mkIhi9twedqtm8SZrwKNTP3Zb/u
 QV7w==
X-Gm-Message-State: AOAM530891D/PyLZTuf0lZwrZy5AZc1PvWPGH/cjbV5IyhB7wXdIOV4W
 oDFpctufsom1B0JGfgRsd2g=
X-Google-Smtp-Source: ABdhPJzaFpyJoOWHv8sDnGwTv0VlmGyTiFFwESiKZwSC5LPBX08RmDtgHZCr6b5bwXvnqgPBF4CSHw==
X-Received: by 2002:a17:90a:6388:: with SMTP id
 f8mr16939805pjj.192.1608547914584; 
 Mon, 21 Dec 2020 02:51:54 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:469:a113:4308:e075:646d:7374])
 by smtp.gmail.com with ESMTPSA id p4sm15364193pjl.30.2020.12.21.02.51.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Dec 2020 02:51:54 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH v13 3/5] dt-bindings: leds: Add LED_FUNCTION_MOONLIGHT
 definitions
Date: Mon, 21 Dec 2020 18:45:52 +0800
Message-Id: <1608547554-6602-4-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608547554-6602-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1608547554-6602-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_055156_923991_DFCAA14B 
X-CRM114-Status: GOOD (  12.43  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, dmurphy@ti.com, linux-leds@vger.kernel.org,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Gene Chen <gene_chen@richtek.com>

Add LED_FUNCTION_MOONLIGHT definitions

Signed-off-by: Gene Chen <gene_chen@richtek.com>
Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 include/dt-bindings/leds/common.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index 52b619d..843e65d 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -78,6 +78,7 @@
 #define LED_FUNCTION_INDICATOR "indicator"
 #define LED_FUNCTION_LAN "lan"
 #define LED_FUNCTION_MAIL "mail"
+#define LED_FUNCTION_MOONLIGHT "moonlight"
 #define LED_FUNCTION_MTD "mtd"
 #define LED_FUNCTION_PANIC "panic"
 #define LED_FUNCTION_PROGRAMMING "programming"
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
