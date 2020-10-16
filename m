Return-Path: <SRS0=WAzV=DX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D7FC433E7
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 20:41:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A272320878
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 20:41:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="koVXhA3E";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="BdVkPMOp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A272320878
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yTrcrRYMflA9TeMilNV8jNm+LoZ+CUobA807tRu/Z+M=; b=koVXhA3E0aV6gtyApQFCG0GVi
	l1EUEqWv+d99gFPHYGPSg+8eXt7+5sBo7oGaOHo0ScquqhHNOmQDr0RDvi0IuBJvTxhaUi8FdxYD0
	oxBg0PmOLJVbZHToU70yIx8UQuAaUsjLQ5J5hCzELiQ0U1vcq+asI/lkXmW+1AICtwHDbeNUbUxTu
	Rn4NkL/53ph5PIqVzbvyuzZFLpke9z/A8xGpxEdJkxrja6b/AOaqsSnket03LzzvauXpjSW27bRqT
	mlvygbvNFWTxKdh9LS24gRCTsSBCLvWj74fXb4A3Rw/9AdLK8CrQIPS5GIzcWkVzAunFYtRtsJRdP
	RWrrb7ROA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTWXF-0002nz-Vf; Fri, 16 Oct 2020 20:41:10 +0000
Received: from mxout3.routing.net ([134.0.28.8])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTWWz-0002go-DP; Fri, 16 Oct 2020 20:40:54 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
 by mxout3.routing.net (Postfix) with ESMTP id CF8A4604A2;
 Fri, 16 Oct 2020 20:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1602880842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MLMOMEv1DZCcr4q6lo8XvM0Y6vneu4kR0PkQI7AZltg=;
 b=BdVkPMOpG9iiyC7QKDD4gHRnuePVaLjbO4gl0aA/PbSCSBrWL59P3KoKWssXGq8LEeWCH0
 9gsEhTwtU9g/0fuTysMQk/aC2WbMUzJIMTXQO4M+RkQiffJ/Mh9M88niinfz7Wt2RZZdWR
 i7o3/32r25Pbj/x/JlWYLV7ejuHIrXo=
Received: from localhost.localdomain (fttx-pool-80.208.213.194.bambit.de
 [80.208.213.194])
 by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 45350360549;
 Fri, 16 Oct 2020 20:40:42 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [RFC 2/3] dts64: mt7622: disable spi1 and uart2 because pins are used
 by pwm
Date: Fri, 16 Oct 2020 22:40:18 +0200
Message-Id: <20201016204019.2606-3-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016204019.2606-1-linux@fw-web.de>
References: <20201016204019.2606-1-linux@fw-web.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_164053_612638_64CD5F16 
X-CRM114-Status: GOOD (  10.14  )
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

MDI_TP_P0 (gpio51) is used by pwm1 and uart2 (uart1 on gpio-header)
MDI_RP_P4 (gpio67) is used by pwm4 and spi1

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index ad5b1592182d..74a843e6d107 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -570,7 +570,6 @@ &spi0 {
 &spi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spic1_pins>;
-	status = "okay";
 };
 
 &ssusb {
@@ -592,7 +591,6 @@ &uart0 {
 &uart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart2_pins>;
-	status = "okay";
 };
 
 &watchdog {
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
