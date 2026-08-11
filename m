Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04C9C5AC67
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2026 13:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gitYuIgMAmJ0oQcU7iG8TZn7YufiftcwyUkdvrQmLDk=; b=i9QyEZ7GJeyjnKo0hx5sx1z+RS
	HFL1qD8CTojAU+JeTumQnihqUJ6OD6m2g+9uXtk3n1CSH4TZcyorUvSu0cCHMbc9Z4u4ifDHsd4lS
	T7oKxvuG3nQlwiJQw/v+FuRE4Qu/Vm7QXBxwyNSxmtRnghMw4MnngZclCk55seSoBgAllzDKTOAH3
	iyXObvBxo2VBOCGlbI9jSFVHFdqU5/8d6Py5LNhXZrO/zBlAT31qHP4xAjhZJPU2onF2MQaAqHstN
	3SfK/HIhmsKPmVqoPIMrilI9TMmg9blfLsYrMlZPvF8w9xaILDoJQI98BIsBoHfhX3ZCLGJrETOA6
	Lg/JvSDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmLd-0000000E5Dp-3zyP;
	Tue, 11 Aug 2026 13:16:53 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmLV-0000000E5Cz-3E93
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Aug 2026 13:16:51 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-49558ce01afso6967475e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Aug 2026 06:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786454204; x=1787059004; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gitYuIgMAmJ0oQcU7iG8TZn7YufiftcwyUkdvrQmLDk=;
        b=P21gRNmFKAaovpTnVEZKjjEt/nE1c3qNQEnn5ABaEMR70O7Q0fYog5/G+bbloBV+oy
         ZHKU3tse3I5zvuud2lRTMTzP1zKZR5gcMVVZJTIHFX7Mtjle1MXvyKqpsbr6ekFNe54m
         Zz69rD0CJzutmWMWcYVOTeZpWsAkFuezXwfdoJ/sRKFfohsutaYniQ2GdWbK2sSY3ShD
         BsvN2a5Si+PWQY3+aq7TYlAg1QJm8Hc9wBv4jQGauRwBHHNXCRFkuEuKHeG0KHIwpIQw
         mUjtTy2YuxhLSMa7CRo1zcS+skMdJyDX/LE8K9bZU/Dg60vgjs2lPUsI/evSYBdjO4qY
         M4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786454204; x=1787059004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gitYuIgMAmJ0oQcU7iG8TZn7YufiftcwyUkdvrQmLDk=;
        b=ECfdYBNOB6Nk5yD7nSuU8KGuGUpO8UooBlHG4hVh1HTWaOIDcQJ0iGy3xqJv38KJel
         peWEwgSox0kgVkvHm0VHsr8wXQBvjkCeDMdusRtQdNAzhhm/TJ3p2+foJLhNZTtBrFoq
         ic5qvfeTKFKGLAOcNV8W8e1FPuQ4N0stF3Mn9X6pJK/ZrH4TSZvT3BpqvUauHh6qR+ay
         jboKkPMhPH5rv9MbPysGrXju44s7nXVWxz0pb/JoR/b2GWTSzzTda15XbXraK4WAnw0l
         VmzJW2RjIm1tviMCN8O2U/kK/mO3SjG+CV/GY5ycHcfjkqFRAjaMyObGLJJndRct4pGc
         S1oQ==
X-Forwarded-Encrypted: i=1; AHgh+RqN/w3qMmUf+1P1rJPUe/BncQ/t8pVHCGVe6q47+aVvbEJh9epJ2DvBSF2OQ63U3fdxHYnUM693a1PIFQzAcw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQV3mGjL6rGOy1iIJLM/l+dAgjV4FzDfmrpu1sJptrGGt/1CvV
	SuyPSF/Gi9KPpF/8aBySUERg0i4IqNOQXES9ikA02DtmO/4WFFzzJZDtSjaz568X
X-Gm-Gg: AR+sD10zVrtlk7E7ntPRFSPtHX2vNFjOwD1hPeNDNWrGlBQ3b51MzuVG+7bO+3A4Qtn
	cHso1TQ4SuVNWt4vVoVhdALDRL4Ezkg4EnbqJZ/MCVHzdTkJ0pY5Svw0P5n9kAyJKjF36b1+cWP
	1wRerm30tlcPi4x3/u4VB8jv5BC6U4FfdijgjlloPDQ6MPJVSYG8md8DkO2FOopqBwVEH4GdPbI
	JHVWR90oVww6dkD++Gd4LuGkov26nzfTB+glV57paB+TbBlg7SiHg+Kte24QhLBuK7GRIGM9Aua
	9/YI5FIcePzcGEEaHB/IMVPmieuxiyWhDTYHa9V2UTDKqZ8Kw7s9sSb/4x7vyPsCUCjKs0hbc+a
	NgrovkwmZTFH9zq5gXzwLeX7cqudKFJCb1lgz9wUtT1ujRe0NYcOP9U1autU1Hk1NUuf3cgBiMX
	OP5o1MYcJDzDWvWKKZj4RplbSX/muMrTHqCVWvDdBYF4VKVgcvOR2lXALptTMGSwy+/b9UFUhpW
	ykAHY90Q3LI06Jqvlus4XyOM1BOC/bteRpjnNxW1z8m8FKM
X-Received: by 2002:a05:600c:3b0e:b0:496:c361:fb96 with SMTP id 5b1f17b1804b1-4997a578481mr2356495e9.0.1786454203704;
        Tue, 11 Aug 2026 06:16:43 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-499788fd908sm47639145e9.13.2026.08.11.06.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:16:43 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] arm64: dts: airoha: en7581: Enable spi nand controller for EN7581 EVB
Date: Tue, 11 Aug 2026 15:16:30 +0200
Message-ID: <20260811131634.703225-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_061645_827357_19AA497B 
X-CRM114-Status: GOOD (  10.86  )
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

From: Lorenzo Bianconi <lorenzo@kernel.org>

Enable spi controller used for snand memory device for EN7581 evaluation
board.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581-evb.dts | 4 ++++
 arch/arm64/boot/dts/airoha/en7581.dtsi    | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/airoha/en7581-evb.dts b/arch/arm64/boot/dts/airoha/en7581-evb.dts
index 886e2e4b5f64..3dc68dbf1be7 100644
--- a/arch/arm64/boot/dts/airoha/en7581-evb.dts
+++ b/arch/arm64/boot/dts/airoha/en7581-evb.dts
@@ -25,6 +25,10 @@ memory@80000000 {
 	};
 };
 
+&snfi {
+	status = "okay";
+};
+
 &spi_nand {
 	partitions {
 		compatible = "fixed-partitions";
diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index ff6908a76e8e..0964cd783013 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -150,7 +150,7 @@ gic: interrupt-controller@9000000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
 
-		spi@1fa10000 {
+		snfi: spi@1fa10000 {
 			compatible = "airoha,en7581-snand";
 			reg = <0x0 0x1fa10000 0x0 0x140>,
 			      <0x0 0x1fa11000 0x0 0x160>;
-- 
2.53.0


