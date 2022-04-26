Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E23C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 13:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K4+zvQiLG37axcf/cGiYtrRcLQs0/5bc3T7YeE4KuDs=; b=L/oN3np262A4DE
	v0y1IovxOpLyvEWmmTx+9yfnpdbiuP/03vsyMAiGsQ8Wv4KCDnsS42EQHn+AujUXLvEhPD/BMaCa1
	Fnse050UirKOul/35V9cbNPxxF7iTWwGqKRkc6S3o+cnlwPdFZuXfx0oaHiEvlprVHGE4Awy4IytJ
	AT+ZaKBXJIcpI3zHIB9mG/h3WceT1u2pD/yUw/QdmJrDp/Im4KnyUF/0W2OqGFs+eUA5Unuogn5+Z
	4Ff8rOcw85A3aaI/6fm4Qty+CmRxOkhlERRl0wnVOK11fd/otufxLuxkF2mOczqSc2vd6OU5wOHx7
	uXcjK/ltaDQF9brJMGpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njLTw-00EhYt-H0; Tue, 26 Apr 2022 13:43:56 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njLRz-00Egao-HN
 for linux-mediatek@lists.infradead.org; Tue, 26 Apr 2022 13:41:59 +0000
Received: by mail-wr1-x433.google.com with SMTP id v12so18723720wrv.10
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Apr 2022 06:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lRfVC5aaQ4N6y57lWHZ8XzBxGf9B+nlX2tNH+pQF5EY=;
 b=Ohi3dOa+z+/2uqEnU+QGx15AYZjcV5LG3H81paqeYyTAEYMJCy/MmTBgSVtbIL4nRw
 yU3+HzaVaQEeG/ya92peeYASG7VtFTWsCVTT21PM+J/8bDS3/wD6G2O5SLVoEIWm61Py
 Oi5jIDHqqp4P86mP/fIG9bN6grsDjmLLiP5KCcvivwCkzYfhsGFxETfcEOLoa59Y5jhA
 RNe1MkZ17JrECnn/rQuVNH+7Esp7WumapPaNcDoqVtKYc2TuFkUXY6lQT3t8jddP+dCf
 7uhZ+z2ZpQ2mOtueekHx1CFNRrZGvs/4Nui1vf9up65ItkK8rh10R/L266I74UkknfeT
 jV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lRfVC5aaQ4N6y57lWHZ8XzBxGf9B+nlX2tNH+pQF5EY=;
 b=SHNdQAXWNS7DWmGjzIwtbIhmElVD3RUceaMgptUhxh6aogClr8uLF/M+x6zdSHudai
 tIc53m09zBl4ZYgLuHBgfF3Cntbglry0uI76to+A5uODg9QCJHN9KYwDSjDfKNM4aneg
 uFtewI+/F21TuCq7HW6VtPzVH/Qvfl8jTlD97ZfooEuHAJnRi9WQ41BNPTwZ+j2Wicu9
 haMn57d7OkEU/fc9e595RGlimNInSAvbSs/U2jjxx4v1Rv4AvURA1pX8qeGlzw/Cv+sE
 GWnsfc+oSwRQD6eAgDhALN2b1GBD1qNEXagMTqsji/Gm9HPEETYs4Axf86KN5towBSrl
 GoTw==
X-Gm-Message-State: AOAM533wO6t5riTYOnZfiP0vAyuPl7jZCN3Uah0T+vwTDZ63tblR1ukw
 nuarMe9rKT5bgNbv9UMOMgx2Nw==
X-Google-Smtp-Source: ABdhPJzBLZfCcm8hoYkEZchekZF0zzr274AwXjGp/5LtIjvGZKDbBEb1QoUBNKaQ+Aixc1sCq9/WyQ==
X-Received: by 2002:adf:ed8f:0:b0:20a:e2a7:7201 with SMTP id
 c15-20020adfed8f000000b0020ae2a77201mr3991412wro.26.1650980514411; 
 Tue, 26 Apr 2022 06:41:54 -0700 (PDT)
Received: from radium.lan ([88.160.162.107]) by smtp.gmail.com with ESMTPSA id
 b6-20020adfd1c6000000b0020aac8a9946sm13628475wrd.47.2022.04.26.06.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 06:41:54 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] arm64: dts: mediatek: mt8195-demo: Remove input-name
 property
Date: Tue, 26 Apr 2022 15:41:04 +0200
Message-Id: <20220426134106.242353-7-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220426134106.242353-1-fparent@baylibre.com>
References: <20220426134106.242353-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_064155_629055_E7251E1D 
X-CRM114-Status: GOOD (  10.69  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This property doesn't seem to exist in the documentation nor
in source code, let's remove it from the device-tree.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
This patch is related to [0].

[0] https://lore.kernel.org/all/20211123065158.1383182-1-danct12@riseup.net/

 arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
index 0b7985486e2a..d1f650d99d7e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
@@ -35,7 +35,6 @@ optee {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_pins>;
 
-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
