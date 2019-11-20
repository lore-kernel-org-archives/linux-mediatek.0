Return-Path: <SRS0=Qt5b=ZM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D57E4C432C0
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Nov 2019 02:46:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A84AD2245D
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Nov 2019 02:46:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eKbm79LG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A84AD2245D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DV7lQNrui6DP3+OCOW1PagSe+S1SBYLSbTigAR3LtUg=; b=eKbm79LGUK+uK8
	B7do9datVfVBf1mEEVfc3bKyM6t+RjYsFKqU0ZJV4ms4KSbmOjUsBknYAjDnPldQpkXHrCVeeohDu
	LHkcTvfki71OUpw+7mdLKLxt/lhcp86QX9pxEJCa21W+7GzuqOaIQt0d6/VvzR2mJHjCnxc64oF+r
	5Dbu9+DHyTHC58BQB1dZ/Rlv6TQt+26rKx1ofJnyiPZAD0Y+eeAE+HwT8dMkyZvICKdv6DzZI+0xy
	56ySJy7a1Y1frJ6A0Qk9BxOSjQ+M+ngDsqhms5yAxvqkTdOyPt5UwO+m03hIv36HlIxljEDmtoybN
	PL1uiVzmUr2R9u+dUbwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXG0a-0003Ek-9A; Wed, 20 Nov 2019 02:46:20 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXG0S-00039A-Dy; Wed, 20 Nov 2019 02:46:13 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:1e2::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 28721146CFECE;
 Tue, 19 Nov 2019 18:46:05 -0800 (PST)
Date: Tue, 19 Nov 2019 18:46:04 -0800 (PST)
Message-Id: <20191119.184604.2256080146904190716.davem@davemloft.net>
To: rmk+kernel@armlinux.org.uk
Subject: Re: [RFC PATCH net-next] net: phylink: rename mac_link_state() op
 to mac_pcs_get_state()
From: David Miller <davem@davemloft.net>
In-Reply-To: <E1iX2jg-0005Us-6U@rmk-PC.armlinux.org.uk>
References: <E1iX2jg-0005Us-6U@rmk-PC.armlinux.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 19 Nov 2019 18:46:05 -0800 (PST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191119_184612_472142_66F82227 
X-CRM114-Status: GOOD (  12.73  )
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
Cc: andrew@lunn.ch, nbd@openwrt.org, f.fainelli@gmail.com,
 michal.simek@xilinx.com, alexandre.torgue@st.com, netdev@vger.kernel.org,
 sean.wang@mediatek.com, linux-stm32@st-md-mailman.stormreply.com,
 nicolas.ferre@microchip.com, Mark-MC.Lee@mediatek.com, joabreu@synopsys.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 thomas.petazzoni@bootlin.com, john@phrozen.org, matthias.bgg@gmail.com,
 peppe.cavallaro@st.com, radhey.shyam.pandey@xilinx.com,
 vivien.didelot@gmail.com, mcoquelin.stm32@gmail.com, hkallweit1@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Russell King <rmk+kernel@armlinux.org.uk>
Date: Tue, 19 Nov 2019 12:36:00 +0000

> Rename the mac_link_state() method to mac_pcs_get_state() to make it
> clear that it should be returning the MACs PCS current state, which
> is used for inband negotiation rather than just reading back what the
> MAC has been configured for. Update the documentation to explicitly
> mention that this is for inband.
> 
> We drop the return value as well; most of phylink doesn't check the
> return value and it is not clear what it should do on error - instead
> arrange for state->link to be false.
> 
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> ---
> This is something I'd like to do to make it clearer what phylink expects
> of this function, and that it shouldn't just read-back how the MAC was
> configured.  However, it will require some testing and review as it
> changes quite a lot, and there's some things, particularly in DSA, that
> don't seem quite right from a phylink point of view, such as messing
> with state->interface in this function.

I don't have the expertiece to look into the DSA components of these
changes and your concerns.

Andrew, Florian, etc.?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
