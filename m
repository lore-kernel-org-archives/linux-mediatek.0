Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE1EC28E83
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 11:01:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF30C2074D
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 11:01:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A6ikpYYD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="jvNt3f7d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF30C2074D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Hf2KiONmzh6PTuUwjrx3dJJUtVD1IrV2KPMXipJy3Rw=; b=A6ikpYYDlk/b1i1qchUxir5jI
	zxqMyiF34Bj65TEEACOukJ0jZodOv+ZedbHxsK1bDVlAmUrS6OsOYT6sW4Jgrb3Cg+NesoklhXrMW
	h/7WqP7W4GITcqxLuRdfFtZr8QibVVin0SQ0f8gNCes9O1yGU9zmE1fx3GatQQYfvxQj0+UkOvwIK
	FBkC3t+AVSs1Ev/YuHcn8oi8delF0SAJ2MtZkDxPvgLuQ0aJ52eAIAsAigMeOARNFLGuiqKJLTeGM
	m2YtiPC3zw7FfebDu2vjJpuOCoQLhhJJs76R9B9yc9Hf2ucvn3mQOUyH7UCfyCzPsLfPAY8EWVSD+
	nTPykYRHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE9Su-0008Vt-2x; Fri, 04 Sep 2020 11:01:08 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE9SU-0008Nq-QX; Fri, 04 Sep 2020 11:00:43 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
 by mxout1.routing.net (Postfix) with ESMTP id E9D853FF6D;
 Fri,  4 Sep 2020 11:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1599217232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RdOFWohILbsEDDDJFVfgHhbn+dw2QRxvLWyTIr2kZpU=;
 b=jvNt3f7d3FF2fSMFKk0MXXDc/yD9IpNkiQC8nzWhBGIU5u3Czw6ncUImhneqUjLr9W9UhQ
 fDgtzqHkfh1NTc4vZBHK8IG7G3mhK0vJ3fOA+Kb9ARofzsVD9e+0Ovg1GsB6lGi7P1OJTd
 uVzJuz+/IhjSweGEb17llg551RRqZck=
Received: from localhost.localdomain (fttx-pool-217.61.147.193.bambit.de
 [217.61.147.193])
 by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 393E0360469;
 Fri,  4 Sep 2020 11:00:31 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v6 4/4] arm: dts: mt7623: add lima related regulator
Date: Fri,  4 Sep 2020 13:00:02 +0200
Message-Id: <20200904110002.88966-5-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200904110002.88966-1-linux@fw-web.de>
References: <20200904110002.88966-1-linux@fw-web.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_070043_017657_2B99EC25 
X-CRM114-Status: GOOD (  11.06  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Alex Ryabchenko <d3adme4t@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
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
