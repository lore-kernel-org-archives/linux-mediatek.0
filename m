Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7267F109318E
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 08:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aR24nRcCaE/rLy7RyBGgujkxzzBF1DIVho+ovF6igY0=; b=pdfuB7/NgFTC1T9Z00T+XcVZ7k
	svnzA1evPyf9VUtmZUdxSGj1LY6v2luSP8BsW1KChBL1dp/HwdMaM7QNkEQHsRFQNTY6YIcYHT1G/
	P3RjUIkqFIWonDX5Iw7E1ZbMMVJPjCwqQziy+UbUewsglVKAOMtU9LiIn3qtnPBPuOl8grlZkzkIR
	fygORErFytohXe5mX6CWfW+B8KB+S8P1mSOYa86u0qCaHo1Jpaw3reR1K+zuPJpthQm4t+s8V62tg
	0uGDNFOrQT7FybNVIjGEFt10/Q4I0oJortnSOR23MZlTA0CI1FGqqQxHaP7ezzvyk3a1PI1KeNp+h
	Ie076/+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSz-0000000CNwe-1vS1;
	Fri, 20 Mar 2026 08:44:25 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSq-0000000CNmV-1PIU
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 08:44:18 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ab232cc803so1514735ad.3
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Mar 2026 01:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773996255; x=1774601055; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aR24nRcCaE/rLy7RyBGgujkxzzBF1DIVho+ovF6igY0=;
        b=b2QfDxyuugqoznW2XkUAoscL5JitgtPYqiVeziicXSJcoYt0yp64bvPAjuL2AusS+4
         uh83bfb5QvMMV2x7eV8x+ZG+UTMs1A3lizagSIdI3cI3atwhCR1ndsKwJy8vAanQ1A53
         EOHcj0DM3pgJ5ig8QckO9YYlLMb4urJyN99lw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773996255; x=1774601055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aR24nRcCaE/rLy7RyBGgujkxzzBF1DIVho+ovF6igY0=;
        b=r5SEbp9hEiQWeaXOB7sR3eSmTw5RXGfXRg/tfWdgcwlbk6INekEFmCzd0nEAaQd0Ua
         bVZskzE16NANGIrsHUXk/msJTqAgplAv46XAdYCvlDB77KwtxPn2iB3+nlWrmbhd9ozE
         j9c4avqP7ei1WeGxHgNRyuov5ES4V43TzJTpWLDVL8ncETb8nLgfLiN3EbvdF7eGKafT
         MUCuvJiIj4p2377siKpPPdIAB+DbdFF+29HJrBTa8vnKfWgbXncRKCLcAoBA1GDaC0v+
         8JV1Ar6CwaX5fYwQl2Z0z3Y1QqIvpqb6n4F3uYTcwfTKoMgszJ1IqA9YAx8yn0E6wsD1
         K2fA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ8lYglVTy9abspqXIe+p6OQw/MncVjtgeC3WGHEOYLf9xqksODp35QVd3T5VL6nHKFmdaYUKKOeL4nAfX/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YybBHQK09xuAFu7AH3d8zfu1tRoa4+hq4Mf/7N0W5M7K80caaLN
	19VGVYXUpAGD7H52usK/ySu+Hu7ESNmKTBzqjFF2anzQ4z2kRjQy26OEBDrfs9MWHg==
X-Gm-Gg: ATEYQzwheZbn1/OxOFs66o43cCympbBqAzp2Eb0sDBka0vi3wVrbkUhs4gdQPqWdgwE
	ASq3HVoV3H9ZpTne6VRQqs/ADEm/IEbcFjkCnauRmWZsOm5TADeeYmHEN0TcbdVCc0cVaVTha6p
	LdHZh9670MtF8AumGmvCTDlNbHAOeq9yn8ZeBviHdZLZh8xkdSaxYpvoMp89Db7v5aDvKiQn5uU
	kionkNOo/uSTYyZFr9mixbGFK7Zrjsj0V/82jeh92HdxhX4XntJPteLsLAUTiqAc1tTBL3V8C3M
	KFysabcYgbIV5z63W4/aXHcA4A9LECC8wtpwFeUkKka5XHYl/AnmmNueT955BY4DrwsrrSMJyD7
	cTP9PFa2Y9WMeNzVZDcyrvi1Y0/Re0tXeBFhb/rmMynBjT5mRILKYS5wSfc+DCdeAsTsQhkKZcC
	v1WGba8dzvOW3Kg/oo6wrX4kWIl/rDPYdDwnJqvdhJEUWaSfOUv2vtymjU/NP7SbdL9l6Ce6emc
	7X2abvg
X-Received: by 2002:a17:902:fc44:b0:2b0:7026:24bf with SMTP id d9443c01a7336-2b08271d51bmr20115235ad.14.1773996255498;
        Fri, 20 Mar 2026 01:44:15 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3066sm14917905ad.75.2026.03.20.01.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:44:15 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/13] arm64: dts: mediatek: mt8192-asurada: Add SPI NOR flash power supply
Date: Fri, 20 Mar 2026 16:43:39 +0800
Message-ID: <20260320084351.2461060-8-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320084351.2461060-1-wenst@chromium.org>
References: <20260320084351.2461060-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_014416_657124_94558D3D 
X-CRM114-Status: GOOD (  10.21  )
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

The device tree for the MT8192 Asurada is missing a power supply for
the SPI NOR flash chip.

Add the supply for the SPI NOR flash chip.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 143f7f4161a8..b71c4c87730b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -660,6 +660,7 @@ flash@0 {
 		spi-max-frequency = <52000000>;
 		spi-rx-bus-width = <2>;
 		spi-tx-bus-width = <2>;
+		vcc-supply = <&mt6359_vio18_ldo_reg>;
 	};
 };
 
-- 
2.53.0.959.g497ff81fa9-goog


