Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FB4EC4320A
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 07:11:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EB5660FF2
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 07:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5EB5660FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cmTm7X1Z1TyFX+xYpEAGzQcxcAfxz5ZBoIeQ6Rhh4lM=; b=ASCCuyWuhSf/BA
	St3Ne60p0uxVwubuoxUMGaq0j4mJl99QxCHHu5aT1wAwSiu7j3enQGOItChQqmqUV9wda1vR+yViQ
	u/9kLh9i5cQ7yOS9S4kZK48trSxSqAyJEyowiRhVJugVAmZcCzq964gRYvcFivy8rgmdXeW+qVDH+
	nmQAVuoGtgEiSbl3gEGmn8pbGee/nuNiwBLR2/IZtaNEh3cx+uuXV/SXVKyL8bS1/ibZV/rEiYASP
	0maMLlgawdGL4OfjqU64XPSVpdkn/1CjUupzea/ofzLMYjWy7eur40Ez/uI6ZacVzesK5eGFtweZ+
	uAGeNWe9tIXscx2kdZng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKxvc-001WdK-Ld; Tue, 31 Aug 2021 07:11:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKxtx-001Vkz-3J; Tue, 31 Aug 2021 07:09:49 +0000
X-UUID: 20001525dd8742fe90991b995d62db38-20210831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=73AaXOcmHdv+7VV+kQDwhoCxBNnWLfYGVW9rEoVHJW4=; 
 b=JXB92UqtxrJaKmbJAtMAjSRw5FhNkxm4GEU5D+tOftTPGm19fszjp9RP9tK2+FgEwUw8GUtNsIOaNPyOKcRO5c2fdL3ipyYdlNySk/gjLTNUH8MxpdVmQO4d5baSKViQtVVsdCwJiJKDEMDyG0XanHq1ujAg4xdBbWCiJDI3j1o=;
X-UUID: 20001525dd8742fe90991b995d62db38-20210831
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1142276660; Tue, 31 Aug 2021 00:09:39 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 00:09:09 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 15:09:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 31 Aug 2021 15:09:08 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jassi Brar
 <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <hsinyi@google.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH v7 3/5] arm64: dts: mt8195: add gce node
Date: Tue, 31 Aug 2021 15:09:01 +0800
Message-ID: <20210831070903.8672-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210831070903.8672-1-jason-jh.lin@mediatek.com>
References: <20210831070903.8672-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_000945_197903_B68FD52A 
X-CRM114-Status: GOOD (  10.39  )
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

Add gce node and gce alias on mt8195 dts file.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index c146a91c6272..47c44cb77da0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -6,6 +6,7 @@
 
 /dts-v1/;
 #include <dt-bindings/clock/mt8195-clk.h>
+#include <dt-bindings/gce/mt8195-gce.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/power/mt8195-power.h>
@@ -16,6 +17,11 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		gce0 = &gce0;
+		gce1 = &gce1;
+	};
+
 	clocks {
 		clk26m: oscillator0 {
 			compatible = "fixed-clock";
@@ -699,6 +705,22 @@
 			#clock-cells = <1>;
 		};
 
+		gce0: mdp_mailbox@10320000 {
+			compatible = "mediatek,mt8195-gce";
+			reg = <0 0x10320000 0 0x4000>;
+			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH 0>;
+			#mbox-cells = <2>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_GCE>;
+		};
+
+		gce1: disp_mailbox@10330000 {
+			compatible = "mediatek,mt8195-gce";
+			reg = <0 0x10330000 0 0x4000>;
+			interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH 0>;
+			#mbox-cells = <2>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_GCE2>;
+		};
+
 		scp_adsp: syscon@10720000 {
 			compatible = "mediatek,mt8195-scp_adsp", "syscon";
 			reg = <0 0x10720000 0 0x1000>;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
