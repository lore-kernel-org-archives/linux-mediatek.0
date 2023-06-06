Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A18C77B7A
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jun 2023 15:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vJ5Psndi1HWL+ACKG5dHUOldjenXjNyb8YQUS4AnZfE=; b=JewcK43lsED5k9+qRo4oS4XERa
	e54MnrOvownbYHFYA2EZ8I6mW7TDPfl6C+uOCzGdB/nJoYdCFGFR8W7c+PWzuuMMXtf83bnH5JmiI
	PIzvUY28yoVnftfF7TFA7r1u6KS6/YKyS51J8n64d4uBHkj6jOxfqavDB4Y4XEu9W2Wg65RJqICaZ
	Rdp+xT0428zLkF53niGcs/HgVh+U0b24TmI2QGITD2cQQ8mi4Zesr8UFjltUxT8pmF69GJDdDyxj8
	TAtYPkQ6w27jQBLtIbHF/mO5Z3EDHzDxoDilMTxA1zjfuCXBkcFffe1BcGGumc0y2zQPDa5+1Bsw3
	kAdXyDxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6YqU-002Hz2-2A;
	Tue, 06 Jun 2023 15:43:42 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6YqS-002Hwx-0X;
	Tue, 06 Jun 2023 15:43:41 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1q6YqK-0004lq-1R;
	Tue, 06 Jun 2023 15:43:32 +0000
Date: Tue, 6 Jun 2023 16:43:20 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Frank Wunderlich <frank-w@public-files.de>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Weijie Gao <weijie.gao@mediatek.com>
Subject: [PATCH] arm64: dts: mt7986: increase bl2 partition on NAND of
 Bananapi R3
Message-ID: <ZH9UGF99RgzrHZ88@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_084340_206777_8AB703CB 
X-CRM114-Status: GOOD (  12.07  )
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

The bootrom burned into the MT7986 SoC will try multiple locations on
the SPI-NAND flash to load bl2 in case the bl2 image located at the the
previously attempted offset is corrupt.

Use 0x100000 instead of 0x80000 as partition size for bl2 on SPI-NAND,
allowing for up to four redundant copies of bl2 (typically sized a
bit less than 0x40000).

Fixes: 8e01fb15b8157 ("arm64: dts: mt7986: add Bananapi R3")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dtso     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dtso b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dtso
index 15ee8c568f3c3..543c13385d6e3 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dtso
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dtso
@@ -29,13 +29,13 @@ partitions {
 
 					partition@0 {
 						label = "bl2";
-						reg = <0x0 0x80000>;
+						reg = <0x0 0x100000>;
 						read-only;
 					};
 
-					partition@80000 {
+					partition@100000 {
 						label = "reserved";
-						reg = <0x80000 0x300000>;
+						reg = <0x100000 0x280000>;
 					};
 
 					partition@380000 {
-- 
2.41.0


