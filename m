Return-Path: <SRS0=1JTW=3S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	URIBL_DBL_ABUSE_MALW,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D07C33CB2
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jan 2020 08:27:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C21020708
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jan 2020 08:27:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kHa14BN5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="SoApOkEQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C21020708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4FdDVzrj0E3dvV3uhfe/BbO8h7LomrbJCTmOaFbzeSQ=; b=kHa14BN5sxxuYg
	YnxWhqAro8H5upD+Oo8t+fAHyJDICSGMExJA6jDuIleWoVonhvrFwAw1GWpwMRMQFdU6TJFw5cDok
	oBPxXJe126b9Kv8s0VrL9wLND7213mQyG/UjxrpoolX9yKrY3f9mCC5R0tYNCFoKk0sc2eZy5T1O2
	CpiZj1KNxWwWwTrCLmVikO43FC4wMrbBP6qPQL5UjlWI3wVLFweprXzK9SIfPWIq5dJcrDFe0I1jq
	F5BV2k6Z/U7ANm3uu5G/Gb86Kvje9AqzckDrW7LOkEead+HvKHEHidEKQV2RiX9OIHQDwD0rSLesM
	9ZiVIkroD8Nd1/BQaTWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwih6-0002li-5G; Wed, 29 Jan 2020 08:27:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwigv-0002aw-FX; Wed, 29 Jan 2020 08:27:19 +0000
X-UUID: 0ee1fe3ce2a14726926d4f54c23bb4dd-20200129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=INKR0i+Hxnse1nE1cbIAERiSPrh/G+JRIrLKl829tUM=; 
 b=SoApOkEQfNl4+LmTGWfcntVeiW7jBTtcokAr6b7ZgbKlpmdwzqhNZXf+4ikn8RJX1OCx2F0OEYZitAMw09NhKlsxqIfLDgKAweLgNHiPMuBMxMEgcVb064CWUHEIJLQw+l/hXFbauUQgqN37jqHGYPr5XDyF26/rS/ZHQ59DwMY=;
X-UUID: 0ee1fe3ce2a14726926d4f54c23bb4dd-20200129
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <louis.kuo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2146697617; Wed, 29 Jan 2020 00:27:15 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 29 Jan 2020 00:18:26 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 29 Jan 2020 16:15:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 29 Jan 2020 16:17:12 +0800
From: Louis Kuo <louis.kuo@mediatek.com>
To: <hans.verkuil@cisco.com>, <laurent.pinchart+renesas@ideasonboard.com>,
 <tfiga@chromium.org>, <keiichiw@chromium.org>, <matthias.bgg@gmail.com>,
 <mchehab@kernel.org>
Subject: [RFC PATCH V5 2/3] dt-bindings: mt8183: Add sensor interface
 dt-bindings
Date: Wed, 29 Jan 2020 16:16:49 +0800
Message-ID: <20200129081650.8027-3-louis.kuo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200129081650.8027-1-louis.kuo@mediatek.com>
References: <20200129081650.8027-1-louis.kuo@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200129_002717_528276_F21CE4DC 
X-CRM114-Status: GOOD (  12.06  )
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
Cc: devicetree@vger.kernel.org, Sean.Cheng@mediatek.com, Rynn.Wu@mediatek.com,
 srv_heupstream@mediatek.com, Jerry-ch.Chen@mediatek.com,
 jungo.lin@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org,
 linux-mediatek@lists.infradead.org, zwisler@chromium.org,
 louis.kuo@mediatek.com, christie.yu@mediatek.com, frederic.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch adds the DT binding documentation for the sensor interface
module in Mediatek SoCs.

Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
---
 .../bindings/media/mediatek-seninf.txt        | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-seninf.txt

diff --git a/Documentation/devicetree/bindings/media/mediatek-seninf.txt b/Documentation/devicetree/bindings/media/mediatek-seninf.txt
new file mode 100644
index 000000000000..85a990814bdf
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek-seninf.txt
@@ -0,0 +1,66 @@
+ ca* Mediatek seninf MIPI-CSI2 host driver
+
+Seninf MIPI-CSI2 host driver is a HW camera interface controller. It support
+a widely adopted, simple, high-speed protocol primarily intended for
+point-to-point image and video transmission between cameras and host devices.
+
+Required properties:
+  - compatible: "mediatek,mt8183-seninf"
+  - reg: Must contain an entry for each entry in reg-names.
+  - reg-names: Must include the following entries:
+    "base": seninf registers base
+    "rx": Rx analog registers base
+  - interrupts: interrupt number to the cpu.
+  - clocks : clock name from clock manager.
+  - clock-names: must be CLK_CAM_SENINF and CLK_TOP_MUX_SENINF,
+    It is the clocks of seninf.
+  - ports : list port node of endpoint.
+  - port : describe endpoint for each remote device port connected to this
+  		   port.
+  	reg : port reg 0 must be main camera, port reg 1 must be sub camera,
+  		  since seninf driver support upto 4 cameras, so camisp is reg 4.
+
+Example:
+		seninf: seninf@1a040000 {
+			compatible = "mediatek,mt8183-seninf";
+			reg = <0 0x1a040000 0 0x8000>,
+			      <0 0x11c80000 0 0x6000>;
+			reg-names = "base", "rx";
+			interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_CAM>;
+			clocks = <&camsys CLK_CAM_SENINF>,
+				 <&topckgen CLK_TOP_MUX_SENINF>;
+			clock-names = "CLK_CAM_SENINF", "CLK_TOP_MUX_SENINF";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					seninf_port0_endpoint: endpoint {
+						data-lanes = <0 1 3 4>;
+						remote-endpoint = <&ov8856_endpoint>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					seninf_port1_endpoint: endpoint {
+						data-lanes = <1>;
+						remote-endpoint = <&ov02a10_endpoint>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					seninf_camisp_endpoint: endpoint {
+						remote-endpoint = <&camisp_endpoint>;
+					};
+				};
+			};
+		};
+
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
