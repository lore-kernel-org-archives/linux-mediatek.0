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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 690D5C5519F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 10:52:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC76B20678
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 10:52:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BMcS5XSi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bTkEAlNd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC76B20678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2k0SsK140AqktlLMh8IyIydyWrbR5Rhlo5iJePVshR0=; b=BMcS5XSilD1Llg+LOJhggt5ssh
	V5fwfiHgrClpY6tDE1RcyApYq2y3fSWGxapGnQAQq2+da0NPoRU2LQr/QXyXUUARKyreLvGuFiXmm
	X2jIn5rBEFGSVa8kYQpQQjOIxiKIBsI4bgiK2WmHzvFTuwTJCCZUWJA+dTZz1N7yPOweQB7Hw6PtG
	rJuRC/cfeg0MImz997Iq2dL71jN+FNuWp5Oq4U3RUr0XHasPo4CQ8/1oWLoACh6+xYDIp0zh7VMEU
	NxWP2rbVK8P8NEEaP5sHqi1HrSA0zAnu+B5Q/7nhvWz19Bqf6g3ckfrXQFd7jWiULrcaptPE0o8t8
	alNaX+Hw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khsPE-0003zO-AK; Wed, 25 Nov 2020 10:52:12 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khsOj-0003mM-GC; Wed, 25 Nov 2020 10:51:42 +0000
Received: by mail-pf1-x430.google.com with SMTP id b63so1912990pfg.12;
 Wed, 25 Nov 2020 02:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tYTwl9UyzE7O08dqCyL0rs00lmC5U5Wi10EjecyWl6k=;
 b=bTkEAlNdfgadrGnjzxHjZzVwFW0EJEYJkB0ibL8YpOkC8fl5JKii37NIHGO59oqBd2
 WJMsrPmfeYLprG0UIHzFyXEvaYa9bdMEgzzeOAvdcoKlr8E71bB8FQkp9yM0wJCXJmnD
 xp4wxIxO5YDXvBk+4LrApKYcz2DEZaBOj3Keuc5+ETqovP68RfgX0K3XQIoUMVVqFZ3+
 fxrjfvyiQx5uR/XvQVLsHDuE2D8k0yC8bRNnNtiC8NgyThuWQ8IP/IhCKt3ETYLETB/Z
 RsA2jd6TOMYCem4VuMWAmE6EGxFmzOee2+1M8skLwOCtvFDAsnrLES/pfgRFTfXslWkD
 nDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tYTwl9UyzE7O08dqCyL0rs00lmC5U5Wi10EjecyWl6k=;
 b=BsyoTQlVyGVnpSdmoQ2JdCLP/tSCUalqCKp4A0/tOr7PMM7hYfFWbCvn+EW31EKfmx
 T4NqyyRfjr+aVa2gx/O/Qe3Hkdg4LK4SS+QU4njI3+TgKg+6FchV8Vv8TxwT7Pl803Gd
 aUNT20SMJgKSq9yCpejMBNOcKbVt1WAR9yla2MIUbGHfKaNOuYJ63vNDXyDY39bB0U5P
 hDRw+e5hduyQ1iVk60Q1WXI5dXmWjtwhyT7Lmf6QRNUpwAIc9gMypo8CtihWuj/aRbD1
 O6p1/ghSOgboDOu7yMydFy9ZMqC3tG0/7t8rYssNdk+q+WL+LtRvvBv0+kCjonWySJPQ
 /kmQ==
X-Gm-Message-State: AOAM531SZNP/HB92tdYEKvvl50ymR83ICeCMlEEyRWIKkesAYLwh3Szt
 KXsvrFlvR4ByXuOQ2KquT1U=
X-Google-Smtp-Source: ABdhPJxkCo2NB3VMtqBYMczVycJrUhJPChTbNkRn1v8GR5fyek9rkb0/e+ltHQy6gV+XGKSIz9tfKQ==
X-Received: by 2002:a63:443:: with SMTP id 64mr2572625pge.127.1606301499549;
 Wed, 25 Nov 2020 02:51:39 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:48b:4d7:7339:ae2d:114e:3859])
 by smtp.gmail.com with ESMTPSA id
 j10sm2049520pgc.85.2020.11.25.02.51.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Nov 2020 02:51:39 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH v8 4/6] dt-bindings: leds: common: Increase LED_COLOR_ID_*
 maximum size
Date: Wed, 25 Nov 2020 18:51:13 +0800
Message-Id: <1606301475-7030-5-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606301475-7030-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1606301475-7030-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_055141_609782_7371FD4B 
X-CRM114-Status: GOOD (  13.25  )
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

Increase LED_COLOR_ID maximum size for LED_COLOR_ID_RGB

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 Documentation/devicetree/bindings/leds/common.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index a2a541b..0c9f912 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -43,7 +43,7 @@ properties:
       LED_COLOR_ID available, add a new one.
     $ref: /schemas/types.yaml#definitions/uint32
     minimum: 0
-    maximum: 8
+    maximum: 9
 
   function-enumerator:
     description:
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
