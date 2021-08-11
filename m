Return-Path: <SRS0=F7c8=NC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA59C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 13:57:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A72B60231
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 13:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A72B60231
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=J/zIOHobJ1Bj5QOYM1y+5oSx1IB5diJXkydrobY8vzU=; b=m1BC5UOgV859QzUzmUXa1iudOR
	Xt8UKG4UOSYDCHSeiUYPZxjco/SPNRTMBFiwCHEPDPI0lHmJBI8NPBIB6l8UuqKHoJtMmrXf2a8lq
	GNKevRKyFKTcij6DNerJcE06btjsGBMZplzP8OiBZn7XIwG7ctiHT1mY3dnXli49RMN8jYwkHiU68
	4Y8rQ3un7bUuIMiaEoV09MMcvvJFM2OxYckvh9slMhyeXshp8idKoTh8rn879wOhLvytrMnMnuh1V
	ONCenDe61BH1duZ+D4tjonzHc3hzOrKyFUutKGasY34I5IDTmpRY/jwiQ872R6ZS+4oCeQgx0mzqv
	eHp13fvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDojC-007OHs-4Z; Wed, 11 Aug 2021 13:57:06 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDoj9-007OHJ-0B; Wed, 11 Aug 2021 13:57:04 +0000
Received: by mail-oi1-x232.google.com with SMTP id o20so4614536oiw.12;
 Wed, 11 Aug 2021 06:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bIBlP3UwzKpqrkTRDPJtDHwi6egy8ClHSbK6GsDGiO4=;
 b=eQM3hy0sFYoc8BCC11C8wX27ZlVsL25n5IqWc9uavRaYdYMJJTg37oJItt3nbIRPfe
 VA1Wph3SpWDzf9yk0VObgehNz5yVg0c4dtNfJGsORCXciYT3j3EnR4oq7jDMgIQDpj8m
 a2HpHbs19eYFJjyQIGvAtxIFgMBll5p0rpy3mfstDEg61bG0Xjsfo5KTLTpu6zCMx1wU
 5IJnGWD6okHwloDW021IE5n/z+FyT6ys5rfo6rosb8eeblpqsef8V/QxOYLGFF9f2FV4
 3NiwKVR3yHld4KT+ZbVVBmsFcpmCcUwz08MK6g4rHNhJkf8ry3xSJEM3iJiIlRzBhhey
 Gqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bIBlP3UwzKpqrkTRDPJtDHwi6egy8ClHSbK6GsDGiO4=;
 b=R0bkVxCRGT+ddkXWr+7voPdm+9SVaNZxtIE9uE/66FR8so70+3MQ/Rl/gtW3NOHII1
 hAxhJXgx39b/1vjSBzzfaBeBLrDSEledgoiMTGlkX9hyKyzyCauVxC9/3XWxDB/Ip6iz
 Wyg7DM3xvYlRGQ1Hiti+Qh7zt4A1Q7AwtDpqAy3YUH/9rDEsTY3jtX/0GNtFp2uqGION
 ZbpjYt4fWcc4fiyI8Xp1pB5JWlWXPfwrel1g78E61m6dnoyfjMpNNbtx5znw2pw8dfHk
 Quq/JYORcjciFBT/Zyqxi26FoRuZliSWVOVEquxwCCgcXb6F6mLwP7VwW40Cys/MmRjO
 LCyw==
X-Gm-Message-State: AOAM532/m3LYUugWFZTwrgMMYirlGOjDjIDMdhMEzUtD0HiDK7oeqCdY
 ow/N/tYUp/GtyzAQrXJMalE=
X-Google-Smtp-Source: ABdhPJxfYd7WuRuE7eu7Z1jeM+G/vO74qHut8Y47MOkI0xaLfLjRtiL5dj9vY28R9X+ZClUmCa6WUA==
X-Received: by 2002:a05:6808:14:: with SMTP id
 u20mr7722445oic.150.1628690221588; 
 Wed, 11 Aug 2021 06:57:01 -0700 (PDT)
Received: from Davids-MacBook-Pro.local ([8.48.134.45])
 by smtp.googlemail.com with ESMTPSA id y33sm1548029ota.66.2021.08.11.06.57.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Aug 2021 06:57:01 -0700 (PDT)
Subject: Re: [PATCH net-next v3] ipv6: add IFLA_INET6_RA_MTU to expose mtu
 value in the RA message
To: Rocco Yue <rocco.yue@mediatek.com>
Cc: "David S . Miller" <davem@davemloft.net>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, David Ahern
 <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, rocco.yue@gmail.com,
 chao.song@mediatek.com, zhuoliang.zhang@mediatek.com
References: <c0a6f817-0225-c863-722c-19c798daaa4b@gmail.com>
 <20210810123327.15998-1-rocco.yue@mediatek.com>
From: David Ahern <dsahern@gmail.com>
Message-ID: <25dcf6e8-cdd6-6339-f499-5c3100a7d8c4@gmail.com>
Date: Wed, 11 Aug 2021 07:56:59 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210810123327.15998-1-rocco.yue@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_065703_128342_705B6063 
X-CRM114-Status: GOOD (  23.75  )
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

On 8/10/21 6:33 AM, Rocco Yue wrote:
> On Mon, 2021-08-09 at 16:43 -0600, David Ahern wrote:
>> On 8/9/21 8:01 AM, Rocco Yue wrote:
> 
>> +
>>>  #ifdef CONFIG_SYSCTL
>>>  
>>>  static int addrconf_sysctl_forward(struct ctl_table *ctl, int write,
>>> diff --git a/net/ipv6/ndisc.c b/net/ipv6/ndisc.c
>>> index c467c6419893..a04164cbd77f 100644
>>> --- a/net/ipv6/ndisc.c
>>> +++ b/net/ipv6/ndisc.c
>>> @@ -1496,6 +1496,12 @@ static void ndisc_router_discovery(struct sk_buff *skb)
>>>  		memcpy(&n, ((u8 *)(ndopts.nd_opts_mtu+1))+2, sizeof(mtu));
>>>  		mtu = ntohl(n);
>>>  
>>> +		if (in6_dev->ra_mtu != mtu) {
>>> +			in6_dev->ra_mtu = mtu;
>>> +			inet6_iframtu_notify(in6_dev);
>>> +			ND_PRINTK(2, info, "update ra_mtu to %d\n", in6_dev->ra_mtu);
>>> +		}
>>> +
>>>  		if (mtu < IPV6_MIN_MTU || mtu > skb->dev->mtu) {
>>>  			ND_PRINTK(2, warn, "RA: invalid mtu: %d\n", mtu);
>>>  		} else if (in6_dev->cnf.mtu6 != mtu) {
>>
>> Since this MTU is getting reported via af_info infrastructure,
>> rtmsg_ifinfo should be sufficient.
>>
>> From there use 'ip monitor' to make sure you are not generating multiple
>> notifications; you may only need this on the error path.
> 
> Hi David,
> 
> To avoid generating multiple notifications, I added a separate ramtu notify
> function in this patch, and I added RTNLGRP_IPV6_IFINFO nl_mgrp to the ipmonitor.c
> to verify this patch was as expected.
> 
> I look at the rtmsg_ifinfo code, it should be appropriate and I will use it and
> verify it.
> 
> But there's one thing, I'm sorry I didn't fully understand the meaning of this
> sentence "you may only need this on the error path". Honestly, I'm not sure what
> the error patch refers to, do you mean "if (mtu < IPV6_MIN_MTU || mtu > skb->dev->mtu)" ?
> 

looks like nothing under:
    if (ndopts.nd_opts_mtu && in6_dev->cnf.accept_ra_mtu) {

    }

is going to send a link notification so you can just replace
inet6_iframtu_notify with rtmsg_ifinfo in your proposed change.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
