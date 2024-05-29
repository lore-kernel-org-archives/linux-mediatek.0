Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95F9C25B7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 05:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=py0GeonwgnNaknxyxyM/bPk5f/ta2UYkhS/HU0w7EWw=; b=Kc26wUCTjTevBIYrHNTYUV1hqP
	TUhqytO85ltYVzRGX27fQTtJmh2Kwpl3kjCjXRsOHYT0qoyK2s3Ltdl03Pkx3cwtV4JsOALDfhNcS
	M/anYZjvr6p+1P0KcQUi+dfTaDVz7EcSpBbg3fzIInKH232I60+D6hkCDZGzwfvc/aEUZTA+caAXg
	arPMXl2AAD61PP+eS3S518t47daX2b099qBxp/vx2tfNw/oikAixCdBKnnfzXhB7k+wzZwiwI/8zt
	ao+Oj5jY/UXbg0X1vERyJLtLIiXAkEPNlEqrs/jwgzl2dzKOWNNMNZOK9QuZKjiOlE5fm1u1OfgYd
	WSSKdGhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCCKJ-00000002w8H-0ght;
	Wed, 29 May 2024 05:58:19 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCCK7-00000002w0w-2Gbc
	for linux-mediatek@lists.infradead.org;
	Wed, 29 May 2024 05:58:09 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-42108822e3cso2592445e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 28 May 2024 22:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716962284; x=1717567084; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=py0GeonwgnNaknxyxyM/bPk5f/ta2UYkhS/HU0w7EWw=;
        b=PHDgV75PzdPvzCDA4kdnZCaZnnCautuWeH0nmMiKftMATK1IevhIHFuSsru6siO/64
         FvwOEc4t0GQDYvdg31BPgnyqtbXru580qMVz9GZQmRVcbFNBl8IM5obKY/TWroOqv2Ls
         7ImaBKysTI2A2rs85Y7ADPuIod9uI/+IXUJ3fROOeEbormRcizmlb6TViU8Seb25cx1M
         z5TbQxj9Mr/L628whwfUhxbYn/CMtQfpOptv6R2m1XBCd6ljn+eJU1M2xBZBsRqe3sQB
         YxuDTZz1I/O2r8Ie0Fp2PdRgggf4sPQ51CSUQk+Aop0y9uRH0nrlVK7RGSLWeVgYTLqk
         mOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716962284; x=1717567084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=py0GeonwgnNaknxyxyM/bPk5f/ta2UYkhS/HU0w7EWw=;
        b=AehA1097BpuPO1+e5q0AqCNwvZach+saPE4kyN9u/1DD8NAdaYlqfEdvHtXZlNxTa3
         2Cyzw79iX3ka/dgfTPqawp5UF8cKOEgwNMv64BAhe6Btvb69R8elzdApQKCVL8f6sHtJ
         p7PBvlv+xin39ItRdwN6gYNcAqTaILUTwNJR/kZ5ybKLWGP0xergYZGTiRKaoHM6NRll
         Xgb+DTqv3xhQsSpQ1e7sXovwuXCrsRXHl4GexkqFoG11iVtiRy/MYCxkrPixHGwqTFXw
         lrKyLBVsj+JVrzlyU3bFqcfhbkou7AaJkNeB7Fb1ECHIfA/67f17QytOaRpCC2XZBIMm
         cqEg==
X-Forwarded-Encrypted: i=1; AJvYcCV39Nl1GUPjwInSBkcwgBwKf7pwwdcmBUeIxMRSTOOuJeFuFB0LYPXS95c1GMQfMP576vP87Dlb25fj+Gce6eIUvMC48f2NZqfIWiWGVc6gMG8n
X-Gm-Message-State: AOJu0Yz2kvSTIw9ybh1qAZjjtcMSnv2VAr27Ntfqf3LAHhfj1h3Fj7CC
	7pnJmxYiGpZdwzep4mVnruLN7R+rRwP7hGc//rSLbDw78WCSUIpJTqiOfKsSn6E=
X-Google-Smtp-Source: AGHT+IFBgBr868w8QAU+3YcZoh4tBW+ET1fjETfVihg6NGnEmbzACXvx/JGf3dJqRJTP60EWqb8pZg==
X-Received: by 2002:adf:feca:0:b0:357:bedc:b555 with SMTP id ffacd0b85a97d-35c7b80e05dmr778871f8f.26.1716962283532;
        Tue, 28 May 2024 22:58:03 -0700 (PDT)
Received: from [127.0.1.1] ([84.102.31.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4210896676bsm169075435e9.4.2024.05.28.22.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 22:58:03 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Wed, 29 May 2024 07:57:56 +0200
Subject: [PATCH v6 1/6] dt-bindings: thermal: mediatek: Fix thermal zone
 definition for MT8186
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240529-mtk-thermal-mt818x-dtsi-v6-1-0c71478a9c37@baylibre.com>
References: <20240529-mtk-thermal-mt818x-dtsi-v6-0-0c71478a9c37@baylibre.com>
In-Reply-To: <20240529-mtk-thermal-mt818x-dtsi-v6-0-0c71478a9c37@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Nicolas Pitre <npitre@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716962279; l=1871;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=7TWp6ZYqTnWbqyJ5Cw7vRGWMMiL4bndT4gl1LDFj+mw=;
 b=fNpJGdF1e6oIhg16Qw3yuccxDifJLORx4N3h7feO2qRv4t5zX5kGrg92RNMGZjYaq0FJMoxzr
 kn93J44LFi/ClblQAuQP6CjaErOlZbnOjF2/u1vbrtp9LVgiaEPecsf
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_225807_601234_55AB05FF 
X-CRM114-Status: GOOD (  15.26  )
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

Fix a thermal zone name for consistency with the other SoCs:
MFG contains GPU, the latter is more specific and must be used here.

The naming must be fixed "atomically" so compilation does not break.
As a result, the change is made in the dt-bindings and in the LVTS
driver within a single commit, despite the checkpatch warning.

The definition can be modified safely here because it is used only
in the LVTS driver, which is modified accordingly.

Fixes: a2ca202350f9 ("dt-bindings: thermal: mediatek: Add LVTS thermal controller definition for MT8186")
Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
 drivers/thermal/mediatek/lvts_thermal.c             | 2 +-
 include/dt-bindings/thermal/mediatek,lvts-thermal.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 0bb3a495b56e..506eed52db1e 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -1436,7 +1436,7 @@ static const struct lvts_ctrl_data mt8186_lvts_data_ctrl[] = {
 			  .cal_offsets = { 29, 30, 31 } },
 			{ .dt_id = MT8186_ADSP,
 			  .cal_offsets = { 34, 35, 28 } },
-			{ .dt_id = MT8186_MFG,
+			{ .dt_id = MT8186_GPU,
 			  .cal_offsets = { 39, 32, 33 } }
 		},
 		VALID_SENSOR_MAP(1, 1, 1, 0),
diff --git a/include/dt-bindings/thermal/mediatek,lvts-thermal.h b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
index bf95309d2525..85d25b4d726d 100644
--- a/include/dt-bindings/thermal/mediatek,lvts-thermal.h
+++ b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
@@ -24,7 +24,7 @@
 #define MT8186_BIG_CPU1	5
 #define MT8186_NNA		6
 #define MT8186_ADSP		7
-#define MT8186_MFG		8
+#define MT8186_GPU		8
 
 #define MT8188_MCU_LITTLE_CPU0	0
 #define MT8188_MCU_LITTLE_CPU1	1

-- 
2.37.3


