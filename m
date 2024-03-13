Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58ECC54E66
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Mar 2024 14:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ol2ICfeaU5RILAELMVTWCQmraBg+YD817eZDWIKw1W0=; b=YKFP9gU69i9IuFR7c0X5kYXHBy
	TOPT5EgbuC0SWLhEVPTwahgVEVEoksez0iX8/AXg5ErV/V+8Na3W2NygKZ42LZIN9IjphvkJyYmlo
	ybkK1VxKm9HwfAmL4yuz6ehcCP07tc7WkeB6C2hJw8vE/7gSw0xClYsXq/plhhcYcHTzOOLyw2o1a
	TgcjXJsG1ryGSLrA7G2Q3T1UkH2ni3rEUK4v69I2M0e39MBr7qm1najTY93zDrdhwYU8ps8H8zegH
	k9Y8jEZl5sWYahBDJ63gWjhqMRLevGcSBXwD9we7yE+ywTQXdSwfoQSmPXdg/vsE8BNMB9w26+Rj0
	tTIJKCNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkPiz-0000000ARm3-1rth;
	Wed, 13 Mar 2024 14:36:57 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkPiv-0000000ARk1-2kyA;
	Wed, 13 Mar 2024 14:36:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710340612;
	bh=aBISMkyzcuXC4tndXkf0VYcmI9kprzzcj/ehlqHMdAQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=wV45Rr4voGJHrKXICE5+Eye7hrS2Pjf//lLfPMsweUmrMtaGowHMg8I1ftEp0aoc6
	 vVBZcOLf4o11Mg5tTnufw6SyfR0TmnYh7euYN5U/mbmh4D+veduK3L1cVcQzJtfwf8
	 3xTrl9JpUKtiEXdqBnujwEENhAYfYbBGvY78+vuV4+LxRKjiguO64XhrhCNeecyRoN
	 QZR3ZhhDixM01wErO5qokiWMlKaRyx4SfSpnoi9s4eVgvGyGB75R5QPDv7h5kpVTPk
	 4auppMOqkpTTs4wsJ/OuuvWTViAs6wdbnrHFPzTu7gtp0SfvfQWyasvBTJhcjCEcls
	 O/G14egc519mg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9A15437813C4;
	Wed, 13 Mar 2024 14:36:51 +0000 (UTC)
Message-ID: <d1bdf9a6-3082-4076-99de-e49d59843244@collabora.com>
Date: Wed, 13 Mar 2024 15:36:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8192-asurada: Update min voltage
 constraint for Vgpu
Content-Language: en-US
To: Pin-yen Lin <treapking@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 devicetree@vger.kernel.org
References: <20240313135157.98989-1-treapking@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240313135157.98989-1-treapking@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_073653_927787_4FDACF6C 
X-CRM114-Status: GOOD (  17.92  )
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

Il 13/03/24 14:51, Pin-yen Lin ha scritto:
> Although the minimum voltage listed on the GPU OPP table is 606250 uV,
> the actual requested voltage could be even lower when the MTK Smart
> Voltage Scaling (SVS) driver is enabled.
> 
> Set the minimum voltage to 300000 uV because it's supported by the
> regulator.
> 
> Fixes: 3183cb62b033 ("arm64: dts: mediatek: asurada: Add SPMI regulators")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>

Okay, that makes sense, I agree.

...but.

The datasheet never mentions 0.3V as vmin - infact, it does mention that the
vsel is selected as (0V +) 6250 * Vsel, but the brief spec says that for the
standard configuration (in terms of HW), the Vmin is 0.4V and not 0.3.

Reading through makes me think that it's not much about the buck providing an
unstable output, but more about it starting to become inefficient under that
value.

This means that it is sensible to set, instead:

	regulator-min-microvolt = <400000>;

Also, this is repeated on multiple platforms: can you please perform the same
change also on MT8183, MT8186 and MT8195?

P.S.: For MT6358, the Vmin for VGPU is 0.5V :-)

Cheers,
Angelo

> ---
> 
>   arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> index 43d80334610a..5cc5100a7c40 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> @@ -1448,7 +1448,7 @@ regulators {
>   			mt6315_7_vbuck1: vbuck1 {
>   				regulator-compatible = "vbuck1";
>   				regulator-name = "Vgpu";
> -				regulator-min-microvolt = <606250>;
> +				regulator-min-microvolt = <300000>;
>   				regulator-max-microvolt = <800000>;
>   				regulator-enable-ramp-delay = <256>;
>   				regulator-allowed-modes = <0 1 2>;



