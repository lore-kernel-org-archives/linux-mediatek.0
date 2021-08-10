Return-Path: <SRS0=C/QR=NB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84CD8C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 12:43:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4410760EFF
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 12:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4410760EFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9SWFIHj3MpwGUF++cuK78QRn7NtF+brUxjkf05/HHB0=; b=OmRYje8HdWBy7I
	/AsplII5txjzn53kUB49X/JWTE9s5calI6806aoxtKgSisLl61961I18ZCZIZLnpJhmFbUnd9xPIZ
	oEydQiumrvDGqGdMWa5t0psHUNe1E1vzMT9/M1JgJxW0a3PRjAOY9A62OIJ2wwsgQjPhI1e31Msft
	PZDW59nHTBYX/RnmVMibdVSk5ieIDc/EzoamSVJvBRX8jFJyXd6de74zJarGS+Mi99lTjN/TMdWCa
	30ENQyookEPa12E2sD4uOKZKyyLTsoHds5UdfTExpVPt8S7j2MfsRYMzj/+ndg9ej2mUzb67f8T3N
	MG9uw81wd+916lA2jYEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDR5s-003l5g-SI; Tue, 10 Aug 2021 12:42:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDR5m-003l1m-B9; Tue, 10 Aug 2021 12:42:54 +0000
X-UUID: e7614529c8fd491aa7a5f4aaae499e1f-20210810
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=gnYe45wTgx+rkEOY+Q3e/xgIHKbsugTK0L4IH9n9FSw=; 
 b=hsGAcE3OQ8KMLNnlD5opbi5SL6eTR3OB3gaqts1AflDcmiRZpn9ZMX/2wj5d8tEacUMRBm7nznnKnmlyrtB/iN4UagaDFw4SdlrhUAGUp0nqSR8wuSkZ2if/bCALBmbV5FqwJ0I0nXCdLnuwiOPfD6hx2IBJ6qxaFmut4IR5U2M=;
X-UUID: e7614529c8fd491aa7a5f4aaae499e1f-20210810
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 781844428; Tue, 10 Aug 2021 05:42:46 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Aug 2021 05:35:30 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Aug 2021 20:35:28 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 10 Aug 2021 20:35:27 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: David Ahern <dsahern@gmail.com>
CC: "David S . Miller" <davem@davemloft.net>, Hideaki YOSHIFUJI
 <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <rocco.yue@gmail.com>, <chao.song@mediatek.com>,
 <zhuoliang.zhang@mediatek.com>, Rocco Yue <rocco.yue@mediatek.com>
Subject: Re: [PATCH net-next v3] ipv6: add IFLA_INET6_RA_MTU to expose mtu
 value in the RA message
Date: Tue, 10 Aug 2021 20:33:27 +0800
Message-ID: <20210810123327.15998-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <c0a6f817-0225-c863-722c-19c798daaa4b@gmail.com>
References: <c0a6f817-0225-c863-722c-19c798daaa4b@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_054250_437915_2C7FF5BB 
X-CRM114-Status: GOOD (  18.37  )
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

On Mon, 2021-08-09 at 16:43 -0600, David Ahern wrote:
> On 8/9/21 8:01 AM, Rocco Yue wrote:

> +
>>  #ifdef CONFIG_SYSCTL
>>  
>>  static int addrconf_sysctl_forward(struct ctl_table *ctl, int write,
>> diff --git a/net/ipv6/ndisc.c b/net/ipv6/ndisc.c
>> index c467c6419893..a04164cbd77f 100644
>> --- a/net/ipv6/ndisc.c
>> +++ b/net/ipv6/ndisc.c
>> @@ -1496,6 +1496,12 @@ static void ndisc_router_discovery(struct sk_buff *skb)
>>  		memcpy(&n, ((u8 *)(ndopts.nd_opts_mtu+1))+2, sizeof(mtu));
>>  		mtu = ntohl(n);
>>  
>> +		if (in6_dev->ra_mtu != mtu) {
>> +			in6_dev->ra_mtu = mtu;
>> +			inet6_iframtu_notify(in6_dev);
>> +			ND_PRINTK(2, info, "update ra_mtu to %d\n", in6_dev->ra_mtu);
>> +		}
>> +
>>  		if (mtu < IPV6_MIN_MTU || mtu > skb->dev->mtu) {
>>  			ND_PRINTK(2, warn, "RA: invalid mtu: %d\n", mtu);
>>  		} else if (in6_dev->cnf.mtu6 != mtu) {
> 
> Since this MTU is getting reported via af_info infrastructure,
> rtmsg_ifinfo should be sufficient.
> 
> From there use 'ip monitor' to make sure you are not generating multiple
> notifications; you may only need this on the error path.

Hi David,

To avoid generating multiple notifications, I added a separate ramtu notify
function in this patch, and I added RTNLGRP_IPV6_IFINFO nl_mgrp to the ipmonitor.c
to verify this patch was as expected.

I look at the rtmsg_ifinfo code, it should be appropriate and I will use it and
verify it.

But there's one thing, I'm sorry I didn't fully understand the meaning of this
sentence "you may only need this on the error path". Honestly, I'm not sure what
the error patch refers to, do you mean "if (mtu < IPV6_MIN_MTU || mtu > skb->dev->mtu)" ?

Thanks
Rocco
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
