Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B855C77B7C
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 00:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4JJXcqBDbJjzxIkgLA7FlH9N5azmesuHkAzWKMT0kxw=; b=MsVeAsHrD+KpEPKg7PQMFCT4GQ
	+p6GRXi4sx/zFWVZEUl60eCEsb8vA9paXAp7tOBEu30C/TBxogrd1eGFhU/P+15mjz1EsgYuzMH2V
	m87MQHSreMWBeUo+QtRfAgd65sPNp86OgxpB1nv44kiLbwpb1lURAjHLvnvN0iRQa3DdSgaQZEpnw
	KeHh6oTL/dAfCJ1Bil3BxK6lpbyergc/Elp5mKxneXquapzj3IfpK0eg8cfYRDQjlc42PVkRgqD9f
	zUM9UVzQV2+heXQB8esP3Uqyuvn8UWnC2u1/lVfZ6pMMdG5uk+UbRqGc488E/LC1r64lBOf088LAU
	hUVAEkGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwuK7-007Ldw-0g;
	Thu, 11 May 2023 00:38:23 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwuK5-007Ld9-0X;
	Thu, 11 May 2023 00:38:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=4JJXcqBDbJjzxIkgLA7FlH9N5azmesuHkAzWKMT0kxw=; b=YeFjpCsDdV47pza6aYnTnCunPm
	iy0cbh71sjxhP2TqmpBPToW6PDQT6hYDdU7eff9uLytezk4C3lVX33BLfA8GS66HhPnnbhqisn/BE
	w9IZuIpIsuLdMJ2r3RSm7rxa67HRnjK6Hkw5TSg8Cn5iTktE62K6/hdsMCJXm522AOls=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pwuK3-00CUtn-Re; Thu, 11 May 2023 02:38:19 +0200
Date: Thu, 11 May 2023 02:38:19 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/8] net: phy: realtek: rtl8221: allow to configure
 SERDES mode
Message-ID: <8fdffc76-4b2f-44ea-9800-1e5d3624d94e@lunn.ch>
References: <cover.1683756691.git.daniel@makrotopia.org>
 <302d982c5550f10d589735fc2e46cf27386c39f4.1683756691.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <302d982c5550f10d589735fc2e46cf27386c39f4.1683756691.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_173821_200191_0D761B5C 
X-CRM114-Status: UNSURE (   7.17  )
X-CRM114-Notice: Please train this message.
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

> +#define RTL8221B_SERDES_OPTION_MODE_2500BASEX_SGMII	0
> +#define RTL8221B_SERDES_OPTION_MODE_HISGMII_SGMII	1
> +#define RTL8221B_SERDES_OPTION_MODE_2500BASEX		2

So what is 2500BASEX_SGMII? You cannot run SGMII at 2.5G, because
there is no way to repeat a symbol 2.5 times so that a 1G stream takes
up 2.5G bandwidth. The SGMII signalling also does not work at 2.5G.

Please add an explanation what this actually is.

       Andrew

