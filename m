Return-Path: <SRS0=WnB0=5U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 930ABC2BA15
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Apr 2020 15:08:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6332B206C3
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Apr 2020 15:08:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="omvirJBk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="c4fufxCN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6332B206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kSBrJZCxq29sZ4WdP3810ESRxkoMKS61zTLFmzmdAdY=; b=omvirJBkhIz2aB
	DyeP+ipr3ZUwNYYS7sxlxEeDTAVZS4tFLwc/LMD2kk1ohZq8dOjESQBI26cV9nwIMyKORL03nLK58
	CyfS6VNe8I7vKuWaSZw3bWXOC8cl8rC3zy/lAHmza3aKEIvSyYrUaIW3+Vyo2aU89VgYVgiJa6/s5
	6TYwbITqwSGCaAEeFXY1UG+OhVPbskZfTjJm21+pCKQ4G66Pw4fEsvL1bg790KA3KFWc0T3vEd3ae
	SUFOQewZ0SrYzcsbPvk5tq2lX4bpAcrnvJghgpmnFe0s2T/ABuushKj6vebPNddnHB5XtwDEVmtfV
	yd8782mQeIoJbye5P4Hg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKkPi-0004Oe-KN; Sat, 04 Apr 2020 15:08:50 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKkPb-0004J8-2v; Sat, 04 Apr 2020 15:08:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vp27F8VCbpDyMug+E/DkoFiqJ0iXvSFB3dG9NhdVtJ4=; b=c4fufxCNaxCfxlabO36Hw9VuYU
 Iy7BaNe3r6MvvPPy9rhjqGjZJpP9y0GM9FWH6DappHyVFuggm31hWHqH+YqpzuLjkqxjiY+lCXKRh
 qEj3F2/EgI8g3uP6a3Lm8t5Z4mb59eooVu3rTup4yLq4VA8REUq6oXm6aucvLfNwtXf8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
 (envelope-from <andrew@lunn.ch>)
 id 1jKkP4-000xRF-B9; Sat, 04 Apr 2020 17:08:10 +0200
Date: Sat, 4 Apr 2020 17:08:10 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Chuanhong Guo <gch981213@gmail.com>
Subject: Re: [PATCH] net: dsa: mt7530: fix null pointer dereferencing in
 port5 setup
Message-ID: <20200404150810.GA161768@lunn.ch>
References: <20200403112830.505720-1-gch981213@gmail.com>
 <20200403180911.Horde.9xqnJvjcRDe-ttshlJbG6WE@www.vdorst.com>
 <CAJsYDVJj1JajVxeGifaOprXYstG-gC_OYwd5LrALUY_4BdtR3A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJsYDVJj1JajVxeGifaOprXYstG-gC_OYwd5LrALUY_4BdtR3A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200404_080843_127208_1B293184 
X-CRM114-Status: GOOD (  10.92  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, open list <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Apr 04, 2020 at 11:19:10AM +0800, Chuanhong Guo wrote:
> Hi!
> =

> On Sat, Apr 4, 2020 at 2:09 AM Ren=E9 van Dorst <opensource@vdorst.com> w=
rote:
> >
> > Quoting Chuanhong Guo <gch981213@gmail.com>:
> >
> > Hi Chuanhong,
> >
> > > The 2nd gmac of mediatek soc ethernet may not be connected to a PHY
> > > and a phy-handle isn't always available.
> > > Unfortunately, mt7530 dsa driver assumes that the 2nd gmac is always
> > > connected to switch port 5 and setup mt7530 according to phy address
> > > of 2nd gmac node, causing null pointer dereferencing when phy-handle
> > > isn't defined in dts.
> >
> > MT7530 tries to detect if 2nd GMAC is using a phy with phy-address 0 or=
 4.
> =

> What if the 2nd GMAC connects to an external PHY on address 0 on a
> different mdio-bus?

In general, you using a phy-handle to cover such a situation. If there
is a phy-handle, just use it.

   Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
