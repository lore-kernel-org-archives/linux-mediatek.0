Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BD2C76195
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 17:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gCQ+MygXunT7oGDuwwdnzm3V02skdS96iMOBpF606CE=; b=02UVA77+2YX5UBx/mhcn302nfr
	6w/DEeyuIL13a48fpT9bwJML/WKdWnQWSzuSMDp+gub51bdkrULUKtq0gSqESjCVKcb0ZUa/dj9po
	i/GKWFv7RsBovVaRhCy4ZPLPbWQVon3VdKSJlwJwuiw+PFzUeFPS9WQGbdt+PX5slQVZu1MZpz36q
	qXbzF02rpbMv9SEg1C0LuptJsnbpdpFI5cAChzd1Quxw7u12WJPE1hwTfXYO4w4Z9xCXvAgo+zOtP
	A5QYwNvl0RltvRCvCpJaY7FrcGgpoIr5Set2OpXOFdWXiRhBoy0oTM1JUSYMIE4Mi8/vRGLSIzhrU
	Iv3txTFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfleC-005B1C-1D;
	Fri, 24 Mar 2023 17:56:16 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfld9-005AKk-2u;
	Fri, 24 Mar 2023 17:55:14 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 045346603140;
	Fri, 24 Mar 2023 17:55:08 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679680509;
	bh=B7Q7CvpVnU7TsRYDdxFDdSefgx35z35TKL9n9ACkUg0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BrY9pOb1/ktYzytyZcHIro3quZaCURbt223oGeOAgW1jDP1jHGAfYjKXHpHhSyOwI
	 0P2CGT8ULjAAoIoa1NAwAHhdpeWndb80KpEIXw12/Vxhox8shOGFIjLNjmcmEPD0EO
	 /tcJbBxRw7m12v3RXaJJKm5MVCfn0l+pw9aL/b7HitIh5ll6wylhG34SjJ52vk1DUQ
	 R4Z/lJFXqAE6Ma2I1jUPC1+a8fSwSbMVE6sxAgxgSbFV8fBR0fBU97Qs06XQmEM3r9
	 Gpvz/AnjrOcT2dLSPcmP08KBs4N7OWbK5/rH5BZbSmr0ZSSIs//DfdOjP6dQUDG7t+
	 k+C0w46WBKswQ==
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
Subject: [PATCH v1 10/18] arm64: dts: mediatek: mt6795: Add MMSYS node for multimedia clocks
Date: Fri, 24 Mar 2023 18:54:48 +0100
Message-Id: <20230324175456.219954-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
References: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_105512_147782_4E86EA76 
X-CRM114-Status: UNSURE (   8.14  )
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

Add the MultiMedia System node, providing clocks for the multimedia
hardware blocks and their IOMMU/SMIs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index 0f903e8fe70f..b721971d4e5e 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -634,5 +634,18 @@ mmc3: mmc@11260000 {
 			clock-names = "source", "hclk";
 			status = "disabled";
 		};
+
+		mmsys: syscon@14000000 {
+			compatible = "mediatek,mt6795-mmsys", "syscon";
+			reg = <0 0x14000000 0 0x1000>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			assigned-clocks = <&topckgen CLK_TOP_MM_SEL>;
+			assigned-clock-rates = <400000000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
+				 <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
+		};
 	};
 };
-- 
2.40.0


