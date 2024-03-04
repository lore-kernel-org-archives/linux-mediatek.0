Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF35C48BF6
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Mar 2024 10:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmqPMdPG9rCAWrncCX5YQFQtpMtw8QxwSvVbdqS0y2s=; b=N+APMeU9nvTguIk1DiCDP8WMPR
	mWRxYiC7bAiFag4JU87khKTZOQfZIBt0+QjDKzOLtnV/OocU9C+wmsRTAPx7kKqy3AMRwiOWqobM7
	jUiBWaE2S1Kln57PbyBgLUdq+hsrfLs6q74RXoeoRMEMhgWLYsm9bd3Im8lg90fvhZ0LTpHzXn2pj
	AHs/cesHV/OrMzCRyDgGiikBqHPaQT2EATnwVPIzPBLvNQ664POUxYAeMkKUQGee/dImPMYoR7YiH
	XZM40OHAYT/zPUbPVTDyAZKwVelMNObQ2v70/K+ILXgbARC3ZgYRnhfgfEVHgnDmY/doH2zi9Ryjx
	0Vf+jpmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5b0-00000008cnN-3fhs;
	Mon, 04 Mar 2024 10:30:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5Kb-00000008YSF-13fR;
	Mon, 04 Mar 2024 10:14:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=tmqPMdPG9rCAWrncCX5YQFQtpMtw8QxwSvVbdqS0y2s=; b=PtX39lDWwxanfE4HAKOfeyO5Ag
	4DgBpt1RGHShgwmtf6MUWgzrODiY7FE4eiQTWXvlxNqMpn+7zXLICo/YsC/U0PzJzVJ1tazFwmRy5
	ADxSjvJatNtHO2/kDA29/RAeChxKaZ6LxCQKWpPG2mUTU6Sh3DflBoOYDY6PuFMtV1Mq/DpNHf5EK
	pX7wq9jVttsbIEy/QwGmZUL85Fqypzb0fWa0qRyCQsJAd4q77/EccxjTlIYBqhbn4NBGikAYaskrr
	49rhbLIXn+o8jVJpU/sH2R+FEeWU/FJjportZKztCp1Syh2tbraZ1ZYHBKl7bpVC7Yp8b5f1K1eZT
	HiTeK1VQ==;
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5KW-000000018v0-1Mgg;
	Mon, 04 Mar 2024 10:14:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709547199;
	bh=mL5gAOPgp7I1aSd3xpkKdxtF2Zjaucw/vmjKyyRakaY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=1mtAGLghMf3iESaIeNOGt1Mt5mrdXTnTL+HSXApGoLFBRiYeJk+UwrdU90zi9pLkx
	 68dRZ/eodispEozhUg5L9A+4LVP9n4QDIINQd92cnbihbTcSamTjJ7htxNcUeutC8V
	 QVRkmE26HO72ae/XyEdPYiZWCqiQL9uNRcmv3W9znTbiCVAEGf0c0PagzQcryqKRV1
	 QQduFiEQ2G2VG64LaxuEgLEBzUwaKtVVcQg/RbFV/w2zm8JsDZwVJM8lrEwfhBqkmO
	 uVagJuF1ZRwvQM4G6WSigKYJdHRsmzwXAYKus0wheJveZDnGKwgC/4H+H5Fm4jth+S
	 VU4RZQPOqtLSw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5263E37820C3;
	Mon,  4 Mar 2024 10:13:18 +0000 (UTC)
Message-ID: <6c7a1768-c553-460b-97db-1e51e3a7ed64@collabora.com>
Date: Mon, 4 Mar 2024 11:13:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: mediatek: mt7622: drop "reset-names" from
 thermal block
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240301113506.22944-1-zajec5@gmail.com>
 <20240301113506.22944-5-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240301113506.22944-5-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_101356_437910_6D73A721 
X-CRM114-Status: GOOD (  11.30  )
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

Il 01/03/24 12:35, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Binding doesn't specify "reset-names" property and Linux driver also
> doesn't use it.
> 
> Fix following validation error:
> arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: thermal@1100b000: Unevaluated properties are not allowed ('reset-names' was unexpected)
>          from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Fixes tag missing


> ---
>   arch/arm64/boot/dts/mediatek/mt7622.dtsi | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> index 7da4ac273a15..9d19dd8ee524 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> @@ -513,7 +513,6 @@ thermal: thermal@1100b000 {
>   			 <&pericfg CLK_PERI_AUXADC_PD>;
>   		clock-names = "therm", "auxadc";
>   		resets = <&pericfg MT7622_PERI_THERM_SW_RST>;
> -		reset-names = "therm";
>   		mediatek,auxadc = <&auxadc>;
>   		mediatek,apmixedsys = <&apmixedsys>;
>   		nvmem-cells = <&thermal_calibration>;



