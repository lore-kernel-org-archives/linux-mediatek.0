Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200BAE7716D
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Dec 2024 19:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2jDd4bBMDalT9ZxoYHLpyRHVnoZ11E0Z+zGVQfgaKds=; b=oD8HKiblvllAG5uVF8seJ6CHna
	JSLX2bMrux+jhccGi4lmXYCrD1l3vvT6kOefuOdJHgziopNoWjxSGA2TP1moTlR5Lgj4Jv+0dKlii
	SVYj/omkjCuC55d3TpmGJ8IY+fibwM5qHFEmWPv0DylJqLh1gtS1Hs8ZaUCh3hZnoGjLuYPIO4pDt
	dhz++ftqjdgoqT81Uj4EeGwsBRSOwuUPDBKiZMC5QmPrJUX2heiDWDVoZeK2D3ReADT1TgJgPYAYF
	EYGMezvSNiw93ryf9s2V3ksVeEedHluX0xEdcOMs8pyqh5F8hkBrHnH46ptJ64BnwG7KGW65QN0vE
	MLBf+L2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIunM-0000000DdHv-1HMK;
	Wed, 04 Dec 2024 19:12:20 +0000
Received: from out-176.mta1.migadu.com ([95.215.58.176])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIuif-0000000DcLK-1NUf
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Dec 2024 19:07:31 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1733339247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2jDd4bBMDalT9ZxoYHLpyRHVnoZ11E0Z+zGVQfgaKds=;
	b=d+3YpRfV8bJMMNZ+zJ7Aciv82CZF5FknOjrbzQJEiv0QIw5G23aQHgIgEA8hM+bIACt5WJ
	ZqJUwW1T2jj9qqhl4F9djUU+lRrdQmJiXLEb7d6gUKxHe0QinqK54vOq2IW36p5XEyzPEl
	9QM7BPMlDWoVkesz0/ZjkDcw2txR10fETinlnQsXTV+IcoLc9puBfR9xJISNVzjy+msJuH
	bo8P3XQbyUR7+g3D6y6KwJGoLYcYywX+IRgFcyDEVIh6p6k97g9yo7uKd5C92lhAush/BV
	a3mV0jtdZPKZAChNlx00/sm8MWdeVuKLAEsUB5mvOdSL+biEZTWARGFhuxPVYQ==
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <fparent@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 4/5] arm64: dts: mediatek: mt8516: reserve 192 KiB for TF-A
Date: Wed,  4 Dec 2024 16:05:07 -0300
Message-ID: <20241204190524.21862-5-val@packett.cool>
In-Reply-To: <20241204190524.21862-1-val@packett.cool>
References: <20241204190524.21862-1-val@packett.cool>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_110729_501664_EDED0259 
X-CRM114-Status: GOOD (  10.12  )
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

The Android DTB for the related MT8167 reserves 0x30000. This is likely
correct for MT8516 Android devices as well, and there's never any harm
in reserving 64KiB more.

Fixes: 5236347bde42 ("arm64: dts: mediatek: add dtsi for MT8516")
Signed-off-by: Val Packett <val@packett.cool>
---
 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index dd17d8a88c19..e30623ebac0e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -144,10 +144,10 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
-		/* 128 KiB reserved for ARM Trusted Firmware (BL31) */
+		/* 192 KiB reserved for ARM Trusted Firmware (BL31) */
 		bl31_secmon_reserved: secmon@43000000 {
 			no-map;
-			reg = <0 0x43000000 0 0x20000>;
+			reg = <0 0x43000000 0 0x30000>;
 		};
 	};
 
-- 
2.47.1


