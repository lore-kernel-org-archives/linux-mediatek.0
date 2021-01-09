Return-Path: <SRS0=452w=GM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 651F4C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 19:10:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD4162399A
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 19:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD4162399A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KPzpZbihs79CGU1647BLtdqinAUGF+dQdpnXXz39QvI=; b=COh30Cbk8Z9rInFFjQJTi97NJ8
	LVHh8CcP+oU+VoIA8VbO8M0yRsL/YBMpBuLuXnDcZ+h6TFb6rUJqnoKKSl2OU5EUaEhwenRlL+FtA
	D0S6ENaB+1PTUboajmSYU7bdp3/jQ0hwbto3hCDyLJwfbG9TAx0olSzYuZu+4hh/IE+RifyXlVrU8
	UeWaxchvSI5htrq1KE7yBWN4pZLGDViAoyMIxpuWlwUjPnMCj0c7ngkCXBeBvLTLhNlunHMzPX770
	UfDr9IqzkSmfCwvl+qRA4DEdX474qw36wYv26AQmkjEzOGSscfqrum33C8cxvV25U3lipiMtcRvPm
	YTlu1K6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyJcs-0007vM-TN; Sat, 09 Jan 2021 19:10:14 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyJcb-0007qv-5F; Sat, 09 Jan 2021 19:09:58 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
 by mxout2.routing.net (Postfix) with ESMTP id A41B25FC9E;
 Sat,  9 Jan 2021 19:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1610219389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=XpgzSghv0Wxw9asdQngnpZPIOGMcIgZPVkLOdIlJRYI=;
 b=vvlHvtUklHiCwxZdUWM0dthY+wn4Bmk4BSTUcbVWYnbHPyXiNKSoxoCz5QPu+i/Fja/jj1
 EksCKjwXI5JDkMR+Bu3Fg+AdAjsuG2UD0O8Bwlc5TOVFJBELBG+sGF52V+Q2yDmHFJrBl9
 yNob0BBAx8Wk4Utycq9hfVUXm8jTm6w=
Received: from localhost.localdomain (fttx-pool-185.76.99.44.bambit.de
 [185.76.99.44])
 by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 8C57940093;
 Sat,  9 Jan 2021 19:09:48 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH] dts64: mt7622: fix slow sd card access
Date: Sat,  9 Jan 2021 20:09:37 +0100
Message-Id: <20210109190937.42409-1-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mail-ID: cff539b1-4803-4f04-9e43-eb68cec062bb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210109_140957_586204_5914A3CA 
X-CRM114-Status: GOOD (  10.19  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Wenbin.Mei@mediatek.com, sin_wenjiehu <sin_wenjiehu@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jimin Wang <jimin.wang@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

- change sdcard (mmc1) to uhs by change vqmmc-supply to 1V8 because driver
  maps pinctrl depending on this
- add reset-control for mmc1 like it's done for mmc0/emmc

Fixes: 2c002a3049f7 ("arm64: dts: mt7622: add mmc related device nodes")
Fixes: 0b6286dd96c0 ("arm64: dts: mt7622: add bananapi BPI-R64 board")
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 3 ++-
 arch/arm64/boot/dts/mediatek/mt7622.dtsi                 | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index 2f77dc40b9b8..916ca89ab8eb 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -232,10 +232,11 @@ &mmc1 {
 	bus-width = <4>;
 	max-frequency = <50000000>;
 	cap-sd-highspeed;
+	mmc-hs200-1_8v;
 	r_smpl = <1>;
 	cd-gpios = <&pio 81 GPIO_ACTIVE_LOW>;
 	vmmc-supply = <&reg_3p3v>;
-	vqmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&reg_1p8v>;
 	assigned-clocks = <&topckgen CLK_TOP_MSDC30_1_SEL>;
 	assigned-clock-parents = <&topckgen CLK_TOP_UNIV48M>;
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 5b9ec032ce8d..7c6d871538a6 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -698,6 +698,8 @@ mmc1: mmc@11240000 {
 		clocks = <&pericfg CLK_PERI_MSDC30_1_PD>,
 			 <&topckgen CLK_TOP_AXI_SEL>;
 		clock-names = "source", "hclk";
+		resets = <&pericfg MT7622_PERI_MSDC1_SW_RST>;
+		reset-names = "hrst";
 		status = "disabled";
 	};
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
