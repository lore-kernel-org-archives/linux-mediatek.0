Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB94C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 17:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2E+BrxZ1f4fQghU1DrSribu+7UPbIKwG+2O4gNTnqiY=; b=k3NbUV27Ttfz7++dEFSaxW1o1w
	Wi7U/IRAEDQX/vk0rIoJdSw50Edlf2uA5zUHeUlTp+woUcd28qQQWdMVNDpqmmcA1OwsZRF6YEZei
	LeKnOWUx6SAcWW6lLb5OuG1n3LEVHCm3/2CrR4ekQca4d+4Ol3nncAKDIqmWGlj6SIndOyKY7cs7l
	rgVZMcJ9klrBKx5dslA8KmX4Oyci/QterZ3Q3DoF16P3F+rlKvCy3At6f9ugt2EmpdRcrHIlNynxS
	KQfY9FTPRbu2T6kMRm8tt4uuPRD1J+NQ12mSEReuWly4Q09Qdva2vQcFmJwG5nDtFYsK8ikFFXQ+h
	UVMFnLbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfldT-005AX5-1U;
	Fri, 24 Mar 2023 17:55:31 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfld5-005AHB-2O;
	Fri, 24 Mar 2023 17:55:10 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2E55F660312D;
	Fri, 24 Mar 2023 17:55:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679680501;
	bh=DtLoKecTBQhhvopNsM7M95mpXjvK5USiGMoYC7Oej4w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V8DDDrXvEKnJazhOMQErYVFVAxvOMaddLoM8wW/X9dN6hBqyE+olcCZFKEJAVJbkc
	 QCwPO9eUvaOSxoVzaBM6SY1n6pJ71VOsy6jP7c0mDxpxckh+PNFeB32VmgzZ8H14gD
	 eo0d6MVr1NejpLN1GuTpDW86G1vh+eXMPi+dfU8McKasvPIC1Pk/v+WFo/okTiPjl1
	 iFpFIe+42snwHpDGrtCE0i8xVS4HICIOB7w64eRGYvES7dS6+cPELcY4XydKmL060h
	 pqkxUe76Z+MCpR/iu2goQb7ZmmeTmAMrgo5Dz8S/OOzR64CUyPPc5Yh0EQ9QeXMVNG
	 ExclI8fLPPRIg==
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
Subject: [PATCH v1 01/18] arm64: dts: mediatek: mt6795: Add Frequency Hopping Controller node
Date: Fri, 24 Mar 2023 18:54:39 +0100
Message-Id: <20230324175456.219954-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
References: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_105508_006204_75B72E23 
X-CRM114-Status: UNSURE (   8.59  )
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

Add FHCTL node but keep it disabled as the PLL clocks that should be
handled through FHCTL and the Spread Spectrum Clocking parameters are
board specific.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index b3fc76d837a9..4d2119751572 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -310,6 +310,12 @@ systimer: timer@10200670 {
 			clock-names = "clk13m";
 		};
 
+		fhctl: clock-controller@10209f00 {
+			compatible = "mediatek,mt6795-fhctl";
+			reg = <0 0x10209f00 0 0x100>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@10221000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
-- 
2.40.0


