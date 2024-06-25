Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733A3C2BBCA
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jun 2024 09:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qF1YJYptXWfDBxwzTIeTgvB7dEj4RfJtD5/KNTKFabM=; b=4J8WoDjL0wyfcKRJtGYFoA3LE5
	xrVfTE7b4LoMN8tJV080goo5UuEfjcz/x34wDFoXlvbLcu80vAtUiI7ta1jSGrE/KxDN/k4X5MdPI
	ZAInL/Atuct1xJNVpGM49a8eJGNz5jT6vhkX3T1fbwUpTld8YophJZ1d80bZmir478ZbTqO/kvqMH
	5YTmeBZw5QMDoV1UoivTqXuTi1cUH1XtubG/MXbsGFcrw8Xuubzs7y6h6SxgHDrCVo/tirBx18vLh
	OgW8kgePTuLtg2btGThjPaAZSbLyCYbotmx/x3hSDxORVGfySAEWvQUTwp0PfYj0InS7x2lnUbz0Z
	oh+GH9aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM2vP-00000002KrO-07FF;
	Tue, 25 Jun 2024 09:57:19 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM2vI-00000002KqB-37Xy
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Jun 2024 09:57:14 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-6e7b121be30so3954469a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Jun 2024 02:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1719309431; x=1719914231; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qF1YJYptXWfDBxwzTIeTgvB7dEj4RfJtD5/KNTKFabM=;
        b=bLnHm0Rq0qpX88o5b246bRfkKBuE7iwdhE/TQ9nH5zBEp/oWMEfAxjun2MA83z/DSq
         nwTN5UxPKjut6i5/5D7cDXIiOpBzse25p7ewX1nYf65QXI/WU7QAzE3QXVu1Cec1XwvV
         6ovWQZgX8fvgtXNm6QHXSZiVN2soPw0p931Go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719309431; x=1719914231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qF1YJYptXWfDBxwzTIeTgvB7dEj4RfJtD5/KNTKFabM=;
        b=D9kCH9JgEml7CUQfOaKjFrsgaED+v6U2gwhDpDcdvAc2AR2QLInIAPyZ3eKNW0T3BZ
         OkxWKbA/vm8mrWkVWghCgw+3bjXOn/ofqG9htjSPLZLn1BXmZDGPaw2CsJk/1gMk7/Id
         gPZPzPtrycXkZC0HCEPJS1/PUV356rH9z8J/n4FBaBV6cP2v8Mra79Y2kNRaywcmlN54
         IpaMwQhWXMVsKSvAvw707DaWZErcVOxgM/S2d9KNjHVtmGRpFH94oE3mZY1rz/YTQ5PR
         nqlT/oksE9wL3c46u6TnCxTtTQy/8AwnanJP/vOBsDREjdKTakkkZD1DVYGz1oalc8p7
         6AWw==
X-Forwarded-Encrypted: i=1; AJvYcCUrzYY4gw/qCj+lxY/F3eVqIq0BVBXLeNgrXM7TuRwfAJ8MvSQC5yVvdMwwBVZ+yzX//ToCa82HWJEre8KQD7Ld9rhwf/xVIbIXRe6QNk/rbhJ+
X-Gm-Message-State: AOJu0YwR6NJx/sxBvgHIpR+yLJp3grteafJjsc8K2L3gFIsMDSwG09fW
	xjMnEsZE7+pkZdgvsmBkhaMOY4J6HMkiqzgf9+aSMAMF91J2/5S+o2a9yE7CMg==
X-Google-Smtp-Source: AGHT+IHpPnnOVZu547p/nqZZHcdZDYKUwYH9Z0EG/miyFDAKG8tkNavHDYu9ST2rn8SZoZX4/BKRwQ==
X-Received: by 2002:a05:6a20:b906:b0:1b6:6d41:7bd5 with SMTP id adf61e73a8af0-1bcf7e7664dmr5586707637.15.1719309431324;
        Tue, 25 Jun 2024 02:57:11 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:ea5a:67dd:bd1e:edef])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb32b8absm77094295ad.117.2024.06.25.02.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 02:57:10 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8183-kukui-jacuzzi: Simplify DSI endpoint replacement
Date: Tue, 25 Jun 2024 17:57:04 +0800
Message-ID: <20240625095705.3474713-1-wenst@chromium.org>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_025712_807282_D8FE7BF0 
X-CRM114-Status: GOOD (  11.28  )
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

Currently the Jacuzzi dtsi file redeclares the full DSI endpoint tree
from the DSI controller just to replace the remote endpoint. This is
not necessary since the local endpoint already has a label that can be
referenced. This will also confusion when the inherited layout is
changed.

Replace the redeclared DSI endpoint tree with a label reference.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi     | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
index fa4ab4d2899f..783c333107bc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
@@ -91,16 +91,11 @@ cros_ec_pwm: pwm {
 
 &dsi0 {
 	status = "okay";
-	/delete-property/#size-cells;
-	/delete-property/#address-cells;
 	/delete-node/panel@0;
-	ports {
-		port {
-			dsi_out: endpoint {
-				remote-endpoint = <&anx7625_in>;
-			};
-		};
-	};
+};
+
+&dsi_out {
+	remote-endpoint = <&anx7625_in>;
 };
 
 &i2c0 {
-- 
2.45.2.741.gdbec12cfda-goog


