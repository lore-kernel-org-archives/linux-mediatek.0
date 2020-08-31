Return-Path: <SRS0=LMMB=CJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F8AC433E6
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Aug 2020 14:40:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 798A720767
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Aug 2020 14:40:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bLeujVfA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="QG9Bcy4D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 798A720767
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hf2KiONmzh6PTuUwjrx3dJJUtVD1IrV2KPMXipJy3Rw=; b=bLeujVfAXZkGXkQvcOLMTjJE68
	ra3uIK70N0KEA1EjbXg4hequSDksBx672doQi6SYweBFqnvnKTmLm11ZjBqDWkmqGFwdgREbTd6Mp
	f3JYaIqwPGzn07Hfgj7FxbxQGQAcafRYMOFe4RtLlP7QCt4BRsT7IVYSaaexZS5/DfhRk6hfyUMF5
	KKe29OBxK9D9ocJPS1bwcL0usxAIfVF4VRw+jiBJ6B3K3wxMo3tlmZwHc3F/IGfYJEkTpjGMLhhfV
	fP0XzbzolYhwg2USscAyHaAMwusIJB6+m59fq/z0Jhe5z3J1CNEhKLj5SBCk+rHoNqabezyS4Nakp
	JJ/gkKDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCkyW-0004sr-LX; Mon, 31 Aug 2020 14:40:00 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCkyR-0004rx-Ie; Mon, 31 Aug 2020 14:39:57 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
 by mxout2.routing.net (Postfix) with ESMTP id BDE1F5FC42;
 Mon, 31 Aug 2020 14:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1598884787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=RdOFWohILbsEDDDJFVfgHhbn+dw2QRxvLWyTIr2kZpU=;
 b=QG9Bcy4D86OBecjJqWP/tcMdwIDTmE3hui2EQ3NEBrH3qBuuFq8y7TPOkYLJ74hzHCBfqO
 GdVDgwMDOXnAwgRC2dO/ece+hky352oQocmZjea1+DndpMN5MpSeAQ3HrfuD3Oge125XMv
 BA3xEHZYF/djXMSn2ohFAMZquyS9WN4=
Received: from localhost.localdomain (fttx-pool-217.61.158.151.bambit.de
 [217.61.158.151])
 by mxbox2.masterlogin.de (Postfix) with ESMTPSA id EEE3C1005C3;
 Mon, 31 Aug 2020 14:39:46 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH] arm: dts: mt7623: add lima related regulator
Date: Mon, 31 Aug 2020 16:39:37 +0200
Message-Id: <20200831143937.28259-1-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_103956_274110_A185DBED 
X-CRM114-Status: GOOD (  10.82  )
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
Cc: chunkuang.hu@kernel.org, Frank Wunderlich <frank-w@public-files.de>,
 devicetree@vger.kernel.org, Alex Ryabchenko <d3adme4t@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Alex Ryabchenko <d3adme4t@gmail.com>

GPU needs additional regulator, add it to devicetree of bpi-r2

Signed-off-by: Alex Ryabchenko <d3adme4t@gmail.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
index f41f221e56ca..826912545ef1 100644
--- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
+++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
@@ -79,6 +79,13 @@ reg_5v: regulator-5v {
 		regulator-always-on;
 	};
 
+	reg_vgpu: fixedregulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_fixed_vgpu";
+		regulator-min-microvolt = <1150000>;
+		regulator-max-microvolt = <1150000>;
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
@@ -283,6 +290,11 @@ &i2c1 {
 	status = "okay";
 };
 
+&mali {
+	mali-supply = <&reg_vgpu>;
+	status = "okay";
+};
+
 &mmc0 {
 	pinctrl-names = "default", "state_uhs";
 	pinctrl-0 = <&mmc0_pins_default>;
@@ -402,4 +414,3 @@ &u3phy1 {
 &u3phy2 {
 	status = "okay";
 };
-
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
