Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA74C48BDF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 21:31:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1197C60FE4
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 21:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1197C60FE4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJ8EQgf2xBFHrhHxGQmefAxtyJWBbhVVIVeepCsR6eg=; b=eEgE62B5owKqyH
	kRpjOkzFopqKs+q26xU+bC7cq0RqpxjFRhJ61aCSgCWADnYZdUDStqR51g67NhxalZ24wdfhYS8by
	lXAnDiRwJ/ca/GOt5kPhkOM3E+DYS24szx1TomgHzMerNsDZxg5rcfEr2zyxEySkTsLhTSjWg0wgl
	AxNJif2DH9JRPSk0PAXZTEKW3KclPruUPeG5mK7O3tVUGenltMIx1D/PPUxVFO9hQfUNA93NwI5JC
	ys7L0VCeHHg2sPwgubzyRK3ywBIYMFPYEy+LgX2rr2FJCrOnJgH8didF/2TklDg37OQ1KbR3HOLyn
	l+6HJff8DX/hAs+q1utA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltGeX-003AdJ-EG; Tue, 15 Jun 2021 21:31:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltCvu-001lPL-TE; Tue, 15 Jun 2021 17:33:04 +0000
X-UUID: 4db5768155be4159a4cafb45fc758dc0-20210615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=1a+jYuvt1DAIgJ45S5O+HUAgRZdhYBKhfZE2VJ8RK28=; 
 b=FiH4AxN8G8I8QWr/5C8V1zz17BPXw0eeKbt1m9n+mKo2yrlnG3k1lsjdQDl9M8O3xGLfom+6ncPq/BDAqtnx09bGoj26FtQjXoDkLV1Mo6nt33YFQIa6t1KQSj5/0Dhy1YIdVENUr2sIlyB6DBmYyJAUDZdl+C4NBA+2oJcWA6A=;
X-UUID: 4db5768155be4159a4cafb45fc758dc0-20210615
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 665085933; Tue, 15 Jun 2021 10:32:55 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 10:32:53 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 01:32:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Jun 2021 01:32:46 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <seiya.wang@mediatek.com>, <wenst@google.com>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jason-JH Lin
 <jason-jh.lin@mediatek.com>
Subject: [PATCH 24/27] arm64: dts: mt8195: add gce setting for disply node
Date: Wed, 16 Jun 2021 01:32:30 +0800
Message-ID: <20210615173233.26682-24-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20210615173233.26682-1-tinghan.shen@mediatek.com>
References: <20210615173233.26682-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_103303_029252_926D6132 
X-CRM114-Status: UNSURE (   9.22  )
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

From: Jason-JH Lin <jason-jh.lin@mediatek.com>

add gce setting for disply node

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 51edb8ee35a8..e273833a49f8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -2245,6 +2245,7 @@
 			reg-names = "vdosys0_config";
 			iommus = <&iommu_vdo M4U_PORT_L0_DISP_RDMA0>;
 			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			mboxes = <&gce1 0 0 CMDQ_THR_PRIO_4>;
 		};
 
 		mutex: disp_mutex0@1c016000 {
@@ -2255,6 +2256,7 @@
 			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
 			clock-names = "vdo0_mutex";
 			interrupts = <GIC_SPI 658 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,gce-events = <CMDQ_EVENT_VDO0_DISP_STREAM_DONE_0>;
 		};
 
 		ovl0: disp_ovl@1c000000 {
@@ -2264,6 +2266,7 @@
 			clocks = <&vdosys0 CLK_VDO0_DISP_OVL0>;
 			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
 			iommus = <&iommu_vdo M4U_PORT_L0_DISP_OVL0_RDMA0>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1c00XXXX 0x0000 0x1000>;
 		};
 
 		rdma0: disp_rdma@1c002000 {
@@ -2273,6 +2276,7 @@
 			clocks = <&vdosys0 CLK_VDO0_DISP_RDMA0>;
 			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
 			iommus = <&iommu_vdo M4U_PORT_L0_DISP_RDMA0>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1c00XXXX 0x2000 0x1000>;
 		};
 
 		color0: disp_color@1c003000 {
@@ -2281,6 +2285,7 @@
 			interrupts = <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&vdosys0 CLK_VDO0_DISP_COLOR0>;
 			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1c00XXXX 0x3000 0x1000>;
 		};
 
 		ccorr0: disp_ccorr@1c004000 {
@@ -2289,6 +2294,7 @@
 			interrupts = <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&vdosys0 CLK_VDO0_DISP_CCORR0>;
 			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1c00XXXX 0x4000 0x1000>;
 		};
 
 		aal0: disp_aal@1c005000 {
@@ -2297,6 +2303,7 @@
 			interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&vdosys0 CLK_VDO0_DISP_AAL0>;
 			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1c00XXXX 0x5000 0x1000>;
 		};
 
 		gamma0: disp_gamma@1c006000 {
@@ -2305,6 +2312,7 @@
 			interrupts = <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&vdosys0 CLK_VDO0_DISP_GAMMA0>;
 			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1c00XXXX 0x6000 0x1000>;
 		};
 
 		dither0: disp_dither@1c007000 {
@@ -2313,6 +2321,7 @@
 			interrupts = <GIC_SPI 643 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&vdosys0 CLK_VDO0_DISP_DITHER0>;
 			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1c00XXXX 0x7000 0x1000>;
 		};
 
 		merge0: disp_vpp_merge0@1c014000 {
@@ -2321,6 +2330,7 @@
 			interrupts = <GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&vdosys0 CLK_VDO0_VPP_MERGE0>;
 			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1c01XXXX 0x4000 0x1000>;
 		};
 
 		dsc0: disp_dsc_wrap@1c009000 {
@@ -2329,6 +2339,7 @@
 			interrupts = <GIC_SPI 645 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&vdosys0 CLK_VDO0_DSC_WRAP0>;
 			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1c00XXXX 0x9000 0x1000>;
 		};
 
 		dp_intf0: dp_intf0@1c015000 {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
