Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70FB3C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 03:44:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FD2C6024A
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 03:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2FD2C6024A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oDG456J6ErP2QIvR0Z6A1IGRK8BtxBUa+Ch3RbY1ags=; b=xtH5odV6A04ne7
	jrbGIR7W4YkasiFbBj9odK5MirEEaGMf7sHhd6FDJDdGYCMcoXtG4hwirPyGgAEpmS+7XR38HP3s4
	1tOaBTP4ZuT2aUheP5CUi80UhhNt7j4LPOJIC5e8Iw/MCidg/7z7rvnF8oD7aVnzvvUzV6yd5ehpq
	8rFH96tSQBGL5En6yCM70SfPmAHxVk0oZU9gdEBfSimuFhbADpya/Xiy0bl0U7f5Xh7BkHrpcIeyI
	F54e46mCX+vs/0wpiqPkb5lgYlA0PttUtn/kJcOHzjutbh5qv0X5/apWXvF5gupDTpUeuo854AHL2
	FnBNkSDGOUaTHETc/U6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAOs9-00ErYe-Um; Mon, 02 Aug 2021 03:44:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAOrx-00ErWb-EX; Mon, 02 Aug 2021 03:44:02 +0000
X-UUID: fdbdc411b7c64042aac401da6ab0dde5-20210801
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ZK3e9Sg7ghuyh77VEHKTRyGoBtj/73rumt2QQW4OnHM=; 
 b=I1sTjCKmkm3Pr3FQlnuF3fvH+3ffvbvnfU5jGUKMMyBKeEdvjbffWFmT0UgOc54aN3XB7mcpmbzdf9zdyu+YuZEAVI6qqmyHdgzzoMPKPRmvbbSD5UkRGPBsZDEaGvxPLXYQDRA3yioZUN31DLcaQpYvdULWrdjJh7q5kQuNep0=;
X-UUID: fdbdc411b7c64042aac401da6ab0dde5-20210801
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1302458776; Sun, 01 Aug 2021 20:43:58 -0700
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 1 Aug 2021 20:35:56 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS32N1.mediatek.inc (172.27.4.71) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 2 Aug 2021 11:35:49 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 2 Aug 2021 11:35:48 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: David Ahern <dsahern@kernel.org>
CC: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <rocco.yue@gmail.com>, <chao.song@mediatek.com>,
 <zhuoliang.zhang@mediatek.com>, Rocco Yue <rocco.yue@mediatek.com>
Subject: Re: [PATCH net-next v2] ipv6: add IFLA_INET6_RA_MTU to expose mtu
 value in the RA message
Date: Mon, 2 Aug 2021 11:19:24 +0800
Message-ID: <20210802031924.3256-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <5be90cf4-f603-c2f2-fd7e-3886854457ba@gmail.com>
References: <5be90cf4-f603-c2f2-fd7e-3886854457ba@gmail.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 717DC6BBB0EEBCBF51C02B29FAF02E489CDAC93F80059C78A30F86F824E5FC2D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210801_204401_541119_2E1379FF 
X-CRM114-Status: GOOD (  20.64  )
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

On Sat, 2021-07-31 at 11:17 -0600, David Ahern wrote:
On 7/30/21 7:52 PM, Rocco Yue wrote:
>> In this way, if the MTU values that the device receives from
>> the network in the PCO IPv4 and the RA IPv6 procedures are
>> different, the user space process can read ra_mtu to get
>> the mtu value carried in the RA message without worrying
>> about the issue of ipv4 being stuck due to the late arrival
>> of RA message. After comparing the value of ra_mtu and ipv4
>> mtu, then the device can use the lower MTU value for both
>> IPv4 and IPv6.
> 
> you are storing the value and sending to userspace but never using it
> when sending a message. What's the pointing of processing the MTU in the
> RA if you are not going to use it to control message size?

Hi David,

In the requirement of mobile operator at&t in 2021:
AT&T <CDR-CDS-116> Prioritize Lower MTU value:
If the MTU values that the device receives from the network in the PCO
IPv4 <CDR-CDS-110> and the RA IPv6 <CDR-CDS-112> procedures are different,
then the device shall use the lower MTU value for both IPv4 and IPv6.

And in the 3GPP 23.060:
The PDP PDUs shall be routed and transferred between the MS and the GGSN
or P-GW as N-PDUs. In order to avoid IP layer fragmentation between the
MS and the GGSN or P-GW, the link MTU size in the MS should be set to the
value provided by the network as a part of the IP configuration. This
applies to both IPv6 and IPv4.

That means user needs to be able to correctly read the mtu value carried
in the RA message so that user can correctly compare PCO ipv4 mtu and
RA ipv6 mtu.

>> @@ -5761,6 +5765,7 @@ static int inet6_set_iftoken(struct inet6_dev *idev, struct in6_addr *token,
>>  static const struct nla_policy inet6_af_policy[IFLA_INET6_MAX + 1] = {
>>  	[IFLA_INET6_ADDR_GEN_MODE]	= { .type = NLA_U8 },
>>  	[IFLA_INET6_TOKEN]		= { .len = sizeof(struct in6_addr) },
>> +	[IFLA_INET6_RA_MTU]		= { .type = NLA_U32 },
>>  };
>>  
>>  static int check_addr_gen_mode(int mode)
> 
> Its value is derived from an RA not set by userspace, so set the type to
> NLA_REJECT so that inet6_validate_link_af will reject messages that have
> IFLA_INET6_RA_MTU set. You can set "reject_message" in the policy to
> return a message that "IFLA_INET6_RA_MTU can not be set".

will do.

Thanks
Rocco
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
