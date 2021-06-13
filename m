Return-Path: <SRS0=gblj=LH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40AE9C48BDF
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Jun 2021 12:23:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B59FE61264
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Jun 2021 12:23:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B59FE61264
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YyVL20zMCmu67Nm3Ve2Se85YKyj7NActAa8xZhla6Pc=; b=fMGRqOOThgMudM
	Hb6tHyM8gKAD+Ns1sN41XFe668IixnefgipDlL9CJiTnMSuz3larqvlFQcZsPplQcU8hu3j9BpT4R
	c96a8Iv2tmzOC2NjYEV5VzWoiUQ6F/uPAPWN/kpF4pITysT/rQa9yQKuiy2bu2kbIDSqC5uXvc5aB
	//j8bwXAk+ctpr7pq1LNZ9UphfdO/BEDEPk8x+uTTOVbDPMZn+SuZcyyigVxkCV2awMotDPsa0jgw
	Dcm5q4opB/sJB7v5q2SRhDZWZ2A3h51mvcm6vQKE9OUBr0h6jhuni3Dn1zrpWsiofhifwcyrPy4wE
	xc9op0PkcqrcPAb8bsvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsP8k-00AQ48-Ry; Sun, 13 Jun 2021 12:22:58 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsP8h-00APxT-BN; Sun, 13 Jun 2021 12:22:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mmyFe4CD1HqfyTgZipLbaHYfBnHjTeV2soAr4WgrLn0=; b=Jcam4PNyqOrWoyMZeEHGBppGG
 BjX0jmsrgghgEF+xxiDoIxtfzSsIPtPWurfL4igsI+46/HXriPp/D4Pf20YFn7v0+XNdhq56CjozY
 J0k/br+tWAkH6oTceb3MwPrS8WnU/5D9Jy27AhtXoWSOWu2jrUfY4Xwa6Zb9KIzKdNlsk50wP46Od
 +uxthAQoD+TGMKdenzFsJ/lhNhP7XIY+O8eBnhy6H7xx4esZd/gM9L59bTyuUC3aGGvQOHbUJUZXw
 c/95MON/iYMlZYQUyZ5Sg6qfbw/vYUZP8QomsBWaYS9vSeAd71uT8HH0b1u83lc45YIKaMtIPJgGG
 wFIl+zBMw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44976)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1lsP6e-0003N9-DD; Sun, 13 Jun 2021 13:20:48 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1lsP6Z-0003BA-Cn; Sun, 13 Jun 2021 13:20:43 +0100
Date: Sun, 13 Jun 2021 13:20:43 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Reto Schneider <code@reto-schneider.ch>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, Stefan Roese <sr@denx.de>,
 Reto Schneider <reto.schneider@husqvarnagroup.com>,
 "David S. Miller" <davem@davemloft.net>,
 Felix Fietkau <nbd@nbd.name>, Jakub Kicinski <kuba@kernel.org>,
 John Crispin <john@phrozen.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] net: ethernet: mtk_eth_soc: Support custom ifname
Message-ID: <20210613122043.GP22278@shell.armlinux.org.uk>
References: <20210613115820.1525478-1-code@reto-schneider.ch>
 <20210613115820.1525478-2-code@reto-schneider.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210613115820.1525478-2-code@reto-schneider.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210613_052255_414808_78C28BA4 
X-CRM114-Status: GOOD (  15.61  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Jun 13, 2021 at 01:58:19PM +0200, Reto Schneider wrote:
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index 64adfd24e134..8bb09801918f 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -2948,6 +2948,7 @@ static const struct net_device_ops mtk_netdev_ops = {
>  static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
>  {
>  	const __be32 *_id = of_get_property(np, "reg", NULL);
> +	const char *const name = of_get_property(np, "label", NULL);
>  	phy_interface_t phy_mode;
>  	struct phylink *phylink;
>  	struct mtk_mac *mac;
> @@ -3020,6 +3021,9 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
>  
>  	mac->phylink = phylink;
>  
> +	if (name)
> +		strncpy(eth->netdev[id]->name, name, IFNAMSIZ);

Please don't use strncpy() - this is a good example why strncpy() is bad
news.

 * strncpy - Copy a length-limited, C-string
 * @dest: Where to copy the string to
 * @src: Where to copy the string from
 * @count: The maximum number of bytes to copy
 *
 * The result is not %NUL-terminated if the source exceeds
 * @count bytes.

Consequently, if "name" is IFNAMSIZ bytes or longer,
eth->netdev[id]->name will not be NUL terminated, and subsequent use
will run off the end of the string. strscpy() is safer to use here.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
