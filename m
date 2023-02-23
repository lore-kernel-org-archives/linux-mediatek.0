Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C907C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 13:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VO92luxRYsdQFdFK/Lge50FPdfOEd7N62jCQXQjhQ9k=; b=AR/CgJs+CimkdRANU5S8NVaI5I
	APVhaHP5kvl0xnLSnz/PF5N7mj5bPhoO0eniH1LDAtyRMtCwOlutLLp/cE5QnV/FR/f3SCwARU8PP
	cuVGWpdV/Ky8kfwz0u1OMPZ/bPfEcfVeRJmtHQZNwmlfwHzM6NxTL7HRDQqcA2o5KeR3ANeVCObPp
	qOuOxLTNur5Ceyx+tOZ3h2hI7QvmdSB3D/0C2kBpvajCeQtVLK0ewnx5AfyyYklDaGIqoM+6pUU1F
	BaypT/wAS7Xqqd7n868nuLfd8Nn4VpXdeSLOhNcrDCKuWxfddKDANSkAAYvuT/b4jLSNuQz5h8i1Y
	A7sqqiXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVC4Y-00Get9-Cc; Thu, 23 Feb 2023 13:55:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBtN-00GYUD-0u; Thu, 23 Feb 2023 13:44:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=VO92luxRYsdQFdFK/Lge50FPdfOEd7N62jCQXQjhQ9k=; b=GsedLHne+yquTxEq2s0qs7V5RJ
	q8fDrYH3f5KS/LGarzzskIe6BH+l+AcM2t/Qu9blGcW602AOLTCD0+HHGwY8ulwOtOSJB5yA7fuXW
	KnHdeBAJ/zYYj7v3HiGxGHtMB/N54gO9DU5Vm1s11IxqYxtOpsM/cvxIYQ76NXRg8wRuZH63wQMfn
	uJfU86CakjGsk165rpiazD0vlf1u347fLGb0Q0j/F48bG0pk1XnIYT0TNeEhj/51l9DVC3AMUNmWn
	IiWLH4J9iOoxqMcsYMwUSWsib30QxOvQq1wmhGPxKMJVXk0tNY/rVnGZ6O6MagZC/S+u1zj+QudQM
	6Dq985Yw==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pVBtG-00Cw3X-1F;
	Thu, 23 Feb 2023 13:44:11 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 967326602209;
	Thu, 23 Feb 2023 13:44:02 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677159843;
	bh=PvHOALPrQriFUXthOsepKaTpX4xTyaYloZRmD2xgt7w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kna8qoUB6U2pjst9ZLbcVaE/DNh/Nuhish3Gsux2GGBZHkAp3KgzpMrRKqaAsPnQW
	 NwXPWsnTUJiITgfbfI4ybtVgZglJI8VFy51g4ASOnxccfdwac/jMPlFmeYbfOlf95b
	 g/j0eGNYFepmQHZ6btYMimlbAEOeK01GOIgSvSTkzivjKFIlb8DCuvzxcqSEtrBmdo
	 boU7aEmx6BY/XlLkAd4jacUiF0U0gajIA+Bbpjdp6meLdZXVgBggYPkTKBtzmXC6va
	 HEEFWTDuAf3SVWaXX1sJWrYylUe7cHNl5jRCGuAy4zbboKcWwhjqxYLMI/PAYMSTQY
	 UQF0tTV63rOXw==
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
Subject: [PATCH v2 11/16] arm64: dts: mediatek: mt8192-asurada: Couple VGPU and VSRAM_OTHER regulators
Date: Thu, 23 Feb 2023 14:43:40 +0100
Message-Id: <20230223134345.82625-12-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com>
References: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_134408_134232_4AF21FBA 
X-CRM114-Status: UNSURE (   7.93  )
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

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index df477eb89f21..c8b6e1a9605b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -447,6 +447,13 @@ &mt6359_vrf12_ldo_reg {
 	regulator-always-on;
 };
 
+&mt6359_vsram_others_ldo_reg {
+	regulator-min-microvolt = <750000>;
+	regulator-max-microvolt = <850000>;
+	regulator-coupled-with = <&mt6315_7_vbuck1>;
+	regulator-coupled-max-spread = <10000>;
+};
+
 &mt6359_vufs_ldo_reg {
 	regulator-always-on;
 };
@@ -1411,6 +1418,8 @@ mt6315_7_vbuck1: vbuck1 {
 				regulator-max-microvolt = <1193750>;
 				regulator-enable-ramp-delay = <256>;
 				regulator-allowed-modes = <0 1 2>;
+				regulator-coupled-with = <&mt6359_vsram_others_ldo_reg>;
+				regulator-coupled-max-spread = <10000>;
 			};
 		};
 	};
-- 
2.39.2


