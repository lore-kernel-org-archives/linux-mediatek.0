Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0BBC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 12:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SSa4GAYCeuCQRsVm9+H3bc4l2XTdQFkPcEXn/W4lyBM=; b=dNC8xn+vLRxVfU
	4EIIF+goVTatMv6mgxboo02ybABl6bk5klTVXwNRIc7MdpqnhanC41t+dGaT7QCn59rVawAiKySDJ
	ySyYiNLF2zqQoKyE5GZ1Osk9uVJKXz9BZgRRwlmOyXTtP1KUoPHA4FpPjPSfdQpSLQsaCa648H1/K
	5MZKR3Sma27S2/omgOljqVCEmih+OvuBjU1+rNjx0h8rcNe8zBuUQvPsd7QtacmcnQ8QkEMg0ZDR1
	sOCppuXN4vk2b4Rp65bvDZdlD7oRYKlPCVaPgpC8pBsYPi5eE1F1mb8B+yyltn6gkvq00Yzj7tXl3
	2tVrQSKf2N+ZSBZLC+CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns1ez-00CInc-SX; Fri, 20 May 2022 12:23:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns1eK-00CIU8-67; Fri, 20 May 2022 12:22:34 +0000
X-UUID: 3a1b3133bc6a4b969f7795f2e3da4334-20220520
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:62b1f9ff-0824-4899-befb-f5a099e84305, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:8ca4047a-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 3a1b3133bc6a4b969f7795f2e3da4334-20220520
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 529520585; Fri, 20 May 2022 05:22:21 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 May 2022 05:22:20 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 20 May 2022 20:22:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 20 May 2022 20:22:18 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 <hsinyi@chromium.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v11 0/3] Add basic node support for MediaTek MT8186 SoC
Date: Fri, 20 May 2022 20:22:14 +0800
Message-ID: <20220520122217.30716-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_052232_267024_F0D3F117 
X-CRM114-Status: GOOD (  14.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT8186 is a SoC based on 64bit ARMv8 architecture.
It contains 6 CA55 and 2 CA76 cores.
MT8186 share many HW IP with MT65xx series.

This patchset was tested on MT8186 evaluation board to shell.

Based on next-20220519, linux-next/master

changes since v9:
 - remove some merged PATCHs from series
 - reorder nodes in dts (cpu-map)
 - remove okay status in auxadc
 - remove unnecessary suffix node name for i2c
 - add pwm node 
 - add dsi-phy node 
 - add dpi node 

changes since v9:
 - add one space before equal sign of drive-strength-adv
 - corect compatible name for big cores (ca76)
 - use upper case of address in pinctrl
 - add pwrap node
 - add pwm node

changes since v8:
 - change name from pins_bus to pins-sda-scl
 - correct email address
 - add capacity-dmips-mhz for each CPU
 - add ppi-partitions in gic node
 - change name to power-domain
 - remove status "okay" in scp node
 - update timer and pericfg compatible in series

changes since v7:
 - add scp&auxadc node

changes since v6:
 - remove unnecessary blank line

changes since v5:
 - replace Mediatek a to MediaTek
 - use GPL-2.0-only OR BSD-2-Clause

changes since v4:
 - correct driver clock of mt8186
 - add power domains controller and clock controllers
 - add pinctrl, usb host, spi and i2c nodes
 - add node status in mt8186-evb.dts
 - correct some dtbs_check warnings

changes since v3:
 - remove serial, mmc and phy patch from series. (already merged)
 - remove mcusysoff node
 - move oscillator nodes at the head of dts
 - change name from usb-phy to t-phy

changes since v2:
 - add soc {} in mt8186.dtsi

changes since v1:
 - add dt-bindings: arm: Add compatible for MediaTek MT8186

Allen-KH Cheng (3):
  dt-bindings: arm: mediatek: Add mt8186 pericfg compatible
  dt-bindings: arm: Add compatible for MediaTek MT8186
  arm64: dts: Add MediaTek SoC MT8186 dts and evaluation board and
    Makefile

 .../devicetree/bindings/arm/mediatek.yaml     |    4 +
 .../arm/mediatek/mediatek,pericfg.yaml        |    1 +
 arch/arm64/boot/dts/mediatek/Makefile         |    1 +
 arch/arm64/boot/dts/mediatek/mt8186-evb.dts   |  232 ++++
 arch/arm64/boot/dts/mediatek/mt8186.dtsi      | 1016 +++++++++++++++++
 5 files changed, 1254 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186.dtsi

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
