Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F72E7719A
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2025 08:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKxLwEb+Svw+X4QH38G5HrIoOKZ8wZ/vH6v0ze5XZw8=; b=QUU3DPR4k/WLW8Ohs5kfOdVfuv
	ywH96ahKFyKvKSDcJZ6xMQ+y4r8sdsXUU3+Nazm4pD23lDpKTATBEpVTeGnyRn1jE+PM38xruaSZO
	Eh+BJhs1rqpY7MP5gLXh6bVCkDDXhpO/JfRsWS02dCGV1F3MqzB/zeCISd5JbeTpldEcdBz7usxsE
	PvI0eFEpfg1uqi+kHa8oLwqtZVWnEX0ezW4QunScSiTchfgxFlGVD9T3KofbEvPPUrijLb6i/OkN7
	TphIDljUExF0U6GvSze8su8R3/pAY5AMBk7ofA3o6O33uX8F9/ZkFN+A4gHa8yhYi5LVAXnoXOZKr
	kFUKpp3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRYi-00000007aYm-08aY;
	Wed, 08 Jan 2025 08:37:00 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRWM-00000007ZiE-15MS
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jan 2025 08:34:35 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-216401de828so230187625ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jan 2025 00:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736325274; x=1736930074; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKxLwEb+Svw+X4QH38G5HrIoOKZ8wZ/vH6v0ze5XZw8=;
        b=aJ2g3lyICfWATPzcxgTeHmmLf4yXBziCaZJYrdTcCegA/kLs3LF5wPwGp/uxuAe7+T
         VieosqAAAAgTMpdeafDmB6ZAhrd/pUUMDR1GufUSMv631zlYUPSfKF0J2QTMVp6uqL27
         xTDOuPlOFJK45tJmUQBu9wuK5HpaCtftxAF4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325274; x=1736930074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKxLwEb+Svw+X4QH38G5HrIoOKZ8wZ/vH6v0ze5XZw8=;
        b=FtTlf02sRk94mqOGm8kZnLkI683c82ymPKRXKqjMRQcNK+bkEtot+PZ5SMhmXOz8PQ
         G3iyvIrJ9u1IC5C/vxmI59HPsX3y9x4ommSqRp3An++t2fg0uoDg+cXNQHM0sOhmsiJy
         uEESS8DEgaVHWOmCLlHO9xrnQkHqv6RDiWsioqCxfkguo/UWMwbSPGfp+V4lgvTsmNa4
         a5370ql9Y0W0rqE/8kC1434y4DgrJHPzeKPlccsdSv17+xBmPufVWjlgV5wBL688Llzw
         c4+2XeISqd6iVujFdvZFsBJaBAluj7aol78gTYCSH5KJGNfJPDi23JBwJxopQ6d/ecnV
         JNVw==
X-Forwarded-Encrypted: i=1; AJvYcCV7k5ybQvbs6nqVqrOP+LHbZ2l0CZe5WiXmPg5C4dS20HBXWPvbqHabJAcbIyhQA8tmRhN5BOdd7Bdgi4Tiig==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3J41+Eq66/w8uTNrK7j78OQecwbnEr0g76jbApxb65dYsq4xq
	YhQC6ayMeVIm0NhNbuWM5NstxMRWzN8Ggur3hJFJVZQboBeB/B9UCLwwGadFWQ==
X-Gm-Gg: ASbGncvRl6hSO4L/AVceWoFnRwKRey+D+bDCfkgcX79/q7FDnO++UhUM5Xhzi4wLiNF
	Aq2GbSXAiMgTq+n97D1sDOjuHsB1BMfzlsZ4enV60ZxC+uuaFyMZoVvr8wGaiKu4ICxloNike15
	7XBUFY2+sLBGeZYCn8Ncbh2yetfdZr73phsrHTZ2ICLaDOtlHrlecY9XkfG2D8WY9QWEVtt4Ulc
	MLCNHAUuWsgmyfg2e6Hdlddk4O6m5w4fTrz08KSUb+lIbuFLvkXZkzQB77YKocfM2nOwwMYZyo=
X-Google-Smtp-Source: AGHT+IGoE453H+6MpzjtZuhQVjLh7PmBh8mNjt0KKWtYW5XDmoMsP3lohDn3YLYpcAwJgLD11Zw5LQ==
X-Received: by 2002:a05:6a21:2d0a:b0:1e1:adb9:d1bb with SMTP id adf61e73a8af0-1e88d0dd4a6mr3868377637.44.1736325273798;
        Wed, 08 Jan 2025 00:34:33 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:511d:2d5f:1021:f78f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8361b7sm34602275b3a.74.2025.01.08.00.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:34:33 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Eddie Huang <eddie.huang@mediatek.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8173: Fix some node names
Date: Wed,  8 Jan 2025 16:34:23 +0800
Message-ID: <20250108083424.2732375-3-wenst@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20250108083424.2732375-1-wenst@chromium.org>
References: <20250108083424.2732375-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_003434_300949_1782CF17 
X-CRM114-Status: GOOD (  10.90  )
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

Some node names are incorrect, causing DT validations due to mismatches.

Fixes: b3a372484157 ("arm64: dts: Add mediatek MT8173 SoC and evaluation board dts and Makefile")
Fixes: f2ce70149568 ("arm64: dts: mt8173: Add clock controller device nodes")
Cc: Eddie Huang <eddie.huang@mediatek.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index f49ec7495906..6d1d8877b43f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -352,14 +352,14 @@ topckgen: clock-controller@10000000 {
 			#clock-cells = <1>;
 		};
 
-		infracfg: power-controller@10001000 {
+		infracfg: clock-controller@10001000 {
 			compatible = "mediatek,mt8173-infracfg", "syscon";
 			reg = <0 0x10001000 0 0x1000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 		};
 
-		pericfg: power-controller@10003000 {
+		pericfg: clock-controller@10003000 {
 			compatible = "mediatek,mt8173-pericfg", "syscon";
 			reg = <0 0x10003000 0 0x1000>;
 			#clock-cells = <1>;
@@ -564,7 +564,7 @@ vpu: vpu@10020000 {
 			memory-region = <&vpu_dma_reserved>;
 		};
 
-		sysirq: intpol-controller@10200620 {
+		sysirq: interrupt-controller@10200620 {
 			compatible = "mediatek,mt8173-sysirq",
 				     "mediatek,mt6577-sysirq";
 			interrupt-controller;
-- 
2.47.1.613.gc27f4b7a9f-goog


