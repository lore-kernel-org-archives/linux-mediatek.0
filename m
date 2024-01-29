Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BC3C47DB3
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jan 2024 16:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yrg01Hu4EMs/oyqhlFJe3TnNQfQ8FnWoG0++05/yaRI=; b=yfCXquL/7SFId9dSK9KI9B7/ME
	6/4Tp5LG8AKKNWRYI0z5M9KQZqnzBIYPl5xqhJsj07lrlWVRH8OFxK5pDh5J7N2oB5sarsGNziE4t
	AexTwGicAAjpVFdXgaC8AK/Wt7mIlHbIuggDxFV4pbIEt0DRRGHUvFR3LWBaBucxflO++oIHfM2Zh
	lFmqrkLbqc0KBsLjTnx60Ne2Sj470f7Tus7Eng8rYRaTpMttqbpMSpL8IknQ79IMtb1E95NjA6taX
	O3KhlMiBPZiTSkiRW+aIjjg6KkEyr34PJIb40lnX7zk5qPBB4XGTkEoDxL8VJfKNpsZsF2NMpj6B9
	T+A2On/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUUYu-0000000DW5y-00gg;
	Mon, 29 Jan 2024 16:32:44 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUUYe-0000000DVry-2e0o;
	Mon, 29 Jan 2024 16:32:31 +0000
Received: from [141.14.220.34] (g34.guest.molgen.mpg.de [141.14.220.34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 092F461E5FE05;
	Mon, 29 Jan 2024 17:31:53 +0100 (CET)
Message-ID: <2c37a716-e4bb-4db3-a95f-a40e05b28cad@molgen.mpg.de>
Date: Mon, 29 Jan 2024 17:31:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: mt8183-pico6: Fix bluetooth
 node
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sean Wang <sean.wang@mediatek.com>, linux-bluetooth@vger.kernel.org,
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240126063500.2684087-1-wenst@chromium.org>
 <20240126063500.2684087-3-wenst@chromium.org>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20240126063500.2684087-3-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_083228_922529_08EACEB0 
X-CRM114-Status: GOOD (  18.38  )
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

Dear Chen-Yu,


Thank you for your patch.

Am 26.01.24 um 07:34 schrieb Chen-Yu Tsai:
> Bluetooth is not a random device connected to the MMC/SD controller. It
> is function 2 of the SDIO device.
> 
> Fix the address of the bluetooth node. Also fix the node name and drop
> the label.

Excuse my ignorance: Is this a cosmetic fix or does it fix the device 
somehow?

> Fixes: 055ef10ccdd4 ("arm64: dts: mt8183: Add jacuzzi pico/pico6 board")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> Changes since v1:
> - Collected reviewed-by
> 
>   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts
> index a2e74b829320..6a7ae616512d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts
> @@ -82,7 +82,8 @@ pins-clk {
>   };
>   
>   &mmc1 {
> -	bt_reset: bt-reset {
> +	bluetooth@2 {
> +		reg = <2>;

To avoid confusion, would it be possible to use sdio as a “name”.

>   		compatible = "mediatek,mt7921s-bluetooth";
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&bt_pins_reset>;


Kind regards,

Paul

