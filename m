Return-Path: <SRS0=aCep=CO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42844C43461
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Sep 2020 23:47:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D369920760
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Sep 2020 23:47:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nD6LTmD2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="J1v6d2SU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D369920760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EBCT724YcxeA2aaPSnPPMvqM8JyLePkEvVDoDfqxM4U=; b=nD6LTmD2mIAnQibRyFbH/q2hF
	z2le1beBMjfjCWUwwooCXvj/kHm5KnT6rSu5H3M24ZXNvZ52uhlfzyhpumWwiBsMexOczZIOMDaYV
	2p/ARkfpd280jMwh4mTGMJRoNV+4UczBl2oKlgt55vJ65EeA5SpqNw2KuBtjciTtbRL160WNhKVjN
	ngWU1+9OUf/YhU5qDkUgfzGoM1vhJiVW++Cz+Owbwp020oNDtM8gN6p75TrKgap/F0FkqLIv4kU3V
	I5/s8HLPloLwypHMNPzSE397sTB3aIxvZn6fXK2boRsnbviYL7hvaHRdBEWNGlQlEMUUmjSkDUTdC
	BXVSa7wKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEhtm-0004sa-AC; Sat, 05 Sep 2020 23:47:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEhti-0004rb-DU; Sat, 05 Sep 2020 23:47:07 +0000
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D3D8020760;
 Sat,  5 Sep 2020 23:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599349624;
 bh=Jc4C4306EMKNApeBOPwe0aG1NL20wAkllgNlUjKDkF4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=J1v6d2SUgIcy4tmkWlM8Km+S/gablUSqu8w/cx9InbPwTAQNPb4FWvt/4bJ0YpncB
 OFJFeKFWZtGltJ/Gjp9Uyhiq945U6JhIdfx13gYx/YtysNVHFN+Gw3tsYrQ26edzi8
 aUbaI5cAw5O3wuuFcZm9sHdaXZgHjDVRJ3tWrpVc=
Date: Sat, 5 Sep 2020 16:47:02 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Landen Chao <landen.chao@mediatek.com>
Subject: Re: [PATCH net-next v3 2/6] net: dsa: mt7530: Extend device data
 ready for adding a new hardware
Message-ID: <20200905164702.72edf26c@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <3cf9909d7b06346b8aa339c346e19585cccf74c8.1599228079.git.landen.chao@mediatek.com>
References: <cover.1599228079.git.landen.chao@mediatek.com>
 <3cf9909d7b06346b8aa339c346e19585cccf74c8.1599228079.git.landen.chao@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200905_194706_678594_A1C99203 
X-CRM114-Status: GOOD (  16.77  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, frank-w@public-files.de,
 Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, netdev@vger.kernel.org, dqfext@gmail.com,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>, opensource@vdorst.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 4 Sep 2020 22:21:57 +0800 Landen Chao wrote:
> +static bool
> +mt7530_phy_mode_supported(struct dsa_switch *ds, int port,
> +			  const struct phylink_link_state *state)
>  {
>  	struct mt7530_priv *priv = ds->priv;
> -	u32 mcr_cur, mcr_new;
>  
>  	switch (port) {
>  	case 0: /* Internal phy */
> @@ -1363,33 +1364,114 @@ static void mt7530_phylink_mac_config(struct dsa_switch *ds, int port,
>  	case 3:
>  	case 4:
>  		if (state->interface != PHY_INTERFACE_MODE_GMII)
> -			return;
> +			goto unsupported;

return false;

Jumping to a label which does nothing but returns makes the code less
readable.

>  		break;
>  	case 5: /* 2nd cpu port with phy of port 0 or 4 / external phy */
> -		if (priv->p5_interface == state->interface)
> -			break;
>  		if (!phy_interface_mode_is_rgmii(state->interface) &&
>  		    state->interface != PHY_INTERFACE_MODE_MII &&
>  		    state->interface != PHY_INTERFACE_MODE_GMII)
> -			return;
> +			goto unsupported;
> +		break;
> +	case 6: /* 1st cpu port */
> +		if (state->interface != PHY_INTERFACE_MODE_RGMII &&
> +		    state->interface != PHY_INTERFACE_MODE_TRGMII)
> +			goto unsupported;
> +		break;
> +	default:
> +		dev_err(priv->dev, "%s: unsupported port: %i\n", __func__,
> +			port);
> +		goto unsupported;
> +	}
> +
> +	return true;
> +
> +unsupported:
> +	return false;
> +}

> +static void
> +mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
> +			  const struct phylink_link_state *state)
> +{
> +	struct mt7530_priv *priv = ds->priv;
> +	u32 mcr_cur, mcr_new;
> +
> +	if (!mt753x_phy_mode_supported(ds, port, state))
> +		goto unsupported;
> +
> +	switch (port) {
> +	case 0: /* Internal phy */
> +	case 1:
> +	case 2:
> +	case 3:
> +	case 4:

case 0 ... 4:

> +		if (state->interface != PHY_INTERFACE_MODE_GMII)
> +			goto unsupported;
> +		break;
> +	case 5: /* 2nd cpu port with phy of port 0 or 4 / external phy */
> +		if (priv->p5_interface == state->interface)
> +			break;

> +static void
> +mt753x_phylink_validate(struct dsa_switch *ds, int port,
> +			unsigned long *supported,
> +			struct phylink_link_state *state)
> +{
> +	struct mt7530_priv *priv = ds->priv;
>  	__ETHTOOL_DECLARE_LINK_MODE_MASK(mask) = { 0, };

Please keep the variables longest to shortest (reverse xmas tree).

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
