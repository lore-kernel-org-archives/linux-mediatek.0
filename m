Return-Path: <SRS0=o4uA=FA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 342A1C56202
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 11:54:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF4BB20678
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 11:54:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zsA+o1nl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W1/lRTuB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF4BB20678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlZFYrRcf1yvE16jjLKc04sb1sp6mDfUaah22JF7/H0=; b=zsA+o1nluykIXAsNj6Aztn4VjL
	2t1zh0JS360ySzrxKUdQUz0AT53MpT0T5eL7LKyO5OePc5uNSWbEjzNUZlASuT0LaI7BPTsx4BLiH
	0DhHqosSwfn3g61+PQbmRFr9s0ELAfH/fqarchX2rz6bKNoBHZIuq91Eo6RFi6FZ11RuU3d0qi2j/
	3IccGDtxoHsTDYtqN0ZD6hXVg8Ok+4ru5OkptPrPikOlItomcEjqxkDALGakFp8uTeKhUqwMelHAs
	M/sZYVx6KgPGGO8zAKWaiDLDdhhW/I3RZs4+52uxGH3Ng1/q1uE//cKCwBIpBPQrLDXBU9NWNynLD
	X2KoOqpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiFqn-0003qf-LH; Thu, 26 Nov 2020 11:54:13 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiFpw-0003aj-LZ; Thu, 26 Nov 2020 11:53:21 +0000
Received: by mail-pf1-x443.google.com with SMTP id 131so1431038pfb.9;
 Thu, 26 Nov 2020 03:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=u27cmgElzByD9jBdabnceyA3iNbSV5QTjACW/k5nwHo=;
 b=W1/lRTuB5BWrIRy52cWEjawSqvx48zqA3+GMUD0SBq9nGtI0iXeB1BAMn1HRXfJsgq
 /DmLG7FpuOoiSfgDGmQsjd96V+bQKePgtbI4Du8LKs+x7Jrk1w1u+NFMXPiNcFRCfFg3
 zij48Jzd650JosQ8UO5ScJH6rjnsLATEe8Gj9Upzt+7dmjVMjn3G4lYJxRWj3HnaY4my
 O+fQSj9T6VB2SApRSuVS+d7aWHszem5cpGpfWjorkQYMrzuyIoUfmkZx8RJ3ppcF06Qz
 rg+plYaQxWaQA7Pz6qKg9HukG+TG/PIN7ratBpg8tN7uVPtIilL0UJZAIx+bEKba6mb5
 ZWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=u27cmgElzByD9jBdabnceyA3iNbSV5QTjACW/k5nwHo=;
 b=UcIuUXBvtMbVD0xS9GbiQm0hwMbf+PrgmupzhWan05TCY+Gg3zt87C/ITvlTekT0Ec
 qER7jMORZcrGlREcMVjdJ4EdRdfOkWy6Cis8xZABzZObWgX5UtLanaMcsdPsKA02evrx
 TT4weST98rZdXPQrYB9gydvUflX/GrzvGu5SnnTuQS+na8DkIhBotNvHVIjlfU7dXmRi
 EPXamxVOGV88/0xfM0m3UYI6TP8fLcMP09YC2V5T5zxdlOXX4+QxOGj9zYBbhNFGNeqq
 YcflGY8LceUs+dDHHH81Ff41+TMO5ZeUWno82hhZPIn/Bgh7LAN2t3bLbRP25xdAc5cB
 TWIQ==
X-Gm-Message-State: AOAM532die9b7MuqsEW85t8DoJWtGUK/UYCZKIiVgs91edATLLHqUSjQ
 v0LIWI9I57vsS/1AYYd8sMM=
X-Google-Smtp-Source: ABdhPJwSF7Rvvxiq0V1hS+grvS0qOUQWKW6wZio+TrhUEulohHu2BCW75CIQQ8Oi/yGV1wR3e2uWUg==
X-Received: by 2002:aa7:8812:0:b029:199:25e7:4ab7 with SMTP id
 c18-20020aa788120000b029019925e74ab7mr2528656pfo.30.1606391598344; 
 Thu, 26 Nov 2020 03:53:18 -0800 (PST)
Received: from localhost.localdomain ([101.10.31.14])
 by smtp.gmail.com with ESMTPSA id r4sm4721617pgs.54.2020.11.26.03.53.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Nov 2020 03:53:17 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH v9 3/6] dt-bindings: leds: Add LED_FUNCTION_MOONLIGHT
 definitions
Date: Thu, 26 Nov 2020 19:37:31 +0800
Message-Id: <1606390654-6075-4-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606390654-6075-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1606390654-6075-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_065320_854992_2C491D1A 
X-CRM114-Status: GOOD (  12.78  )
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
