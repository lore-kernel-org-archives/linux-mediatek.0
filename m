Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBE7C28B28
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Mar 2025 11:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mxzmWWsaWRiq45r0L/zxKeyJjU9fd3lt4WjlEGIOB28=; b=EAkBr4NsESGeemQducB3lMbYSM
	2/FPBf591qbs00Tx1I5MK1H1a3ZCrkVwjeNc9q57++gH51Ry5yJKhcHqAb6MnFTFJBHEfSyvTXv9n
	gab0vWP2Mdlf6F+h6qFhnZZucjoDL0xSU9jup5eXGSKUC2f6mzPvaf27aRSMkSuj8s7bjT7/tudGX
	gCxiIzw2QEPz7w92LG4ysP72Axqw/veYY2iFYyESVnY/wk7XJ2rIY9x1H+0hKXeGRQ0ld228uquhb
	2zyx54cINnL2HVLouKCCEFXNMLNJm6ss0GvnABcXGEFpYBFBTA21aYsnD8dS94i03qiwy4x5GxWkX
	/2nMKLbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJtE-00000008Ch6-23no;
	Wed, 12 Mar 2025 11:04:44 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJZC-000000088iA-1GZh
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Mar 2025 10:44:03 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so1284704a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Mar 2025 03:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741776241; x=1742381041; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxzmWWsaWRiq45r0L/zxKeyJjU9fd3lt4WjlEGIOB28=;
        b=Eu5ajO95WMUDPf9L0BlqmBC2c/lJ8HiwthivDLX1Y798tK+2L2dvJpk6yAjv4XTQV+
         masCNyddVguZiVA3vQQ9ZXGB3gA1GwWOZETatxZkNoO/zezZKqjwmFFDhyQbo+GRnyws
         ZQQpJ1elcNeO/tyxJfH799eoSNhqlugq56fmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741776241; x=1742381041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxzmWWsaWRiq45r0L/zxKeyJjU9fd3lt4WjlEGIOB28=;
        b=A7ih/cl92zaqG3PZrCXF/0C8V5QvIww7WlzPpwDI1akrUWjbBYRKGbnQbMJcrTAfHP
         8rMBJRUDAq7LJFkcqV7spIRlipRzvpFbZqkCvAdFc7rbOXCURs7q6b/snpvfqzGKL4BR
         ZA8vwV4dovca16po0lWcyLFlisvEFG+7+DRF9P3oCXGOzKZnxBeIU4kNtoqVz6oVLGCE
         H7qMetgkO15dTxSA8c5duZ/yEvFlZSV/K6caSrI0SUDKfTJuvF+I29j33oOwi+lEVla1
         iqwqOYWCMv6EgsA1PXmBNiuePCvKcsGYucA3JEnLhYvr8+W4ZYgyXc0mIUpqbBCpgUKN
         G8IA==
X-Forwarded-Encrypted: i=1; AJvYcCX5kdi9e4kzvS7qTGe2f/5FQawqb6kTEU8nvDibIeMCdO0qsREfrsn0xP/fZXwzLptJKB+8MCz09HbYxS9cLg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZhjyOcnllBhsAi2XS9ZRMlumJ0cDY6i8maGpTyluRuEXIN5vM
	XtDUCTtKI+ypGB0/lmtukmpRtLUJkpH1MsBX4KEL0obn2CHb1ZADziFxMJbE+A==
X-Gm-Gg: ASbGnct4GxJLKrMQx5Bx50aY3HPkBNZDFtJLJ2Cd7BM//2AhTDyJoxNtn5e5GCZXbdj
	nCIDC935LB7a8ksEDYH4grtlpF0qcI0e7zTZ49g0sQgSti5pwsPazJfuCbzEm5IloEJvmz7ZBbm
	Hi3XZswAGZCzyjGih43PgeBIyUB359CXIKkA8kh+pHJKfiQ8xct4HSi2szL/FA42woGJHlvLuKo
	mCYKPJYjIryXWgkEtAVqbpS0+kouDS3QlPrtQTQK6iDH1W+L2r9i0dAQnJIYYPKcfta/YaZ38Vm
	Bfpw9nT/Z6tkjCa9MHoIXtOXpcMGM61U2W/Vh6X5aspkfVvOUQZOVhlL7ya155w=
X-Google-Smtp-Source: AGHT+IFVcVkyWzasFzgLcXK9na9pqX5Q0hBXH6KQUhneK1y88uS9e76oMaG5HptT/l+HGn/E0FP3lQ==
X-Received: by 2002:a17:90b:384a:b0:2ee:9661:eafb with SMTP id 98e67ed59e1d1-30100546828mr9403835a91.12.1741776241373;
        Wed, 12 Mar 2025 03:44:01 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:b5ed:b71c:fb14:a696])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3011926599csm1405675a91.35.2025.03.12.03.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:44:00 -0700 (PDT)
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
Subject: [PATCH 3/8] dt-bindings: arm: mediatek: Add MT8186 Squirtle Chromebooks
Date: Wed, 12 Mar 2025 18:43:37 +0800
Message-ID: <20250312104344.3084425-4-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
In-Reply-To: <20250312104344.3084425-1-wenst@chromium.org>
References: <20250312104344.3084425-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_034402_337106_9791D8CB 
X-CRM114-Status: UNSURE (   9.66  )
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
2.49.0.rc0.332.g42c0ae87b1-goog


