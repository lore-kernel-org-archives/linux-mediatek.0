Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2879FC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 07:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qjSrGJN2fiF0B8wMYLpamu/TPAqtCzoJYjovcEHgoOo=; b=ODWOeFc7UAc+sl
	E+Nm6cw7vCuZlQkU/EMvkPigLtUT37PWh2u3ll3+otHj0ER3hlKUBoMxhkiPncvQ/EsY9cxrvWjLW
	BMM0U7Vg8LS6jPSTg73QhsP0ImXHIINGpKAoHuWlaW+4HLWqGLSiXgdGDyB0NqYcRrrf6qEwnPHSx
	VDzq0rAKrVoD2hR9IDmJmYWN1VWT/gJui8a/Ux3l+Xj9CvHNlwDpngJMJeTW27fY0J5c+DlMzlA8Y
	1CFkYaswRvHv2seQffVCUQj6zV2gP5vVtsOybMZIL+yhVjqleyFDmrNd1T9kLnsH66IbTDQAx2jqw
	Mz6gqcstViQGU5VPlyZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwfhn-008435-RI; Mon, 13 Dec 2021 07:25:03 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwfgq-0083cF-Qx
 for linux-mediatek@lists.infradead.org; Mon, 13 Dec 2021 07:24:06 +0000
Received: by mail-pf1-x430.google.com with SMTP id o4so14102129pfp.13
 for <linux-mediatek@lists.infradead.org>; Sun, 12 Dec 2021 23:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fy5k8yE8yDlwkb+GY6CCP2a+YUXQgrQJLC8KuHhbb2Q=;
 b=DATYj17TVReiGSi4E29etVtdvTL/LgWXzBXg+QQgShCOhPUYB77ldyy8p5LzNDxF2K
 8oRNL4xse4F227LB5gF/9BfX3d6B8fvMpUEVMgBiAK3l4fW5EDzi143o6fcAlvKQiZYE
 RENrt1OUbvId/MiH0ZZXZIeZT9KrtTUqeK6gk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fy5k8yE8yDlwkb+GY6CCP2a+YUXQgrQJLC8KuHhbb2Q=;
 b=G8GYv6c0F0oI4LLctIyAPzEco86l8b0tr2aMcRyTSm9vHS/hRkxh2FqNobEh9xecls
 COX61IMIpSOmXck48STndWtRuViNyaXQQeHhTi7ag32L8fNxFomNdL2NPXO21EVg8DOa
 PeLyHNzAsKM/KWKQ5GbZCQZYCHpSYhrWe1Otm1v3/rwNfbAqWoNx5AH1d5zD9UxuPeMT
 F9ugvdetGL3j07ugLgkU9iRHEANQsRKZPM6I1QaAKsogE/6Ymb9YJt56XCsO+y5yj07B
 wDQE2o9b6plnpT6WWlFaGyH4PCWaR2O4Rk6/gpRZE1o9yDiKyci4V/bJzboDUlP90QMC
 TvWw==
X-Gm-Message-State: AOAM530Ieii1DFnQM6xLXCReXOHSm+BVmzusS0tXWj5E01tRuYhidKFF
 y8pFiMmODW6tTvLHV1orFRlb8g==
X-Google-Smtp-Source: ABdhPJz40B9wP5DLwEiavy0VCRvmROM6fMzQxHUEU08Oufmu9UTIfPTBQ0tHm+7PtOf51RtDCwz7wg==
X-Received: by 2002:a63:102:: with SMTP id 2mr304265pgb.311.1639380243478;
 Sun, 12 Dec 2021 23:24:03 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:9447:edff:ad23:1bfc])
 by smtp.gmail.com with ESMTPSA id e7sm11747562pfv.156.2021.12.12.23.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 23:24:03 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-makomo
Date: Mon, 13 Dec 2021 15:23:55 +0800
Message-Id: <20211213072355.4079568-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
In-Reply-To: <20211213072355.4079568-1-hsinyi@chromium.org>
References: <20211213072355.4079568-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_232404_940419_E5584B36 
X-CRM114-Status: UNSURE (   8.23  )
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

Makomo is known as Lenovo 100e Gen 2 Chromebook.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 .../devicetree/bindings/arm/mediatek.yaml          | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 75bb06d1802a08..49e008faaa68a6 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -191,6 +191,20 @@ properties:
               - google,kodama-sku32
           - const: google,kodama
           - const: mediatek,mt8183
+      - description: Google Makomo (Lenovo 100e Gen 2)
+        items:
+          - enum:
+              - const: google,makomo-rev4-sku0
+              - const: google,makomo-rev5-sku0
+              - const: google,makomo
+              - const: mediatek,mt8183
+      - description: Google Makomo (Lenovo 100e Gen 2)
+        items:
+          - enum:
+              - const: google,makomo-rev4-sku1
+              - const: google,makomo-rev5-sku1
+              - const: google,makomo
+              - const: mediatek,mt8183
       - description: Google Willow (Acer Chromebook 311 C722/C722T)
         items:
           - enum:
-- 
2.34.1.173.g76aa8bc2d0-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
