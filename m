Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B9CC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 07:13:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0B5B20E65
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 07:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0B5B20E65
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XlAFYtZ9bJ0sM9vgsqFZ0k4gcdmOM+36LrgFD4blV6I=; b=2oy/OqapCuISIsD1zLhxDoSjh
	X5GZZ5v3rLo+yv428FHZf+qC9zBtc2F98gvtobS6dZRcX6noKXajZc8HtFcRKye1gxalbPdZL7F8o
	+ZWT1UIJg0CJJjIxr+5TbVFynBpHSY0LvqDTEjTWgiU4ejWlX/c8c3p43NVygAiC7qtLTZ3dhAjjt
	zwSFo4ZZLywLaWNYoZxahDbHPeXHISvs4upqRCPtiAj8N0HtjpEsMqqzMaKOHXCYFGRWcOzelYKwn
	i3NP4Ztd4YRrgmxETeOe94paVM2mE5DzpBQete1U/QtlgWiatUCp/zSyipxP+G2zy98Nau26DCv3+
	lAikiz4kw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kryKh-00021n-6S; Wed, 23 Dec 2020 07:13:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kryKf-000217-D0; Wed, 23 Dec 2020 07:13:14 +0000
X-UUID: af8b53db78e749aa898dc59e4d02f793-20201222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=fHD+fBma2WrYclVJ6k3BSPqvy+J1fdTz0jR/cCH2s1A=; 
 b=nsgdprGEkh64DnZrOWDE+iKBezTR+IyoDNB73fNY10Aq9xekLNdEGFX+/0GENIww7Cr4Of6oArb1Ywvc00vxQOA6oemzm7pQpJZ7GzzRBnTVO4T9NlB4tc5Wrp2hKcz6dlYJ7+tXSnt3q+LWjxm3C8QiIh6loqIusMz5Ug0JASw=;
X-UUID: af8b53db78e749aa898dc59e4d02f793-20201222
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 935248877; Tue, 22 Dec 2020 23:13:04 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 23:13:02 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Dec 2020 15:13:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 23 Dec 2020 15:13:00 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <matthias.bgg@gmail.com>, <robh+dt@kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 2/2] arm64: dts: mt6779: Support ufshci and ufsphy
Date: Wed, 23 Dec 2020 15:12:59 +0800
Message-ID: <20201223071259.764-3-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201223071259.764-1-stanley.chu@mediatek.com>
References: <20201223071259.764-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_021313_630130_7E9E4E9A 
X-CRM114-Status: GOOD (  10.93  )
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
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, jiajie.hao@mediatek.com,
 Stanley Chu <stanley.chu@mediatek.com>, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, alice.chao@mediatek.com
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
