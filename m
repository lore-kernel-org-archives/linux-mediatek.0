Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B284DC636CD
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 12:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vbxIlkguHNqaHB5Gi5YDmIwI3XEd/cA20TDxnDhFVns=; b=p0qgVOC1B7MFTGlBzrW9nlxuW1
	OOxXBHAVi0OQ0nzv5pmYNHy0+ynbHrflEGKHy5YBIkc0PitxKWjo7mwiKbusa8V9MJXezSTlcSetC
	un1ER3L1dSZzZABSUZ+UXyCixUqEepoe1kVocXrHg3jglmHkrNOSmzFCY09ppIbfiewiT+ydIRqTy
	iKy4fG6SadAMiWHcXaMx0qKOZCwa7msJ2ScD+ETNeN4eRNiws780JMkNEWJGWnlJWCfd3/yIM1kqT
	kvcYY8TVAhi+jwOWt21o816s7oELDuiDk7nBWN/Umtku1WCaRUEnxKEE2HEBer1S093QDHQEssrXy
	0h03LCLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQS4K-005a7M-SE; Fri, 10 Feb 2023 11:59:56 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQS41-005a0A-Gr; Fri, 10 Feb 2023 11:59:39 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 571F766020D7;
	Fri, 10 Feb 2023 11:59:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676030369;
	bh=bpaFyMldZTemYDmlIiJTHOVsApZQsioHYrMkbmQ6/LU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lBokYII07z+WYmzFL4P7ME8cC9wZNHNmtiYRwdPmR1zv36WPFu63NWRLg4GDBMMjD
	 eUisN7cGtvRZyV+kbqNBLGCwYskG9v4bx53SzeAbghQYXl56XuEkn0gXsCUt8jHn37
	 uQpHxxsShNsSYvBfSd/CdgA9BPebkunoGjHUNEjIeYy60Fgvr/hPA1YqkXGz9rmmzL
	 32nk9Ubr5A+wjzdROR0izIxYy9cnSAUoE8Q9cKGpybus31wLNmpz4mZY2fYQfjUHVX
	 o/Sl5xp5faY7BoHG5HLVpuzNtIx4lpll74SWoChIBdGUmUamU4Af7kjn8NMfEkRNB2
	 duJ0ybuyuMutg==
Message-ID: <3db45ca3-9104-826c-9f92-549e07471296@collabora.com>
Date: Fri, 10 Feb 2023 12:59:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v1 4/4] Revert "arm64: dts: mt8173: add mmsel clocks for
 4K support"
Content-Language: en-US
To: matthias.bgg@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230209160357.19307-1-matthias.bgg@kernel.org>
 <20230209160357.19307-4-matthias.bgg@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230209160357.19307-4-matthias.bgg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_035937_747336_FFF2E28C 
X-CRM114-Status: GOOD (  17.47  )
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

Il 09/02/23 17:03, matthias.bgg@kernel.org ha scritto:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> This reverts commit fc6634ac0e5380aeb1063275a2e9a583d41b2306.
> 
> The mmsys is a clock provider but does not have any clocks connected to
> it. Therefore assigned-clock properties should be applied to the users of mmsys.
> 
> This fixes the DT schema check:
> mediatek/mt8173-elm.dtb: syscon@14000000: 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

About solving schema checks: agreed.

Since this is impacting on multiple subsystems (display, vdec, venc), can we
instead move this to the topckgen node?
I didn't check if that would trigger another schema check, but I remember
doing that on Qualcomm DTs a bit of time ago.

The alternative would be to copy that over more than 10 nodes, which would
be a bit ... ugly.

Cheers,
Angelo

> ---
> 
>   arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index c47d7d900f283..b753547e250fe 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -988,8 +988,6 @@ mmsys: syscon@14000000 {
>   			compatible = "mediatek,mt8173-mmsys", "syscon";
>   			reg = <0 0x14000000 0 0x1000>;
>   			power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
> -			assigned-clocks = <&topckgen CLK_TOP_MM_SEL>;
> -			assigned-clock-rates = <400000000>;
>   			#clock-cells = <1>;
>   			#reset-cells = <1>;
>   			mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,



