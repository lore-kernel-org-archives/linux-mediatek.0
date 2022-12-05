Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1610AC4321E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 21:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Po/Vnp740e9T+tDgfbAWj+RPcPol9ZJzo1R1BoQoilk=; b=iJ9sSMCaK7eRi/cGA3HfhmCz9D
	7E6Sg/J/R1ZmzPkm6OwKVQHif7DV2SBYJhs73OIPQCkUtSH8MjvJC3mxtG6zd1/+YbORTFf8nTxVY
	HfAgXJlNAtdgmfEuqNU9GLUkZ6QrXPQw7Ut6sMyJ24djNA8ynDn2N6AxnLC5pqDyn2cv7PHOnTpcp
	jDBwxK0MHj0rcFVgkhp/1MobxAlx6MVo7mJw5NHpyRsocWtzT9+vmMch1u2YmcvtX5i0LIFhrVjRW
	wWVEgat6hH/87tSbHEos3GiDYy1/U8PgC6Mf/jMwlNpbXTcwKiGaOKCBFpRSfqLZwGcmj7j0rksKc
	mYY3Jr3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2J4c-00AlHx-PN; Mon, 05 Dec 2022 21:32:26 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2J4R-00AlDh-6N; Mon, 05 Dec 2022 21:32:16 +0000
Received: from notapiano (unknown [IPv6:2804:14c:1a9:3b3c::1000])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7E9CA66015B4;
	Mon,  5 Dec 2022 21:32:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670275933;
	bh=50/6QIo85oB6JxRj95P+uB219lfikFqskeQx/8eOvno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lRQUJmwna1Fd3WRydn/u93hKBrfttIOdTcafin+jSSCYjr8s1GC7M6p2HGiatKbtM
	 dw3/omlPJCPUvvIgvS1mZkuutCWS18K758oZj6pZrK96KiwBrh6PwsBhwsS6x8WRCZ
	 D/ZviTmlAkrpSKOigl4ACIML7N9J6ZGh3CkfXhuMDK2mQa37es2OIctUDX5itDZT+m
	 neu34try3QNXbu4wn3s9rqq7sE/HkJagVPpvFShgr97iqqxw4NfM0evX5yysOwVWFU
	 /tHa61VDvgghxpot4Q/5Q1TbgR4WHQZPJBtA1C1RFFEjnjCVpsTxLiyOiQ0t99oyby
	 //suG3cbYJkKw==
Date: Mon, 5 Dec 2022 18:32:04 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, yunfei.dong@mediatek.com
Subject: Re: [PATCH v5 1/3] media: dt-bindings: media: mediatek: Rename child
 node names for decoder
Message-ID: <20221205213204.ftnarhtsk33pprq3@notapiano>
References: <20221128143832.25584-1-allen-kh.cheng@mediatek.com>
 <20221128143832.25584-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221128143832.25584-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_133215_384437_D59E25A9 
X-CRM114-Status: GOOD (  16.91  )
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

On Mon, Nov 28, 2022 at 10:38:30PM +0800, Allen-KH Cheng wrote:
> In order to make the names of the child nodes more generic, we rename
> "vcodec-lat" and "vcodec-core" to "video-codec" for decoder in
> patternProperties and example.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  .../media/mediatek,vcodec-subdev-decoder.yaml | 60 ++-----------------
>  1 file changed, 4 insertions(+), 56 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> index c4f20acdc1f8..695402041e04 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> @@ -91,12 +91,13 @@ properties:
>  
>  # Required child node:
>  patternProperties:
> -  '^vcodec-lat@[0-9a-f]+$':
> +  '^video-codec@[0-9a-f]+$':
>      type: object
>  
>      properties:
>        compatible:
>          enum:
> +          - mediatek,mtk-vcodec-core
>            - mediatek,mtk-vcodec-lat
>            - mediatek,mtk-vcodec-lat-soc
>  
> @@ -145,59 +146,6 @@ patternProperties:
>  
>      additionalProperties: false
>  
> -  '^vcodec-core@[0-9a-f]+$':
> -    type: object
> -
> -    properties:
> -      compatible:
> -        const: mediatek,mtk-vcodec-core
> -
> -      reg:
> -        maxItems: 1
> -
> -      interrupts:
> -        maxItems: 1
> -
> -      iommus:
> -        minItems: 1
> -        maxItems: 32
> -        description: |
> -          List of the hardware port in respective IOMMU block for current Socs.
> -          Refer to bindings/iommu/mediatek,iommu.yaml.
> -
> -      clocks:
> -        maxItems: 5
> -
> -      clock-names:
> -        items:
> -          - const: sel
> -          - const: soc-vdec
> -          - const: soc-lat
> -          - const: vdec
> -          - const: top
> -
> -      assigned-clocks:
> -        maxItems: 1
> -
> -      assigned-clock-parents:
> -        maxItems: 1
> -
> -      power-domains:
> -        maxItems: 1
> -
> -    required:
> -      - compatible
> -      - reg
> -      - interrupts

Looks like interrupts was required for vcodec-core, but it isn't for the generic
video-codec node. Which seems correct, given that the vcodec-lat-soc doesn't
have an interrupt [1]. So I guess this is just the generic video-codec node in
the binding being too generic for some cases. Ideally we would override
interrupts to be required based on which subnode we're dealing with (for lat and
core, but not lat-soc), but given these are subnodes matched through
patternProperties, I'm not sure that would be possible.

[1] https://lore.kernel.org/all/20221202034450.3808-3-yunfei.dong@mediatek.com/

Thanks,
Nícolas

> -      - iommus
> -      - clocks
> -      - clock-names
> -      - assigned-clocks
> -      - assigned-clock-parents
> -      - power-domains
> -
> -    additionalProperties: false
> -

