Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B505FC433FE
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Oct 2022 09:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DkHMIRX0PtZEilJiS4bmFZHJWooEn5VptusI4EzbSkk=; b=Qb3CDapmNLL4j1
	dbP1R9GpMdUJUhn6wXKsYkLwJ+u263FdJ4Yxsu++p5YOKcMk/XR4Cz8h8eF63qL414fndsoma4umx
	ZGv8IzNmkfexjAEFzIFhSGn+nPxQCsSGKsn+ouFQ9NyifNahxeo8S87SuSGgxc+3W2Cz5eH402Bb8
	mLHpkDwy8GH4ro6Hlhgf0I/tS2C8jJjybS94qFXEvadJ/1Gyfglj5/2H3EYrcYBMben2d8scGdAq4
	kYry2/um93weEOEovI9JM9QBfFYILFSd28Nql86d0zLkp4L29op7Ho+Sk89tkd7N8JIaG5utAEyyB
	fKaTVlqPoL97O54PXGFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omX4f-00EmhU-9n; Sun, 23 Oct 2022 09:15:17 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omX2j-00ElcF-9p; Sun, 23 Oct 2022 09:13:21 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout4.routing.net (Postfix) with ESMTP id A4CB0100105;
	Sun, 23 Oct 2022 09:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666516392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DkHMIRX0PtZEilJiS4bmFZHJWooEn5VptusI4EzbSkk=;
	b=DXa0DwoHnRr97FlGjGthS8d2qmmLDOX1SlDvmaHDJVQQ2EvDYCOlPgVQhoTi7CzfqnMCA1
	/0AZFWObx2ewz7KXui0TY99AUQXapg7UaB6AFVC2Ye4kt/yzmM4D40N26XcyrO12pmA+cG
	lWSv8/fP8QCLaDH2wg5uaOF0gP8o7Ww=
Received: from frank-G5.. (fttx-pool-80.245.79.234.bambit.de [80.245.79.234])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id EE66910031F;
	Sun, 23 Oct 2022 09:13:11 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v3 5/7] arm64: dts: mt8183: drop drv-type from mmc-node
Date: Sun, 23 Oct 2022 11:12:45 +0200
Message-Id: <20221023091247.70586-6-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221023091247.70586-1-linux@fw-web.de>
References: <20221023091247.70586-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 0b6fc260-44f2-42a2-a722-ba39a77fe633
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_021317_498983_5254AE1D 
X-CRM114-Status: UNSURE (   9.06  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

This property is not defined in binding and driver.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
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


