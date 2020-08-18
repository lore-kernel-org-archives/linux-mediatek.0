Return-Path: <SRS0=p+jW=B4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96718C433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 15:56:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6987F2080C
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 15:56:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="w26pccmQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6987F2080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ikQ3cBxlfSw9cyvZ3lywo1Xvw8ZaRpZ1TL8BGJV4+vc=; b=w26pccmQDiw1T5A+NPc6FsuEf
	nLsnngKkSmewZP+/MzhdrcEypBtQhfwC/oMwywGXh70wjzNV6aZ3iAPNzhR1y5WaMQ1sjIWY7qNe2
	xBzvCb+M+VdeTerh+cMocMp4aTb42Mmyovi9oAWA73a33cb7D6QdC5Kiva0HKgJjnPiSeVfWVO7d3
	2dpcC5aSJWixQnqn5FsoVFWKij6JbhOC3HEOsFkgVeVyCnb08XfNGM37M0LeVB2qgkw36kEAkkYNo
	fOWsqLFwfG3AFd+esBf2BSc7U6JrqD9Hg0r5bEVyrxk5KOWhsRh0Ccx7Unev7LxC4wfZ4JbLKOwt3
	favWXp9FA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k83yO-0000xp-Oj; Tue, 18 Aug 2020 15:56:28 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k83yN-0000x6-HU
 for linux-mediatek@lists.infradead.org; Tue, 18 Aug 2020 15:56:28 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1k83yH-009vuo-8G; Tue, 18 Aug 2020 17:56:21 +0200
Date: Tue, 18 Aug 2020 17:56:21 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Landen Chao <landen.chao@mediatek.com>
Subject: Re: [PATCH net-next v2 3/7] net: dsa: mt7530: Extend device data
 ready for adding a new hardware
Message-ID: <20200818155621.GE2330298@lunn.ch>
References: <cover.1597729692.git.landen.chao@mediatek.com>
 <a56f3029b913d31fbd27562b98d485e981815165.1597729692.git.landen.chao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a56f3029b913d31fbd27562b98d485e981815165.1597729692.git.landen.chao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200818_115627_660873_ECB5723A 
X-CRM114-Status: GOOD (  16.52  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, frank-w@public-files.de,
 f.fainelli@gmail.com, dqfext@gmail.com, vivien.didelot@savoirfairelinux.com,
 netdev@vger.kernel.org, sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 opensource@vdorst.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Aug 18, 2020 at 03:14:08PM +0800, Landen Chao wrote:
> Add a structure holding required operations for each device such as device
> initialization, PHY port read or write, a checker whether PHY interface is
> supported on a certain port, MAC port setup for either bus pad or a
> specific PHY interface.
> 
> The patch is done for ready adding a new hardware MT7531.
> 
> Signed-off-by: Landen Chao <landen.chao@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/net/dsa/mt7530.c | 272 +++++++++++++++++++++++++++++----------
>  drivers/net/dsa/mt7530.h |  37 +++++-
>  2 files changed, 240 insertions(+), 69 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 0fd50798aa42..d30b41725b4d 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -372,8 +372,9 @@ mt7530_fdb_write(struct mt7530_priv *priv, u16 vid,
>  		mt7530_write(priv, MT7530_ATA1 + (i * 4), reg[i]);
>  }
>  
> +/* Setup TX circuit incluing relevant PAD and driving */
>  static int
> -mt7530_pad_clk_setup(struct dsa_switch *ds, int mode)
> +mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
>  {
>  	struct mt7530_priv *priv = ds->priv;
>  	u32 ncpo1, ssc_delta, trgint, i, xtal;
> @@ -387,7 +388,7 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, int mode)
>  		return -EINVAL;
>  	}
>  
> -	switch (mode) {
> +	switch (interface) {
>  	case PHY_INTERFACE_MODE_RGMII:
>  		trgint = 0;
>  		/* PLL frequency: 125MHz */

Do you actually need to support all 4 RGMII modes?

...

+			goto unsupported;
> +		break;
> +	case 6: /* 1st cpu port */
> +		if (state->interface != PHY_INTERFACE_MODE_RGMII &&
> +		    state->interface != PHY_INTERFACE_MODE_TRGMII)

phy_interface_mode_is_rgmii()?

	Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
