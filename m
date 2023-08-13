Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF56C001E0
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Aug 2023 19:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IokVflNheRTkHj7Za3adjcCwkF1ORX6cf1KXIKZ/2pw=; b=GWzYP8PqDOpZ1WdD9w/+cfwyYS
	ZW4v0TWOzgHtJdLgprttI5p4iZ7C/eoEVbo5IN5WIFSlICUdkXQHK44RJswINo+o/h/68rVpZjyP3
	OlhrWagHiNK+Om1qkVo291MM/CuSDViV5GTDKdcfF4L9eVExJDI52e6mNHJSBdMvPUvoWRsPfN4zv
	E+L6rcue4t7bW+QdDt1pCn871l9REgv+YOekq/cbopeTUWtKqHqn+yCZchs/mQ6ENpjL8ALLRE4DM
	vXUpfBI31vKVvT/Zw+SsYcJR3kWbQDP3DXVcu0SsqpUTy0K8C1ZqX+jAmT2wcEU4jQsJPzav8rlH/
	09UxHPgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVGOh-00Fb0P-1i;
	Sun, 13 Aug 2023 19:05:07 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVGOd-00Faym-2b;
	Sun, 13 Aug 2023 19:05:05 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qVGOJ-0000QV-0X;
	Sun, 13 Aug 2023 19:04:43 +0000
Date: Sun, 13 Aug 2023 20:04:29 +0100
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
Message-ID: <ZNkpPRc9loNX2Wos@makrotopia.org>
References: <32e534441225c62e3bf9384b797d9beda7475053.1691943605.git.daniel@makrotopia.org>
 <8f20d427-91cc-4fbc-b263-dfc76df855f9@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f20d427-91cc-4fbc-b263-dfc76df855f9@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_120503_847563_5D193B4F 
X-CRM114-Status: GOOD (  11.69  )
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

On Sun, Aug 13, 2023 at 08:57:01PM +0200, Andrew Lunn wrote:
> On Sun, Aug 13, 2023 at 05:24:55PM +0100, Daniel Golle wrote:
> > Implement netdev trigger and primitive bliking offloading as well as
> > simple set_brigthness function for both PHY LEDs of the in-SoC PHYs
> > found in MT7981 and MT7988.
> > 
> > For MT7988, read boottrap register and apply LED polarities accordingly
> 
> Should this be bootstrap? With an S? boottrap appears quite often in
> the code, so maybe the datasheet does say boottrap?

Yes, datasheet and vendor code refer to boottrap register which reflects
the state of the pins used for bootStrapping the SoC...

> 
>     Andrew

