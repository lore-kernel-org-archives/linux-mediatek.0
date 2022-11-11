Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F95BC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Nov 2022 10:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WYHMETprlxCSlcsR6AUgF7th2hMnQkiMFVz9edPawAU=; b=4/Xfj0FpSTkgLarHMPJippXOZB
	kEPZNVgPovP/4Lo40emKkUF0gnhiHsBYrvV6plKN+FQq96VOU6SwbJ+JTxKRXZwE2PvLe9ctAK+Y5
	a4DYu+WF7zZRaTEu+V+eKzeSp8cXWb/Y/pd3WEWpZIlNsyDWLILIXqnF4ksql9SVDnfX+lxoZdbBD
	eV7R2mqoPPWL5biAgdsZNboXOoKOSsiEzPTevlIidnBmMe7mgKTVGF2yy4xcZ35r5QtZ6igznmN40
	Wo3uS0lTdHPDlv1sycKYxxinqRTDGw1NfqqCkg2dqsxHwKHBkviTMKF5DULftnU/XkVzAHindZmB9
	92X+8oqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otRYI-00F4Ta-QT; Fri, 11 Nov 2022 10:46:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otRYG-00F4Sv-AR; Fri, 11 Nov 2022 10:46:25 +0000
X-UUID: 30a26c2374c547bf8cf9abd93f9eed9e-20221111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=WYHMETprlxCSlcsR6AUgF7th2hMnQkiMFVz9edPawAU=;
	b=UazhOKB5LMJvccjZCX6GBrBbx8ii+zIZkRh5FLladuoNhWm/NR2DOxMImstDXev90h+/NWAIls3PkQ9bqPakcE7lxsQjqWvnyXUzFaCrILE7Arb13rYL9gnm42ZpY/QAIp7r/y8vZcHbwGG3oxUqyrokNGM5LPwagEgWoWKQi/k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:2434fd89-7fa9-4325-b9ae-569ce5659229,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:34760486-088c-4756-8f76-577be701e693,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 30a26c2374c547bf8cf9abd93f9eed9e-20221111
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 467851890; Fri, 11 Nov 2022 03:46:20 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 11 Nov 2022 17:55:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 11 Nov 2022 17:55:43 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Fabien Parent <fparent@baylibre.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Miles Chen <miles.chen@mediatek.com>, Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>, Mediatek WSD Upstream
	<wsd_upstream@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, "Macpaul
 Lin" <macpaul@gmail.com>, <linux-usb@vger.kernel.org>,
	<stable@vger.kernel.org>
Subject: [RESEND PATCH v2] arm64: dts: mediatek: mt8195-demo: fix the memory size of node secmon
Date: Fri, 11 Nov 2022 17:55:40 +0800
Message-ID: <20221111095540.28881-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_024624_393368_9F6C108A 
X-CRM114-Status: GOOD (  16.34  )
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

The size of device tree node secmon (bl31_secmon_reserved) was
incorrect. It should be increased to 2MiB (0x200000).

The origin setting will cause some abnormal behavior due to
trusted-firmware-a and related firmware didn't load correctly.
The incorrect behavior may vary because of different software stacks.
For example, it will cause build error in some Yocto project because
it will check if there was enough memory to load trusted-firmware-a
to the reserved memory.

When mt8195-demo.dts sent to the upstream, at that time the size of
BL31 was small. Because supported functions and modules in BL31 are
basic sets when the board was under early development stage.

Now BL31 includes more firmwares of coprocessors and maturer functions
so the size has grown bigger in real applications. According to the value
reported by customers, we think reserved 2MiB for BL31 might be enough
for maybe the following 2 or 3 years.

Cc: stable@vger.kernel.org      # v5.19
Fixes: 6147314aeedc ("arm64: dts: mediatek: Add device-tree for MT8195 Demo board")
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
---
Changes for v2
 - Add more information about the size difference for BL31 in commit message.
   Thanks for Miles's review.

 arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
index 4fbd99eb496a..dec85d254838 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
@@ -56,10 +56,10 @@
 		#size-cells = <2>;
 		ranges;
 
-		/* 192 KiB reserved for ARM Trusted Firmware (BL31) */
+		/* 2 MiB reserved for ARM Trusted Firmware (BL31) */
 		bl31_secmon_reserved: secmon@54600000 {
 			no-map;
-			reg = <0 0x54600000 0x0 0x30000>;
+			reg = <0 0x54600000 0x0 0x200000>;
 		};
 
 		/* 12 MiB reserved for OP-TEE (BL32)
-- 
2.18.0


