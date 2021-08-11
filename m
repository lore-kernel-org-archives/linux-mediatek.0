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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9883AC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 18:06:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4694E60FE6
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 18:06:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4694E60FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:From:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=xHmLnnJlVzaQfIDaK5S1nA2Ay8qmTCG+AbK3BLyIxOk=; b=lfTynLiEl5vz1QVjgFWV+nh/cx
	/N/9Cg5LZxoQgH8lKx5AzKSp+jpf0Din+rOeVnRYxYwO9fIBIKGbKUfLuH+dTbJYb08/dpd2xXtdr
	kweernRaYSiGtbR7ZjkDWj7o+9RRKKAmnMel/DfIi9OVsm2Wll4dQ4rtmQev/35wGTR4DwSp/r7Zh
	GnVDlxb025tudS6emb25r5xz6X8TRiW9S8l6j3fV5H1iNWZeK9Th6myXaTrwbuenndsvEudEfbd/U
	yewUrjv3Mis8RTAvqqVReEsfdfQEvGhdWfu4CYtM7qaxBwpaH5iCCblbLkAgIVjdvDncTd3rtgHmR
	Yv2FeNCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDsc5-007qfN-Fd; Wed, 11 Aug 2021 18:06:01 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDsc2-007qe1-SY; Wed, 11 Aug 2021 18:06:00 +0000
Received: by mail-oi1-x22d.google.com with SMTP id y18so5869016oiv.3;
 Wed, 11 Aug 2021 11:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HxY/WUTgeQY0+6YEwdFvZK8RANC+Nq5/hbFGvTroIBM=;
 b=p81Yc26djxFQaFJ7NCFX+EPjY/jGcWPm7G7gzBeo8h2Quj/TIkPrGw+tCco45s5uGo
 8GE7rTun/3e5fHaqqTXPhObCbK/GLHMUabdwENh1i6TMXc0SATjhRCgOpoIod4kBEyq9
 f4gPXpOGlQM/BnIDHDhWzVIWx2h9xLTcbTdIo2gK2Rt2EnNKDPExVAJx8NKLeKD9eNuP
 MLWNFOc7ODFeFkGxIsU7NcbbNXUsaDxQpKgTNMxv7+YmT8ynmhRTK3OgXlFxpscdsNrg
 nBXvFHNOPMJMceHBKUdbd8cc/HofHj7MSrlV24pSxRftwLeqapLuSbf2EmCWeJ5R0ziX
 KVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HxY/WUTgeQY0+6YEwdFvZK8RANC+Nq5/hbFGvTroIBM=;
 b=T0vACZX9tG2O6tTRwlIYNR0hL+SOTjB92GFlSdw+poz1a5qPWv4Rf62mzRORylTcei
 ln7NFlzNnnDHv5u7LJBfmOzBMHRzrjhEacGFWXjJ4OwK52wqH1o3rFVmk5D8RTC0KuJ0
 PJIvyeqdLMSVLG/SV8W/dc47qvts+QlpiE+IZM4+vM6jtClTtWvmB9Q+8or2p7GpV8Ge
 O93mlevTmoMQzJ0rM3Yo9PxlDzXHDdl0rVR0kVVTNypBl06CfEq+jwvTGpfkSQji26IK
 aeZaLATpgwQxPRZnGlMMkXVeUyY2QAbcSXG7lxLjEIVzlJ8ChmdoCVwuY05Q0bXGYwSC
 XPxA==
X-Gm-Message-State: AOAM533RmmYR9bH97FSOWeMCDCxt0PQ8Vej4vh2e54eJmme40kj81Fcq
 +Aw7/ssDsmQuvG4zXp617ls=
X-Google-Smtp-Source: ABdhPJy/5AUXtuljNkc5tzk/CAVNEAidUYBLMgUS5IwUQjZNN0/xFCqRkgygQxR5lzENJkC/vuG+tA==
X-Received: by 2002:a05:6808:905:: with SMTP id
 w5mr5155632oih.27.1628705157682; 
 Wed, 11 Aug 2021 11:05:57 -0700 (PDT)
Received: from Davids-MacBook-Pro.local ([8.48.134.45])
 by smtp.googlemail.com with ESMTPSA id e10sm2790673oig.42.2021.08.11.11.05.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Aug 2021 11:05:57 -0700 (PDT)
Subject: Re: [PATCH net-next v3] ipv6: add IFLA_INET6_RA_MTU to expose mtu
 value in the RA message
From: David Ahern <dsahern@gmail.com>
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
 <25dcf6e8-cdd6-6339-f499-5c3100a7d8c4@gmail.com>
Message-ID: <4624cc10-1fc8-12cd-e9e1-9585f5b496a0@gmail.com>
Date: Wed, 11 Aug 2021 12:05:54 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <25dcf6e8-cdd6-6339-f499-5c3100a7d8c4@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_110558_985264_B57337ED 
X-CRM114-Status: GOOD (  25.66  )
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

On 8/11/21 7:56 AM, David Ahern wrote:
> On 8/10/21 6:33 AM, Rocco Yue wrote:
>> On Mon, 2021-08-09 at 16:43 -0600, David Ahern wrote:
>>> On 8/9/21 8:01 AM, Rocco Yue wrote:
>>
>>> +
>>>>  #ifdef CONFIG_SYSCTL
>>>>  
>>>>  static int addrconf_sysctl_forward(struct ctl_table *ctl, int write,
>>>> diff --git a/net/ipv6/ndisc.c b/net/ipv6/ndisc.c
>>>> index c467c6419893..a04164cbd77f 100644
>>>> --- a/net/ipv6/ndisc.c
>>>> +++ b/net/ipv6/ndisc.c
>>>> @@ -1496,6 +1496,12 @@ static void ndisc_router_discovery(struct sk_buff *skb)
>>>>  		memcpy(&n, ((u8 *)(ndopts.nd_opts_mtu+1))+2, sizeof(mtu));
>>>>  		mtu = ntohl(n);
>>>>  
>>>> +		if (in6_dev->ra_mtu != mtu) {
>>>> +			in6_dev->ra_mtu = mtu;
>>>> +			inet6_iframtu_notify(in6_dev);
>>>> +			ND_PRINTK(2, info, "update ra_mtu to %d\n", in6_dev->ra_mtu);
>>>> +		}
>>>> +
>>>>  		if (mtu < IPV6_MIN_MTU || mtu > skb->dev->mtu) {
>>>>  			ND_PRINTK(2, warn, "RA: invalid mtu: %d\n", mtu);
>>>>  		} else if (in6_dev->cnf.mtu6 != mtu) {
>>>
>>> Since this MTU is getting reported via af_info infrastructure,
>>> rtmsg_ifinfo should be sufficient.
>>>
>>> From there use 'ip monitor' to make sure you are not generating multiple
>>> notifications; you may only need this on the error path.
>>
>> Hi David,
>>
>> To avoid generating multiple notifications, I added a separate ramtu notify
>> function in this patch, and I added RTNLGRP_IPV6_IFINFO nl_mgrp to the ipmonitor.c
>> to verify this patch was as expected.
>>
>> I look at the rtmsg_ifinfo code, it should be appropriate and I will use it and
>> verify it.
>>
>> But there's one thing, I'm sorry I didn't fully understand the meaning of this
>> sentence "you may only need this on the error path". Honestly, I'm not sure what
>> the error patch refers to, do you mean "if (mtu < IPV6_MIN_MTU || mtu > skb->dev->mtu)" ?
>>
> 
> looks like nothing under:
>     if (ndopts.nd_opts_mtu && in6_dev->cnf.accept_ra_mtu) {
> 
>     }
> 
> is going to send a link notification so you can just replace
> inet6_iframtu_notify with rtmsg_ifinfo in your proposed change.
> 

Taking a deeper dive on the code, you do not need to call rtmsg_ifinfo.
Instead, the existing:

        /*
         *      Send a notify if RA changed managed/otherconf flags or
timer settings
         */
        if (send_ifinfo_notify)
                inet6_ifinfo_notify(RTM_NEWLINK, in6_dev);

is called too early. For one the RA can change the MTU and that is done
after this notify.

I think if you moved this down to the out:

out:
        /*
         *      Send a notify if RA changed managed/otherconf flags or
timer settings
         */
        if (send_ifinfo_notify)
                inet6_ifinfo_notify(RTM_NEWLINK, in6_dev);

and then set send_ifinfo_notify when the mtu is *changed* by the RA you
should be good.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
