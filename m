Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8B2F4198C
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Apr 2026 10:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U/iizR17Gf6o+UY0a60C+rF+10q08/vEGmsLhnspuew=; b=WOZQzVLK2DEanK+8mWO7u0XsvO
	+Fp3TL3vQrdyoevaj1lq10XdoJVxj4A8iwLxHtE9aexS8Upd3OF70JtrUHSwIdt6SnFN8uUzuk5j9
	DPqdIt3vWA3UfVLShc9jOS8pwqFO1/kGQNWLiHCLiwnwepYNbIwgxcvwo67DWT1Ll0rEitBjM40i1
	TtDtwhIjwPrKWflfnQ7eh/TW5A0HE7NjoqSB15fsKLRM24vDSS8ouiF3UYc2/adAgXBQh0f36UcEW
	/4wTlFo/6UDW74rn20/Bh46fQyy/UiTAerNNmSGQsoMJeJj73SAEyPcK0kjkN07Qxuhk6uBI+tb1O
	Ltdz5JIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCxXU-00000000y9v-3HfH;
	Wed, 15 Apr 2026 10:32:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCxXS-00000000y90-0CA7;
	Wed, 15 Apr 2026 10:32:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 31FC3439A0;
	Wed, 15 Apr 2026 10:32:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C12C2BCB6;
	Wed, 15 Apr 2026 10:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776249125;
	bh=HIKPLEyWCCsA3zb5wxtyTAgfOX1+xiCwivVroOYHU3I=;
	h=From:Date:Subject:To:Cc:From;
	b=IsWcfKmGsYtWiRh/FZMbE4wbuP6wYxpAnlj2rdBMw9jy0FIshvnLhRncIFBGx55DU
	 yWEDTdxCQmP+AmN2EykEHsTXI9y9W2IILpWODjg9oKPSy8qeZUAUIvQTvYrQHlNG4k
	 Vl8esEtpWkq/n7NX1kLIVB71KEFYhSPp3uUHCeTWfx7UcmpIboef/Yh4gDB1fA/uKP
	 IArjFXNgkgQp621EAHevpxOUICTzfsFCt0XsmgbHf+KfhyfSOnwjzvuR6+6ZN4chNd
	 2i4k0TM8+7Obc9EMJgzVudsLnapoQdfbeCPwj9RO6QTPn/JCMARqhdDQ1xKh0Svqud
	 7Ht4qE9fBE31A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 15 Apr 2026 12:31:49 +0200
Subject: [PATCH v3] arm64: dts: airoha: en7581: Enable spi nand controller
 for EN7581 EVB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-airoha-7581-spi-enable-v3-1-07e0f27cce13@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avIrBswzYquEi1MpxoIFYUIorsnL
 d/i/wcKZaYCk3gg08WFY6jQjQB32LATsq8GJVUvu9ag5RwPi4MZWyyJkYJdT0KpOydp08qvPdQ
 4Zdr4/sfz8r4fC51muWgAAAA=
X-Change-ID: 20260415-airoha-7581-spi-enable-034c0ef32db6
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_033206_118367_F82A579C 
X-CRM114-Status: GOOD (  10.77  )
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

Enable spi controller used for snand memory device for EN7581 evaluation
board.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v3:
- Rebase and resend
- Link to v2: https://lore.kernel.org/linux-mediatek/20250225-en7581-snfi-probe-fix-v2-1-92e35add701b@kernel.org/

Changes in v2:
- Clarify the commit title
- Link to v1: https://lore.kernel.org/r/20250225-en7581-snfi-probe-fix-v1-1-77e4769574e4@kernel.org
---
 arch/arm64/boot/dts/airoha/en7581-evb.dts | 4 ++++
 arch/arm64/boot/dts/airoha/en7581.dtsi    | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/airoha/en7581-evb.dts b/arch/arm64/boot/dts/airoha/en7581-evb.dts
index 886e2e4b5f64..3dc68dbf1be7 100644
--- a/arch/arm64/boot/dts/airoha/en7581-evb.dts
+++ b/arch/arm64/boot/dts/airoha/en7581-evb.dts
@@ -25,6 +25,10 @@ memory@80000000 {
 	};
 };
 
+&snfi {
+	status = "okay";
+};
+
 &spi_nand {
 	partitions {
 		compatible = "fixed-partitions";
diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index ff6908a76e8e..0964cd783013 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -150,7 +150,7 @@ gic: interrupt-controller@9000000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
 
-		spi@1fa10000 {
+		snfi: spi@1fa10000 {
 			compatible = "airoha,en7581-snand";
 			reg = <0x0 0x1fa10000 0x0 0x140>,
 			      <0x0 0x1fa11000 0x0 0x160>;

---
base-commit: e6490a169f6d5f5bdea7a2e8a673890d43afadc0
change-id: 20260415-airoha-7581-spi-enable-034c0ef32db6

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


