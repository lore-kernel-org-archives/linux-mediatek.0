Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7294C369AB
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Apr 2025 10:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4d0RlzVUiZ/GjheYPmzU3+xaXB4NRkzjoXsemgEHtik=; b=hvYg1EomMvB3LoeEJic7rimHXE
	/UA+EbKQ/XzzDYz1kjH/ES3RYy4aSoVDXJNVEtahzS3cUnbBwBWNcYR7wq2wq9WZn+fmXcWgqFeGb
	OdQA2G1FjHNioKPSWMtXDJxfWGzsX6OpVpRRg6wjYdFQgov1yAbcJb3NGCLHPztS+LN0FVw/xlmiT
	rD9bF/5M0sRLh6LhnEH1l63wRpyLpanic09jFbyMD+GNfb5qUJGNzo4uuzkLJ0vxD2Pq//Rysnb4Q
	lOSCW5OktuCuj3CUZO32Za+/lp1zWKilzBKAG8ylrwcOCGwWKr/89TpTXyHbr7ZvKQwkPpVlydgqG
	fxaJ18Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6oGa-0000000453T-47MI;
	Mon, 21 Apr 2025 10:20:44 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6o9L-0000000446h-2xrP
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Apr 2025 10:13:17 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-223fd89d036so46038845ad.1
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Apr 2025 03:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745230395; x=1745835195; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4d0RlzVUiZ/GjheYPmzU3+xaXB4NRkzjoXsemgEHtik=;
        b=MOkq6fTZzYwuTlHW5vfVdeE5r6bDnFQ8HreY8FLdAX7vMePmth+xjVLGoVC2OhCOV/
         x0MWGnWDq0hy0Rwmiizu9h6Gh9yvVqznvGsueY7tYOoshmxymloC6dx4IMt6gBge412t
         eoEPBnynAXdzmXCI2Rzl+SDiq3DNm1nRlQxWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745230395; x=1745835195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4d0RlzVUiZ/GjheYPmzU3+xaXB4NRkzjoXsemgEHtik=;
        b=oYxV4KcQUyf07vwUt+08FGR4JSoy36YX8lvDXnjHElJy6/18HP3vJ6UiUsBAVWHnOS
         5xQgJhOYNWZSHf4Lnwke5b4fX/YHYQqWOpYXYUn7e7OjD/fWT4z5Mi3C0ykwBbdWA750
         uV2fs8KXsumJMsMnwWJ6loUCo8Y0sl9nbtmM4Vqe2cWC8yYBT/RrsQ5xYvQYnS3QPvCw
         s2HbvzUWObb8mAXRjEgtPPJotcTxZB3vPz7v6zu33FIPFaeyB++5yguybhpRDVQaUdK7
         XInNzXtJZMCjkk6uNKfIye5y/YyPAGGZMhanHM9jZwYTQpCHnuBdrGa+p/ZmFA/h4cG8
         l/9g==
X-Forwarded-Encrypted: i=1; AJvYcCV2kZi6VzAIeLmsBb9yi42dJOC17nZ8qtC4G1SexpUm5AnfAt5YCVc1rho6bl6fjCQNQW65iczjL04UAOKIig==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvuZUSEBrR62Qm/WdQTfLZIKmmmm4UgWyyCHUw0hr0cYjWuK2o
	EeJiQ9VzwTfi8LdCoamg/T0eXxWTuWGuon9Hgco7HKPLOHRh96vjRPqxNhLYxQ==
X-Gm-Gg: ASbGncuSioyxnoJqBcXj8NMLeMNq6+j3U6SKAI1dAifg/soPhM6QEw4fwPiUQ37o1Ih
	ANwLCLZLzz1JpaE7eE7YnwMgbzWaN1Jr2vYOefI64Sx9MxR8DOVqy2YmfdlLsbopI0lkcJE8LQq
	sWIhbq8EHZOAyq3vNE1vHkoSbAQqW7xmEoPGLwer1icstREAO0S1q2HOPDwzQU9jZS9Ip5wPcBC
	6dfkFss+AosmaKIdOUCMm7edaqzl6S/jWUX/5hty3Oi/p3HGk3lI0lmr+DkMd6YQub/rpHapfCV
	G0eiehv9hOWN4OahmLizlGg1BwFocDbPm/sWqNl3oOFB2vrTsxtWKBUX9ww=
X-Google-Smtp-Source: AGHT+IF+AnZFOOLJPlbiAxkDb/YuGPI7JP89xIJch2irCDOD6BFYAkiFyfLLQWgKCePZd7wiHYd+Wg==
X-Received: by 2002:a17:903:3c6b:b0:227:eb61:34b8 with SMTP id d9443c01a7336-22c535a7eecmr173618945ad.25.1745230394801;
        Mon, 21 Apr 2025 03:13:14 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22d78db8b04sm38985205ad.238.2025.04.21.03.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:13:14 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 3/8] dt-bindings: arm: mediatek: Add MT8186 Squirtle Chromebooks
Date: Mon, 21 Apr 2025 18:12:41 +0800
Message-ID: <20250421101248.426929-4-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250421101248.426929-1-wenst@chromium.org>
References: <20250421101248.426929-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_031315_741484_4515873F 
X-CRM114-Status: UNSURE (   9.72  )
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

Add an entry for the MT8186 based Squirtle Chromebooks, also known as the
Acer Chromebook Spin 311 (R724T). The device is a 2-in-1 convertible.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes since v1:
- Added Rob's ack
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 49ddc504c160..f0b4ccd81c4d 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -291,6 +291,10 @@ properties:
           - const: google,steelix-sku196608
           - const: google,steelix
           - const: mediatek,mt8186
+      - description: Google Squirtle (Acer Chromebook Spin 311 (R724T)
+        items:
+          - const: google,squirtle
+          - const: mediatek,mt8186
       - description: Google Starmie (ASUS Chromebook Enterprise CM30 (CM3001))
         items:
           - const: google,starmie-sku0
-- 
2.49.0.805.g082f7c87e0-goog


