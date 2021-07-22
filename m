Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED1E2C6377D
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 09:58:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B894661244
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 09:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B894661244
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WGQ1XU+jZNMO+0VzN7nYD/FAzsTVLue5q/vJkK88/fQ=; b=YOd6mrIVfQeF9I
	F7TZubXuivw7B0QfFptqiQcnnVn3zayK5yXh/V31H0lzr3wtAwytWxuCpFao4y5m8u7dZD1blLgUf
	0DyAxIwzSbqo36uwBlIP0W+e9sNZrzMz9A3TIAf9UaYUgLIxMa+Mi9k6pX9MuQDJk79t0PFgWtrBH
	wpAuFdsiwL2vO0gwOVj49Indx2rte/1ulaC2mS9Hm0UR935tbX3jpAAZYIjZC5x+z3TxIXe8AnlPI
	zupl26bfCmUAacUzUsb0dPEwWqxfE2+WklpkksY06kAXn9bGMTX8M6ZfG/6pb4WWVBfeIgIyRAM3d
	urYjK0Mt5qGS6ToBqK/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6VSj-0013eg-P1; Thu, 22 Jul 2021 09:57:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6VNM-0011Ej-Li; Thu, 22 Jul 2021 09:52:22 +0000
X-UUID: 42518a43303647398b89a360a277ff63-20210722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=+rHLqQ+C9YnMFrAlJFxRstSTu6fVW6wCDjeGuTADoVg=; 
 b=c+tW3FLZGCBv+wzt2uun6+3IcP2bh2CL+FGBqbIf93zhnktAxWLt5IlCf8tz57yDYopH445xSLwFG0oeRVSBJT6Emaci58G1bOcHMalEsRXR4Hq7GFzn/3DWcP00qeNU4FFnStCfXEyLDydrVr4mTAeIYCzXBslch/Y7Rfirx70=;
X-UUID: 42518a43303647398b89a360a277ff63-20210722
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 380594596; Thu, 22 Jul 2021 02:52:13 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Jul 2021 02:46:06 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Jul 2021 17:45:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Jul 2021 17:45:52 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <singo.chang@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: [PATCH v2 01/14] dt-bindings: mediatek: add vdosys1 RDMA/MERGE
 definition for mt8195
Date: Thu, 22 Jul 2021 17:45:38 +0800
Message-ID: <20210722094551.15255-2-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210722094551.15255-1-nancy.lin@mediatek.com>
References: <20210722094551.15255-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_025220_820979_BB9A21DF 
X-CRM114-Status: GOOD (  10.38  )
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

Add vdosys1 RDMA and MERGE definition.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 .../display/mediatek/mediatek,disp.yaml       | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
index aac1796e3f6b..b5a80c683ef6 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
@@ -230,6 +230,14 @@ properties:
       - items:
           - const: mediatek,mt8173-disp-od
 
+      # RDMA: read DMA
+      - items:
+          - const: mediatek,mt8195-vdo1-rdma
+
+      # MERGE: merge streams from two RDMA sources
+      - items:
+          - const: mediatek,mt8195-vdo1-merge
+
   reg:
     description: Physical base address and length of the function block register space.
 
@@ -461,4 +469,26 @@ examples:
         /* See mediatek,dsc.yaml for details */
     };
 
+    vdo1_rdma0: vdo1_rdma@1c104000 {
+        compatible = "mediatek,mt8195-vdo1-rdma";
+        reg = <0 0x1c104000 0 0x1000>;
+        interrupts = <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH 0>;
+        clocks = <&vdosys1 CLK_VDO1_MDP_RDMA0>;
+        power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+        iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA0>;
+        mediatek,gce-client-reg = <&gce1 SUBSYS_1c10XXXX 0x4000 0x1000>;
+    };
+
+    merge1: disp_vpp_merge@1c10c000 {
+        compatible = "mediatek,mt8195-vdo1-merge";
+        reg = <0 0x1c10c000 0 0x1000>;
+        interrupts = <GIC_SPI 503 IRQ_TYPE_LEVEL_HIGH 0>;
+        clocks = <&vdosys1 CLK_VDO1_VPP_MERGE0>,
+                 <&vdosys1 CLK_VDO1_MERGE0_DL_ASYNC>;
+        clock-names = "merge","merge_async";
+        power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+        mediatek,gce-client-reg = <&gce1 SUBSYS_1c10XXXX 0xc000 0x1000>;
+        resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE0_DL_ASYNC>;
+    };
+
 ...
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
