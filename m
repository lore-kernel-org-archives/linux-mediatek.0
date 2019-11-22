Return-Path: <SRS0=vzOr=ZO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 375C4C432C0
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Nov 2019 09:22:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3C182070E
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Nov 2019 09:22:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EkbmRW0d";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="an41Zr2/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3C182070E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VgKf1CR0e/S+WDWo2Hvfn85YvRDxgb93ILD3gtRgOKw=; b=EkbmRW0ds7n7me
	3eChsfSBbz8rmp3IACljOyt1WQsWegxFRNjlknp79P/W4BLHUhnXJ3ZRj6G9wJFU+agbXlSmOx4aZ
	7sRyvPyCAqERFgBqFhX5J7p8CSlcz8htmm7vEer/FKJN5opQEHNSiIwsdbapry3aiuOFf5rL42NNW
	nPrGDIPTijE38QiyTcV3Av755VjWYdSjM4FtXiQM+AkMi0g0spZzf6QPXJKK4HBF9qZ38j2XjNMdW
	s8bhgQHx8mSwHI4N+q0dtkPKnUlq314kiniYhBdj8ZjTwlpZa4z3TYsWHiW84rR9s4af3WYti3Q6N
	QKI58hpxdNG/cPnlrZPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iY58v-0008WH-7p; Fri, 22 Nov 2019 09:22:21 +0000
Received: from pandora.armlinux.org.uk
 ([2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iY58s-0008Vm-2V; Fri, 22 Nov 2019 09:22:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SWbmUilvZWyu9G5awdEU2KvPZeq3aeg+c1C4lJEnjoo=; b=an41Zr2/uNxSIUfMI75HmnIqV
 Gdh4kdDw4HAonLEtaGjxH9/njeLzh1GpRZf0SdfF3fR2JOqSPElZfwlBFHwa/As7LqES2oxUVPEgq
 lddNaJanCjc5wYIDGjIC6vp/7cs3bWV0EO6UQnizW+CueuuyXnvdNQV/pi8CzUwU8DlC0rh6gDmZ1
 3czSPX/k0lEm6+tq7d/3jiRJ4d4qIWMKj98kTVi55jDe/fx0aIEp9e0NpBdiBblRVh8AqwC9lFmii
 C0NYYCbzgJdJnfp2kZxdu3CcqNMvAR7V2i6h4Fcg2aJSzTu3H2Np+acyCy0rAWe9S3KvME8OebaDh
 lt4WPkmBg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43048)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1iY58L-000490-9z; Fri, 22 Nov 2019 09:21:45 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1iY58D-0003Yo-1A; Fri, 22 Nov 2019 09:21:37 +0000
Date: Fri, 22 Nov 2019 09:21:37 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [CFT PATCH net-next v2] net: phylink: rename mac_link_state() op
 to mac_pcs_get_state()
Message-ID: <20191122092136.GJ25745@shell.armlinux.org.uk>
References: <E1iXaSM-0004t1-9L@rmk-PC.armlinux.org.uk>
 <20191121.191417.1339124115325210078.davem@davemloft.net>
 <0a9e016b-4ee3-1f1c-0222-74180f130e6c@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0a9e016b-4ee3-1f1c-0222-74180f130e6c@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191122_012218_181709_C32EF19D 
X-CRM114-Status: GOOD (  20.63  )
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
Cc: andrew@lunn.ch, nbd@openwrt.org, sean.wang@mediatek.com,
 alexandre.torgue@st.com, netdev@vger.kernel.org, peppe.cavallaro@st.com,
 radhey.shyam.pandey@xilinx.com, michal.simek@xilinx.com,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, linux-mediatek@lists.infradead.org,
 thomas.petazzoni@bootlin.com, john@phrozen.org, matthias.bgg@gmail.com,
 vivien.didelot@gmail.com, hkallweit1@gmail.com,
 David Miller <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Mark-MC.Lee@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Nov 21, 2019 at 07:36:44PM -0800, Florian Fainelli wrote:
> 
> 
> On 11/21/2019 7:14 PM, David Miller wrote:
> > From: Russell King <rmk+kernel@armlinux.org.uk>
> > Date: Thu, 21 Nov 2019 00:36:22 +0000
> > 
> >> Rename the mac_link_state() method to mac_pcs_get_state() to make it
> >> clear that it should be returning the MACs PCS current state, which
> >> is used for inband negotiation rather than just reading back what the
> >> MAC has been configured for. Update the documentation to explicitly
> >> mention that this is for inband.
> >>
> >> We drop the return value as well; most of phylink doesn't check the
> >> return value and it is not clear what it should do on error - instead
> >> arrange for state->link to be false.
> >>
> >> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> >> ---
> >> This is something I'd like to do to make it clearer what phylink
> >> expects of this function, and that it shouldn't just read-back how
> >> the MAC was configured.
> >>
> >> This version drops the deeper changes, concentrating just on the
> >> phylink API rather than delving deeper into drivers, as I haven't
> >> received any feedback on that patch.
> >>
> >> It would be nice to see all these drivers tested with this change.
> > 
> > I'm tempted to just apply this, any objections?
> > 
> 
> Russell, which of this patch or: http://patchwork.ozlabs.org/patch/1197425/
> 
> would you consider worthy of merging?

Let's go with v2 for now - it gets the rename done with less risk that
there'll be a problem.  I can always do the remainder in a separate
patch after the merge window as a separate patch.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
