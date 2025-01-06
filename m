Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C01E77188
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jan 2025 08:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m2jqZGltg1cOzex+4I71K9tCYpJ4QXYI6zWTRv4NdOU=; b=Zk02OcezWv5lpn4vGdKLsTPpck
	cKrI9zx7kZ1hCoszcJShAf7IbGNWK8LusFqtNs8DkhTeth1CLbLumDMBhVBaBIxzETQLE2zAoDnWa
	ZICyB3bpQbnpTsMc61VeyzUrIgCy+RkNBYSJ2FFpDZ4tYYmn91vKDh3DNVgaKnHibOn0U+7nYTidq
	nXo0KajT6yqkYltM1BiGpL+8izOiWTij9oO3ShpR9vUEi+iG+qaSh82tDPw3As95TPuyLmyi1GLZ4
	eusvfWKTeHLWLglMj4bCY44i6YQb8pKLYyc5by/6LO1R4hroo1+5SPUoFmoURUyRdNcHH5uFLQ8wN
	/onLZV2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUiwq-00000000a7v-0HVH;
	Mon, 06 Jan 2025 08:58:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUive-00000000Zyg-1vTy;
	Mon, 06 Jan 2025 08:57:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736153859;
	bh=LqO93PKZFzajhO0Q5bvrw7jf6gFJfNjdg6AaXE7AJoQ=;
	h=From:To:Cc:Subject:Date:From;
	b=TJgx4xSzwvwUD5scxZT27VfTMcSeR7TjO3x6u0jHgvGATyKB2oYj8kDuRoxsYdaPi
	 s6iZf/YVW7wHyzFM/ttp0+yuJFEOYX2MWgcb42+yrSNYkM3qH41OSeneaGuNhzU7XT
	 50rk6TlplXymLwgrM5oyHlD7yezotol3Ume7ZNUQRy9hCHmfZ2+/vr/VfJJaM9+bHL
	 fzOzl1vGoeQqcy1Q5pE6b3RVT3iw1WnusEMPKgyO+kiReiavjHu0legHOPiejcMRX7
	 NNn26hcGmfl5MyRTNaiqL52PWRjxQUde8kS1NG2JCH0VadOwSQqDCK8P3JWTo55NJT
	 BFnooA5GYDaQQ==
Received: from beast.luon.net (unknown [IPv6:2a10:3781:2531::8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sjoerd)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5CCDB17E1534;
	Mon,  6 Jan 2025 09:57:39 +0100 (CET)
Received: by beast.luon.net (Postfix, from userid 1000)
	id 084D4D979399; Mon, 06 Jan 2025 09:57:38 +0100 (CET)
From: Sjoerd Simons <sjoerd@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: mediatek: mt8365-evk: Set ethernet alias
Date: Mon,  6 Jan 2025 09:57:31 +0100
Message-ID: <20250106085737.227622-1-sjoerd@collabora.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_005742_680059_17F29979 
X-CRM114-Status: GOOD (  10.25  )
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

Configure an the ethernet alias to match the ethernet controller (even
if it's off by default). This allows e.g. u-boot to configure the mac
address on boot properly

Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

Changes in v2:
- Update commit subject

 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 7d90112a7e27..44c61094c4d5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -21,6 +21,7 @@ / {
 
 	aliases {
 		serial0 = &uart0;
+		ethernet = &ethernet;
 	};
 
 	chosen {
-- 
2.47.1


