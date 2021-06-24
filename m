Return-Path: <SRS0=ohMe=LS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FFAC48BDF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 13:06:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88CAC613F6
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 13:06:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88CAC613F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=exxbQxS8O5yxNyS4KvhrxRU4dxpODMN0dzqPtdVO5+g=; b=v3W5CGV85ad6he
	2dem2Z/9Pjt9FLLHyx6pdROlPbLHZQCrIIZruNs5yrcsXe3d6N57ExSL3tHB5pBMhjhGa9mS+AiMp
	LuaZ0hKg54pu0u++GnEWRM0pay+MOJdtNNiiFi0benuJkhBehbygri7AEVaSOiOSlA7eIaZ+hav+9
	bM8toqtZ4qo/giKXWlc7qOE+mS6JHsF1M6AUvjoCpOh0uj6OF4w/Avq5gaMhuhR0nwaxO6Bdcd/i4
	2A6+qtaBc6pShho3ZIg69XykU0Y2SJxncNd0W2jLu3/nW3OAd65EbfvlYCjwZ8L8ix0Q6lbnNYyXf
	Pb0Cw35tKvQUE3Cwm6EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwP3p-00Ejsg-8i; Thu, 24 Jun 2021 13:06:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwP3c-00Ejr6-JO; Thu, 24 Jun 2021 13:06:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D974C613C3;
 Thu, 24 Jun 2021 13:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1624539971;
 bh=X5fgruXZAH6/dwtIj9BUqyJ6jlUiiRQEvoljwULOpAw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OGYINAbuGasSG7nLZAa1F5HYrm1MRw/U0QA6imTs9s2BE2lPupOdkJkq0gZ87x0Sb
 yesHqPbqTj80zcQ+MmgtI5bRE7sFF0bQV4SBJdQRyd99mOxV4POTAfrCs9pMok1y/Q
 M8IzFW4pQrZMldEaFQlwECzz5es9sGGbKy5izkaY=
Date: Thu, 24 Jun 2021 15:06:09 +0200
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
Message-ID: <YNSDQbp/h/aadpmV@kroah.com>
References: <YNRKhJB9/K4SKPdR@kroah.com>
 <20210624122435.11887-1-rocco.yue@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210624122435.11887-1-rocco.yue@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_060612_719856_B623E6AD 
X-CRM114-Status: GOOD (  29.75  )
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

On Thu, Jun 24, 2021 at 08:24:35PM +0800, Rocco Yue wrote:
> On Thu, 2021-06-24 at 11:04 +0200, Greg KH wrote:
> On Thu, Jun 24, 2021 at 02:13:10PM +0800, Rocco Yue wrote:
> >> On Thu, 2021-06-24 at 07:29 +0200, Greg KH wrote:
> >>> 
> >>> Thanks for the explaination, why is this hardware somehow "special" in
> >>> this way that this has never been needed before?
> >>> 
> >>> thanks,
> >>> 
> >>> greg k-h
> >>> 
> >> 
> >> Before kernel-4.18, RAWIP was the same as PUREIP, neither of them
> >> automatically generates an IPv6 link-local address, and the way to
> >> generate an IPv6 global address is the same.
> >> 
> >> After kernel-4.18 (include 4.18 version), the behavior of RAWIP had
> >> changed due to the following patch:
> >> @@  static int ipv6_generate_eui64(u8 *eui, struct net_device *dev)
> >> +	case ARPHRD_RAWIP:
> >> +		return addrconf_ifid_rawip(eui, dev);
> >>  	}
> >>  	return -1;
> >> }
> >> 
> >> the reason why the kernel doesn't need to generate the link-local
> >> address automatically is as follows:
> >> 
> >> In the 3GPP 29.061, here is some description as follows:
> >> "in order to avoid any conflict between the link-local address of
> >> MS and that of the GGSN, the Interface-Identifier used by the MS to
> >> build its link-local address shall be assigned by the GGSN. The GGSN
> >> ensures the uniqueness of this Interface-Identifier. Then MT shall
> >> then enforce the use of this Interface-Identifier by the TE"
> >> 
> >> In other words, in the cellular network, GGSN determines whether to
> >> reply to the Router Solicitation message of UE by identifying the
> >> low 64bits of UE interface's ipv6 link-local address.
> >> 
> >> When using a new kernel and RAWIP, kernel will generate an EUI64
> >> format ipv6 link-local address, and if the device uses this address
> >> to send RS, GGSN will not reply RA message.
> >> 
> >> Therefore, in that background, we came up with PUREIP to make kernel
> >> doesn't generate a ipv6 link-local address in any address generate
> >> mode.
> > 
> > Thanks for the better description.  That should go into the changelog
> > text somewhere so that others know what is going on here with this new
> > option.
> >
> 
> Does changelog mean adding these details to the commit message ?

Yes please.

> > And are these user-visable flags documented in a man page or something
> > else somewhere?  If not, how does userspace know about them?
> > 
> 
> There are mappings of these device types value in the libc:
> "/bionic/libc/kernel/uapi/linux/if_arp.h".
> userspace can get it from here.

Yes, they will show up in a libc definition, but where is it documented
in text form what the flag does?

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
