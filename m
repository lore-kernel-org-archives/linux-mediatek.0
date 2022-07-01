Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AD0C43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 22:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfHRon5vujv1QIDUOawdfFtXvo9UuigKDF/Tc9hvabY=; b=fCLbzooNNrC21qFflo3OJSDg3X
	2S2pk1kZyHciaZ8PTEv9VGcv8+02ad70r3EVcaPZtEPItdSuKDZ1iQx5um9ZwIvHhi419NCKrs0w9
	18t3ZKH5Nf9dDo7b0dIp4VQG04Sv+l5Gce0h3ROIp119oY5rVVJ6S349N7cq990l7hsswysn8V8qE
	wrdrOXrZIiMXewGpeSYCds4IFQkZ98tfQAgmvRl/hklIqUYRgf5LCRO5+MGKH//cIyHFnGc8Y81ax
	yvP86k8DhD8WVTkzdrHczfdbG8ZI7cUwTwv72lVTPiRPiTWkFkztdZWCouS+13B/uwAunTsuSG/4I
	64s77miw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7P0d-007C4k-Ig; Fri, 01 Jul 2022 22:21:07 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7P0S-007C1n-B5; Fri, 01 Jul 2022 22:20:57 +0000
Received: from notapiano (unknown [194.36.25.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9463A660177B;
	Fri,  1 Jul 2022 23:20:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656714054;
	bh=eo++abJtFM2trhQuGPaqjcct3hjPGbB9ZTDmZoj0k1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EFlFCsXOTGHJosPSSpkqT3w4+Mz+1VCg1h7trqlD/0aVpMrAzX3lJWGlqiLQoaXvq
	 2LJrJFglhIArxpmvrSWaUxeMqJMwJ6U84I1Ioc77hfqrIWr21/IEcFMOkeEf52ySuT
	 YTyebCyBFwvQBJH2QvuIAH1G9C6INda6Jq2dxbz4vlorXG8GzV5R+QGaAvn21Hq1sh
	 A0isuClit5UUMbaUI1u/KewO4A+bo0QRVwz03xVrdr8PPjQ8Fe6UV9A2hnHUbsbU+d
	 42XiF+tGtOFHI2lxgl/A7CBZu9fhFQJiJ0ryvWgFg8dLqVHNN2nVziuP552LyK0yJs
	 jswU7v95bYIJg==
Date: Fri, 1 Jul 2022 18:20:45 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, hsinyi@chromium.org,
	allen-kh.cheng@mediatek.com, gtk3@inbox.ru, luca@z3ntu.xyz,
	sam.shih@mediatek.com, sean.wang@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wenst@chromium.org
Subject: Re: [PATCH 03/11] arm64: dts: mediatek: cherry: Assign interrupt
 line to MT6359 PMIC
Message-ID: <20220701222045.oyzynrjdvo4bfpdc@notapiano>
References: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
 <20220630153316.308767-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220630153316.308767-4-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_152056_555624_AECA26DC 
X-CRM114-Status: GOOD (  16.03  )
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

On Thu, Jun 30, 2022 at 05:33:08PM +0200, AngeloGioacchino Del Regno wrote:
> To allow MT6359 peripherals to trigger interrupts and the driver to
> safely handle them, assign the right interrupt line for the Cherry
> platform to the MT6359 PMIC node.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> index 7406d7bbf725..14f8f30b1eb3 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> @@ -21,6 +21,10 @@ memory@40000000 {
>  	};
>  };
>  
> +&pmic {

This label references a node in mt6359.dtsi and you're missing the include here.
I noticed it does show up in the following patch, so either move this commit
after the next one or squash them.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

> +	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
>  &uart0 {
>  	status = "okay";
>  };
> -- 
> 2.35.1
> 

