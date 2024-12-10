Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3BCE7717F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2024 13:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJX/8xrhEUU6XIQbmDy2O/PG0ZMWemC8KWil8DsF0s4=; b=ftFkLFsO7jePQRV+znJaR44dgo
	3VDgcWYxSO8nOX8/B0KaCcWDEAfl/kwOmKp3f9XwWzNBfBjJ+SrxTqrt331e//NO97mvVwQV/HxCb
	AkyLBSswHzMez55hH8WkdJUrQk2N0+PmtXkNvUvWxMluZfNFkjn99QO1WScgAyZBrRIx3HU9EcFnm
	RGag5iQr0NZfWsZQQ4aOWfaOvoC3O+e+3jpDDfdnry58/BttbjalCEtBB9B5cKrSecXLvEK9oUsMZ
	+CjMdo7eBzlBDwQF1jr6sI/e2L2xM36C9vEhmo0X5xlz0aKjrsf2d2oBVtl5hCKO06UnJ3rcG/vWT
	9O7oKvcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0U6-0000000BbcQ-3Ozt;
	Tue, 10 Dec 2024 13:41:06 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0T2-0000000BbRk-47rq;
	Tue, 10 Dec 2024 13:40:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=UJX/8xrhEUU6XIQbmDy2O/PG0ZMWemC8KWil8DsF0s4=; b=asH3PMsr0djKISSZvkaKiVPas4
	C0pfCwI0wDPzRSBUFRdQR5DwuvF/8S+ly9EcCqrPelbwmYtlrUBUjNFEF7it1j8BNn4cUjI+qfOxE
	UuJB56y8a2/KfBj8Lh/1TpyKfUtCqUAvN9/P6XenmZbIxvkicYvjY5gQAmFTrj1NE5+8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tL0Ss-00Fnxx-No; Tue, 10 Dec 2024 14:39:50 +0100
Date: Tue, 10 Dec 2024 14:39:50 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v11 9/9] net: phy: Add Airoha AN8855 Internal
 Switch Gigabit PHY
Message-ID: <ca20895b-9223-4af6-b49c-e405b69e5f08@lunn.ch>
References: <20241209134459.27110-1-ansuelsmth@gmail.com>
 <20241209134459.27110-10-ansuelsmth@gmail.com>
 <b3b79c80-ac7c-456b-a3b5-eee61f671694@lunn.ch>
 <67582fca.050a0220.2d187a.9e01@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67582fca.050a0220.2d187a.9e01@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_054001_024749_27842A23 
X-CRM114-Status: GOOD (  18.35  )
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

On Tue, Dec 10, 2024 at 01:10:45PM +0100, Christian Marangi wrote:
> On Tue, Dec 10, 2024 at 02:36:29AM +0100, Andrew Lunn wrote:
> > > +config AIR_AN8855_PHY
> > > +	tristate "Airoha AN8855 Internal Gigabit PHY"
> > > +	help
> > > +	  Currently supports the internal Airoha AN8855 Switch PHY.
> > > +
> > >  config AIR_EN8811H_PHY
> > >  	tristate "Airoha EN8811H 2.5 Gigabit PHY"
> > >  	help
> > 
> > Do you have any idea why the new one is AN, and previous one is EN?  I
> > just like consistent naming, or an explanation why it is not
> > consistent.
> >
> 
> EN EcoNet that was then absorbed by Airoha (AN). Hence it's the same
> thing. Airoha is suggesting to use AN for new submission. So it's just
> about timing.

Thanks for the explanation.

> 
> > > +#define AN8855_PHY_ID				0xc0ff0410
> > > +static struct phy_driver an8855_driver[] = {
> > > +{
> > > +	PHY_ID_MATCH_EXACT(AN8855_PHY_ID),
> > 
> > Is there any documentation about the ID, and the lower nibble. Given
> > it is 0, i'm wondering if PHY_ID_MATCH_EXACT() is correct.
> >
> 
> I will check this but I doubt there is any explaination. These are internal
> to the switch so my theory is that no exact logic was applied.

O.K. It can always be changed later, if a different revision of the
PHY appears.

	Andrew

