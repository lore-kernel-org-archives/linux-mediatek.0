Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCE3C3DA59
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jul 2024 09:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLue2XyIppE8lmBhp/EoBC3XiAF2KsHTOOgJK3+cX8U=; b=1gYROyMqdsGaXU/BoUaZNT2PAy
	gTwaDxIWogU431X6NTRFcQQUAPoK30z1cP5uwnbfGcGohppgVMYctMCSzYLJoE40FVTM+UM2vI54V
	ZnM4nTkN2EirPwLwFYM8f7NqAnRCiD7XWd7H8LQmux8WCMOl1k735RCkWyY8itmMQQYzhqbeFtEge
	rOA5hnNHZRAwc1bjjkeEx4PXtEe77zRG4yqD9m0b1jfw1X6opTOBo294ciSXznYn7PRTeobZLlFVU
	N/xbMo44mpa9gSVNbPnCvWjPEJ1Xl8ueQsiOF92I/EAZ81psC5CEaSBC62ILDorz5fud+OynbDmNW
	wdWvNFUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUjom-00000002DTC-0jz1;
	Fri, 19 Jul 2024 09:22:24 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUjoQ-00000002DLe-0AYn;
	Fri, 19 Jul 2024 09:22:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721380919;
	bh=eS6RH9QK9rYxbfVs8pehMWbyqub53ZmzaWMZBeeTaVM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rM3sazl2tpTny5XXnNeEJodgIs3YkhAEUwTlvB8tfimcS0Xsc/VAT6cAs6pNK1kZi
	 lyW6FETwNpq2fqBl9DvWeyePLLIcXxSlTScWNes9/6eUs8R8XZS/BFTazZGihZcMNL
	 G7uPD2PWNDsJoL8fkJVudVps6eM6qw3uik533wCfNFK1ks+S2NBNlqDealE7173ENS
	 LCIJ+4zbUFWBhRS7dE35P+dzfTxN0PDu0zvyelj8pkct87PLyEOV5H31y9kokEFDUh
	 a+SapZPRXDg7/enmu1zrw8C0y47IFuqB2jjkpuB0hDmLWrF4rquSklbxGP7HwpkFD1
	 JL+lsLROsLaZA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 560BE3782063;
	Fri, 19 Jul 2024 09:21:59 +0000 (UTC)
Message-ID: <7edb3361-9e53-44ad-82ec-b2c81834b2ea@collabora.com>
Date: Fri, 19 Jul 2024 11:21:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8186-corsola: Update ADSP
 reserved memory region
To: Fei Shao <fshao@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20240719045823.3264974-1-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240719045823.3264974-1-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_022202_271552_BF544051 
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

Il 19/07/24 06:58, Fei Shao ha scritto:
> Corsola firmware reserves the memory region of [0x60000000, 0x61100000)

Sorry but if the region is supposed to be 0x1100000 long....

> exclusively for ADSP usage.
> But in fact, a 6 MB "hole" of [0x60A00000, 0x61000000) didn't get
> assigned to the ADSP node in the Corsola device tree, meaning no audio
> tasks can access and utilize that memory section.
> 
> Update the reserved ADSP memory region to fill the gap.
> 
> Fixes: 8855d01fb81f ("arm64: dts: mediatek: Add MT8186 Krabby platform based Tentacruel / Tentacool")
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
> 
>   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> index afdab5724eaa..0c4a26117428 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> @@ -169,7 +169,7 @@ adsp_dma_mem: memory@61000000 {
>   
>   		adsp_mem: memory@60000000 {
>   			compatible = "shared-dma-pool";
> -			reg = <0 0x60000000 0 0xA00000>;
> +			reg = <0 0x60000000 0 0x1000000>;

...why are you making it 0x1000000 long?

Cheers,
Angelo

>   			no-map;
>   		};
>   



