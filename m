Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D98CA1010
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Sep 2025 16:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aTPbuqTFGPpcvTZTvr3E+08PU5bGC+EZtPBLGAy0lLA=; b=y0ufHgU/vg7VQ1o2i44VBg58UH
	F4S/6RYyb8gqWmnp7yq6GF2WTQvBNeZQFh03bFDXpwBSEnrdidPuk5NYL5DYmuTpDABv8WesngTQ3
	hSqLw00ZzVWgiVrhP7nSQBXssZsHN4nzGwRo8LIf295ToJaLcBtPys4bIbGNhasOVu3iX6qTEqYik
	HP4JgA5H810AfHDlmnBDzA1tPQ++WJZZ1L9JrktLqa2ndm6cHrbD1gArbKqltL28xGuT4afKkpitI
	p/TcSYLyiQve6cS3ge72yNe/uNAEkuBJqFmAaoVvrIbzu7rT07THMS0DuiuTokdbRAeB2DYPea5VO
	brA9zFSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuZYU-00000003CTZ-0td2;
	Fri, 05 Sep 2025 16:44:54 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuWNW-00000001wJK-2yph;
	Fri, 05 Sep 2025 13:21:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757078480;
	bh=5LzAHgCUGNowNZG8+zWWeAtPEjv3HfW+vL/OBN9utHY=;
	h=From:Date:Subject:To:Cc:From;
	b=PpaRUePreKEpkpL6JsC0+yrr9JQmvmZAOm5EU2habrc+2slwPpcYIwLj3JKBwil2s
	 V0PAiuQRybZeZULK7jN8px3xw7IMcS2c1DrDH1oBo4EVJR4fxtxgogrXfA2dTRpaL6
	 u41DAmTJx6PeXvRpXTGTOVgvYJB/2+MYhhNrpqKuUMa0MlFQEYg/n/h2+wREtUwvhN
	 VhOlGeBXti6T29O6uiBcOIakEPNYbQOTp/+IpW4nrBq9VuU8dAgQJotXgwom4lsSuA
	 XjZWNTaUBPtNm6UAhSPv1jsZDqSjuSQkBYw7IoPEBDHXSfTcCLX7wnWG/NzIUF7P5l
	 ffI50ZCV8BFlg==
Received: from localhost-live.home (2a01cb0892F2D600c8f85cF092d4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DB0FF17E0B85;
	Fri,  5 Sep 2025 15:21:19 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Fri, 05 Sep 2025 15:21:19 +0200
Subject: [PATCH] arm64: dts: mediatek: mt8395-nio-12l: Enable UFS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-radxa-nio-12l-ufs-v1-1-e2468bfd2c69@collabora.com>
X-B4-Tracking: v=1; b=H4sIAM7jumgC/x3MTQqAIBBA4avIrBtQ6ce6SrQwG2sgNJQiiO6et
 PwW7z2QKTFlGMQDiS7OHEOBqgS4zYaVkJdi0FI3spcNJrvcFgNHVHrH02d0RnXWtLWfaw2lOxJ
 5vv/nOL3vB3UglfJjAAAA
X-Change-ID: 20250905-radxa-nio-12l-ufs-c817a864fb42
To: kernel@collabora.com, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_062122_909000_1DB8CC64 
X-CRM114-Status: UNSURE (   9.39  )
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

UFS is the primary storage for the Radxa NIO 12L. Enable it
now that the ufshci and ufsphy nodes are available in the
common mt8195 dtsi.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index 329c60cc6a6be0b4be8c0b8bb033b32d35302804..4cbd78c126f6b56f1833d220f7a7fbc7e4320cbb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -990,6 +990,16 @@ &uart1 {
 	status = "okay";
 };
 
+&ufshci {
+	vcc-supply = <&mt6359_vemc_1_ldo_reg>;
+	vccq2-supply = <&mt6359_vufs_ldo_reg>;
+	status = "okay";
+};
+
+&ufsphy {
+	status = "okay";
+};
+
 &ssusb0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&usb3_port0_pins>;

---
base-commit: 6c68f4c0a147c025ae0b25fab688c7c47964a02f
change-id: 20250905-radxa-nio-12l-ufs-c817a864fb42

Best regards,
-- 
Julien Massot <julien.massot@collabora.com>


