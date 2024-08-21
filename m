Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 263F4C52D7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Aug 2024 04:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oL35AxGZkldIWibynmnAKaJ2u5VoZnYoTxaz2S8FjO8=; b=wdKG9mpo0kOtaw2HWka7Dhanf/
	8QoJJG11vMoekFtAfrn8lmE9k3pJ/EYaGanr2+ZtN1U1huwvKgk1SFVMMhuRTLhlCCn/cAZTBbVNR
	zY7fimImI4oEYX2J8o6M0M2KvPDe/EDR96EyMvWbmFQYFuUtTcFu1AoazWWlvtGWIER2JLApZetMn
	3DfSODfPRctQqtAo8wPRdVHNOQKAWLOr0Or8Njme+z/Fwi9XLm11Sec1W7Uubhee/Sww3bl7GHt3C
	TOeH9Z1sBokjMkVNm/iVsCIE4yNfCbCZBYnKGGN8c64FXeaBWnmg1OOaEsjcH1t3X/LdQq0dUo/t6
	jqqCeH5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgcyZ-00000007UFR-0lnc;
	Wed, 21 Aug 2024 04:29:39 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgcxq-00000007U9A-39k0
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Aug 2024 04:28:56 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1fc47abc040so49967745ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Aug 2024 21:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724214533; x=1724819333; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oL35AxGZkldIWibynmnAKaJ2u5VoZnYoTxaz2S8FjO8=;
        b=c8abwPxysy77ictG/9AkGGJ0hy0UgrAW0ZF022cSxLcl6ruztI8V64Q2ABuqKd0bE2
         0HpmXf2RQ0SHa58FtUJ2Nzci7EcZdRiTBkjCgf+lpYewtFuyaG9vfmIRirc4180S8Rrl
         7DLtZnSqALKUR8AIe013r5p+yQMnXJoT9fgMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724214533; x=1724819333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oL35AxGZkldIWibynmnAKaJ2u5VoZnYoTxaz2S8FjO8=;
        b=qoBc5uMFdR8WBvW6wXUGFI6VKpMgxBQKv/13kT3VJij8mq30ZDkGg+L8tBNfLm1RPJ
         FHCMFEPZTFbSLcALeuFpVTF+V5ftVb1lM7wydLI7UAMCnwIjQDGSRXOa1Sc96rRZA8JO
         /HtaJHUSCLKgk22e58rVYDbk9hjwH5EyjJCLU9H5WGneBAOXQIA6PdN2tRIivjdMBkKv
         Sl+05StsFA83yBRPrROUBQ0GjpsviNgcIJvOsgzx6cq/6tMQOSal4qKdMaaIO5zxIY/t
         DJb8FXkJukWU6JwIU854WKm3llyK5UumfRU9KkDcFFhdTJwxDJfcbhTJH56DQdK0ewDx
         xTMA==
X-Forwarded-Encrypted: i=1; AJvYcCVKJw8HWlJWWz8WpOODXbA5HoBMxXfEiRfYNrlxkbZS4jj99BNQolswEBArnCMtiezLlGMsQaZRtqbuu7xerg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4PqklTiw/79ctLN8WpDPIsJNzB1tyHwXWXB6+xs37y5lp0ILL
	NgM0ZKh/Zdk+euuo2gNBYeEdX2kKGPhjFFa0e1VzpQsL4yAmMKKfw981FSO38A==
X-Google-Smtp-Source: AGHT+IGkQFvAxR6OHQmrEF1NWLA3JRjVj9a5qfWqVB0iBHec1ZP8Pwv8bCGoy0noetly9gAjy0fz3w==
X-Received: by 2002:a17:902:6903:b0:202:1fe:bd0a with SMTP id d9443c01a7336-2036807428amr9688345ad.46.1724214533083;
        Tue, 20 Aug 2024 21:28:53 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8d56:286b:9a9c:b7d0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f0375acasm85652345ad.161.2024.08.20.21.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 21:28:52 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Stephen Boyd <swboyd@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8186-corsola: Disable DPI display interface
Date: Wed, 21 Aug 2024 12:28:34 +0800
Message-ID: <20240821042836.2631815-1-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_212854_811600_3D9833CC 
X-CRM114-Status: GOOD (  12.49  )
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

The DPI display interface feeds the external display pipeline. However
the pipeline representation is currently incomplete. Efforts are still
under way to come up with a way to represent the "creative" repurposing
of the DP bridge chip's internal output mux, which is meant to support
USB type-C orientation changes, to output to one of two type-C ports.

Until that is finalized, the external display can't be fully described,
and thus won't work. Even worse, the half complete graph potentially
confuses the OS, breaking the internal display as well.

Disable the external display interface across the whole Corsola family
until the DP / USB Type-C muxing graph binding is ready.

Reported-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Closes: https://lore.kernel.org/linux-mediatek/38a703a9-6efb-456a-a248-1dd3687e526d@gmail.com/
Fixes: 8855d01fb81f ("arm64: dts: mediatek: Add MT8186 Krabby platform based Tentacruel / Tentacool")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Stephen has recently posted the "platform/chrome: Add DT USB/DP
muxing/topology support" patch series, which is now up to v3 [1].
More work based on this series is needed for the DP bridge drivers.

[1] https://lore.kernel.org/dri-devel/20240819223834.2049862-1-swboyd@chromium.org/
---
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
index 0c4a26117428..682c6ad2574d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -353,7 +353,8 @@ &dpi {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&dpi_pins_default>;
 	pinctrl-1 = <&dpi_pins_sleep>;
-	status = "okay";
+	/* TODO Re-enable after DP to Type-C port muxing can be described */
+	status = "disabled";
 };
 
 &dpi_out {
-- 
2.46.0.184.g6999bdac58-goog


