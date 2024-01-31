Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3990BC47DDF
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jan 2024 10:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qlp2sty3dR9Sx4BVXNTcLCm3HU4Y5f/yXJCeA8/jKio=; b=pPwyJy6kh+D0iH2yHYMNOjIfmT
	QX+KUGlCm8IWnUA6eBxtvdABId72kEKAfiBq7z8Gu5BLi0oT8rhhs34PO9Vbqf1poDeqM4TAvdmEk
	OJaER84KaBwmCNQdi31xBBXH+bmK2sh0yTDvlcAw3sObI8ZnupDzBmIe8/ujOvbGWmcBV6nH2nnFK
	ZAMtMvZxQOsHj6P9UV83WBU5IY0loS1UUiBJd3QQCajtGlcQ9I+XX7A9wCuH00iFzTZrCSZWaD01D
	U8E7DPS1QnfePwPI3MBcGUoquYiio+oDSIl6gh895N/mpDyk00Q4zLP/4j/IolAKZvBU6KKyP+iSS
	smfTRYvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV875-00000002rkg-3ZP4;
	Wed, 31 Jan 2024 10:46:39 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV68o-00000002Alc-23eP
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Jan 2024 08:40:19 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-295d22bd625so615292a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 31 Jan 2024 00:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706690416; x=1707295216; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qlp2sty3dR9Sx4BVXNTcLCm3HU4Y5f/yXJCeA8/jKio=;
        b=EeRo3SOl3YmsJfUmzLs/5MkA8cAHBfv+Pj1FiNoBYTEvdc2rBvTrtvaIe7mK4JJCqe
         G4A7X3D6iZlHBmWllYiI7Q6Sp2DeSzr2/BXC/9vNYjM4YAq292Pici7IrqfCYuycVF0U
         cHwbMjzJqfx7sth8apORAdG/N8F8MAocrxM8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706690416; x=1707295216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qlp2sty3dR9Sx4BVXNTcLCm3HU4Y5f/yXJCeA8/jKio=;
        b=niMyLUo4+MbdqFWGBS9izh0z0megtkZbeo29dBngYwFRH1lG5DZiQz68dgfn1nP/Vr
         6Gx74XHHS1pa4m/pTvTnHWI0JgfzjU0WYaYCmX8kk5O3/6zbV/B4a1Eu3LlgY2glqQt2
         4RwwU+aJQmdolPcH8w4ObLQfHHbZm3TtMpSPty9Cmtn6/kG9V3hVUqAkJ4s1b4lA64UN
         7AGWmHIL8vO9ld6cPPrOSESimLpE60N7PFNmzTPMi2iNQmdusuPrajCjWq+tLLmXdUGL
         VqogxCMiM4L2JA2Be11TlHIino7EABNWxn5N2jYhvIuoah9NfL6Pp1ZWYg7A44XqIlMv
         hPLg==
X-Gm-Message-State: AOJu0YxSsie6SLqWN+raPmLkqKPUKO7LC4nHlNYlCSaKHt9oWktbSVW3
	/skYPWKMp6ULgFc9kA00x8PoytGFiA0DH9LMY5VD/eWSbJuXqbv3v0r/aktX+g==
X-Google-Smtp-Source: AGHT+IGeOC1b4+fEfR2BiaeqQXuckhfl4EogvEOKld9sN382hSLr+AIdEJ0dHzu5M2ho8pU3UVp7/A==
X-Received: by 2002:a17:90b:182:b0:290:e010:2f90 with SMTP id t2-20020a17090b018200b00290e0102f90mr1002677pjs.30.1706690416436;
        Wed, 31 Jan 2024 00:40:16 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:74d3:dadd:270b:194a])
        by smtp.gmail.com with ESMTPSA id pq9-20020a17090b3d8900b0029051dad730sm887800pjb.26.2024.01.31.00.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 00:40:15 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH] arm64: dts: mediatek: mt8183-kukui-jacuzzi: Add ports node for anx7625
Date: Wed, 31 Jan 2024 16:39:29 +0800
Message-ID: <20240131083931.3970388-1-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_004018_582431_2C1F2188 
X-CRM114-Status: GOOD (  10.39  )
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

The anx7625 binding requires a "ports" node as a container for the
"port" nodes. The jacuzzi dtsi file is missing it.

Add a "ports" node under the anx7625 node, and move the port related
nodes and properties under it.

Fixes: cabc71b08eb5 ("arm64: dts: mt8183: Add kukui-jacuzzi-damu board")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    | 25 +++++++++++--------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
index 6d4b225a592b..783c333107bc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
@@ -150,21 +150,24 @@ anx_bridge: anx7625@58 {
 		vdd18-supply = <&pp1800_mipibrdg>;
 		vdd33-supply = <&vddio_mipibrdg>;
 
-		#address-cells = <1>;
-		#size-cells = <0>;
-		port@0 {
-			reg = <0>;
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
 
-			anx7625_in: endpoint {
-				remote-endpoint = <&dsi_out>;
+			port@0 {
+				reg = <0>;
+
+				anx7625_in: endpoint {
+					remote-endpoint = <&dsi_out>;
+				};
 			};
-		};
 
-		port@1 {
-			reg = <1>;
+			port@1 {
+				reg = <1>;
 
-			anx7625_out: endpoint {
-				remote-endpoint = <&panel_in>;
+				anx7625_out: endpoint {
+					remote-endpoint = <&panel_in>;
+				};
 			};
 		};
 
-- 
2.43.0.429.g432eaa2c6b-goog


