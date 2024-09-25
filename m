Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D29CC369C7
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 11:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PLqdDDy4JfS9QGhHfm83WJGLQ+zasSrsBp9fJHTMisc=; b=qQTCq3UuERbSkq
	kpWjIXfPeAdWmvuhyhccvIfOJVtTrR48Z7lZHWqmGbOCFLecqPJdlxqUF7Z1Qf5tv4JonGtw4ZweD
	wRFEmyQXbTdmhZ+3+fNPY2WbHTs28Ve2tZi6Jz/wLn8gIdwBZiCOtUcintTrDA8aHPLx9OvO3A9lE
	7rzo++RREpDmf/KgackyP0OVGg+xhMCT8f1qtxF/BwujV5SrEsh3mdz4W00MCir55v7VbIqjd2rQX
	IyUWeW3wuHyGqmtWfKGnEV9T0TFv8lFCCS9VBUNSYLgeXHrY6DsMjeDTSq2t3YV3Y6bPD5woJdM6a
	X1XnA4G0Ki/iaz3xrMxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stPpI-00000004p3T-39AM;
	Wed, 25 Sep 2024 11:04:56 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stPm1-00000004oNY-2Ng5
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Sep 2024 11:01:34 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-719b17b2da1so2799717b3a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Sep 2024 04:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727262093; x=1727866893; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLqdDDy4JfS9QGhHfm83WJGLQ+zasSrsBp9fJHTMisc=;
        b=HnGV7AKxW4aqz4iGeUBt36SO0MSlzcc1u56Kxll2d18piIZvfFKVlgsy16kqXjeptR
         bDvL/ooy4u7imPC8mloNXxrKDaijYEI/yDcgD5nOJaAID/Mdc800DmYXpcxW37cdQSXJ
         C8yTepsqVpfxmHSTi7g9w//Nb1ARgcNk0mZIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727262093; x=1727866893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PLqdDDy4JfS9QGhHfm83WJGLQ+zasSrsBp9fJHTMisc=;
        b=iAShMzLEEuvUGqqZUB+h5g+HmL1N0YaGCpLJvDegi30L0twax3eGtU8+hVZc01oe1C
         Pg+5dDeTRm2/PmXMa73ZM2YoVQTRd3UZp1CO8x9a2R0uhsLKGjdIMsz52SMB284CNhJ+
         7nRHaF2aWeCjTbl3nRLho5ZiLiGPeTORzuUthvkYcaJ34rLJaqAz2eV4yoF7OqC/XqYc
         WdONqoyZ5HTfhbQGmISdmLqwyYq2c9k3AzVgRUUqjuwTWkZLsghCz6gD4SW9Yy4MuCPX
         DrkKmEfxktF4+qIpkGcMwDfv2T91HZADFNODIU2xZ4+b7QC3FRcV7kkAUYeexJgHzxN0
         icmw==
X-Forwarded-Encrypted: i=1; AJvYcCV/0JHv9ow80jt798Ul8LAjCN0V2T30Sg95IiAXWA/P6TvdsrUu2E9zgSF1zGrO9M2r8I8Ib4YRfZ4LiavkQw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyS6eWs2CKd13e9Jezo71ekbXNAdDuDmjNLdkZ/23voY5O+fnwy
	MN/KN3qNVMEbgWdXUyByRm0JJmUADIboEIf1n+4rJ9gJ3nVwsPLf5ItkXJSesg==
X-Google-Smtp-Source: AGHT+IENDwuswAJbiEaRG30wahCIU1K1GFedjK/Q2vnSIcuGe0nQVExkQCiGetyyP40F5XzuOozohQ==
X-Received: by 2002:a05:6a00:1496:b0:714:17b5:c1d9 with SMTP id d2e1a72fcca58-71b0aaa2289mr2816985b3a.1.1727262092682;
        Wed, 25 Sep 2024 04:01:32 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:2b86:78b6:8ebc:e17a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6b7c73085sm2570298a12.59.2024.09.25.04.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 04:01:30 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 3/6] arm64: dts: mediatek: mt8188: Define CPU big core cluster
Date: Wed, 25 Sep 2024 18:57:47 +0800
Message-ID: <20240925110044.3678055-4-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
In-Reply-To: <20240925110044.3678055-1-fshao@chromium.org>
References: <20240925110044.3678055-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_040133_639700_B32883CD 
X-CRM114-Status: GOOD (  10.91  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The MT8188 SoC features two CPU clusters: one with 6 little Cortex-A55
cores, and the other with 2 big Cortex-A78 cores.

Update the CPU topology to reflect the actual hardware configurations.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index cd27966d2e3c..51bf08b2ff9b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -195,12 +195,14 @@ core4 {
 				core5 {
 					cpu = <&cpu5>;
 				};
+			};
 
-				core6 {
+			cluster1 {
+				core0 {
 					cpu = <&cpu6>;
 				};
 
-				core7 {
+				core1 {
 					cpu = <&cpu7>;
 				};
 			};
-- 
2.46.0.792.g87dc391469-goog


