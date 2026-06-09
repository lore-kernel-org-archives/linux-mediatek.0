Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26596CD8CA4
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2026 13:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=39k9hJtIngFDc5kAzhTQBAbWUtLN4p1Hj+Wp34GgIk4=; b=RpkWBSPD70xDQyaRlXYEy0q460
	3EhuxaU0Wk2rBMiGY2fAdlGHXcr5Oa7+1ahbKHbUf+WvyxtZgbi5esewLNLjaXuqbVd+Tug6Di6Bn
	XTZHdChCtisUQA+plzdrqjDv551gC68pZFSWi5OArEw9LwibXveA0mAB7ep2cFR/Judm4lkeSsKR1
	Roix9RYZqpqgGfH2B9uAqZs2QQaiTCuK3UtzL2FAMfWBt5jjRiwp3Jg1/mJzEWHXo7SPm+eLhkgO3
	BrcOxld68kYONAGU00O9+sBS39CL6YPGO6QfruhB0qrItynN8OadUilWJNrT5RI8WUyU5G1V3vzne
	tdfzxWgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwZ7-00000005fDm-2JB3;
	Tue, 09 Jun 2026 13:32:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwZ3-00000005fBX-34L8;
	Tue, 09 Jun 2026 13:32:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5EFD2445EA;
	Tue,  9 Jun 2026 13:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C79FC2BCB9;
	Tue,  9 Jun 2026 13:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781011941;
	bh=6Uru3oiN+KUnWcz/gv4yCW62HmXWPmwm2tqYSe5EbcY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VdEsk3I7snaayRqhsC5jOW8A5WUJ429olZtIDdhI7TQBazVj64yBaUaUryruwXkZK
	 HECknAIbhbLBUgTokqhF4KFXqAdEHmEw6/eFB6ODMHr6lhGMqGX9m1QpUysIaa8Tnv
	 bS6OFyPwIpsuP4dU5psba5+ZqEyGddnr4YZcPBr6sgtaEuKn9GqTNxLoK4lwyhKBZK
	 s6ZUYZ/puxUOoEXkk6sIaR09oSmQd/BeY3WUCKvUel93yIkYZnXYfadL+oHDQqUbw7
	 SPhnzNT2sov3qMdXGe84AlAJmOyaTJsjpAItrU2pzWaSOHngd02zSFtV/g/1JHAVnU
	 gcdqmNWWUyNlw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2049CCD8CA4;
	Tue,  9 Jun 2026 13:32:21 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 09 Jun 2026 16:32:01 +0300
Subject: [PATCH v2 4/4] ARM: dts: mediatek: mt6323: add AUXADC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-mt6323-adc-v2-4-aa93a22309f9@protonmail.com>
References: <20260609-mt6323-adc-v2-0-aa93a22309f9@protonmail.com>
In-Reply-To: <20260609-mt6323-adc-v2-0-aa93a22309f9@protonmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781011938; l=814;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=WC9jUSlABoGBdBqPU8PZ4ZIU5LJl1TAO11/EPH3tS8U=;
 b=HFUzT56ILN51Q0406hTTlmGMy18dIgDy0Qp5Xo0PO99fY1Fg8K9SZT8TkVk7RWS+3O4hoHTqv
 BDOlKuXR4WuCYEUHVR45DELvdSpOPavOAN1RW2VEKupUhbdumuX5xM+
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

Add the devicetree node for the mt6323 AUXADC.

Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 arch/arm/boot/dts/mediatek/mt6323.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/mt6323.dtsi b/arch/arm/boot/dts/mediatek/mt6323.dtsi
index c230c865116d..c070f4b0936c 100644
--- a/arch/arm/boot/dts/mediatek/mt6323.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6323.dtsi
@@ -14,6 +14,11 @@ pmic: mt6323 {
 		interrupt-controller;
 		#interrupt-cells = <2>;
 
+		mt6323_adc: adc {
+			compatible = "mediatek,mt6323-auxadc";
+			#io-channel-cells = <1>;
+		};
+
 		mt6323_leds: leds {
 			compatible = "mediatek,mt6323-led";
 			#address-cells = <1>;

-- 
2.54.0



