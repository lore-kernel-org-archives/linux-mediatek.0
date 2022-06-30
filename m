Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE2A0C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 11:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OPUPtfw6pfWCiR1mZeXscth6kv6xBVcFjag/DYVBL48=; b=sXraw/ANxgPsl9xfxk239qQ7EP
	sPbjG2HvR3J3C39L6DMF0YrngHp7+yeH5XrFJmuj4h29ny2rBUuYVDoU87JsP5jORty9ffA1AvkWi
	tUqLnfv56BgHghJM7lo8rhUHNEe4MEINgRlqfRCjYIfYGcnrTMqKHCIkWyszSQy0dGeHO9FvQfskC
	2EvTpIJ0FuSgtzZSP8ltKQ1ZhYo7n0+DL/bRNnj7J1/K4RGiMmIJZTZA2BooBBxw/hINpk88X81Ly
	NlX/2QcXiT7N2XRvAiVBa2XncQnRpn1cr2PezxE1YCJ3vt9sDXiHeE8/v22cLt3bmropTwndLmHXj
	boEMZ7EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6sIj-00GpW8-Qv; Thu, 30 Jun 2022 11:25:37 +0000
Received: from mail1.systemli.org ([2a11:7980:3::36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6sIY-00GpTZ-Fv; Thu, 30 Jun 2022 11:25:28 +0000
From: Nick Hainke <vincent@systemli.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=systemli.org;
	s=default; t=1656587878;
	bh=OPUPtfw6pfWCiR1mZeXscth6kv6xBVcFjag/DYVBL48=;
	h=From:To:Cc:Subject:Date:From;
	b=+YxJ4+G0hePqtaNyGs7JHJJs4ZP3r7h0fmuyqN6Ay4vISE+ON4aL0THp0A4D3Grdh
	 ZvAZFqesoSjzk+112z1z2DWtAWQmdBvA7crbd49LvccUcHvY5AOls1G3BPnMwnC1rK
	 H/47i+3HpRnh82uL2dUd8pAk/rPVT896dFniOkg3HwkALOdURiN/fNd7boQqfJZOqT
	 WKDAu+wP3eP1b79Ds/wX9MXryytTjoBXSzBBq7Lu5DU3bvkt6vHXCNSeAou4zLUrDF
	 rq9nm6/gCqwB1HaSLJagyLcXtw66K0wE0Q94IMWCSh040V7NFeuqIrJEmIenGZ3+oN
	 PogK2koGz7ekw==
To: linux-mediatek@lists.infradead.org
Cc: Nick Hainke <vincent@systemli.org>,
	INAGAKI Hiroshi <musashino.open@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mt7622: fix BPI-R64 WPS button
Date: Thu, 30 Jun 2022 13:16:57 +0200
Message-Id: <20220630111746.4098-1-vincent@systemli.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_042527_036874_718E89F6 
X-CRM114-Status: GOOD (  13.05  )
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

The bananapi R64 (BPI-R64) experiences wrong WPS button signals.
In OpenWrt pushing the WPS button while powering on the device will set
it to recovery mode. Currently, this also happens without any user
interaction. In particular, the wrong signals appear while booting the
device or restarting it, e.g. after doing a system upgrade. If the
device is in recovery mode the user needs to manually power cycle or
restart it.

The official BPI-R64 sources set the WPS button to GPIO_ACTIVE_LOW in
the device tree. This setting seems to suppress the unwanted WPS button
press signals. So this commit changes the button from GPIO_ACTIVE_HIGH to
GPIO_ACTIVE_LOW.

The official BPI-R64 sources can be found on
https://github.com/BPI-SINOVOIP/BPI-R64-openwrt

Fixes: 0b6286dd96c0 ("arm64: dts: mt7622: add bananapi BPI-R64 board")

Suggested-by: INAGAKI Hiroshi <musashino.open@gmail.com>
Signed-off-by: Nick Hainke <vincent@systemli.org>
---
 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index 2b9bf8dd14ec..7538918c7a82 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -49,7 +49,7 @@ factory {
 		wps {
 			label = "wps";
 			linux,code = <KEY_WPS_BUTTON>;
-			gpios = <&pio 102 GPIO_ACTIVE_HIGH>;
+			gpios = <&pio 102 GPIO_ACTIVE_LOW>;
 		};
 	};
 
-- 
2.37.0


