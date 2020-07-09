Return-Path: <SRS0=UXZI=AU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92613C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 20:23:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B95620720
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 20:23:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oeicma4Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B95620720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=geAr3eczqtKrUsAIh6KQ+Uvr15q4WM/9Pe5EVpG44kI=; b=oeicma4ZhpNUNkAN9dSUcmPc9
	7ma4nue/Psf/hODe4L8ZPCs5RNCdA5skavNiiX2jcoAwmGu1jCowSARYAWrewrnXcgdq1PAl1nVBB
	JCeGxO5CWWngdd254qYgcQkt9HMp5XRbiLORNuQHXPmy2TURO+VzS7RP0f9eC2DzzeIGQ0YwyTUsd
	GQD8+HjzT6MjeXICvXydXAzywzvs7y8OYoAcqW/di18d2VL3F1/LhU8pI6UdeB8p+6C9VGDRdCOnw
	tOMNnoxh3hCtxEE7Z65rop2+m71K/UVv+1eph2+wPeZyEMYN3IvD57Bxq9aZEkTVtNNiCZov8B2kj
	ty6bK9hfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtd4E-0005pd-Re; Thu, 09 Jul 2020 20:22:50 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtd4B-0005p1-Ku; Thu, 09 Jul 2020 20:22:48 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1jtd3z-004NLP-BI; Thu, 09 Jul 2020 22:22:35 +0200
Date: Thu, 9 Jul 2020 22:22:35 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Frank Wunderlich <frank-w@public-files.de>
Subject: Re: Re: [PATCH v2] net: ethernet: mtk_eth_soc: fix mtu warning
Message-ID: <20200709202235.GB1037260@lunn.ch>
References: <20200709055742.3425-1-frank-w@public-files.de>
 <20200709134115.GK928075@lunn.ch>
 <trinity-487c0605-faeb-462e-a373-bc393ce3dbfa-1594324081639@3c-app-gmx-bap65>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <trinity-487c0605-faeb-462e-a373-bc393ce3dbfa-1594324081639@3c-app-gmx-bap65>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_162247_701016_0FCC3FA6 
X-CRM114-Status: GOOD (  15.73  )
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
Cc: Landen Chao <landen.chao@mediatek.com>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 09, 2020 at 09:48:01PM +0200, Frank Wunderlich wrote:
> > Gesendet: Donnerstag, 09. Juli 2020 um 15:41 Uhr
> > Von: "Andrew Lunn" <andrew@lunn.ch>
> 
> > > +	eth->netdev[id]->max_mtu = 1536;
> >
> > I assume this is enough to make the DSA warning go away, but it is the
> > true max? I have a similar patch for the FEC driver which i should
> > post sometime. Reviewing the FEC code and after some testing, i found
> > the real max was 2K - 64.
> 
> i tried setting only the max_mtu, but the dsa-error is still present
> 
> mt7530 mdio-bus:00: nonfatal error -95 setting MTU on port 0
> 
> but i got it too, if i revert the change...mhm, strange that these were absent last time...
> 
> the other 2 are fixed with only max_mtu.
> @andrew where did you got the 2k-64 (=1984) information? sounds like orwell ;)

drivers/net/ethernet/freescale/fec_main.c:

/* The FEC stores dest/src/type/vlan, data, and checksum for receive packets.
 *
 * 2048 byte skbufs are allocated. However, alignment requirements
 * varies between FEC variants. Worst case is 64, so round down by 64.
 */
#define PKT_MAXBUF_SIZE         (round_down(2048 - 64, 64))

So i set the max MTU to this.

> 1405 static int dsa_slave_change_mtu(struct net_device *dev, int new_mtu)
> ...
> 1420     if (!ds->ops->port_change_mtu)
> 1421         return -EOPNOTSUPP;

Yes, i also needed to change the mv88e6xxx driver to implement this
function. These switches do support jumbo frames, so i had some real
code in there, not a dummy function.

The marketing brief for the mt7530 says it supports 1518, 1536, 1552
and 9K jumbo frames. It would be good if you can figure out how to
support that, rather than add a dummy function.

	Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
