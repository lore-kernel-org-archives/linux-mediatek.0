Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1FBC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 13:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kvr1Mx8dRiFKwnZzVn5gzrbCzK421whz+IlIsA7Qb0M=; b=NdTZPXXrAsGZVN
	NuzbekAmEN24DET+km/FSQwVy4/ze4bItW2EOtzV+cBR1qdze8BYv4UDNKAjhW1GCIx8oJXYOGVUW
	IRVVRkG4CTLDjN4tcsKAbe9vn2haF694IFz63mao4zZmZdURHZ1YJlnVj1HZBfSQftsDsY7iZJLiZ
	tWgFGAPnO0uC5Sbz6vP9S83ANgnFG4kIAteQaXkDEtfJbaHf49SoJ/XrtSzoHWBUD9IcJjjeqsEQ2
	3HeU+x1jqczpZbvIJ+N/LnPoLAOG2UHWMvvdg8TBLAoMwNc3p1+7jAwGH49vrscE+OWDQJ9nJp8kV
	D0QLODRkZv+TG30+MfdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvJGf-00G2rg-TJ; Thu, 09 Dec 2021 13:15:25 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvJGL-00G2it-FR; Thu, 09 Dec 2021 13:15:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7rc2LETThfTw6UpoMBQEPgeN7FitD8uA5UkWVs/Zubk=; b=K91ztcXOnsrD889e7JOdV9n8xS
 m2xAx3Zk41Vpkxb5j27pf6eaJplgxJrTO6UxIiHEXYJ4jBo34ybX7vldTXr5MwmNz0HWXQvTD002F
 vkET4YPYrSW3vIHnEMYu26HJRbJdiGBiDRQy+CEfIDmNty2QFzJqPsH4YexOBSRqOgtKs//EcY1hu
 H9GQhRvQ+Vg1WnxLW83nQpznvZaDKpkg1tTDJ7M9kW1CgLOwm3xwjO8hM672vVC5QB3FTK+57dsiN
 qGnNHpFbcof814+mKxfbuCRzNNDp5vKXl4QNqynwvQx6FU4uxZYHm9f9Cgc7fOFuYdLskaWnWuCa2
 p+wW3Qow==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56196)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1mvJGE-0008UR-PG; Thu, 09 Dec 2021 13:14:58 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1mvJGB-0007F8-TU; Thu, 09 Dec 2021 13:14:56 +0000
Date: Thu, 9 Dec 2021 13:14:55 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Chris Snook <chris.snook@gmail.com>, Felix Fietkau <nbd@nbd.name>,
 Florian Fainelli <f.fainelli@gmail.com>, John Crispin <john@phrozen.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 1/5] net: phylink: add legacy_pre_march2020
 indicator
Message-ID: <YbIBT7/6b0evemPB@shell.armlinux.org.uk>
References: <DGaGmGgWrlVkW@shell.armlinux.org.uk>
 <E1mucmf-00EyCl-KA@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1mucmf-00EyCl-KA@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_051505_563760_D4EBB022 
X-CRM114-Status: GOOD (  25.20  )
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

This series was incorrectly threaded to its cover letter; the patches
have now been re-sent with the correct message-ID for their cover
letter. Sadly, this mistake was not obvious until I looked at patchwork
to work out why they haven't been applied yet.

On Tue, Dec 07, 2021 at 03:53:37PM +0000, Russell King (Oracle) wrote:
> Add a boolean to phylink_config to indicate whether a driver has not
> been updated for the changes in commit 7cceb599d15d ("net: phylink:
> avoid mac_config calls"), and thus are reliant on the old behaviour.
> 
> We were currently keying the phylink behaviour on the presence of a
> PCS, but this is sub-optimal for modern drivers that may not have a
> PCS.
> 
> This commit merely introduces the new flag, but does not add any use,
> since we need all legacy drivers to set this flag before it can be
> used. Once these legacy drivers have been updated, we can remove this
> flag.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  include/linux/phylink.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/linux/phylink.h b/include/linux/phylink.h
> index 01224235df0f..d005b8e36048 100644
> --- a/include/linux/phylink.h
> +++ b/include/linux/phylink.h
> @@ -84,6 +84,8 @@ enum phylink_op_type {
>   * struct phylink_config - PHYLINK configuration structure
>   * @dev: a pointer to a struct device associated with the MAC
>   * @type: operation type of PHYLINK instance
> + * @legacy_pre_march2020: driver has not been updated for March 2020 updates
> + *	(See commit 7cceb599d15d ("net: phylink: avoid mac_config calls")
>   * @pcs_poll: MAC PCS cannot provide link change interrupt
>   * @poll_fixed_state: if true, starts link_poll,
>   *		      if MAC link is at %MLO_AN_FIXED mode.
> @@ -97,6 +99,7 @@ enum phylink_op_type {
>  struct phylink_config {
>  	struct device *dev;
>  	enum phylink_op_type type;
> +	bool legacy_pre_march2020;
>  	bool pcs_poll;
>  	bool poll_fixed_state;
>  	bool ovr_an_inband;
> -- 
> 2.30.2
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
