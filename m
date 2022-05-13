Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F7CC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 17:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ed6TKkImytOUqoOAWAq98q0Dxtu8N+9s4ew0ZLt0Yo=; b=XAT5pXFggdtF12
	snnxMx8CT0VV+H1l2dBCbyoMW28xz6PwakDzPSB50+iLmaT2ChF3a7a6ekq/y2BzmuPiQ4qNjaKDw
	WSrjKN418iBosHQc8YRv8C2Uha8GKTYVm2B7Ne5Ki5PE3BKjoYLfWZF0UhJKxczmBD0x9+0e05a0C
	9Zx8ECPIqF+gPvsVzO6qTL7Si/zun20hj16liyhNJcH+kn19yz3QIS3bylTFMC2rhUmqfW1FCpgmy
	3toxpZ2e02zTJhuvM1yDvmn/JBwfkzM/2Wphur+yCpZ+dyIZcWJlBiBhd+AQSeN/3uR2MzuKMKemK
	Y59bSYsyxe1Ic24R9L+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npYv6-00H1Zf-69; Fri, 13 May 2022 17:17:40 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npYtv-00H0sw-JU; Fri, 13 May 2022 17:16:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 2C9D51F463BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652462186;
 bh=a4rg/JyrfKEPVSNVifJkG8mIf7X7Pe0ajY4dp1vpzts=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AfWFvY/LXmYBQIPzMB7wxWUuxS6pAK8vApDF+K4NY2W+Ul10s0F1N8Z2HVG/akls8
 p4im//lbntV6csv9ohgvSXR3dNxOMGh/Yqm3r+0zTPXFDZDerhVGR9pm9NcaATYuNm
 izkpuaOCaD6epbiQ6Uc0fqHcnNfLkoqetDY8MBwdg3tdj6fwPH16s0yiNsXgom+2W0
 Gv1RRZwHaIDMHKH3GDiyKQVvz5R1+9HQ5kjGDx0cze0iM1Z0/M2VUlWyR+37NPEWof
 JJB59E1OrlcgnVIIVH2c6PrqiVxR8mFtiI4h0LVgwvJmDBhCLuzKCCfAL7UKEB16dn
 Gm1HPnQcylfgg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 4/7] arm64: dts: mediatek: mt6795: Add watchdog node to avoid
 timeouts
Date: Fri, 13 May 2022 19:16:14 +0200
Message-Id: <20220513171617.504430-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220513171617.504430-1-angelogioacchino.delregno@collabora.com>
References: <20220513171617.504430-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_101627_817951_92C7A98F 
X-CRM114-Status: GOOD (  12.09  )
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
