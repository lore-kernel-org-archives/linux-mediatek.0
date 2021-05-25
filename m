Return-Path: <SRS0=AnEI=KU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E69ECC2B9F8
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 05:55:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7C60613AB
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 05:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7C60613AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hb4EPWpKziFfUIHB0hkqdefIa3pG2wh5L3nKwuwIYYo=; b=X/crVdDCF6EvrD
	WbluSqv2qy3arKmOhQt6OVcPocyaAuZxH0CUQ3BQX+yISYhE38honJnAfP1YcNDWeusjU7RVSBiIq
	BZ/Ld8Hhc/EK2Zfuk1tMqjDtWms0o01XqKX9VascF6cOtEl/j3rAx0CwVjXPZjk8ci+XDqGRpYSPr
	spu+obhS/pQFMRaka5unATEUuAk7aS4JMYoc24Gmx4eY2ozR8MPuO35pKqG9pYXFSsbe5WJU0pe4Z
	1Y8S/0m1l7u3ncQGxzg4nW/SWZyU0s5SuHR9f3W2LDxQO0UHe3lWfrdt5czPzFIQFcMxIBjCNCuVl
	31SBsREvrvm0ZJSq5F5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llQ2c-003Uw5-0a; Tue, 25 May 2021 05:55:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1llQ0x-003UUB-Mj; Tue, 25 May 2021 05:54:05 +0000
X-UUID: 3dba30ac6aef4b4c84c00355367636fa-20210524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=M9PbB3Ho7qxMK4qJbrHOGq+ZfKUCCg9EFAejM9xN66A=; 
 b=hRqfQUpSki85u3sFg+ZSoPDIAIveErPdlgYyUNPVdrAdbjCfx4BxQ+TPD9TbtJrjZSQ6c1D/LkQwIWejHdmVQpAHrfLAT7DaLaEUTgNp/IcUlAlvjWchbOmtMY+5gst0Jbr8BJ/KKgye2LGxYPrmyiv9cBS7FC/aT4KSDII1Igs=;
X-UUID: 3dba30ac6aef4b4c84c00355367636fa-20210524
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <nina-cm.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 420716170; Mon, 24 May 2021 22:54:02 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 May 2021 22:54:00 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 May 2021 13:53:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 25 May 2021 13:53:59 +0800
From: Nina Wu <nina-cm.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Zhen Lei <thunder.leizhen@huawei.com>, Nina Wu <Nina-CM.Wu@mediatek.com>, 
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <srv_heupstream@mediatek.com>, <Jackson-kt.Chang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 7/7] arm64: dts: mt8192: Add devapc node
Date: Tue, 25 May 2021 13:53:06 +0800
Message-ID: <1621921986-20578-7-git-send-email-nina-cm.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1621921986-20578-1-git-send-email-nina-cm.wu@mediatek.com>
References: <1621921986-20578-1-git-send-email-nina-cm.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_225403_788402_1FEAC30E 
X-CRM114-Status: GOOD (  11.27  )
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

From: Nina Wu <Nina-CM.Wu@mediatek.com>

Add devapc nodes to mt8192.

Signed-off-by: Nina Wu <Nina-CM.Wu@mediatek.com>
---
This patch depends on "Add dt-bindings of MT8192 clocks" [1]
and "Add mt8192 clock controllers" [2]

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20210524122053.17155-7-chun-jie.chen@mediatek.com/
[2] https://patchwork.kernel.org/project/linux-mediatek/patch/20210331083854.7650-2-chun-jie.chen@mediatek.com/
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index b0923de..6f5c8c5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -517,6 +517,33 @@
 			clock-names = "clk13m";
 		};
 
+		devapc_infra: devapc@10207000 {
+			compatible = "mediatek,mt8192-devapc";
+			reg = <0 0x10207000 0 0x1000>;
+			vio-idx-num = <367>;
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&infracfg CLK_INFRA_DEVICE_APC>;
+			clock-names = "devapc-infra-clock";
+		};
+
+		devapc_peri: devapc@10274000 {
+			compatible = "mediatek,mt8192-devapc";
+			reg = <0 0x10274000 0 0x1000>;
+			vio-idx-num = <292>;
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&infracfg CLK_INFRA_DEVICE_APC>;
+			clock-names = "devapc-infra-clock";
+		};
+
+		devapc_peri2: devapc@10275000 {
+			compatible = "mediatek,mt8192-devapc";
+			reg = <0 0x10275000 0 0x1000>;
+			vio-idx-num = <242>;
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&infracfg CLK_INFRA_DEVICE_APC>;
+			clock-names = "devapc-infra-clock";
+		};
+
 		scp_adsp: syscon@10720000 {
 			compatible = "mediatek,mt8192-scp_adsp", "syscon";
 			reg = <0 0x10720000 0 0x1000>;
@@ -661,6 +688,15 @@
 			status = "disabled";
 		};
 
+		devapc_peri_par: devapc@11020000 {
+			compatible = "mediatek,mt8192-devapc";
+			reg = <0 0x11020000 0 0x1000>;
+			vio-idx-num = <58>;
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&infracfg CLK_INFRA_DEVICE_APC>;
+			clock-names = "devapc-infra-clock";
+		};
+
 		nor_flash: spi@11234000 {
 			compatible = "mediatek,mt8192-nor";
 			reg = <0 0x11234000 0 0xe0>;
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
