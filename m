Return-Path: <SRS0=sDSL=4F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADF57C34021
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 18:04:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 898C120801
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 18:04:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dm/wr8AB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 898C120801
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WT1B4O2gLtjR7G/zKiO4rVC7/mjd8S1Dq03mme02B8I=; b=Dm/wr8AB6lFpMq
	LlsewNUz8T7m+TXMGhRXZ+FzDaE4Q/6NBEDJuD84y2YQ1CkNZ6uNJeyu93OwVJxx+gdcDjIpv2ykc
	HsFFJJmO/ioZj/pIMB9RNi8iERqaD41MGiCJegdugRHW8xLePBHOla0y8LFOzIwv0zsxiFFcqx1qK
	s1YOo7pJF8/fkUCBQKM3tuPwXWvZp9M75ri6GKeMakhBFyOgQChsd1Q5LCwlNIzqgrlIYR2wGHMxk
	QloUqU6aKi261or4YOAC0T/4gngyckSwmuafv1rI3HTVk5GAwxP47QNHkQwm8xDIwKjN/eVrn6/Vp
	h6/4Upk8b5ZwoZJHmM6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3kkb-0003tn-Ir; Mon, 17 Feb 2020 18:04:09 +0000
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j3kkR-0003n7-Tk; Mon, 17 Feb 2020 18:03:59 +0000
Date: Mon, 17 Feb 2020 10:03:59 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Russell King <rmk+kernel@armlinux.org.uk>
Subject: Re: [CFT 1/8] net: phylink: propagate resolved link config via
 mac_link_up()
Message-ID: <20200217180359.GK7778@bombadil.infradead.org>
References: <20200217172242.GZ25745@shell.armlinux.org.uk>
 <E1j3k7e-00071q-3R@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1j3k7e-00071q-3R@rmk-PC.armlinux.org.uk>
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-doc@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, Felix Fietkau <nbd@openwrt.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Ioana Radulescu <ruxandra.radulescu@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
 Michal Simek <michal.simek@xilinx.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Vivien Didelot <vivien.didelot@gmail.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Sean Wang <sean.wang@mediatek.com>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Feb 17, 2020 at 05:23:54PM +0000, Russell King wrote:
> +   Please see :c:func:`mac_link_up` for more information on this.

FYI, Jon recently added the ability to specify functions as

+   Please see mac_link_up() for more information on this.

and it's now the preferred way to do this.  Nothing that should stand in
the way of this patch-set, of course.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
