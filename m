Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 811A3C48BE5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 21:31:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5092461078
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 21:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5092461078
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PEeD4pgpGmz2mEvwORDTpQWhxFpIqc9raykMW41pcbs=; b=mKzb4koY+DPrPO
	YvEGy24jNjtSw4i4UNkDs1lyuSNRvjcThQngLRacRy+Plimb4bYD1rNiDL76GbOb1iqQIxlqzSeUe
	9FFVhFgb7WwPwS9f5xbLPfH7yOIcNuAsWSoGMi5zlo0Vjw89jiTYl8NsiM6hefVybxLzRAjxRj2KJ
	vsKlMSPPB12blgiPrioHu8TDCGYUATcTIgpA+yLVHpLHnW4yVnmuALK+xyaDv188PKEzg8u+ur+AS
	w3Ctnqrccd1R04PTBmhID3H22P3fTb8oH2CmXqWKr0+DUxnVAc0lp4+CJuLiWpOjvlnGHTFa/7mBO
	UehT4xLugdtkHIjZpmsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltGeQ-003AW2-1d; Tue, 15 Jun 2021 21:31:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltCvt-001lPz-0p; Tue, 15 Jun 2021 17:33:03 +0000
X-UUID: d260912e03cb4848ad838ba498a4b8a2-20210615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=hGvt2Oj8evXUDNDjuIbTp9s6pAj+yeAZFOjKAoSkMUg=; 
 b=NI6RPoxKe5aHTTd6WjvtO5S1xhKFDeQA3fgrNtd9C8fJdKLwWliwlV5FVE8oH4qzfq9BFwygAxPeAnTtrMRVpvb8xymsRR2L8S6cJBRkRq3PlhVg8TTUqEjNpaE69Xfuu5JXBkAULqjuhmW9iVcXtpsBgXT+U9PSbXotDnCFmsw=;
X-UUID: d260912e03cb4848ad838ba498a4b8a2-20210615
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 429723506; Tue, 15 Jun 2021 10:32:53 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 10:32:51 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 01:32:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Jun 2021 01:32:44 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <seiya.wang@mediatek.com>, <wenst@google.com>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>
Subject: [PATCH 10/27] arm64: dts: mt8195: add PCIe phy device node
Date: Wed, 16 Jun 2021 01:32:16 +0800
Message-ID: <20210615173233.26682-10-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20210615173233.26682-1-tinghan.shen@mediatek.com>
References: <20210615173233.26682-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_103301_189117_0D055A9C 
X-CRM114-Status: GOOD (  10.17  )
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

From: Jianjun Wang <jianjun.wang@mediatek.com>

Add PCIe phy device node for mt8195 SoC.

Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 80a272703879..dd5644410fea 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1107,6 +1107,7 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0 0x11e30000 0xe00>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_SSUSB_PCIE_PHY>;
 			status = "disabled";
 
 			u2port1: usb-phy@0 {
@@ -1146,6 +1147,19 @@
 			};
 		};
 
+		pciephy: phy@11e80000 {
+			compatible = "mediatek,mt8195-pcie-phy";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			#phy-cells = <0>;
+			reg = <0 0x11e80000 0 0x10000>,
+			      <0 0x11e90000 0 0x10000>;
+			reg-names = "phy-sif", "phy-ckm";
+
+			power-domains = <&spm MT8195_POWER_DOMAIN_PCIE_PHY>;
+			status = "disabled";
+		};
+
 		ufsphy: phy@11fa0000 {
 			compatible = "mediatek,mt8195-ufsphy", "mediatek,mt8183-ufsphy";
 			reg = <0 0x11fa0000 0 0xc000>;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
