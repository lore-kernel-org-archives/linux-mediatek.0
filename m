Return-Path: <SRS0=47V3=CG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1042C433E6
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 10:58:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D62720B80
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 10:58:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XFOg1vBl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="W2SRH6AO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D62720B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X0x1PE+u4KTOYkKSk18QAzyCbyk+JMezfEEFylMPFSI=; b=XFOg1vBl4YeOjrlNbRjuxXjED
	zLf+nKw9qK80scPYGx4cXlz9L4oBIoFPEoJhDsqkbOYCbIHXJQSGVL5Mw2FzHv4LAvfQZhQUp4zXQ
	n8bE1zNCP2nCBTT4jbHL+GVpILL22y7AsPpFnYyeWdbaquG+ehoBSXacNkii2A8VOCKE2LTNSz6EE
	Szd/VZmLOAcTh7c6HCSGDjyKJOYpPSikfbfql3tg3fPLWr7MyqUthVk3lbs+9J8RdEJJwZ0Y9/1Kf
	REEqaq6aLwcOnKo8qdozqHmed9LyWNZC6v5iemDaYEImh6XUhfNS/zOZNPOeCFlQQEzY1+9pLf4Y4
	aY+JL+78Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBc58-0001QJ-77; Fri, 28 Aug 2020 10:58:06 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBc54-00015z-P6; Fri, 28 Aug 2020 10:58:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VvK78WVDOB3813Y9VLnOVQrDFYwjVa9aFCav/Nofmnw=; b=W2SRH6AOPaKUfD9lJTMH/8ZOW
 1iE6bQ42dKp3h1cxCL1qnFCgb+OmMljBByQ9uGG2E4Cf5eopnJkHU24G2GWXk3QTeoLLNzVwA4Frl
 WjJHzCPTILWzgvGb/ZA2iEuG4mZFI2QZwWQNOIv/WT4FUKmvsu8oTLxRVLfxC4Mx/k3S4RseDs1yo
 C8Y3GVQlaHe818nHBnIdW021cefuYbuWfIXKhprFK2rzIW2TR6IVB2W9uGoZs93Rx9si6cfy4OSLN
 A7HffXipNvMdJbtccxSA1uMGdmCAbvPnQORy2mOM8y77xROqGywyoqswsb4uYbzJEbja9DTKietQd
 5I1QMHkFA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58158)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1kBc20-0005uF-Hw; Fri, 28 Aug 2020 11:54:52 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1kBc1u-00034A-V9; Fri, 28 Aug 2020 11:54:46 +0100
Date: Fri, 28 Aug 2020 11:54:46 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Landen Chao <landen.chao@mediatek.com>
Subject: Re: [PATCH net v2] net: dsa: mt7530: fix advertising unsupported
 1000baseT_Half
Message-ID: <20200828105446.GK1551@shell.armlinux.org.uk>
References: <20200828105244.9839-1-landen.chao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200828105244.9839-1-landen.chao@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_065802_845531_C7E338FF 
X-CRM114-Status: GOOD (  20.86  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 frank-w@public-files.de, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 dqfext@gmail.com, opensource@vdorst.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Aug 28, 2020 at 06:52:44PM +0800, Landen Chao wrote:
> Remove 1000baseT_Half to advertise correct hardware capability in
> phylink_validate() callback function.
> 
> Fixes: 38f790a80560 ("net: dsa: mt7530: Add support for port 5")
> Signed-off-by: Landen Chao <landen.chao@mediatek.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

Reviewed-by: Russell King <rmk+kernel@armlinux.org.uk>

Thanks.

> ---
> v1->v2
>   - fix the commit subject spilled into the commit message
> ---
>  drivers/net/dsa/mt7530.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 8dcb8a49ab67..238417db26f9 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -1501,7 +1501,7 @@ static void mt7530_phylink_validate(struct dsa_switch *ds, int port,
>  		phylink_set(mask, 100baseT_Full);
>  
>  		if (state->interface != PHY_INTERFACE_MODE_MII) {
> -			phylink_set(mask, 1000baseT_Half);
> +			/* This switch only supports 1G full-duplex. */
>  			phylink_set(mask, 1000baseT_Full);
>  			if (port == 5)
>  				phylink_set(mask, 1000baseX_Full);
> -- 
> 2.17.1
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
