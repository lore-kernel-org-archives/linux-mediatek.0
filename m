Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236DAC369AB
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Apr 2025 10:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sTVdf/HTR/Pq03sjtrVZQf/ywmAoP72Oaa16LKk/YT0=; b=DswjTXaR9/eE2veXX60Unvssh5
	g7j8fe4ibWfdzmVG2v9st3irg3zr0/z7uJ5Np+CcXz142PTTuTrnAPGS7igrqzpW3OjRwHxfiELbG
	tjVImQQTDmNlMjTCzHP9v3q0vmYIOIlcAUz/sEZ1u989v9QkozTEPXeH5jYNqDRNZBgN5LHPnB8aj
	zIklN3gsYJLDutnziijJ67lzoD0lBCffLaSs6qQ74UUxnHy10uL5zvLjksQAHXJzagZs4IN1whMBr
	Dnvv88Wq5mZSyQAvBYwn6RjrnrynqN8VAoOnNvucPhlwnRx/Q2lHCeY9HNFHZD0tmdkpzRSk6AiWP
	cMOFtq0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6oEl-000000044sE-06mx;
	Mon, 21 Apr 2025 10:18:51 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6o9I-0000000445l-3F5E
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Apr 2025 10:13:13 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-22401f4d35aso41611465ad.2
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Apr 2025 03:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745230392; x=1745835192; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sTVdf/HTR/Pq03sjtrVZQf/ywmAoP72Oaa16LKk/YT0=;
        b=GEHclYAJhzLf2h4sKixQWOO1bhvViSYjna2CTegsy6pDLmNhydSKClkglFU+GaAdxx
         YvcxVbdwmjwTEBJTr6wN1xp/U40sDYvTIXGAd+sfw9NdbwLEazg/MLWczNNjSMdduuG+
         LXFblYf1GVD8l2zZGrucrncceQ2OfBMVwfVUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745230392; x=1745835192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sTVdf/HTR/Pq03sjtrVZQf/ywmAoP72Oaa16LKk/YT0=;
        b=sNAp0kM2r0iNL3hGne0GjYwO4rhZ2ewxQpgPMcEX9ezTad1rbQoFt689Md6FCzU0cO
         G0Er9cr5dWml6W7fryag2OQEzyFKtDLl3bURaZ9XTev8yVyUBiWG8OBOW7a5ciespxY/
         dZ/ya8j3YFOMgv80VEMNoTRblJbfpVV9V7JOQiIFPqqZTfJThwVr78aNz9m0X/QQIe5T
         jy6yf5xwv54NPeMyRLoJvR3AH9VjPGJx60Z186Txmdcx3UTWnzzhm9BA3hkRyoJpM9a7
         7w7JRz+AXytzII2ulHIWz9FI8OlE8Jj4y/yOuWOPoUD+SMend7psduaKK5asUHBahc6F
         8Utg==
X-Forwarded-Encrypted: i=1; AJvYcCWme1jCKCpf59iuZ+D15ifaXYWKsGRkRbS24MIOUNhEFWVXqmmLR+LgFaLLNdFdeYyjsqwMIl6nVjm31zwyhA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx39kOp0rjIQMP4gsH8FbIsPA95zGoc8E//YKg6xK7Z5Ox/QGc
	SLDqXZ6ZTria9Sbc9+PSBcfqeT3ji2W0oGSHmhNSvk8eAR/ArC86JQFjb8bObA==
X-Gm-Gg: ASbGnctoORXiE1uF08DVOg67Im/KhfEy7EsZw2rUJ2iC7ycBRfAkH/xxsGMvt/ffUX+
	TofI808jyhEVk9nahiHdNTGkmU6ca5RBSVrJsCvvFNQQXEUE9nwqmij3A3VyfgzvqOew1eI+G/p
	vWlN3sZg96XwZXu/RWvU08kUTzA2ZRrD7d4jd+hRwV3JHN/hpNgkqNidmC/NTPYD0BKDouxquhC
	LV5JlONExmW7biBWl/LdEvrURAf1bZu+eISS/BYz+jGkBlmVuEmR6Xge3ZF2bKeAa+mYq9d/Zc9
	EILDtKNaLRU2MBKPZtAWdVqNtve10q7zhnPSkIdjwSPG9uQMY3DmCBPvXeU=
X-Google-Smtp-Source: AGHT+IEzP8P3BuI4W7WctpJECwx8nzR8w2GBK/ppnOU1J4/hN4o5Y1Q6ZPLjik3RIkoMMrSDGxWajA==
X-Received: by 2002:a17:903:19eb:b0:223:5e56:a1ce with SMTP id d9443c01a7336-22c536063e3mr184062165ad.32.1745230391767;
        Mon, 21 Apr 2025 03:13:11 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22d78db8b04sm38985205ad.238.2025.04.21.03.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:13:11 -0700 (PDT)
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
Subject: [PATCH v2 2/8] dt-bindings: arm: mediatek: Merge MT8186 Voltorb entries
Date: Mon, 21 Apr 2025 18:12:40 +0800
Message-ID: <20250421101248.426929-3-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250421101248.426929-1-wenst@chromium.org>
References: <20250421101248.426929-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_031312_803662_40361E51 
X-CRM114-Status: UNSURE (   9.42  )
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

There are only two different SKUs of Voltorb, and the only difference
between them is whether a touchscreen is present or not. This can be
detected by a simple I2C transfer to the address, instead of having
separate compatible strings and device trees.

Drop the SKU-specific compatible strings and just keep the generic
"google,voltorb" one.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes since v1:
- Added Rob's ack
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 108ae5e0185d..49ddc504c160 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -339,9 +339,6 @@ properties:
           - const: mediatek,mt8186
       - description: Google Voltorb (Acer Chromebook 311 C723/C732T)
         items:
-          - enum:
-              - google,voltorb-sku589824
-              - google,voltorb-sku589825
           - const: google,voltorb
           - const: mediatek,mt8186
       - items:
-- 
2.49.0.805.g082f7c87e0-goog


