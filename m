Return-Path: <SRS0=HQvY=EY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E580FC56202
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 10:48:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64E28206A5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 10:48:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xbWKzTJr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cADCQDKC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64E28206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rf7scJBEohRlOWTS41ptrTL8gt1JZEWI8QxInIYJn6U=; b=xbWKzTJr0ZBJo1Njt9IYWX0X5W
	zXJbfhv1ET7X34X67uuftOZ+LlssKOQU3VHYRYJdDPzEmV4aXoXY0Xzd4RmfeWdg5qdu2dlC74fXP
	5HoZ24UQSzT7XHKkB0W1Fdf63Bojvo2OFeENK5jxVDYgU1UM45LiZo0NhjDTJqZl56fqEv9bLcNdd
	jrlTqyL419+e0fVjniHrplXvkweHYWJjOtJvWuTxYZi1vgFKVau5+MF3eFSxXno6TpsKEZ8pKqWea
	u5maDaVzgeUrxHEJUYs+X/wLhhvYCjuM5bOnga9jWIPe3Ix4w3bDVguCdKLY6RTfsFlFBHNrSkJnm
	oxdkCR/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfL0t-0005Rw-5M; Wed, 18 Nov 2020 10:48:35 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfL0o-0005QC-Jx; Wed, 18 Nov 2020 10:48:31 +0000
Received: by mail-pl1-x644.google.com with SMTP id k7so786017plk.3;
 Wed, 18 Nov 2020 02:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ku4DFZSb8iFG29uouQzq61N1s3khgmRXmV0BrLGheJg=;
 b=cADCQDKC7QskBBuZxRAc2vN8S6wb7cXwjZYbpjAQyUOcDLGexcknfwLX0QGYqfcdQg
 gC85Y2FHjMKqPWhM2wE1MDEVdKfdPVWOF2QznJjnobjeIm4P1Le5j3A8cc9i+NElmj8/
 g0zqS8seje22I+sx+seZV2uVn9rUQGifnSBaMUzqYeoohgNNJvQilKMWOjb33cR/39Ot
 rI1aE2iRjBIxEtCl/ZDGBmRgDnPR0H3yPtsUd/TSXQ0K+Y+ZafC1b7mIKuGTpWgA64Xb
 BvJQFARQWvAWeEWQAMGchlBz3EG6YQGB7yiSP6xj03lhGY6XsIA3JZ5civtIa+23IQJu
 FmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ku4DFZSb8iFG29uouQzq61N1s3khgmRXmV0BrLGheJg=;
 b=Nt4OW1DRdf1A7eYB59vyR/yhL2Qdrue/Gq1GewqeYhFjy1iAjhdHua9lWoQUjQgKbI
 o8bQLTcKG5QJoUPMVB4ggQCyE4LW8/+TcFgc8hZaGHI2gP8Cs3dtvTytuCYhrL3SuiYX
 UImgKTBr98wDEEqdhk8wbI9t5V7eGa9BeLzSS1sbGwZgyeCmnlupcLKCGpsiYRODu5/q
 w0QlU50JOkkP70zrBR12sdJFPJmJ94JOzb7JT46siDUM4n4gbYP/KfHi+1oSjNOk1Oy0
 c3x3DDTUH0Ge+a7YCIhudchxhe+uHWY7usVd3JbVIqt+lZP9zdhMTE6eBd97EyFSsarG
 KVxw==
X-Gm-Message-State: AOAM533FGzuhEMc4NChGcKDd4lsVsF+DqHdOhM0hpjL+JKSxxME0U3do
 EXWLnxzHc/F+x5zWXIXvRNQ=
X-Google-Smtp-Source: ABdhPJzXdq3kdzW4a83uwdkgeDkiLU/JLMv94gcpqdl6dzigYYr4CSB/SrH+nqIUZDL/XEBS6/UCaw==
X-Received: by 2002:a17:90b:fd1:: with SMTP id
 gd17mr3500973pjb.148.1605696508590; 
 Wed, 18 Nov 2020 02:48:28 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:575:2174:b7aa:599:e762:e486])
 by smtp.gmail.com with ESMTPSA id
 a3sm25345154pfd.58.2020.11.18.02.48.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Nov 2020 02:48:28 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH v7 2/5] dt-bindings: leds: Add LED_COLOR_ID_MOONLIGHT
 definitions
Date: Wed, 18 Nov 2020 18:47:39 +0800
Message-Id: <1605696462-391-3-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_054830_688967_415674CF 
X-CRM114-Status: GOOD (  13.04  )
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

Add LED_COLOR_ID_MOONLIGHT definitions

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 include/dt-bindings/leds/common.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index 52b619d..1409e9a 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -33,7 +33,8 @@
 #define LED_COLOR_ID_MULTI	8	/* For multicolor LEDs */
 #define LED_COLOR_ID_RGB	9	/* For multicolor LEDs that can do arbitrary color,
 					   so this would include RGBW and similar */
-#define LED_COLOR_ID_MAX	10
+#define LED_COLOR_ID_MOONLIGHT	10
+#define LED_COLOR_ID_MAX	11
 
 /* Standard LED functions */
 /* Keyboard LEDs, usually it would be input4::capslock etc. */
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
