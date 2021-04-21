Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E6AC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 09:08:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E242361444
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 09:08:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E242361444
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TBcridjXfvnHBO+viFmW3hMnljh4qt2H2BS1Gc5DsOo=; b=HbANGGscRcJiZcmw30+6ogPVc
	tuRGwCCewT9OnAJnzNh6cySsXnTjkpNL9sxGt/XazxrkK4Y3pwc6jSvavACF/w3/GbMyBVvgeL64H
	RiZmTDq3Kaot4wspEMXoQLxTGAkd9S7R3WcG6V31j8upLPZJNM/LBNv9cIzI1dI9RJe69DNIIq3DS
	GpRJ+1bMN9kG5vqazBZlEVxOm2SV0F2rXAeGHHnLK/uWoFx1iU12wUEF0d58Upt+Frdqxf3SF2czj
	HIeLLGx/8CeRHU7NFj7Vl2zae3jaXfPfuiGMslyOBrJHaWMbj1IzInX9udggmWL0vYsRTABcsQLI5
	DWVIgseSQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZ8qF-00E3N6-LK; Wed, 21 Apr 2021 09:08:15 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ8oJ-00E2w5-WA
 for linux-mediatek@desiato.infradead.org; Wed, 21 Apr 2021 09:06:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=zLcreJQkIC8DjiQ1Nd/plIursk6C1otcEwiKu83irPY=; b=m/MLpTktumIF2ZZYYgjGtezAnY
 VS7TxGqPrElCsQIcZNu+BuKF5FwLDY6x5O9Wn+N9knwKV4oLJKVZg5C86AQhSwXvX1J659N/c+24+
 2WdZMxA4layEzxHjtWpIAfWHmbubaQg1YbooLcUWBgEHmdlh+Kr7ED0r917LFPsWpo1NH0T9CPSL2
 uqOeaStQtxYMpDQbxERPKnFaoDy5TRVngsF9utJUT/EpmmFholVp0Rqhq7ZiqK7eilAPbxr0oaJj7
 kDhZCqEDroKcqr637uqmaB7ysYXx3qm570hzq7nkTioEZav3Ob6Bgah8y0e23p2+GSeeHK8XwyN50
 RkasIwXg==;
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ8oE-00CjdF-92
 for linux-mediatek@lists.infradead.org; Wed, 21 Apr 2021 09:06:14 +0000
Received: by mail-pf1-x433.google.com with SMTP id p67so23190960pfp.10
 for <linux-mediatek@lists.infradead.org>; Wed, 21 Apr 2021 02:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zLcreJQkIC8DjiQ1Nd/plIursk6C1otcEwiKu83irPY=;
 b=NrvwVVUSvqFZOe7U+6IHznARiMOjHNCkPxGv0hGC+S918iTaSvD2Ay0scKJDdHS4Kj
 /OWnDMLqWWaX/DTC6AbIltqvdiM7BUi4rpJP8eo7M/Tqx1FB3ZdQxPIxYwliUIRC9nk3
 HcphIHiL3APfeLhM9vugGWY4jNTDqxTYRGGyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zLcreJQkIC8DjiQ1Nd/plIursk6C1otcEwiKu83irPY=;
 b=DZNdzCXNyiKefntjuh1gx4XmPO6GtOH9CnLyvmHr8tLV3xCpmcRu5RMzc84yaQhqF+
 54XhCvV3mGBXlamtVUOqFPBeRuVVqftz+K8ekw6LOgffqA0FUAGzKAgoeomf8h7DAfl5
 9megPLjCoJQOvj9NFsmsgMeYP6oC76KZCGSy755iCVYJgy5jlcVrifef5Na7IX+aPh2u
 aJ5RkYuD6HO0BNlzFIXje3BKtXTIAELbo5jJwrniWNK63D351tVKZRBukwQc6H2UvUaZ
 9f7LkmxWLJgjLUpiooyYX3a0BSdfDA2QifV9F7YCaDWbii2p7n27LKtZIAJcowzStx2/
 kpIQ==
X-Gm-Message-State: AOAM533NH+L603c7wiGF9r8UzTaXxtpMY0qPv4vPlK/ajta5mHYEqX4h
 rNgGLRnaUBWorluam2Nsl9I//Q==
X-Google-Smtp-Source: ABdhPJyH1F9Wkud4nTiavYJ2OnYVvr6eIZcxRlWfStBQypVqAeVa3RfXKug08+KoKT2h/zqbdhO72A==
X-Received: by 2002:a62:2cce:0:b029:21d:97da:833e with SMTP id
 s197-20020a622cce0000b029021d97da833emr28417006pfs.40.1618995969448; 
 Wed, 21 Apr 2021 02:06:09 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:60c1:887e:ac53:9b5c])
 by smtp.gmail.com with ESMTPSA id jx20sm1495889pjb.41.2021.04.21.02.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 02:06:09 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Ben Ho <Ben.Ho@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH v3 02/10] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-willow
Date: Wed, 21 Apr 2021 17:05:53 +0800
Message-Id: <20210421090601.730744-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210421090601.730744-1-hsinyi@chromium.org>
References: <20210421090601.730744-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_020610_334856_D59A7153 
X-CRM114-Status: UNSURE (   8.85  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Willow is known as Acer Chromebook 311 (C722/C722T).

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 81b86b189a8d..96c401597bd8 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -157,6 +157,13 @@ properties:
               - google,kodama-sku32
           - const: google,kodama
           - const: mediatek,mt8183
+      - description: Google Willow (Acer Chromebook 311 C722/C722T)
+        items:
+          - enum:
+              - google,willow-sku0
+              - google,willow-sku1
+          - const: google,willow
+          - const: mediatek,mt8183
       - items:
           - enum:
               - mediatek,mt8183-pumpkin
-- 
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
