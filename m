Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15005C71136
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jun 2025 08:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJpSSWKODubMWDu6LS8hKhfIs2zxRW9+kSXB6f03nq8=; b=EKCWYWalMiauap3mAHG3S7vWK8
	yxnbkrElNA2lDnQnhJqYwr28OtnfW2LQo6gaVzGSRAmkIqLn1/+/SOmsqja6VV+9UL8OOC//KRGFk
	HKV2bRZDzw/qjIc6FnUB1RIOkKxVU8gI5zq5WeYUHNDbrdAjslq/gEI4ckO9xL9bb9wMlPptOPMqz
	gItfMRBDGOKvFwGBvWa0Ll99Z03jJL2NzWYJlKhfrlaNfdxIQMzHCis9PyxWMFs2SF8cua3JP+oH+
	hD9/mfMirhUY001qbmjGXzylTLscywcQPuEuHZV3F7U3YuHce+tMhcVMzHmsLVBlWCb/iCWmtSqTX
	hZfPu9Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRhK-00000006bYf-3Fgc;
	Tue, 17 Jun 2025 08:29:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRYR-00000006a0c-1tw6
	for linux-mediatek@bombadil.infradead.org;
	Tue, 17 Jun 2025 08:20:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hJpSSWKODubMWDu6LS8hKhfIs2zxRW9+kSXB6f03nq8=; b=avDY61zItlFZuMai8WYkvQe5bY
	RvsCfrsy42Jq9J/U4Lrr7Qsmuer5lWj2mg7ZVyRpEsgpmJiXHdfxpqCCleHh8cnRqVwhISOZAVWYo
	AOygcsmasiAC91MH2+cVVv+NOYrsMollkWbjV2mfCVzMDY9GdNsJiSR3vv7u5Iy6y2wD3doBYdZoK
	jlUyogoyJfC+8QKSbB9wyZq7tViRbRcS5CSd41iHP78PrvIcM6gnGvyanu8Z6QicOaVWGVRs7r/84
	NJj0cCwXwZuWATkJs03LIV3s40zKQjL4bhLDs6lkwsXUrEqgbzXCLX9WVvqC293vJqcCufARqSZX0
	8odajD2w==;
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRYN-00000003k5y-1IjP
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Jun 2025 08:20:27 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b2f645eba5dso4486393a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Jun 2025 01:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750148414; x=1750753214; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJpSSWKODubMWDu6LS8hKhfIs2zxRW9+kSXB6f03nq8=;
        b=TilR68OSfe6QgY1xF8aNci5pe7ze7jh1O5UFUVH2R3g3bDCVm1cqEtPMzNwe4GUpP2
         LBCMorYB6CIkyn7x1fOKiqMHlqZEJ0rfHoPN1lysHAFG3JX8I8f0GCWOjGsOjk5mlxBl
         zZBK4fvUp6lKTWMkEj8SSp1Rhix6RUwtJpkqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750148414; x=1750753214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hJpSSWKODubMWDu6LS8hKhfIs2zxRW9+kSXB6f03nq8=;
        b=gVBMw6qD1PBfTmwP2kMLCY8AYavVXplrCi5QFcLbnFBzS86v9SK41c+NzCMYvAYux1
         FlZvArZ6U0Dk/LKJhAR184XJ6NVDpiAi0Bvsv+Kn4NRXIdQpXUOkibMpPdxYKBAhUAnV
         bMOljtAS9Fs69eowI3r5F2nmz864Alm+fRwxQKhbz6U9oXePurT7flxIfcBLesmQ3UJf
         og+ZIwzTh3eZFKo9Pu+SxU3U4UsYeu+oVmrcpPm1SLKtBxE3W5Y8pE2sTgPEqynYm4RQ
         70ScVJTO31zeY/muj0sCjP7auxYjxmoBHPbx0Ak4Ed/fAlFGvrsPQ0omzdpXUcfsF0xx
         nJOg==
X-Forwarded-Encrypted: i=1; AJvYcCWLoGC+KEnmoXEImdMJ0ahl+H2+B9Wkp+neY0liH6YizeOW9yRwUhoJwjdjt2d/fiFHGJJqB8r6Ufbf4XKAag==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8xaqLWVg62IxWl87zra1+sx3n3fz2lcHZUvlshfCeDcgGFY2B
	cpUrcfHI1sxI+IWddfCBExzE1X1W+OulXJXgzrbBoanhxFYkI3GL8/9zh/dXnhm0KQ==
X-Gm-Gg: ASbGncuQ9EmK3+LahkSe9KQeQbB1ZtmlO7Pol6gtOIggTegjBJdJWdDyaIbKfUByB7a
	6vbAr/tTjAlh0hLFi0lp4IH+39bBOSHF0rxMeqJNi683h9RqGNTaEUHIspmj4WN6jcWknCYoghq
	8zF9OgYDqFFlobE5EsKxL+gyvxiTBsQnlKfcOrEQ8bXArk5XhIkuHSmcbKmj+rTc7fwVBk6pAi3
	VcDb3/MPDAlWFv57ej2EYXFhytAWc7dIs9L5rH9d7HAqqCSXaUXG+7R/CJ6GFLzWjrvH+K4puO0
	Riu6fFG2eCYykRHeIchtkrILeUidgV1SIXbG8Oh4R6AqcBCmkUnQzBWCFDgrBgciJuQZi58cXie
	BmYNbbRvJijac/yY=
X-Google-Smtp-Source: AGHT+IFfpg2r7E+A3hwnVaD8XvFL8a9eXnDD2HrKdh1NTx8ZQ0KD0SKLHARkzMHejSWGfoyIg/Kiig==
X-Received: by 2002:a17:903:4b07:b0:234:b3fb:8ed with SMTP id d9443c01a7336-23691bedec5mr30450435ad.1.1750148414061;
        Tue, 17 Jun 2025 01:20:14 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:24a1:2596:1651:13d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781f7sm74598885ad.110.2025.06.17.01.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 01:20:13 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-input@vger.kernel.org,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Benson Leung <bleung@chromium.org>
Subject: [PATCH v3 2/6] dt-bindings: arm: mediatek: Merge MT8186 Voltorb entries
Date: Tue, 17 Jun 2025 16:19:59 +0800
Message-ID: <20250617082004.1653492-3-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
In-Reply-To: <20250617082004.1653492-1-wenst@chromium.org>
References: <20250617082004.1653492-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_092023_462791_6D3C38A1 
X-CRM114-Status: UNSURE (   9.41  )
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

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Benson Leung <bleung@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Added Rob's ack
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index a7e0a72f6e4c..2032b0b64ba7 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -350,9 +350,6 @@ properties:
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
2.50.0.rc2.692.g299adb8693-goog


