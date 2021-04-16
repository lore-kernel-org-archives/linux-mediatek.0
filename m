Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D4FC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 16:42:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80B6F6115B
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 16:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80B6F6115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LyOJtFpjJVhV1XIxQhliU4sPxliNzjg52B5iN1RyVds=; b=ebO/CHZbO26ngVNm2qbbPi6h7
	tAFQSUDYdufjv+50szdrTQ9I233QlJ+9oBf5p/LB/llC5aH4Y5BpJoy4Exrvh7gjiLgAgi3DKCgVh
	AqU4ymvyqjOeu6s5xu35pl6ZSoN8RJJS1/OUAifMvpRgeya90XjkYXKqpHN15XlBjLqy/C+e/gdS5
	N1hUY95fbElFErcwr6dcRPho7dnfyBHJVhUc7oIQClIGNpp4lTFi9YHBxPMXK85gRnSdH35WL4Vmo
	WVOky09XpV2yuodRdZytaxwlh8SJlxAAbvrirVVtJ2z3vDdjpXKwNL+pK4GVLAeQRliCnrcrHiCF/
	LAhdeiipQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXRXU-002ohx-Vx; Fri, 16 Apr 2021 16:41:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXRWo-002oaA-MJ
 for linux-mediatek@desiato.infradead.org; Fri, 16 Apr 2021 16:41:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=ZVDZygvGe/BTbgHX36KkPxWpUuPl3ozKPcg+zh4rMZA=; b=qgQdOahIYqKFh8YYT4VmuCeSPa
 /oNUVQyWV9owJsCoxdevI8q2uOJ3AtpmJxvlKYqj6OlR6psXwJQ6dQxne7tF+kMvv+m6J9Xdpvd0M
 quqG/k0/Fp6lgEgsRhj15170G1vcvj1H/u/vGY7kgQwM0SWG3G4N3Pw4fmi9Dfqt+JTbv73RjGXpV
 EnCC/PluP0uln46AICp6hHyZ/BtDC5IDiTLSbxI7XXQYZpIJVutN0sGaMqEVjIMXzVMs1k2xnmwUF
 QrbVPTwXuzhwOFRsM4ovOtcZcqyJ2MbB1nMdHYILet6P15wvCiUmMd41v9do0XayQ8JHnlvEJRyLN
 fB3ZsG5g==;
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXRWk-009YxW-Iz
 for linux-mediatek@lists.infradead.org; Fri, 16 Apr 2021 16:41:09 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 nm3-20020a17090b19c3b029014e1bbf6c60so10731825pjb.4
 for <linux-mediatek@lists.infradead.org>; Fri, 16 Apr 2021 09:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZVDZygvGe/BTbgHX36KkPxWpUuPl3ozKPcg+zh4rMZA=;
 b=Nvig65KUvKpow+wTBPeyA/khnqlD15qIiQnV3qYS/y9qDz4KnnjOL+U/FXC2lIbdoP
 OWJsDOvhltqU0DulUucMBkdNyRMTLvjQhd7ofJYgipKQqxhubyFgsFKIJ+5Gn1rrSzEh
 cJ8h1DoPAf3klAiMqPyYoqFAdTbyHe07TTcKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZVDZygvGe/BTbgHX36KkPxWpUuPl3ozKPcg+zh4rMZA=;
 b=eC6qBQqNHkEovNMSkXQiQsJ1xle2TsB/Uyc1GpJFNrynPMnlL1wxu0HU8meQD3fSvu
 nA0RFLz7gtclM8uhSp3y6rPOHUAjeErNqu6L4HeMLSWonfj1P9v/Stpd1hEOHhZJLqQ5
 1IytPQxD2of1TXOC10abXPkgEJN4BxNR6Z2vNl7cGqC8aHzZpOpoUyk2RMRPNGiP61rt
 RWj/tZV3VGpVpbfMFQGXtTeqTQwQGYVDDxZt3yIm1eDUOZHnBWaKxB1L/3YgTFoCTdPI
 PI9b7jdtHY8+RNK7pIfxHMeT2yuQ/OuYhejQEVTaJ9+Dbyg4CkrA1+En9Si43GKZIbwv
 HtUw==
X-Gm-Message-State: AOAM533VG2RPgmFyuWlSLS2sWVmbur1NucmMqyYcZWjnycyGDM/IbGT0
 FEdVdGyXjj3ewGLaX64Qy6EvbrAhl4hp+g==
X-Google-Smtp-Source: ABdhPJzmnutXAiNcBEs3KBG3jPd1KVE0Cce33MdMWJ0S7JVfs4j0DxzkHdFyNoyyBSpthnE/XmyPQg==
X-Received: by 2002:a17:902:6b43:b029:e6:3d73:e9fb with SMTP id
 g3-20020a1709026b43b02900e63d73e9fbmr10588126plt.37.1618591265184; 
 Fri, 16 Apr 2021 09:41:05 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ccd5:218f:365:b90f])
 by smtp.gmail.com with ESMTPSA id g14sm6187186pjh.28.2021.04.16.09.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 09:41:04 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Ben Ho <Ben.Ho@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH v2 4/8] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-kenzo
Date: Sat, 17 Apr 2021 00:40:51 +0800
Message-Id: <20210416164055.3223088-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210416164055.3223088-1-hsinyi@chromium.org>
References: <20210416164055.3223088-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_094106_637194_9B9362DC 
X-CRM114-Status: UNSURE (   9.22  )
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
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 0870490aa350..7afd01aad964 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -137,9 +137,11 @@ properties:
         items:
           - const: google,damu
           - const: mediatek,mt8183
-      - description: Google Juniper (Acer Chromebook Spin 311)
+      - description: Google Juniper (Acer Chromebook Spin 311) / Kenzo (Acer Chromebook 311)
         items:
-          - const: google,juniper-sku16
+          - enum:
+              - google,juniper-sku16
+              - google,juniper-sku17
           - const: google,juniper
           - const: mediatek,mt8183
       - description: Google Kakadu (ASUS Chromebook Detachable CM3)
-- 
2.31.1.368.gbe11c130af-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
