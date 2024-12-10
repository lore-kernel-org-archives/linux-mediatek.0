Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A50E7717F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2024 07:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fU9h1qciZfo1eCFrj9RBOWdEPoZjJk9V1VI96TtLyqU=; b=CWj8fZ5fawGz/I
	aEGzRB0UHr4Lqxx9tNT0i2qylcMm2qWq0WNYdWxxTHjKbEvLLjtMZ95ByMI9aSh/VlsyfY42gSPKW
	hYfN3G2mNsEkGLXfDryRS9Gv7p9PoqDdjVAmcCQx1f6s0fXGHxbAH5kMxlU0yGuGZhon4Ub68R7Bk
	PEfdw4ZA8Wzf7guuO5q4p3LD+I4K7wfNJkJVJqnw4QNHj6RFQCG9yEzl6dKue55QKOSqlxDgRhxqF
	uS4aUXegHABTT2JnO+W+b7zAliLbGexNILlyQQCiWq0uwtIhBdApl+CUrf9RZB+dtjzlrbVf8YDpA
	qDCMCVlzzoEKFnNlA0Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKukH-0000000AZGA-1GSN;
	Tue, 10 Dec 2024 07:33:25 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKujF-0000000AZ2i-1oXG
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Dec 2024 07:32:22 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2164b1f05caso18573545ad.3
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Dec 2024 23:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733815941; x=1734420741; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fU9h1qciZfo1eCFrj9RBOWdEPoZjJk9V1VI96TtLyqU=;
        b=MxjpQU/P+tH+/qA5gojpF8fPehzNXiIYikaCOf/HspvSJfh9vRkLI6V1W0ikO6Wm9w
         XjzH2yJwaPBnfXRDW19HSmbGt2j3dgKXfK9+G7uQltAKcqvLE7I3l1CM1KmSZC6eSx3q
         2r3JnaGHsiUnbXJEXEpefiy1dTw7SlD2GaRf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733815941; x=1734420741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fU9h1qciZfo1eCFrj9RBOWdEPoZjJk9V1VI96TtLyqU=;
        b=VSH7b/MpiGjzz3MCbp93Snt4C+ROCKq67tX9JDayfzHhPeT/2QY/l6joIYCHf7mu/l
         ztijUwiu+etAI2Be3HUa5z3cnJwtKafHGNsSjSk5kjEchEMZWgzWqzVqOVf9bOwo4EOw
         8xtAJea+FTzLPAtm+WikA5bvVk22cqX7J2/7+jJok30ZBc/i6MDQXcpyPy8Lcnu71PNl
         iQlfpI9M7SdLV73A1HHhKVrocFvMwCnEVwficxU0DM56OXx81Er8DWJQ317UD2wcgeZ9
         RLKjrpmUHTqkb9VZySQXxG64enz4rZJ8Od/hHM+l/ScQsEZkbOVg/KYo/7CLj1/LPaxV
         zRfg==
X-Forwarded-Encrypted: i=1; AJvYcCXrCXWUIxlu0o9y34LES/a0h9GarZ+wg6L9flHGEtaMfZ+Zw0XLSmhGvrOYg9pMp9FYI4B9Idr3l3C8tv7kKg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMTWU4TRT4Ujg/P1gsq1EJXkTQ0kzRWNTYzXzLpwsbUCr3bkqC
	YkHAZGsTp3VLhRpFy2FVKTuv7E0C/HJxSiMVWjf+w4bxEcWPkoUZ70L6oUGEWsNUE59jqBkB9s4
	=
X-Gm-Gg: ASbGncvYuLKxhXmnC36FBBe+aZFwZwRdGUy4czTCalkotz3LLDLV6DR1t+tiYOkF7d7
	AXAM+TxYqJUClwq0813aaoPdEiv/EZGG5UpoMGrnZ2ugbZxeAQKHyVmnTD8WUOR7ZtKKonQrA3e
	Ve6w1Wd67onXcQCgo9qU8Sa1YWhpZOntH9hEepuaFXIBeRunWlbiITdKzsD5hyunEgPE/WFGV/W
	jtfuifUJUPnuG1xJRv5gSid07fYd8vQGGwW6rnfcAwW6HgdFV4sGAV4T8mJjTSh4FykhJy0
X-Google-Smtp-Source: AGHT+IHPmON+PwbNAPPZYDE53KwGnbvTApGQhaNGbUZe2uB605PBpV+ZcftSN2qQ7es0oLZxPl5QBA==
X-Received: by 2002:a17:902:ecc1:b0:216:3876:2cff with SMTP id d9443c01a7336-21638762fcamr152395915ad.54.1733815940983;
        Mon, 09 Dec 2024 23:32:20 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:89ce:2db9:f7d5:156d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8f09146sm83693295ad.199.2024.12.09.23.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 23:32:20 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wenbin Mei <wenbin.mei@mediatek.com>
Subject: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: Document compatibles that need two register ranges
Date: Tue, 10 Dec 2024 15:32:10 +0800
Message-ID: <20241210073212.3917912-2-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241210073212.3917912-1-wenst@chromium.org>
References: <20241210073212.3917912-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_233221_469438_68C666FF 
X-CRM114-Status: UNSURE (   9.65  )
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
Cc: devicetree@vger.kernel.org, Andy-ld Lu <andy-ld.lu@mediatek.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Besides the MT8183's MMC controller and all its compatible derivatives,
the recently added MT7986 and MT8196 also require two register ranges.
This is based on the actual device trees.

Properly enforce this in the binding.

Fixes: 4a8bd2b07d88 ("dt-bindings: mmc: mtk-sd: Add mt7988 SoC")
Fixes: 58927c9dc4ab ("dt-bindings: mmc: mtk-sd: Add support for MT8196")
Cc: Frank Wunderlich <frank-w@public-files.de>
Cc: Andy-ld Lu <andy-ld.lu@mediatek.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index f86ebd81f5a5..0debccbd6519 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -235,11 +235,19 @@ allOf:
       properties:
         compatible:
           contains:
-            const: mediatek,mt8183-mmc
+            enum:
+              - mediatek,mt7986-mmc
+              - mediatek,mt7988-mmc
+              - mediatek,mt8183-mmc
+              - mediatek,mt8196-mmc
     then:
       properties:
         reg:
           minItems: 2
+    else:
+      properties:
+        reg:
+          maxItems: 1
 
   - if:
       properties:
-- 
2.47.0.338.g60cca15819-goog


