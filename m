Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7194C3ABD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 May 2025 21:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0fTcsPCngfSQh8sTLVFQa2oAuBNRUheBXdO0Lg8ghPA=; b=GkL1hLeKojmkMkrgyBLXa94L+d
	XQ/l9FDWogZ8BhHK9NFR5SeBNEGoPPyZdnHnSs1apwI1PcQisy9n53XafKN8YaGKkEd4/9hJr9WJz
	aIwhfEHiOmlo6LEEyPw6JBcpD8A9s2qmDjPqx9EgWk23iPmyQStYvyyyhB579ohO2o4+GzDHhe+QK
	YZNyH4u0bz/UQtAuxcOxhGw1+63GmCk+rWTlWFmJkp3INgbCMg8KQYqNkFgJuPY3hgFKKdiVfkAps
	bUuS3KltQSYofvMS9uD0T12WrJlRwD2vRAudw4sRo8fUItw4E5gzIpgzyoEgedqbRDVf9CGxEkpQb
	1iAM1jPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFJXL-0000000GMmO-3XFv;
	Wed, 14 May 2025 21:21:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFJUT-0000000GMVQ-36sT;
	Wed, 14 May 2025 21:18:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 08804629E5;
	Wed, 14 May 2025 21:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C9CBC4CEEF;
	Wed, 14 May 2025 21:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747257492;
	bh=ZIb9Fz+xqmgrAxD9mfna0sZwGimSQAAHyT/UwWtLC/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FysNDajbvFLErLLS+ewABWamu9qsKftwQ/avnuariznR2rGW7L75r8/aTCRP3Y9Ep
	 UmF//7v1v1Jaeggu5nWZjUaNDP605R5np/adPcjWhAYxvcGtkbPQg9JKyq5npQ1h0N
	 fuFGoVT+L774iCPRmmaXhJTHMvaNGRi07aoegw38eAvR71Gl5OVHEwMKnYwZu7VLRz
	 E1AQkBGQAme98CoiJtarJ4cZvUMW42VuIJb1npm0o/qegBKXprmaw+sL6pL8n8ylV0
	 9c7VJZ2zAXHO7m7jgKlnkzZPdhA7ZMfoqtiDO5erTnnoAp1zses1IeoSQLX1+0YZcP
	 l6/tMa1mvWmaw==
Date: Wed, 14 May 2025 16:18:10 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v1 03/14] dt-bindings: net: dsa: mediatek,mt7530: add
 internal mdio bus
Message-ID: <20250514211810.GA3051536-robh@kernel.org>
References: <20250511141942.10284-1-linux@fw-web.de>
 <20250511141942.10284-4-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511141942.10284-4-linux@fw-web.de>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, May 11, 2025 at 04:19:19PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Mt7988 buildin switch has own mdio bus where ge-phys are connected.
> Add related property for this.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index bb22c36749fc..5f1363278f43 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -156,6 +156,9 @@ properties:
>      maxItems: 1
>  
>  patternProperties:
> +  "^mdio(-bus)?$":

Really need 2 names?

> +    $ref: /schemas/net/mdio.yaml#

       unevaluatedProperties: false

> +
>    "^(ethernet-)?ports$":
>      type: object
>      additionalProperties: true
> -- 
> 2.43.0
> 

