Return-Path: <SRS0=OETw=E2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A07C388F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 02:25:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D16722267
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 02:25:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2ObzAhTo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D16722267
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=skr132DiWXxsWpBRPdePh15ksbibVgDSH5nm/yVE/KU=; b=2ObzAhTopAsSIm56t5ilyB2FP
	/g+vdpZcsZyeN29prw09P/6jeJa/tu0q7f7FWlsqJj1GdcusVEQT51n+3diU8ly1hA6k7+xmmmqKS
	MXol9/XjNaa8+DwWLgZuQEmVbwlFgnvjxQSVyzu/5JdU9Dggv6OLTmXqFETMDXIqa6zY72jAWDrjA
	YWfMESsA2I9ldLoqOzMsv6+KcNOfkvJvy1yve55m9XpZaL0lNQ88apAIHPmN+aIUhIMEtXitbul3W
	ClPzfr0hwHu+xpvl+TmgGDCwchiEyQ4/MH437MwLOzjIkYI17YG4qjIAydqR3FKJMLnn6MjWTMf8y
	5EntuhmNA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfw7P-0004TW-Jw; Fri, 20 Nov 2020 02:25:47 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfw7M-0004SA-HI
 for linux-mediatek@lists.infradead.org; Fri, 20 Nov 2020 02:25:45 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1kfw7I-008333-JR; Fri, 20 Nov 2020 03:25:40 +0100
Date: Fri, 20 Nov 2020 03:25:40 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: DENG Qingfang <dqfext@gmail.com>
Subject: Re: [RFC PATCH net-next] net: dsa: mt7530: support setting ageing time
Message-ID: <20201120022540.GD1804098@lunn.ch>
References: <20201119064020.19522-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119064020.19522-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_212544_652234_78653E94 
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
Cc: Landen Chao <Landen.Chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>,
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Greg Ungerer <gerg@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Vladimir Oltean <olteanv@gmail.com>,
 Chuanhong Guo <gch981213@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Nov 19, 2020 at 02:40:20PM +0800, DENG Qingfang wrote:
> MT7530 has a global address age control register, so use it to set
> ageing time.
> 
> The applied timer is (AGE_CNT + 1) * (AGE_UNIT + 1) seconds
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---
>  drivers/net/dsa/mt7530.c | 41 ++++++++++++++++++++++++++++++++++++++++
>  drivers/net/dsa/mt7530.h | 13 +++++++++++++
>  2 files changed, 54 insertions(+)
> 
> RFC:
> 1. What is the expected behaviour if the timer is too big or too small?
>    - return -ERANGE or -EINVAL;

ERANGE is good. 

>      or
>    - if it is too big, apply the maximum value; if it is too small,
>      disable learning;
> 
> 2. Is there a better algorithm to find the closest pair?

The bridge code will default to 300 seconds. And after a topology
change, it sets it to 2 * the forwarding delay, which defaults to 15
seconds. So maybe you can look for these two values, and use
pre-computed values?

You still need to handle other values, the user can configure these.

	     Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
