Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DBEEE49BD
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 14:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5leCC+xnoiSa3zCuz8WQhl2vdhzFBVOxY/5F24dS42M=; b=Ep51x7k7L/3ahk
	bQ+WbPrYG9GV5DGjd3UuwOPJ/KANNFJ1VtrkrP18noTSSGhLsNJPmrdIFslZSfInaeeQxb0hvin5k
	Nhtu88Z3WAnEbBpr1gcMmcdQKuFZod+EObWZgfZu6VoWk8FmQVwqQmn1Nq8BK4z3qljWzW8q4DXPQ
	oqGW7XaMGqOGM6kRlmzd5YQ9U1CKxQb3KsOO80cJjILSYqbhvmmGbN3b9m6o5A2A+09m4VWoA9TFf
	f7UHT4hajhd0VMjAxM3LMQQOkHthtN7p6CI8Zs1JfiL970v0mWylDSO3wtlXFF5DiWr/ud3agalKb
	X1ukx0dzWwM0RP6tJKVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soOlK-0000000A25J-1Eh3;
	Wed, 11 Sep 2024 14:56:06 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soORP-00000009wFH-2V5E
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 14:35:33 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3e033e37bc9so2519798b6e.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Sep 2024 07:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726065330; x=1726670130; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5leCC+xnoiSa3zCuz8WQhl2vdhzFBVOxY/5F24dS42M=;
        b=KcfqAtsY3D2k2czEhxY0MHUZp9KZVc+xpVHJTDhPuubbJ7dQedG/gAIQrmBVr/tWBt
         wr26gErczHDOIiFNSr/Jb0PvPnQ+mksKXJXQG6+8rLPEDZYe1ePob/O0oLc64NwhR7+M
         v/ImCIrT+oLFxlAyvZxx+9t0va4pSslyq+OLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726065330; x=1726670130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5leCC+xnoiSa3zCuz8WQhl2vdhzFBVOxY/5F24dS42M=;
        b=VJ4+5DPzKuZ9eXQ2jRFGap2QkaqyuqCqsd9oJ0ji1ufDwMFrsZKN2M5H8P5Su6Xbbd
         E639OOmRPYfUo8yeNg8zuaF8YFTw9rryl7IbLIMAdeElh6bA/Db4On1nL4I19A/tbzsd
         +LbkjrBpncgWakgEx81AZgTh/rXc45hGx2UH36U827bG6n9Th/AFwREBfjDzvhnaKsng
         wRRkuE1ezVhFZMQ8+A7Lt6p9hWduGOO5KviY8Biyfp3WGmrLacWXM8ju/py0Y7DaSFU6
         S2NUR0u/bI1NFGb2uJ8fLVrBZo3z4S5y67aLaavVW1yGWXHXyYC9iuf7uy9o5ZxxLX/X
         nXew==
X-Forwarded-Encrypted: i=1; AJvYcCUjt53w5i1CcLDyEQYo6yJVDBgJuLyPZ9+8g6z5RJEsZ1QjhiFxYaUd715EPA4dnseOx+XnTboSOoHmtpgEug==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKjGbBIDVKZpSxclpvePMwbwgVq7tr4nxk5g8IhXcXFqLnyJlB
	pHoIFH+ItkJqKDKJ9A95kcRfHfyZMFKQOM0eR6oQyMDiPmTIHFMc9TctF4zTLg==
X-Google-Smtp-Source: AGHT+IH+J+C6d8gNDzhINHwohdN90QAPrsAQWdc7FOUHpN8LW5zv/B/GqRWKq88yB99+d8bvpAIm1g==
X-Received: by 2002:a05:6808:2f16:b0:3e0:486e:366f with SMTP id 5614622812f47-3e0486e38cbmr7154413b6e.5.1726065330530;
        Wed, 11 Sep 2024 07:35:30 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:102f:d738:6069:fd4b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fbb5901sm46620a12.24.2024.09.11.07.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 07:35:30 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 8/8] arm64: dts: mediatek: mt8188: Add socinfo nodes
Date: Wed, 11 Sep 2024 22:34:01 +0800
Message-ID: <20240911143429.850071-9-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240911143429.850071-1-fshao@chromium.org>
References: <20240911143429.850071-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_073532_521985_B204B3BF 
X-CRM114-Status: UNSURE (   9.26  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add two socinfo efuse data nodes for the SoC information probing on
MT8188.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Fei Shao <fshao@chromium.org>
---

(no changes since v2)

Changes in v2:
- Added socinfo nodes in v2

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 6327e1006de8..bf15ac9901da 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1904,6 +1904,14 @@ efuse: efuse@11f20000 {
 			lvts_efuse_data1: lvts1-calib@1ac {
 				reg = <0x1ac 0x40>;
 			};
+
+			socinfo-data1@7a0 {
+				reg = <0x7a0 0x4>;
+			};
+
+			socinfo-data2@7e0 {
+				reg = <0x7e0 0x4>;
+			};
 		};
 
 		gpu: gpu@13000000 {
-- 
2.46.0.598.g6f2099f65c-goog


