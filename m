Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8116FC54E94
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jan 2023 15:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OFTnHcRctLWrnULhb3EI/HUIzsZhbsTYXYP8OfwRkEw=; b=fBDJ7SLJLiMjsTNRzo/tL6XBPH
	H6Cxhe+JApyL0V8V9iTYKGItnSj+Q/Sv5K3eAuuWduZdmB1SSUU0A1kjgPhdjrblu/bgVovEJFuk+
	B1z/iXBxnGttOryWSBXdA+lFP3GG8oOgiDttoJAYY8BaSBjuH4OwCw3RB8962TVbaIsSLKhb51T1Z
	wqEv+TI/TzXGZFL1K8uavyUk/9ltmBUZe6I92CRHxlH02NrulJNKWujswIRiZR32p9FHU6wAA5sk1
	XRDLM8Mec+4ruvE9ep+5usnMJrg4K6BIIyPkUk5fQWgy9b6qi+TU2rYUshNSqdjcsuiNP0Nex01B/
	JirNmd7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJywS-000Gaf-Dm; Mon, 23 Jan 2023 15:41:04 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJyYp-00073O-Lb
	for linux-mediatek@lists.infradead.org; Mon, 23 Jan 2023 15:16:44 +0000
Received: by mail-wr1-x431.google.com with SMTP id y1so6632277wru.2
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Jan 2023 07:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OFTnHcRctLWrnULhb3EI/HUIzsZhbsTYXYP8OfwRkEw=;
        b=ntVxbmy6Fq0vOni4vVui6s4bRpjxK3RukrFp13xG0a5SYybDV2IsZk7PoZx297/T7m
         xUdg3rdDVHEYXmeCsp/nof1/mYreJEWye+gvVmJNxlGoRlvsKu+rs0i3PMysgqkxyszv
         vGQ9EirwDhLgGMfK5z64e42HMg4ED50n6jfbOM4pQFmxc8rF+n1fXrs//huwKsLV9bEh
         pjBgRNIlU2p63XQC+KIk/qdYEbK3VUpZxtXtOJE9kjmlHjnvPtbnDAuowlRyErae0rdi
         XbpL6sjoApOUeneDfVkL/z5rFuobGwgGR0Yl4HG7lr7OHj9s/Y5PVaQcWesrjk0PFjtN
         ozwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OFTnHcRctLWrnULhb3EI/HUIzsZhbsTYXYP8OfwRkEw=;
        b=agPe8jvxdzlKw51jqHwGsey/ERgCiRwBVU/hzcOGJfidU92+AttaQBgRw0hj6nYLNl
         U6qoYZ99DequhyP57LacwEZefiS/UgDkN6PsVWQ4auEgwxxnaqWKRl8WtbIdRVKg1LLZ
         MqB88raOWl/eoC8B9Ax2E+c4ZPF7glVfubJ56en/gMQhRho1jOPFApN/ib41iyOTkb76
         ypYJWlwUncf3YhcdHdRz53dk7WDBdgm3G/b4ibkC+uxpypTeugc+foSZJvv57NCotL9v
         Rxtyn0/BTqq5zAHcbj1ZVodmZxzRHh6i611+XOcUOUEzOQ6ze7PVbfQCSiFJpcSt+cbh
         Mt0A==
X-Gm-Message-State: AFqh2koQ1CG1Cu5VDDws1Vgnz49AQxkar07IGxiEkckrBxirtt3t4fIm
	BFg5dVoWorvMTiMsz/imgsN39w==
X-Google-Smtp-Source: AMrXdXuKXxzCkpYs6AOdh5Ygh9/C4C8N1s66O4nAlyeXCjk2dt5C/yN0NuE+xCc1aM7XRI8/Wwd9rA==
X-Received: by 2002:adf:dc88:0:b0:2bb:ddc0:dcc0 with SMTP id r8-20020adfdc88000000b002bbddc0dcc0mr20331561wrj.31.1674486998285;
        Mon, 23 Jan 2023 07:16:38 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id k3-20020a5d6e83000000b00289bdda07b7sm4529287wrz.92.2023.01.23.07.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 07:16:37 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] arm64: dts: mediatek: mt7622: drop serial clock-names
Date: Mon, 23 Jan 2023 16:16:33 +0100
Message-Id: <20230123151634.370011-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_071639_773286_871610C2 
X-CRM114-Status: UNSURE (   9.02  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The serial node does not use clock-names:

  mt7622-bananapi-bpi-r64.dtb: serial@1100c000: Unevaluated properties are not allowed ('clock-names' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 146e18b5b1f4..62487a3c4db1 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -526,7 +526,6 @@ btif: serial@1100c000 {
 		reg = <0 0x1100c000 0 0x1000>;
 		interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_LOW>;
 		clocks = <&pericfg CLK_PERI_BTIF_PD>;
-		clock-names = "main";
 		reg-shift = <2>;
 		reg-io-width = <4>;
 		status = "disabled";
-- 
2.34.1


