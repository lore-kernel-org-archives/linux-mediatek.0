Return-Path: <SRS0=kQJD=N7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F9DC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Sep 2021 19:13:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D0E160ED8
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Sep 2021 19:13:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D0E160ED8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=nlmx+wAyxSFdPmsQ19IPN9kT5DN3yt9wl30tIojwh8k=; b=Nmah7ghox1LUXlIzczlLSeKY27
	msHt/ZtrXRDc4ywcczEHm/7IH3YVw/CkfrgmcNWNkuamrRFTVWiJVxEI4Bn6wv/x6g3J18nVjSQaY
	7ZD1urGkjbETdizHMnPl43XHx72hNl9gNjJUeZh8IvuvRFVEu6XvF7shyPvQaFb4uOt92pSXcNdbl
	N6OCPFKY0tjgTNFb53IDxXJKt6NIRvWqL4d3VDTzKHg/COsAcugtD/Jd5ywV5i8kjIr9BQ3fc+JdH
	ioYZNHG0NqAmMpNGrWHhyk7iHbqkDNDx7q+a1WwYDOmCnoNlkoaH+E0ouUw67iNQLo1NrWnfF331J
	UhmHkZiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOPTX-00Agkd-Ik; Thu, 09 Sep 2021 19:12:43 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOPTU-00Agjy-Mq; Thu, 09 Sep 2021 19:12:42 +0000
Received: by mail-oi1-x22f.google.com with SMTP id n27so3959651oij.0;
 Thu, 09 Sep 2021 12:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qPQHwAFiSYdLyleAbELrQZ2a09NIC4IXr92lC8k0Z2o=;
 b=iP93NZjLCWK7wrqXWEzIuyPF1eZNfnZ3JjpCM3RA+qd12seWfFmLUQQbh+/RrxpGmj
 ENQ8gOluBLG8GHQBb+a97ETd6UUMNun19AFQwNotAQqAdX27mfavG+nw0dNPuLCBqUnj
 Slj6zu9FeZDMvZgcz51saRw1LklQCwZSjgoemHLLI6hM4s7/i75qfYjqhS+kY/kdG65l
 a/EUPjXbQjZYFgENdYljH7VsPsAPkSdnX/JDpdMEO9TxVkMY1EDW12ESbmKouOuC4BG1
 xwWKt8CWA5ypzZ8KgPSxKgDua/+uNGDAhtQsXwO9G5+SjqVMkgRPBCMsyS1PlTQHU7iE
 m97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qPQHwAFiSYdLyleAbELrQZ2a09NIC4IXr92lC8k0Z2o=;
 b=YhXveV1LndFtCjOdpuLPWsBut/cBBt3jQrxjmjFfGyT78H5csBAyJbiH602BMwJ+7X
 5yaYI2B0WywBbShN9hSCdcB9+xq/irE2PDrZHX5t1gzAewoawRDH87h6fKX3NWS+gyDH
 sPR9BQguaRHxGXzvy1thdin4MdRTboBRi84UbuPvcQZYOvRLVjLlUz+GimAl6h+Rj4IM
 Lt/QPkXeUbVgz87XMX/S1baDNLXYsQeY4fLwjNPbeQuBKfCohDYpYuJae33ZOduWHHeQ
 HnXfifk8TFlRsr35qyx0f0NKQBbjYeZBLIBwYe+F9aT6hZj0otyrmvVLBX8ZRJsss0mW
 bYKg==
X-Gm-Message-State: AOAM532M10dWmX0BqG+PDLfHhqXdJTZqerQgZRy+C91t7uaBGi3Krc3Z
 d9DRy5eqLbnoqSzFWlCZu2I=
X-Google-Smtp-Source: ABdhPJy+SBSctEcaaYBPlw3qORiGmzGEDUEjUOC7t0uGsaCXWESlSTjxPpHMdXVn+rNqPxve9DMoqQ==
X-Received: by 2002:a05:6808:1481:: with SMTP id
 e1mr1037664oiw.5.1631214759289; 
 Thu, 09 Sep 2021 12:12:39 -0700 (PDT)
Received: from Davids-MacBook-Pro.local ([2601:282:800:dc80:395a:c:3f8e:f434])
 by smtp.googlemail.com with ESMTPSA id
 w1sm651917ott.21.2021.09.09.12.12.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Sep 2021 12:12:38 -0700 (PDT)
Subject: Re: [PATCH] net: ipv6: don't generate link-local address in any
 addr_gen_mode
To: Lorenzo Colitti <lorenzo@google.com>
Cc: Rocco Yue <rocco.yue@mediatek.com>, "David S . Miller"
 <davem@davemloft.net>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux NetDev <netdev@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wsd_upstream@mediatek.com, rocco.yue@gmail.com, chao.song@mediatek.com,
 =?UTF-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 =?UTF-8?B?Wmh1b2xpYW5nIFpoYW5nICjlvKDljZPkuq4p?=
 <zhuoliang.zhang@mediatek.com>
References: <46a9dbf2-9748-330a-963e-57e615a15440@gmail.com>
 <20210701085117.19018-1-rocco.yue@mediatek.com>
 <62c9f5b7-84bd-d809-4e33-39fed7a9d780@gmail.com>
 <CAKD1Yr2aijPe_aq+SRm-xv0ZPoz_gKjYrEX97R1NJyYpSnv4zg@mail.gmail.com>
From: David Ahern <dsahern@gmail.com>
Message-ID: <6a8f0e91-225a-e2a8-3745-12ff1710a8df@gmail.com>
Date: Thu, 9 Sep 2021 13:12:37 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAKD1Yr2aijPe_aq+SRm-xv0ZPoz_gKjYrEX97R1NJyYpSnv4zg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210909_121240_811976_856C4435 
X-CRM114-Status: GOOD (  24.01  )
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

On 9/9/21 12:20 AM, Lorenzo Colitti wrote:
>> I think another addr_gen_mode is better than a separate sysctl. It looks
>> like IN6_ADDR_GEN_MODE_STABLE_PRIVACY and IN6_ADDR_GEN_MODE_RANDOM are
>> the ones used for RAs, so add something like:
>>
>> IN6_ADDR_GEN_MODE_STABLE_PRIVACY_NO_LLA,
>> IN6_ADDR_GEN_MODE_RANDOM_NO_LLA,
> 
> I think the real requirement here (which wasn't clear in this thread)
> is that the network needs to control the interface ID (i.e., the
> bottom 64 bits) of the link-local address, but the device is free to
> use whatever interface IDs to form global addresses. See:
> https://www.etsi.org/deliver/etsi_ts/129000_129099/129061/15.03.00_60/ts_129061v150300p.pdf
> 
> How do you think that would best be implemented?

There is an established paradigm for configuring how an IPv6 address is
created or whether it is created at all - the IFLA_INET6_ADDR_GEN_MODE
attribute.

> 
> 1. The actual interface ID could be passed in using IFLA_INET6_TOKEN,
> but there is only one token, so that would cause all future addresses
> to use the token, disabling things like privacy addresses (bad).
> 2. We could add new IN6_ADDR_GEN_MODE_STABLE_PRIVACY_LL_TOKEN,
> IN6_ADDR_GEN_MODE_RANDOM_LL_TOKEN, etc., but we'd need to add one such
> mode for every new mode we add.
> 3. We could add a separate sysctl for the link-local address, but you
> said that per-device sysctls aren't free.

per-device sysctl's are one of primary causes of per netdev memory usage.

Besides that there is no reason to add complexity by having a link
attribute and a sysctl for this feature.

> 4. We could change the behaviour so that if the user configures a
> token and then sets IN6_ADDR_GEN_MODE_*, then we use the token only
> for the link-local address. But that would impact backwards
> compatibility.
> 
> Thoughts?

We can have up to 255 ADDR_GEN_MODEs (GEN_MODE is a u8). There is
established code for handling the attribute and changes to it. Let's
reuse it.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
