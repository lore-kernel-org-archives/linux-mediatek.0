Return-Path: <SRS0=ohMe=LS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 236F5C48BDF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 09:04:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9E3D61164
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 09:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9E3D61164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cczCZm/XNoAsjPks6XyTgHhp10D/ZFo34Agqc/2rfm8=; b=AbBDp6SSXapu42
	2CJPLGSlgsxxsSk1MkW0Y2VSpr18BMi8I81GXfvWTX1BUH1669rnZsadm+LEkPRUkS5+8GzyzjNjz
	2XcNqTyTaY4+iYNgE+5DPvKI/fAK5Mzh1rxbqeQhMtux7lRQb9VRiyV0UwX3Yq7fbVnU82yp1SnQg
	cxIsX51A0WNnMB/q80H9tTQ5rWp1lzC+11VrFCZQH0r8SXhae4SxYggcmEepAaiAYd5dQfhSxFgD3
	Y6MlySOD5HNmOJBMzL+Wi69wl3/lC+XwTTCbpTniPBmI6nXkxFG4v0wSLVOW3vImh97sINHINmQXP
	Y4uHbKH6X234e1eC6RvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwLHj-00Dd47-8P; Thu, 24 Jun 2021 09:04:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwLHM-00DcuN-A4; Thu, 24 Jun 2021 09:04:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5DCAE613DC;
 Thu, 24 Jun 2021 09:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1624525448;
 bh=rby+ZPgSSxK8+RzLEO6EAEviTD7NAgOLS/9KpTQJ4FU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YwvmEv3TARAfMjBW8u0BmYQnLofpa8rvMy3sGduJ2AW5d4eg6GWV6H7og8F0G+vTV
 5f3ZCXj78qe5lizHerdHMjDRZXlMwvBNzuwctQrXCK0bjoZaJu5cPlJBSM417NzGqO
 YinHgu09t22NltJkxV+4C25ZsjzZtgAP9awWL/XE=
Date: Thu, 24 Jun 2021 11:04:04 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Rocco Yue <rocco.yue@mediatek.com>
Cc: David Ahern <dsahern@gmail.com>, "David S . Miller" <davem@davemloft.net>,
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
Message-ID: <YNRKhJB9/K4SKPdR@kroah.com>
References: <YNQYHfE09Dx5kWyg@kroah.com>
 <20210624061310.12315-1-rocco.yue@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210624061310.12315-1-rocco.yue@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_020408_413145_49E4D871 
X-CRM114-Status: GOOD (  22.45  )
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

On Thu, Jun 24, 2021 at 02:13:10PM +0800, Rocco Yue wrote:
> On Thu, 2021-06-24 at 07:29 +0200, Greg KH wrote:
> > 
> > Thanks for the explaination, why is this hardware somehow "special" in
> > this way that this has never been needed before?
> > 
> > thanks,
> > 
> > greg k-h
> > 
> 
> Before kernel-4.18, RAWIP was the same as PUREIP, neither of them
> automatically generates an IPv6 link-local address, and the way to
> generate an IPv6 global address is the same.
> 
> After kernel-4.18 (include 4.18 version), the behavior of RAWIP had
> changed due to the following patch:
> @@  static int ipv6_generate_eui64(u8 *eui, struct net_device *dev)
> +	case ARPHRD_RAWIP:
> +		return addrconf_ifid_rawip(eui, dev);
>  	}
>  	return -1;
> }
> 
> the reason why the kernel doesn't need to generate the link-local
> address automatically is as follows:
> 
> In the 3GPP 29.061, here is some description as follows:
> "in order to avoid any conflict between the link-local address of
> MS and that of the GGSN, the Interface-Identifier used by the MS to
> build its link-local address shall be assigned by the GGSN. The GGSN
> ensures the uniqueness of this Interface-Identifier. Then MT shall
> then enforce the use of this Interface-Identifier by the TE"
> 
> In other words, in the cellular network, GGSN determines whether to
> reply to the Router Solicitation message of UE by identifying the
> low 64bits of UE interface's ipv6 link-local address.
> 
> When using a new kernel and RAWIP, kernel will generate an EUI64
> format ipv6 link-local address, and if the device uses this address
> to send RS, GGSN will not reply RA message.
> 
> Therefore, in that background, we came up with PUREIP to make kernel
> doesn't generate a ipv6 link-local address in any address generate
> mode.

Thanks for the better description.  That should go into the changelog
text somewhere so that others know what is going on here with this new
option.

And are these user-visable flags documented in a man page or something
else somewhere?  If not, how does userspace know about them?

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
