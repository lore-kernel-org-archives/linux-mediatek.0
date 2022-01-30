Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EEC5C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Jan 2022 14:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eUqIsuv/vAVG9ORxe15TSxZvXF+n8D88rDpSqm/c9VM=; b=i5rBp6j4UVMDdX
	gmIsD4l/X6LjFcDWjMR91JTS23YVT6sbNjw03sSsX3GHy1/UiQoOZzIeHtkwtqRDdPlY/nLHK2ldQ
	vZQ8PNjGDHggN1ujWXc+D3E0ym51lG1317lkwCcQ3uLLDcm7kTY0EviJ5ZW9sRGB+ep0/Kz/cFn7k
	fQsrhCKaOYBXKSOQt50pBVWcmyulHdIjNDzcIgpt3YByAF1v681V3euaqDTQTjcLk5RVur9RWosYL
	sWCM9RPAZf4kVp6qQqFePA6jkEjwa61e2FuQH/aVU9iBgJhNLjqBHzcG29MgYYfoI8GwnYZbOG6Zx
	uPzKN43ajQwrd/xL1APg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEBYj-006jIH-1W; Sun, 30 Jan 2022 14:52:05 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEBYC-006j0c-Df; Sun, 30 Jan 2022 14:51:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SV4r8zfyzAWYlpoI7Y1Q8wKuVWvcxHwic0J49gpohiM=; b=FkKAvFaO8WHU3wozFtFucW9hpT
 yR0+JBeoAugNGDStkr5+ktpLG2KSvdyQ2/o+qReQSn3nZgS9nrJzzuIhE+wWRKoFNm91wbFBTIaaI
 XoJ+RpdkBvlIQfLXNKCQOkahK12yv8alTTL2J16f+7VGM1XX/PdRn9mKk/rDd+ijzGbg=;
Received: from p200300daa716f900d40f7dfd86c385e0.dip0.t-ipconnect.de
 ([2003:da:a716:f900:d40f:7dfd:86c3:85e0] helo=Maecks.lan)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nEBY9-0002if-Pt; Sun, 30 Jan 2022 15:51:29 +0100
From: Felix Fietkau <nbd@nbd.name>
To: Rob Herring <robh+dt@kernel.org>
Cc: soc@kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, john@phrozen.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 07/13] ARM: dts: add clock support for Airoha EN7523
Date: Sun, 30 Jan 2022 15:51:10 +0100
Message-Id: <20220130145116.88406-8-nbd@nbd.name>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220130145116.88406-1-nbd@nbd.name>
References: <20220130145116.88406-1-nbd@nbd.name>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_065132_678961_FFF957FC 
X-CRM114-Status: UNSURE (   9.37  )
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

This driver only registers fixed rate clocks, since the clocks are fully
initialized by the boot loader and should not be changed later, according
to Airoha.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 arch/arm/boot/dts/en7523.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/en7523.dtsi b/arch/arm/boot/dts/en7523.dtsi
index f1d4c03aad89..1e5280be02ba 100644
--- a/arch/arm/boot/dts/en7523.dtsi
+++ b/arch/arm/boot/dts/en7523.dtsi
@@ -2,6 +2,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/en7523-clk.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -82,6 +83,13 @@ L2_0: l2-cache0 {
 		};
 	};
 
+	scu: system-controller@1fa20000 {
+		compatible = "airoha,en7523-scu";
+		reg = <0x1fa20000 0x400>,
+		      <0x1fb00000 0x1000>;
+		#clock-cells = <1>;
+	};
+
 	gic: interrupt-controller@9000000 {
 		compatible = "arm,gic-v3";
 		interrupt-controller;
-- 
2.32.0 (Apple Git-132)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
