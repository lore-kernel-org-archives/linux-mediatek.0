Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F32C636D4
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Feb 2023 00:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQM7FL6EiKup10JC4Ms09UWDjLJj+OzocZJygk79TAg=; b=ODRmbKRHbMjtXckAsOv8P70tub
	nofo50rQqBcIEKbXOtAACIWMzMvrI3kHtAnT7efTZlkIbdHx49uguMXolvRtSsA8EIcFsa4N9XsfG
	5nPEXibbfpC8qRCnT8vRn6PUfAbfHuEN+MmbsbXp+7BES3n0fzNMXsAr5Wyf/SgNbjcy6BIakrruW
	8vr6gU5g2B++LBOIS26p+YR88cWuSDm8Hubkbi56B5AUWSZGWfFjmq/89hgLkTyjNpWj2Hoy8NcLS
	QdpEuDK70pAkfcum9wZ9iHbO2CJmicRaLinKHJ6M0+ql3mJeH7JQrmEzPajaZMXFZrpJonA19Nm4s
	4y3WxNBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQdjb-0086bY-G0; Sat, 11 Feb 2023 00:27:19 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQdj3-0086Ms-Oz; Sat, 11 Feb 2023 00:26:47 +0000
Received: from notapiano.myfiosgateway.com (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 539A06602117;
	Sat, 11 Feb 2023 00:26:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676075204;
	bh=Gm+Fv0Lf5OBMJRwMwPwUnakOGkSawtiyv5gR5vwnHEw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dq1zENlbIU6e5lYwBFr4/UN5m6eTJ6Xmij+S8+cTBbYx3YRotjypGtFE+qcRiNPOY
	 8IGNecyKb1bejqcOdieI54NjCuXJujo+/Op2iqKYadboKbzIOTnVbd81dQBVIXARGN
	 w34HSdKjWDUhTUyOuNBFZ5hNbLhiM4jZs1YFboziejhhWUzI5mJFLUpLfFafUxHisR
	 EYDjJaNjEe+fyqfscxdPrqpQ9aFmKLBqXNt3YM/UOSxBGl6kIlQP9jIp/zzh4Tm6rb
	 +aVEFDMS7dCivivaZ7bv8b1GWQRyuSdTGjNYstwabTqWZZhlBc9R5ZQZuntRcwRe4i
	 OOowiptXPcDvQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 3/5] arm64: dts: mediatek: Add dtsi files to use rt5682s on mt8192
Date: Fri, 10 Feb 2023 19:26:24 -0500
Message-Id: <20230211002626.454844-4-nfraprado@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211002626.454844-1-nfraprado@collabora.com>
References: <20230211002626.454844-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_162645_966726_B68AA892 
X-CRM114-Status: GOOD (  15.43  )
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

Add a dtsi file for the rt5682s audio codec and another to wire it to be
used by mt8192's sound card.

These dtsi files will be used by Spherion rev4 and Hayato rev5-sku2,
which make use of the rt5682s codec instead of the rt5682 used in
previous revisions.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 .../mt8192-asurada-audio-rt1015p-rt5682s.dtsi | 18 ++++++++++++++++++
 .../mt8192-asurada-audio-rt5682s.dtsi         | 19 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt1015p-rt5682s.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt5682s.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt1015p-rt5682s.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt1015p-rt5682s.dtsi
new file mode 100644
index 000000000000..8921f5e38586
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt1015p-rt5682s.dtsi
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2022 MediaTek Inc.
+ */
+#include "mt8192-asurada-audio-rt5682s.dtsi"
+#include "mt8192-asurada-audio-rt1015p.dtsi"
+
+&sound {
+	compatible = "mediatek,mt8192_mt6359_rt1015p_rt5682s";
+
+	speaker-codecs {
+		sound-dai = <&rt1015p>;
+	};
+
+	headset-codec {
+		sound-dai = <&rt5682s 0>;
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt5682s.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt5682s.dtsi
new file mode 100644
index 000000000000..919035245b6e
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt5682s.dtsi
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2022 MediaTek Inc.
+ */
+
+&i2c1 {
+	rt5682s: audio-codec@1a {
+		compatible = "realtek,rt5682s";
+		reg = <0x1a>;
+		interrupts-extended = <&pio 18 IRQ_TYPE_LEVEL_LOW>;
+		realtek,jd-src = <1>;
+		#sound-dai-cells = <1>;
+
+		AVDD-supply = <&mt6359_vio18_ldo_reg>;
+		DBVDD-supply = <&mt6359_vio18_ldo_reg>;
+		LDO1-IN-supply = <&mt6359_vio18_ldo_reg>;
+		MICVDD-supply = <&pp3300_g>;
+	};
+};
-- 
2.39.1


