Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98863CCF9E9
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 08:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PRb5pSbbkzsuH8HC/XhqG/4K6Fisz6elHgdVGaMTbxs=; b=NtUF/eT75TR9NBdzGu9LfvHIMh
	wnKvbthzWqfW5WtE7h4wQMhWudbhjKMNj8cjRXYwD1DsXqEF3FyJfgLUSWSUvQ/vbxKHQ3dceq1Hn
	nkJybePj/GeAsL3YokSvenjXbl7vOfiBIe2OTKXxvuZNj6PQ+fhK7K0H4p8lsg1KeHrbC19jQ0p+H
	7sElZLKM18rQt/9/efO5MqWuiNkJHM1E6HLMnzhHagPJ7BjRM1uuyt0PESrdQsJZIX4YKsisKcy7j
	S0LELQIyLXbbPUU9yTADCVRoCiFRPdlY7uDryHracnfitkfUsoi2tPwVAKssXb9jEcNCOe74ipzYp
	hR7V0X0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stjzx-00000007huP-1JVZ;
	Thu, 26 Sep 2024 08:37:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stjwQ-00000007h2F-0eXj;
	Thu, 26 Sep 2024 08:33:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727339616;
	bh=kMQ9AayeBKAG8ZAFHg7xt8cXjGqj9KatwkRbtyERWiI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O8ISMLjXw8XkW2m7YYdxEU20NKBIZ8sfkClchsTPT51Pv56kTqRE/wyLcBbibcTlz
	 Ic/bSzkHOTZj08ZoivPD1R669H2g0DafZgumX1G6nXQJzqPDSFW+4gZtGe9LKmVYRa
	 Sser/d1MjB94czNP/Sk8D0yyXG0q5hZvhQOM/XY4XlMs9o2uqxMZqNo0SuKlq9MgDz
	 tbmnmHvIvgauLJWVZmdSGswQJBC9sd/Pblwp18PjXip+Ci0usTeYu5K61hcNeyFxVb
	 d2en1Qyx2o+wUIqgj/FnK/wDbOgCK00AjUMNOuEfVMvtwuHA54hgeTlJgOwyf5xkB/
	 nsYOZa9FUZ5IA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 604CA17E1080;
	Thu, 26 Sep 2024 10:33:36 +0200 (CEST)
Message-ID: <b3842173-7074-4bcb-80f4-1f6f8cb38a52@collabora.com>
Date: Thu, 26 Sep 2024 10:33:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: mediatek: mt8188: Move vdec1 power domain
 under vdec0
To: Fei Shao <fshao@chromium.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20240925110044.3678055-1-fshao@chromium.org>
 <20240925110044.3678055-6-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240925110044.3678055-6-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_013338_404241_2A0A0692 
X-CRM114-Status: GOOD (  17.59  )
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

Il 25/09/24 12:57, Fei Shao ha scritto:
> There are two hardware IP blocks in MT8188 video decoder pipeline:
> vdec-lat and vdec-core, which are powered by vdec0 and vdec1 power
> domains respectively.
> 
> We noticed that vdec-core needs to be powered down before vdec-lat
> during suspend to prevent failures. It's unclear if it's an intended
> hardware design or due to power isolation glitch. But in any case, we
> observed a power-off sequence here, and it can be considered as an
> indirect dependency implication between the vdec0 and vdec1 domains.
> 
> Given that, update vdec1 as a sub-domain of vdec0 to enforce the
> sequence. Also, use more specific clock names for both power domains.
> 

As far as I know, yes, there is a sequence:
  - Cores (mtk-vcodec-core) gets suspended first
  - Then the LATs gets suspended (mtk-vcodec-lat)
  - Finally, the LAT SoC gets suspended (mtk-vcodec-lat-soc)

...but you checked that downstream, and your downstream misses the lat-soc HW
instance, and only has the lat one.

Are you sure that this is not the reason why you're getting this issue? :-)

Otherwise, I feel like we must ask for some clarification from MediaTek, as
I'm mostly sure that the two cores are independent from each other (but I
might, of course, be wrong!).

Cheers,
Angelo

> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
> 
>   arch/arm64/boot/dts/mediatek/mt8188.dtsi | 22 ++++++++++++----------
>   1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> index ff5c8e0597f9..a6cd08ea74eb 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> @@ -1064,20 +1064,22 @@ power-domain@MT8188_POWER_DOMAIN_VPPSYS1 {
>   							#power-domain-cells = <0>;
>   						};
>   
> -						power-domain@MT8188_POWER_DOMAIN_VDEC1 {
> -							reg = <MT8188_POWER_DOMAIN_VDEC1>;
> -							clocks = <&vdecsys CLK_VDEC2_LARB1>;
> -							clock-names = "ss-vdec";
> -							mediatek,infracfg = <&infracfg_ao>;
> -							#power-domain-cells = <0>;
> -						};
> -
>   						power-domain@MT8188_POWER_DOMAIN_VDEC0 {
>   							reg = <MT8188_POWER_DOMAIN_VDEC0>;
>   							clocks = <&vdecsys_soc CLK_VDEC1_SOC_LARB1>;
> -							clock-names = "ss-vdec";
> +							clock-names = "ss-vdec1-soc-l1";
>   							mediatek,infracfg = <&infracfg_ao>;
> -							#power-domain-cells = <0>;
> +							#address-cells = <1>;
> +							#size-cells = <0>;
> +							#power-domain-cells = <1>;
> +
> +							power-domain@MT8188_POWER_DOMAIN_VDEC1 {
> +								reg = <MT8188_POWER_DOMAIN_VDEC1>;
> +								clocks = <&vdecsys CLK_VDEC2_LARB1>;
> +								clock-names = "ss-vdec2-l1";
> +								mediatek,infracfg = <&infracfg_ao>;
> +								#power-domain-cells = <0>;
> +							};
>   						};
>   
>   						cam_vcore: power-domain@MT8188_POWER_DOMAIN_CAM_VCORE {



