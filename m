Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4365D1171C
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Oct 2024 07:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6laKqa55/o0629X+75d0Pfs5pGBVZ/MLyO3PoLeX31M=; b=dWBK+C3yC7fiLxnTYdP4ToSx8K
	rXyUgpoiHwO+gzaTgFlrjaQ4XOTvUiyukNMOEU+bQrwJ4wcCg01A3EcG/gxuzHleQlX4TYM60idj6
	A5wpPEj3PHXlqhoUDxWGnirEva+XzWygGf8Ptbce6t2D3qmoveYW4nW4vWdVUg7TrYPkiyUTTsZO3
	+wEjIhW+3t49O+gH0j0g7nw+elZ5Jf6VRP0GM+0sP/mUDtsYijmmwT3cRsVrX2xMoxPmn0csKjy5m
	O5Wre7YgbtSta9ZGlnHiRM4OTaiRKCsjlYIWiiLTK11zF2+fujdgJ04/scSOUOc38dyXRWK6kaKLn
	2y7xJOKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FBa-00000002sZJ-2EDJ;
	Fri, 25 Oct 2024 07:56:42 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FBY-00000002sXS-1X5G
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Oct 2024 07:56:41 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2e2dc61bc41so1260421a91.1
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Oct 2024 00:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729842999; x=1730447799; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6laKqa55/o0629X+75d0Pfs5pGBVZ/MLyO3PoLeX31M=;
        b=eUJjqlSXLuKMibEA/2cZP23Lg88Cyy4zdIA4j3zaxmLNmQl2Wy/ejzEJt7Uv4no5Wa
         fv17NEGoPGf9sTx2NEnMdw+kMO1dO1W7x/nF/DJsKz8e0cAg/QrSvTV4RwHfY2D+wt2o
         ljyv9Q3D4YqTK/nOxUrN80KcytL+5rM33X5XQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729842999; x=1730447799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6laKqa55/o0629X+75d0Pfs5pGBVZ/MLyO3PoLeX31M=;
        b=bzOIgul/hz44U0zoyDeme253gVgNu89Ktq8Mvrl+kVZb+FnWTlvo6eNcjLiduQ+535
         GtJHQ7Bviq2HJfkgEykqk1JOtmT4fXDaEwSV2dcd92iY8omDajHj07A1iCOFxmdZh2mC
         JlAKpckHaH36frFQxOP7sY79WWzidGkGuAY+lEUSZdAbRfM2rD65V8yKnAHEDE9pkpqV
         9tiGk6XRi1RisS8bfrQSHaVlLSjJltmARdvpqfkXDokohJFRBXRgnFkMGxPrcobGeBGQ
         OdRnrHxLZ86lPGKrF9wVe3jxG6QFwTOcV7w7OJtgOEalTIfZ2Z5Z5a7FCyYURmvmL6jN
         xw3w==
X-Forwarded-Encrypted: i=1; AJvYcCU5Dl8AkYtfMWaLut5B3a+iii1iVXfctVPCByDFAX4s1SaZH+wjLbOmN2SPzAr6s9kQbMqSecYVvRZMqVgkJg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRotdLd+RVgfH+6UaaddDwk4s8LyCV2Cb2JiRakUhfNQQ9A/vI
	GVHoojL+Y5FpzPTx0nnql94DpL9FYkSECpGh/CbojiuE1uSKjXwXNiEQlB2m2w==
X-Google-Smtp-Source: AGHT+IFmmKGI2cs990SRzNz65POmVSt+7jqG6ghbGRlWIcpYgMGvGVtY/qLmA8mHzd2tQ8d9uEfU1g==
X-Received: by 2002:a17:90b:3850:b0:2e2:d1a3:faf9 with SMTP id 98e67ed59e1d1-2e76b716566mr7196222a91.40.1729842998905;
        Fri, 25 Oct 2024 00:56:38 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:d8f:752c:c7f1:3169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e4c9c1bsm2797553a91.19.2024.10.25.00.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 00:56:38 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: mediatek: mt8183: Disable DPI display output by default
Date: Fri, 25 Oct 2024 15:56:27 +0800
Message-ID: <20241025075630.3917458-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_005640_450247_30ADFF42 
X-CRM114-Status: GOOD (  11.74  )
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

This reverts commit 377548f05bd0905db52a1d50e5b328b9b4eb049d.

Most SoC dtsi files have the display output interfaces disabled by
default, and only enabled on boards that utilize them. The MT8183
has it backwards: the display outputs are left enabled by default,
and only disabled at the board level.

Reverse the situation for the DPI output so that it follows the
normal scheme. For ease of backporting the DSI output is handled
in a separate patch.

Fixes: 009d855a26fd ("arm64: dts: mt8183: add dpi node to mt8183")
Fixes: 377548f05bd0 ("arm64: dts: mediatek: mt8183-kukui: Disable DPI display interface")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 5 -----
 arch/arm64/boot/dts/mediatek/mt8183.dtsi       | 1 +
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 07ae3c8e897b..22924f61ec9e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -290,11 +290,6 @@ dsi_out: endpoint {
 	};
 };
 
-&dpi0 {
-	/* TODO Re-enable after DP to Type-C port muxing can be described */
-	status = "disabled";
-};
-
 &gic {
 	mediatek,broken-save-restore-fw;
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 1afeeb1155f5..8f31fc9050ec 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1845,6 +1845,7 @@ dpi0: dpi@14015000 {
 				 <&mmsys CLK_MM_DPI_MM>,
 				 <&apmixedsys CLK_APMIXED_TVDPLL>;
 			clock-names = "pixel", "engine", "pll";
+			status = "disabled";
 
 			port {
 				dpi_out: endpoint { };
-- 
2.47.0.163.g1226f6d8fa-goog


