Return-Path: <SRS0=ytEc=GY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B2CC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 06:18:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A9DB238EE
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 06:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A9DB238EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l8zP/B9JIFEAWe8jbWfqCmnbzW6jZiTX2qbbUVeJuIk=; b=qUywd6uBw7dFeLlBjW2jLmO5+
	jGrq8XHBf9RBMRJV0Y8HxDHHOTkD/wbu6JkmJeCNVCrwEE1/HdqaEYoczEC/2ObNuounO1s/QYwxM
	M5ATV20TROp5A5/h17j6r57DTRDxZXUrPXbsnzQt+8jPUKVoXCySEiko0SCWulUejdEtS1kHcBqlo
	mUDu7O/QqmrS0pp8zd9QSDQMLdgraIrUkRjTTREqoCiwJi2hKSWVJtpVFgotb69Jc5RWD8fCoa49w
	yvkI0cVXYmCB43PzYnKOMSmvEmveWNXilkCqqzxnAvFG6yzYCCvzGbMogWID4HjAl1ggBobebK3f0
	c6s2/dJwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2TIW-0001VI-JV; Thu, 21 Jan 2021 06:18:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2TIS-0001SP-Gu; Thu, 21 Jan 2021 06:18:23 +0000
X-UUID: 597104c266794aac85be0bf6b78b5e1b-20210120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=1yDN3jWZNVYnrkxict1qz+l29/Aeg9gf9erJa9FVHDg=; 
 b=RDVZ+D0sLLLga7/p9iM55V2HdXZOCscUbu0qMQryTSwoKwAq/6R6z8caBuCjpXC0QT91FkfWTnArd99ylpx6U3Y0tD7kqfl4mzrgV8MfcRtHZjwWmLsShOYCp0kF0xlR2x/nJKc38kTRcxuZX3R5v2SLVdzRlrTP7OZuKM+yt00=;
X-UUID: 597104c266794aac85be0bf6b78b5e1b-20210120
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 301561812; Wed, 20 Jan 2021 22:18:13 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Jan 2021 22:18:12 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Jan 2021 14:18:10 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 21 Jan 2021 14:18:09 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>,
 "Andrew-CT Chen" <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Maoguang Meng <maoguang.meng@mediatek.com>, "Longfei
 Wang" <longfei.wang@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>
Subject: [PATCH 2/3] arm64: dts: mt8173: Separating mtk-vcodec-enc device node
Date: Thu, 21 Jan 2021 14:18:03 +0800
Message-ID: <20210121061804.26423-2-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210121061804.26423-1-irui.wang@mediatek.com>
References: <20210121061804.26423-1-irui.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_011820_738797_97B03A05 
X-CRM114-Status: GOOD (  13.63  )
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
Cc: Irui Wang <irui.wang@mediatek.com>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There are two separate hardware encoder blocks inside MT8173.
Split the current mtk-vcodec-enc node to match the hardware architecture.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
Signed-off-by: Irui Wang <irui.wang@mediatek.com>

---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 60 ++++++++++++------------
 1 file changed, 31 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 7fa870e4386a..d667b296c512 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -1459,13 +1459,10 @@
 		};
 
 		vcodec_enc: vcodec@18002000 {
-			compatible = "mediatek,mt8173-vcodec-enc";
-			reg = <0 0x18002000 0 0x1000>,	/* VENC_SYS */
-			      <0 0x19002000 0 0x1000>;	/* VENC_LT_SYS */
-			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>,
-				     <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
-			mediatek,larb = <&larb3>,
-					<&larb5>;
+			compatible = "mediatek,mt8173-vcodec-avc-enc";
+			reg = <0 0x18002000 0 0x1000>;	/* VENC_SYS */
+			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
+			mediatek,larb = <&larb3>;
 			iommus = <&iommu M4U_PORT_VENC_RCPU>,
 				 <&iommu M4U_PORT_VENC_REC>,
 				 <&iommu M4U_PORT_VENC_BSDMA>,
@@ -1476,29 +1473,12 @@
 				 <&iommu M4U_PORT_VENC_REF_LUMA>,
 				 <&iommu M4U_PORT_VENC_REF_CHROMA>,
 				 <&iommu M4U_PORT_VENC_NBM_RDMA>,
-				 <&iommu M4U_PORT_VENC_NBM_WDMA>,
-				 <&iommu M4U_PORT_VENC_RCPU_SET2>,
-				 <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
-				 <&iommu M4U_PORT_VENC_BSDMA_SET2>,
-				 <&iommu M4U_PORT_VENC_SV_COMA_SET2>,
-				 <&iommu M4U_PORT_VENC_RD_COMA_SET2>,
-				 <&iommu M4U_PORT_VENC_CUR_LUMA_SET2>,
-				 <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
-				 <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
-				 <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
+				 <&iommu M4U_PORT_VENC_NBM_WDMA>;
 			mediatek,vpu = <&vpu>;
-			clocks = <&topckgen CLK_TOP_VENCPLL_D2>,
-				 <&topckgen CLK_TOP_VENC_SEL>,
-				 <&topckgen CLK_TOP_UNIVPLL1_D2>,
-				 <&topckgen CLK_TOP_VENC_LT_SEL>;
-			clock-names = "venc_sel_src",
-				      "venc_sel",
-				      "venc_lt_sel_src",
-				      "venc_lt_sel";
-			assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>,
-					  <&topckgen CLK_TOP_VENC_LT_SEL>;
-			assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>,
-						 <&topckgen CLK_TOP_VCODECPLL_370P5>;
+			clocks = <&topckgen CLK_TOP_VENC_SEL>;
+			clock-names = "venc_sel";
+			assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>;
 		};
 
 		jpegdec: jpegdec@18004000 {
@@ -1530,5 +1510,27 @@
 				 <&vencltsys CLK_VENCLT_CKE0>;
 			clock-names = "apb", "smi";
 		};
+
+		vcodec_enc_lt: vcodec@19002000 {
+			compatible = "mediatek,mt8173-vcodec-vp8-enc";
+			reg =  <0 0x19002000 0 0x1000>; /* VENC_LT_SYS */
+			interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
+			iommus = <&iommu M4U_PORT_VENC_RCPU_SET2>,
+				 <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
+				 <&iommu M4U_PORT_VENC_BSDMA_SET2>,
+				 <&iommu M4U_PORT_VENC_SV_COMA_SET2>,
+				 <&iommu M4U_PORT_VENC_RD_COMA_SET2>,
+				 <&iommu M4U_PORT_VENC_CUR_LUMA_SET2>,
+				 <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
+				 <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
+				 <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
+			mediatek,larb = <&larb5>;
+			mediatek,vpu = <&vpu>;
+			clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
+			clock-names = "venc_lt_sel";
+			assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
+			assigned-clock-parents =
+				 <&topckgen CLK_TOP_VCODECPLL_370P5>;
+		};
 	};
 };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
