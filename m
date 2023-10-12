Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6970ACDB484
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 12:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BiEVOQUX+OWeddTHg4lzKa18tHqBxS0aBHTKvhcXnJA=; b=Ob6Dsq02Uv6Xm2zxc279D+2llP
	i39JpEK5ZH2ih3x/6q0yWXGgX+B7g7iRTgF8+lCgIKvndHhbV2iu21Eb2k32A034OiUG/Q8UIMSIp
	oH2L2axgSN0eMMivSD1znhUP6Ap2gFiaqrL+dv7KkRUPmBNH47AhRumps9hbuc9PrJgi2tYC2lwlC
	lbyOxpUKCqxiOEedJzuWCK1s/wwQlHssycdaHVfiG1gacoYgkJ8txkUTfA5Wh3iXFjiL8CkFERBr8
	KtpoBK347rIvmIhANFCNGLv9Knb5iYmG2zBh5cP1E1EbdxP2RudtCa/yaWE3qjlFT+CIsBahZpFW/
	/Z34BuJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qquuj-000ys1-0z;
	Thu, 12 Oct 2023 12:35:41 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qquuf-000yny-02;
	Thu, 12 Oct 2023 12:35:38 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C5776660733F;
	Thu, 12 Oct 2023 13:35:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697114133;
	bh=9YwrfxspUnb7imS3HOKEtNqbSdskF65SOc98nxt5Q60=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DD0jWufzf2Jb+8PBpFQg3JL3LMJXE/jZPx+1hghxyJ/1FWsByQccKV50tHxcZtolj
	 2U+eaP0yAJDigMDweHV/VLIQi/304DfbEn99rDuYWwsYtWhNLKBPfCOjlsLlfDXg3j
	 rMVnDRUH/1u8RraORenVNeWvKBZatHTIp20A9YupE/tmyCUpJn3EY4ZWHN7Ue9rXyj
	 4koTJWKPEKpmBDVYd6j33LB8bFYwtTPpdBGes0SbfhSX3Gq+KpSZOrP+m1QS6BrZ87
	 UIy8fJb11mjYb1iBuZUrcEyrWb/z7HBcBcPc9HiFrl7wWz+rFAg0eOZwAUPg8Fztc5
	 DKBVX71CZZWTQ==
Message-ID: <49a4be76-e389-c6aa-6176-41b351c6446a@collabora.com>
Date: Thu, 12 Oct 2023 14:35:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v7 16/16] dt-bindings: display: mediatek: padding: add
 compatible for MT8195
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20231012084037.19376-1-moudy.ho@mediatek.com>
 <20231012084037.19376-17-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231012084037.19376-17-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_053537_279997_85FEF564 
X-CRM114-Status: GOOD (  14.81  )
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

Il 12/10/23 10:40, Moudy Ho ha scritto:
> Add a compatible string for the PAD block in MediaTek MT8195 that
> is controlled by MDP3.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>   .../bindings/display/mediatek/mediatek,padding.yaml           | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
> index db24801ebc48..636b69133acc 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
> @@ -20,7 +20,9 @@ description:
>   
>   properties:
>     compatible:
> -    const: mediatek,mt8188-padding
> +    enum:
> +      - mediatek,mt8188-padding
> +      - mediatek,mt8195-mdp3-pad

mediatek,mt8195-mdp3-padding please!

Thanks,
Angelo

>   
>     reg:
>       maxItems: 1



