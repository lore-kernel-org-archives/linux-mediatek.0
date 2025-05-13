Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403D1C3ABD8
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 May 2025 19:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Cg6mq553LQ19WIcRDrgMNJf4mdWcqjo6ChhcmnTOBvQ=; b=Mi9dphkeR2VQbOEFe/5nTyU4Ti
	Wp3s/BAD3GKb3m3p+6IIwz0T8qWAKOTom5iX5LU42faR1yXtaktqhBtS5ymjm9j+U3vl8aBIgcjL4
	g7DA6ub3IImBxTIEFp2H8GmKHhi7RrbZQnDWmTEfvm939zm3Kgm76ujc+t5IMZfs9VppI8aAO4rJ0
	PEqryOID/M593L7C/u4z1A1gm24yfn97ODlmZgAVGSRKEMV6/Bv3ZM3uMYU55gCCJUgAP9RUL8C1Z
	/O3P13OtvlHjVGHX06DgmSLEn7Q6hbGioVpfLMOnapDrJH10T1FsEYrt86WdFXdSdNe/kCrkpQsM/
	IeHhNynQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEuvh-0000000DK6L-1U29;
	Tue, 13 May 2025 19:04:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEuYZ-0000000DGMV-47qr;
	Tue, 13 May 2025 18:40:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 32FD4A4DB26;
	Tue, 13 May 2025 18:40:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A53B7C4CEEB;
	Tue, 13 May 2025 18:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747161646;
	bh=LUdo1YTEXYomgG1nU4pnAGqyr93S6Fk8DNsW3FmP8to=;
	h=From:To:Cc:Subject:Date:From;
	b=mCoDPiMF+FsTw3FrWVSQ7Dn7ACIFgX0KW5Q/Qjj/p6xlz5pMKAKi9eYNfUKeExU0K
	 MFAC0OIF/O5ixf8ZZaoIjY4bwps5DqkikLbLLuSAIEFNY/coxjmuxj+QK8ihYwDSpM
	 GiKkbMXjetIaqI9LeSCOwwxNHCmLN55ug1m539fgDLL/oMFMZljTpyUyg2KcPb1AAk
	 b8RYSev2PInn5GIXKP9ZIonSAhxm7LkdIa0GIuN2PTeHsjLxhQXFFX+A2x0mF/VFzI
	 8X/ubDDanjqZkocE+alGHSsvdb4tc5qfOFZpWO0LCrzvzCVxLGBf138CeHk2jtgluF
	 TXjSKpv5p4QhA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: crypto: Drop obsolete mediatek,eip97-crypto
Date: Tue, 13 May 2025 13:40:41 -0500
Message-ID: <20250513184042.3051424-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_114048_097093_4032985A 
X-CRM114-Status: GOOD (  12.16  )
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

The mediatek,eip97-crypto binding is half abandoned. The driver was
dropped in 2020 as the Mediatek platforms use InsideSecure block and
the driver for it. All the platforms except MT7623 were updated. A
patch to update it was submitted, but never addressed the review
comments.

Link: https://lore.kernel.org/all/20210303080923.16761-1-vic.wu@mediatek.com/
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/crypto/mediatek-crypto.txt       | 25 -------------------
 1 file changed, 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/crypto/mediatek-crypto.txt

diff --git a/Documentation/devicetree/bindings/crypto/mediatek-crypto.txt b/Documentation/devicetree/bindings/crypto/mediatek-crypto.txt
deleted file mode 100644
index 450da3661cad..000000000000
--- a/Documentation/devicetree/bindings/crypto/mediatek-crypto.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-MediaTek cryptographic accelerators
-
-Required properties:
-- compatible: Should be "mediatek,eip97-crypto"
-- reg: Address and length of the register set for the device
-- interrupts: Should contain the five crypto engines interrupts in numeric
-	order. These are global system and four descriptor rings.
-- clocks: the clock used by the core
-- clock-names: Must contain "cryp".
-- power-domains: Must contain a reference to the PM domain.
-
-
-Example:
-	crypto: crypto@1b240000 {
-		compatible = "mediatek,eip97-crypto";
-		reg = <0 0x1b240000 0 0x20000>;
-		interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_SPI 83 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_SPI 84 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_SPI 97 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&ethsys CLK_ETHSYS_CRYPTO>;
-		clock-names = "cryp";
-		power-domains = <&scpsys MT2701_POWER_DOMAIN_ETH>;
-	};
-- 
2.47.2


