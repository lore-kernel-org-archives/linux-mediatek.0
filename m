Return-Path: <SRS0=DDi+=L7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4E4BC07E95
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 14:40:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77F2F61C37
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 14:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77F2F61C37
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=d8vdjcpXRlMfbEVoKWhZzWLsvy5Pmh1SI8AUw/f6e1c=; b=GFIklu6cXWgvqPQExCQ+lRghE7
	2aPGFWEw9Ik7VzBQ0mo16ay0zWg2d4DlkA5JTqFq7bEqUG73pbD0pkBdcXAuI0CNzSqXYsnphXHaA
	cXJRBHZuwIVuUXF9r7aTtt1PUPo+OsM10SSC6tmmWhorl3uGKBVwC6xAaaTfk0S3tKZJYBV/ryVAm
	QbZWjNDbtpLvy8jZSkcHD7yEWhHd3BRYeBQExYTQq7Uoxv1bbatHckOwig7GsaMBhpau/kKxqzcoZ
	C6M2TCK3nfwyXScQMLirwz7VBrnzLrcE7FRDmT/aOtxpJCnVG94E3gkNXvzo0qIlsG/gLi1xR0hQm
	npRZUdAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m18iL-00F6XE-IP; Wed, 07 Jul 2021 14:39:49 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m18iI-00F6Vb-T9; Wed, 07 Jul 2021 14:39:48 +0000
Received: by mail-oi1-x231.google.com with SMTP id t3so3594886oic.5;
 Wed, 07 Jul 2021 07:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7gNQ41svyZKSD+ZfD8X+CqWoSx+Yg2oHnylVZwRWNDo=;
 b=L/ODocFurzt1NRPzGA5lgvAU0Xmmy6nYMfX0rEkugKDENAYJ69ezTbt8anW8TZ+T+u
 OzeGilDz9B/JAI2WE2AsyQ0R/RiYlZcGxRjh2Qv1GWl2GbjuhDCttSmjDvgJQQWGoojE
 Lhntd2uV1C9hC6WSHTM90CyXMeChw+jTvKV2gpw+vYF/5xBfckF7ru6KFnUaIi5owd0p
 hTUSjX0gYLF+OpN3LbIl6OCtL4cpOw5SryYqFwCBEAa+6lBf/I+j9INxwAky9TuUSZAs
 cbnLBtzF+U8ZYA30fYne+K+igNpQ9qw7tsuG1RChPgxPDa/kxT9ddftNe0TQARiDR2Lh
 2Q/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7gNQ41svyZKSD+ZfD8X+CqWoSx+Yg2oHnylVZwRWNDo=;
 b=OmKOficBLy2ClnHjmsEyeNxak9a4lM+1zPwfjTDRLFTjmAHIK0Sta6B8T0f+34yUTo
 5rpT4mOovbqnNZwpkyBeYyVkBs2/9fuEP+VcGT90UbbMr6CcajmB+iDzmRX3CuzjJY6d
 Nmhwo6nXVoAltzMEZINovTeM9xkLq3fzCeX+iLsHbFBkrziiXkCV1qZazqCEbGjkD7uV
 L7xbrDVH51lPkbgNIq8b5zEFwVxqpruDVVAWh/GLwHvUCpd7vNTkp/TuCdPfuq2OStA0
 5+qJ8FRYMzBHkqcm9uRNMkyUWDJ1e+4HWPdmdsQ3TwSBNY++q/Wr9ZLGmttt8+J+hrPk
 dFmg==
X-Gm-Message-State: AOAM532XJYK3aadkPgJlEqrTEIpD5Z0r7oiEckdQTlebr2nDXQsEH1HM
 O2r58e/oj6Fs/NpGJuh5Wkw=
X-Google-Smtp-Source: ABdhPJzZM+I+Wr1D4VNlEvutVIoJ2NobSdnA50lqeXIa+sMuqMrBynrLi64o20n/N+Pb4v6xX7/w4g==
X-Received: by 2002:a05:6808:d54:: with SMTP id
 w20mr5167481oik.175.1625668781164; 
 Wed, 07 Jul 2021 07:39:41 -0700 (PDT)
Received: from Davids-MacBook-Pro.local ([8.48.134.38])
 by smtp.googlemail.com with ESMTPSA id v2sm901050ots.8.2021.07.07.07.39.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 07:39:40 -0700 (PDT)
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
References: <62c9f5b7-84bd-d809-4e33-39fed7a9d780@gmail.com>
 <20210706123702.29375-1-rocco.yue@mediatek.com>
From: David Ahern <dsahern@gmail.com>
Message-ID: <40951584-8f53-4e95-4a6b-14ae1cf7f011@gmail.com>
Date: Wed, 7 Jul 2021 08:39:36 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706123702.29375-1-rocco.yue@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210707_073946_992445_5C453AE9 
X-CRM114-Status: GOOD (  31.19  )
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

On 7/6/21 6:37 AM, Rocco Yue wrote:
> On Mon, 2021-07-05 at 10:35 -0600, David Ahern wrote:
>> On 7/1/21 2:51 AM, Rocco Yue wrote:
>>> On Wed, 2021-06-30 at 22:41 -0600, David Ahern wrote:
>>>
>>> For mobile operators that don't need to support RFC7217, setting
>>> addr_gen_mode == 1 is sufficient;
>>>
>>> But for some other mobile operators that need to support RFC7217, such as AT&T,
>>> the mobile device's addr_gen_mode will be switched to the
>>> IN6_ADDR_GEN_MODE_STABLE_PRIVACY, instead of using IN6_ADDR_GEN_MODE_NONE.
>>> The purpose is: in the IN6_ADDR_GEN_MODE_STABLE_PRIVACY mode, kernel can
>>> gererate a stable privacy global ipv6 address after receiveing RA, and
>>> network processes can use this global address to communicate with the
>>> outside network.
>>>
>>> Of course, mobile operators that need to support RFC7217 should also meet
>>> the requirement of 3GPP TS 29.061, that is, MT should use IID assigned by
>>> the GGSN to build its ipv6 link-local address and use this address to send RS.
>>> We don't want the kernel to automatically generate an ipv6 link-local address
>>> when addr_gen_mode == 2. Otherwise, using the stable privacy ipv6 link-local
>>> address automatically generated by the kernel to send RS message, GGSN will
>>> not be able to respond to the RS and reply a RA message.
>>>
>>> Therefore, after this patch, kernel will not generate ipv6 link-local address
>>> for the corresponding device when addr_gen_mode == 1 or addr_gen_mode == 2.
>>>
>>
>> I think another addr_gen_mode is better than a separate sysctl. It looks
>> like IN6_ADDR_GEN_MODE_STABLE_PRIVACY and IN6_ADDR_GEN_MODE_RANDOM are
>> the ones used for RAs, so add something like:
>>
>> IN6_ADDR_GEN_MODE_STABLE_PRIVACY_NO_LLA,
>> IN6_ADDR_GEN_MODE_RANDOM_NO_LLA,
>>
>> to in6_addr_gen_mode.
>>
> 
> Hi David,
> 
> Thanks for your reply.
> 
> According to your suggestion, I checked the ipv6 code again. In my
> opinion, adding another addr_gen_mode may not be suitable.
> 
> (1)
> In the user space, the process enable the ipv6 stable privacy mode by
> setting the "/proc/sys/net/ipv6/conf/<iface>/stable_secret".
> 
> In the kernel, the addr_gen_mode of a networking device is switched to
> IN6_ADDR_GEN_MODE_STABLE_PRIVACY by judging the bool value of
> "cnf.stable_secret.initialized".

and that can be updated. If the default (inherited) setting is
IN6_ADDR_GEN_MODE_STABLE_PRIVACY_NO_LLA, then do not change to
IN6_ADDR_GEN_MODE_STABLE_PRIVACY.

> 
> So, although adding an additional IN6_ADDR_GEN_MODE_STABLE_PRIVACY_NO_LLA,
> user space process has some trouble to let kernel switch the iface's
> addr_gen_mode to the IN6_ADDR_GEN_MODE_STABLE_PRIVACY_NO_LLA.
> 
> This is not as flexible as adding a separate sysctl.
> 
> (2)
> After adding "proc/sys/net/ipv6/<iface>/disable_gen_linklocal_addr",
> so that kernel can keep the original code logic of the stable_secret
> proc file, and expand when the subsequent kernel adds a new add_gen_mode
> more flexibility and applicability.
> 
> And we only need to care about the networking device that do not
> generate an ipv6 link-local address, and not the addr_gen_mode that
> this device is using.
> 
> Maybe adding a separate sysctl is a better choice.
> Looking forward to your professional reply again.

per device sysctl's are not free. I do not see a valid reason for a
separate disable knob.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
