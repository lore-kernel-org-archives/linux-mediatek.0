Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26A8C636CD
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 14:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dwBxhyojjuz/CIF5Xm0DSPdVeDxFmb2kDfM/xNG5sj8=; b=HYfK3kMHDr96D/3W4pSHWq+HLK
	MFp0Qrt5ZDskZWma5CG93UsruOBFO1x7ujN6BPZnNjVepEbrZkvTy4GZZ91kCvaJUdoMMgCg6W4OP
	mxq5YHmuhZdvaln6mEohYF2O9VZimU+o6fzqBNDrxbaJvLheXnOlqBRX+5uH4At+PaIq2B6tWuXzS
	US9mNevkl7jpHhSb+EzyRMMpkVYxKJ3elZUmWZ9k/POCkE/7In+Qxcf8uv+SkARLvahFQz+UcGdj2
	o9/o3CrChxiE7Z5w6Flal9Vs4vX777B/4z37gl6NEzaRKCFFrTBcADtybi+heTCwUbfi14Kh4E5oX
	8zeBPmDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQU64-005zEi-1V; Fri, 10 Feb 2023 14:09:52 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQU5n-005z4i-Bz; Fri, 10 Feb 2023 14:09:37 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D125E66020E9;
	Fri, 10 Feb 2023 14:09:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676038171;
	bh=pFrTCC7DRf148QSpFOVkQrb6mUMqtPZiFny6QHbySyY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jHl0QRG/yGbw9Gzc6p6UkO4OcCuobFrTlhyYDOZzWJeQt8KPhwVDMQe5ZMvbHjdit
	 9qCVu4bwO3u6mPt+hWtHvKyr7CeeSDvCfV7mnQbLL3OZQW6UnMj3IsmCIdaBK6E2mh
	 1jFe0FOYU/lTlhZ+96OGQZtC9+3EizLpFwU8Nakp3MYHAvK94t7GsxME1YAO17b3AV
	 HLmk53qxhfo7VpkEbDVNmT4EYQAr8udfiJb31tprcoDltn9ysJa6KhJtwcOWurUZ6n
	 f8BEcB5QkfBbuaTQPhDN/bI8WYdyEA8QtQK8fh0d4f5gg9Q+o/c9xSvEUb+RC9skg8
	 DJXOSUPerRdZw==
Message-ID: <db22c545-da11-9869-ef20-31d5a7a33318@collabora.com>
Date: Fri, 10 Feb 2023 15:09:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v5 12/12] arm64: dts: mediatek: mt8195: Add SCP 2nd core
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230210085931.8941-1-tinghan.shen@mediatek.com>
 <20230210085931.8941-13-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230210085931.8941-13-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_060935_604978_4D345B25 
X-CRM114-Status: GOOD (  16.21  )
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

Il 10/02/23 09:59, Tinghan Shen ha scritto:
> Rewrite the MT8195 SCP device node as a cluster and
> add the SCP 2nd core in it.
> 
> Since the SCP device node is changed to multi-core structure,
> enable SCP cluster to enable probing SCP core 0.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>   .../boot/dts/mediatek/mt8195-cherry.dtsi      |  4 +++
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 30 ++++++++++++++-----
>   2 files changed, 27 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> index 56749cfe7c33..4f9bc7581adb 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> @@ -933,6 +933,10 @@
>   	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
>   };
>   
> +&scp_cluster {
> +	status = "okay";
> +};
> +
>   &scp {
>   	status = "okay";
>   
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 8f1264d5290b..87e49f5fb7b3 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -826,14 +826,30 @@
>   			clocks = <&infracfg_ao CLK_INFRA_AO_GCE2>;
>   		};
>   
> -		scp: scp@10500000 {
> -			compatible = "mediatek,mt8195-scp";
> -			reg = <0 0x10500000 0 0x100000>,
> -			      <0 0x10720000 0 0xe0000>,
> -			      <0 0x10700000 0 0x8000>;
> -			reg-names = "sram", "cfg", "l1tcm";
> -			interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>;
> +		scp_cluster: scp@10500000 {
> +			compatible = "mediatek,mt8195-scp-dual";
> +			reg = <0 0x10720000 0 0xe0000>, <0 0x10700000 0 0x8000>;
> +			reg-names = "cfg", "l1tcm";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0 0 0x10500000 0x100000>;
>   			status = "disabled";
> +
> +			scp: scp@0 {

Minor nit: Please change this to `scp_c0:`.
Like that, we keep consistency and increase readability, as we're clearly then
reading that one node is for core 0, the other is for core 1.

This is fine even on devices using only a single SCP core, because in devicetree
we are describing the hardware, not the software implemetation of it - and the
MT8195 SoC does, by hardware, have two SCP cores anyway :-)

After which,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



