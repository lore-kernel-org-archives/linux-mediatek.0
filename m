Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A39C64EC7
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 10:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y9u0MgV3caHCjW1otQLGte5XtxDVNOvagtsKcj/zSf8=; b=JDbAeWVlKjbqWCm3nwaTSeiive
	HvevNGdJ8qH6Jbbnv3s5hR75zTh37AEGuGFcTu2IGBiUJwwVwGeSOBkc48U++x8bxisQEhXZa/8KX
	y8MiqE2/35xvHvV7WySgcC0CLEWUUl+qBxyOcFGb7EZW/t9Yv0LYycPF0ovvLmzzWETpQk6nd6ZDE
	MhgV5j8BxYcyri9cMzdAbCKzi1xdf+8xFYOwq0++vx0zRq6ryyv7Kipt1S9EMAGwXueMdtoJVlf/5
	M+uW4xnkUgGjb4wE5nsseZ5JptaEUEIQs+CLGovbhxNxTpMp/c/aKFKv1I3W6CN+MCvhHU3u7wlq/
	gEI9DY6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXJK6-00FihB-PG; Wed, 01 Mar 2023 10:04:34 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXJBW-00FdRW-NW; Wed, 01 Mar 2023 09:55:44 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0A57D6602126;
	Wed,  1 Mar 2023 09:55:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677664541;
	bh=PCEc0bjMqNKvK0LPA4cYUgfpO8q6NztoEiiPWzh7jAw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NiVE6nsAVdDP0ijo9ixkIlm+eqJxiTVQWljgzBTDIzaqUemLYuW/1v0W4KsPeFtRB
	 kFTjaw9Am7usIJ6GjxDPTEtmHOVhPkCKzJhRXrkDb+qeSpy6D6S/vwSIy+rqTbY2z8
	 fh138dHOHtXCDHg21dHqd1k1SWpvsAbYlH86GNfL4NO63Q64qNeiw8jI8vB2v0Kxbx
	 A9jEqWmbFLjs52ZhnHyu/1KxierwlrbgW7jVBiFoF022tcO+RN5QKysOeVzFApWwNg
	 n/D06rJYmx+aF9W19Wk9ijLI2Es3uioiCbRUsgLNWIcFrroqVF14jHBuwRqk7f5mLL
	 WQQBcmRaf9htw==
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
Subject: [PATCH v4 18/19] arm64: dts: mediatek: mt8183-pumpkin: Override vgpu/vsram_gpu constraints
Date: Wed,  1 Mar 2023 10:55:22 +0100
Message-Id: <20230301095523.428461-19-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
References: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_015542_927275_FD8B20E9 
X-CRM114-Status: UNSURE (   8.69  )
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

Override the PMIC-default voltage constraints for VGPU and VSRAM_GPU
with the platform specific vmin/vmax for the highest possible SoC
binning.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Suggested-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index c228f04d086b..526bcae7a3f8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -176,11 +176,17 @@ &mmc1 {
 };
 
 &mt6358_vgpu_reg {
+	regulator-min-microvolt = <625000>;
+	regulator-max-microvolt = <900000>;
+
 	regulator-coupled-with = <&mt6358_vsram_gpu_reg>;
 	regulator-coupled-max-spread = <100000>;
 };
 
 &mt6358_vsram_gpu_reg {
+	regulator-min-microvolt = <850000>;
+	regulator-max-microvolt = <1000000>;
+
 	regulator-coupled-with = <&mt6358_vgpu_reg>;
 	regulator-coupled-max-spread = <100000>;
 };
-- 
2.39.2


