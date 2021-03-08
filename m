Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9845EC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 05:52:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35741651F6
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 05:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35741651F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mW0YQ9JOp4LyghAghnUqbxkTI0Qc4f2ivcHF2mqAp6Y=; b=BMV67BnWAiMTQakx5yK5hnctU
	A1dhd21jQEey3avO4VTgPoRO+fgWdo1ZBDdN9U1jjDShXGcw/VXAhHqIOoY1SrKWKUJm5XinW6dyC
	spcPHXwbqKIcOR6DtHd4yL4hgM4Jymix4O+mLmpw7sfr4T8T8uflD4HRVIg18nlyd1LfNKuMhiyvQ
	Okhbm8TUFogy1kLLBAeb291lkk09m6+L2tiYrs15gC2D9i2MBhEYuywiSixtr28NbUmTVqSAV0VWb
	cxOR3LlKKJZOiT42wQsL1tOl5JRL0N3RLsOZmbsUd4ExbrIdTEoRQQrjQlzhCMYZ25l3t6mVRjgSd
	zm5hROh2g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ8oW-00FMTj-JP; Mon, 08 Mar 2021 05:52:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ8lM-00FLJU-42; Mon, 08 Mar 2021 05:49:08 +0000
X-UUID: 0ca1f8aa395c497baa8d081d4ec67a9b-20210307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=xiK75etj9DmiKoQLrPrie0KN9SKOuWl4w4F5RiOHtYo=; 
 b=s9mXPMDgoglzo9zoVU/s9KGOjDuE7Rwsc+w8E0/F88yyvvKPJhHnanX6AnpSSPwr/rq9OYlgVA4rcyMCVcIRE+wXhijZwKCX2g5Ex/WL14qTQI4J5E+S8ZtYEHPxrh+NyQCVHRqG12Sye9RJ2XbiSoGOp3QAo+n5zPeJNaJ4eWs=;
X-UUID: 0ca1f8aa395c497baa8d081d4ec67a9b-20210307
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 133220362; Sun, 07 Mar 2021 21:48:37 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Mar 2021 21:38:14 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Mar 2021 13:37:51 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 8 Mar 2021 13:37:50 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-usb@vger.kernel.org>
Subject: [PATCH v4 09/12] arm64: dts: mediatek: mt8183: fix dtbs_check warning
Date: Mon, 8 Mar 2021 13:37:42 +0800
Message-ID: <20210308053745.25697-9-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210308053745.25697-1-chunfeng.yun@mediatek.com>
References: <20210308053745.25697-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 322C98B94CE6078B86382F4B8B5AE479148476144B2D5EC7669AA5C533025DDA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_054904_901950_BF667A71 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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

Harmonize node names, compatibles and properties.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v4: no changes
v3: remove property clock-names suggested by CK
v2: no changes
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 80519a145f13..8882d35ac6ab 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -880,7 +880,7 @@
 			ranges;
 			status = "disabled";
 
-			usb_host: xhci@11200000 {
+			usb_host: usb@11200000 {
 				compatible = "mediatek,mt8183-xhci",
 					     "mediatek,mtk-xhci";
 				reg = <0 0x11200000 0 0x1000>;
@@ -923,11 +923,10 @@
 			status = "disabled";
 		};
 
-		mipi_tx0: mipi-dphy@11e50000 {
+		mipi_tx0: dsi-phy@11e50000 {
 			compatible = "mediatek,mt8183-mipi-tx";
 			reg = <0 0x11e50000 0 0x1000>;
 			clocks = <&apmixedsys CLK_APMIXED_MIPID0_26M>;
-			clock-names = "ref_clk";
 			#clock-cells = <0>;
 			#phy-cells = <0>;
 			clock-output-names = "mipi_tx0_pll";
@@ -946,11 +945,10 @@
 			};
 		};
 
-		u3phy: usb-phy@11f40000 {
+		u3phy: t-phy@11f40000 {
 			compatible = "mediatek,mt8183-tphy",
 				     "mediatek,generic-tphy-v2";
 			#address-cells = <1>;
-			#phy-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0 0x11f40000 0x1000>;
 			status = "okay";
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
