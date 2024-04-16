Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3BEC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 15:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aX1ilvintuq1X3FkJfckvE1w8waUFusQvnh/7DfkGVs=; b=UWNnMTO9TX5ZGCAjozOqCkgig/
	b3d6QpuMWemkeqQe6bPKPA62+WqbQmQSeN4gJ3n8ygo/At1vY4cO5g8SHmewYJ/vK5U9ODSRUmOaV
	JaQjNgnacoeUA08h6pUEU18Q3Pb9J6XGN09puF1DjRENuU1r12uHc/ZB2X9j0ABTwnMYuKd1mO9RE
	iejj9/g6JuciPir3t+4V5125GyyxATvMMG/TW76iwJoM0dBxTMeE9yOE1w2DZsxqEyrsigLWIAi3U
	DRm+w+oiTbnZAdu+8/3WetSWlwBKtn+iZ7tN+97phmZsHIld4BGQ/WJ7OBQ8GZVNjhVf3iQxALSHQ
	xinVBSSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwl7r-0000000CqmH-3Kjd;
	Tue, 16 Apr 2024 15:53:39 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwl7d-0000000CqZh-0q59
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Apr 2024 15:53:26 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a51ddc783e3so574502766b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Apr 2024 08:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713282802; x=1713887602; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aX1ilvintuq1X3FkJfckvE1w8waUFusQvnh/7DfkGVs=;
        b=nqFdP6umoiy2jvUos49jddhDqIGbD+++FJ3QyZq6p1qu2eOzzg/vf6QVu2iZWGNN8b
         oQ+cAYKypBpKFTcbQJXtjntYJhL4eNK6YLLKSnKGqybMNA3kG1bYJuL4HTMCre04wDhq
         Lx5gAyLvZl8tmlgL2OixG6TNNXh66fwjR3okeb7cUKeRWZN1bFt7WBMf9s6mS9zujA6m
         4hmyAr1CTB2Gkj8T1VC1HTEdqbcfkDCMkB2n01k2spNBRV1qF0MTuzzcULZcW1WyCmrV
         oBH1W04J7dMmhyoVdsEr+bVbRA/1PoMyGuOCtx/7wBUKtMdy4Nw5UMhLf9i4iwf+333H
         6qgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713282802; x=1713887602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aX1ilvintuq1X3FkJfckvE1w8waUFusQvnh/7DfkGVs=;
        b=Zv9VhOITBfTQwONJ/hNooyFNikHfVy54gISl+WYvMfBu50nE4VEGJrRxkHNvOcSsPc
         FoOtTVE/ar6chdCJDVXAnRaS5w/BKfz8cNNdUzV7tWqRTmYIGsUEcZWwBbxvAuevT27F
         qyoRTO7XkFoDp8XFF7zJpeKThVh2PPLPYS/DYp6hMaojX4m8aDHRaZbkRLkkKMP5p9fF
         GoMuEJWimxhVJkovKW+gFo1IL2lFuFz8Zdi1AAkfEC7qSt+StsGu9bIHEuDE2k4Va12e
         3S39Ww93cU7fDv5WJRgWwF7adME/bYKk8UFZ82kJq1QXRyjP/nJN1qiaamxH6039IY/x
         RFRg==
X-Forwarded-Encrypted: i=1; AJvYcCW0VodLySwyW8HGV+BVCEBjFEUk8vimXvlvQRH3gzq/0nMVcauJhPqThzYQ3/BrnamgSCClnMMC6sFYrDpONldhLLOaK/Ng8ooxvZgTxDkwLE4U
X-Gm-Message-State: AOJu0Yx3PCS45gGeJEkgfAGDqfVZmJuqC0oI1+rTGphkMje8YeScXpU5
	jL5nXbBEBqx/lFBTtv1TjtWKfnPXOtpM/xHIolABkmz3jOi+emLPMcX3B9ywlq0=
X-Google-Smtp-Source: AGHT+IGLZR+1+7B+BajRfnUQBXS5QfhNiQ5CennwyUtLwKqOcXMGphNr8pxmLBz1gtSdoS6PDtUNMQ==
X-Received: by 2002:a17:907:9283:b0:a52:5b0f:7f92 with SMTP id bw3-20020a170907928300b00a525b0f7f92mr5442353ejc.41.1713282802521;
        Tue, 16 Apr 2024 08:53:22 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d12-20020a170906174c00b00a52567ca1b6sm4156691eje.94.2024.04.16.08.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 08:53:22 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 16 Apr 2024 17:53:04 +0200
Subject: [PATCH v2 03/18] dt-bindings: display: mediatek: color: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v2-3-33ce8864b227@baylibre.com>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
In-Reply-To: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=920; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=R+vzoeOPPnxdZJDMjVfaf9M6El1keSxWf/VPx+5Omwo=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmHp7q2YV8vqOm0I5SpvrTc8kKgMLlApdXdXBoGCm7
 TqzfkeqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZh6e6gAKCRArRkmdfjHURdILD/
 9hTrBDlZ3MFc4Oqcrvu6IW9Wirx17tcVe9M2T8Q+zqdZk66uoY6oQg84TikiL1rAZ38Yr7Ggyt4B2c
 Wdv/6kuu73i6MPG1Xc94NEY/rgNIOBMudlppCXqrhb3PAmTCsiO8BVvIYDA1yHpz422cW7K41DC6OR
 Q9QAI1ZoDogA33x8CDj8/DIC1Hx3NKJii7+M0Ce36onRMyHr3iIz+dBGL5jDu8o4w/eFyoHjulcTdk
 El2ms2ptOT89BNgtESMBqnjAJP6ZEw2Vn/sklWB4JTHbJRmfuwthXqpWHrM0Xk5rnOWjDavj/QJdgY
 RotSfYpY9nZ77+QZBR8BUsfY239Ffkypq3nbnyTNiKqYqOTeITKwGXByCbAtf5/37dS6tY+XYzHLic
 CcjNYcqyazjucw4NdH00VqR6YZfezuQyGGLtClfKYrXwbpgKmoVEHu9PJX0Zf0yWqydjj8fm0OUkDl
 8H7call9IbOaj4Oojq2jFOnnbv0t3qJxeehgNtA8AOUYtkLsqOgTIRB8HK9TaQuaJDctyZa/ekFcWF
 xB1EFzfJQd5oyqR6ezcDj8qGSb66Mw6mFaHb43dlbcdx8ovYl2ywOzMokoC8pbOqTg7kSCoje6sQoj
 vG+yZ6XTUoOe8+TOyY/dmC2QsjVsiRcb+horawiIzt/VflsUQAJi9AU+qgMg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_085325_316606_375D892A 
X-CRM114-Status: UNSURE (   9.57  )
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

Document the display Color on MT8365, which is compatible
with that of the MT8173.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
index b886ca0d89ea..7df786bbad20 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
@@ -40,6 +40,7 @@ properties:
               - mediatek,mt8188-disp-color
               - mediatek,mt8192-disp-color
               - mediatek,mt8195-disp-color
+              - mediatek,mt8365-disp-color
           - const: mediatek,mt8173-disp-color
   reg:
     maxItems: 1

-- 
2.25.1


