Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D39C6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 13:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8cPCg9Ry4bMy43s26rLh5SnN5td8tIP8ohUlxm1BnjY=; b=XCypgW/QxIXpsW3IRAlYRF3Z+1
	ogiKPceoyBVoqfvqsF3KSyJYg0CIM0R16vjO4JFjI4TPz8zHOpailkzRXtxFUY8S2vVYeBt4vrOJK
	1/aBn9T2U0nXwNiEQ22Hcrli9eKC4MSoaK5yEF1P04EgJNNwf9F8ymrn7Zf0FV2Isz/8It50FfeL6
	kFEO5gUxK/schaj/Cwmo622NClthrqs2HwaTQrWEqIsygg8ekK4mUkwx9R0RI/23OzHIIwDm/4UEv
	TH7rxjg3ZeSUTivUcP7zHD3sf8OnQv17OsGEm5Tx77fLrEtG4M0FjHCHW0vdFHhqWW+cY24skR1bc
	EcNuYoDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phVyQ-000Qcm-2z;
	Wed, 29 Mar 2023 13:36:22 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phVyN-000Qbr-10;
	Wed, 29 Mar 2023 13:36:20 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 42D566602EDC;
	Wed, 29 Mar 2023 14:36:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680096977;
	bh=Y8uVgfvu6kCHISPvrNsx5nPyPbgp5npqxM91mbiZwuo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BA7xxyfVqs6dIwXZR1CMYcsLEq1DeIjKMzQrCpcZy0bsY9sAW+8u7Zvj0IJBJ+BlF
	 1GMG1g07xK4H+kZA04R72ptDrXDXlz9G9JrBO6XcKHox2I6FzIAK9t5C+R4Bl1pOeP
	 hhLxKi5HD89CbIndTFpYiL/gqCTjgN0TBDsihKVy1KOz0cLT5M04cOJH/PSJ7zkxL5
	 vhbgeI6wF+rZP0IRtsOMNnIXrma1rULejCxVOxvuf6nOqfyu5WZ1nOYTqz31r+fSYy
	 Rh8J2j4XXoRQ3Vvg+pHxrUxHPIpn7fWqaBpdTzLF8a2r5MoBntWGjdsxCfM0i2ZMNL
	 BMhij/fJSbVXg==
Message-ID: <5e0a8592-9d50-d6cf-8899-b842c84e380f@collabora.com>
Date: Wed, 29 Mar 2023 15:36:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RESEND 3/6] arm64: dts: mediatek: add power domain support
 for mt8365 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Yong Wu
 <yong.wu@mediatek.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230207-iommu-support-v1-0-4a902f9aa412@baylibre.com>
 <20230207-iommu-support-v1-3-4a902f9aa412@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230207-iommu-support-v1-3-4a902f9aa412@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_063619_484644_AE5B3D33 
X-CRM114-Status: GOOD (  15.01  )
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

Il 29/03/23 11:52, Alexandre Mergnat ha scritto:
> The following power domain are added to the SoC dts:
> - MM (MultiMedia)
> - CONN (Connectivity)
> - MFG (MFlexGraphics)
> - Audio
> - Cam (Camera)
> - DSP (Digital Signal Processor)
> - Vdec (Video decoder)
> - Venc (Video encoder)
> - APU (AI Processor Unit)
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8365.dtsi | 129 +++++++++++++++++++++++++++++++
>   1 file changed, 129 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> index b5f5c77f7f84..67b375fe2020 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> @@ -9,6 +9,7 @@

..snip..

> +
>   		watchdog: watchdog@10007000 {
>   			compatible = "mediatek,mt8365-wdt",
>   				     "mediatek,mt6589-wdt";
> @@ -592,6 +702,25 @@ u2port1: usb-phy@1000 {
>   				#phy-cells = <1>;
>   			};
>   		};
> +
> +		mmsys: syscon@14000000 {

These are not power domains... either introduce them in a different commit
or at least please mention the addition in the commit title/description.

Personally, I would split that addition in a different commit, explaining
what mmsys, camsys and apu clocks are ;-)

Regards,
Angelo


