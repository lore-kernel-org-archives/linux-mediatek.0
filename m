Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BE6C47077
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jan 2024 21:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JFAd/vaJD8kVdezbEhKkTruzpiOitp1tq471Wtf/xAs=; b=xvxfBMIHHslr3zVz6hAOJ5eNIp
	B8SHunLcaDmQokeZ1+kxcRe6I9ss50NY1Pz1yCfD1yxbK8YZdYs5rQhytLgkK/pdlc3Tc83SQQ4TF
	VMaYOsBSeIUWx46NXbXFacktP+fbJBs6u6RbEW/AhzopcEEuvQ1uiqp+DFTT4TS1BCqeWEqTB75Bq
	msyFD+7MKmD4McUEjzqPvoTZ7zprUzn35ic2HllpMOaB2wPlFHybfUbk64jp3xKfxDCZ+qMiN0Hki
	zFezGHLFrcsLRCYKtSc7vA4B8hcsR46COVVSRIA+B6nYcRZNqd75ps/RqCvLkhlQ3NGuL4rOzBkWW
	yRHkhkOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPrBJ-00DghB-2n;
	Tue, 16 Jan 2024 21:41:13 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPrBF-00DgdD-12;
	Tue, 16 Jan 2024 21:41:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705441259;
	bh=5s8DRDqJVBVIIn+xD56hZynbIPJpLvIaUigTrdQ0amc=;
	h=From:Date:Subject:To:Cc:From;
	b=QRqih3UWL6XALeYEJ3G3ySQNdQ6DRqtlu4INp/1PR3Ti+VUZiaBL29MQSdn1xwhnu
	 Sb+vCARcXJmIow58sB022+q38ZNuEpUtBdNSXnZiVNz6WZK8ZdiC0xzyVNxkQEut6V
	 uwx2bjhctlJnP7EVCTARg+Dgi51FfMoMsRvtDbSAchYw0XvMPXZhC+etI31NED4cHS
	 KCZr8yYQ+G+Vwlh4c4Yntz68gesABsIA69nFsE/lEjYE6Pc7glZeNc0CZCjb8lbfpY
	 rGl6Ur8VmZktvKcp0xT6LY1DkCdBQvRT0ECKaEVC8vyZ+5UGRI3XuSgYKGduvgnf+1
	 ogLV6l3RcwKGg==
Received: from [192.168.0.47] (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0E6A1378000A;
	Tue, 16 Jan 2024 21:40:54 +0000 (UTC)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 16 Jan 2024 18:38:34 -0300
Subject: [PATCH v3] arm64: dts: mt8183: Move CrosEC base detection node to
 kukui-based DTs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240116-mt8183-kukui-cbas-remove-v3-1-055e21406e86@collabora.com>
X-B4-Tracking: v=1; b=H4sIAFn3pmUC/03MTQ6CMBBA4auQrh3SHyzoynsYF0MZpIFSMgViQ
 ri7jSuX3+K9QyRiT0nci0Mw7T75OGeYSyHcgPObwHfZQktdSaUshLVRjYFxGzcPrsUETCHuBPZ
 at1YjOeqsyPnC1PvPb/18ZfccA6wDE/4Ptaq0NLq8yVttLCiYe8aFsYsPF6cJ28hYuhjEeX4B8
 1CA46wAAAA=
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Ikjoon Jang <ikjn@chromium.org>, Stephen Boyd <swboyd@chromium.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel@collabora.com
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_134110_358034_5BBA174D 
X-CRM114-Status: GOOD (  13.90  )
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

The cbas node is used to describe base detection functionality in the
ChromeOS EC, which is used for units that have a detachable keyboard and
thus rely on this functionality to switch between tablet and laptop
mode.

Despite the original commit having added the cbas node to the
mt8183-kukui.dtsi, not all machines that include it are detachables. In
fact all machines that include from mt8183-kukui-jacuzzi.dtsi are either
clamshells (ie normal laptops) or convertibles, meaning the keyboard can
be flipped but not detached. The detection for the keyboard getting
flipped is handled by the driver bound to the keyboard-controller node
in the EC.

Move the base detection node from the base kukui dtsi to the dtsis where
all machines are detachables, and thus actually make use of the node.

Fixes: 4fa8492d1e5b ("arm64: dts: mt8183: add cbas node under cros_ec")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Changes in v3:
- Instead of deleting the node in jacuzzi, moved the node from kukui to
  the dtsis including kukui that are detachables

Changes in v2:
- Moved cbas node removal to jacuzzi dtsi
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi  | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi        | 4 ----
 4 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
index b6a9830af269..bfb9e42c8aca 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
@@ -360,6 +360,10 @@ pen_eject {
 };
 
 &cros_ec {
+	cbas {
+		compatible = "google,cros-cbas";
+	};
+
 	keyboard-controller {
 		compatible = "google,cros-ec-keyb-switches";
 	};
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
index 306c95166f3f..5c1bf6a1e475 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
@@ -339,6 +339,10 @@ touch_pin_reset: pin_reset {
 };
 
 &cros_ec {
+	cbas {
+		compatible = "google,cros-cbas";
+	};
+
 	keyboard-controller {
 		compatible = "google,cros-ec-keyb-switches";
 	};
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
index 382e4c6d7191..0f5fa893a774 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
@@ -343,6 +343,10 @@ rst_pin {
 };
 
 &cros_ec {
+	cbas {
+		compatible = "google,cros-cbas";
+	};
+
 	keyboard-controller {
 		compatible = "google,cros-ec-keyb-switches";
 	};
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 5506de83f61d..66eb099e15f0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -937,10 +937,6 @@ usbc_extcon: extcon0 {
 			google,usb-port-id = <0>;
 		};
 
-		cbas {
-			compatible = "google,cros-cbas";
-		};
-
 		typec {
 			compatible = "google,cros-ec-typec";
 			#address-cells = <1>;

---
base-commit: 0f067394dd3b2af3263339cf7183bdb6ee0ac1f8
change-id: 20240116-mt8183-kukui-cbas-remove-657b62aeced6

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


