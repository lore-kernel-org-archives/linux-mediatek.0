Return-Path: <SRS0=dCaZ=2J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDB35C2D0C0
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Dec 2019 05:50:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EAB921582
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Dec 2019 05:50:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SDeuQlEe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tr/nwbGq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EAB921582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:To:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wMoacX8TtEBTcn2g42/yH5a1SYzUCR4GqjsKe8eCKGU=; b=SDeuQlEeFuhGgd
	YonLSieLWbBfTaCTDQW5o+hvZXyv6tFXTAdJ+AHJfyZj6cwS8mG7FP81lMQCQtf4PABnV3mxtMuTP
	b/M94DhUmcLaS6Rr5k0P+kTbrmYJfU6HNWHgQ1hyZalAq7qmgIc86MRPJA8jDUJnVo/Tm5EVkhLtO
	6UUH/t81KOPRuDLF9aB5r4bB0ecqwNmq9FwzXhZO+YFHqVKvqQHxojGdJJvnRyvc+jMRNsg52dvAp
	Cs5vTavSoifo97f9z6PB5hAMy/mtPzlssgnJK6TQSQlRsz5AMgZLCZe4Eyh3OyUMxt5mdWIA7eKmV
	nJ4E3GIEW563IFvs9zmQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihohg-0007bC-3z; Thu, 19 Dec 2019 05:50:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihohS-0006V6-W8; Thu, 19 Dec 2019 05:50:16 +0000
X-UUID: 0d496d9b5cd54846aad32e14aff1cc6f-20191218
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=u/vWTAbZlH4j2bhnD+Ag+oO8onBzT6jpu+qmICQf9Ow=; 
 b=tr/nwbGqcaGoaE72kPiTaqCQU//ZnnqQGCiOssNfBUgW0Tyz6NFJkRL1M+BQrrzKOaYYJx4gm5waoYu+EPRnNhDVYpUwUsJl5jOmYKrOaKg4wQPkAoF9DI+VTbFvne4S0Zh+Z8ybOI3zWsJgIbDayqe1s49Iqx4ef4py+nbJxjU=;
X-UUID: 0d496d9b5cd54846aad32e14aff1cc6f-20191218
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jungo.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 943656058; Wed, 18 Dec 2019 21:50:08 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 18 Dec 2019 21:50:21 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 19 Dec 2019 13:49:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 19 Dec 2019 13:50:08 +0800
From: Jungo Lin <jungo.lin@mediatek.com>
To: <tfiga@chromium.org>, <hverkuil-cisco@xs4all.nl>,
 <laurent.pinchart@ideasonboard.com>, <matthias.bgg@gmail.com>,
 <mchehab@kernel.org>
Subject: [v6, 1/5] media: dt-bindings: mt8183: Added camera ISP Pass 1
Date: Thu, 19 Dec 2019 13:49:26 +0800
Message-ID: <20191219054930.29513-2-jungo.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191219054930.29513-1-jungo.lin@mediatek.com>
References: <Jungo Lin <jungo.lin@mediatek.com>
 <20191219054930.29513-1-jungo.lin@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3424BFE6CB592FD6D869534D12E758F930287C42C4EAF56ABF1438AC5279C5E72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_215015_054858_87F7FE97 
X-CRM114-Status: GOOD (  10.79  )
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
Reply-To: Jungo Lin <jungo.lin@mediatek.com>
Cc: shik@chromium.org, devicetree@vger.kernel.org, Sean.Cheng@mediatek.com,
 suleiman@chromium.org, Rynn.Wu@mediatek.com, srv_heupstream@mediatek.com,
 robh@kernel.org, ryan.yu@mediatek.com, Jerry-ch.Chen@mediatek.com,
 frankie.chiu@mediatek.com, jungo.lin@mediatek.com, sj.huang@mediatek.com,
 yuzhao@chromium.org, linux-mediatek@lists.infradead.org, zwisler@chromium.org,
 ddavenport@chromium.org, frederic.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch adds DT binding document for the Pass 1 (P1) unit
in Mediatek's camera ISP system. The Pass 1 unit grabs the sensor
data out from the sensor interface, applies ISP image effects
from tuning data and outputs the image data or statistics data to DRAM.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
---
Changes from v6:
 - Add port node description in the dt-binding document.
---
 .../bindings/media/mediatek,camisp.txt        | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,camisp.txt

diff --git a/Documentation/devicetree/bindings/media/mediatek,camisp.txt b/Documentation/devicetree/bindings/media/mediatek,camisp.txt
new file mode 100644
index 000000000000..a85f37c0b87d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,camisp.txt
@@ -0,0 +1,83 @@
+* Mediatek Image Signal Processor Pass 1 (ISP P1)
+
+The Pass 1 unit of Mediatek's camera ISP system grabs the sensor data out
+from the sensor interface, applies ISP effects from tuning data and outputs
+the image data and statistics data to DRAM. Furthermore, Pass 1 unit has
+the ability to output two different resolutions frames at the same time to
+increase the performance of the camera application.
+
+Required properties:
+- compatible: Must be "mediatek,mt8183-camisp" for MT8183.
+- reg: Physical base address of the camera function block register and
+  length of memory mapped region. Must contain an entry for each entry
+  in reg-names.
+- reg-names: Must include the following entries:
+  "cam_sys": Camera base function block
+  "cam_uni": Camera UNI function block
+  "cam_a": Camera ISP P1 hardware unit A
+  "cam_b": Camera ISP P1 hardware unit B
+  "cam_c": Camera ISP P1 hardware unit C
+- interrupts: Must contain an entry for each entry in interrupt-names.
+- interrupt-names : Must include the following entries:
+  "cam_uni": Camera UNI interrupt
+  "cam_a": Camera unit A interrupt
+  "cam_b": Camera unit B interrupt
+  "cam_c": Camera unit C interrupt
+- iommus: Shall point to the respective IOMMU block with master port
+  as argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  for details.
+- clocks: A list of phandle and clock specifier pairs as listed
+  in clock-names property, see
+  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
+- clock-names: Must be "camsys_cam_cgpdn" and "camsys_camtg_cgpdn".
+- mediatek,larb: Must contain the local arbiters in the current SoCs, see
+  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
+  for details.
+- power-domains: a phandle to the power domain, see
+  Documentation/devicetree/bindings/power/power_domain.txt for details.
+- mediatek,scp: The node of system control processor (SCP), see
+  Documentation/devicetree/bindings/remoteproc/mtk,scp.txt for details.
+- port: child port node corresponding to the data input, in accordance with
+  the video interface bindings defined in
+  Documentation/devicetree/bindings/media/video-interfaces.txt. The port
+  node must contain at least one endpoint.
+
+Example:
+SoC specific DT entry:
+
+	camisp: camisp@1a000000 {
+		compatible = "mediatek,mt8183-camisp";
+		reg = <0 0x1a000000 0 0x1000>,
+				<0 0x1a003000 0 0x1000>,
+				<0 0x1a004000 0 0x2000>,
+				<0 0x1a006000 0 0x2000>,
+				<0 0x1a008000 0 0x2000>;
+		reg-names = "cam_sys",
+				"cam_uni",
+				"cam_a",
+				"cam_b",
+				"cam_c";
+		interrupts = <GIC_SPI 253 IRQ_TYPE_LEVEL_LOW>,
+				<GIC_SPI 254 IRQ_TYPE_LEVEL_LOW>,
+				<GIC_SPI 255 IRQ_TYPE_LEVEL_LOW>,
+				<GIC_SPI 256 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "cam_uni",
+				"cam_a",
+				"cam_b",
+				"cam_c";
+		iommus = <&iommu M4U_PORT_CAM_IMGO>;
+		clocks = <&camsys CLK_CAM_CAM>,
+				<&camsys CLK_CAM_CAMTG>;
+		clock-names = "camsys_cam_cgpdn",
+				"camsys_camtg_cgpdn";
+		mediatek,larb = <&larb3>,
+				<&larb6>;
+		power-domains = <&scpsys MT8183_POWER_DOMAIN_CAM>;
+		mediatek,scp = <&scp>;
+
+		port {
+			camisp_endpoint: endpoint {
+				remote-endpoint = <&seninf_camisp_endpoint>;
+			};
+		};
+	};
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
