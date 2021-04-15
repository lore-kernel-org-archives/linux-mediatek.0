Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C81EDC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 09:36:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 413ED6113B
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 09:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 413ED6113B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PH0mmaBPKWCQFxi+cYbG3/YxQW6+4sUWE2EvFVqvhlg=; b=Z9D0zyW4QZH1ld9strmXRKgf/
	s890EIzFf6nwJKZtjUmWrpPwKxmP3CgcuZUNm5T10qZOAAD//wmHCfp14ZAU5qrAeyBFH5lDZmSlv
	1jfw6Ge30jyvE9HDsGABFRfw5Zt1wO+TtwkDYf7TejlJMd0F+jMLiZelyNx4pkkyaIn88YwqXg7L+
	vd8wHYNugLoGKs41Byvva+5m8ifX1hDb4jX97q//HlZP2pW3A/CPQo4Gu1G8wVbJT4hjFkdjfNG9G
	Wf46DlIFiDKfqk03rsDo3z6IZ2m+iRm5z1nCdjaeCw4DZrEGmRcYfGGQAU8oJNqgCFcrnJfzpP7rk
	NLdZgfymA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWyPi-00FXlt-4Z; Thu, 15 Apr 2021 09:35:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWyPJ-00FXgi-Uc
 for linux-mediatek@desiato.infradead.org; Thu, 15 Apr 2021 09:35:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=xu1g0DrI9LJa2kS8BINPf/ZvT/OZnLUEWclCoz5qqF0=; b=dDrrjlfUrUb1rzLa0Xi5H8susE
 A4Xgwt7EeFZjAIL9Koju+rGh7dStuH/hkt2CIQb5uPe0n4R1OWBkTzEAWApFVtJW2FCOv/CODuzww
 0vRqRkXkjfi0eY/wGsp0dsclRljBwGoeC8pNWRsvrrYWZ/SeG2jw5KbshLqM7i8agTzhjv18BhIe/
 f9huifvB9FZf4y9j6v3ASQ+VwPL1RvLn3bPr4xhKZFKShd8x7XIlAMWkEbAhH2/1hHT4rcCG5YNiB
 XS3yLRmuEm4dM4uMNKEtugmzXsiCw23gnoF9z4aKoNwVWlrV2cpTba2D4SPdm/2mTVnWqC5rTTlqr
 /r3pA1zg==;
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWyPH-008QhX-EV
 for linux-mediatek@lists.infradead.org; Thu, 15 Apr 2021 09:35:28 +0000
Received: by mail-pf1-x430.google.com with SMTP id a85so15244086pfa.0
 for <linux-mediatek@lists.infradead.org>; Thu, 15 Apr 2021 02:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xu1g0DrI9LJa2kS8BINPf/ZvT/OZnLUEWclCoz5qqF0=;
 b=blT9RXOZKFYnIi7je/or3L0tNwJe6lh95mzApIRr8It2+ZZMTzYHs316gZz9Yxaxp2
 kLL1nlMGtX3oubf63tj3PI+f+Y9lSbnMISXQUicRFs7KZlJZEAiycZZIDhuqyNC5Jlga
 FJYrxLetHLeBxn25y/I5eIFtcyP91XqvHV1jQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xu1g0DrI9LJa2kS8BINPf/ZvT/OZnLUEWclCoz5qqF0=;
 b=MXOMKyEXIbgupIQR/5sCPYjNNZIMQwJ8wQ3S+f7TmqNb1fwdeXcTVbS01UGGqrQK/w
 bVBV56vfC6r6qqYHbFXJH2h+Fw7ZXQn9RnYmWW0GIA85nK8RytFBd+tAhZVwVKrcVKtc
 WA9h1P/J9za/H2c1CnLBOxcYecP5T7biK04wT0swSyMtEMtY66GR+vyMzlIy5cPee6c0
 RksxVOGnDfUTqrqHNrool3lVog3CO42ZHlXgLhNVaI1WH35CwbOgxxyRxRSAcpvlX1kl
 uFL0hzVpSuB1CYWuHCEpSd4RKkhPRDQFSM553eQzn2I6AZQR5XBayKESP3qDtFk0QGHG
 HQLw==
X-Gm-Message-State: AOAM531SJBA3eIa0FwgJcX8RkbKdbh/CWFQSdzpNcIc8BCFzJVRuKIr9
 Qi4jCpUNWrQhL1cBrwRaKMCq4A==
X-Google-Smtp-Source: ABdhPJwBsLfLN3ng+D52RhMEcqV4qApLtFAf+1PjbHX87Zk1naeywUoQLBfR6alZ9YijRGgI8yYXZA==
X-Received: by 2002:aa7:950d:0:b029:244:4dd5:cd0a with SMTP id
 b13-20020aa7950d0000b02902444dd5cd0amr2335784pfp.59.1618479326295; 
 Thu, 15 Apr 2021 02:35:26 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:6432:a6cb:91d2:5e32])
 by smtp.gmail.com with ESMTPSA id a13sm1849502pgm.43.2021.04.15.02.35.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 02:35:25 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Ben Ho <Ben.Ho@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH 2/8] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-willow
Date: Thu, 15 Apr 2021 17:35:13 +0800
Message-Id: <20210415093519.1920877-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
In-Reply-To: <20210415093519.1920877-1-hsinyi@chromium.org>
References: <20210415093519.1920877-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_023527_501425_40359BC5 
X-CRM114-Status: UNSURE (   8.83  )
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
2.31.1.295.g9ea45b61b8-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
