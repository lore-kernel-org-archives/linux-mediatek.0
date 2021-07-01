Return-Path: <SRS0=jcdg=LZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F8A1C11F64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 04:41:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C94F46146B
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 04:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C94F46146B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=l7nqcRysqPXwgoue8USy9znXjMUpMb3unRSWGaR1fqo=; b=Y/9s26aTj/7zifAslUZ4QNdUM2
	YyxTRqPqtRy5RMAFangoW4CHdToascinHWQnlKrdFhSNyHPWJT+XIEXX6pMZWroJqBia657USQO+K
	fDonAThgN0SSR4+SDVSfyH+Ektda+JcDkN1OEeLhaz66PYT8eT7Vi+aBD+lGtZZcSO85NyyAlcX+o
	mxNXm9zQr0FM0VfhROta6nZf77IBHosQxiEPdkItA1yQLI4QoVEfcX2kudLUugt/DfktH+ozTQSKb
	UwD1MAYACvhMPrECkJsi0vy47gokt1mWyqOcoy8v9YkLS0SeF3icl3+Ry3eht1z7qWZ6W8HulAE51
	ZPi7lcWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyoW6-00G6gR-70; Thu, 01 Jul 2021 04:41:34 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyoW4-00G6g0-5t; Thu, 01 Jul 2021 04:41:33 +0000
Received: by mail-oi1-x233.google.com with SMTP id o6so5841784oic.9;
 Wed, 30 Jun 2021 21:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ULZfPJnXFZifSjfdbhwtJxBX08db8bBGWvZTGfYyVog=;
 b=SaUIeMwU9ZfcVbwMg1gCvQSr9O8/iAVHlTuuGaSO23aqy5hzsIpWLtN9F0ZkLl7S8h
 sXERkfOYm8aBpV/ZfOZFc9JrYuY2sQSVAIwihOBOjv4ZTAoj1IiGg+qS6qku3J8OzxpK
 mODvlNIjvRof/wfmfHMuxB3Bpha3pPkf4SSEx8DfS9QK+5TFFP9VhIvGLc3upnL4GNzl
 +78ody4y+olE1VotFvRvn94uAfKFuHZEt9UjLZc3H/P0JzrQH1GinVYExBKOywz0n9Po
 H6JzDptcIervypalzZBGedV7J16U9T9NmtBzWLyCkrz1Tc6II05qiBE3tGvd31Qa9USS
 3kQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ULZfPJnXFZifSjfdbhwtJxBX08db8bBGWvZTGfYyVog=;
 b=eDhNNlXIHt9Y3Uw1Q6bCJBKyATE5I5E/lr55tOC5u3FnjaAhZS4Y3NuLndvZZNSDyw
 SJ47Dk9SoOLZ97SR0z3tE5axG6XBSqFOn6Z/XsLQKoMTmQhf3Tas9zNcLX15teljEfvD
 QQy6j3b0Z5lqbHhgcgsNJdP7Ro1udI5J4+XD7pJ+HWEU75VlvY0BT2dXdql1+D2JRjX5
 1o/qFDcUIk5pODXcZdKDaJFStiOHq7gX6jLu8pjfvyaAiUJ/VvICWp/jgQLAdwz6+5aJ
 aDbRIZAr1PV4oweFhh7x1i/2m+agi1bZI0y4wWzlUZfr1gBE8ylMNSdfbPB+oyGQoCWs
 eJFA==
X-Gm-Message-State: AOAM5303IjeVczNshvRzQi0RaRg0QovtFD/nW3Q7sKx1VQVKJzU9tvwf
 IgQ27LYZxctXMlHZuZvMTVU=
X-Google-Smtp-Source: ABdhPJwng88MdmilLbYrvSx4xD7nBARB1R0iz1j9OQ+rXTBXgSdeicMT0lKSXKhcnPxjODOd9EOq0g==
X-Received: by 2002:a05:6808:301:: with SMTP id
 i1mr27556536oie.144.1625114490758; 
 Wed, 30 Jun 2021 21:41:30 -0700 (PDT)
Received: from Davids-MacBook-Pro.local ([8.48.134.38])
 by smtp.googlemail.com with ESMTPSA id o24sm5326459otp.13.2021.06.30.21.41.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 21:41:30 -0700 (PDT)
Subject: Re: [PATCH] net: ipv6: don't generate link-local address in any
 addr_gen_mode
To: Rocco Yue <rocco.yue@mediatek.com>
Cc: "David S . Miller" <davem@davemloft.net>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, David Ahern
 <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
 rocco.yue@gmail.com, chao.song@mediatek.com, kuohong.wang@mediatek.com,
 zhuoliang.zhang@mediatek.com
References: <3c0e5c52-4204-ae1e-526a-5f3a5c9738c2@gmail.com>
 <20210701033920.5167-1-rocco.yue@mediatek.com>
From: David Ahern <dsahern@gmail.com>
Message-ID: <46a9dbf2-9748-330a-963e-57e615a15440@gmail.com>
Date: Wed, 30 Jun 2021 22:41:26 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701033920.5167-1-rocco.yue@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_214132_294016_4124C1AC 
X-CRM114-Status: GOOD (  19.96  )
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

On 6/30/21 9:39 PM, Rocco Yue wrote:
> On Wed, 2021-06-30 at 21:03 -0600, David Ahern wrote:
> On 6/30/21 7:59 PM, Rocco Yue wrote:
>>> This patch provides an ipv6 proc file named
>>> "disable_gen_linklocal_addr", its absolute path is as follows:
>>> "/proc/sys/net/ipv6/conf/<iface>/disable_gen_linklocal_addr".
>>>
>>> When the "disable_gen_linklocal_addr" value of a device is 1,
>>> it means that this device does not need the Linux kernel to
>>> automatically generate the ipv6 link-local address no matter
>>> which IN6_ADDR_GEN_MODE is used.
>>>
>>
>> doesn't this duplicate addr_gen_mode == 1 == IN6_ADDR_GEN_MODE_NONE?
>>
> 
> Hi David,
> 
> Thanks for your review.
> 
> This patch is different with IN6_ADDR_GEN_MODE_NONE.
> 
> When the addr_gen_mode == IN6_ADDR_GEN_MODE_NONE, the Linux kernel
> doesn't automatically generate the ipv6 link-local address.
> 

...

> 
> After this patch, when the "disable_gen_linklocal_addr" value of a device
> is 1, no matter in which addr_gen_mode, the Linux kernel will not automatically
> generate an ipv6 link-local for this device.
> 

those 2 sentences are saying the same thing to me.

for your use case, why is setting addr_gen_mode == 1 for the device not
sufficient?


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
