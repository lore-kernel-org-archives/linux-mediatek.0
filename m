Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58860FEA835
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2026 08:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DYIfXXyXqYu2MHnl6/pY+qQgUEUVndVAlPDJ7ouT/F8=; b=4ipVRT+02XMSLa42hyoKwk8Czg
	bUayz0XuY+DxUZ8sIrt4rJJwZDmjAbDHIsuufmXVNOqRiC2sRaga45sUMoU8AzyMSO5NF3hFBZ1fU
	WDH08cLFn/oSNTBDY1XY66MjeBMOdUBn8pcYHMxR4QDv9WqfJTMqMe/2N+rCqOed3MSfY3G3yfugm
	W/umHPvibRGjAq2QnBwWAHCf2YI7ZUoN2CnOGk01ACXijGuE+RUY3Sz0BdZsbMxsg/g4NY8v3HXxx
	biF3XdUxSQFPmfhjMmvEN4cdpijxLn+pu8ZL1n7Y76AYZwMOYzZEmexdaC69DDxzVUKuZNWDUZxT2
	1m5r/EAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5K22-00000002zUn-3kSF;
	Wed, 25 Mar 2026 08:56:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5K20-00000002zU3-0JF6;
	Wed, 25 Mar 2026 08:56:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 989064425B;
	Wed, 25 Mar 2026 08:56:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3CF4C2BCB5;
	Wed, 25 Mar 2026 08:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774428963;
	bh=/JMlAJtkVkMRk9eWWW8xRC7NujwNr+Vi5u7ZPMFm65A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dZd/U6Tm3x6TyS+nWCPv4d4hPvSI6mO5XfGxHJsgyfP8ir//KnOrgVUPp7Vsb09Jn
	 e3X8q0hpGNaZEF7+MbQ+U3fjNOxYQFx/q1dohoWvPQqc7RYh0miACYkaziJLrpFgeO
	 OK39unOR4qLcXQ38I/J/sELVeEgqinwDrH+MeAnWmqtaDmbYX1tAcrpCXVd/rH8tZP
	 ebR73IkSTakBkLi03moTrcocYL4U+1G1pILUGBgONkVQ4ImcTZAul4KOtDLB32u0XO
	 YGAqUFToUk1eaTs2cErWhmZD4269UN+p90GnXLyCqs4r2MZRNaYqyhZ3XBpXo14l73
	 nRYD7hNG6BMvg==
Date: Wed, 25 Mar 2026 09:56:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND 1/2] regulator: dt-bindings: mt6315: Add regulator
 supplies
Message-ID: <20260325-uncovered-carp-of-inquire-8a7acf@quoll>
References: <20260324053030.4077453-1-wenst@chromium.org>
 <20260324053030.4077453-2-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260324053030.4077453-2-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_015604_132984_23DDFF19 
X-CRM114-Status: GOOD (  12.59  )
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

On Tue, Mar 24, 2026 at 01:30:28PM +0800, Chen-Yu Tsai wrote:
> diff --git a/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
> index fa6743bb269d..ba99a0d02bc7 100644
> --- a/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
> @@ -29,6 +29,16 @@ properties:
>      type: object
>      description: List of regulators and its properties
>  
> +    properties:
> +      pvdd1-supply:
> +        description: Supply for vbuck1
> +      pvdd2-supply:
> +        description: Supply for vbuck2
> +      pvdd3-supply:
> +        description: Supply for vbuck3
> +      pvdd4-supply:
> +        description: Supply for vbuck4

These all look per-regulator supplies, so I think they should be in each
regulator node (see also regulator.yaml).

Or in top-level, but not in "regulators" node. The regulators is only
wrapping node for children.

I wonder what should be our preference - have supplies per regulator or
in top-level node. @Mark, any preference from your side?

> +
>      patternProperties:
>        "^vbuck[1-4]$":
>          type: object
> @@ -51,6 +61,9 @@ examples:
>        reg = <0x6 0>;
>  
>        regulators {
> +        pvdd1-supply = <&pp4200_z2>;
> +        pvdd3-supply = <&pp4200_z2>;

Best regards,
Krzysztof


