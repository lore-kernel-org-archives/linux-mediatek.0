Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DB3E95A85
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Oct 2023 00:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQ6QIjoxQaKD/HDteg9Zi0IIeqkS4ZTQde2aUiB9a/Q=; b=BUNEv7GUHS+a0gTQ7y8i/ccSs+
	n5Wb8pT+5zJQ+yz1OFAvvvpovdjGYeuAiamLV3/aMyWpV8MzTwxzmzV5BbaCndXIuRMMQI/Purfdz
	gRAX725k6ZVIo+jKdsen17PtWUzFPRcwjQxi3OKxMx+bYV72OzQMOKZBMr/KW0DJ20ig9gjANPmQu
	gYoUdBP8V25/IAJYQ4/JuF+vHKOnp8zBbOfb7TkV27KskEm2vl7I4wbPbtaecpSI7xwqNzuFw6XpS
	kBh+XWBAohEWHMPxMuE13CLqVVNMyGzp+iFBZOU/eNqlCUbT6q0e6cTixeybXGC4an/1VR3r67faj
	mca2Nsag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpHyl-00873g-0r;
	Sun, 08 Oct 2023 00:49:07 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpHyh-00872m-1R;
	Sun, 08 Oct 2023 00:49:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 22299CE022B;
	Sun,  8 Oct 2023 00:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 018E4C433C9;
	Sun,  8 Oct 2023 00:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696726140;
	bh=SUmtHRxizvYpZ+OdGdpOdYvkpMrA9yBGKptqULjxc+w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Uyd+3NBUBvea5+mAFMT4VJglktv8zLPN2p0Az2VGX818nmJFUYM4ByHFIQ9umODoz
	 uiiYUb1t4n9fDSES/dS1Va3BcKGvsGiM/kBIkBivwe5hNuEEFfaAe/N8spKGTxYj/C
	 uCA2DoUU9xQN0RneZbou3tJ9BqO2Ux9iinS8/VlibUPl7yqwNHeIjbTqHaliFQL7cQ
	 SuppTxkyOeit7YvHl7fdbOyoEgHKPbvpb9t/sw5N3WXCwdwAPhWC0fTmG7VqUsl+XF
	 CYYt+DilObS+pBrkX2eZoPmpVzaO4ipADB2JjfH+A0/XOw/QP9L1NfFCMreL+fgjNr
	 Wg9yTgbUMambQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Sasha Levin <sashal@kernel.org>,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.5 03/18] arm64: dts: mediatek: Fix "mediatek,merge-mute" and "mediatek,merge-fifo-en" types
Date: Sat,  7 Oct 2023 20:48:37 -0400
Message-Id: <20231008004853.3767621-3-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231008004853.3767621-1-sashal@kernel.org>
References: <20231008004853.3767621-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231007_174903_845193_4CAED25D 
X-CRM114-Status: GOOD (  10.00  )
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

From: Rob Herring <robh@kernel.org>

[ Upstream commit 5f8456b1faefb06fcf6028dced9f37aa880c779d ]

"mediatek,merge-mute" and "mediatek,merge-fifo-en" properties are defined
and used as boolean properties which in DT have no value.

Signed-off-by: Rob Herring <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Link: https://lore.kernel.org/r/20230830195650.704737-1-robh@kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 4dbbf8fdab758..a9e52b50c8c48 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -2957,7 +2957,7 @@ merge1: vpp-merge@1c10c000 {
 			clock-names = "merge","merge_async";
 			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
 			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xc000 0x1000>;
-			mediatek,merge-mute = <1>;
+			mediatek,merge-mute;
 			resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE0_DL_ASYNC>;
 		};
 
@@ -2970,7 +2970,7 @@ merge2: vpp-merge@1c10d000 {
 			clock-names = "merge","merge_async";
 			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
 			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xd000 0x1000>;
-			mediatek,merge-mute = <1>;
+			mediatek,merge-mute;
 			resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE1_DL_ASYNC>;
 		};
 
@@ -2983,7 +2983,7 @@ merge3: vpp-merge@1c10e000 {
 			clock-names = "merge","merge_async";
 			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
 			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xe000 0x1000>;
-			mediatek,merge-mute = <1>;
+			mediatek,merge-mute;
 			resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE2_DL_ASYNC>;
 		};
 
@@ -2996,7 +2996,7 @@ merge4: vpp-merge@1c10f000 {
 			clock-names = "merge","merge_async";
 			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
 			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xf000 0x1000>;
-			mediatek,merge-mute = <1>;
+			mediatek,merge-mute;
 			resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE3_DL_ASYNC>;
 		};
 
@@ -3009,7 +3009,7 @@ merge5: vpp-merge@1c110000 {
 			clock-names = "merge","merge_async";
 			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
 			mediatek,gce-client-reg = <&gce0 SUBSYS_1c11XXXX 0x0000 0x1000>;
-			mediatek,merge-fifo-en = <1>;
+			mediatek,merge-fifo-en;
 			resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE4_DL_ASYNC>;
 		};
 
-- 
2.40.1


