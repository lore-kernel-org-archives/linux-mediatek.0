Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC100CD1288
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 03:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s4PKHBjTdasACAxbApBt0TLgOQgnRiOJo3BV3DvNVno=; b=4CT46/xHgKpSD1kyPfBd8SQ6eq
	Mp25DOwEJ764GurCjNz1kZxq/sMaCM0x2RbPB5D/J7CgMmajog0+IjOuoGfEWjTx+l88wBL84fHx8
	BPLXbXtHM7RVkxaF0Iy4o4iO7UkUXe+s4/IsbxhhSykOHhTSj6srAR7hES26w4DEGozgMdJ5QMzIn
	eMi8LwdYHZ/z501ISThcNTjBPFRFKA44YotNkIaXF3Y7vK1FBHXAzBqmaHw3wdml1SwzyCeGWmDFS
	yYf7ZF72mQDhsOCdR1FeyOyWr7DYIRRdk/N4TrVu8lhqQDWC+GALFWGdTxaqdH1OxC1ldIOXeTGX1
	a/VoCJBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrUof-00000009ZW7-0Wxe;
	Tue, 02 Apr 2024 03:28:05 +0000
Received: from pb-smtp2.pobox.com ([64.147.108.71])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrUoZ-00000009ZPj-2IUG
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Apr 2024 03:28:01 +0000
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id 7FC961DBD7C;
	Mon,  1 Apr 2024 23:27:48 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=ScwN+eL5Iy7BALIJYLXFDSBD9
	VouoWmZ+JLjnDMkDm8=; b=lFgisjo0MgDYa83l0yluEPrlyMffFxrXuFxD+4BcN
	JeFwxQWmiIadb8sRRR5BztCyJIVrtigk84MBJIaw07ndRMThZ67nmLR+rWLr0D65
	S4zvDPNOV/4k2O73vTuGE2rNGm1SP31alNIMeqRM8y0NeaRGo3IWp6MdSirUeliU
	Q0=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id 760A01DBD7B;
	Mon,  1 Apr 2024 23:27:48 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:mime-version:content-transfer-encoding; s=2016-12.pbsmtp; bh=KRLolNlFAREnWbcdTG3kKhk4k/XmV5J2nlwZY29mbd4=; b=V7d3ojbug0JFrc1ZbiXTyb7i/1TJfogRInYQ9QgYFOwAVkaCG5+YvX82kvlko9wFqRcoc/vBojeJqzg511b1XiSr7Kpuhf7N5/5pLFNUiDuCOr+My9GlRaypZvvHZHE6lj5Ray4Y0KZfP+lB/zPy4VGhYHll1+rwfc2jRKnAfwA=
Received: from yoda.fluxnic.net (unknown [24.201.101.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp2.pobox.com (Postfix) with ESMTPSA id EB8411DBD7A;
	Mon,  1 Apr 2024 23:27:47 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
Received: from xanadu.lan (OpenWrt.lan [192.168.1.1])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id 10DDFC1CED0;
	Mon,  1 Apr 2024 23:27:45 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 07/15] arm64: dts: mediatek: mt8186: add lvts definitions
Date: Mon,  1 Apr 2024 23:25:41 -0400
Message-ID: <20240402032729.2736685-8-nico@fluxnic.net>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240402032729.2736685-1-nico@fluxnic.net>
References: <20240402032729.2736685-1-nico@fluxnic.net>
MIME-Version: 1.0
X-Pobox-Relay-ID: FA4CA5A0-F0A0-11EE-85E4-25B3960A682E-78420484!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_202759_721137_D402480D 
X-CRM114-Status: UNSURE (   9.61  )
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

From: Nicolas Pitre <npitre@baylibre.com>

Values extracted from vendor source tree.

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8186.dtsi
index 2fec6fd1c1..cef8244007 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1355,6 +1355,18 @@ spi0: spi@1100a000 {
 			status =3D "disabled";
 		};
=20
+		lvts: thermal-sensor@1100b000 {
+			compatible =3D "mediatek,mt8186-lvts";
+			#thermal-sensor-cells =3D <1>;
+			reg =3D <0 0x1100b000 0 0x1000>;
+			interrupts =3D <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks =3D <&infracfg_ao CLK_INFRA_AO_THERM>;
+			clock-names =3D "lvts_clk";
+			resets =3D <&infracfg_ao MT8186_INFRA_THERMAL_CTRL_RST>;
+			nvmem-cells =3D <&lvts_e_data1 &lvts_e_data2>;
+			nvmem-cell-names =3D "e_data1","e_data2";
+		};
+
 		pwm0: pwm@1100e000 {
 			compatible =3D "mediatek,mt8186-disp-pwm", "mediatek,mt8183-disp-pwm"=
;
 			reg =3D <0 0x1100e000 0 0x1000>;
@@ -1668,6 +1680,14 @@ efuse: efuse@11cb0000 {
 			#address-cells =3D <1>;
 			#size-cells =3D <1>;
=20
+			lvts_e_data1: data1 {
+				reg =3D <0x1cc 0x14>;
+			};
+
+			lvts_e_data2: data1-1 {
+				reg =3D <0x2f8 0x14>;
+			};
+
 			gpu_speedbin: gpu-speedbin@59c {
 				reg =3D <0x59c 0x4>;
 				bits =3D <0 3>;
--=20
2.44.0


