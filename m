Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD25C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 17:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Leyd8D2nRHtjpbORXUngUPB1GU9NSyALdF0HPadNxJM=; b=xtgL3feHEUdS1Cszhn/2HuOMdT
	ZFyBjx+9rW7Cccgf2vMS24kjVRTq0EOjfBnP/+ZHdKk/1xifoUAA1Els9OqY8a2DfRFEMlmRsNvlE
	VeraoS/OPAOgqmOZ7bgSKXqh7CFLqWzU7LSSamNM0Fj0W6UlAAwnJd4r4P6TxYIQIzg6Olcw4FMet
	W/PG7shsxEY7ReawF4QEmmK05Jp5qnVnwLj9r1Csj50ZD9e+V+1yGm45RedTFJ2q/a+MR3b687zr8
	gbPqX7VIYzbZmLw4qfEBKLNxs/T+QsiT4qPATZLPxdrM/632Q+ix3nuez/+mO9iq57OITb+7USR97
	fxpLjRXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pflde-005Acl-0f;
	Fri, 24 Mar 2023 17:55:42 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfld6-005AHT-0h;
	Fri, 24 Mar 2023 17:55:10 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DCDCF6603130;
	Fri, 24 Mar 2023 17:55:02 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679680503;
	bh=WzRAN9wdA273tqZEI1XBRQYQ34kkvCmE+TRLQXkcUfI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ams36ojBJMVxIc5HvWzMXt7fadVAKmNvyNvXbDr1SIfjjcsxhR4/t1n+E4o1iFfdy
	 26HgPV3F0T6mZ4xOt2/mfaxLVmw7QYwVKWyIUtu2xvfaOt0nNaR2sL1ewdrA8WgIxC
	 6RTt244duGpb3yHRXLx2MEHWuBo+JFl53MfcueyylPi3jFZfp8aQ5N6QbEC1T406Ou
	 3LyK3q7E7S5Trc+zfmiqj4yE2MqC2GX50uUjEIsaxSUFugk7ogyNaVj5pbmebJh/Y3
	 PANgRk+LyR73AEPhxc2Xe7OypsHaWi7xWDB8UKtMFWyxsYK+0BnEvcoa53jn/3lDpm
	 BFqx4y3RzMdpQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: qii.wang@mediatek.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	jassisinghbrar@gmail.com,
	houlong.wei@mediatek.com,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v1 03/18] arm64: dts: mediatek: mt6795: xperia-m5: Enable Frequency Hopping
Date: Fri, 24 Mar 2023 18:54:41 +0100
Message-Id: <20230324175456.219954-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
References: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_105508_389905_D29D1029 
X-CRM114-Status: UNSURE (   8.21  )
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

Enable FHCTL with Spread Spectrum for MAINPLL, MPLL and MSDCPLL
as found on the downstream kernel for this smartphone.
Which one to enable, and at what SSC percentage, was found by
dumping the debugging data from a running downstream kernel and
checking the downstream code.

/proc/freqhopping # cat status
FH status:
===============================================
id == fh_status == pll_status == setting_id == curr_freq == user_defined
 0           0             1             0      1599000         0
 1           0             1             0      1716000         0
 2           1             1             2      1092000         0
 3           1             1             2      2912000         0
 4           1             0             2      1600000         0
 5           0             0             0            0         0
 6           0             1             0      1518002         0
 7           0             0             0            0         0
 8           0             0             0            0         0

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
index d3415527d389..52ce3284a46f 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
@@ -48,6 +48,13 @@ bootloader-region@46000000 {
 	};
 };
 
+&fhctl {
+	clocks = <&apmixedsys CLK_APMIXED_MAINPLL>, <&apmixedsys CLK_APMIXED_MPLL>,
+		 <&apmixedsys CLK_APMIXED_MSDCPLL>;
+	mediatek,hopping-ssc-percent = <8>, <5>, <8>;
+	status = "okay";
+};
+
 &pio {
 	uart0_pins: uart0-pins {
 		pins-rx {
-- 
2.40.0


