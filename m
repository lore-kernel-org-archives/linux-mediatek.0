Return-Path: <SRS0=sikH=NS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9DE1C432BE
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Aug 2021 10:02:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BFB960F4F
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Aug 2021 10:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9BFB960F4F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+v7GNk6mkUZO/K84Dk5ns7/GAiTXi/lTcqwLSm3f+sQ=; b=jSrAf626zIg3sb
	n+YZaq3AVpd2rz+Q4zZMJjYZZmxjEZnL9XhegJDNvA6PDyLtNd34O+LXlFT/kkkkGvyPzvwHp2Ccj
	Txay0cabPWBpqKxLQlTT5UW9yF24Hpt/03zVvoAsuZ/GvwkUrDyM23+bb3gXK10v1ClsUrfzUDu8n
	gDYmic8KzbrITfBLogl1RQrvknDa1JWPoilktip84A7DwiWhwpiD5gLWL40VDVr/ZwLQdW3Hu51cc
	KGL/Do5VER9yXYh+n1hjQs6DyXY9mXjpJAdlT2WPv2eNEJ1L4rqGjvluCR3NWuCHxRaRTKA4vFgSr
	c5UWtAOpZd9VZgQhLXYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJYgV-00CBCl-EK; Fri, 27 Aug 2021 10:02:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJYTz-00C7Jb-TT; Fri, 27 Aug 2021 09:49:11 +0000
X-UUID: a1d81394f1d34f159a38559576d7db15-20210827
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=T9Nqsh1W9d5wkhvrDokpgM9Sq/qoQHGdCf4X8RTbsKY=; 
 b=fSByz6B/2dx6B4q87gJ1p6v8rrr3XlcjMBx/cmH4IvJ3aWYjEly7I+c7xX7OWzfPeIasWa0VUQbHe0vVpfauf6UDzTjdFVTdnQpsNkf2e+xz8vAqoGnX+1xqLo4c3AJoTL6KsDVL+IqsOZrYg3ocM43o2uYzJsA/fOmOjeupF/w=;
X-UUID: a1d81394f1d34f159a38559576d7db15-20210827
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 87911960; Fri, 27 Aug 2021 02:49:01 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 27 Aug 2021 02:43:51 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 27 Aug 2021 17:43:50 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 27 Aug 2021 17:43:49 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: David Ahern <dsahern@gmail.com>
CC: "David S . Miller" <davem@davemloft.net>, Hideaki YOSHIFUJI
 <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <rocco.yue@gmail.com>, <chao.song@mediatek.com>,
 <zhuoliang.zhang@mediatek.com>, Rocco Yue <rocco.yue@mediatek.com>
Subject: Re: [PATCH net-next v5] ipv6: add IFLA_INET6_RA_MTU to expose mtu
 value
Date: Fri, 27 Aug 2021 17:43:33 +0800
Message-ID: <20210827094333.4669-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <6a870141-089d-5e2b-48a7-448695e26238@gmail.com>
References: <6a870141-089d-5e2b-48a7-448695e26238@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_024908_020040_B749DB57 
X-CRM114-Status: GOOD (  16.01  )
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

On Fri, 2021-08-27 at 13:28 +0800, David Ahern wrote:
> On 8/25/21 11:46 PM, Rocco Yue wrote:
>> @@ -5651,6 +5654,9 @@ static int inet6_fill_ifla6_attrs(struct sk_buff *skb, struct inet6_dev *idev,
>>  	if (nla_put_u8(skb, IFLA_INET6_ADDR_GEN_MODE, idev->cnf.addr_gen_mode))
>>  		goto nla_put_failure;
>>  
>> +	if (nla_put_u32(skb, IFLA_INET6_RA_MTU, idev->ra_mtu))
> 
> I should have seen this earlier. The intent here is to only notify
> userspace if the RA contains an MTU in which case this should be
> 
> 	if (idev->ra_mtu &&
> 	    nla_put_u32(skb, IFLA_INET6_RA_MTU, idev->ra_mtu))
> 

Hi David,

Thanks for your pretty suggestion.

When ra_mtu = 0, notify userspace is really unnecessary. At first
I did this because when userspace get ra_mtu = 0 through getlink,
then the corresponding operation can be performed.

After adding the restriction of "idev->ra_mtu", I think userspace can
judge whether the mtu option is carried in the RA by judging whether it
can be parsed to IFLA_INET6_RA_MTU after getlink, and perform the
corresponding operation.

I will push the next version.

> and in which case idev->ra_mtu should be initialized to 0 explicitly,
> not U32_MIN.

will do.

Thanks
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
