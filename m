Return-Path: <SRS0=4wrq=4P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B65E2C11D3D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2020 20:03:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7231B2469F
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2020 20:03:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gVVyQY8k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7231B2469F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GXsobZWO3aWtWcBLYd5rsOaWOH6L0BC3f4lGD7nhp3A=; b=gVVyQY8kEnIFwn
	JAcitTz/AEWGkt/F3dmO6A3hQlDrjJScYTOpzuhTGOaRnQJqhhZB+ouQ5gVFHLgnjiSGAw3t3BI5W
	TZMxZYWtXP6hMIIRVeIQbdzpf9j04BdSbyhEAfLI5pFb6vUZjzE2905ob8d6xmFeQdabBD6FkOvWB
	1jdtlMxKmc7m3cmhdjNjUWq4rPrEwmw73EZh3BNKRzuB68+LJOL3W0e+P8XbWXxAJdkjhiHqUnL6k
	i+5UUYKQqjRM/DUN96aOQ1Tk1HFqKaRTwRijF+29pCxrtpRf7b9Is8rkLvjmwS3nMrXClahNYRehh
	PAOhCAAtXi9UAsMnXKuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7PNF-0006NR-Tv; Thu, 27 Feb 2020 20:03:09 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7PN4-0006Dx-Sc; Thu, 27 Feb 2020 20:03:00 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id AE1E5121793E1;
 Thu, 27 Feb 2020 12:02:54 -0800 (PST)
Date: Thu, 27 Feb 2020 12:02:54 -0800 (PST)
Message-Id: <20200227.120254.241641132362203475.davem@davemloft.net>
To: linux@armlinux.org.uk
Subject: Re: [PATCH net-next v2 0/8] rework phylink interface for split
 MAC/PCS support
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200226102312.GX25745@shell.armlinux.org.uk>
References: <20200226102312.GX25745@shell.armlinux.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 27 Feb 2020 12:02:55 -0800 (PST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_120258_922988_C7DC1B4A 
X-CRM114-Status: GOOD (  14.22  )
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
Cc: andrew@lunn.ch, linux-doc@vger.kernel.org, thomas.petazzoni@bootlin.com,
 ioana.ciornei@nxp.com, linux-stm32@st-md-mailman.stormreply.com,
 f.fainelli@gmail.com, corbet@lwn.net, michal.simek@xilinx.com,
 joabreu@synopsys.com, kuba@kernel.org, Mark-MC.Lee@mediatek.com,
 sean.wang@mediatek.com, alexandre.torgue@st.com, hauke@hauke-m.de,
 radhey.shyam.pandey@xilinx.com, linux-mediatek@lists.infradead.org,
 john@phrozen.org, matthias.bgg@gmail.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 vivien.didelot@gmail.com, mcoquelin.stm32@gmail.com, nbd@nbd.name,
 olteanv@gmail.com, hkallweit1@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Date: Wed, 26 Feb 2020 10:23:12 +0000

> The following series changes the phylink interface to allow us to
> better support split MAC / MAC PCS setups.  The fundamental change
> required for this turns out to be quite simple.
> 
> Today, mac_config() is used for everything to do with setting the
> parameters for the MAC, and mac_link_up() is used to inform the
> MAC driver that the link is now up (and so to allow packet flow.)
> mac_config() also has had a few implementation issues, with folk
> who believe that members such as "speed" and "duplex" are always
> valid, where "link" gets used inappropriately, etc.
> 
> With the proposed patches, all this changes subtly - but in a
> backwards compatible way at this stage.
> 
> We pass the the full resolved link state (speed, duplex, pause) to
> mac_link_up(), and it is now guaranteed that these parameters to
> this function will always be valid (no more SPEED_UNKNOWN or
> DUPLEX_UNKNOWN here - unless phylink is fed with such things.)
> 
> Drivers should convert over to using the state in mac_link_up()
> rather than configuring the speed, duplex and pause in the
> mac_config() method. The patch series includes a number of MAC
> drivers which I've thought have been easy targets - I've left the
> remainder as I think they need maintainer input. However, *all*
> drivers will need conversion for future phylink development.
> 
> v2: add ocelot/felix and qca/ar9331 DSA drivers to patch 2, add
>   received tested-by so far.

In order to end the storm in a teacup, I've applied this series.

:-)

Thanks Russell.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
