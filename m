Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1707CAC582
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Sep 2025 02:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=07LtSeWo/AmLZHtl6LX+u3Mr0O3ybeIZifoEkYMgMgM=; b=nmqRsta7aw18nPkysF+RhkB8ln
	h/ZKGvbO9arhiDXUrGNI8OB+fWS2iyaGlhHdKKo5RA/iAhETThu8KczTck38/o+k8P4OrjnctaJU7
	3SXfGxcTFYLH5CFEu2w47pEfEyOz/TXPvrFOg0VLlujqNUY2mVkoCzasO8U49fDVPKNF/Y+CAl4FA
	0CG/xAO3dlEOP8fc3J6mC6sZd4USVlxLaibbIXdaeQJSzXI2asQyZV0rXzI1cV7OxE+0SMj/xBY78
	VdFW/SOyAVvCS1HFg8Usp+3MKHcW9bfQRSbKsKAJAgsDPMvDsa2puBkXRepX5i8snhak8WzJbHAlX
	fWUAhtLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvo67-00000003hPi-3mqX;
	Tue, 09 Sep 2025 02:28:43 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvhBq-00000001mEP-3kO9;
	Mon, 08 Sep 2025 19:06:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=07LtSeWo/AmLZHtl6LX+u3Mr0O3ybeIZifoEkYMgMgM=; b=KClgd9bhUawW8/SwsL/AD4WJe8
	mMGpaecMywwKaJtk1DDS8s+hN2JLX2eStBVdYpymdA0NS7wP3vSmeJoGLFyoz7hwCL9joAkJQkY6Q
	MUBHr89CzbDUc8m/E0fKYpPC45i3/W6zumMPEPO7RrxSQ0wlyv4ywyxTU4BrGQw/VfLM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uvhBj-007i1L-4F; Mon, 08 Sep 2025 21:06:03 +0200
Date: Mon, 8 Sep 2025 21:06:03 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: airoha: fix wrong MDIO function bitmaks
Message-ID: <d1bc3887-5b88-4fb9-8f89-4b520427ccdc@lunn.ch>
References: <20250908113723.31559-1-ansuelsmth@gmail.com>
 <583981f9-b2ed-45fe-a327-4fd8218dc23e@lunn.ch>
 <68bf16e5.df0a0220.2e182c.b822@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68bf16e5.df0a0220.2e182c.b822@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_120610_934236_4C70E48F 
X-CRM114-Status: GOOD (  16.74  )
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

On Mon, Sep 08, 2025 at 07:48:17PM +0200, Christian Marangi wrote:
> On Mon, Sep 08, 2025 at 06:54:15PM +0200, Andrew Lunn wrote:
> > On Mon, Sep 08, 2025 at 01:37:19PM +0200, Christian Marangi wrote:
> > > With further testing with an attached Aeonsemi it was discovered that
> > > the pinctrl MDIO function applied the wrong bitmask. The error was
> > > probably caused by the confusing documentation related to these bits.
> > > 
> > > Inspecting what the bootloader actually configure, the SGMII_MDIO_MODE
> > > is never actually set but instead it's set force enable to the 2 GPIO
> > > (gpio 1-2) for MDC and MDIO pin.
> > 
> > Is the MDIO bus implemented using the GPIO bitbanging driver?
> > 
> 
> No it does use the MDIO bus integrated in the MT7530 Switch. It's just
> that the MDIO pin can be muxed as GPIO usage.

Then i do not understand this patch. Why configure the pinmux for GPIO
when you want it connected to the MDIO bus device?

     Andrew

