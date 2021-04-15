Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05061C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 09:36:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75ECE61153
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 09:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75ECE61153
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i4c2JTq9hqppy/1arvwrWSx+GWeBNs5DqaxLYF7sXnA=; b=mjxHNbXko2blLM9eNSXPWz0ML
	D8ph0nHKIDPM3q9OrkMf56JITVr0hV+9hNUqiUcGZo9YxPieJuImpgoqkc+fdiuT6Jl8I0PRRMGMN
	3eaSOTS0uH7sEVs9/viNSnjkqrU7FY1/1QmHsyc0WfQOtn1c4Fq1Q5iClVWVrFznLpNhH7bMTRNIM
	DhXXzw0zsusLkqApnkiRnvXwKJSVegPlBhwIpoCiIIJPmzRm+gLidh19j0vPKXId4+Wi65xqGNiMy
	DNAEj72UgGfKQf6t4R/o2u3UQGoRzSmidXd1iVGc2dYeKG644Bu1aOAgSPYcW8b9p4+hOQbY+YjJ1
	Kmq2Qrefw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWyQ5-00FXrn-0T; Thu, 15 Apr 2021 09:36:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWyPN-00FXha-31
 for linux-mediatek@desiato.infradead.org; Thu, 15 Apr 2021 09:35:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=8nK9tfz3NVekxo0c4TpGRd2q1g2g0nUPwHfUPo4fv7U=; b=hxEmHJTFWoctfUYm+mL9IuWy9l
 7mOOEz6EMZ6J4LBV5o4VWa/tGfl8iQ2aw4bMCTJrqwxsgQf8OGBBaw+PbUd/ejDKn+4RNpsP9WD3c
 mLfgk5199cjtXL7bC72VLyYsHe0H0HWDUM5fI/Btv5JnZgUnH5/gScGPJY2VFrW53Q+fZEW28HP8e
 dHknmkB7M9F6DjvBb1SWfPWcDZRRqxz5QX3ieA678Odf+n/ilpOfz+2gJi3XaoePBhgretR1UAdJT
 3X4ZHAzTPGMlQNQmKpdlD5hGeyysxCt8T9z41w7FtihX6MuAu8RbopcMDdRsreHahQMcmHqKE0tA2
 4xzhphLA==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWyPK-008Qj3-MU
 for linux-mediatek@lists.infradead.org; Thu, 15 Apr 2021 09:35:31 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so12381755pjv.1
 for <linux-mediatek@lists.infradead.org>; Thu, 15 Apr 2021 02:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8nK9tfz3NVekxo0c4TpGRd2q1g2g0nUPwHfUPo4fv7U=;
 b=d+H0aUou1mmX8YmV9TXJKHFFrAikaPsf0u0BJxftbdF94VgnyL7ojpDzqXFYzTEc7D
 Ttdk9zcoWolsXWeG/UCWTRcFUVyEXC/Hx2CbqXeZjDCFZr42CSPMdKDirRd5GYDl+eDE
 Y/5LjvYRJcB9vdq8c3b4FFTh4I9p/PibiCng4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8nK9tfz3NVekxo0c4TpGRd2q1g2g0nUPwHfUPo4fv7U=;
 b=aMhO0xytjmPGW0KTpGFsAsh7M5iSxv5g1PMYxHe2x9Dnl36XNM78QmNdk5tXur7nrL
 iGRLhp+ivun10jS66TueINDZgT7UDG7sSQWtimFFTot4hrFG3+J0Z2/OEaUlKV2mgwqV
 Yp2q9XC9I0k9gkLEm7BezsIcJZ1teUdbxFIf7eH1g+Plo0Phm3km/Hn5ZEyFH1AEgWD8
 Wdi3M++M5nxJ0vQRIRT9fK0IG7jh9k+A80AFVtwzZs1ubXGcs65O1mv370nlu6RvCTK0
 n2CRx3zOmnuNMxn+BEOw4K3ZGOPjAxtEO88Ad5RLsUJE4CrG4ImtdHracPIgFMx2TnZq
 xnuw==
X-Gm-Message-State: AOAM533psPGShT55bKD+CuGMNWP7fgeujqvDpyeBSeXF09WXeBQtK2+C
 DIM2D3B1Cp1kRNMCiVeelLb0BA==
X-Google-Smtp-Source: ABdhPJz8kFU5VfkPAeCLfeTkC6GhBXLlvbYC5C3lJFMiqzy47wA3ye0Sw2vDePOkEKm9vP1kxREt4A==
X-Received: by 2002:a17:90a:fb4c:: with SMTP id
 iq12mr2869691pjb.121.1618479330163; 
 Thu, 15 Apr 2021 02:35:30 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:6432:a6cb:91d2:5e32])
 by smtp.gmail.com with ESMTPSA id a13sm1849502pgm.43.2021.04.15.02.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 02:35:29 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Ben Ho <Ben.Ho@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH 4/8] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-kenzo
Date: Thu, 15 Apr 2021 17:35:15 +0800
Message-Id: <20210415093519.1920877-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
In-Reply-To: <20210415093519.1920877-1-hsinyi@chromium.org>
References: <20210415093519.1920877-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_023530_754856_AF238351 
X-CRM114-Status: UNSURE (   9.78  )
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

Kenzo is known as Acer Chromebook 311.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 0870490aa350..39e4a99ebb37 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -137,9 +137,11 @@ properties:
         items:
           - const: google,damu
           - const: mediatek,mt8183
-      - description: Google Juniper (Acer Chromebook Spin 311)
+      - description: Google Juniper (Acer Chromebook Spin 311) / Kenzo (Acer Crhomebook 311)
         items:
-          - const: google,juniper-sku16
+          - enum:
+              - google,juniper-sku16
+              - google,juniper-sku17
           - const: google,juniper
           - const: mediatek,mt8183
       - description: Google Kakadu (ASUS Chromebook Detachable CM3)
-- 
2.31.1.295.g9ea45b61b8-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
