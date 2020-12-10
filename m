Return-Path: <SRS0=Sq/6=FO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A935CC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 06:02:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A185235F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 06:02:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A185235F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGqcDbcSG3rhE6AF0723bXWZFiblpOKwjgNDNUBzdSI=; b=u29gAgMkdx8bUER+DqAoIbqNtH
	82tXEZcthiXIqL05jXwfOA80pbLPNwSrxkKDIcq4k+Pmjcv8QEVzVD1kzgHfzoyR34Hw1TEMyazsV
	FzHHXQiChKtHm7aSA+hIxcLa19llEsxRTQIr7ZTTNOQfaoUB0rhGYQNdD7YV+XlhzB+qD5OOlPWy3
	QC/ugeoJvt0D2KCDDq+lcg9WCFgJiKOCw9VYfpxy+GCo2lXt48Lf+Zi8oUnN2ab+qq/sIlAcu5Wq6
	687uV8bXtkPinoI54N2CypQ8GJbzICk4ZxJqMVtuu4NXZyNH8jPLut3/KR/HJqEEnWAqS3nnRzosr
	TO4N1pZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knF1e-0007Gx-Vn; Thu, 10 Dec 2020 06:02:03 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knF1Y-0007EN-D2; Thu, 10 Dec 2020 06:01:57 +0000
Received: by mail-pg1-x544.google.com with SMTP id w4so3180806pgg.13;
 Wed, 09 Dec 2020 22:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=S08RLDHwV3/dF7+XO13dHwF7/fsUpwvF4WzmBuKer30=;
 b=Q01omhVfCcgT943adihwfzBwNcLe91YDo+rjvwqe8AlHjWiJq6HusMxwi9ESFgcEf9
 wlgq+VKuQHAOOoOLs22xKRaD2KaO18rjf7RcFYettl6+9J9x9RZ6S+g6Z0/Rf5wcorl1
 lrUR4iFdwnF8YVOUXPXE6ksu8NFJqOriehPNEVv8RAqLdrfVAHcAWFIjampng5g/SFlF
 RPMmIj0ygAWYqPskqitNV3a1S+MLQcaEHezAGJk+agwNUQLmxURpAZfGxeO9CfCVoLGT
 L94H+coTT7ubiMoJzurRZzMHNvxklVTc0QoNtJt5l5MqqNbDKODabqxg6gR+AG4OYUa3
 PM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=S08RLDHwV3/dF7+XO13dHwF7/fsUpwvF4WzmBuKer30=;
 b=nWvJyahFbZ4fjhUSM/9QvGrPJMqBubugcUt8HPuXv0Tj840pst+hFP48TVLLIBbA+r
 NJOo60Z0PmoKjCypZV/nYZfBwlm+2162seCmA/wAA/E+rOZK7bHwM43LO2ZvChh/ITi+
 ggx8VavHZJf1ZScRCU1wTjH/A5cuCVjP6AEJhsMcQ+nNsGBNYEzP3wTYEaPQ/WjUqeoL
 Mhj8G2tqkBowTSM6M15nkHXmAeAdQAH/Kxu76EZ/LwIspez3BVpHHmsBz1Sy+TZ/9HuI
 yvsoDjOZjO8JApP8hoQ4WtVGadl3FZSL4ekJgFM18rthCb6Nx4fkMMivaU/1HkNUHOT6
 sTZA==
X-Gm-Message-State: AOAM532XHxpP93LnvXmyboZNpxiwduRlSxEoqgEi5qJUQeKgpvh3ynnX
 TNxI/vTLI0rO2A1vPfPm72A=
X-Google-Smtp-Source: ABdhPJxoCJN9uM6PsuumhKAHW78UCmRkPIb1f8FKymCwFKozMV/iwNWNadkexsXerE7z/dg6tntvJQ==
X-Received: by 2002:a17:90a:1a10:: with SMTP id
 16mr5688955pjk.42.1607580114750; 
 Wed, 09 Dec 2020 22:01:54 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:568:b3ad:229b:9ee7:b946:7876])
 by smtp.gmail.com with ESMTPSA id j19sm4355377pff.74.2020.12.09.22.01.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Dec 2020 22:01:54 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH v12 3/5] dt-bindings: leds: Add LED_FUNCTION_MOONLIGHT
 definitions
Date: Thu, 10 Dec 2020 14:00:55 +0800
Message-Id: <1607580057-4408-4-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607580057-4408-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1607580057-4408-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_010156_535513_77A6142A 
X-CRM114-Status: GOOD (  11.85  )
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
