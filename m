Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F512C636CC
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 17:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZquHbGN3Uzwu1uA++hTKQdn3LY0IWqs76K++edw9/w=; b=QMddJ3dg6TnpOJWTg07rLdLV/g
	LqwfkNn302qI07zuGVXYUYzab1HB2AfW5SXCbhFxx6zkLpyIgiXdYnhyDC9VqmjYfkTGxB2qHQa1J
	djuDzOQKB6c0bPbCM4QEkwUQONa5Yk1uyG85sGCofp0tHMh17o9eg6Evzr3maGlM37MXYZ9QEfZT3
	aKtvGwMUVMAdyphAJ7+AeINPTbRmXtaAeQfB4kb+b6hn8fn7Puqwy2I4qyAThj3v4e9qbASYAHjCC
	9Xr6HbqZRzlbcWx0hLc9pf0F4wRLfp986tByinU8S2YWxfTahjQ6KDtQSIbV1IVei4SqORLIjGQeQ
	U1/I/XVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPRva-00Cx8S-JZ; Tue, 07 Feb 2023 17:38:46 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPRvP-00Cx4m-5J; Tue, 07 Feb 2023 17:38:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B7EA3B81A1F;
	Tue,  7 Feb 2023 17:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0ADFC433A1;
	Tue,  7 Feb 2023 17:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675791512;
	bh=bhXZevl7/ueOvYs4UE/FXGrLbw9bx+H5XCbSilyeFXk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h7h587fTawkt2a5j+ZF8/7L5MjzroZngsgrtUL80z2fzTYNoZU3zWaycy4/LMsouK
	 CXlG4MP/nER23MqJ8xmuQ/OXbleMyeeQEm9LVMGp482IgPy5ckhkoJzcyH15f/MmLW
	 M3biIqT+5bk/Xd8RQ8Or3A5P7HE1ahi8d7z0MVB9NRF7l76Gf0WjYmLL9xKD45S+jm
	 Ubk3npaKZmNrzHxqUnSlLxL4SJF1CPKSYlucltf3vtSrV25uiYFBsZUizp3Lme1JgN
	 1Bhi98f9GQOkEURWSY2NZdfFq2lvUYdYr6BvZq7KFlzXi5M6T/vNv+q5v3W5eN9fXu
	 QNlBfhx5yGDCw==
Message-ID: <ad09a065-c10d-3061-adbe-c58724cdfde0@kernel.org>
Date: Tue, 7 Feb 2023 18:38:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 03/11] dt-bindings: arm: mediatek: add
 'mediatek,pn_swap' property
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Heiner Kallweit <hkallweit1@gmail.com>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, DENG Qingfang <dqfext@gmail.com>,
 Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>,
 Vladimir Oltean <olteanv@gmail.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Jianhui Zhao <zhaojh329@gmail.com>, =?UTF-8?Q?Bj=c3=b8rn_Mork?=
 <bjorn@mork.no>
References: <cover.1675779094.git.daniel@makrotopia.org>
 <a8c567cf8c3ec6fef426b64fb1ab7f6e63a0cc07.1675779094.git.daniel@makrotopia.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <a8c567cf8c3ec6fef426b64fb1ab7f6e63a0cc07.1675779094.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_093835_380472_A27EEC75 
X-CRM114-Status: GOOD (  19.30  )
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

On 07/02/2023 15:19, Daniel Golle wrote:
> Add documentation for the newly introduced 'mediatek,pn_swap' property
> to mediatek,sgmiisys.txt.
> 

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt    | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
> index d2c24c277514..b38dd0fde21d 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
> @@ -14,6 +14,10 @@ Required Properties:
>  	- "mediatek,mt7986-sgmiisys_1", "syscon"
>  - #clock-cells: Must be 1
>  
> +Optional Properties:
> +
> +- mediatek,pn_swap: Invert polarity of the SGMII data lanes.

No:
1. No new properties for TXT bindings,
2. Underscore is not allowed.
3. Does not look like property of this node. This is a clock controller
or system controller, not SGMII/phy etc.

Best regards,
Krzysztof


