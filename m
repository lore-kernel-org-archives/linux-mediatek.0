Return-Path: <SRS0=Uf5e=NV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5204BC4320A
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 14:14:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BA4060F44
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 14:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BA4060F44
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NtkvjJz24FeGtpdZdhLYuJwwz9cq736VE6QulxCqnIk=; b=2Ud3qPDN6b3CKD
	Cyj0I+mSKrb+j2E0iK0AkahDIDOoMCmvgRZVesbzI0L85r6BeSTV+KVDI5vXkYfBKjc8thQ3tclEF
	leoILMLjjWZW662w0NoaxZoByMpmQYTkF4UzCeBq1RbKliC3OhaNdHVfL3kJXNxjhcY4HF/qjzhLw
	8ruZwUd3QBiHWLSzrKebRRmuPqdZM/ZJuihM16UEVuNVOUiyTO9zJ0OCscXM/JWu9uW2h2f4hqoZk
	A9YFPK3jtqgN0/p8DoWONWl63XZEWVgWJwGeVSr6CulcdoF9oLvu6zMZHdoBc/3QtQa35/l+v8SfD
	okVAV4cR53pTaAGAkCMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKi3g-00HPGe-Nq; Mon, 30 Aug 2021 14:14:44 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKi3P-00HPAL-7A; Mon, 30 Aug 2021 14:14:31 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
 by mxout2.routing.net (Postfix) with ESMTP id 7923F5FF41;
 Mon, 30 Aug 2021 14:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1630332861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=HqkVrWRC7EKt3KrlDJ9BJiUPJ234vCZbFseBVJRV4fM=;
 b=fdxDAbJhGI9SoJ1fk0YpSQfdxuCBKGd4SAmo+gTHWxuI/TAgHXQbrBdeKvo/kQ7Yg1zw2R
 9wPCg+6DlLNLrlV0lzy0zG5XIAWqftV41+5pmQX/bnCuoxgomtQYO8dx2DEO3KN0q88WWI
 Hlg0lgyCkWwbyNdb17zRdLK2x4efIzY=
Received: from localhost.localdomain (fttx-pool-157.180.227.230.bambit.de
 [157.180.227.230])
 by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 9EB44100822;
 Mon, 30 Aug 2021 14:14:20 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm: dts: mt7623: add otg nodes for bpi-r2
Date: Mon, 30 Aug 2021 16:14:15 +0200
Message-Id: <20210830141415.106136-1-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mail-ID: db1bf837-c379-4f08-aad1-a948eac37616
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_071427_637232_9220E87B 
X-CRM114-Status: UNSURE (   9.24  )
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

From: Frank Wunderlich <frank-w@public-files.de>

Add OTG-Nodes for BananaPi-R2

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
patch is based on

"arm: dts: mt7623: add musb device nodes"

https://patchwork.kernel.org/project/linux-mediatek/patch/20210822041333.5264-2-mans0n@gorani.run/
---
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
index 8d22aeec91e1..729bc055ffcd 100644
--- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
+++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
@@ -374,7 +374,14 @@ adie {
 				bias-disable;
 		};
 	};
+
+	musb_pins: musb {
+		pins-musb {
+			pinmux = <MT7623_PIN_237_EXT_SDIO2_FUNC_DRV_VBUS>;
+		};
+	};
 };
+
 &consys {
 	mediatek,pwrap-regmap = <&pwrap>;
 	pinctrl-names = "default";
@@ -462,3 +469,21 @@ &u3phy1 {
 &u3phy2 {
 	status = "okay";
 };
+
+&usb0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&musb_pins>;
+	status = "okay";
+	usb-role-switch;
+
+	connector {
+		compatible = "gpio-usb-b-connector", "usb-b-connector";
+		type = "micro";
+		id-gpios = <&pio 44 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&u2phy1 {
+	status = "okay";
+};
+
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
