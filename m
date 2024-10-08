Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D44CED27C
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 08:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pv1t6PFwilJxwoE9D/QO+7fvkymRLiT6kFlTtk+UjtI=; b=WQcfKbc85tICQIyFH5pzdRWuvF
	iSNiyhbH1i2fBQSEfqXjqJNs9lCteNK+6/nQ/KYXLVYXjk9gvLSw06ReGJhjZ59+bqBG1Lcjo02tY
	7We3MFxBsZWpz+Ag/PNdWfRVo0S3CV5ZPaf5nEQs8kArGBCjw3c/EqZxGtG9LV0oECFgCswGvVWWG
	1J8Re18SwzE6oNV2UoVHrjnmFw+I01nCQlbiMAwNZ7iRsInPlek+xLYuHnHBaUFFF/T23c22zhcUU
	FGms7twVeJnbEEsKuPOEDg8jSgyZMXMbvIGfUI0ih5sT3BsaiIxtxA4EIVNraKPE+Mc3Z0C4+epFI
	gOYRFkJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5tA-000000058Ps-1QjR;
	Tue, 08 Oct 2024 08:48:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5sm-000000058Ha-2fYH;
	Tue, 08 Oct 2024 08:47:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728377270;
	bh=7Y8lQEQ1hSkPSRcmmUUSa8wB76A6Q0NBQmCBMiUD9aE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KI1ReXvHXQ2poIhkcjZbkB7URqsfRYMuA9xMaic7FNi3sX+rZxp+mb/AJkzU4ZM1T
	 3+ytaIocV4KgBXsbqX59laXLsR016dAAp0Kz2pgkRPvQ9CVp+pePbWNEJHLReurHe4
	 l3OgU6HK1SAw6f72Gpljejv+iJUbuUhCfbZzcCRmEmRTM2yFQOeoqjMVLO2N6cYg0P
	 9aQE+P2BP+cV8RfMm5iudmY3fWdvUnw0ILp3mxexBL4/weEA4dZwAYGbYLgoze+fp9
	 3i6apt0HIxayZnS31vXWloCznUhEb/Ga7sl8ze/aaICSnLI0uREJYeN0b0SayRKUTM
	 vxog6+d/C3XxQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2F5FC17E10AF;
	Tue,  8 Oct 2024 10:47:50 +0200 (CEST)
Message-ID: <eab4ef1e-f63f-4561-b429-6dc3d7485871@collabora.com>
Date: Tue, 8 Oct 2024 10:47:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8173-elm-hana: Add vdd-supply to
 second source trackpad
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241008082051.4002438-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241008082051.4002438-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_014753_189284_301BD053 
X-CRM114-Status: GOOD (  20.21  )
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

Il 08/10/24 10:20, Chen-Yu Tsai ha scritto:
> The Hana device has a second source option trackpad, but it is missing
> its regulator supply. It only works because the regulator is marked as
> always-on.
> 
> Add the regulator supply, and the required post-power-on delay.
> 
> Fixes: 689b937bedde ("arm64: dts: mediatek: add mt8173 elm and hana board")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
> index 8d1cbc92bce3..e03474702cad 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
> @@ -49,6 +49,12 @@ trackpad2: trackpad@2c {
>   		interrupts-extended = <&pio 117 IRQ_TYPE_LEVEL_LOW>;
>   		reg = <0x2c>;
>   		hid-descr-addr = <0x0020>;
> +		/*
> +		 * The supply is always on. Adding the delay here
> +		 * needlessly delays the readiness of the trackpad.

I'd say, let's be nice in this comment and let's explain the whole situation:

The trackpad needs a post power on delay of 100ms but, at the time
of writing, the power supply for it on this board is set as always-on,
so we don't add that to avoid useless delays in the readiness of this device.


...or....

The trackpad needs a post power on delay of 100ms but the power supply for
it on this board is always-on (and will always be), so we don't add delays
to avoid impacting on the time required for readiness of this device.

> +		 */
> +		/* post-power-on-delay-ms = <100>; */

Then you can remove this commented out property ;-)

P.S.: Just to be clear, what I dislike is to see a property that is commented out.

Cheers,
Angelo

> +		vdd-supply = <&mt6397_vgp6_reg>;
>   		wakeup-source;
>   	};
>   };


