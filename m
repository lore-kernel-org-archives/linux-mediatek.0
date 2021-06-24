Return-Path: <SRS0=ohMe=LS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7546CC49EA5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 12:39:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CD10613FA
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 12:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CD10613FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xmC38NxRjp09lYlI22b2sK6xST9YC6lUYEZ9Ne1fhdE=; b=fCeZu2sSw9FyaZ
	StfKVNTuhbvgAGtFpHfsdZVcAZVVcZCFtYrK/SltvxHn/s8Ar2V7OpYLzF3NBWekoueDh5uiaIA4Z
	mGm9jYZSdGGnswk0vAk9R+n8aaVBA9tg3hjy1Isxd5bKOgrTnO7AhfpZc2EUXnCH+JLKBQ3JesJVs
	Y8+CyksRQXZCviUme4tLxoEsAbfDWcchnpL8kKOcqP/CJirN6JF1ddz8EOc3sdEmTx2mzizj2bx1E
	n36wcBldlWPCWyigDvTQvi2QZTcSeut1Vq3eDWLxOoziaS42fQa78qmwEl+MBlnt+qAX/UXQvka34
	E/Kwo6fJnOA01mCUr+lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwOdn-00Edmb-JI; Thu, 24 Jun 2021 12:39:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwOdj-00EdlD-0i; Thu, 24 Jun 2021 12:39:30 +0000
X-UUID: 6d6a1f4f0eae41848488b129629ceba4-20210624
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=iWYWT7LPDOTRMWL7fnmFT13A8u+nfsGoR80/zT9G/0g=; 
 b=US3oF8wYYhIIJwVZRU2a7pG3AMOes243U3SHoOmRwtk8RUZCDod+kmd3mLuu7+vA5X1PQwDHZY5aXcM1FLuTVS4whjiwuLk3Cx7u1/EyxjHx3lv35fi8/6C/0OUlFVWGdy5Zy0ucrdjKjL2mBDANe3bNG4L70E7xkGPW5FY/SMA=;
X-UUID: 6d6a1f4f0eae41848488b129629ceba4-20210624
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1520247720; Thu, 24 Jun 2021 05:39:24 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Jun 2021 05:39:23 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Jun 2021 20:39:21 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Jun 2021 20:39:20 +0800
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
Date: Thu, 24 Jun 2021 20:24:35 +0800
Message-ID: <20210624122435.11887-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <YNRKhJB9/K4SKPdR@kroah.com>
References: <YNRKhJB9/K4SKPdR@kroah.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_053927_426651_6B4BE109 
X-CRM114-Status: GOOD (  23.07  )
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

On Thu, 2021-06-24 at 11:04 +0200, Greg KH wrote:
On Thu, Jun 24, 2021 at 02:13:10PM +0800, Rocco Yue wrote:
>> On Thu, 2021-06-24 at 07:29 +0200, Greg KH wrote:
>>> 
>>> Thanks for the explaination, why is this hardware somehow "special" in
>>> this way that this has never been needed before?
>>> 
>>> thanks,
>>> 
>>> greg k-h
>>> 
>> 
>> Before kernel-4.18, RAWIP was the same as PUREIP, neither of them
>> automatically generates an IPv6 link-local address, and the way to
>> generate an IPv6 global address is the same.
>> 
>> After kernel-4.18 (include 4.18 version), the behavior of RAWIP had
>> changed due to the following patch:
>> @@  static int ipv6_generate_eui64(u8 *eui, struct net_device *dev)
>> +	case ARPHRD_RAWIP:
>> +		return addrconf_ifid_rawip(eui, dev);
>>  	}
>>  	return -1;
>> }
>> 
>> the reason why the kernel doesn't need to generate the link-local
>> address automatically is as follows:
>> 
>> In the 3GPP 29.061, here is some description as follows:
>> "in order to avoid any conflict between the link-local address of
>> MS and that of the GGSN, the Interface-Identifier used by the MS to
>> build its link-local address shall be assigned by the GGSN. The GGSN
>> ensures the uniqueness of this Interface-Identifier. Then MT shall
>> then enforce the use of this Interface-Identifier by the TE"
>> 
>> In other words, in the cellular network, GGSN determines whether to
>> reply to the Router Solicitation message of UE by identifying the
>> low 64bits of UE interface's ipv6 link-local address.
>> 
>> When using a new kernel and RAWIP, kernel will generate an EUI64
>> format ipv6 link-local address, and if the device uses this address
>> to send RS, GGSN will not reply RA message.
>> 
>> Therefore, in that background, we came up with PUREIP to make kernel
>> doesn't generate a ipv6 link-local address in any address generate
>> mode.
> 
> Thanks for the better description.  That should go into the changelog
> text somewhere so that others know what is going on here with this new
> option.
>

Does changelog mean adding these details to the commit message ?
I am willing do it.

> And are these user-visable flags documented in a man page or something
> else somewhere?  If not, how does userspace know about them?
> 

There are mappings of these device types value in the libc:
"/bionic/libc/kernel/uapi/linux/if_arp.h".
userspace can get it from here.

But I also failed to find a man page or a description of these
device types.

Thanks,
Rocco
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
