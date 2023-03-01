Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B3BC64ED6
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 10:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pb6hDVN8FtBiRxZXSTwPMzxOH1IVqv4t7H7OxKKzXGo=; b=ii1cXZyP9UpmrUwGG63FBmto1V
	QjiCoYfJjPKRSxRrLKzfwwOaSlD+tV48w2NnuJRYFlQnQJ6RQvNwxKRNKNDyCgovoMDNO5Gk7hRjj
	53WkeJE13KfTHkVfLEfnE/1iuWeJe4IQ5bLTrejscYTKXuOT9kMU5NuB0D6mH70QnZ5MJmVbLDrvZ
	wQsihRjKcYwwIhvI7lvOlbGcMMJiSv0rcr4fR51mFyDCENesda/oA8kgnADXwWUp0G/DzVXERdgMX
	r0OIdeoy+Eg0NH9L9e67szfN+Ca7yB5l23c5DTQldneXgkiKocYFCQtbn8kFShKpatmWGE7XuTU2y
	OGI9znpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXJIB-00FhVp-5u; Wed, 01 Mar 2023 10:02:35 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXJBV-00FdQh-Bi; Wed, 01 Mar 2023 09:55:42 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9879F6602124;
	Wed,  1 Mar 2023 09:55:39 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677664540;
	bh=eoUuj+cxZRXF8or5zd6PgagsDUpoYC3djot0WKXw2CA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hhkBXk2E6FkkjzWFHfrQFY3szV5J3eYC7vihoX8QMtmYiJnBouEHytcgWIlQdh774
	 nS6GF8niejem4pwYCIwno8u55hl5sL17pA2rFL+6C1NU5TQAOaJ+PMSVPSts6GVego
	 jQcb3SUaOknckuaAW+pYCoQIcsRRZEuQ9U/p7b9+cNkwPTPH09jpoPmfmSMzziuRFd
	 xAaSRUyZ9Ji8z25/i+Gx+0B9NeY4FW0rhKzRhy3wUV583rDqmp+tC2W7XXsSd1Kpt8
	 RdyY/5NKnuckUtJgOxFBDnaxTlSl3pVBDV7BFdxAenTHm56YjX5kPIDLTjeiYV+owM
	 0MtB7C6puB40Q==
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
Subject: [PATCH v4 16/19] arm64: dts: mediatek: mt8195-cherry: Enable Mali-G57 GPU
Date: Wed,  1 Mar 2023 10:55:20 +0100
Message-Id: <20230301095523.428461-17-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
References: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_015541_555082_F66814AB 
X-CRM114-Status: UNSURE (   9.06  )
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

Enable the Mali-G57 found on this platform with the open-source
Panfrost driver.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 56749cfe7c33..24669093fbed 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -238,6 +238,11 @@ dptx_out: endpoint {
 	};
 };
 
+&gpu {
+	status = "okay";
+	mali-supply = <&mt6315_7_vbuck1>;
+};
+
 &i2c0 {
 	status = "okay";
 
-- 
2.39.2


