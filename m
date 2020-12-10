Return-Path: <SRS0=Sq/6=FO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94DBEC4361B
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 08:35:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 230D323D67
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 08:35:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 230D323D67
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=psQD2q9uPcppHoM96n2hjCntGoP4H9r2dD9NZ987ngU=; b=1yPAjw2SIRQuBrytcJmNouPqgF
	BsB4LvMIAnIc2vA9xetTGKzJWMHGLnLrLbLTUEr1fUufV0fXh9GG16quSct+bs1C4Kesjg0DkhY4C
	OK/DDAdRgLNRe8ciexQZspuZgjj3emu//5V2XG+CD0yzHnmwc8GqTY/ZbNiPTS02x/CSXIX6dg0aj
	BzqtxsE+NQksL19faL9AIZIo7sP5tOVnyPvOeKzvPk5FnZdJ/1M1fUh55/QVwp2tVTJ9g7CSLitXn
	+sr4u5TFcoKnrHYm9JFTqW9C4ETrsa/bpZ83O5vP2gnEymz7RQNm6a44Zn/PZ+g6k7bjK9nG0GzUM
	kGWS4XrA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knHPj-0005ir-Lb; Thu, 10 Dec 2020 08:35:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knHPf-0005gW-QM; Thu, 10 Dec 2020 08:35:01 +0000
X-UUID: 3936560d4d4447248105d9067353a3a3-20201210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=FjitxOkJTfbaj8Ioyh59wZ/m6naJV74IvepyDWIIugo=; 
 b=NK/1etlEwxrLaOJ7z/SPjYzQi51eTdBezT1RE4kQNNyPJcacZrRRAjJSH0kM5J5Lzykco6rKnXIO1wwoFxnPyHk0zTaeGDhZW9TVi3/8X7aXMc2TrWQyeBluZBgY7T+SE7TyPr0HiCtJyyVrpQ6UJ6dRBiHAdhsd8iPBZ5WeXyg=;
X-UUID: 3936560d4d4447248105d9067353a3a3-20201210
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <bayi.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 675734865; Thu, 10 Dec 2020 00:34:51 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Dec 2020 00:34:48 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Dec 2020 16:34:46 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Dec 2020 16:34:46 +0800
From: Bayi Cheng <bayi.cheng@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v1] arm64: dts: mt8192: add nor_flash device node
Date: Thu, 10 Dec 2020 16:34:43 +0800
Message-ID: <1607589283-31225-1-git-send-email-bayi.cheng@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_033500_620893_281EB0E1 
X-CRM114-Status: GOOD (  11.04  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, bayi cheng <bayi.cheng@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Chuanhong Guo <gch981213@gmail.com>, Ikjoon Jang <ikjn@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: bayi cheng <bayi.cheng@mediatek.com>

add nor_flash device node

Signed-off-by: bayi cheng <bayi.cheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index e12e024..b15b0d3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -379,6 +379,19 @@
 			status = "disabled";
 		};
 
+		nor_flash: spi@11234000 {
+			compatible = "mediatek,mt8173-nor";
+			reg = <0 0x11234000 0 0xe0>;
+			interrupts = <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&clk26m>,
+				 <&clk26m>,
+				 <&clk26m>;
+			clock-names = "spi", "sf", "axi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disable";
+		};
+
 		i2c3: i2c3@11cb0000 {
 			compatible = "mediatek,mt8192-i2c";
 			reg = <0 0x11cb0000 0 0x1000>,
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
