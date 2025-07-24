Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71757C83F1A
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 09:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AexSGL4+IO6A6mFwb0Sd7NWxi6sdb8WXzB0EtWATecU=; b=WCxost/Go41gzW
	6Osbp3XY0zKWJEUZ0UmW0F2nMSq8jnCDfLi+/m3cdq+fKs7rNA8QMQ/1WfJsNSINXVEvQsV+8Wov+
	ZBKstAH325XBzwLRjXyHDaAT+IK2ir7lJpU7R3H/GdAvy8LKNlaiowb5HFF73OiZF61cnDqMGObpi
	CJyofUveBhraJvJqpJkbtWNOuFJ7L1ps0qgfIq6Gd5bzevnNTHANCzy+Pqhk6sK17vBhTIn5ETpCj
	/RCfJGQ5i7qOyDYwEyF4T99dUm0lNc/bm0Kf+F1D34XqcDKetGBv3rp1568GQiS6Lw5Ll+IR9+2DU
	mg0hsgmkj9mWd3+CdrUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesbp-000000077ZV-1c5i;
	Thu, 24 Jul 2025 09:51:29 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerVe-00000006uBG-0A2i;
	Thu, 24 Jul 2025 08:41:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346460;
	bh=isBcp22K4ow+WwdLtmfT8eS5RNhAYShdyGLUfi1Qu/k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YPe5uV2pDuw1U0jY1d+yJY6bMNp5dERWkNdlL0QglioHjCPsArwEd8SCpGPQWqTo+
	 SYyhQJRBE3rDdl/X0TwKbAK1Q2LxbUrcBIfsRS/tcv1ZfleQVz5NJeycQkeWpc5laf
	 CJaUbz5jXjGDXOdhYNHBgXrjwdqiWugCM+JwQA8PIa8pYSoqY55Jcoe421gxT75fzP
	 ll8zcQEA7XpjYXvVHtT409AUyVdIoV31Hct0g3E+5Ol9bf9qjL4l8KEcGrEfPXzS5n
	 gTN0A7Zi7EKqqiCbViC43QCktjNSZzZpGt83FIntyVCF52O+SWLYC8kznPUjdWoqCw
	 H1i7Vlgwyr1Pg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4DFFC17E0C96;
	Thu, 24 Jul 2025 10:40:58 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	robh@kernel.org
Subject: [PATCH 36/38] arm64: dts: mediatek: mt8195-cherry: Add missing regulators to rt5682
Date: Thu, 24 Jul 2025 10:39:12 +0200
Message-ID: <20250724083914.61351-37-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_014102_223882_DC2E3A5A 
X-CRM114-Status: UNSURE (   8.56  )
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
Cc: daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the missing DBVDD and LDO1-IN power supplies to the codec
node as both RT5682i and RT5682s require those.

This commit only fixes a dtbs_check warning but doesn't produce
any functional changes because the VIO18 LDO is already powered
on because it's assigned as AVDD supply anyway.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index d40f4c1b9766..b3761b80cac7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -534,7 +534,9 @@ audio_codec: codec@1a {
 		realtek,jd-src = <1>;
 
 		AVDD-supply = <&mt6359_vio18_ldo_reg>;
+		DBVDD-supply = <&mt6359_vio18_ldo_reg>;
 		MICVDD-supply = <&pp3300_z2>;
+		LDO1-IN-supply = <&mt6359_vio18_ldo_reg>;
 	};
 };
 
-- 
2.50.1


