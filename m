Return-Path: <SRS0=Og7P=FG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21E91C64E8A
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Dec 2020 10:47:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7E0B2222F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Dec 2020 10:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7E0B2222F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGqcDbcSG3rhE6AF0723bXWZFiblpOKwjgNDNUBzdSI=; b=WONf/e4HUG6mpxhlktL7SrTsNV
	Kpzivcvmy9ZEhhFE/ReDnfQQo/sGmxUMc2MuBtKaAJupBW2ue0nTa0gPo5z7np8FJk2FEd2vFiZ2E
	iIQU4xVsKa1dY0ev5up1aglDUxN2Pn62aVt8WLxsqbmBsru9+TVlEJ+p6DyE30sC8uYlfvW/5zGI5
	P496/zdUrAtuZ6pgA3OmHkduHIF661Xc2lMMEdHngTndrSrq+oE5b3Pz5IPdMT7174LMcCqH1Fw1n
	XgkpeyO2bVzR3xNRdNAdsV4Lp4NuYPsdIE/8EDsNeeVxirHOrUyjMTqJ2gzAsIYsvTI0OGfqbqFyP
	owgjU7+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkPfV-0006Vv-HX; Wed, 02 Dec 2020 10:47:29 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkPfE-0006Ny-HF; Wed, 02 Dec 2020 10:47:13 +0000
Received: by mail-pg1-x543.google.com with SMTP id e23so828587pgk.12;
 Wed, 02 Dec 2020 02:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=S08RLDHwV3/dF7+XO13dHwF7/fsUpwvF4WzmBuKer30=;
 b=aciiHc72jqq8XQ+Q0YVw9dIM/ys8K2Pzi0MCbGxcy759pmCxb917oUBJlciBulnElj
 QcTJqHL1hjszzyI+RfvqAG8DPVJ69alEWwVHuMWMUwvlzzn4BtVavYj5IjhIdAzBI604
 4b2UtcgMMEKvcHIAWrfK6wHQFXqey9SXCzAeFDZrr9tjlcje0tZEAAPMywoEp/UY7gwm
 SORP3Q+ZLx/JhZ93fDSaDvRG8eaCYcxnzZ4uRMbLAWXt9Nmmd98lw4kdS8QExO5cGm9S
 s1udav6Ngb14Xf73odPLxlC0h9Igzu3a6wxa68myfqhvEgpdNWJ159Hz34xh09uggDMj
 eMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=S08RLDHwV3/dF7+XO13dHwF7/fsUpwvF4WzmBuKer30=;
 b=BaT6swhCzkL17EjTOmYFGVEpgEXfUcFTAtM3MDBHOmDWv5Lga4OtSuo45w1aFIucmh
 uzr7yh/j/c5dRJ+Gf5s1nlOAT2hpoRFM2d45u0ZQqLsEVZbuEpQ2213WU75WCWoLD07o
 CfcSRWvxU1JLXLDE9LVifNmm9+nirBK44rZltDlrwSYcC+uxtPJyVI7CwlBjF3Dnqaz2
 3LAgWp+jZaZuBDBP49dDOP1bWbkbAefHVUCLXhngD8fIcgNdIFqXreVrER/X5i8QDuF7
 AOrB8zS19m7ymHQh8PRTdxjsBK4IR1D0C1RTkeq/D604ki2xW/RkNMwWJIFbNp150UtF
 eaHw==
X-Gm-Message-State: AOAM5320aSQNhVzI8jcgADV0QzVB9HPa7j7FoxifrCHZHsCrNsV9bzxU
 dRKp9+dwqtlZJult4FKJ87U=
X-Google-Smtp-Source: ABdhPJxHXKcGzMzqQaAgF8Vi7ulrYj4m6vrcieyqHrgNSrGzEuoK+vN8FEATbJfXGvam6Cfw61NCZA==
X-Received: by 2002:a63:1a02:: with SMTP id a2mr2041901pga.359.1606906030231; 
 Wed, 02 Dec 2020 02:47:10 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:561:5929:abfa:5e69:aaf7:6f59])
 by smtp.gmail.com with ESMTPSA id e14sm1648109pjt.17.2020.12.02.02.47.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Dec 2020 02:47:09 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH v11 3/5] dt-bindings: leds: Add LED_FUNCTION_MOONLIGHT
 definitions
Date: Wed,  2 Dec 2020 18:46:49 +0800
Message-Id: <1606906011-25633-4-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606906011-25633-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1606906011-25633-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_054712_640326_29DFF012 
X-CRM114-Status: GOOD (  12.55  )
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
