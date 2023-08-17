Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D88C27C7A
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Aug 2023 13:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NGHE/p4sCN/7vLHlmX0J+FqvhKQ1k35l/n9hGy5/t7c=; b=LKghzivKW/6r978N5XQlwC/RYA
	rmsYT+BBB9GEUxDGmgrCiP+I8ygasSZyEQS4OrnicDFoivgXb1t0Ziq4ckYMHB4YG9R+4qduMijRK
	DmI34BtWSW8X6g30T5RZclrcEXSHEYvnm+XSpGmpDoVCXRP5Dv0xPDq/W4wg3A0hEpLBL4gjZK7Jk
	TCacX8JCXEiNOqqvmHBbBfEUGWuFmCUAyZBh2pS9PtpeCyCWd4NP9WR+ztpB36aok13jL1bczCbKI
	7IjcCLcnohbfstxF0wHTG9fWMEl1AgpY7eYvExGwLP4QF9NlDUEvSXhw0+e+h3Nb5L5aVJ4XzYB24
	5ZKO6vIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWcp1-006RN8-3D;
	Thu, 17 Aug 2023 13:13:56 +0000
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWcoy-006RM1-14;
	Thu, 17 Aug 2023 13:13:53 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 463AE2186F;
	Thu, 17 Aug 2023 13:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1692278025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NGHE/p4sCN/7vLHlmX0J+FqvhKQ1k35l/n9hGy5/t7c=;
	b=XATF+sc2ch6jyL/Ol3PBJJrxuZy/17xDRjLCXeNYd/uwMJ9cFkmb/B5FxUdDGdWbcjZSQc
	LGGC0yXo6eYLlVc7lnjiyoz/CdoOD/v+slsPtPSd8SnBc1bwsDvSu9ugKIX8ItoNJyASdG
	Nj+TqJBPWzOGgKztFEu9EbQiYiokeL4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692278025;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NGHE/p4sCN/7vLHlmX0J+FqvhKQ1k35l/n9hGy5/t7c=;
	b=xzwuIRVlHRiYyaurPVGprTL3wIO4zWyUCB2BWFYfr96ExKvodWemqZxLwOY3DZuScNJ+iN
	WZS+SG96HGLGXuDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1892D1392B;
	Thu, 17 Aug 2023 13:13:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id vCQuBQkd3mTvdwAAMHmgww
	(envelope-from <dkirjanov@suse.de>); Thu, 17 Aug 2023 13:13:45 +0000
Message-ID: <565a8248-c4d1-f135-2499-6bbfe76def53@suse.de>
Date: Thu, 17 Aug 2023 16:13:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH net-next] net: pcs: lynxi: fully reconfigure if link is
 down
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, Alexander Couzens <lynxis@fe80.eu>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <e9831ec99acd5a8ab03c76fce87fa750c7041e60.1692273723.git.daniel@makrotopia.org>
From: Denis Kirjanov <dkirjanov@suse.de>
In-Reply-To: <e9831ec99acd5a8ab03c76fce87fa750c7041e60.1692273723.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_061352_536540_CEB85EF3 
X-CRM114-Status: GOOD (  25.62  )
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



On 8/17/23 15:04, Daniel Golle wrote:
> On MT7988 When switching from 10GBase-R/5GBase-R/USXGMII to one of the
> interface modes provided by mtk-pcs-lynxi we need to make sure to
> always perform a full configuration of the PHYA.
> As the idea behind not doing that was mostly to prevent an existing link
> going down without any need for it to do so. Hence we can just always
> perform a full confinguration in case the link is down.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  drivers/net/pcs/pcs-mtk-lynxi.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/pcs/pcs-mtk-lynxi.c b/drivers/net/pcs/pcs-mtk-lynxi.c
> index b0f3ede945d96..788c2ccde064e 100644
> --- a/drivers/net/pcs/pcs-mtk-lynxi.c
> +++ b/drivers/net/pcs/pcs-mtk-lynxi.c
> @@ -108,8 +108,8 @@ static int mtk_pcs_lynxi_config(struct phylink_pcs *pcs, unsigned int neg_mode,
>  				bool permit_pause_to_mac)
>  {
>  	struct mtk_pcs_lynxi *mpcs = pcs_to_mtk_pcs_lynxi(pcs);
> -	bool mode_changed = false, changed;
> -	unsigned int rgc3, sgm_mode, bmcr;
> +	bool mode_changed = false, changed, link;
> +	unsigned int bm, rgc3, sgm_mode, bmcr;
>  	int advertise, link_timer;
>  
>  	advertise = phylink_mii_c22_pcs_encode_advertisement(interface,
> @@ -117,6 +117,10 @@ static int mtk_pcs_lynxi_config(struct phylink_pcs *pcs, unsigned int neg_mode,
>  	if (advertise < 0)
>  		return advertise;
>  
> +	/* Check if link is currently up */
> +	regmap_read(mpcs->regmap, SGMSYS_PCS_CONTROL_1, &bm);
> +	link = !!(FIELD_GET(SGMII_BMSR, bm) & BMSR_LSTATUS);
> +
>  	/* Clearing IF_MODE_BIT0 switches the PCS to BASE-X mode, and
>  	 * we assume that fixes it's speed at bitrate = line rate (in
>  	 * other words, 1000Mbps or 2500Mbps).
> @@ -137,7 +141,10 @@ static int mtk_pcs_lynxi_config(struct phylink_pcs *pcs, unsigned int neg_mode,
>  		bmcr = 0;
>  	}
>  
> -	if (mpcs->interface != interface) {
> +	/* Do a full reconfiguration only if the link is down or the interface
> +	 * mode has changed
> +	 */
> +	if (mpcs->interface != interface || !link) {

btw is it a thread-safe to check the mpcs->interface member?
I've quick checked and phylink_pcs_config can be invoked from different places
and the code below does the following assignment:
mpcs->interface = interface;



>  		link_timer = phylink_get_link_timer_ns(interface);
>  		if (link_timer < 0)
>  			return link_timer;

