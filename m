Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60954CFA749
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Oct 2024 06:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HVIEvkqhxjJu4sTCATl2L63wWxt14l4bhIYh/OpDe90=; b=jcNVXHf9NzGdExLq5VtYWY3GKd
	KrrkQXEtm8fK7ecmvjFwN68/QdOFShl9tLMVufuLCX9dBNBvAzLCf0FeGFpn5P/a1XChVRW5DWFb0
	mFDABI6msNK6f0WPYXSwTE7AcLTkkdnB2t7QSPcv4oyUK6hvyPs3VtF1T9OtvVP2Ikn7gU8SGn9+t
	1psaPr3CshSSgMS9GDV6qdBSsnl87LyLg7rsVSiUed7EQrVJ0N9arSBVi/lX5IXLWDDff1GvRhizv
	rK5cfwYdlkAPHm43UUXhumNzF6JZ3Z/FBrb684TEN3xDyYB7AaVVRMw1LTE5tw9EC6e1IBtwycHXJ
	7NBP65sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swbvW-0000000B9Dn-0H8o;
	Fri, 04 Oct 2024 06:36:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swbuF-0000000B97F-1x7v;
	Fri, 04 Oct 2024 06:35:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 334EE5C1060;
	Fri,  4 Oct 2024 06:35:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04550C4CEC6;
	Fri,  4 Oct 2024 06:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728023713;
	bh=jl7T+5WwqtroqvfChKzcUHISh4+13GhKzPmF41T9kb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gw2MCGp4xo+Jr9zBJnBd23K/f47mAe6echPEvacE0G3+nEMudx1iKOP9pWMUxsKkn
	 tp6GB+nSIfbQOr3BUn/wLowrU3ypk5dTbDd0NPFCF0uzwUnkYkZuoVcWyPkUJo5tTn
	 2YVYY0WwClMxyzmBlqQBsH9c+f1viVw7YXP/swCc30oKXm9ajBlE0gwK4JZrxIvLyI
	 DMb2rsII3cDJYqvAm8oo4kg8s2zh9DsubrnASD6Dbs9YqERGoj+SeSRU3mQS5eDLhK
	 A8i4wpwRlAQpdyNG8HQVYPMXJT2pAD0UjQqH6Nd48iRDqE6vhqJ5XBiapPjgzabRnD
	 zqd5krKAy4zFg==
Date: Fri, 4 Oct 2024 08:35:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4] dt-bindings: display: mediatek: split: add subschema
 property constraints
Message-ID: <ajydpbq4ygrfr3ahs5nuh72pdmbttus2kgjb6csxc3p4tcq5l2@dlmucrzchvgl>
References: <20241004031245.27514-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241004031245.27514-1-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_233515_619168_27216D2F 
X-CRM114-Status: GOOD (  18.40  )
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

On Fri, Oct 04, 2024 at 11:12:45AM +0800, Moudy Ho wrote:
> The display node in mt8195.dtsi was triggering a CHECK_DTBS error due
> to an excessively long 'clocks' property:
>   display@14f06000: clocks: [[31, 14], [31, 43], [31, 44]] is too long
> 
> To resolve this issue, the constraints for 'clocks' and
> other properties within the subschema will be reinforced.
> 
> Fixes: 739058a9c5c3 ("dt-bindings: display: mediatek: split: add compatible for MT8195")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> 
> --
> This is based on [v2] dt-bindings: display: mediatek: split: add clocks count constraint for MT8195
> 
> Changes since v3:
>   - Correct the compatible name for the mt8173 split in the subschema.
> 
> Changes since v2:
>   - Revise the commit message.
>   - Enhance the descriptions of 'clocks'.
>   - Strengthen the conditions within the subschema.
> 
> Changes since v1:
>   - Adding functional descriptions and quantity restrictions.
> ---
>  .../display/mediatek/mediatek,split.yaml      | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> index e4affc854f3d..87f8477a7be8 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> @@ -57,6 +57,9 @@ properties:
>    clocks:
>      items:
>        - description: SPLIT Clock
> +      - description: Used for interfacing with the HDMI RX signal source.
> +      - description: Paired with receiving HDMI RX metadata.
> +    minItems: 1
>  
>  required:
>    - compatible
> @@ -72,9 +75,30 @@ allOf:
>              const: mediatek,mt8195-mdp3-split
>  
>      then:
> +      properties:
> +        clocks:

minItems, nothing in your commit msg says that clocks are optional

> +          maxItems: 3
> +
> +        power-domains:
> +          maxItems: 1

This should be in top-level, not here.

Best regards,
Krzysztof


