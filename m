Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223FAD78313
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2024 12:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0EXR8idz0jZrwTu0ZraBXOMpYUYvi61Qv1pOwi0q8Gg=; b=GIELBEjMD+/S0y
	3Y5kF6iMDMvjqNpbpAM8GEl9r1sh724Of8FiQftv9pgMsiiA1PLx7YFrM37mLyBFSLCEVfXofk7wx
	RtWqSPP40uYIqmOXaffpZs1Vz0J/0qlqHEqfrvGoQbxaa15LoWXeoM6/muOg3H3xBfHamHMF/JDPE
	zizS79zL+53AGm+kE50Q3lwFrYvw3KMv3w9u+5nZqsxP7VK2sBl1SnRxoC6YuEkD9Ra9xvAVqCF7a
	pkNLx7UerZ3wYbeg2D4fSJI1bUJMJIXs2cn/mBhdbYL1LvEuNgXPR5WadZIerQ1nGPo8scaVfXWAT
	keeteQTQtakHd++chiyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5cy-000000065lZ-0zr9;
	Mon, 02 Dec 2024 12:34:12 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5VH-00000006487-3vGS;
	Mon, 02 Dec 2024 12:26:17 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout4.routing.net (Postfix) with ESMTP id 65890100942;
	Mon,  2 Dec 2024 12:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1733142374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0EXR8idz0jZrwTu0ZraBXOMpYUYvi61Qv1pOwi0q8Gg=;
	b=HGN9OKkq8JcXImEOs12P13y6OgcjkFsko0M1iTj+P6S4LgrTTzkSE5wZVhGODvNAKVXdOR
	D/HRrkc9iq45tvyTLCwsJmBUoiXBf4ueeXUE4XcpBNVv1OicHwvLPOgT9BZVHDsNDjrevw
	E9K5C7jwavloYxl2bsA3q02Xe1K0SB0=
Received: from frank-u24.. (fttx-pool-217.61.149.104.bambit.de [217.61.149.104])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id CF8D0360188;
	Mon,  2 Dec 2024 12:26:13 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 07/18] arm64: dts: mediatek: mt7988: add reserved memory
Date: Mon,  2 Dec 2024 13:25:48 +0100
Message-ID: <20241202122602.30734-8-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241202122602.30734-1-linux@fw-web.de>
References: <20241202122602.30734-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: d44b10d0-8dcf-40cb-8484-051ea16b9861
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_042616_110661_90127FA5 
X-CRM114-Status: UNSURE (   9.58  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add memory range handled by ATF to not be touched by linux kernel.
ATF is SoC specific and not board-specific so add it to mt7988.dtsi.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 09dcb39ad098..1cf801486e61 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -63,6 +63,18 @@ psci {
 		method = "smc";
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* 320 KiB reserved for ARM Trusted Firmware (BL31 and BL32) */
+		secmon_reserved: secmon@43000000 {
+			reg = <0 0x43000000 0 0x50000>;
+			no-map;
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		ranges;
-- 
2.43.0


