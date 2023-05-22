Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DBBAC77B75
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 09:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3WQ6namd9ygJsFDnS056ahq44Mqr30BQNiwvwn0IYyg=; b=MIjdZs5HtuouHxqsQBDswlBwoU
	XqeXZaYx6osY0LNapB2ZR26GT8P4U+N5MfgA5rn3yDy9z7Fh8GmkV9uQXM9lWTUeQis4h30bTaPV4
	UYrBY6Q53/GDqSfg5zw76pVktSjOZdZjmjjfvSOrSOFZKJnIgBio//ZTvNwh+e6KwbmGlMEsrewu+
	2Yu+e2/ODYZGt2tk81rf7mbGFRURXj6UA2pchEIvXPD2q/6K4BUQ6MpeqiX7V3qjXl5p8JY0yqcZ7
	ozjXUuSPq+feZ5/kd7aZV7lNiYug8KBQGukDEKJn+cCW6XaN5FoqKM/IR+n1jvHWMA0ATZD/jQWf6
	UR6pOcrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q11rt-005sXR-1Y;
	Mon, 22 May 2023 09:30:17 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q11rp-005sUp-1M;
	Mon, 22 May 2023 09:30:14 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F32196606D84;
	Mon, 22 May 2023 10:30:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684747810;
	bh=b/HUQkVvh1ObQj0af7V3E7UOobAnX8Hp2s1B+6cZnCs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mWPLKhLnT8ZRtNCYMsRSGKpXXd4FG9CWuKO5XD4ito0twnfgpufEcC+bmlyIjuTvJ
	 i2PDB4j54Y9YxKu6ksvKq8jd4Oa1MzgbEWIlcQV7g1rPBCWOeVmAev36Do3g6VAidb
	 h0dX0d7sI2kN2i1vetcw0nvQ7+0WoJJKGc63RgRIZn7iKhImONyj4rdH0TIItekmYp
	 nW4B4fvTST8l6tIrtP+ypCG7ba0BpEQIWry4NC8EhSh5ojUKgu8eGAN6jSkCXVjvDL
	 g450f4/s7Tdsust1LrkuEvI0fz/qe2pL3/G4zG7EzCMdxixRtm0RarMn3UWk3GCbd6
	 zQkYa2JvytBQw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	weiyi.lu@mediatek.com,
	ikjn@chromium.org,
	chun-jie.chen@mediatek.com,
	tinghan.shen@mediatek.com,
	seiya.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8195: Make sure MSDCPLL's rate is 400MHz
Date: Mon, 22 May 2023 11:30:02 +0200
Message-Id: <20230522093002.75137-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230522093002.75137-1-angelogioacchino.delregno@collabora.com>
References: <20230522093002.75137-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_023013_611343_3865D4E2 
X-CRM114-Status: GOOD (  10.05  )
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

Some bootloaders will set MSDCPLL's rate lower than 400MHz: what I have
seen is this clock being set at around 384MHz.
This is a performance concern (and possibly a stability one, for picky
eMMC/SD cards) as the MSDC controller's internal divier will choose a
frequency that is lower than expected, in the end causing a difference
in the expected mmc/sd device's timings.

Make sure that the MSDCPLL frequency is always set to 400MHz to both
improve performance and reliability of the sd/mmc storage.

Fixes: 37f2582883be ("arm64: dts: Add mediatek SoC mt8195 and evaluation board")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index a44aae4ab953..daac8e050ce7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -852,6 +852,8 @@ apmixedsys: syscon@1000c000 {
 			compatible = "mediatek,mt8195-apmixedsys", "syscon";
 			reg = <0 0x1000c000 0 0x1000>;
 			#clock-cells = <1>;
+			assigned-clocks = <&apmixedsys CLK_APMIXED_MSDCPLL>;
+			assigned-clock-rates = <400000000>;
 		};
 
 		systimer: timer@10017000 {
-- 
2.40.1


