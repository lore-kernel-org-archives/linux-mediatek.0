Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38004C7619A
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 08:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Leyd8D2nRHtjpbORXUngUPB1GU9NSyALdF0HPadNxJM=; b=NFD2UEmehpytotQeBlrvIvWLsQ
	o/suYrisgsAHwZ9KwrkAXnlDlHTb8VCK0yo4dwMPXPhbiCiRBbGlEf/gVOuMgIc6IKz6+xcDSsU0H
	mKlBgRh6DDMhP50PfSk4bcG3J1fW1oXVSiPX/thVhV7XFx+K+hztiM6NXFBCu6kq9qN3nKR4K1Yts
	5aoktEypgmOfi4jslDdRl1sAfnAfyB++BVn38h1zKOz6Z1iyA0y9OLFZeJodeuBiQc3iE608PMWQ7
	gtkTMs+xj3Pkbiops6k6P+6DS1Xl7ucXDDOLWZ4iaGhtW1T2jq8ilCSCRjC+tJYOjciLtVqULgM75
	SQjk47eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiLp-00AHFD-2G;
	Mon, 27 Mar 2023 08:37:13 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiLZ-00AH5Q-1t;
	Mon, 27 Mar 2023 08:37:02 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AA06966030DA;
	Mon, 27 Mar 2023 09:36:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679906216;
	bh=WzRAN9wdA273tqZEI1XBRQYQ34kkvCmE+TRLQXkcUfI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KtrLlYCBHpTkJoPbpSiqdiv1eWgoXbGH6ejgegbEdZ8g1+eXFuuQwPUUcwv2zpaw+
	 avQ2umUGre0wutECVyiHYYq1JMshDVuiFgSz8/WwWpGD7WKCXab+2zXfbUjMW1eXWP
	 iUE1n2rNU8Oa/3js7vpBzMZqePlrh20ETm9og2MlI4V3Zuen9LbeKEsZHZe4S/+Vux
	 aLS7vaBIZLxhc5b/qBIOPf5WI+5TbDanCacPV5tszT2KvY8Z79NGUz+OAk5efP7d36
	 cff2oS+/7FAA8Ea7hV6UjVpTW6+G4BzPuSbQM4if8pLeO/OK8qa/RdhP7LzGAwB9FD
	 iqPbPXaL9KSAg==
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
Subject: [PATCH v2 03/17] arm64: dts: mediatek: mt6795: xperia-m5: Enable Frequency Hopping
Date: Mon, 27 Mar 2023 10:36:33 +0200
Message-Id: <20230327083647.22017-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230327083647.22017-1-angelogioacchino.delregno@collabora.com>
References: <20230327083647.22017-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_013657_753996_DF09ECCD 
X-CRM114-Status: UNSURE (   8.64  )
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


