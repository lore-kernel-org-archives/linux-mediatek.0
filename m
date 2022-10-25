Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E117C38A2D
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 13:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+KqTA8X1WXkJtVBHAMBvpE4UsH8pqMLqQ8SW7LYnkls=; b=OgbboHz/MmPEXP
	SYEBd75CoJhsx9iUK3bsKEgObXUNd5ATZ4naFUngjM1meiahUZ7fFDFKLkGprgWea644QwQ7tN3t5
	Vt1D8a4HjKuB0s5nJiQLOHb0+ION3ycU0RIsylKsGHg76l86JWjj8RPXGDqPzuaUK+MltQpWRNYjS
	qPuXHjWyzV+aZztRDe2kxWMwuT7WVSlkLA1Qu2KTI9fEqx8u9q3Wx/t17ZQgvPNEEvNcx9pnnm2Zh
	1s/dWcoZw/LbQS3niWPKljS0pLn1pi8wrnZmxE5cqJ5Uz89CuLfMM9acdcDwXdZ+n0l4KkrbxiRj2
	59JBf1b6gO0lAHm3Cc4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onK1s-005TjK-Sv; Tue, 25 Oct 2022 13:31:40 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onK0M-005Swb-OH; Tue, 25 Oct 2022 13:30:09 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout1.routing.net (Postfix) with ESMTP id 13D0341BE4;
	Tue, 25 Oct 2022 13:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666704603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+KqTA8X1WXkJtVBHAMBvpE4UsH8pqMLqQ8SW7LYnkls=;
	b=opW/QX8eaW2XDxkaSJahYnIs5eBiv750GyW+oBsM+qMEVoweVMIeqowiBmMDWn2RsjCskU
	2lV9Ccfj4LIqULGTmrQpiCRdk+RNih3ByUauYP8R5XgIs52rN6BmEponUB8Jt/Hg1bxDXU
	ykeKwF5UClaWz8Bj8o3jG9DIbybyVVM=
Received: from frank-G5.. (fttx-pool-217.61.152.57.bambit.de [217.61.152.57])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 830C44055F;
	Tue, 25 Oct 2022 13:30:01 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v5 4/6] arm64: dts: mt8183: drop drv-type from mmc-node
Date: Tue, 25 Oct 2022 15:29:51 +0200
Message-Id: <20221025132953.81286-5-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221025132953.81286-1-linux@fw-web.de>
References: <20221025132953.81286-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: dc44d099-0e74-475c-a740-2cf015df65f2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_063006_994570_5035DAFE 
X-CRM114-Status: UNSURE (   9.44  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, Sam Shih <Sam.Shih@mediatek.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

This property is not defined in binding and driver.

Fixes: cd894e274b74 ("arm64: dts: mt8183: Add krane-sku176 board")
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v5:
- add fixes-tag
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index b4b86bb1f1a7..0c9b18c16c89 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -378,7 +378,6 @@ &mmc1 {
 	mmc-pwrseq = <&wifi_pwrseq>;
 	bus-width = <4>;
 	max-frequency = <200000000>;
-	drv-type = <2>;
 	cap-sd-highspeed;
 	sd-uhs-sdr50;
 	sd-uhs-sdr104;
-- 
2.34.1


