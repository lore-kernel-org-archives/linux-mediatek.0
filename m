Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C650C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 11:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ed6TKkImytOUqoOAWAq98q0Dxtu8N+9s4ew0ZLt0Yo=; b=DtBFd6EwoPjBop
	wKubF/kwjyE3Y8X5PlBNxK0OARfJMtf2vFzEMLhYtrxxWd3alx5DEEJ6JdDyRpYxyq9+NUr2jFggg
	iWAKcyqYAcuhT4sJk5Z+w1O8O8o7b6uKK6lD3oN6iyMONMgETF8lNvwP6Ncyj13bk7aHojsF1X0PY
	momcIKv36Jp7p/VJC6tIiNHPR0dT6iJb2UC60pYm0TBq+yyCC4vKmPWhwDaW1aWNhJcFxsFBO/QbK
	9jm8CdXcA4rALdCWH85HVCRI5g1wLXpGlmeK/LCdBS1wZZQmo4J6rVA81F9dwxIPv6uIPyAaFFVsb
	je1ob+y77rI+Nx46v/9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGH4-001H9v-IC; Thu, 09 Jun 2022 11:24:26 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGFt-001GMD-C6; Thu, 09 Jun 2022 11:23:14 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 745DD66017D4;
	Thu,  9 Jun 2022 12:23:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654773792;
	bh=a4rg/JyrfKEPVSNVifJkG8mIf7X7Pe0ajY4dp1vpzts=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cjUzNuyMK/20GfbAc/y72h7+fAwkNXNVsq/OGwPUZo/9PWwiDnKghTypqicng8F9V
	 zOJtHMkFUOUIOmJFMR8t/XDtAE5XJzpmpcvUWd5mskK5v1eDN3rTflqXt5DH7Uo8WE
	 S5t9wMVNuZq8cpsQKF74uGhb8LALAjnJNMtBTjpWAUWhF0hMqdBddyVK9hpk4L+lYZ
	 vg9TsWac7trd+76Ti0b/cae83y/nvR9OOX4G9pi2l9SBw1ICfLxb2aVo7U/y1xCY3e
	 SpiCjCrQ3/i7sLiNx9OIEJV3y3nxlvN99lYyiQFLveZ4ba9Pm5kqFskiemmPB7/3RL
	 psXJSX4t1NqHw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	konrad.dybcio@somainline.org,
	marijn.suijten@somainline.org,
	martin.botka@somainline.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	paul.bouchara@somainline.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 04/10] arm64: dts: mediatek: mt6795: Add watchdog node to avoid timeouts
Date: Thu,  9 Jun 2022 13:22:57 +0200
Message-Id: <20220609112303.117928-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609112303.117928-1-angelogioacchino.delregno@collabora.com>
References: <20220609112303.117928-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_042313_602738_9D3BF60B 
X-CRM114-Status: GOOD (  12.22  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

At least on commercial devices like some smartphones, the bootloader
will initialize the SoC watchdog and set it to reboot the board when
it times out. The last pet that this watchdog is getting is right
before booting the kernel and left it enabled as a protection against
boot failure: this means that Linux is expected to initialize this
device and pet as soon as possible, or it will bark and reset the AP.

In order to prevent that, add the required watchdog node as default
enabled: this will have no side effects on boards that are not
performing the aforementioned watchdog setup before booting Linux.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index 639104b3f693..363fa25b4edc 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -188,6 +188,14 @@ soc {
 		compatible = "simple-bus";
 		ranges;
 
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt6795-wdt";
+			reg = <0 0x10007000 0 0x100>;
+			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_LOW>;
+			#reset-cells = <1>;
+			timeout-sec = <20>;
+		};
+
 		sysirq: intpol-controller@10200620 {
 			compatible = "mediatek,mt6795-sysirq",
 				     "mediatek,mt6577-sysirq";
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
