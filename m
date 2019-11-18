Return-Path: <SRS0=+oxs=ZK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB4BC432C3
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Nov 2019 10:43:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 123FE2067D
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Nov 2019 10:43:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WXsWkbPG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GrSgfku+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 123FE2067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z/8tjV9khPjp+DJZzZLXL3Angh2pmGZLTRxu51HG7w0=; b=WXsWkbPGxOOuTW
	dPwSwuUrhjFGeohEdb9xBigwVGerid4VOLMTiCtwFApn04r3xqIK3ZPsbLfSjgE6q2dRDWIlcYkXm
	scCiDblnm6OYk9bLpDJzhCtDF0OEVSDWsLRbX25iZkjB11dg9VbnCdVpi45XX7Pzf11OMvoaeW21c
	96HAs3DtPTODjzu2FUSkMz0raLJC2tTHg/Tz8qATM6A+UQKip8H1fEWAo8pfLqU7DHVognZe/PVv1
	WlljJUafcpSdHJLlIdK/V7//4behevDGTyGklNNp/Qhr9jDVqb3qDkQawedqNJlpol7ToyW86+rGZ
	/qcrzOGzP3zQhJgV/kkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWeV9-00066J-Lm; Mon, 18 Nov 2019 10:43:23 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWeV7-00065K-IC
 for linux-mediatek@lists.infradead.org; Mon, 18 Nov 2019 10:43:23 +0000
Received: by mail-pg1-x542.google.com with SMTP id l24so9434680pgh.10
 for <linux-mediatek@lists.infradead.org>; Mon, 18 Nov 2019 02:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oal8H4KU9ceKzMRCHfIeWqGJ097aAOuBrL6LAkt5Sts=;
 b=GrSgfku+mO66VD5S3fXJy0QqA/u2NkhlTQf4eWsc4mfIDEEYtUYATDd73lu47Uxx8K
 sGgCLMjUfyiasrcvlYBpYXko/hxwYDbDHx5LahBHGesdM+c39jmIh08y23zYqWKD+0+p
 Kqygrm1arCtVRyG/XE/mPiFlhEVQXMWzBSENA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oal8H4KU9ceKzMRCHfIeWqGJ097aAOuBrL6LAkt5Sts=;
 b=Rf5yBZo6aygAsFukiyp4NUO4ih0ReWGqOeISVR6un/VnvISLr1FjV0vEMiw7gyb5o2
 ljEYFm6jb7E0hlg58/SfQK2Gm2nCHrvVDSVNSRefTM//EZcJEKraEQlNLVC3yN1GspdQ
 V5HXbgMl3svsI3HeNbamHOkMkCGmkAGJTWiTwlIkrolRWhe8+DqAp8yZGTRI6hPZfjLy
 68updUu6jFlL+hxxOg2zDlMAGO5mLAo1lhoSr/zlHoBZk+D0u0XG4gmjupmgaF94RSt0
 Vd9We8yyZEANUdBh6f5HAB5GQLQCUeR6LPHQBxMstjBpfo4HTuD/3YvHEBYDI2R8Q3oq
 q1ow==
X-Gm-Message-State: APjAAAWZJYPCAUHJ0goft/jYJ84Uvw+YmyLIJwDusR2ydwqoMEk0zKdJ
 O1n6uhJq3NI8cSr6/Mx7LNvmDw==
X-Google-Smtp-Source: APXvYqz73PCW+T58lexcwbtEkYi/LQt0IUyjR4at8WkiLlPclgUmtqSyac2X2Xajrwp/TEsevh0T3Q==
X-Received: by 2002:a63:db15:: with SMTP id e21mr16299127pgg.21.1574073800047; 
 Mon, 18 Nov 2019 02:43:20 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id p18sm20485310pff.9.2019.11.18.02.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 02:43:19 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH] arm64: dts: mt8173: Add gce setting in mmsys and display node
Date: Mon, 18 Nov 2019 18:42:53 +0800
Message-Id: <20191118104252.228406-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191118_024321_607027_C64D1713 
X-CRM114-Status: UNSURE (   8.32  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In order to use GCE function, we need add some informations
into display node (mboxes, mediatek,gce-client-reg, mediatek,gce-events).

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
- This is based on series "support gce on mt8183 platform"
  https://patchwork.kernel.org/cover/11208309/
- gce setting in 8183:
  https://patchwork.kernel.org/patch/11127105/
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 15f1842f6df3..e84ec3f95d81 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -911,6 +911,11 @@ mmsys: clock-controller@14000000 {
 			assigned-clocks = <&topckgen CLK_TOP_MM_SEL>;
 			assigned-clock-rates = <400000000>;
 			#clock-cells = <1>;
+			mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST 1>,
+				 <&gce 1 CMDQ_THR_PRIO_HIGHEST 1>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
+					      <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
 		};
 
 		mdp_rdma0: rdma@14001000 {
@@ -991,6 +996,7 @@ ovl0: ovl@1400c000 {
 			clocks = <&mmsys CLK_MM_DISP_OVL0>;
 			iommus = <&iommu M4U_PORT_DISP_OVL0>;
 			mediatek,larb = <&larb0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
 		};
 
 		ovl1: ovl@1400d000 {
@@ -1001,6 +1007,7 @@ ovl1: ovl@1400d000 {
 			clocks = <&mmsys CLK_MM_DISP_OVL1>;
 			iommus = <&iommu M4U_PORT_DISP_OVL1>;
 			mediatek,larb = <&larb4>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xd000 0x1000>;
 		};
 
 		rdma0: rdma@1400e000 {
@@ -1011,6 +1018,7 @@ rdma0: rdma@1400e000 {
 			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
 			iommus = <&iommu M4U_PORT_DISP_RDMA0>;
 			mediatek,larb = <&larb0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
 		};
 
 		rdma1: rdma@1400f000 {
@@ -1021,6 +1029,7 @@ rdma1: rdma@1400f000 {
 			clocks = <&mmsys CLK_MM_DISP_RDMA1>;
 			iommus = <&iommu M4U_PORT_DISP_RDMA1>;
 			mediatek,larb = <&larb4>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xf000 0x1000>;
 		};
 
 		rdma2: rdma@14010000 {
@@ -1031,6 +1040,7 @@ rdma2: rdma@14010000 {
 			clocks = <&mmsys CLK_MM_DISP_RDMA2>;
 			iommus = <&iommu M4U_PORT_DISP_RDMA2>;
 			mediatek,larb = <&larb4>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0 0x1000>;
 		};
 
 		wdma0: wdma@14011000 {
@@ -1041,6 +1051,7 @@ wdma0: wdma@14011000 {
 			clocks = <&mmsys CLK_MM_DISP_WDMA0>;
 			iommus = <&iommu M4U_PORT_DISP_WDMA0>;
 			mediatek,larb = <&larb0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
 		};
 
 		wdma1: wdma@14012000 {
@@ -1051,6 +1062,7 @@ wdma1: wdma@14012000 {
 			clocks = <&mmsys CLK_MM_DISP_WDMA1>;
 			iommus = <&iommu M4U_PORT_DISP_WDMA1>;
 			mediatek,larb = <&larb4>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x2000 0x1000>;
 		};
 
 		color0: color@14013000 {
@@ -1059,6 +1071,7 @@ color0: color@14013000 {
 			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_LOW>;
 			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 			clocks = <&mmsys CLK_MM_DISP_COLOR0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x3000 0x1000>;
 		};
 
 		color1: color@14014000 {
@@ -1067,6 +1080,7 @@ color1: color@14014000 {
 			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_LOW>;
 			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 			clocks = <&mmsys CLK_MM_DISP_COLOR1>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x4000 0x1000>;
 		};
 
 		aal@14015000 {
@@ -1075,6 +1089,7 @@ aal@14015000 {
 			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_LOW>;
 			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 			clocks = <&mmsys CLK_MM_DISP_AAL>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x5000 0x1000>;
 		};
 
 		gamma@14016000 {
@@ -1083,6 +1098,7 @@ gamma@14016000 {
 			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_LOW>;
 			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 			clocks = <&mmsys CLK_MM_DISP_GAMMA>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x6000 0x1000>;
 		};
 
 		merge@14017000 {
-- 
2.24.0.432.g9d3f5f5b63-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
