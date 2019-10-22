Return-Path: <SRS0=62P0=YP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D5F6CA9EB0
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2019 03:55:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBCF7214B2
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2019 03:55:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TDGsmfBa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBCF7214B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=065jf1LImb/3H/9C4QNIVYRONBZgZvBOkx36AqF/dCE=; b=TDGsmfBazV6uCo
	RRrho0ANChyZiWgddJJACGd23OvK6FV8Wi+PvUmbpQ4ofW6eeKfMW5F1CNHqkhz/OjiHno77lsbOq
	mpLYwz86EiZX5klcnqhv+Gw3zW4ZjXwMmncjwW1AI4mNydzm9sgNOyi/xzFGnNvO9GCiil/scIfon
	mEQ/RcEOr+YcnbP3vrvuKVvgKY1ZDCwpRQn6YxLlngwVRXkHBW3UdD7eyN4P45CA3hYeb3mYHnwDD
	j/84WCmPPFM+LXnbBEPrr4NhEnywIz8eFdZz8mXPdQV07k8NqHLq5JgTBa7CJHtXYJJc1O+b+Ox2v
	fhfbagktvJDT4P74O2pA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMlGa-0000fL-S9; Tue, 22 Oct 2019 03:55:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMlG1-0007QC-H0; Tue, 22 Oct 2019 03:54:55 +0000
X-UUID: 0d63b214d879452e8290b659214ad073-20191021
X-UUID: 0d63b214d879452e8290b659214ad073-20191021
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <anthony.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 365223903; Mon, 21 Oct 2019 19:55:00 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 21 Oct 2019 20:54:44 -0700
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 22 Oct 2019 11:54:43 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 22 Oct 2019 11:54:43 +0800
From: Anthony Huang <anthony.huang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [RFC PATCH 1/2] dt-bindings: soc: mediatek: Add document for mmdvfs
 driver
Date: Tue, 22 Oct 2019 11:51:52 +0800
Message-ID: <1571716313-10215-2-git-send-email-anthony.huang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1571716313-10215-1-git-send-email-anthony.huang@mediatek.com>
References: <1571716313-10215-1-git-send-email-anthony.huang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191021_205453_584170_82E56AB2 
X-CRM114-Status: GOOD (  14.62  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Anthony Huang <anthony.huang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This document describes the properties what mtk mmdvfs
device node support.

Signed-off-by: Anthony Huang <anthony.huang@mediatek.com>
---
 .../devicetree/bindings/soc/mediatek/mmdvfs.txt    |  149 ++++++++++++++++++++
 1 file changed, 149 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mmdvfs.txt

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mmdvfs.txt b/Documentation/devicetree/bindings/soc/mediatek/mmdvfs.txt
new file mode 100644
index 0000000..bf33d79
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/mmdvfs.txt
@@ -0,0 +1,149 @@
+Mediatek MMDVFS driver binding
+=========================================
+
+The Mediatek MMDVFS(Multimedia Dynamic Voltage and Frequency Scaling) driver
+is used to set clk for Mediatek multimedia hardwares, such as display, camera,
+mdp and video codec. MMDVFS driver reads which clock muxes and clock sources
+are used on this platform from DTS, and sets current clock according to current
+voltage informed by regulator callback.
+
+
+Required properties:
+- compatible : shall contain "mediatek,mmdvfs".
+- operating-points-v2: contains any one of opp tables for multimedia modules.
+                       MMDVFS uses it to get voltage setting on this platform.
+- mediatek,support_mux: contains a list of clock mux names defined
+                        in clock-names.
+- mediatek,mux_*: a series of properties with "mediatek,mux_" prefix.
+		  Each property represents one clock mux, and its value is a
+		  list of all the clock sources for it. The postfix * and every
+		  item in the property must be from the clock-names.
+- clock, clock-names: lists all clock muxes and clock sources for multimedia
+		      hardwares.
+
+Optional properties:
+If the platform needs frequency hopping for some clock sources, these following
+properties should be set.
+
+- mediatek,support_hopping: a list of clock names supporting frequency hopping.
+- mediatek,hopping_*: a cell with the same size as opp numbers of an opp table
+		      for any MM module and each entry represents the clock
+		      rate for each opp. For example, the first entry is the
+		      clock rate set in opp-0, and the second entry is the
+		      clock rate set in opp-1.
+- mediatek,action: a cell with one entry.
+		   It represents the action taken when setting clocks.
+		   0 or this property is not set:
+		   	Do not set frequency hopping and just set clock mux.
+		   1:
+		   	If the voltage is increasing, set frequency hopping
+		   	first. If the voltage is decreasing, set clock mux
+		   	first.
+
+Example:
+	opp_table_mm: opp-table-mm {
+		compatible = "operating-points-v2";
+
+		opp-0 {
+			opp-hz = /bits/ 64 <315000000>;
+			opp-microvolt = <650000>;
+		};
+		opp-1 {
+			opp-hz = /bits/ 64 <450000000>;
+			opp-microvolt = <725000>;
+		};
+		opp-2 {
+			opp-hz = /bits/ 64 <606000000>;
+			opp-microvolt = <825000>;
+		};
+	};
+
+	opp_table_cam: opp-table-cam {
+		compatible = "operating-points-v2";
+
+		opp-0 {
+			opp-hz = /bits/ 64 <315000000>;
+			opp-microvolt = <650000>;
+		};
+		opp-1 {
+			opp-hz = /bits/ 64 <416000000>;
+			opp-microvolt = <725000>;
+		};
+		opp-2 {
+			opp-hz = /bits/ 64 <560000000>;
+			opp-microvolt = <825000>;
+		};
+	};
+	.... /* Other opp tables for multimedia modules */
+
+	mmdvfs {
+		compatible = "mediatek,mmdvfs";
+
+		operating-points-v2 = <&opp_table_mm>;
+
+		mediatek,support_mux = "mm", "cam", "img", "ipe",
+			"venc", "vdec", "dpe", "ccu";
+
+		mediatek,mux_mm = "clk_mmpll_d5_d2",
+			"clk_mmpll_d7", "clk_tvdpll_mainpll_d2_ck";
+		mediatek,mux_cam = "clk_mmpll_d5_d2",
+			"clk_univpll_d3", "clk_adsppll_d5";
+		mediatek,mux_img = "clk_mmpll_d5_d2",
+			"clk_univpll_d3", "clk_tvdpll_mainpll_d2_ck";
+		mediatek,mux_ipe = "clk_mmpll_d5_d2",
+			"clk_univpll_d3", "clk_mainpll_d2";
+		mediatek,mux_venc = "clk_mainpll_d3",
+			"clk_mmpll_d7", "clk_mmpll_d5";
+		mediatek,mux_vdec = "clk_univpll_d2_d2",
+			"clk_univpll_d3", "clk_univpll_d2";
+		mediatek,mux_dpe = "clk_mainpll_d3",
+			"clk_mmpll_d7", "clk_mainpll_d2";
+		mediatek,mux_ccu = "clk_mmpll_d5_d2",
+			"clk_univpll_d3", "clk_adsppll_d5";
+
+		mediatek,support_hopping = "clk_mmpll_ck";
+		mediatek,hopping_clk_mmpll_ck = <630000000 630000000 650000000>;
+		mediatek,action = <1>;
+
+
+		clocks = <&topckgen CLK_TOP_MM>,
+			<&topckgen CLK_TOP_CAM>,
+			<&topckgen CLK_TOP_IMG>,
+			<&topckgen CLK_TOP_IPE>,
+			<&topckgen CLK_TOP_VENC>,
+			<&topckgen CLK_TOP_VDEC>,
+			<&topckgen CLK_TOP_DPE>,
+			<&topckgen CLK_TOP_CCU>,
+			<&topckgen CLK_TOP_MMPLL_D5>,
+			<&topckgen CLK_TOP_UNIVPLL_D2>,
+			<&topckgen CLK_TOP_TVDPLL_MAINPLL_D2_CK>,
+			<&topckgen CLK_TOP_ADSPPLL_D5>,
+			<&topckgen CLK_TOP_MAINPLL_D2>,
+			<&topckgen CLK_TOP_MMPLL_D6>,
+			<&topckgen CLK_TOP_MMPLL_D7>,
+			<&topckgen CLK_TOP_UNIVPLL_D3>,
+			<&topckgen CLK_TOP_MAINPLL_D3>,
+			<&topckgen CLK_TOP_MMPLL_D5_D2>,
+			<&topckgen CLK_TOP_UNIVPLL_D2_D2>,
+			<&topckgen CLK_TOP_MMPLL_CK>;
+		clock-names = "mm",
+			"cam",
+			"img",
+			"ipe",
+			"venc",
+			"vdec",
+			"dpe",
+			"ccu",
+			"clk_mmpll_d5",
+			"clk_univpll_d2",
+			"clk_tvdpll_mainpll_d2_ck",
+			"clk_adsppll_d5",
+			"clk_mainpll_d2",
+			"clk_mmpll_d6",
+			"clk_mmpll_d7",
+			"clk_univpll_d3",
+			"clk_mainpll_d3",
+			"clk_mmpll_d5_d2",
+			"clk_univpll_d2_d2",
+			"clk_mmpll_ck";
+	};
-- 
1.7.9.5


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
