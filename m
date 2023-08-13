Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7429CC001DE
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Aug 2023 17:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l9cJqVzuMvixDyp9aw1WUQ1PiRvYpZJ5ru2bifGFMz4=; b=kaDgGcd1cnUDNZf/ljDKvUbOBE
	Vkike4pzbYwVeaaCU2QvYxzo3yF0Yam1U36i1h4es8dfsEB3yfT8NAvd0eWm9spAd8noXOmXav5d5
	n7i8ZegYLr8IcigA5ChONOOhH/ieFePZ+lgo/afaahY6b5VdmHd/vEjm4TwDsrxqxEenvAj4ZGVGx
	eMhMo+AB7qvIiUz3POSn7wVhV8JV1h8ly9Bqm51NBJxlvV5gzqqYaluZfaIpQXOnVW6NIcyu4U79Q
	irKhL7XExtkQKICJ0d4mPyDB3BtU4H0hQoiHiKLJ/f82dpy1+qkwTzyxAo6rzubbrZXQJdhe9ixe3
	p2+JctYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVEj3-00FVDN-0C;
	Sun, 13 Aug 2023 17:18:01 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVEiz-00FVCl-13;
	Sun, 13 Aug 2023 17:17:58 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qVEim-00009H-1y;
	Sun, 13 Aug 2023 17:17:44 +0000
Date: Sun, 13 Aug 2023 18:17:11 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Andrew Lunn <andrew@lunn.ch>
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
Message-ID: <ZNkQFwvm_sNiVDRO@makrotopia.org>
References: <32e534441225c62e3bf9384b797d9beda7475053.1691943605.git.daniel@makrotopia.org>
 <9bae16cd-501e-4fe5-9736-d32d958aec7c@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bae16cd-501e-4fe5-9736-d32d958aec7c@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_101757_368639_AE618831 
X-CRM114-Status: GOOD (  16.29  )
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

Hi Andrew,

thank you for reviewing my patch!

On Sun, Aug 13, 2023 at 07:03:21PM +0200, Andrew Lunn wrote:
> Hi Daniel
> 
> > This requires syscon phandle 'mediatek,pio' present in parenting MDIO bus
> > which should point to the syscon holding the boottrap register.
> 
> If i'm reading the code correct, if this property is missing, the PHY
> will fail to probe? Since this was never a mandatory property, it
> looks like this will break old DT blobs?

As the for-upstream-Linux dtsi for the MediaTek MT7988 SoC is still in
the making there aren't any existing DT blobs we'd want to be compatible
with at this point.

> 
> If there are LED properties, then it should be mandatory, otherwise it
> should be optional. That way you keep backwards compatibility with old
> blobs.

Do you still want me to check for the presence of any led properties
before looking for the syscon phandle?
As in: would you like to have it that way anyway even if compatibility
is not an issue?


Cheers


Daniel

