Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89420C001DE
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Aug 2023 18:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qkbjf27ChqO5EbWzM1wD2VroQ/eyQ9P6RhMGX5u/958=; b=Oz5yVObpGkR1bQ+vOZLcDLzSLo
	l/YcgDnw+/ZV5OHDBMM1DxADWd3735pqjQoG+m9z2GHpUgWeXmRkM9aan02L7LeuW4jIRGtPi+Q8W
	ck7PRNQ6sE+F6RuGN0aS9Cn5jy5C66H1O9vi7I1Ww+qz5gOri/8eBY1lJQ9sF65C8g6TG5o1D9iAf
	s5xIJ8JIzxp17zrnyfQR6Ec/WQ8yfvCV4C1WUuimgvjmPND07ZHdwYMLHNGowdRwZpx+o1rhbqE46
	LrVr0o5utqGaJKttLU79Pm1rlvk2qRzYCnMqTFT/5EFcB3FAfq0yEm8FueZvu87DcFZD0YkGxmn/1
	8ZpKugrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVGCR-00FZo6-2K;
	Sun, 13 Aug 2023 18:52:27 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVGCO-00FZnE-1K;
	Sun, 13 Aug 2023 18:52:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Qkbjf27ChqO5EbWzM1wD2VroQ/eyQ9P6RhMGX5u/958=; b=I+q0QOSqSnENFIwWnF/HZLdocT
	tC7Yo24fMiJBPBpdAPZtGtcsDikLysCZPYD0eGvpQ6nzPbIsj0GLKp7aj0GzqgyNTFKTQdolaIhZN
	YwvOdzS8BzvV9wxqNW+4Sm7E/RVABWruWDNkP3XHphPzE4hmujp9bVsnw0nVaOhDsjTI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qVGBt-003z4U-7a; Sun, 13 Aug 2023 20:51:53 +0200
Date: Sun, 13 Aug 2023 20:51:53 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2] net: phy: mediatek-ge-soc: support PHY LEDs
Message-ID: <1bda7c1e-6a4e-491b-878b-f232972f4c3d@lunn.ch>
References: <32e534441225c62e3bf9384b797d9beda7475053.1691943605.git.daniel@makrotopia.org>
 <9bae16cd-501e-4fe5-9736-d32d958aec7c@lunn.ch>
 <ZNkQFwvm_sNiVDRO@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZNkQFwvm_sNiVDRO@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_115224_470372_B8A8130E 
X-CRM114-Status: GOOD (  18.44  )
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

On Sun, Aug 13, 2023 at 06:17:11PM +0100, Daniel Golle wrote:
> Hi Andrew,
> 
> thank you for reviewing my patch!
> 
> On Sun, Aug 13, 2023 at 07:03:21PM +0200, Andrew Lunn wrote:
> > Hi Daniel
> > 
> > > This requires syscon phandle 'mediatek,pio' present in parenting MDIO bus
> > > which should point to the syscon holding the boottrap register.
> > 
> > If i'm reading the code correct, if this property is missing, the PHY
> > will fail to probe? Since this was never a mandatory property, it
> > looks like this will break old DT blobs?
> 
> As the for-upstream-Linux dtsi for the MediaTek MT7988 SoC is still in
> the making there aren't any existing DT blobs we'd want to be compatible
> with at this point.

Ah. O.K. If there is need for a respin, please add that to the commit
message.

	Andrew

