Return-Path: <SRS0=Skuz=LT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DFBCC2B9F4
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 06:26:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14FBB610F7
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 06:26:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14FBB610F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YOG33iC65LVJ7bvtX5N1rmxyAQQtKftFIWuqh3YTb0k=; b=L286nFhjEPn0KA
	ikHk7t5XUSnvNDDNa1kJlLjsL/YuwNZ0tZjOpP1AYGs5Ov2rh21QiIGE5ezjLVeTHfjJ38n05N3ew
	+R8T7/UWDaHvzeaZ9mf82eVl4jMoNYw6X8uoBRJ4gLX9cgaBH8YbqolR1IMz6ZqLpK+5IdEWH7RFZ
	EQYE3a62y3UJLpcvzpjimML1vu1QRrMWhXMyhyTI57JknTwxxzmvwiODOeEvtFGAett+HsBZufDNi
	FXyyIX06Q8lwzXWbABdU/+acvCtHOaTUCePmZy/Ge+UDBKRx0UfDVKLIYoRVu03NP1rMznvLs16Pd
	GN4FYLyXaUBl6QLA4r+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwfIb-00HPBL-RY; Fri, 25 Jun 2021 06:26:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwfIA-00HP2a-HL; Fri, 25 Jun 2021 06:26:22 +0000
X-UUID: 965e5ae8b0ba4bfab4863405163f45a7-20210624
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=kosj4D83CTbLKYzcPUoVoqUdu3Kz4Ty72nmJOlW+rdI=; 
 b=bQ7rS91NwTf8HBslTkBQqCBMVaq0thRHViZ5acAPqZOwxSWsZ0xnEU2f8nUD43tfCwVEMpZOCPt/Y/6L1jbq3bKS4aoWZy3fRL+iBWJmlMKV06zmgvwT5Zm9XhD69YOSH5/1LLufD1xyhIPsDIWXzp5ixc/1/urXQTo95NWsISw=;
X-UUID: 965e5ae8b0ba4bfab4863405163f45a7-20210624
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 314212816; Thu, 24 Jun 2021 23:26:13 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Jun 2021 23:19:13 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Jun 2021 14:18:59 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Jun 2021 14:18:58 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: Dan Williams <dcbw@redhat.com>
CC: Greg KH <gregkh@linuxfoundation.org>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, David Ahern
 <dsahern@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Felix
 Fietkau" <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 <netdev@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <bpf@vger.kernel.org>,
 <wsd_upstream@mediatek.com>, <chao.song@mediatek.com>,
 <kuohong.wang@mediatek.com>, Rocco Yue <rocco.yue@mediatek.com>
Subject: Re: [PATCH 1/4] net: if_arp: add ARPHRD_PUREIP type
Date: Fri, 25 Jun 2021 14:04:11 +0800
Message-ID: <20210625060411.23853-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <0548d1daa7e1eee9d8202481668bbe4975c9b33d.camel@redhat.com>
References: <0548d1daa7e1eee9d8202481668bbe4975c9b33d.camel@redhat.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_232620_095153_0046D7CC 
X-CRM114-Status: GOOD (  20.91  )
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

On Thu, 2021-06-24 at 11:14 -0500, Dan Williams wrote:
On Thu, 2021-06-24 at 14:13 +0800, Rocco Yue wrote:
>> On Thu, 2021-06-24 at 07:29 +0200, Greg KH wrote:
>> 
>> Before kernel-4.18, RAWIP was the same as PUREIP, neither of them
>> automatically generates an IPv6 link-local address, and the way to
>> generate an IPv6 global address is the same.
> 
> This distinction seems confusing from a kernel standpoint if it only
> changes how v6 IIDs are determined. Do we really need something that's

Hi Dan,

Thanks for your comment,

In the cellular network, v6 IID is important, If the device use the
link-local address formed by the incorrect IID to send RS message to
the network, based on 3GPP, GGSN will not reply solicited RA message.
It will lead to the device can get ipv6 address prefix and ipv6 route.

Maybe the table below is a little bit clearer

three device type: ARPHRD_RAWIP , ARPHRD_PUREIP, ARPHRD_NONE
three mode: IN6_ADDR_GEN_MODE_EUI64 , IN6_ADDR_GEN_MODE_NONE, IN6_ADDR_GEN_MODE_STABLE_PRIVACY

ipv6 link-local address generate behavior in the kernel:
+---------+-------------------+---------------------+----------------+
|         | MODE_EUI64        | MODE_STABLE_PRIVACY | MODE_NONE      |
+---------+-------------------+---------------------+----------------+
| RAWIP   | fe80::(eui64-id)  | fe80::(privacy-id)  | no address gen |
+---------+-------------------+---------------------+----------------+
| PUREIP  | no address gen    | no address gen      | no address gen |
+---------+-------------------+---------------------+----------------+
| NONE    | fe80::(random-id) | fe80::(privacy-id)  | no address gen |
+---------+-------------------+---------------------+----------------+

ipv6 global address generate behavior in the kernel:
+---------+-------------------+---------------------+-------------------+
|         | MODE_EUI64        | MODE_STABLE_PRIVACY | MODE_NONE         |   
+---------+-------------------+---------------------+-------------------+
| RAWIP   | prefix+(eui64-id) | prefix+(privacy-id) | prefix+(eui64-id) |
+---------+-------------------+---------------------+-------------------+
| PUREIP  | prefix+(GGSN-id)  | prefix+(privacy-id) | prefix+(GGSN-id)  |
+---------+-------------------+---------------------+-------------------+
| NONE    | prefix+(random-id)| prefix+(privacy-id) | prefix+(random-id)|
+---------+-------------------+---------------------+-------------------+

> also reflected to userspace (in struct ifinfomsg -> ifi_type) if the
> kernel is handling the behavior that's different? Why should userspace
> care?
> 

In my opinion, userspace program cares about it because the kernel behaves
differently for different device types.
userspace can get the device type of the interface through ioctl, such as
the following code weblink:
https://cs.android.com/android/platform/superproject/+/master:system/netd/server/OffloadUtils.cpp;drc=master;l=41?q=ARPHRD_RAWIP&ss=android%2Fplatform%2Fsuperproject&start=11

> I'm also curious why this isn't an issue for the ipa/rmnet (Qualcomm)
> modem drivers. There's probably a good reason, but would be good to
> know what that is from Alex Elder or Loic or Bjorn...
> 
> Dan

MediaTek and Qualcomm has different hardware or modem design.
For the MediaTek platform, device send the RS message that generated by
the kernel to the GGSN.

Thanks,
Rocco
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
