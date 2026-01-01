Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08E6EEB57C
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jan 2026 17:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gELqvaeQlWG+ETN/6/E6ceX26B6xTdepXFs8chq3lOw=; b=Isx6Yl9oXo6In6TZai1o4QtMe6
	ospkoMNdOLaiQ9Dg646IbqkYMH99cwik7dhtJTqYA5Nn+SZRbhxi5n0Ge09Ib6yUEVaPDxbZaR9Zc
	eK8K1CWMPMct+v4xQj3C8yOdGcDF0ijnyZELLDIOfgbODOA6nNEpJgtLlAti/4ykYDkiymMAnO6E4
	TvNworozBF2t6a6zR8Q8GRdyI3TvnAK76jaYRo+VoWsN0hDvxKnxUebCiozJoCyLFXS9luALzTZCF
	42Oj37JnU5MMRuh8LA4KBuDzaBRq9dpYHyPaWDGp1a9jIdMFaD4ClaHhn3/jb1v+SPLpGq6Qx5YtZ
	A3khSs7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbMMB-00000007Nvu-3ic5;
	Thu, 01 Jan 2026 17:21:03 +0000
Received: from mx3.wp.pl ([212.77.101.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbMM9-00000007Nu7-1tYg
	for linux-mediatek@lists.infradead.org;
	Thu, 01 Jan 2026 17:21:02 +0000
Received: (wp-smtpd smtp.wp.pl 31568 invoked from network); 1 Jan 2026 18:20:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1767288058; bh=gELqvaeQlWG+ETN/6/E6ceX26B6xTdepXFs8chq3lOw=;
          h=From:To:Cc:Subject;
          b=RDUdV3Bck8bcVEouGkoDWU6UVKD9R3EEAaHauJUzC/sa/xMaWmskqALIuT1Ym49Pu
           v/uvSRR56RW9vprf8dnYidw6TRkz7D/aOcqZYm7OR16Avk8/5B0YbGr8jv+sHLuYRL
           MegrcI0Gn1WUbEBCA3nWoykmxJKXOGrIF8wOZOGaY3tVhL7dwDZpfD1wSuxi1IqAHN
           UBeYv07JUFSc1SuPxI8sy0GGueRm5ONV23UN2pYR4KUZqCpsxSf1N9AyFjGL0W6f8D
           DjD3EbmpNUEC7EMAWuN1kjFAP9/PrNCy4Ny45uLzYk+iIXyJu8OJK9uCg42M2BcmXf
           LnRPABF0uYxPA==
Received: from 83.5.157.18.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.5.157.18])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <ansuelsmth@gmail.com>; 1 Jan 2026 18:20:58 +0100
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: ansuelsmth@gmail.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	chester.a.unal@arinc9.com,
	sergio.paracuellos@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	tsbogend@alpha.franken.de,
	angelogioacchino.delregno@collabora.com,
	linux-crypto@vger.kernel.org,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH v2 2/2] mips: dts: ralink: mt7621: add crypto offload support
Date: Thu,  1 Jan 2026 18:20:05 +0100
Message-ID: <20260101172052.1862252-2-olek2@wp.pl>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260101172052.1862252-1-olek2@wp.pl>
References: <20260101172052.1862252-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: 82bf59844e7e130908c415a5a52693c5
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000009 [gerU]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_092101_901934_88EEC6C3 
X-CRM114-Status: UNSURE (   8.91  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support for the built-in cryptographic accelerator. This accelerator
supports 3DES, AES (128/192/256 bit), ARC4, MD5, SHA1, SHA224, and SHA256.
It also supports full IPSEC and TLS offload, but this feature isn't
implemented in the driver.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 arch/mips/boot/dts/ralink/mt7621.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/ralink/mt7621.dtsi
index 0704eab4a80b..9ba28fa016fb 100644
--- a/arch/mips/boot/dts/ralink/mt7621.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
@@ -361,6 +361,14 @@ cdmm: cdmm@1fbf8000 {
 		reg = <0x1fbf8000 0x8000>;
 	};
 
+	crypto@1e004000 {
+		compatible = "mediatek,mt7621-eip93", "inside-secure,safexcel-eip93ies";
+		reg = <0x1e004000 0x1000>;
+
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SHARED 19 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
 	ethernet: ethernet@1e100000 {
 		compatible = "mediatek,mt7621-eth";
 		reg = <0x1e100000 0x10000>;
-- 
2.47.3


