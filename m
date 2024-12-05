Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0987E7716C
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2024 12:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uYMkB30TqxQsPLtyZKh9jhhR8nYz5yCMXOJHRl6od8g=; b=2M24PxbeT4HFu5Sj9TCOMqkmKn
	gGrzxmfMV+PriOUPc4x1PrbW/Be3pYZQ4UM5+O1HZmP+Yuorzpt4Vv6jK1kCQ/asanf/JyXtRAF6g
	EYgPgjpwLJiHG3eZdlZN9EeZhWknSBA6CJ2btTy3WQB3ZUI6pdtISoHzPdPYGRlP2Elnl5577nXFu
	eeh0WIM8O7u8/IUT61XW4f6flbfTUFOXOX9Xti1dpcrag6fgtqg0HFaytT2M3Erjb+2YZBil5xbdP
	2NSIY3ism2ig4tfZoIFLaIQvW34YyU4s+MfAHQ1BW/xHijmgOrBiEsQVspvdi7PIjKGSo+LjUpf95
	mBvGlh1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAnJ-0000000Fuq8-0ieM;
	Thu, 05 Dec 2024 12:17:21 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAlF-0000000FuCz-18gA;
	Thu, 05 Dec 2024 12:15:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733400911;
	bh=3osrUVPXdinibWxj7SczBHB1PesbS1XtEfk4gNr9G/0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KAQvd5HUAJXQSUc6jyaZmoSIdmH+nc+sZqpV1GDQ1Kws6RScKaPpY3zrDlnyQN8Md
	 YvHIMeqksV2Gju4JmnubLAoKYj8RbZkFWKI9nbCoIE4pNopDD/JLXqUzhkAp7EsIVT
	 nGvfz5V2fTUuBaG3Rg38/taZjnpP1C4e2QcxJ/3o+E2DRqlnUg5BN+OgjR+vgLLKlK
	 ot19Q5RKcILbXgqoF8ipQVUal98/mGo7q//1Ib0eUfXN45HYigjZ/XsPlzXrCMe+99
	 QZG0lQhSgH4gJrULZro6jrqwDTX5NPzCaRBWYXZ6Juq8dcwt3755noh7vBQ6B5UkKY
	 CffPmOwPnYGBA==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1000])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7216217E3661;
	Thu,  5 Dec 2024 13:15:08 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Thu, 05 Dec 2024 09:13:54 -0300
Subject: [PATCH 1/5] arm64: dts: mt6359: Add #sound-dai-cells property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241205-genio700-audio-output-v1-1-0e955c78c29e@collabora.com>
References: <20241205-genio700-audio-output-v1-0-0e955c78c29e@collabora.com>
In-Reply-To: <20241205-genio700-audio-output-v1-0-0e955c78c29e@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Trevor Wu <trevor.wu@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_041513_488954_4FD7E6AB 
X-CRM114-Status: UNSURE (   8.65  )
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

MT6359 provides digital audio interfaces. Add a #sound-dai-cells
property for it to allow pointing to it from dai-link nodes.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6359.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6359.dtsi b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
index 8e1b8c85c6ede94a7beaefcdfc74ce47b3ab50fe..150ad84d5d2b30ab6064c71e1375ce5df5ae4b36 100644
--- a/arch/arm64/boot/dts/mediatek/mt6359.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
@@ -8,6 +8,7 @@ pmic: pmic {
 		compatible = "mediatek,mt6359";
 		interrupt-controller;
 		#interrupt-cells = <2>;
+		#sound-dai-cells = <1>;
 
 		pmic_adc: adc {
 			compatible = "mediatek,mt6359-auxadc";

-- 
2.47.0


