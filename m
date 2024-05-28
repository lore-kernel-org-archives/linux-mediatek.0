Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374D0C27C44
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 May 2024 10:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iUjSh8AH+XnQcCsL0DYDV7T89IWUdy3Kyv4YPdLGObo=; b=V0qrAyQ8FoNKyVDCRb7zQyLD/P
	wfGyLhC3B3Rq6kA13Oy5VVrrx7zGNa8ah/n9ggNwFjDXKJ6lOY/1io2Ok4rmiTuYROLJa48n7SxFR
	SSMSn/O2rWSCBZcyCF47p/LdFrSEvnhyrV93U6ETFbIlUTTfaNC3di2SSVvzPCBtN/eG1PSzliCwk
	SlyNqmoaefyW1I4cTHQXWrVLB8lhyzJa50xqXW92BtNfCL7t9k9/Yd/C8NisCtWk9LozEq0+KrQGB
	PeTe34oSyJK67ZgN2vJwYdVT9n6L7XzxT3ewTtWrm0qP+a7kwo2+IAvTrLrG/Kz4+vEvzaRaF2F1J
	1e9WfGog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBu7l-00000000EZH-2MoD;
	Tue, 28 May 2024 10:32:09 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBu7h-00000000EYM-2S7c;
	Tue, 28 May 2024 10:32:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716892324;
	bh=tx08ion0GtTUDJWV1B8DcE/k7Cf6d0BaHc8bECS4fXU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vjHWaF7VoCcFlTKW8QjfWWIK4k6fslKfmM3sj8cXBhiZax/hkcCGStdS/ELcx1AmQ
	 4Q8UhJ6O4TFATbRURJRHPdczEa9iMmb7w5mAq5Jc5fVf4O0l7EUu5JQCTvhRHPwgHR
	 c5+ez1XvrbUz77N6+19TEnHWSmoG/hvK/Ssvo2tg/2XzLYoBc+0Bjbo1SuLf3nBPP3
	 5BszC9Sd46Zga6hzOx/2RoWNvSU64LvfdCQapfIvL4xY1E8czPFft4UyOwLQkmzUHj
	 02dJGL1blYFW9RdWoQUqfVNZsSijJ/qLClLZ/6LXKOYyPh9R6zv9qPum6R0/s9UHzv
	 pI9tfy1GV/0CQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D82083782113;
	Tue, 28 May 2024 10:32:02 +0000 (UTC)
Message-ID: <f3930034-0cc1-4bb5-894a-72c809211233@collabora.com>
Date: Tue, 28 May 2024 12:32:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: arm64: dts: mediatek: Add OpenWrt One
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>, Sebastian Reichel <sre@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang
 <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 openwrt-devel@lists.openwrt.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20240527115933.7396-1-zajec5@gmail.com>
 <20240527115933.7396-3-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240527115933.7396-3-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_033205_946677_2F301D24 
X-CRM114-Status: GOOD (  12.79  )
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

Il 27/05/24 13:59, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> OpenWrt One is the first ever OpenWrt product. It's based on MT7981B and
> has entered an early production stage.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>   Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index eccc3f7cc4e6..c150acde1f90 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -86,6 +86,7 @@ properties:
>         - items:
>             - enum:
>                 - cudy,wr3000-v1
> +              - openwrt,one

Isn't the OpenWRT One made by BananaPi?
In that case this would be bananapi,openwrt-one I guess?

Is there any OpenWRT contact that can please help clarifying this?

Thanks,
Angelo

>                 - xiaomi,ax3000t
>             - const: mediatek,mt7981b
>         - items:


