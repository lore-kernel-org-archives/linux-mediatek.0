Return-Path: <SRS0=ohMe=LS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C1ABC48BDF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 03:49:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9FB9613C5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 03:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9FB9613C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Bsw+orCzoJSAk6i7BkDkQoqzeIBeH1AR3Kc4fz49i0=; b=vi8qEa0a/7NjLc
	U3auF50fHbv1kvyCp/gVpks/WKxKdFfxpzEpkU3HKCkUiYFSVO3lQBAMGw9Vmsiwa7N4jY9nrOsjy
	fe+9yBlozdnJVm1GLNYr0HmKnvyuvkxZgNUBgcxgCjOgcIYNy0vEtVh4wwLSyjuRo/Zmyawvchgj4
	CvCgNmT13ICKABH7ZPKB5gAmfPftgnr6GGMPZ/CooX0bKf+W7F2iaYb05b6RaOy9Jdmn1E9oRYweT
	UCzvy1u8/YolaAExFOyw9y4NzDPK/Ut+cFA8WcNizJmd9Q98ZuRnZBotPJTJPUQFYRX+bmmQd49hs
	Ms4iZ9XwiCWxCSAokY/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwGMg-00CaeW-L2; Thu, 24 Jun 2021 03:49:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwGMd-00CadM-1T; Thu, 24 Jun 2021 03:49:18 +0000
X-UUID: 62178ea98bb74b59b913aee26984510b-20210623
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=s2uOoLZxlSh4Jocn1rVMDSTXewU405+hbC0S8yw1gDs=; 
 b=pMrjwmfa5N3if8Tp39k1f3Gu6kxt8zytS6c8QTPPT+Z2vxmWDrNqHzSKEqwoAesaFLCEdUUqbDIGXgqZ8ZZ6RDDdKzN2Nt1G6X9S+9pbRF8Sgyb10qclpU5DY+fQ8wmks373q4ry0RaEClOf3sLX5PBrCf9Uj9aXmZLZV2t9T/Y=;
X-UUID: 62178ea98bb74b59b913aee26984510b-20210623
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 783979021; Wed, 23 Jun 2021 20:49:11 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 20:49:10 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Jun 2021 11:48:56 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Jun 2021 11:48:54 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Hideaki YOSHIFUJI
 <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Felix Fietkau <nbd@nbd.name>, John Crispin
 <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Mark Lee
 <Mark-MC.Lee@mediatek.com>, <netdev@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <bpf@vger.kernel.org>, <wsd_upstream@mediatek.com>, <chao.song@mediatek.com>, 
 <kuohong.wang@mediatek.com>, Rocco Yue <rocco.yue@mediatek.com>
Subject: Re: [PATCH 1/4] net: if_arp: add ARPHRD_PUREIP type
Date: Thu, 24 Jun 2021 11:33:53 +0800
Message-ID: <20210624033353.25636-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <YNNtN3cdDL71SiNt@kroah.com>
References: <YNNtN3cdDL71SiNt@kroah.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_204915_134246_F25C6BBE 
X-CRM114-Status: GOOD (  20.06  )
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

On Wed, 2021-06-23 at 19:19 +0200, Greg KH wrote:
On Wed, Jun 23, 2021 at 07:34:49PM +0800, Rocco Yue wrote:
>> This patch add the definition of ARPHRD_PUREIP which can for
>> example be used by mobile ccmni device as device type.
>> ARPHRD_PUREIP means that this device doesn't need kernel to
>> generate ipv6 link-local address in any addr_gen_mode.
>> 
>> Signed-off-by: Rocco Yue <rocco.yue@mediatek.com>
>> ---
>>  include/uapi/linux/if_arp.h | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/include/uapi/linux/if_arp.h b/include/uapi/linux/if_arp.h
>> index c3cc5a9e5eaf..4463c9e9e8b4 100644
>> --- a/include/uapi/linux/if_arp.h
>> +++ b/include/uapi/linux/if_arp.h
>> @@ -61,6 +61,7 @@
>>  #define ARPHRD_DDCMP    517		/* Digital's DDCMP protocol     */
>>  #define ARPHRD_RAWHDLC	518		/* Raw HDLC			*/
>>  #define ARPHRD_RAWIP    519		/* Raw IP                       */
>> +#define ARPHRD_PUREIP	520		/* Pure IP			*/
> 
> In looking at the patches, what differs "PUREIP" from "RAWIP"?  It seems

Thanks for your review.

The difference between RAWIP and PUREIP is that they generate IPv6
link-local address and IPv6 global address in different ways.

RAWIP:
~~~~~~
In the ipv6_generate_eui64() function, using RAWIP will always return 0,
which will cause the kernel to automatically generate an IPv6 link-local
address in EUI64 format and an IPv6 global address in EUI64 format.

PUREIP:
~~~~~~~
After this patch set, when using PUREIP, kernel doesn't generate IPv6
link-local address regardless of which IN6_ADDR_GEN_MODE is used.

@@  static void addrconf_dev_config(struct net_device *dev)
+       if (dev->type == ARPHRD_PUREIP)
+               return;

And after recving RA message, kernel iterates over the link-local address
that exists for the interface and uses the low 64bits of the link-local
address to generate the IPv6 global address.
The general process is as follows:
ndisc_router_discovery() -> addrconf_prefix_rcv() -> ipv6_generate_eui64() -> ipv6_inherit_eui64()

> to be the same to me.  If they are different, where is that documented?
> 
> thanks,
> 
> greg k-h

I tried to find corresponding documents about other device types, but I
am sorry I didn't find it. If it is needed, I am willing to provide.

Thanks,
Rocco
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
