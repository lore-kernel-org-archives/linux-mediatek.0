Return-Path: <SRS0=ohMe=LS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA6CC48BDF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 05:57:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C84E1613EE
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 05:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C84E1613EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hHFztAzg/yHLgrngSZbaUmw8TtTFx+LAV+Jhbff3A7g=; b=J8eIWSQ75IbxuB
	SFpzguWpBnwrXahB2K3KGFQKX0Qkg7ZxpK+c1N1eAGl+i6poF5rujZCme90L5Ogd9QAy3Y+9/k9Ic
	f/cLjZwRB+rx+u0iSHg1ZvAYb6tUc9teE4HPjnmQpng3wTyvRU8q7ga4sEn6AKmWZ2pdhENVh3xjW
	B0uXJp34AT+XGoIBswse4/5+c+C3OdHcVUZKg/InD1ojEwlsguKkuH4VPv/muVA4fFfgZYlV90AM3
	VTfIt2fKd6dadmuSnaOCuZPTT4Q1E6+NFquewz3IT7uQLJiSxEqSgakrUnI03VjgOHj22uWZfl9xV
	/Asge4jVKpTj7qTo5Teg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwIME-00Csn9-Fu; Thu, 24 Jun 2021 05:56:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwIM7-00Csls-QK; Thu, 24 Jun 2021 05:56:56 +0000
X-UUID: c592ad65b1b4499a9d4dd0862d50b1d8-20210623
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=FEQYtdjqbCWNKHatVYZuGHDAgkkCK5B0KLaQ+w23Gkk=; 
 b=pcwXYXoqsQrTkOa2hgUddpdesq6IC0TkFf4aFdnX59R/K/VmBZ2/pByti6XGXwzwbJrWXISrvs8AZHDD8Oa5VY2LhUe4p/oVzOk5cbxkHnVGVg+g3r3wC3wknQPuLeLJe01YRX6wcPj7Lo5YMc8LaUw2GX1XRRgl9sqq+HHJY10=;
X-UUID: c592ad65b1b4499a9d4dd0862d50b1d8-20210623
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1174442954; Wed, 23 Jun 2021 22:56:49 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 22:46:47 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Jun 2021 13:46:45 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Jun 2021 13:46:44 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: David Ahern <dsahern@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
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
Date: Thu, 24 Jun 2021 13:31:59 +0800
Message-ID: <20210624053159.22345-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <020403ac-0c2a-4ad8-236b-d32e59aef772@gmail.com>
References: <020403ac-0c2a-4ad8-236b-d32e59aef772@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_225653_892376_91C09FC3 
X-CRM114-Status: GOOD (  13.78  )
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

On Wed, 2021-06-23 at 23:15 -0600, David Ahern wrote:
On 6/23/21 9:33 PM, Rocco Yue wrote:
>> 
>> The difference between RAWIP and PUREIP is that they generate IPv6
>> link-local address and IPv6 global address in different ways.
>> 
>> RAWIP:
>> ~~~~~~
>> In the ipv6_generate_eui64() function, using RAWIP will always return 0,
>> which will cause the kernel to automatically generate an IPv6 link-local
>> address in EUI64 format and an IPv6 global address in EUI64 format.
>> 
>> PUREIP:
>> ~~~~~~~
>> After this patch set, when using PUREIP, kernel doesn't generate IPv6
>> link-local address regardless of which IN6_ADDR_GEN_MODE is used.
>> 
>> @@  static void addrconf_dev_config(struct net_device *dev)
>> +       if (dev->type == ARPHRD_PUREIP)
>> +               return;
>> 
>> And after recving RA message, kernel iterates over the link-local address
>> that exists for the interface and uses the low 64bits of the link-local
>> address to generate the IPv6 global address.
>> The general process is as follows:
>> ndisc_router_discovery() -> addrconf_prefix_rcv() ->
>> ipv6_generate_eui64() -> ipv6_inherit_eui64()
>> 
> 
> please add that to the commit message.

Thanks for your reminding, will do.

Thanks,
Rocco
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
