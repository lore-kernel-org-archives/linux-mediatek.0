Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A88F3C07E99
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 16:35:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C60661952
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 16:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C60661952
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PNYOCaDdeDnIVSi9k3Ux2pToijA2kbSA2gqnZ0D0eaU=; b=PTp8Dd7jviDD9dQLbaZ6P5B/HH
	+YwH8/cHkG3DjhrOxIyfd7MYfMkE7YZiTv5kA9n2ciGAXjVs8t0x+7f3Wxc0igEHdJcBOaiKmPoKU
	wVjIqearkbmblMTkZ7N8QzT3W7fjAtFbApMjSWR65fDaTv2HJHYWZG35w7k5mlnfsyalsu2qBxGXT
	thZ81r2zSuR/s2QlY7Zz2dXUgINBW2q2YfembYjFFAjpGpdduOPLfTUqrOJWKwSGFqVU1FEI+ztTv
	GLdl4mOLr0BdOdpYQEWtAZs+j1CuBB1zFGFBpI17PCNWGnPYQEPt1kfnaB7sq3gjgHvIGM7XN9755
	arDK898Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0RYq-009VTB-1L; Mon, 05 Jul 2021 16:35:08 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0RYn-009VSH-6C; Mon, 05 Jul 2021 16:35:06 +0000
Received: by mail-ot1-x330.google.com with SMTP id
 x22-20020a9d6d960000b0290474a76f8bd4so17217640otp.5; 
 Mon, 05 Jul 2021 09:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2TAR10t0SeeOnNIpVqOCA/P0iG1nNKQebPXrjWaJtb8=;
 b=rHesvuimK2TFARWHbzpaATGZCmguf1XLopFhCTk8H0teOqcYrl44e1MoR0WPrDJo/Z
 +C1fVSdrhfunXLnR4etceGNEOxs/t9aC+7m3yg9wKrlQgilx6BGoXT6LN618mX9qAT8f
 NNXqsjZ1+/P7sXs00JmLMHkQC3XixmKhfV8PHXF6ftHAmI+4HDIal4T5f0eCM9lSomIW
 ojg8xfqc493+vgeCdpd2J8VLOGMn4xGFZCDXQVlhSiAthDI+HLz/i4ayptgYKMvpM9XI
 pB8NodwdI1FXS1JlISb48mrSVitpdYDyK0oeKEzwT/m33YV6ObsxbW2Ttz+dBVz1gmX8
 u44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2TAR10t0SeeOnNIpVqOCA/P0iG1nNKQebPXrjWaJtb8=;
 b=SOJjAsm5dAUu8GL7TrPqAufTnjvS3Upyc6bqK7+lOpUcl3FTbtJE5A/lLBxATs6N/7
 p09S5oSoMk1anDkfoGKE0Juees2NSsmhdN0LXjEL9E7Y/1W/UJUtuzgowJ3cM4kwkfTQ
 gx9OAfYDw9i7Fs9L5jbjEyDJrNznv6Tk99FLZ+CoVaK6ab7ArbOAi14TrOugWliJXfbv
 jWxQVWIU8CQ9CeMsr1fpnx7XQHuzDdpZldonU60smjMW8jEPySAWXTarVQry3UdQN095
 gP/NoxYK/bBnkrkj/z8D87333ihesVbQJ6t7yTaKXHAL+WgIojpnSmf14ZNq5KAuiR6X
 1Few==
X-Gm-Message-State: AOAM533ZisPcYs9tEnPVIHkXcVke7x+MsyrQA9Pr/4k/H+fzotrir4H+
 bi2h3rta6JnUrHMIi6jmllc=
X-Google-Smtp-Source: ABdhPJwnjz4hvEqwtKjSPE7H7MmjVjGF2KI7AM+yiP4/0VF/t9dcVNqbrVzot4kwkj/23frWhct5Qw==
X-Received: by 2002:a9d:17d0:: with SMTP id j74mr11215444otj.92.1625502903254; 
 Mon, 05 Jul 2021 09:35:03 -0700 (PDT)
Received: from Davids-MacBook-Pro.local ([8.48.134.38])
 by smtp.googlemail.com with ESMTPSA id b20sm132106ots.26.2021.07.05.09.35.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 09:35:02 -0700 (PDT)
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
References: <46a9dbf2-9748-330a-963e-57e615a15440@gmail.com>
 <20210701085117.19018-1-rocco.yue@mediatek.com>
From: David Ahern <dsahern@gmail.com>
Message-ID: <62c9f5b7-84bd-d809-4e33-39fed7a9d780@gmail.com>
Date: Mon, 5 Jul 2021 10:35:00 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701085117.19018-1-rocco.yue@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_093505_287107_E367A31F 
X-CRM114-Status: GOOD (  25.79  )
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

On 7/1/21 2:51 AM, Rocco Yue wrote:
> On Wed, 2021-06-30 at 22:41 -0600, David Ahern wrote:
>> On 6/30/21 9:39 PM, Rocco Yue wrote:
>>>
>>> Hi David,
>>>
>>> Thanks for your review.
>>>
>>> This patch is different with IN6_ADDR_GEN_MODE_NONE.
>>>
>>> When the addr_gen_mode == IN6_ADDR_GEN_MODE_NONE, the Linux kernel
>>> doesn't automatically generate the ipv6 link-local address.
>>>
>>
>> ...
>>
>>>
>>> After this patch, when the "disable_gen_linklocal_addr" value of a device
>>> is 1, no matter in which addr_gen_mode, the Linux kernel will not automatically
>>> generate an ipv6 link-local for this device.
>>>
>>
>> those 2 sentences are saying the same thing to me.
>>
>> for your use case, why is setting addr_gen_mode == 1 for the device not
>> sufficient?
>>
> 
> For mobile operators that don't need to support RFC7217, setting
> addr_gen_mode == 1 is sufficient;
> 
> But for some other mobile operators that need to support RFC7217, such as AT&T,
> the mobile device's addr_gen_mode will be switched to the
> IN6_ADDR_GEN_MODE_STABLE_PRIVACY, instead of using IN6_ADDR_GEN_MODE_NONE.
> The purpose is: in the IN6_ADDR_GEN_MODE_STABLE_PRIVACY mode, kernel can
> gererate a stable privacy global ipv6 address after receiveing RA, and
> network processes can use this global address to communicate with the
> outside network.
> 
> Of course, mobile operators that need to support RFC7217 should also meet
> the requirement of 3GPP TS 29.061, that is, MT should use IID assigned by
> the GGSN to build its ipv6 link-local address and use this address to send RS.
> We don't want the kernel to automatically generate an ipv6 link-local address
> when addr_gen_mode == 2. Otherwise, using the stable privacy ipv6 link-local
> address automatically generated by the kernel to send RS message, GGSN will
> not be able to respond to the RS and reply a RA message.
> 
> Therefore, after this patch, kernel will not generate ipv6 link-local address
> for the corresponding device when addr_gen_mode == 1 or addr_gen_mode == 2.
> 

I think another addr_gen_mode is better than a separate sysctl. It looks
like IN6_ADDR_GEN_MODE_STABLE_PRIVACY and IN6_ADDR_GEN_MODE_RANDOM are
the ones used for RAs, so add something like:

IN6_ADDR_GEN_MODE_STABLE_PRIVACY_NO_LLA,
IN6_ADDR_GEN_MODE_RANDOM_NO_LLA,

to in6_addr_gen_mode.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
