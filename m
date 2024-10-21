Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E42BD0E6F4
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 11:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pFGqW2cFYVEn/q/mCaxZhdSAZg1df4AGxlVE7Nd7m2M=; b=u+4KBte5GjJVrb
	bJglOyswlDkesZHmvzAVbsCf+qMhoYIU8T1EEKSWAFvLspYUMumDPAKxktShbilEUdVF6OBKEVvhU
	oViCDfluHwnIGVDc2+3wedNgnDZ8tw8inZbt71Q3ok7XZlWRIuAog22k0Gs5RwR2FuSDzwiE4mp35
	6YFF5glP3Bn0+dZb0H2W92ty9Y1o07ytY0V8lS78KthOQKogdIO7LMLRo+WZHG4PDmWq+cl8mZIzZ
	vgkc4kN3AmRP1PKT9Q+lBbB4COzanPX9T9gSTzsH2a7vHFl/es14N/wT4zyX6E+0Fb4fHcEZvVc3K
	gqG0gsjnXK5Bj8B95lEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2qqZ-000000075nu-3LIw;
	Mon, 21 Oct 2024 11:45:15 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2qp3-000000075QP-2AC2
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Oct 2024 11:43:43 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-208cf673b8dso42177075ad.3
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Oct 2024 04:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729511021; x=1730115821; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pFGqW2cFYVEn/q/mCaxZhdSAZg1df4AGxlVE7Nd7m2M=;
        b=U+zEb/xntIkcCwXnMSvHeLubpHL/UWS8rF/xbQ0BMX2DA/eYsuq9kDCjWfM9IRQj4q
         qiTlqBGFrtUToAml6J5ELTvc1MJtnLDMdnnoSBw5E76flQgzDR552/P0KJA72rGMXRHe
         LPgnyFESNcZ3KPnp5HylLPcmrj6zRqOchZGVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729511021; x=1730115821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pFGqW2cFYVEn/q/mCaxZhdSAZg1df4AGxlVE7Nd7m2M=;
        b=km2lkoJKnKWIaj4g+oyjipSWifr1rptOuRvFT2koqGlWx8/4ZuyZfItRfh2bwwGdIy
         ssANjXHtbfQKIYJi0yUZBA05qTL3jJzJAohLZF+d3OkiDszMSnj90zZTy6of1K5rv0xq
         BZpm9wxCQYlymTVsD26t0kszeRx5je+g9sgGpgRXvU4C8N+rWgF+188M/xgr2Hl5q35F
         fi0wMTnAS3W3pdTT3Y0I72QW/Ylb1sW1/z0Ofk+tsQiKPIreLbtdbs3mP6TxxQapybjl
         TWUiowj4m2oxYD+YYxs5GMHOS/k2+klGM2f70d7bn7fOSOqmh+QczuHKIlajQrMxh74/
         ppyw==
X-Forwarded-Encrypted: i=1; AJvYcCV1Cbo5b3MV5DnbEm+197CpgMuO7k1W7kqyW0YwM3coDarjJJAMjljzng6rE6jvDtcDaekSmCdLr5VUSvLLtQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzI+92O2mXPibhuKMMmXly9kSQUN78ipRuuFuV81Chj8sDm1+NK
	pyh6B/jUPz0ye633QfV4+fJFbbWlh+T2z3YNlgFctiSn//JVit7aOKHMzXrQoA==
X-Google-Smtp-Source: AGHT+IH6P9i9bth3v9J1SxyMP+yL7cKvTFdnB58JeaUhpcK0fnL4b/zRVxwRyWOMVGHEvr9v/WRN+w==
X-Received: by 2002:a17:90a:c590:b0:2e0:d693:7884 with SMTP id 98e67ed59e1d1-2e5616de895mr14134967a91.5.1729511020820;
        Mon, 21 Oct 2024 04:43:40 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:66d2:3298:fcb4:c6c9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad366cb8sm3536518a91.20.2024.10.21.04.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 04:43:40 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] arm64: dts: mediatek: mt8195-cherry: Use correct audio codec DAI
Date: Mon, 21 Oct 2024 19:39:33 +0800
Message-ID: <20241021114318.1358681-1-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_044341_574674_B212F18F 
X-CRM114-Status: GOOD (  10.33  )
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
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The RT5682i and RT5682s drivers describe two DAIs: AIF1 supports both
playback and capture, while AIF2 supports capture only.

Cherry doesn't specify which DAI to use. Although this doesn't cause
real issues because AIF1 happens to be the first DAI, it should be
corrected:
    codec@1a: #sound-dai-cells: 1 was expected

Update #sound-dai-cells to 1 and adjust DAI link usages accordingly.

Fixes: 87728e3ccf35 ("arm64: dts: mediatek: mt8195-cherry: Specify sound DAI links and routing")
Signed-off-by: Fei Shao <fshao@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 75d56b2d5a3d..2c7b2223ee76 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -438,7 +438,7 @@ audio_codec: codec@1a {
 		/* Realtek RT5682i or RT5682s, sharing the same configuration */
 		reg = <0x1a>;
 		interrupts-extended = <&pio 89 IRQ_TYPE_EDGE_BOTH>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		realtek,jd-src = <1>;
 
 		AVDD-supply = <&mt6359_vio18_ldo_reg>;
@@ -1181,7 +1181,7 @@ hs-playback-dai-link {
 		link-name = "ETDM1_OUT_BE";
 		mediatek,clk-provider = "cpu";
 		codec {
-			sound-dai = <&audio_codec>;
+			sound-dai = <&audio_codec 0>;
 		};
 	};
 
@@ -1189,7 +1189,7 @@ hs-capture-dai-link {
 		link-name = "ETDM2_IN_BE";
 		mediatek,clk-provider = "cpu";
 		codec {
-			sound-dai = <&audio_codec>;
+			sound-dai = <&audio_codec 0>;
 		};
 	};
 
-- 
2.47.0.rc1.288.g06298d1525-goog


