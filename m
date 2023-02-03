Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87073C61DA4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 14:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+WH7VJ9ND/1v/0aCLXgBANRi0NIzyJ1wTqtN9ZDhZj0=; b=xvGA2mMi7iMMycxxHcoZzZiz75
	nFVPJA4Wrb3ANi+jqpdqKB8g0BCjd4hFF5c0A0eHwDkoJwq34Ol00NVOO2sAxdMUZlo/qgTF9CP12
	WHE0gDniiRhmCPEZZoshflhfsHryruhyvaCNjRf7BK4Iy0VZuOpB5j96GZOMLk+DeAMBFKuvS3TV7
	gUw6uo8yy0n4qOuLMU1ckMxJx2wi5QRLU4iJ7q37B+JRpacShujduddM3ePlC9WljBNG4GyKFCBof
	z3tNnbr0MX7AvSdfN6iZMld3ksMfcVEzC4PNo92eGEUeWfQ0JEDzl/DSSI22smcraO8bslD6bWAFj
	VZAP0oYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNwy4-002NsM-Mh; Fri, 03 Feb 2023 14:23:08 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNwcG-002Cuh-EI; Fri, 03 Feb 2023 14:00:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+WH7VJ9ND/1v/0aCLXgBANRi0NIzyJ1wTqtN9ZDhZj0=; b=fIup/wPpDa41mxDnPJ8ns94Rbb
	a0fBPiiaSoivpGrzzPyRj4l7XDxbmD577qMeTbQM/3yw0assltKmE8T8YjqrqKaZY2jUdsKUCYJMd
	hELsL527i/b2Dhgdnjs1Ibq17La59+1+USIBHspASs2TXsyt8xJJyRysKGP3c1pMEhas=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pNwc1-0040Ke-IW; Fri, 03 Feb 2023 15:00:21 +0100
Date: Fri, 3 Feb 2023 15:00:21 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
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
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Jianhui Zhao <zhaojh329@gmail.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Subject: Re: [PATCH 1/9] net: ethernet: mtk_eth_soc: add support for MT7981
 SoC
Message-ID: <Y90TdTBPvQzV46H8@lunn.ch>
References: <cover.1675407169.git.daniel@makrotopia.org>
 <301fa3e888d686283090d58a060579d8c2a5bebb.1675407169.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <301fa3e888d686283090d58a060579d8c2a5bebb.1675407169.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_060036_519281_D20F44D2 
X-CRM114-Status: UNSURE (   9.61  )
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

On Fri, Feb 03, 2023 at 07:00:21AM +0000, Daniel Golle wrote:
> The MediaTek MT7981 SoC comes two 1G/2.5G SGMII, just like MT7986.
> 
> In addition MT7981 comes with a built-in 1000Base-T PHY which can be
> used with GMAC1.
> 
> As many MT7981 boards make use of swapping SGMII phase and neutral, add
> new device-tree attribute 'mediatek,pn_swap' to support them.

Is this new property documented in the device tree binding?

   Andrew

