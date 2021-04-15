Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10B6CC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 09:35:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D6316113B
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 09:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D6316113B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8WfX8WA5nFPwjGNBpdys8YOcs573XGri+RYxzpdofBc=; b=j6koww3ZpIZQYMa9vM4cP/rqbu
	5Htn4PWxfnb3NbbVG8P8vDX4Lq+LqTu5dCx6n+VGY8x04pkB9wv0UlQ1HUGcVly6JN4K1ZfukGnpP
	/XCQt5R6g/tPrYVZisM1hLzjkgEr1/fnwmcbNOB9L2AwaavXjPCnSqS4Gv61htw+N5DLLeMJROuyr
	AcMd9yxJcfTqYXMHFqdaI1KReVTK16pBRalAq/+uo6QzYB0B+L4iSrq6nmtzvjymAW0rL5vUL/jxQ
	Mu27KTDmUiwZyO/aHksOP+KiylYsB2B3f78a3eVYTReQCryLc3FBEiHCuhWyTeoChZXZ4blWi62rv
	joSh4B7g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWyPL-00FXhM-Fk; Thu, 15 Apr 2021 09:35:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWyPI-00FXgf-PV
 for linux-mediatek@desiato.infradead.org; Thu, 15 Apr 2021 09:35:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=ZyoS2ZBG8ahkdIChoIs4gLo+docOh48ixE/wuajUrXs=; b=ucbZv7yD7DJD/jdFS9R8/kIPjG
 Q0BkoaUHLFh/aUSS1PnTQuZhnjl/Zi7KvBpfMKvFwNUWgKbwcQOWi1WEh17tkFMLxa92joVUxWO7I
 Ozqsz33uyBCdIk1eprT/o1DXmLiOckbPJN2fo+tpc9TDSegct0dEP4dcJW7fOnt3sUrbg/ElFgQKe
 X7a3Fe0jLw36nO9dqkMj4doDZnqmiP9EokTN2dZ45HbHgOmaODPrbY/Kq9KcK2Joq0tJ23JJEuUcG
 SaflYsMEF10k3uzs9HVtt3RgdYIIyFODeVuvGBBwsztvZEpkTJBV+ACOhySbZJ56oaglA5HYB9O2F
 Nsb49XQg==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWyPG-008Qh5-85
 for linux-mediatek@lists.infradead.org; Thu, 15 Apr 2021 09:35:27 +0000
Received: by mail-pl1-x632.google.com with SMTP id t22so11412225ply.1
 for <linux-mediatek@lists.infradead.org>; Thu, 15 Apr 2021 02:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZyoS2ZBG8ahkdIChoIs4gLo+docOh48ixE/wuajUrXs=;
 b=f/a4F6+veKHqWHp3c65ip8d8mqjOeh1lEQsyDOeZ41/LakIrgaBTP0ZEpSOZI+0IHa
 U45srKBFRuBlw3G3tZBKwEWpf7UaGNR128ZdAI8wOQcSbqeVkperNDE4dLoYdM51j5Oo
 SuhWzy7wph4un1f2SuhtgO1Ryige3CWzWEUd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZyoS2ZBG8ahkdIChoIs4gLo+docOh48ixE/wuajUrXs=;
 b=SrQEckP7WWfVWyhihIdjMCT2+cphkCfXQdIDnAIsAGsi7AeAOm+zOKNl43CL9HROK3
 S6+gOoFMVjanhs2NrUW6DGIyYUlRCRIJ3dxYIKZWMqdwTNog+R/lbekPV7P2O6//DAed
 hNCRWJ0Zzyq6FLIbHD19x9zrOfLeKbzB5oPd8QFefnLXVA+4JKt/bPHw22Ed+2cUPROd
 O+ERGgYrLklCCNg2OoCJuDWoOUEDKMYk8TbmWbZfKp2qaEXX42gXnSge8DqpN1IeA7fV
 xvlp8n+YLi95RfGRZ+vj1hqlT7Pg8PhmQO+1jWRfIpLHQPC1hYsWoVDvyZ1m+jnB/g+m
 lhyw==
X-Gm-Message-State: AOAM532y2Ex/XtwxNIzkuu/4RJRGdE/82hAqWx+A+2/4ANS0v9zr4BRo
 Ae5O4OgMmHtgKRRXybGcFJp0mw==
X-Google-Smtp-Source: ABdhPJxIL1LMg/3+/Ru1IretOlvAMNJ2751PLJGu15xRh8Lu3qBxQXABg4DLvO8WkYRUIxl8Mr8qQw==
X-Received: by 2002:a17:90a:5806:: with SMTP id
 h6mr2844408pji.17.1618479324339; 
 Thu, 15 Apr 2021 02:35:24 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:6432:a6cb:91d2:5e32])
 by smtp.gmail.com with ESMTPSA id a13sm1849502pgm.43.2021.04.15.02.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 02:35:24 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Ben Ho <Ben.Ho@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH 1/8] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-kappa
Date: Thu, 15 Apr 2021 17:35:12 +0800
Message-Id: <20210415093519.1920877-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_023526_304724_148F82F8 
X-CRM114-Status: UNSURE (   8.14  )
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

Kappa is known as HP Chromebook 11a.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index aff57a8c8c30..81b86b189a8d 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -144,6 +144,10 @@ properties:
           - const: google,kakadu-rev2
           - const: google,kakadu
           - const: mediatek,mt8183
+      - description: Google Kappa (HP Chromebook 11a)
+        items:
+          - const: google,kappa
+          - const: mediatek,mt8183
       - description: Google Kodama (Lenovo 10e Chromebook Tablet)
         items:
           - enum:
-- 
2.31.1.295.g9ea45b61b8-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
