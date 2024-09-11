Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1950EE0211
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 07:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8Pj+pRQyOcObx0dXkC3JLTG6/NxMtLXVxQD3egxzOds=; b=fQoG84jg+u3aEJcye8/Ukhg8Jh
	+HC19Hqg8v+Jbw1Wi1nnSye7OFtHkGt9mKxHimtaT5mnNHY06Qa4HO1kiBGgXUOgHPmIMrVVcgxRO
	9s5A+URUWeotswuDtlAfflH01p0N5Ay7lVWPvC2M1/ppA6vuMf0ytmdb/oE6NnjYWQv3zaMvxnnBt
	Kkh8NbnPyheieveK+wnwGHTsH4Yh4rL0kjM0WT7i8BET4qbq53UlqIxHtaLNYZwlq6FNhqwL+eIf+
	4cWUTls3TLlW0eWoTPQa23nhFf8PjnF72+yTeyA2cMA0KBIdEpEUar8SLQkG775d61mM/RS/QnYx3
	T/FLxFLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soHcZ-00000008Oyn-2oHc;
	Wed, 11 Sep 2024 07:18:35 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soHbW-00000008OlL-2RUZ
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 07:17:31 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2054feabfc3so56712565ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Sep 2024 00:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726039049; x=1726643849; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Pj+pRQyOcObx0dXkC3JLTG6/NxMtLXVxQD3egxzOds=;
        b=Nf/qPbsr3TatnCoGYLnrYzfIHk70duw5TooM6ELgpkUz5uQDL819PuvKWdv3M+GlUZ
         T3dt0tkPL9e3p0WmKZtWjuI+SlZ90XgZyNO/eg78849TbagUqT6KZTZSowI+SS6kNQWI
         51EXTkHSHTP+FYGfqjuKi2gjqnZJa2E6JHUgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726039049; x=1726643849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Pj+pRQyOcObx0dXkC3JLTG6/NxMtLXVxQD3egxzOds=;
        b=Kz5kmBT9QYDkI136XUHDEEWO3FPxtCmda0btaMI0xhtHJobVugJRZMqj/yCIjsP+p4
         W97pXLZWKhmbhmx/d9YUdvVX6tFbEtQ0s+S+ZV/it0AWWnZYpT/uzG6fCZ2xiGIm7ToW
         4hh1PsncbzKXFsCz/YYpHchIWG5DAHsvITzKZwtlf/5RK7/lHR0HlJ18jmMcScNtAh7W
         IqZG8qCgfQPvl0ECYUpBr9eycu45aCWvhFKJ91HjtPbV4+MrXmiUXn/R1VT0RHxcGjYP
         Ux/j5/3ParLJgovP+oh2yTTqO9+7WvNqQO6f61SeApoQuGHDfnObqZ1WiXKb08EUHTov
         AUIg==
X-Gm-Message-State: AOJu0Yw3Izo/zzu0ht/8OAEeMFuzXK+/xKnenHkMGAl58AkehqlhiNaP
	fhlmbsF7RWrjBgCaCQYFlbpuZXSzh4v8/WwGDtx897hJLnhPcQ7NSNN9JsNlbNe593LVdcXpcH8
	=
X-Google-Smtp-Source: AGHT+IEdvg+LiDx22bRPbLdVmmCxAltMM/PYLPq8j5rpbVqSjRz/STq7KCphVB+RzOsy9z/eITJ07w==
X-Received: by 2002:a17:903:2287:b0:206:b960:2e97 with SMTP id d9443c01a7336-2074c6aeacfmr52222525ad.45.1726039048871;
        Wed, 11 Sep 2024 00:17:28 -0700 (PDT)
Received: from localhost (117.196.142.34.bc.googleusercontent.com. [34.142.196.117])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-20710ee1f0esm58113905ad.136.2024.09.11.00.17.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 00:17:28 -0700 (PDT)
From: Rohit Agarwal <rohiagar@chromium.org>
To: chunkuang.hu@kernel.org,
	krzk+dt@kernel.org,
	ck.hu@mediatek.com
Cc: linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Rohit Agarwal <rohiagar@chromium.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] dt-bindings: display: mediatek: dpi: Add power domain for MT8195 DP_INTF
Date: Wed, 11 Sep 2024 07:17:21 +0000
Message-ID: <20240911071722.558960-1-rohiagar@chromium.org>
X-Mailer: git-send-email 2.46.0.662.g92d0881bb0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_001730_634405_9593AAA1 
X-CRM114-Status: UNSURE (   8.28  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add power domain binding for MT8195 DP_INTF that resolves the following
error and many more similar ones:

arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dp-intf@1c113000:
power-domains: False schema does not allow [[55, 18]]

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202409102119.AYvaTjUi-lkp@intel.com/
Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>
---
 .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 3a82aec9021c..07acc8a76bfc 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -89,6 +89,7 @@ allOf:
                 - mediatek,mt6795-dpi
                 - mediatek,mt8173-dpi
                 - mediatek,mt8186-dpi
+                - mediatek,mt8195-dp-intf
     then:
       properties:
         power-domains: false
-- 
2.46.0.662.g92d0881bb0-goog


