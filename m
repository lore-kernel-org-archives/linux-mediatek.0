Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789B6CCF9F8
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Nov 2025 19:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=njGFNxEGsWT1HEaUNy2JR2tPCJQJ1ORiV4dMFFMKhvw=; b=Fx5TMnDe4w1+QM
	Fntmm5YrQ1mbX2AA3+bHROK/K1xKuT8uwkPhsXqyZf9PHFI5Dnh2kA9hoBm4moEVGZw6Ml26GCImf
	5vCIMf438wMI4BqYtntgRzvapfqQRq8AguWFC4s/cBttJABLAIHqzGabrX+JNBVQ3O/tZKc+V69P/
	IGufX9LX0aOrDxVmpTXAsXTcfZbo79EHU9SFLDPCYQGkZM6J0XcjLYZ3rr6RkE3mrl8XI4r8VSeui
	uAC45GbssKHH9wH/A7oUNViwECKs1O6Q1ZI3bBvKF6fAFj+q+QHOs8mz3f09V+g4mPsdWvAcFuBZI
	RbJY7XXWKk+7a7QzqpzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGjWw-0000000EKFO-2uTC;
	Wed, 05 Nov 2025 19:50:54 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGjWr-0000000EKBb-1tRJ;
	Wed, 05 Nov 2025 19:50:51 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout2.routing.net (Postfix) with ESMTP id 4B8035FE53;
	Wed,  5 Nov 2025 19:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1762372246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=njGFNxEGsWT1HEaUNy2JR2tPCJQJ1ORiV4dMFFMKhvw=;
	b=xNila5jxsPhQRgGc0adMlYSqjdFDlS5wU672R3OawVM3l5GJ2eoSc6iyE88KRHNTiwfvD5
	EWiBkUB06nUg5fhMaPiv3oIF5ydXkcwFZrJ+ycmXhlNVHII5Wi6rqy1sNEa2qhDGm4huPW
	fRjWYaGSs8t0/a258QlophaK8ALSHWc=
Received: from frank-u24.. (fttx-pool-194.15.81.38.bambit.de [194.15.81.38])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 11A4F1226DD;
	Wed,  5 Nov 2025 19:50:46 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 2/5] arm64: dts: mediatek: mt7988: Disable 2.5G phy and enable at board layer
Date: Wed,  5 Nov 2025 20:50:02 +0100
Message-ID: <20251105195007.199229-3-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105195007.199229-1-linux@fw-web.de>
References: <20251105195007.199229-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_115049_798339_DB5394A9 
X-CRM114-Status: GOOD (  10.25  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

The internal 2.5G phy of mt7988 is only used by some specific board
variants.
Disable it by default and enable it where needed.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts | 1 +
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi                    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
index 6f0c81e3fd94..0e41c07d3a5f 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
@@ -19,4 +19,5 @@ &gmac1 {
 &int_2p5g_phy {
 	pinctrl-0 = <&i2p5gbe_led0_pins>;
 	pinctrl-names = "i2p5gbe-led";
+	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 366203a72d6d..ed4b592c9dd5 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -995,6 +995,7 @@ mdio_bus: mdio-bus {
 				int_2p5g_phy: ethernet-phy@15 {
 					compatible = "ethernet-phy-ieee802.3-c45";
 					reg = <15>;
+					status = "disabled";
 				};
 			};
 		};
-- 
2.43.0


