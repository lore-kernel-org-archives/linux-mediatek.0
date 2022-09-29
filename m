Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D42BC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 09:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYHMETprlxCSlcsR6AUgF7th2hMnQkiMFVz9edPawAU=; b=H6J5eRLoG1eD8jIHHg5GueTAyC
	1BChsPlty6Xt5u/GohTkodlcRMcQtXbSa0Ke5oqYMWXLOIoB9A9YKIabeHHmC4EzP3y2tgMK9Hjjy
	nLcT7YaccVTIr6fafC2mToiE+3HvXpfH2tYX/tYsnmjQswTzrYHnGxpP0YK/uD4Sp3EEIj4XZksdm
	e/zwgHfkQ5FuYoIUy7TwgnJLr9Rw4/1OuC9u0cWJjkMztzPl1uSYCYSvlNqbJXqvVE1x7/3VxLAsG
	eO0l7rX3VgzDp4nM4jiaI/qUcNqResDuUGzvP6wFpDexOHpRwT/T9vJV+g4/XvtVqAmaPda7TUFMu
	KucyRGKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odpjd-0024jA-D7; Thu, 29 Sep 2022 09:21:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odpja-0024hS-Py; Thu, 29 Sep 2022 09:21:36 +0000
X-UUID: c49bef9b80cd48a2afee817b1b09e72a-20220929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=WYHMETprlxCSlcsR6AUgF7th2hMnQkiMFVz9edPawAU=;
	b=sje336XFuNVLHdoAVA7Uyta43RUR0DU1G/VEPRaLi4GGgP6QVBAKMqnnLOSd1CRzK1EGvPF6WKHZdog1YTK5pL0QR9Z5xhjQyyis/SKcMPH0A6x78lBzZ1aON4X62TXfYHmHyADMaSm87OpP+Wq/STdce3NkuqvlpCKxbEeuq9E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:01da6f16-91be-4061-bcef-741625e22894,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:2b4c6f07-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c49bef9b80cd48a2afee817b1b09e72a-20220929
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 555556697; Thu, 29 Sep 2022 02:17:58 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 29 Sep 2022 16:47:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 29 Sep 2022 16:47:20 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Fabien Parent <fparent@baylibre.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Miles Chen <miles.chen@mediatek.com>, Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, <linux-usb@vger.kernel.org>,
	<stable@vger.kernel.org>
Subject: [PATCH v2] arm64: dts: mediatek: mt8195-demo: fix the memory size of node secmon
Date: Thu, 29 Sep 2022 16:47:14 +0800
Message-ID: <20220929084714.15143-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220922091648.2821-1-macpaul.lin@mediatek.com>
References: <20220922091648.2821-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_022134_866666_378FD0F1 
X-CRM114-Status: GOOD (  16.70  )
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


