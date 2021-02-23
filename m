Return-Path: <SRS0=4Hoy=HZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBBA6C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Feb 2021 22:36:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DD0E64DF2
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Feb 2021 22:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DD0E64DF2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bhdm/6tRJFk3VRAHGwyUtJiRg240rptZg0uO2bPBhps=; b=uZvucLmVNXRFnUUxgV2nSsx7vO
	r04QeCOs6DKdnD1jeFid7zSUxJEx+1Bda/SsrdYpB/JsZrM4USPYkKpGrvtDrPG6BP+Tjbay8YNp1
	P8lcFDyQnp15OiB68CnbJExmamF3F2m3V+2UVU1M0eBmtDQB8qHVt0WKQjydtSzMQ4CGpcrlOzw/D
	1biDd2yzEl+RNBM+Xa7XhinOKdafLVMu7pgNRDKb9eS4YyKEJB5koPv2RKxrf+kYZMekIIPe1hgc9
	mF2JuzPlqbAq253zLHc+iE7+3uc4jr0sZYgJkiiaGIqx2YxgqDK6mrva++5qHU0HrzH1sZyZNG4Nw
	Z+vVj0Og==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEgI2-0005Cm-JE; Tue, 23 Feb 2021 22:36:22 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEgHy-0005Bp-Rg
 for linux-mediatek@lists.infradead.org; Tue, 23 Feb 2021 22:36:19 +0000
Received: by mail-wm1-x32b.google.com with SMTP id a132so199693wmc.0
 for <linux-mediatek@lists.infradead.org>; Tue, 23 Feb 2021 14:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xWiZLSlx41qOyR+/nqX4T5Ur2XiD0k9DldMS6oYp7uE=;
 b=WcflAq5G527RWIltx4lf9nR42x/Y5RkgvppJAZKdUfAStRIR33E/zkZQDRf7TK2IPm
 GO9JHJKjfcW5hmULQIkvV4D7xobIwGlwaTM2jw6SjfYHuwRPpSmOgo0v27sB/i9jSgiC
 wgnTqTjaHhAIY1VWjhw/Ix5VwpyddRBKVm3THfDH+DJKPjb0oze2ZNMPi/C1ZtVLVyn2
 ycK8oyBCIcPmXXvsTx79RuCvwbZv12M0fO08yb9EzfTgl4dIuHwNuSlwZtgxjXXEZ+Gt
 WX7Pl7qGBHgMs3cCPd1Wr/t6iL5TgKxm4C0M9reopX+Y7KzH3qEOxJtYL8SE+duW539x
 2eEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xWiZLSlx41qOyR+/nqX4T5Ur2XiD0k9DldMS6oYp7uE=;
 b=cP3o2sl7U8lqF/pKQAc1tcmCiaFHEFHM68yRkHCYPmc1Uf9QwdRTdtP4Z5It4vED5I
 dMi/lnUvcj3p06p/NKH7GoxoytQvFvZCWr8wi81wJcbCAS9Ujx+nP7VdYtDe+y22PE1m
 lLjHFoDIFzxejLWOlnf6emdFrW8CehEAWV5sN3gesCKvKTE0RSZISvYDuWxE3+RvinZn
 pc4VcpqgVM9fbNJBuOF13c0cVRSR9pCvb5m0wyB6Hx1PgkZq/5YXF4oRErTNZby7iyQT
 pVOkgE6J9od+59suNbqmcdSAjeDGbZRqVN1SZ3eyVRuCA5A6THj4hvEs8KXzEfeNSFcL
 d7eg==
X-Gm-Message-State: AOAM533gVX88ysvyq3ijBsxvj4MMGbp02/DrzlQJHreolWPfdR/YXu8L
 WrkAZyTsp+fmHB8tBCvbmardXg==
X-Google-Smtp-Source: ABdhPJzh6VL4qyqqFL28vsTeEqLT4ChCA6Pv8ysE1oNxHQHX0SfSIsjrnnzkfz/1qVxF66qxih3o0A==
X-Received: by 2002:a05:600c:3551:: with SMTP id
 i17mr859597wmq.92.1614119777558; 
 Tue, 23 Feb 2021 14:36:17 -0800 (PST)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id l22sm185508wrb.4.2021.02.23.14.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 14:36:17 -0800 (PST)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH] dt-bindings: arm64: dts: mediatek: Add mt8516-pumpkin board
Date: Tue, 23 Feb 2021 23:36:13 +0100
Message-Id: <20210223223613.2085827-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_173618_930979_F9F6ECDF 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, mkorpershoek@baylibre.com,
 linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add binding documentation for the MT8516 Pumpkin board.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 93b3bdf6eaeb..366a753f64ba 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -125,6 +125,10 @@ properties:
               - google,krane-sku176
           - const: google,krane
           - const: mediatek,mt8183
+      - items:
+          - enum:
+              - mediatek,mt8516-pumpkin
+          - const: mediatek,mt8516
 
 additionalProperties: true
 
-- 
2.30.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
