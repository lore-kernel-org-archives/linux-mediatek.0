Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42770CCD1AB
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Oct 2025 15:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWO4yOCaMUYjGeCQQA0uyhzhbdrG4m6pu8cUif/JpM0=; b=e2IiZu8kiNgS4B7R5pNlLfz+mK
	DOTHtbRrR18hUePJuaYJl88q55xv036Bka3VVCTTVeWa76UUnEGhteRgMDJIz9MiftWB5TGKuyOGG
	XzkNL0tVrs1IaIFPm48nkfJ3PtrRD3BWP4SoiX1j5+WnvIuvDBCUOdBPAkml1wTO+GoVaThp6KlHO
	d7KvPS/YdweMtg2TmDRWk8tdUrOE6fxc1TLo41P/kLUmglfB1y3WuBUvMRcFdpt+19ecxoUoPEiag
	CdfiS3xm6fQftkvIZsxTMJrAtKAlbXpaP0LEYWdVa2GOE4LR/ic4nvO5bWE9nuWp6FiIWhVG5JhmH
	D6Q6kKvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBb4s-00000003Rsz-24Go;
	Wed, 22 Oct 2025 15:48:42 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBb4p-00000003Rru-01og
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Oct 2025 15:48:40 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4711b95226dso59772745e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Oct 2025 08:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761148117; x=1761752917; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XWO4yOCaMUYjGeCQQA0uyhzhbdrG4m6pu8cUif/JpM0=;
        b=lC2zIz+FmDnlBryjxudxniKGjYVMnY94fu0cXGJ+yRxm++vE2FJJA8KP42+ijipsRm
         uA1/gdbCqA17wfihyTJhH01WVwCvWtrbWevuuhhSsLBBzIlPb+kfBSk01HQIFzaV5Ylk
         j0enlYXWV6yjvMeYy0Vtss1/TNhZw4+dfEUHvx892YtHMD969/oxSByz7wi4q/5Pa2tC
         BRM4D8cvPDwYLyDQXAmyc/tWTn44XLODpNb7VJU2c1NPXxgitu9Gcr/r2w7u7ZtdcwFw
         gyeeBWRpbQRtfN0hYRKrn/6TljVg7A1iTCXj8rwYCYMJcTj1rz03DVaIkLtqV1Iz/F/h
         4veQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761148117; x=1761752917;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWO4yOCaMUYjGeCQQA0uyhzhbdrG4m6pu8cUif/JpM0=;
        b=gumEyH8I2IObbYX0gtF8eH+/LP8yyi7NhSHGZf5Eqlxl9UqAZyM/24wCrJ/VwMjf/8
         Hfsb0L7HjpiePYx8aTYq9BV54JzykYP3fHhUq6ppbRsTNuoN2LwbpQ001fPmo/RWXR86
         KI0eYkuy8RSeNA+K7EyWaOmTzees3haOQM1vUWDgAHnYYLH4r2X+gbBDGleuxHQYh+Aw
         Q8ri1hSx+xEiFg5WzoScn/BDHzqYCIX06PNmFbJi9wD15MBiK+6KoA3AUFY6VVcJz2zn
         fMH+Zs9dSFIavXYrJOja7JbRtAbRNK5cRsGv6Y2rg7QY/8pmZhAmaVoFQ5OXgX8miin0
         A3IQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4skubTL/XZj29vrFy8tTNj7M+0d7dUug54dXEDrpQYPpRtCDVyZshqD7I6d1pXzN/suRTTE3vX0wWPx5wLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzIQZI9MsDaYzxI4DfR4DP6fsq/1cPzA9FyiXx2AxUVBvfrbDm2
	SF1Ttelq8KerUxmWn5QZyNG46A5GFnjebjwBVldN74pFUF7bpVpADRPC
X-Gm-Gg: ASbGncst4SOxdcykWANvzPE9NaxUqfeqTFKkcB0A4BpNCk+7HK+oDapjpfo6GZFZzB6
	PdjxVgUYXZHEXrULEANWgp2bSEDcPxNN3ZCpsykbs6uS0Sju4fLKID/ge+Xy7ujq1zCfBKYRhq1
	K5keoUEQRBPi1BoFdptMNbUU+In5wOM4egdn8V6iGE8tRAd5nZMV1GnxsAgIsmQu8+gw7Ab9qZA
	Q7leOsifF4+YGrEqasSm+bE33Z0ia7Bt3SKUSIFpPZRVXnjDUgw42D7HNtoTWPp73pnp4q3zEsK
	gT+4aGQ7RvMabtBlJDbdDgJho2Zn/PVFdkYpJW0se/N6F2Pn3/b8+Gfxv6p17CC0YsRmFaE3RoL
	8J0MznLuLZMxKC9dvwZ/GhuGz7tHRHsV57DjBe6/izE3QHZMG7eW8qWPQfKT1YQLI61/bW8tdvA
	5fvdLWkjMp35ew09QLYYZR2vi0aLkeuleLUxpJbDY=
X-Google-Smtp-Source: AGHT+IHAoVbOJakh16O5eBX5PTSAHI2xQcrVoDpyDPxM5ZW2+gUYAv5HKBvRB8LcVZCJLd8co8c93A==
X-Received: by 2002:a5d:5d01:0:b0:428:55c3:cecc with SMTP id ffacd0b85a97d-42855c3d3femr1634009f8f.37.1761148116971;
        Wed, 22 Oct 2025 08:48:36 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00b97f8sm25309390f8f.36.2025.10.22.08.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 08:48:36 -0700 (PDT)
Message-ID: <68f8fcd4.df0a0220.60f68.1bc1@mx.google.com>
X-Google-Original-Message-ID: <aPj80atNusRChjjG@Ansuel-XPS.>
Date: Wed, 22 Oct 2025 17:48:33 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Simon Horman <horms@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH 2/2] net: airoha: add phylink support for GDM1
References: <20251021193315.2192359-1-ansuelsmth@gmail.com>
 <20251021193315.2192359-3-ansuelsmth@gmail.com>
 <aPj8J5ntvDGLPYaY@horms.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPj8J5ntvDGLPYaY@horms.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_084839_079691_F26AF31C 
X-CRM114-Status: GOOD (  20.50  )
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

On Wed, Oct 22, 2025 at 04:45:43PM +0100, Simon Horman wrote:
> On Tue, Oct 21, 2025 at 09:33:12PM +0200, Christian Marangi wrote:
> 
> ...
> 
> > +static int airoha_setup_phylink(struct net_device *netdev)
> > +{
> > +	struct airoha_gdm_port *port = netdev_priv(netdev);
> > +	struct device *dev = &netdev->dev;
> > +	phy_interface_t phy_mode;
> 
> Hi Christian,
> 
> phy_interface_t is an enum and thus may in practice be unsigned...
> 
> > +	struct phylink *phylink;
> > +
> > +	phy_mode = device_get_phy_mode(dev);
> > +	if (phy_mode < 0) {
> 
> ... if so, this condition will always be false.
> 
> I suspect the correct approach here is to change the type of phy_mode to int.
> 
> Flagged by Smatch.
>

Thanks a lot for pointing this out. Also I'm a bit confused of why
device_get_phy_mode changed the args deviated from the of variant that
return int and required an additional arg for the interface...

> > +		dev_err(dev, "incorrect phy-mode\n");
> > +		return phy_mode;
> > +	}
> > +
> > +	port->phylink_config.dev = dev;
> > +	port->phylink_config.type = PHYLINK_NETDEV;
> > +	port->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
> > +						MAC_10000FD;
> > +
> > +	__set_bit(PHY_INTERFACE_MODE_INTERNAL,
> > +		  port->phylink_config.supported_interfaces);
> > +
> > +	phylink = phylink_create(&port->phylink_config, dev_fwnode(dev),
> > +				 phy_mode, &airoha_phylink_ops);
> > +	if (IS_ERR(phylink))
> > +		return PTR_ERR(phylink);
> > +
> > +	port->phylink = phylink;
> > +
> > +	return 0;
> > +}
> > +
> >  static int airoha_alloc_gdm_port(struct airoha_eth *eth,
> >  				 struct device_node *np, int index)
> >  {
> 
> ...
> 
> -- 
> pw-bot: cr

-- 
	Ansuel

