Return-Path: <SRS0=9yZI=PC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C616C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 08:00:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F26361039
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 08:00:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F26361039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gQUYaPggLb+1ikUsU7UzQLfLdnysOx0CVpWBuGVrJU4=; b=GqwW7aWcIuf//q
	F+K6NySwq0DR/BXa/JKb0/90QPGRe+0BW/4fwaApXahzTSEXLNA3QYsXyqgSGKp7JOYq7VzrCQSF3
	Y5G0oyqjX/Z7NFvDb6DkIT5Hbz+e2Zf7R0CgY0RfH3TnOf0G9nTSi8KUmshHTdpVPVaRceSrgG5/G
	wQcAA/FztWBcl0N0DXlq1U0VdnsGoc7290Xwif66MEaLYwBwEgT/Qlkbvr1Pe0QKGA/xBzdYmuElS
	YJKepXWw1+9k34/xhMeT9yiDkatS4KyYQtCGzrD9jZzT3mIqfSaOKkMo1UtBZz2to1c98X5hG6YkI
	mFgCQM0cE5pY+EoXPfag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maveo-0022OK-6F; Thu, 14 Oct 2021 08:00:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mavdi-0021e0-VQ; Thu, 14 Oct 2021 07:59:01 +0000
X-UUID: 99f658884fe44070a215aec4d11b5365-20211014
X-UUID: 99f658884fe44070a215aec4d11b5365-20211014
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 653651151; Thu, 14 Oct 2021 00:58:56 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Oct 2021 00:58:55 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 14 Oct 2021 15:58:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 14 Oct 2021 15:58:49 +0800
From: Sam Shih <sam.shih@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@kernel.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>, "Sam
 Shih" <sam.shih@mediatek.com>
Subject: [PATCH v7 4/4] arm64: dts: mediatek: add pinctrl support for mt7986b
Date: Thu, 14 Oct 2021 15:58:36 +0800
Message-ID: <20211014075836.17681-5-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211014075836.17681-1-sam.shih@mediatek.com>
References: <20211014075836.17681-1-sam.shih@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_005859_079271_D669887A 
X-CRM114-Status: UNSURE (   9.58  )
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

Add mt7986b pinctrl node

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt7986b.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986b.dtsi b/arch/arm64/boot/dts/mediatek/mt7986b.dtsi
index 9cc27020901a..a0b5ee232443 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986b.dtsi
@@ -128,6 +128,27 @@ apmixedsys: apmixedsys@1001e000 {
 			#clock-cells = <1>;
 		};
 
+		pio: pinctrl@1001f000 {
+			compatible = "mediatek,mt7986b-pinctrl";
+			reg = <0 0x1001f000 0 0x1000>,
+			      <0 0x11c30000 0 0x1000>,
+			      <0 0x11c40000 0 0x1000>,
+			      <0 0x11e20000 0 0x1000>,
+			      <0 0x11e30000 0 0x1000>,
+			      <0 0x11f00000 0 0x1000>,
+			      <0 0x11f10000 0 0x1000>,
+			      <0 0x1000b000 0 0x1000>;
+			reg-names = "gpio", "iocfg_rt", "iocfg_rb", "iocfg_lt",
+				    "iocfg_lb", "iocfg_tr", "iocfg_tl", "eint";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pio 0 0 41>, <&pio 66 66 35>;
+			interrupt-controller;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&gic>;
+			#interrupt-cells = <2>;
+		};
+
 		sgmiisys0: syscon@10060000 {
 			compatible = "mediatek,mt7986-sgmiisys_0",
 				     "syscon";
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
