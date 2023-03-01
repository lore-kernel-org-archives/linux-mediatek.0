Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8426C64ED6
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 09:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IPeLzAnu40OEFmsm2TUZHRD4OK6i1lIc44dZlRVz8I4=; b=tC9GEvq5s9FGfjRDx3Kwe8yA86
	QFMgark5Pxucc3ubVGBg/L2/Z+imecKwWw95KEKmXqHe/XYBzuiqOq/j2aJ4GsgezKIJV0IhdkaXj
	dM1c5SibB2mwBGnv/9u8Jm+hSz3Lp3xrJBeXXrkxIuuMN7aa76hfG4THiZnGtD06rTZ9LjAGr+5s4
	v4CJRWWq+sRl62R9v2O3m4Ui3qAwtzgjmnAEXYwajgpumJ/2apiOyWc25Z67um15OMZas68P1d0xn
	3aw+euZMzIG/61XlWEL72StN5OlH4YxdVhzum00R0hZXGG42JxfP0QO205Cdkku9HvYKVqXZH2r3B
	jFkaytSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXJFV-00Fg1k-PA; Wed, 01 Mar 2023 09:59:49 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXJBS-00FdO7-GS; Wed, 01 Mar 2023 09:55:39 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D050D660211B;
	Wed,  1 Mar 2023 09:55:36 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677664537;
	bh=co4SeDmQzj4uU8aYQJsjemsonD8P7POUOi2D/TyJicQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LNy8CnbOZxIoaSG9lOwDELZPZvwSOFF6ZoXE3St0Hjhbs1dq9GP2Vr9Ux4rfjgDDA
	 c98a5Ml4ioX3aLdmuVF37c/VCxRt+/7GDBFM/Dj21pdh6dxvtdl+kKPCbKpCuLg1R8
	 3FQO3RGxwc3Zffx7q+wNLT8y7ajTGd6hHOXWGxCmDd2sYyxjkJ9GiNlt8jgdnJpbXM
	 2MDpGwx2YrkdLz6w8ibZ1vkQ2Ttg4Nv5B+h0PkTIbdaMXMSLdNwhcrB1niGm5IRuo4
	 5IbCQ8+tDH8EusEPQclRv9ytqM1Wt98Rnf/H0jlDjomO7qpGUyU3NQCGFYD7G+6Mzy
	 zBPcCtltPv/SA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org
Subject: [PATCH v4 12/19] arm64: dts: mediatek: mt8192-asurada: Couple VGPU and VSRAM_OTHER regulators
Date: Wed,  1 Mar 2023 10:55:16 +0100
Message-Id: <20230301095523.428461-13-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
References: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_015538_698051_51577C83 
X-CRM114-Status: UNSURE (   9.02  )
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

Add coupling for these regulators, as VSRAM_OTHER is used to power the
GPU SRAM, and they have a strict voltage output relation to satisfy in
order to ensure GPU stable operation.
While at it, also add voltage constraint overrides for the GPU SRAM
regulator "mt6359_vsram_others" so that we stay in a safe range of
0.75-0.80V.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 8570b78c04a4..f858eca219d7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -447,6 +447,13 @@ &mt6359_vrf12_ldo_reg {
 	regulator-always-on;
 };
 
+&mt6359_vsram_others_ldo_reg {
+	regulator-min-microvolt = <750000>;
+	regulator-max-microvolt = <800000>;
+	regulator-coupled-with = <&mt6315_7_vbuck1>;
+	regulator-coupled-max-spread = <10000>;
+};
+
 &mt6359_vufs_ldo_reg {
 	regulator-always-on;
 };
@@ -1411,6 +1418,8 @@ mt6315_7_vbuck1: vbuck1 {
 				regulator-max-microvolt = <800000>;
 				regulator-enable-ramp-delay = <256>;
 				regulator-allowed-modes = <0 1 2>;
+				regulator-coupled-with = <&mt6359_vsram_others_ldo_reg>;
+				regulator-coupled-max-spread = <10000>;
 			};
 		};
 	};
-- 
2.39.2


