Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0303C25B75
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 May 2024 21:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=seSUTRRGhsxF1oRs+boO/6Tfbiu/AtXgg4hjQH7fMig=; b=iAxgqKDJVbOhBVk5zVXwiuG9yQ
	C58ulXbnjRwufMcRgQckvdmXdPZgDTQCXititg9QfIuw5VaKq4BQUxbeymmzK5uVC1I7ciTohimhU
	VpJq7V2qE0irFXjYRc408GuCi+q8Xvkw1RPKkywUg824oeXdmEnD+auPQIwzEG6vTJKswudc4Dh92
	P8rgY9ZbWCCnGjdN5xmgnJq27OifyNst+7K65nTbaQUBLp4DkjdyiZsJUSi/T9yhCymgnXxds8dTh
	NR5khsaCWy5ysl3kciTlLV5q+DMLwCGE53TDAvN7aroLLmYsgEAHWIQOkcthiXtD+7RpXS+O43e+q
	IVCN4BYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDA9x-0000000BXxo-2NZz;
	Fri, 31 May 2024 21:51:37 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDA9u-0000000BXuw-2Aab;
	Fri, 31 May 2024 21:51:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717192287;
	bh=04+WeNiKlZeRvQNUcqF3z/qfK0uGdQPsEySldyyd/QE=;
	h=From:Date:Subject:To:Cc:From;
	b=KTACTn4QyLzhjtURNz0GjuGW8Y0d56XUFT9jEe1aFuXv59WRB+MkgToQwUTV7Gcoc
	 ucHZWhCfGhNTmPcId6sBnT5AJLYdErTgSy55+/LpZsje9MWONalK80s7uo22HP9x6K
	 UPcLZT+PYnw9i1c3UDa32oG6HBWctx6340MIC5JX/g5MCymPOe4asWqDdODXlNoLUm
	 UoNGHrJcUaumiLBM2wsFlxm12AJKpcsFmOiAjV+HPTNn1G0QmzY1Be8ENRpB1YcZK+
	 YuX8dVOcZQ3aMVyhu1cpL0IUxQhpOKc92lX3Jr5FN+rT6B3pLENIltxJJaZqalgYFT
	 7PcmATw6Dn98g==
Received: from [192.168.1.231] (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 754AA3780EC6;
	Fri, 31 May 2024 21:51:25 +0000 (UTC)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 31 May 2024 17:51:09 -0400
Subject: [PATCH] arm64: dts: mediatek: cherry: Specify pull resistance for
 RSEL GPIOs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240531-tomato-rsel-gpio34-35-fix-v1-1-64ab2545f182@collabora.com>
X-B4-Tracking: v=1; b=H4sIAExGWmYC/x2MQQqAIBAAvyJ7bkFTKfpKdBDbaqFSNCKQ/p50n
 IGZApkSU4ZBFEh0c+ZwVlCNAL+5cyXkuTK0sjXSaoVXONwVMGXacY0ctEFtceEHVW+dn520XnV
 Q+5io6v89Tu/7AUpzSuprAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_145134_748510_0123E5E3 
X-CRM114-Status: UNSURE (   9.51  )
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

GPIOs 34 and 35 on MT8195 are of type MTK_PULL_PU_PD_RSEL_TYPE, meaning
not only can they be configured as pull-up or pull-down, but the pull
resistance can also be configured.

The current bias setting however doesn't specify a resistance value,
resulting on the following errors:

mt8195-pinctrl 10005000.pinctrl: Not support rsel value 1 Ohm for pin = 34 (GPIO34)
mt8195-pinctrl 10005000.pinctrl: Not support rsel value 1 Ohm for pin = 35 (GPIO35)

Specify the pull resistance for those GPIOs to fix the errors.

Fixes: 5bf7dabe40f2 ("arm64: dts: mediatek: cherry: Document gpios and add default pin config")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dts   | 11 ++++++++---
 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts | 11 ++++++++---
 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts | 11 ++++++++---
 3 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dts
index 88123842c818..49664de99b88 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dts
@@ -82,12 +82,17 @@ &pio_default {
 	pins-low-power-hdmi-disable {
 		pinmux = <PINMUX_GPIO31__FUNC_GPIO31>,
 			 <PINMUX_GPIO32__FUNC_GPIO32>,
-			 <PINMUX_GPIO33__FUNC_GPIO33>,
-			 <PINMUX_GPIO34__FUNC_GPIO34>,
-			 <PINMUX_GPIO35__FUNC_GPIO35>;
+			 <PINMUX_GPIO33__FUNC_GPIO33>;
 		input-enable;
 		bias-pull-down;
 	};
+
+	pins-low-power-hdmi-rsel-disable {
+		pinmux = <PINMUX_GPIO34__FUNC_GPIO34>,
+			 <PINMUX_GPIO35__FUNC_GPIO35>;
+		input-enable;
+		bias-pull-down = <75000>;
+	};
 };
 
 &sound {
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
index 2fe20e0dad83..2d6522c144b7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
@@ -19,13 +19,18 @@ &pio_default {
 	pins-low-power-hdmi-disable {
 		pinmux = <PINMUX_GPIO31__FUNC_GPIO31>,
 			 <PINMUX_GPIO32__FUNC_GPIO32>,
-			 <PINMUX_GPIO33__FUNC_GPIO33>,
-			 <PINMUX_GPIO34__FUNC_GPIO34>,
-			 <PINMUX_GPIO35__FUNC_GPIO35>;
+			 <PINMUX_GPIO33__FUNC_GPIO33>;
 		input-enable;
 		bias-pull-down;
 	};
 
+	pins-low-power-hdmi-rsel-disable {
+		pinmux = <PINMUX_GPIO34__FUNC_GPIO34>,
+			 <PINMUX_GPIO35__FUNC_GPIO35>;
+		input-enable;
+		bias-pull-down = <75000>;
+	};
+
 	pins-low-power-pcie0-disable {
 		pinmux = <PINMUX_GPIO19__FUNC_GPIO19>,
 			 <PINMUX_GPIO20__FUNC_GPIO20>,
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
index dd294ca98194..9049d362a5e0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
@@ -20,13 +20,18 @@ &pio_default {
 	pins-low-power-hdmi-disable {
 		pinmux = <PINMUX_GPIO31__FUNC_GPIO31>,
 			 <PINMUX_GPIO32__FUNC_GPIO32>,
-			 <PINMUX_GPIO33__FUNC_GPIO33>,
-			 <PINMUX_GPIO34__FUNC_GPIO34>,
-			 <PINMUX_GPIO35__FUNC_GPIO35>;
+			 <PINMUX_GPIO33__FUNC_GPIO33>;
 		input-enable;
 		bias-pull-down;
 	};
 
+	pins-low-power-hdmi-rsel-disable {
+		pinmux = <PINMUX_GPIO34__FUNC_GPIO34>,
+			 <PINMUX_GPIO35__FUNC_GPIO35>;
+		input-enable;
+		bias-pull-down = <75000>;
+	};
+
 	pins-low-power-pcie0-disable {
 		pinmux = <PINMUX_GPIO19__FUNC_GPIO19>,
 			 <PINMUX_GPIO20__FUNC_GPIO20>,

---
base-commit: 0e1980c40b6edfa68b6acf926bab22448a6e40c9
change-id: 20240531-tomato-rsel-gpio34-35-fix-185acda05c17

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


