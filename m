Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92849C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Apr 2024 03:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JjNuZwdpUNRBh/I8SUva37k5rbG4PIOlDP+VOniuWv0=; b=SnC2xmXesLDrd5GpMvmNam+pXX
	PSaNtg8M23Rg0eRDHHsPIvC5LVs5g3I9nNBWeWajEVKpei29GS/AmYZy9fZjewOLlkqXXTmZKHO+U
	Jv2zC31BDLcATLizD93tr+L013E0RrylfnocErhZykX16lU02rxU34CocECOTmcZ8z+jSCCs6jArU
	iPaut1pjwhDBx+Jf9QMqKI8OnbJS8Cny+Fe6Pzlol27xjekuiMd+ofm8Uj2az4zNnOcWqiZUJUcJe
	c+vFc/Fs7cpBzf+fp7ogvMa82yS5r6TjmH6xKTwE0xeBNjts9lCkbrUsNFovCC78VLl9coxabrO1x
	SAh8AlFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzpRJ-00000006llO-26VH;
	Thu, 25 Apr 2024 03:06:25 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzpRF-00000006lkf-3pM1;
	Thu, 25 Apr 2024 03:06:23 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.97.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1rzpQt-000000000iK-0fH5;
	Thu, 25 Apr 2024 03:05:59 +0000
Date: Thu, 25 Apr 2024 04:05:55 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH 0/3] net: phy: mediatek: Integrate mtk-phy-lib and add
 2.5Gphy support
Message-ID: <ZinIk7b5jHtJXDJX@makrotopia.org>
References: <20240425023325.15586-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240425023325.15586-1-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_200622_053887_53DFAB7B 
X-CRM114-Status: GOOD (  18.59  )
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

Hi SkyLake,

On Thu, Apr 25, 2024 at 10:33:22AM +0800, Sky Huang wrote:
> From: "SkyLake.Huang" <skylake.huang@mediatek.com>
> 
> Re-organize MTK ethernet phy drivers and integrate common manipulations
> into mtk-phy-lib. Also, add support for build-in 2.5Gphy on MT7988.

I assume this should go to net-next. You should mention the target tree
like [PATCH net-next 0/3] and so on, in this case it's pretty obvious
though.

Generally the series looks fine and I'm glad you factored-out common
parts like the LED handling which is a great improvement also for the
older PHYs found in MT7530 and MT7531 as well as MT7621 and MT7623N.

Splitting the the 3rd patch into more atomic changes would make
reviewing a bit easier.

Also note that I've recently submitted some fixes for the LED support
which now have already been accepted to the net tree, see

https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/commit/?id=5b5f724b05c550e10693a53a81cadca901aefd16

So it might be the best to wait for the next round of rebase of net-next
before dealing with your suggested changes to spare maintainers from
having to deal with the merge conflicts otherwise.

Generally it'd also be nice to add support for the NO_LINK rule to the
netdev trigger, as it is supported by the hardware, but that can also be
done later obviously.


Cheers


Daniel

> 
> SkyLake.Huang (3):
>   net: phy: mediatek: Re-organize MediaTek ethernet phy drivers
>   net: phy: mediatek: Add mtk phy lib for token ring access & LED/other
>     manipulations
>   net: phy: mediatek: add support for built-in 2.5G ethernet PHY on
>     MT7988
> 
>  MAINTAINERS                                   |   7 +-
>  drivers/net/phy/Kconfig                       |  17 +-
>  drivers/net/phy/Makefile                      |   3 +-
>  drivers/net/phy/mediatek-ge.c                 | 111 ----
>  drivers/net/phy/mediatek/Kconfig              |  33 ++
>  drivers/net/phy/mediatek/Makefile             |   5 +
>  drivers/net/phy/mediatek/mtk-2p5ge.c          | 399 +++++++++++++
>  .../mtk-ge-soc.c}                             | 522 ++++++++----------
>  drivers/net/phy/mediatek/mtk-ge.c             | 191 +++++++
>  drivers/net/phy/mediatek/mtk-phy-lib.c        | 330 +++++++++++
>  drivers/net/phy/mediatek/mtk.h                |  97 ++++
>  11 files changed, 1277 insertions(+), 438 deletions(-)
>  delete mode 100644 drivers/net/phy/mediatek-ge.c
>  create mode 100644 drivers/net/phy/mediatek/Kconfig
>  create mode 100644 drivers/net/phy/mediatek/Makefile
>  create mode 100644 drivers/net/phy/mediatek/mtk-2p5ge.c
>  rename drivers/net/phy/{mediatek-ge-soc.c => mediatek/mtk-ge-soc.c} (79%)
>  create mode 100644 drivers/net/phy/mediatek/mtk-ge.c
>  create mode 100644 drivers/net/phy/mediatek/mtk-phy-lib.c
>  create mode 100644 drivers/net/phy/mediatek/mtk.h
> 
> -- 
> 2.18.0
> 

