Return-Path: <SRS0=zPgu=IK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 914EDC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 14:58:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FE3964FDD
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 14:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FE3964FDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TNqSJiyErdwMfms03fUigL9xUNj6lieFHRID9N34XGg=; b=om2cWLh4PnXz3JMZItbFirbw9
	6/0BvDw3TJ6KxgIn1DilsiWPz5ac17GGDNdpnWnwN95eqNqBE29Jr1mkL/mp1UadetUrnS7aqxQlt
	qE73BsbKj9BblZLME5HikHqAW8Rgg3Y5rbhck1t+Fwb3uAIKP6R/Vd5kJfuWnxoQnC+AmUlTfZ2F5
	yTeSRMgvC1med6/VzmjlDyERR5FQPugot+OYLjCyr3c0C+/2cMDll9gtdG2C4Iu05fRRwBK7+trV8
	Y0vV0yM/3P6MjHneBkjJ7Kn9lgfc6qlE3fTX1pCBBDs1wJ2vTHQ+itYVSEHxpzE4ChqI/bkHLnMGR
	jSRAo38nA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKjEb-00BhMV-59; Fri, 12 Mar 2021 14:57:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKjDB-00BgiC-PQ; Fri, 12 Mar 2021 14:56:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2FAE864FE2;
 Fri, 12 Mar 2021 14:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615560980;
 bh=OQyJ253o9zsK9O8OvMY/sl3QhOqiohfjqnnr+D3rpNk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lfLmSxeiEZMU7ogKtM7X7QoOJJPNY2xIPXleeIL6OWKH6Hg0vKNxEQEHOW/cnkHLJ
 OGa3g17ZlmKnrMGt3DxCcbimgo+u++GGZKejLtIn9Qy1HfJHGIFu36UZR/7B1V/v0/
 4J2CXAJTanZYN3a61ICHRvBLGz6GThjrllJcnl/rPwbo1k5N8xSylE7DHbKbvkcGeP
 4q5wndA8kxiJJ6DWW9yeGLmjUWnyubRDxdoeEQDgfHunGs3Ao8tjaRgV2+aUncE1wa
 qLAIPJw1oegnvR8kNP7ZpAuBxyuGUq/OQ4uNTyvbIrRRad1gqw8IgXaFIEZWEoD+eR
 wTh0iLBjPphQA==
From: matthias.bgg@kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, matthias.bgg@gmail.com,
 lgirdwood@gmail.com, broonie@kernel.org
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH 7/7] arm64: dts: mt8173: Drop compatible for mt6397
Date: Fri, 12 Mar 2021 15:55:45 +0100
Message-Id: <20210312145545.26050-7-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312145545.26050-1-matthias.bgg@kernel.org>
References: <20210312145545.26050-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_145623_026681_FB54206B 
X-CRM114-Status: UNSURE (   9.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Matthias Brugger <mbrugger@suse.com>

The regulator framework does not need compatible, it's actually
superfluous. Drop it from the DT.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>

Series-to: lee.jones@linaro.org
Series-to: robh+dt@kernel.org
Series-to: matthias.bgg@gmail.com
Series-to: lgirdwood@gmail.com
Series-to: broonie@kernel.org
Series-cc: devicetree@vger.kernel.org
Series-cc: linux-arm-kernel@lists.infradead.org
Series-cc: linux-mediatek@lists.infradead.org
Series-cc: linux-kernel@vger.kernel.org
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 4 +---
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts  | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 21452c51a20a8..db06a986f763e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -916,9 +916,7 @@ pio6397: pinctrl {
 			#gpio-cells = <2>;
 		};
 
-		regulator: mt6397regulator {
-			compatible = "mediatek,mt6397-regulator";
-
+		mt6397regulator {
 			mt6397_vpca15_reg: buck_vpca15 {
 				regulator-compatible = "buck_vpca15";
 				regulator-name = "vpca15";
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
index 6dffada2e66b4..c3f2a85d55fe7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
@@ -303,9 +303,7 @@ pmic: mt6397 {
 		interrupt-controller;
 		#interrupt-cells = <2>;
 
-		mt6397regulator: mt6397regulator {
-			compatible = "mediatek,mt6397-regulator";
-
+		mt6397regulator {
 			mt6397_vpca15_reg: buck_vpca15 {
 				regulator-compatible = "buck_vpca15";
 				regulator-name = "vpca15";
-- 
2.30.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
