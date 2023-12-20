Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB68C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Dec 2023 10:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KcckNwGn6aNMUaUVuF2L5guCKLnHD170nX8SLsLtIaE=; b=nxGx7jC2VbMqWw07hI7mrKnX8u
	MTF9rTvJp3zImtUjPG2gxMg8J15rUbVgy6AIzr7IzibEs6p7TSb/b5pmXzYJr20b7YZwJR4dfegVK
	F7uMhiyN4WTqkpIVIdhnRZKnQd/Uc6Afzz4N7fwevHXBa9fDUJGm/NQjoGD5OZm4KgUDWvBlXB5Wv
	VN7toXiz2fMc4s/VCEZfU6j8N1Oi3Hs5qPq7vr1FaspMfxj8bYr3j6B18eVuJUGYBgTeSgvUqbqDq
	7qIaReL3qFgDf/NJtLNPdsSfMKZ8Xv/W+CNbPHYMZPOpPg29xd2gdAt9LKcAycYzL0JWZYMMv0AQX
	FYt6Ya+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFtqh-00Gvrh-0t;
	Wed, 20 Dec 2023 10:30:47 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFtqd-00GvqJ-2k;
	Wed, 20 Dec 2023 10:30:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703068240;
	bh=n/zmS7VaIkLVY/5N1cyUJFCFW5xVaPkF4+goSBWq9cM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RMqNigBv8VHDwSINqU0L6N899DFky+1/+lQq33I3OqX38HUalwuvuhDVXnwsqUQiI
	 Q7skFkjLBCFruk/gyTDQrU1LufFQe8TgcFkhgTo+R5Y+rVyE5mTEJwxDxveZqJGEZw
	 ravUH5zW4p220IFJ5QLx5mEV+3JAdfeMm4TsrEXfgP+gdjZjOnW1bOiDTiYXEgVzbC
	 lgGNfdavd9YEMdhxRg+yYe0iB3o5xvq3gYcUkoFR9xXmOfGVllVzNCEfu2vrnyHaaI
	 vL0Dxdn1QfK+tj0CtLoFxdeRwAPfKUClI7VHsPvklpEQ4lnG8PJAvAT2Y5fcb91itt
	 sY6PK7uKV+DWA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 150E83781FC8;
	Wed, 20 Dec 2023 10:30:39 +0000 (UTC)
Message-ID: <d1767b1d-0b80-4ece-8a35-18eed52a3f6e@collabora.com>
Date: Wed, 20 Dec 2023 11:30:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: mediatek: mt8195: Add 'rx-fifo-depth'
 for cherry
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eddie Hung <eddie.hung@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>
References: <20231220025842.7082-1-chunfeng.yun@mediatek.com>
 <20231220025842.7082-3-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231220025842.7082-3-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_023044_051790_B7189BE4 
X-CRM114-Status: GOOD (  13.76  )
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

Il 20/12/23 03:58, Chunfeng Yun ha scritto:
> Add the quirk property "rx-fifo-depth" to work around Gen1 isoc-in
> transfer issue which send out unexpected ACK even after device
> already finished the burst transfer with a short patcket, specially
> for a 4K camera device.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v3: change value according to binding
> v2: use 'rx-fifo-depth' property
> ---
>   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> index dd5b89b73190..58593348b810 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> @@ -1185,6 +1185,7 @@
>   

Can you please place rx-fifo-depth before power supplies?

after which,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Thanks,
Angelo

>   	vusb33-supply = <&mt6359_vusb_ldo_reg>;
>   	vbus-supply = <&usb_vbus>;
> +	rx-fifo-depth = <3>;
>   };
>   
>   &xhci1 {
> @@ -1192,6 +1193,7 @@
>   
>   	vusb33-supply = <&mt6359_vusb_ldo_reg>;
>   	vbus-supply = <&usb_vbus>;
> +	rx-fifo-depth = <3>;
>   };
>   
>   &xhci2 {



