Return-Path: <SRS0=wG/x=E7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23FBFC64E7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 10:52:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9080C2075A
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 10:52:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wtwkHfQp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbkXugIX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9080C2075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pp27qeRlmW+Qydfnmj0IT4Q2uwR/pJywPgWiFUFjE+8=; b=wtwkHfQp3nq4YB3ySZacix1ZqM
	Pd+AUWtUBW0GDaNqrPa9jl2ysv0tq/gk+5SkGeLETXfNVSjZopQeZEn3kh5auuR/3iC/y0qeEhr16
	E224WBKa/ha4dgXZNvjeaWJUaRwAUxJM8dkYoDVQe9PkpIwaUR/MfQ931Lp663d9xRG66d/ytLQY1
	9xSMLLTtx8Fm4hdkFIjWkbWPL2aX/luV++uYMp2tpnRzM4glV9w39VKK+o5gI05+u2lPf6oYBCc+X
	yU/dBmuIx3cl9HGQYEw0ppdvA2V64hPyLuys0b7Eb0H2Si8FYxuqYvf9NCECmGBR2F3rUIPd2/4IE
	zp8tWHeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khsP3-0003uY-LH; Wed, 25 Nov 2020 10:52:01 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khsOf-0003kt-2B; Wed, 25 Nov 2020 10:51:37 +0000
Received: by mail-pl1-x644.google.com with SMTP id p6so925611plr.7;
 Wed, 25 Nov 2020 02:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WG4D2tiQF6AFMb6tNX1EXpM5C5fu7Z8QRdWNSLMkGcA=;
 b=dbkXugIXmomhr1J8RXRX8+D9hoHp9wUSbj+pxnAqlExuIoG2BsPNnAcsjQkXlJyJp+
 yZow225tjQE9U3UsKwYyB0sK7nEo3zEm7DMVRl4g309UfVbqfL8b0U+aNP8/Rc9vOz8G
 sDXXC/6nEh1UkN7VEE01X3JVONzs9afP/NX0Cvx2UEjhjkR9ku4Teu1iAfvC0icJXas/
 L/jHCACJN1CskOR3PK0pFmNJ9ajCjiodGQmopgaqH9ho2nXI47CrOl596u/RIlNhbZVa
 3w12Fmy08eieY93UBtaZbkrTPlLJurnJZ34g6sWuaTBwsJZmjNLWYUoOYRkIgWjOK2cf
 uC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WG4D2tiQF6AFMb6tNX1EXpM5C5fu7Z8QRdWNSLMkGcA=;
 b=LoQ+xrZYyFIpeRBELxpqMO2hmiUhI8N+gbzhoLNGonHlUqeY9nAXAiC85xVIlljn+0
 hqWZbFy5NlfktNEUYtbcMVBhPkMtEs8MK1Pp2rVi3NfVPYMioJM8P+muLNTYdVB0zS23
 ZvxWWfij6Jsc9AYkvh7tGUdHHkjaOzVE3RNheNYV8H53n85/+2/avHD8x/tSmvFzQPg6
 I/UUMeEaUH+MNx3VAmXEV6PboihjfURSG3ynOp8AMMAsEDv/EGfge/j/gMCm/LFTp+IZ
 trq8qp1fnJNPXWWd/Vkne0YQrP44wj4aGGlYPr2m/tiWxVn6WcqXVVkhDDmIfwKf1lMM
 NPDg==
X-Gm-Message-State: AOAM530H4VQnO4RYyKHz3mYyFQ6U+vF8nlOo4PB4s5s7bPSYWoc0JBEH
 KA3GzyOEaGIebmQZWpS2rYE=
X-Google-Smtp-Source: ABdhPJxjSR93uqTSDIsCHJvTFjau0SzlxTnQGMLpk80DIofepTZ6WucuQIx2lHesNI9sEhoK+V2whw==
X-Received: by 2002:a17:902:a581:b029:da:d78:7f79 with SMTP id
 az1-20020a170902a581b02900da0d787f79mr2719139plb.32.1606301495464; 
 Wed, 25 Nov 2020 02:51:35 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:48b:4d7:7339:ae2d:114e:3859])
 by smtp.gmail.com with ESMTPSA id
 j10sm2049520pgc.85.2020.11.25.02.51.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Nov 2020 02:51:35 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH v8 3/6] dt-bindings: leds: Add LED_FUNCTION_MOONLIGHT
 definitions
Date: Wed, 25 Nov 2020 18:51:12 +0800
Message-Id: <1606301475-7030-4-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606301475-7030-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1606301475-7030-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_055137_155455_CF12F381 
X-CRM114-Status: GOOD (  12.56  )
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
