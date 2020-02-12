Return-Path: <SRS0=vX0G=4A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4BB6C3F68F
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2020 14:42:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAE482082F
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2020 14:42:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KpUiqPIy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nottaYil"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAE482082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NTJ6aMNgFQIxZpxWAyaVnMoJYBUfSpyAMFA/bu48oTc=; b=KpUiqPIyLn35xa
	DIpzcEmsxi0ZsEiVPCjZNjHr3HSSa8QOeNjviUQdH7Xu2mTyEinLWR6Fu6z+t/4DO3SSHrfGTQQEE
	nl+FKTtvFC0U8Bw/L/4QXaO3CrH0S+tHYPKfGi8mlNWbQY1c6ayAcYDQvvV7WBqaL8jCFfC8Sdg6H
	HWZicoLXMKf2jC9ZFmfbQATft3fYfNvAmIf3J196Wb7oGY8BjXrFxX2tplyQXpyLA/eauFSDoj8jc
	b/VDdlyYSQHYhAuOH5E0J1FbnjzxiNY2S26U2BJ1YoLC/kS9/Q78Zh5yqY/MZ6LdK5Lf/0tGSj9pU
	JYMzq9e/Q71MT9lS/pzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1tDM-00069t-B8; Wed, 12 Feb 2020 14:42:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1tDA-00060e-Iy; Wed, 12 Feb 2020 14:41:57 +0000
Received: from localhost.localdomain (unknown [213.195.124.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3101B20661;
 Wed, 12 Feb 2020 14:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581518515;
 bh=wEVnPEVadN4OH26RQpKYiCbNPRhH3AiT5vcHEXJsjMs=;
 h=From:To:Cc:Subject:Date:From;
 b=nottaYilZg9Z91uAkWMe2KVCa1QXM0EQaD0qoO53IYtKop0a3W52t+3Idv3zBo0/D
 PD1YqBppqcgdlpOOdADzxM0Vy6ls+xB6uUqK2mmPLqdE2p66GgJik71QAyjxqoquhq
 fk06ImDaAdSDGd7GL1FM0xsCZh/8lfn+QbS+h+xU=
From: matthias.bgg@kernel.org
To: Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] ARM: dts: mediatek: rename scpsys nodes to
 power-controller
Date: Wed, 12 Feb 2020 15:41:44 +0100
Message-Id: <20200212144145.25407-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200212_064156_647617_BB138DA4 
X-CRM114-Status: GOOD (  10.30  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Matthias Brugger <matthias.bgg@gmail.com>

The nodes with name scpsys actually implement a power-controller.
Rename the nodes to match the bindings description.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---

 arch/arm/boot/dts/mt2701.dtsi | 2 +-
 arch/arm/boot/dts/mt7623.dtsi | 2 +-
 arch/arm/boot/dts/mt7629.dtsi | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index 51e1305c6471..2093b38d6e6d 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -148,7 +148,7 @@ syscfg_pctl_a: syscfg@10005000 {
 		reg = <0 0x10005000 0 0x1000>;
 	};
 
-	scpsys: scpsys@10006000 {
+	scpsys: power-controller@10006000 {
 		compatible = "mediatek,mt2701-scpsys", "syscon";
 		#power-domain-cells = <1>;
 		reg = <0 0x10006000 0 0x1000>;
diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index a79f0b6c3429..f76b4a3c34b9 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -268,7 +268,7 @@ syscfg_pctl_a: syscfg@10005000 {
 		reg = <0 0x10005000 0 0x1000>;
 	};
 
-	scpsys: scpsys@10006000 {
+	scpsys: power-controller@10006000 {
 		compatible = "mediatek,mt7623-scpsys",
 			     "mediatek,mt2701-scpsys",
 			     "syscon";
diff --git a/arch/arm/boot/dts/mt7629.dtsi b/arch/arm/boot/dts/mt7629.dtsi
index 867b88103b9d..60787632e4a1 100644
--- a/arch/arm/boot/dts/mt7629.dtsi
+++ b/arch/arm/boot/dts/mt7629.dtsi
@@ -90,7 +90,7 @@ pericfg: syscon@10002000 {
 			#clock-cells = <1>;
 		};
 
-		scpsys: scpsys@10006000 {
+		scpsys: power-controller@10006000 {
 			compatible = "mediatek,mt7629-scpsys",
 				     "mediatek,mt7622-scpsys";
 			#power-domain-cells = <1>;
-- 
2.24.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
