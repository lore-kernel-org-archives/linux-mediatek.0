Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4F3C678D4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Mar 2023 00:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZbWqbAYV0DpqH8DRo0/9v/OUsMvk34uYpySVI9K9W4=; b=hflQ/LLESMRy9Cod2B5tGnkDLq
	l8KKihWBLxjuZJ1B9phXKoKv8mqZpw6nmtO8I9fBVxRisxHvk6x8toH59Xpgm/jUCviKkpa1/36VU
	RnhZUGNa2PNrPQRcUZv+mEimLyekiSgCs8aWGMuD1nc1aKp2acWO1IcccQikZdqSiEOGxRFxiRBOW
	mLd/nMq4L7pDhX1mT4k1bHKtvr0eq8z6LNeeItIHMHk7Z0ok2fKljzeud5pxX26gXFY9+gCpEs/nT
	EG8Wk3f+VgV2eOFYle3oSVY1C3cQ45KxchATUpJ6GCjZHHlAPxRD5k6T80A0eA6xtedDW68DbQJs0
	X+B8uc8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXWQZ-000Khs-3z; Thu, 02 Mar 2023 00:04:07 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXWQV-000Kg9-Ow; Thu, 02 Mar 2023 00:04:05 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pXWQH-0000kl-0o;
	Thu, 02 Mar 2023 01:03:49 +0100
Date: Thu, 2 Mar 2023 00:03:45 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Jianhui Zhao <zhaojh329@gmail.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Subject: Re: [RFC PATCH v11 08/12] net: ethernet: mtk_eth_soc: fix RX data
 corruption issue
Message-ID: <Y//n4R2QuWvySDbg@makrotopia.org>
References: <cover.1677699407.git.daniel@makrotopia.org>
 <9a788bb6984c836e63a7ecbdadff11a723769c37.1677699407.git.daniel@makrotopia.org>
 <20230301233121.trnzgverxndxgunu@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230301233121.trnzgverxndxgunu@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_160403_851883_5BBADE2A 
X-CRM114-Status: GOOD (  16.78  )
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

On Thu, Mar 02, 2023 at 01:31:21AM +0200, Vladimir Oltean wrote:
> On Wed, Mar 01, 2023 at 07:55:05PM +0000, Daniel Golle wrote:
> > Also set bit 12 which disabled the RX FIDO clear function when setting up
> > MAC MCR, as MediaTek SDK did the same change stating:
> > "If without this patch, kernel might receive invalid packets that are
> > corrupted by GMAC."[1]
> > This fixes issues with <= 1G speed where we could previously observe
> > about 30% packet loss while the bad packet counter was increasing.
> > 
> > [1]: https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/d8a2975939a12686c4a95c40db21efdc3f821f63
> > Tested-by: Bjørn Mork <bjorn@mork.no>
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> 
> Should this patch be submitted separately from the series, to the
> net.git tree, to be backported to stable kernels?

Maybe yes, as this issue may affect e.g. the BPi-R3 board when used
with 1G SFP modules. Previously this has just never been a problem as
all practically all boards with MediaTek SoCs using SGMII also use the
MediaTek MT7531 switch connecting in 2500Base-X mode.

Should the Fixes:-tag hence reference the commit adding support for the
BPi-R3?

