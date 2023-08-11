Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC22C0015E
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Aug 2023 13:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q1udk02jJf9ZFY6uF0638D/SCO6WNo6qeMTtQHkgqII=; b=f0kuPMTLoUSD8af6GZD2mlZbQG
	lzOmoxmET+bBBxPUWhlFkxhsTOxSMaFCXMFsMvzwv7qZR1s5AzsDe/RynkYjtDuEwItSX+xFz+WjG
	Ecu4DIpnZ5aOgxWFbdDEwCDxzCLX6uJLNqhSkCanWf3lJo69h+vrQ4+6rZDCTC+Nvaj2UbZdWHQ2z
	sjFE0rB2lOfOsjDNorkwKK2fgH0bMOG8i1avUfAHfkP0CvS6y9vj4gIpq8v2eGzzr03cT0DFQF+AL
	R5fcATCOPKc+ipvThjCMWpviVUuf9EyGd+19SgzF08Osoz4uOixDd168YdtO3z55fpOX+CdcwG9xb
	kSjQ7RNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qURrZ-00AgKo-0i;
	Fri, 11 Aug 2023 13:07:33 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qURrQ-00AgEj-0p;
	Fri, 11 Aug 2023 13:07:26 +0000
Received: from eugen-station.. (unknown [82.76.24.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4773C660724B;
	Fri, 11 Aug 2023 14:07:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691759239;
	bh=pYvofDw9e9+ITQ5T6M5o9bCA2xeJ+ybOXWp8n4SlWjs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kwwtPxd7+qLK4lsEr8RxlqIsd4QXW6rnr0W23fwIHV7RgNE1enjAjPa0uVVn/u5t/
	 iEzEryq+ZdS80f/J2n6ljCuJRi7Yvl5xQbdhElRA1zz4arhRWw9T3CU4URAViUO3XZ
	 iFVFg8vKD78RIwNoVuT9RzEWOmNH9JFD+7oMOSwyRJZEYt0MU8hGHCTPnnQnRQ05jt
	 8LciYz1ow66Yo3q6DBOQT/bOAFg8EyMtIWPLrHKOH2zDgUc7vvDvzzFn/3AW+yh/7e
	 WIEZbAuDUMMec+1APblaTsIKnCWpHfJYahJE8cMzNyq52EHHurhCVSYsQlTxqjB4Mj
	 4qnfQTjY88rug==
From: Eugen Hristev <eugen.hristev@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	conor+dt@kernel.org,
	kernel@collabora.com,
	Eugen Hristev <eugen.hristev@collabora.com>
Subject: [PATCH 2/2] arm64: dts: mediatek: fix t-phy unit name
Date: Fri, 11 Aug 2023 16:07:00 +0300
Message-Id: <20230811130700.72787-2-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230811130700.72787-1-eugen.hristev@collabora.com>
References: <20230811130700.72787-1-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_060724_423227_66506DDC 
X-CRM114-Status: GOOD (  11.09  )
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

Fix:
Warning (unit_address_vs_reg): /t-phy@1a243000: node has a unit name, but no reg or ranges property
Warning (unit_address_vs_reg): /soc/t-phy@11c00000: node has a unit name, but no reg or ranges property

The ranges is empty thus removing the `@1a243000`, `@11c00000` from
the node name.

Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt7622.dtsi  | 2 +-
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 36ef2dbe8add..3ee9266fa8e9 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -905,7 +905,7 @@ sata: sata@1a200000 {
 		status = "disabled";
 	};
 
-	sata_phy: t-phy@1a243000 {
+	sata_phy: t-phy {
 		compatible = "mediatek,mt7622-tphy",
 			     "mediatek,generic-tphy-v1";
 		#address-cells = <2>;
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 68539ea788df..24eda00e320d 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -434,7 +434,7 @@ pcie_intc: interrupt-controller {
 			};
 		};
 
-		pcie_phy: t-phy@11c00000 {
+		pcie_phy: t-phy {
 			compatible = "mediatek,mt7986-tphy",
 				     "mediatek,generic-tphy-v2";
 			#address-cells = <2>;
-- 
2.34.1


