Return-Path: <SRS0=vrrm=GZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02746C433E6
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 08:47:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FA5D235F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 08:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FA5D235F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XlAFYtZ9bJ0sM9vgsqFZ0k4gcdmOM+36LrgFD4blV6I=; b=rqDbiRirI/f/ohnELDJ+7dYWg
	e475Mqc7z78gwtBfeemizGZwOTnR0wBwjX2iJsA+uyuHzoWoSX/ayyNWDuvm97pGUr01qqNu1wCcF
	YkAktuM1mFhzorLgF+4e04bTcsMJ4IOOtFu3ukDMMPawxU806QmcUdLnKi7tu/5naOqytHfPm039N
	nPFd4cuFL1lgwb9OWVNr2TrlfKKXfYpx2rOEXGkP3B/xHEjLpMimO9gLekZojo1QXc6aGENWosYjK
	Hw+K9mphl9nbci+Q2kSSh50RAxvbGg7xx0towL7nh2MdrIEegJaKKHK6f4YFecHzNTVfpNSm5zswN
	27iPBUHqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2s5p-0000RC-RR; Fri, 22 Jan 2021 08:46:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2s5i-0000Li-8F
 for linux-mediatek@lists.infradead.org; Fri, 22 Jan 2021 08:46:55 +0000
X-UUID: 3b177e790de94f20b5076490cd93683b-20210122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=fHD+fBma2WrYclVJ6k3BSPqvy+J1fdTz0jR/cCH2s1A=; 
 b=u+iBgduLDp2ARMjSqOhTiGx17PH66y2Hoi/aQJKinfuchh98Y5im1Djm6On5CsYR6UB41bh+wMQK5iXLBJaB7+symm8a31oHns1Yl/FhRnbjbVZJ9ib9EFP44Lb9f1VYaCnJteFSyh3gdM3cfCaMJQkBtBU5ukS4focgfbmd0sc=;
X-UUID: 3b177e790de94f20b5076490cd93683b-20210122
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 980169476; Fri, 22 Jan 2021 00:46:42 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Jan 2021 00:36:40 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Jan 2021 16:36:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Jan 2021 16:36:38 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <robh+dt@kernel.org>, <robh@kernel.org>, <martin.petersen@oracle.com>,
 <jejb@linux.ibm.com>, <avri.altman@wdc.com>, <alim.akhtar@samsung.com>
Subject: [PATCH v3 2/2] arm64: dts: mt6779: Support ufshci and ufsphy
Date: Fri, 22 Jan 2021 16:36:27 +0800
Message-ID: <20210122083627.2893-3-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210122083627.2893-1-stanley.chu@mediatek.com>
References: <20210122083627.2893-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_034651_191772_3E52EECE 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: hanks.chen@mediatek.com, andy.teng@mediatek.com, cc.chou@mediatek.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com, jiajie.hao@mediatek.com,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, yingjoe.chen@mediatek.com,
 Stanley Chu <stanley.chu@mediatek.com>, chaotian.jing@mediatek.com,
 alice.chao@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Support UFS on MT6779 platforms by adding ufshci and ufsphy
nodes in dts file.

Reviewed-by: Hanks Chen <hanks.chen@mediatek.com>
Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt6779.dtsi | 36 +++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6779.dtsi b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
index 370f309d32de..6eaf230bb0d1 100644
--- a/arch/arm64/boot/dts/mediatek/mt6779.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
@@ -225,6 +225,41 @@
 			#clock-cells = <1>;
 		};
 
+		ufshci: ufshci@11270000 {
+			compatible = "mediatek,mt8183-ufshci";
+			reg = <0 0x11270000 0 0x2300>;
+			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_LOW>;
+			phys = <&ufsphy>;
+
+			clocks = <&infracfg_ao CLK_INFRA_UFS>,
+				 <&infracfg_ao CLK_INFRA_UFS_TICK>,
+				 <&infracfg_ao CLK_INFRA_UFS_AXI>,
+				 <&infracfg_ao CLK_INFRA_UNIPRO_TICK>,
+				 <&infracfg_ao CLK_INFRA_UNIPRO_MBIST>,
+				 <&topckgen CLK_TOP_FAES_UFSFDE>,
+				 <&infracfg_ao CLK_INFRA_AES_UFSFDE>,
+				 <&infracfg_ao CLK_INFRA_AES_BCLK>;
+			clock-names = "ufs", "ufs_tick", "ufs_axi",
+				      "unipro_tick", "unipro_mbist",
+				      "aes_top", "aes_infra", "aes_bclk";
+			freq-table-hz = <0 0>, <0 0>, <0 0>,
+					<0 0>, <0 0>, <0 0>,
+					<0 0>, <0 0>;
+
+			mediatek,ufs-disable-ah8;
+			mediatek,ufs-support-va09;
+		};
+
+		ufsphy: phy@11fa0000 {
+			compatible = "mediatek,mt8183-ufsphy";
+			reg = <0 0x11fa0000 0 0xc000>;
+			#phy-cells = <0>;
+
+			clocks = <&infracfg_ao CLK_INFRA_UNIPRO_SCK>,
+				 <&infracfg_ao CLK_INFRA_UFS_MP_SAP_BCLK>;
+			clock-names = "unipro", "mp";
+		};
+
 		mfgcfg: clock-controller@13fbf000 {
 			compatible = "mediatek,mt6779-mfgcfg", "syscon";
 			reg = <0 0x13fbf000 0 0x1000>;
@@ -266,6 +301,5 @@
 			reg = <0 0x1b000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
-
 	};
 };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
