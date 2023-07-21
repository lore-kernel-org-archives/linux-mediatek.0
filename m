Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F98FEB64DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 16:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYqUPAIrSyIKACoBmdRKGbmnsQL3FDwv+JyaUfS+PO4=; b=ViO1upsA5jVRpB1KhAVsEJRDbL
	Jy8w4Xjk8skXn4wjcHofYWL/TkHo/l7EGt2rZHe9jdnHKyiVKgozn5iqXDIA/gULwaEtilsXenuxC
	rCON//XxUp9DS2dy8JYramyS6gzVh7Rsh+34lWwR238QUIBsvobhknGW95WCYqX/jNGvhbY8igiOw
	UmFHUKMLyALP8Ydh1nnLqFFwpMOE42Ij8Xr5LUQdF6tlw58uTscY3qciP6KJ12sldWrfF+lqZXXoo
	PBwGdoEipf86nr8Czi+VvtVxogS0qLDS8Xqgc5jzMmpCnIxJKuBkesHkVQ/mzb4+V+60KE4eIbEHG
	fffSYDPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMt9A-00Ec7Q-2a;
	Fri, 21 Jul 2023 16:38:28 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMt97-00Ec6O-0W;
	Fri, 21 Jul 2023 16:38:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HYqUPAIrSyIKACoBmdRKGbmnsQL3FDwv+JyaUfS+PO4=; b=VXRjkr/YMXtrNWUpXn2rMP3W7C
	OVoKIkRL7BktJwrlCexnilWy237xXIbDGjAXqongcW1zu5vEpD4CbRP5ZI1B18B6fG8ElibIGnmhy
	HMGxD2PSuhEP7u9QxprgeaRsm9740+NONo/9m7/hjyigyzSOETj2MqnA9HoSZ5YnSlycxSWRQtg/j
	V1l4HLfKSpG6BWye3StGuB+idR9C6te5WmMoqEGFUyNbvTvH5+sP7udnZmbEA3utvrT8hvv2CY9Vy
	gAmmOPxQVfkhG8i/XbOVzy8FiUPaAZPYHP6hVbt66InT9Rs6xJ3LY361oAe/ELAf+pMFLBHU7ZbPD
	PTgQ6Azw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53220)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qMt8u-0004LR-1O;
	Fri, 21 Jul 2023 17:38:12 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qMt8o-0006HJ-M8; Fri, 21 Jul 2023 17:38:06 +0100
Date: Fri, 21 Jul 2023 17:38:06 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	DanielGolle <daniel@makrotopia.org>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	David Woodhouse <dwmw@amazon.co.uk>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Felix Fietkau <nbd@nbd.name>,
	Jakub Kicinski <kuba@kernel.org>, John Crispin <john@phrozen.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH net-next 0/4] Remove legacy phylink behaviour
Message-ID: <ZLq0btX7K/ynfb16@shell.armlinux.org.uk>
References: <ZLptIKEb7qLY5LmS@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZLptIKEb7qLY5LmS@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_093825_205637_D52C523F 
X-CRM114-Status: GOOD (  19.06  )
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

On Fri, Jul 21, 2023 at 12:33:52PM +0100, Russell King (Oracle) wrote:
> Hi,
> 
> This series removes the - as far as I can tell - unreachable code in
> mtk_eth_soc that relies upon legacy phylink behaviour, and then removes
> the support in phylink for this legacy behaviour.
> 
> Patch 1 removes the clocking configuration from mtk_eth_soc for non-
> TRGMII, non-serdes based interface modes, and disables those interface
> modes prior to phylink configuration.
> 
> Patch 2 removes the mac_pcs_get_state() method from mtk_eth_soc which
> I believe is also not used - mtk_eth_soc appears not to be used with
> SFPs (which would use a kind of in-band mode) nor does any DT appear
> to specify in-band mode for any non-serdes based interface mode.
> 
> With both of those dealt with, the kernel is now free of any driver
> relying on the phylink legacy mode. Therefore, patch 3 removes support
> for this.
> 
> Finally, with the advent of a new driver being submitted today that
> makes use of state->speed in the mac_config() path, patch 4 ensures that
> any phylink_link_state member that should not be used in mac_config is
> either cleared or set to an invalid value.

Note: probably be a good idea for the mtk_eth_soc people to review and
ack before applying this to net-next.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

