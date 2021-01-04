Return-Path: <SRS0=ylaU=GH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0BADC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 08:10:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63B5E20784
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 08:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63B5E20784
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qOEwLSRJelVCl6nCRJIGzX6akk15ORPAOF5t+W9HrzA=; b=sw/hB1IKsAibnZId4yvZ5/tO1
	dDtGDBpPSuc8DuaZpq/4F3J9tvQgay3IVzdJPPVxt7+Q4bJyOytLtFsNjLj0TA8mzHlwPpr8fpeGl
	AajIK7IxtAGQsguo3hEkdDkhOINGjB1V8Wg9nKr3dmRruUD2SQk4fUULAwuIeM29Y8z5BWOh7lznm
	5FUNkAVf/Sj6ESvA0EBvojbjxfkw79EhU22bZSFDRZ4DMgWggoE1G0jt03d9NulMs0/ba8Hvi0L8/
	Zq1pM2MWVLyES7x+CYoUSOylcvpdta+N3KtmRJGwqXG+henjueDULhaHggJFkR20onFnIqyRH/PW5
	0oFCn4+Uw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwKwI-0006Pu-Mi; Mon, 04 Jan 2021 08:10:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwKwD-0006Ne-OM; Mon, 04 Jan 2021 08:10:02 +0000
X-UUID: d5f15d0db9f64e54aabf8871a8746ab2-20210104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=3l/x8Ul9yLJb3Lug4FMm5RJKw8qGhRzFqMcg3toD5VE=; 
 b=TOOyl8YHM4D+ktxNLElnkwJ03jIx+2S8Ne9U1b7br/T/9Fj4y03IajH1daqZfyLzZmLi+SONb3VGFwGqUSQf+i7s6YqATXdmW3xKFeEaiYbwC20ekK7SYzcc+HkbvUuEv0mdP05e/5NHDqVN/i1x1R0YC4JLN5ScUHbWWgM4T+E=;
X-UUID: d5f15d0db9f64e54aabf8871a8746ab2-20210104
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <argus.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1876314398; Mon, 04 Jan 2021 00:09:49 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 4 Jan 2021 00:08:30 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 4 Jan 2021 16:08:27 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 4 Jan 2021 16:08:27 +0800
From: Argus Lin <argus.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will.deacon@arm.com>
Subject: [PATCH 1/2] arm64: dts: mt6779: Support pwrap on Mediatek MT6779
 platform
Date: Mon, 4 Jan 2021 16:08:22 +0800
Message-ID: <1609747703-27207-2-git-send-email-argus.lin@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1609747703-27207-1-git-send-email-argus.lin@mediatek.com>
References: <1609747703-27207-1-git-send-email-argus.lin@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: B5E2311454F972D50E54BD2B1B1D08953A845227831B9A15705D68728BC699002000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_031001_965406_F673497D 
X-CRM114-Status: GOOD (  10.64  )
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Anson Huang <Anson.Huang@nxp.com>, Max Krummenacher <max.oss.09@gmail.com>,
 agx@sigxcpu.org, linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com,
 Li Yang <leoyang.li@nxp.com>, Michael Walle <michael@walle.cc>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 argus.lin@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Support pwrap on Mediatek MT6779 platform by adding pwrap node in dts file.

Signed-off-by: Argus Lin <argus.lin@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt6779.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6779.dtsi b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
index 370f309..2c2ca33 100644
--- a/arch/arm64/boot/dts/mediatek/mt6779.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
@@ -189,6 +189,15 @@
 			#clock-cells = <1>;
 		};

+		pwrap: pwrap@1000d000 {
+			compatible = "mediatek,mt6779-pwrap";
+			reg = <0 0x1000d000 0 0x1000>;
+			reg-names = "pwrap";
+			interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_PMIC_AP>;
+			clock-names = "spi", "wrap";
+		};
+
 		uart0: serial@11002000 {
 			compatible = "mediatek,mt6779-uart",
 				     "mediatek,mt6577-uart";
--
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
