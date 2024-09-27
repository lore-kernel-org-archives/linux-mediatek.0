Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0A2CEBF8A
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Sep 2024 09:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nh0D2gIIzVCTTns6sSr6nrZCJ3sWNhmxhvYohIeuvcM=; b=O7eAYUNHvWVY1csM/ZLX/3+S5U
	opgBBN2qKQxGzsMcRl1qkQYRc2GEH95acAPQUoXxUA2vi9grsQvmv403tPQ7tVBKj1EFfW57IGMQd
	zrG+lnT0TkCpA7T8hdg1nN+VpW/xn6IC7tF5zea3i3mOYpQAOgHRdka/ilyRHvL42+REFroszDFdJ
	KpRpiv/LI8E4SXDnIyM+lyn2EH4tkllaCunTu6T4Acag1yRQV05fTjRAFl8UGjTy6wBZsMBj46pvb
	WE3swBaiDnGl8nEoSQ1ikB+4/JfRIwlIQJWr/su/2y/1zWmacKPL2TddyBbLPxMsAzwP6Lvp5oLpa
	0KLVRGhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1su7Qp-0000000AgRw-1pOq;
	Fri, 27 Sep 2024 09:38:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1su7PN-0000000Ag0i-2diL;
	Fri, 27 Sep 2024 09:37:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 04BD75C5C86;
	Fri, 27 Sep 2024 09:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D9CCC4CEC4;
	Fri, 27 Sep 2024 09:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727429824;
	bh=SyUAj6YH4ZWfBAbLc9RBIAhggRIMEKY1PFIqF4T7pRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hkxn8Mp8CzphuZ480+VHOuXSuKHwmeCfwN4Vl3uBdwUd2qUaesBeFZeg+CR8YBPmF
	 YHseFh2rCE4m4jb5vvPxjHcL0oYSfkCPTlG5OQuZXMSCU/HKvqTxfq9jgCZ7w0RsjA
	 XRhqX1oYrtWTrlxqfi0Xwhe8pfJMx92oy0rf1OrxbNvoS+d4GDinu4oQMG/lMJILn3
	 fVm0/d/FQZ0nKYQcVemdtj8hqpYw0dtP++aAHmQjIHWAIXE5ZC5gRWKs9GiUlT2fnr
	 5OWy0rJqBvNtFwjYn90Zjc+rk5VOyQ9fkyXvuBM8N+jR5H1bxYDGiX2jFG/ejHnUzL
	 OlxD3EVbSXDbA==
Date: Fri, 27 Sep 2024 11:37:01 +0200
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
	linux-arm-kernel@lists.infradead.org, Moudy Ho <moudy.ho@mediatek.corp-partner.google.com>
Subject: Re: [PATCH v2] dt-bindings: display: mediatek: split: add clocks
 count constraint for MT8195
Message-ID: <pnpj4pexz6nff72kmk6thupwvp2dgkz32ye7o44qdpuctbewb4@kpokc7c2rflr>
References: <20240927055140.19688-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240927055140.19688-1-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_023705_782000_513D0143 
X-CRM114-Status: GOOD (  19.24  )
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

On Fri, Sep 27, 2024 at 01:51:40PM +0800, Moudy Ho wrote:
> From: Moudy Ho <moudy.ho@mediatek.corp-partner.google.com>
> 
> The display node in mt8195.dtsi was triggering a CHECK_DTBS error due
> to an excessively long 'clocks' property:
>   display@14f06000: clocks: [[31, 14], [31, 43], [31, 44]] is too long
> 
> To resolve this issue, apply the limit by setting 'maxItems: 3' in MT8195
> additional condition.
> 
> Fixes: 4ed545e7d100 ("dt-bindings: display: mediatek: disp: split each block to individual yaml")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Your SoB does not match.

Please run scripts/checkpatch.pl and fix reported warnings. Then please
run  and (probably) fix more warnings.
Some warnings can be ignored, especially from --strict run, but the code
here looks like it needs a fix. Feel free to get in touch if the warning
is not clear.

> --
> The purpose of this patch is to separate the corrections for
> MediaTek SPLIT CHECK_DTBS error from the original mailing list
> mentioned below:
> https://lore.kernel.org/all/20240924103156.13119-2-macpaul.lin@mediatek.com/
> 
> Changes since v1:
>   - Adding functional descriptions and quantity restrictions.
> ---
>  .../bindings/display/mediatek/mediatek,split.yaml           | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> index e4affc854f3d..bce1b8b866ce 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> @@ -57,6 +57,9 @@ properties:
>    clocks:
>      items:
>        - description: SPLIT Clock
> +      - description: HDMI RX Clock
> +      - description: HDMI Metadata Clock
> +    minItems: 1
>  
>  required:
>    - compatible
> @@ -72,6 +75,9 @@ allOf:
>              const: mediatek,mt8195-mdp3-split
>  
>      then:
> +      properties:
> +        clocks:

missing minItems

Missing constraints for all the variants.

Best regards,
Krzysztof


