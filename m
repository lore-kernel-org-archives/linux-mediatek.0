Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0FCC48BF6
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Mar 2024 10:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TO2u/jrpJZu3qRNkbhlhMNml7WBvVfg7MZk6n8TIxwY=; b=Ww1RY9lmA/LC914WX4467cMoYI
	gQ0HTgr0nEGrmtckRfayXFMicgSE6G7HWi3arPxoDM5QX8SU8k2anUYyxRmLWittll+TrpkUDhbc2
	ti9p6OY+cT6F0Kd3LCIjxi2kjKRf15P6Wz/Jhn+0b0WQV11Urab4H5RlUCIWkX7AFPOCGkak+eTL2
	pvqviU3HsKWVye7RYhEHKNX/dypYNzLMlFyH/6Ugv0r52IFyTk2COq0C9Z18loO11A2dqVnj8lykH
	t5lfshT4F0yTbu1X3SZAkybW/qb81zIUMZD4/mEqx5Bbqe2pj+noIjrI/UTWDENSyZZmRtNStAUZZ
	ymuTlFHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5aa-00000008cYS-3QaE;
	Mon, 04 Mar 2024 10:30:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5Kq-00000008YTH-2egm;
	Mon, 04 Mar 2024 10:14:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TO2u/jrpJZu3qRNkbhlhMNml7WBvVfg7MZk6n8TIxwY=; b=OUdhtT2zH0mo2AcEJMoKxWGyuZ
	OZrzSV42nuOq7Cxnc2FozpOqMTJX6Oo7WY41AMiwR2AetVEOzvan/QAv3o6BRduB1wGJU4BC1ZX1N
	xnJKL4jE/MuDB04nO0lPsxcGhb/5n44yVYudr1RvxdBBOcjHD9Paw3MMzb7P7MmOaLpRewmWdJcsj
	MrnOubobx/no2gxXZ7dOm/U0Op6bleiwg5ll9yKMWjjjW1pvSH0F/tYf7FD7xO7IY+2xtGkAR9jpY
	RxALTvcj+jk5KfSUUkwhFiX/8pSZdD17KokehjKl38EWP5+J2D0jaKt8cNZHFpd+QBxxv3i84Zbgk
	yXE/BR5g==;
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5Ja-00000004myB-2c2V;
	Mon, 04 Mar 2024 10:14:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709547159;
	bh=iSC1NqRF1tB2WZkEVyJwSFBOpjJCHARvCNJh7jbFeMo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=0QaBuOXA3RlOVN5YhCbuGI1iZs/JOdSHwsklwe52AHu1oRuPfzl1IDQELeB/Kn6EY
	 7WzqzIZIybovqikWEa9aGIyU41tp+jTZxJJPKNiQxOsT22/j2Eanghw04+PCObnsy0
	 8G14V3oAcE1Rk5LE9RsM8TvYCNn9PuIZCcjYnpg8UpZ2mHHx9yw9pIPl6QVzKC9o/D
	 bpd9dNf8jn8GWzLG3twZ3ng9tlDgFKpE18cowtDnCkZLY1T3nWOWPb/hGnqEr6lgXC
	 BgqSJA1a1O/oN01TJua8tcid0cKs6mutj3zKdc+SEvBXL5fyAo2vqwowQuZPiLjF3N
	 OzqgEZVsGSrjw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 19A7A378143B;
	Mon,  4 Mar 2024 10:12:39 +0000 (UTC)
Message-ID: <33145efb-b13c-4a1c-9542-9a185fca7b01@collabora.com>
Date: Mon, 4 Mar 2024 11:12:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: mediatek: mt7622: fix IR nodename
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240301113506.22944-1-zajec5@gmail.com>
 <20240301113506.22944-3-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240301113506.22944-3-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_101404_201847_B91198B4 
X-CRM114-Status: GOOD (  13.13  )
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
> Fix following validation error:
> arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: cir@10009000: $nodename:0: 'cir@10009000' does not match '^ir(-receiver)?(@[a-f0-9]+)?$'
>          from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Is this an IR receiver, an IR transmitter or a xceiver?

While we're fixing that node name, we might as well increase readability of (and
somewhat implicitly document) this.

... so, that might be...:

ir-receiver@xxxxx {
....

Cheers,
Angelo

> ---
>   arch/arm64/boot/dts/mediatek/mt7622.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> index 283fdf7d2d8b..7714775d1bd0 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> @@ -252,7 +252,7 @@ scpsys: power-controller@10006000 {
>   		clock-names = "hif_sel";
>   	};
>   
> -	cir: cir@10009000 {
> +	cir: ir@10009000 {
>   		compatible = "mediatek,mt7622-cir";
>   		reg = <0 0x10009000 0 0x1000>;
>   		interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_LOW>;



