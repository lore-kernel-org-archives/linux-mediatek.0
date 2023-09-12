Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBE8CA0EC3
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 12:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jL6eQ5j1GxXqv8PCbGMgtJz4mD15EYx16c8VqOY775A=; b=TnNDxHBwzQAEHNRFClVuvizppK
	1xTk1kSInFeGKBjp5YqP2dgaDfJDqAMaYCsnpqjdV2vEdBH1wIODJxIISkZqX3M/66oNj24qgS/Rb
	Muun0NAQORBtH0JeGHl/DhIpSS8hG56FZ7ohKm+TLEB+itgI0/q3V8yGFRRH4xkAkzsUQRNrrcbkm
	RotBjZvAy+8kJrtn0k27pgvZosi4/Z/P8Ckm0UXOUt878t6AbbQcA4Diu/Sda2N7AcN20XZoxGg5p
	KeIBTK4bWdburaVuxPcsWk/I5aiOM1H/40HS6tE0siNm8ndVrD58LBo5MgYfDx8oBYe8SC13J++n9
	7P3hDhWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg2v0-003MkR-06;
	Tue, 12 Sep 2023 12:55:02 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg2uw-003Mi0-0t;
	Tue, 12 Sep 2023 12:54:59 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DBE3F6607326;
	Tue, 12 Sep 2023 13:54:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694523293;
	bh=2ZOrTSWdVG6ed/ekxU88dRAtYT7IEpOy67CbW6Jz6Ro=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U9mrSOCl8o5oUy/F290nNkDTNRLRibjObsvv5WIGzt3R+/gClOcFXuc/Z8jjEm1Wo
	 +uXk9WYouTSWzSbtioFmklaV7i+IJIMa8nWoO41eGKPRW18YbqJ5A6/WHz5xHy6Vnd
	 OoCGg/f22W/PCOE3BfoQR1E3hZcyk6eulP5yLaeq0lKA8BQ3BVi7DqldOa6YiVv5br
	 S/Suhf7K2+jzt826DXYK6NmpKJnBs7h4iuLpnmzGRl3lxGlHUa0kDvLMChrihG/4ax
	 IPcQP+VSmaaL7wSwI6lwK+5vYL4aDL4nW9BCddZVQY85kjcMH0Ge93uejT5ln4kJmY
	 +qzD3SVHjNXTQ==
Message-ID: <f8759d51-f808-8082-ceaf-6c6dcaebe2d9@collabora.com>
Date: Tue, 12 Sep 2023 14:54:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [RESEND PATCH] arm64: dts: mediatek: Fix "status" values
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, soc@kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Alexandre Mergnat <amergnat@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20230804225813.12493-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230804225813.12493-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_055458_509636_892B5CD5 
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

Il 05/08/23 00:58, Rob Herring ha scritto:
> The defined value for "status" is "disabled", not "disable".
> 
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Arnd, Please take this directly I guess. I think Mediatek maintainership
> needs some help. Maybe AngeloGioacchino should be co-maintainer as
> that's the only response I seem to be getting.

Sorry but I've seen this message just now as I've been on holiday in August.

Thing is, the MediaTek scene is starting to see more and more code, bringing
an obvious increase in the amount of reviews to be done and in the required
efforts to maintain the MTK bits - and we will possibly (hopefully) see even
more of that.

If Matthias needs/wants a co-maintainer for MediaTek I'm here and I will be
proud to become one.

Cheers,
Angelo

> 
> I think for future .dts patches I will not bother splitting them up by
> sub-arch because it's a pain to chase down the maintainers to apply
> stuff in a timely manner. /rant
> 
>   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> index e4605d23fdc8..86cedb0bf1a9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> @@ -585,11 +585,11 @@ &pwrap {
>   };
>   
>   &sata {
> -	status = "disable";
> +	status = "disabled";
>   };
>   
>   &sata_phy {
> -	status = "disable";
> +	status = "disabled";
>   };
>   
>   &spi0 {



