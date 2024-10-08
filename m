Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C25ECED27C
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 08:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L1TPmP2K52UPAeVemtUZEw5PkFK6i1obwtaJkt1KYAM=; b=tTcnml4EggVJg+2O5F/5nQGH+z
	5q1ADx3IoIolEzPx4McEgusM9R5NaoD1gSB5Ja6noKFFgkFqKYi09t/+QIjEywUNWx+HoJlOEF8Yz
	92LZQDX1+/DSNW11tQXS4KQuaD4BM30nKhZj4brMQt5qu9c9p6WBPNsfNEqqJJrqAHkBWQq0NWpqA
	21Rhwa81P8+8z6yLD4ojwcMPhJ4zaWRv0z0eu1oxuis7X8R3PkNSfdqhSH5DGnnakX4+A2PvcnC9u
	ZgBmd0GocjZ+oqzcIu88sl/ezaeU0YTICLOA5kl50kfdGZWGCUGx6yKkYpikIPTUfN+ws2LIsGgTu
	tbQr5iAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy60O-00000005ALy-1hiw;
	Tue, 08 Oct 2024 08:55:44 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5wj-000000059OA-2hku;
	Tue, 08 Oct 2024 08:51:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728377516;
	bh=FWUBk3EY6ZXr7Y6EY9fd69c8WqbiTjOs2Gxf1AJYQlQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CQm2krZBbDwinxcX7j6HwebxqcvccsGmufZ/xF4FMaN4V07VY+jXstNoMHQ9TdsEm
	 W+cG77Lv5fb4C3APTcpTNjDInPF73Au0OBHj12uJa669U2AHiZfsMsEB8TAJo+U5+j
	 yB+fCF8aiSqu1TwLj+ikrYnRdB+V4YHdlLqU0Lk/KB40Qsz4i2HU21viUH6GXt3AVz
	 hKAGU/CLVoV3XD/otFN731RABmj9asq6bkipFLTOxGHqKvo6b1c08bE7IL3wqE4q1K
	 QHMuOANYMT9OUZCGGvZLzN6uPpLsFzli5/r2qPucZDdExCN/YddCY0Yn4ut38ZAQmX
	 ROvbvXFNKsTXQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BB6C917E10B5;
	Tue,  8 Oct 2024 10:51:55 +0200 (CEST)
Message-ID: <7caa85fa-7186-4f8f-8195-19325ebf06bd@collabora.com>
Date: Tue, 8 Oct 2024 10:51:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8186-corsola-voltorb: Merge
 speaker codec nodes
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20241008082200.4002798-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241008082200.4002798-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_015157_874669_B45C031E 
X-CRM114-Status: GOOD (  19.25  )
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

Il 08/10/24 10:21, Chen-Yu Tsai ha scritto:
> The Voltorb device uses a speaker codec different from the original
> Corsola device. When the Voltorb device tree was first added, the new
> codec was added as a separate node when it should have just replaced the
> existing one.
> 
> Merge the two nodes. The only differences are the compatible string and
> the GPIO line property name. This keeps the device node path for the
> speaker codec the same across the MT8186 Chromebook line.

Ok, I agree...

But, at this point, can we rename `rt1019p` to `speaker_codec` instead?

Imo, that makes a bit more sense as a phandle, as it reads generic and it's not
screaming "I'm RT1019P" on dts(i) files where it's actually not.

> 
> Fixes: 321ad586e607 ("arm64: dts: mediatek: Add MT8186 Voltorb Chromebooks")
 > Cc: <stable@vger.kernel.org>

Well, that's not a fix - it's an improvement, so we can avoid this Fixes tag :-)

Cheers,
Angelo

> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>   .../dts/mediatek/mt8186-corsola-voltorb.dtsi  | 19 ++++---------------
>   1 file changed, 4 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
> index 52ec58128d56..fbcd97069df9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
> @@ -10,12 +10,6 @@
>   
>   / {
>   	chassis-type = "laptop";
> -
> -	max98360a: max98360a {
> -		compatible = "maxim,max98360a";
> -		sdmode-gpios = <&pio 150 GPIO_ACTIVE_HIGH>;
> -		#sound-dai-cells = <0>;
> -	};
>   };
>   
>   &cpu6 {
> @@ -59,19 +53,14 @@ &cluster1_opp_15 {
>   	opp-hz = /bits/ 64 <2200000000>;
>   };
>   
> -&rt1019p{
> -	status = "disabled";
> +&rt1019p {
> +	compatible = "maxim,max98360a";
> +	sdmode-gpios = <&pio 150 GPIO_ACTIVE_HIGH>;
> +	/delete-property/ sdb-gpios;
>   };
>   
>   &sound {
>   	compatible = "mediatek,mt8186-mt6366-rt5682s-max98360-sound";
> -	status = "okay";
> -
> -	spk-hdmi-playback-dai-link {
> -		codec {
> -			sound-dai = <&it6505dptx>, <&max98360a>;
> -		};
> -	};
>   };
>   
>   &spmi {


