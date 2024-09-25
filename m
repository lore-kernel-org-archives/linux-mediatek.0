Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EDAC369CC
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 11:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hncFvWLq+2HIxkK3IdImc39anusCXRWego+hIX24T7w=; b=Fn+eAKvw/wc7GS
	XZHxY6cm54tH5Bfe0hKtBxPsrB2JfjGIiAlv0pmzvTBaCOdFIiYAjVlCsIw56QGuVP3xtlDBoTv1F
	94jQ0US5D1r4R99TaG4Awmsrdibf1s0glY8Xb3LDCBi4zmUxzR6zmDRSzM1Fb87dBg6ZChzh+0BM9
	PRq9dqlC9SB0VtumokqXLCSxmBK/18c2FEGWkOmLXp3JEZ8rmSUpACoxis/xInqsNnm/xNYav3BZM
	F5OEhyFTxxF1hiIBXlXwzCjzA1e7eXBhfGyW8PwVIe9inmkvwOvN4V/I0aoU3K1aVho8a+rdRg5+D
	yZN5HqQcREs5E3wLV3rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stPqU-00000004pMr-08Pk;
	Wed, 25 Sep 2024 11:06:10 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stPm4-00000004oOo-1TXt
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Sep 2024 11:01:37 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-718816be6cbso4980248b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Sep 2024 04:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727262095; x=1727866895; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hncFvWLq+2HIxkK3IdImc39anusCXRWego+hIX24T7w=;
        b=gm8aFMzsA+RQbj8jGGca9W+o3JW5fQRq4az51clrcr170Ieo7qmdYVNHGEnms/soZH
         JUndNxtzP3uJh5U+L+YjFTfCWtdgZ3VO3Mnsn3AwoSCtP1aI/MaY9Ku2Zhc/+5jkEPlv
         l0o+SBu6lY8u2XoXadBr+qkAInfVSKXq3GQSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727262095; x=1727866895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hncFvWLq+2HIxkK3IdImc39anusCXRWego+hIX24T7w=;
        b=sBia9t08i/UYJgHBxV6xdFmoipagzHcwJ+CD5phOX8NNH3nDakG/ijN5Hn39Ty5y7A
         ct9KjCfgT5ydzFNeMLKg4WXkaOh+2Se+Yp+X6UX/X/Lmph+TaEACuaaBO9wx7vYZA1vG
         8RMl5ZCeShSUcsD4+g9R0J1hIHS+pUjC8HpWPolqND59fqO+GT8wrkL8ADPPrTEdp8Ut
         xIxxS3O2ldyUVHzH9pFQa0UB7g+NleR+dBH+IuC2VwFKurY0oAF1rnqDfOUI41i+7gdj
         kAuH2+/zNPJSJSOkTtk3DjpFRHhcMeeRq7LIJMuERZuNhkwZDBfNS8QUtp5AdTuHd/0s
         GBrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMUFw/19r1/hky+rPBi/V4FQRpMDKTaPzWaKMAdHOYMIUXLNDeD6jA9/KD4MYf/jm2wKVoUHWH4FEksxIRdw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJs7wp9R3LaIbrhiDw7Eu9aFmfEK0jioTZhO8oTJBJTuVbNkaq
	hnGWKeakoqj5x6+TYb14UgZWTsK1dnFlpGXS/OmdB72oRDBciEDq+NcfXINCy1FaWfI/iKqxkfs
	=
X-Google-Smtp-Source: AGHT+IHU28Q8f9/KJ3N8Jxjmx5bV8UUivj8/F3xolVCMLHtBase+oJeqruIcrf8KyuRBh44bM56zZA==
X-Received: by 2002:a05:6a20:9e49:b0:1cf:32d1:48f with SMTP id adf61e73a8af0-1d4d4b9bcd1mr2511337637.36.1727262095334;
        Wed, 25 Sep 2024 04:01:35 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:2b86:78b6:8ebc:e17a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6b7c73085sm2570298a12.59.2024.09.25.04.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 04:01:34 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 4/6] arm64: dts: mediatek: mt8188: Add missing dma-ranges to soc node
Date: Wed, 25 Sep 2024 18:57:48 +0800
Message-ID: <20240925110044.3678055-5-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
In-Reply-To: <20240925110044.3678055-1-fshao@chromium.org>
References: <20240925110044.3678055-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_040136_485188_928FF08F 
X-CRM114-Status: GOOD (  10.05  )
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

Add the missing dma-ranges property to the soc node, similar to how it
was done for MT8195 and MT8192.

This allows the entire 16GB of iova range to be used and enables
multimedia processing usages, like vcodec and MIPI camera.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 51bf08b2ff9b..ff5c8e0597f9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -880,6 +880,7 @@ soc {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		compatible = "simple-bus";
+		dma-ranges = <0x0 0x0 0x0 0x0 0x4 0x0>;
 		ranges;
 
 		gic: interrupt-controller@c000000 {
-- 
2.46.0.792.g87dc391469-goog


