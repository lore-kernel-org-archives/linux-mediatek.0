Return-Path: <SRS0=VEyR=IR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C371C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Mar 2021 03:53:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C808964E07
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Mar 2021 03:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C808964E07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Vp7vIdoiX7r6WnAtuCfuKvdVAecBv6BuTpj7u5WScl0=; b=GqXNty5GFKHbxSNEKG4ZP6Fwb
	XatzMvOl+xLZBD++JHZS8duH8nueV8IWtG4ox222bDRfICq3KsLx4gOX0gpQ0xRou8nf5VMCFAnTg
	yHRh8SFML69179Z6cpd5vXPZpoyaYDyIATFKy3KZGG+PBOZN/AAuO3f9TZkxG+tQt+DLKB2CWoN+K
	ONWTFNmQSIdEunN8fj8/dzq6fIiul6JYaKBMHzMd82V63pnxfnk1aPS32hKCdnIuCoLUhZGq2gZOO
	a9QN2wxqKeYu37cRrYQ+qhV8PKTvOJvR2sp8jnGtdAlCIsfwnopUi/0j0KnzaaOwJMpoadKSzVeRz
	7TrJ5umlg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lN6CE-006Qdl-0N; Fri, 19 Mar 2021 03:53:10 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lN6By-006QZl-AI
 for linux-mediatek@lists.infradead.org; Fri, 19 Mar 2021 03:52:58 +0000
Received: by mail-pl1-x62f.google.com with SMTP id o2so2328158plg.1
 for <linux-mediatek@lists.infradead.org>; Thu, 18 Mar 2021 20:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XWzvtynt4AJ0reH53LsMfKbeHPtq+LLFpJ8/+IuTPMQ=;
 b=nJLN2WFsjtFQiWof4oNy+YxyihydLBWh4qwNOFnf0aIcJrJ0xCH6+zVC7NeBulyggI
 +X2SvdDoMQ+zMZRCaYz0TncglBGpSInS2B0WLL7DsDtk53+aAZEbySJxUGrcw5CajT3K
 pp1cNAmDgcE2zRMNEqneCiVjMrrqB48MAd0u4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XWzvtynt4AJ0reH53LsMfKbeHPtq+LLFpJ8/+IuTPMQ=;
 b=kDJyNuIacT6KhktYtQvHDYg6NrfdqWc+NG5NzCWkIqQal4MqVf+BHMCJ/b1Viz+6BY
 OxAyUXs33q+sPcJWCFLa0bn2/D+UW4fdTlizNu7328u5zLu6Mjv10k6u/Mrr/O7T2YsP
 xsgYO+nGYphl+FWMRkkDdBXBGwdAZVyqLdeE3LJ4HUj+nXrcODidQW5KO5pS+O3M/vCS
 10pIWqtofV9U4twy3hq/T8CMiq1vijYxLeDjKCZq8dOl0P5xOjXq+pExl1/odlhjsa0P
 xlyB4V7WnwFLC+r+z4BBY4DGccZDoGpmoCowail3IySvxTyUx3bq3nUwP+ZggpNfnYY5
 W6qw==
X-Gm-Message-State: AOAM532ovQ9s7RKoZ7QPssbAXuWB1Qh10bHUODBYh/nwnhaYi96bcZOk
 Rmlh2vfukG9aOOE/tTil4Ogwlw==
X-Google-Smtp-Source: ABdhPJyfoXCl7+WogHp7CN5EAeytEsyWX0kmezgZb4+wADsb3Co6x3FsZ9/Tn07f6CTgw8724PT5yw==
X-Received: by 2002:a17:90a:db01:: with SMTP id
 g1mr7755704pjv.127.1616125972878; 
 Thu, 18 Mar 2021 20:52:52 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e12f:5c36:14f:bbf5])
 by smtp.gmail.com with ESMTPSA id u66sm3442180pfu.186.2021.03.18.20.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 20:52:52 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Ben Ho <Ben.Ho@mediatek.com>
Subject: [PATCH v4 2/4] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-juniper
Date: Fri, 19 Mar 2021 11:52:43 +0800
Message-Id: <20210319035245.2751911-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210319035245.2751911-1-hsinyi@chromium.org>
References: <20210319035245.2751911-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_035257_054275_8C812A77 
X-CRM114-Status: UNSURE (   9.31  )
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

mt8183-kukui-jacuzzi-juniper board also known as Acer Chromebook Spin 311,
using mediatek mt8183 SoC.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index a86716cdd408..edee2c3f8620 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -129,6 +129,11 @@ properties:
         items:
           - const: google,damu
           - const: mediatek,mt8183
+      - description: Google Juniper (Acer Chromebook Spin 311)
+        items:
+          - const: google,juniper-sku16
+          - const: google,juniper
+          - const: mediatek,mt8183
 
 additionalProperties: true
 
-- 
2.31.0.rc2.261.g7f71774620-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
