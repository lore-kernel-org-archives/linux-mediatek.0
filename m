Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E071EB64DD
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 22:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZD091DWd/4BLP9jhdzwlagcKzQmrEYrxIoPI9X2NOo=; b=P31eA/rPHP+N8/kVSSs6eBq7CK
	wwyIdXfyfZsFleCl2PP+fs3XWXDzunquwPJfn4JLBRlul99zbMu6e08sl1NwG6pexDnlCcG1raDVw
	512WYmj36CpKetHwbytZY6O6zcgOyo5saeKB5mvbYm0xyuhImZ0fAmWFtHchWgmbwxNcLcalrSY94
	OOFFOkYd2Oo1M6djwG480thQW04HXsWuwrdw7fSSBnJ/JQhlPtYVmD/Y1X0Mwo7VRa3LhY2pzpxG9
	nUkrYQYsvKtIlKDEX8J9x7nPMKIdIPY4Z96red/TYQFdYmLcEOGl9iEaqYiZ3LxOYeDiFHIED3/6E
	uK8QeE5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMyo6-00FILQ-10;
	Fri, 21 Jul 2023 22:41:06 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMyo1-00FIJw-2y;
	Fri, 21 Jul 2023 22:41:04 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qMyna-0004qC-13;
	Fri, 21 Jul 2023 22:40:34 +0000
Date: Fri, 21 Jul 2023 23:40:25 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next 0/4] Remove legacy phylink behaviour
Message-ID: <ZLsJWXyFJ0oKLkEq@makrotopia.org>
References: <ZLptIKEb7qLY5LmS@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZLptIKEb7qLY5LmS@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_154102_002830_7D24CD89 
X-CRM114-Status: GOOD (  21.09  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, Mark Lee <Mark-MC.Lee@mediatek.com>, Eric Dumazet <edumazet@google.com>, John Crispin <john@phrozen.org>, linux-arm-kernel@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>, Felix Fietkau <nbd@nbd.name>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>, David Woodhouse <dwmw@amazon.co.uk>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Russell,

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

Thank you for taking care of this!

For the whole series:

Reviewed-by: Daniel Golle <daniel@makrotopia.org>
Tested-by: Daniel Golle <daniel@makrotopia.org>

Tested on BPi-R2 (MT7623N), BPi-R3 (MT7986A) and BPi-R64 (MT7622A).
All works fine as expected.

To apply the series I needed to resolve a minor conflict due to
net: ethernet: mtk_ppe: add MTK_FOE_ENTRY_V{1,2}_SIZE macros
being applied in the meantime.


> 
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 94 +++++------------------------
>  drivers/net/ethernet/mediatek/mtk_eth_soc.h |  1 +
>  drivers/net/phy/phylink.c                   | 48 ++++++---------
>  include/linux/phylink.h                     | 45 ++------------
>  4 files changed, 42 insertions(+), 146 deletions(-)
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

