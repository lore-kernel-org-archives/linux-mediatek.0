Return-Path: <SRS0=ohMe=LS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E9EC49EA5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 05:29:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A58976115A
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 05:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A58976115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b3KpQtAuxLe0znUKz/EqmjHuT8Mi5zEVevqTb6AwWeM=; b=Nv2m8NKXgfXLUU
	+3krrbJSVmjZUcZt6IWr+x/DrjL8Q2g4OK4KccBp7R+Ot+/lS+FTo506926x+vAicPoOb5Fw+PwiL
	LgEPCrcoV03S/+rpnA6UBZ42Ox3VSLxt9X7hMi1os+xDJcjbglukKxhSigbbOZ8bkjPbuu3iGm9Jg
	LyBq3653AhHy2i5j6qs2NuGDqOUoWd0xAbzIEpNjPosyY4FYy9QVuwx1h3hblyAYVrixLR1NAIWj0
	7Lt9ipXivyc4hcPL6IDF1yzfsvXIcZ9b3WvfJ9YqP30Kejx3/CGmHu/rwn3KhnPZbk+xN7FdKIhcb
	y70TnpnKrF60sHU5/JGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwHvR-00CnTK-Np; Thu, 24 Jun 2021 05:29:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwHvF-00CnRQ-Hw; Thu, 24 Jun 2021 05:29:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CA203613E1;
 Thu, 24 Jun 2021 05:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1624512545;
 bh=CrNTDEASE0hOIuPiLp9bEqtZG5PdJqBwgm5EWk5Moa8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dgkCqd8aSzCz5aPuT31Q+mRsU5exsL1ljJgUFfQi1UaKhFhMNgCPbvd2piVCS2QJD
 /TxeTOJJI+Kz76WmLScOvrnbQGQPgwft+l+HDUb1zXiHT/iJve3J8w26JMyoe/lt2L
 8W1qbhYXfcSDiKszMprXGq2cKMnjyHpJGXMVFcyI=
Date: Thu, 24 Jun 2021 07:29:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Rocco Yue <rocco.yue@mediatek.com>
Cc: "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 David Ahern <dsahern@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, bpf@vger.kernel.org,
 wsd_upstream@mediatek.com, chao.song@mediatek.com,
 kuohong.wang@mediatek.com
Subject: Re: [PATCH 1/4] net: if_arp: add ARPHRD_PUREIP type
Message-ID: <YNQYHfE09Dx5kWyg@kroah.com>
References: <YNNtN3cdDL71SiNt@kroah.com>
 <20210624033353.25636-1-rocco.yue@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210624033353.25636-1-rocco.yue@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_222905_657756_C92AE718 
X-CRM114-Status: GOOD (  25.06  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jun 24, 2021 at 11:33:53AM +0800, Rocco Yue wrote:
> On Wed, 2021-06-23 at 19:19 +0200, Greg KH wrote:
> On Wed, Jun 23, 2021 at 07:34:49PM +0800, Rocco Yue wrote:
> >> This patch add the definition of ARPHRD_PUREIP which can for
> >> example be used by mobile ccmni device as device type.
> >> ARPHRD_PUREIP means that this device doesn't need kernel to
> >> generate ipv6 link-local address in any addr_gen_mode.
> >> 
> >> Signed-off-by: Rocco Yue <rocco.yue@mediatek.com>
> >> ---
> >>  include/uapi/linux/if_arp.h | 1 +
> >>  1 file changed, 1 insertion(+)
> >> 
> >> diff --git a/include/uapi/linux/if_arp.h b/include/uapi/linux/if_arp.h
> >> index c3cc5a9e5eaf..4463c9e9e8b4 100644
> >> --- a/include/uapi/linux/if_arp.h
> >> +++ b/include/uapi/linux/if_arp.h
> >> @@ -61,6 +61,7 @@
> >>  #define ARPHRD_DDCMP    517		/* Digital's DDCMP protocol     */
> >>  #define ARPHRD_RAWHDLC	518		/* Raw HDLC			*/
> >>  #define ARPHRD_RAWIP    519		/* Raw IP                       */
> >> +#define ARPHRD_PUREIP	520		/* Pure IP			*/
> > 
> > In looking at the patches, what differs "PUREIP" from "RAWIP"?  It seems
> 
> Thanks for your review.
> 
> The difference between RAWIP and PUREIP is that they generate IPv6
> link-local address and IPv6 global address in different ways.
> 
> RAWIP:
> ~~~~~~
> In the ipv6_generate_eui64() function, using RAWIP will always return 0,
> which will cause the kernel to automatically generate an IPv6 link-local
> address in EUI64 format and an IPv6 global address in EUI64 format.
> 
> PUREIP:
> ~~~~~~~
> After this patch set, when using PUREIP, kernel doesn't generate IPv6
> link-local address regardless of which IN6_ADDR_GEN_MODE is used.
> 
> @@  static void addrconf_dev_config(struct net_device *dev)
> +       if (dev->type == ARPHRD_PUREIP)
> +               return;
> 
> And after recving RA message, kernel iterates over the link-local address
> that exists for the interface and uses the low 64bits of the link-local
> address to generate the IPv6 global address.
> The general process is as follows:
> ndisc_router_discovery() -> addrconf_prefix_rcv() -> ipv6_generate_eui64() -> ipv6_inherit_eui64()

Thanks for the explaination, why is this hardware somehow "special" in
this way that this has never been needed before?

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
