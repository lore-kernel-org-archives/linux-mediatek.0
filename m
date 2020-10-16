Return-Path: <SRS0=WAzV=DX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E33C433E7
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 20:41:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D795920878
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 20:41:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YLIgwA+K";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="eUe9lvGq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D795920878
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=usCDdfE9nA6rfzQfFGcr/gaM3cgwjTkWjsEVeqFt42Q=; b=YLIgwA+Kj6FoeVDK5EpNVUDeS
	nMkUXpYAU4lPUvVjSXn/1MGRGn2YEhmV7iDU7ClcChqEpWuJeooGdyUWi+i6fU9g3oS1cYnxAQJIT
	8AIJiyFU69KhGSfZy5MCRnLfK40l+cZbS/yPJc45NW9ToiLgukuQDltElbOkaYYRf6Lb432gv6Srp
	jyuXBY2mC8VT99nuUNYlLmUbb3TCMXZhOSdOQcMnfrIHUPzzvkta6QCMmB5GlA8NWpQJ7s7a7bQed
	NCrZxP97bcwtEU506ZIip6a521QEmqGHklgJbVGpE9nwdQGfkxY6mWKYnybaOLPp6G6jDBrauxjDP
	wnbgI7FzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTWX8-0002lB-Sb; Fri, 16 Oct 2020 20:41:02 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTWWt-0002gq-AS; Fri, 16 Oct 2020 20:40:49 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
 by mxout4.routing.net (Postfix) with ESMTP id 4B95B1009C6;
 Fri, 16 Oct 2020 20:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1602880842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+oJ/of7Qw64mg5bDPdUBki6EV+Di1DJQKZsfwVaB1Kc=;
 b=eUe9lvGqDR4qOexUreKNT6xAZ3cq5G+LK1YXUcwEXLPnxsZS5z6JSL4vhsIwXo4dvtkjZC
 W1/vc2hfU4vbmMTBzwMtwuGtESH6qDP1L22A0AkgiY4beFqtZ6jzNgMKfOtmZ/hI0uEAiG
 SQeRDbehoA6haIxXmXWDYPUhOc9Qd2Y=
Received: from localhost.localdomain (fttx-pool-80.208.213.194.bambit.de
 [80.208.213.194])
 by mxbox3.masterlogin.de (Postfix) with ESMTPSA id AF64036023B;
 Fri, 16 Oct 2020 20:40:41 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [RFC 1/3] dts64: mt7622: enable all pwm for bananapi r64
Date: Fri, 16 Oct 2020 22:40:17 +0200
Message-Id: <20201016204019.2606-2-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016204019.2606-1-linux@fw-web.de>
References: <20201016204019.2606-1-linux@fw-web.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_164047_489592_CE046D4D 
X-CRM114-Status: GOOD (  11.00  )
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
Cc: devicetree@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

mt7622 only supports 6 pwm-channels so drop pwm7

third pwm (pwm2) is inverted and connected to fan-socket

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts     | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index 1cc4dcb0008c..ad5b1592182d 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -414,10 +414,15 @@ mux {
 		};
 	};
 
-	pwm7_pins: pwm1-2-pins {
+	pwm_pins: pwm-pins {
 		mux {
 			function = "pwm";
-			groups = "pwm_ch7_2";
+			groups = "pwm_ch1_0", /* mt7622_pwm_ch1_0_pins[] = { 51, }; */
+				 "pwm_ch2_0", /* mt7622_pwm_ch2_0_pins[] = { 52, }; */
+				 "pwm_ch3_2", /* mt7622_pwm_ch3_2_pins[] = { 97, }; */
+				 "pwm_ch4_1", /* mt7622_pwm_ch4_1_pins[] = { 67, }; */
+				 "pwm_ch5_0", /* mt7622_pwm_ch5_0_pins[] = { 68, }; */
+				 "pwm_ch6_0"; /* mt7622_pwm_ch6_0_pins[] = { 69, }; */
 		};
 	};
 
@@ -537,7 +542,7 @@ mux {
 
 &pwm {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pwm7_pins>;
+	pinctrl-0 = <&pwm_pins>;
 	status = "okay";
 };
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
