Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37167D20681
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 22:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3GCJwtwtOonS4m9g4FhWixo+dpekpfw3QC+2qEItCM=; b=T88QK+oB/sDSZA9j2iV22ZisQk
	FyCDgQdN5i2LeTf06GJlxX67MN6dmVPKk4+oMkgRW1mNBkp47zfpKM+D5//XGwyu9Bs9f4G696PYM
	ObR/xCOCQitdJbLKnot3WQakca5oFRF+ekvvGlFlwFfy3VTZW+/laCYeW2GlQPQEPjkIzjq4BmpQK
	eV5gBCu9ifQTPvm5qGr8ZKfPO0cLgCQQqN5Z+YPPW46YLUk6ZcgoHIG5OulDWMbKqr7mSVlpiIu2s
	Wexg88v/zPngDmbzPS8W8Cl+fk/SuE4JbERWX7pq2mohDAQ8dxOVx3IFdoqLYTvx23cGQDWHsdAXv
	T8Wd2hYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0pvl-00000009mkJ-12E2;
	Tue, 15 Oct 2024 22:22:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0puK-00000009maC-3fE1;
	Tue, 15 Oct 2024 22:20:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 06BD4A43423;
	Tue, 15 Oct 2024 22:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F57FC4CEC6;
	Tue, 15 Oct 2024 22:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729030847;
	bh=cz0wcw3Y7yNv81Eqmq/jRhBRalPGnIOBsVA8ozyzCVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QJ5OWFOgkkbenFSC429aGainB2dB4o0Q1vBAUtQN81RS+VdC7+NpsQcZaLWnrJu+N
	 4/M8AGaJGNfzask2wpXq4U9kC2eZ6g+ZKzHkJ++CXumOaNt2Jk2AkWMWsNeFoqYciM
	 sYYvXSbooEjQgj5oYEjH3Fkab210ZGDzdwoeqfxmtLVG6gmH61DMfc4GvcC3ngxaOg
	 k73Ht2ipOfeaooBnACRFeOPJPk9nKiVjxBXA44plZvh5BhM7dS8/DzlQUr37Y5FhTM
	 uv/KZcWhx/zMKVPaaJ8aAYyecBQPV9scgLLS2W3fFlV0SZvruGCX4BCpDiyo8X6Siv
	 Ap/ZZCi9S8Jcg==
Date: Tue, 15 Oct 2024 17:20:46 -0500
From: Rob Herring <robh@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	ChiYuan Huang <cy_huang@richtek.com>, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Chris-qj chen <chris-qj.chen@mediatek.com>
Subject: Re: [PATCH] dt-bindings: usb: mtu3: add mediatek,usb3-drd property
Message-ID: <20241015222046.GA2164669-robh@kernel.org>
References: <20241015172100.15150-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015172100.15150-1-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_152048_995700_4CCA90DE 
X-CRM114-Status: GOOD (  13.60  )
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

On Wed, Oct 16, 2024 at 01:21:00AM +0800, Macpaul Lin wrote:
> Add optional 'mediatek,usb3-drd' property to MediaTek MTU3 DT Schema.
> This flag specify whether it is a USB3 Dual-role device hardware.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> index d4e187c78a0b..1e70af0dac82 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> @@ -155,6 +155,12 @@ properties:
>        property is used. See graph.txt
>      $ref: /schemas/graph.yaml#/properties/port
>  
> +  mediatek,usb3-drd:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Specify whether it is a USB3 Dual-role device hardware.
> +    type: boolean
> +

Don't the standard properties such as usb-role-switch or dr_mode work 
for you?

>    enable-manual-drd:
>      $ref: /schemas/types.yaml#/definitions/flag
>      description:
> -- 
> 2.45.2
> 

