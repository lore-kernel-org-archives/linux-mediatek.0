Return-Path: <SRS0=E1wD=MX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF007C4338F
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Jul 2021 17:18:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8887B60F94
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Jul 2021 17:18:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8887B60F94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=arpJsRtpDvl5XXPiWlyxJmhjxEai1+RiHUmJPT9fiJk=; b=kbyTm8FFYCngAYFzyJdXXccMTk
	lzE85D6UINmVPAc5IuX/QX9zR07tfBXj3GFlaXu76wnEADioY1YJwTGMoKsfjKGolSvkZ1vISvLpM
	RdxGQdMABUfizE2J0Q1PdP2s1p2n8UO/rhlZsmvrK/9vb4gPiN3F6zg3KHZtGroCjpXoKWkck5mEW
	6BblTgSfjVCPqw5v63EFJazMh2a8vU9TlOgq4j68iFhwcCbi3QmnjPgVRRu/0QpFpo3ropVOZw4U8
	xp8FfOlNUMkY2KTKYP/Ypfdb3So9YTBoQOf9QD428FkTwXxf82/HMj9krwnJ083Z6iuzRriXNM/n9
	h6Y02mkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9scZ-00ByeE-He; Sat, 31 Jul 2021 17:17:59 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9scW-00BydU-Lh; Sat, 31 Jul 2021 17:17:58 +0000
Received: by mail-ot1-x32f.google.com with SMTP id
 c2-20020a0568303482b029048bcf4c6bd9so13093887otu.8; 
 Sat, 31 Jul 2021 10:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VBFOhjOELzONs4QzqrGKY4r1pt4kNYPN+iXUO9A8HRo=;
 b=N9bRK/48BMswzWvFDp+hnpgMPXfBw7DFPC19+KpweWJt3pFkZsVC4AMiq/Yyg61GWb
 axBC1y3M1D05GTfP0vk5GdqMOOHqnOlJBbGS20g5Th1RIO7LvIHFH/mTWfXvRxX/fjVd
 OPbzwTCGhJrrygPx9QD6QHKSBApwu1ZOwOPvSEskg/uMzPU3/g9KAC19hPXWkMqQFzi8
 3Ut9ULN5QhczSVYl3uh9I8Rz2htQz8oGy3fvOsV8GOLJMN8fTr7K1t8ZVztUer0rwYSz
 iQ4DEuOhKk4+gUWKpGNVebBaDEv8UqxFxF0cdlNfzRWjb+Po3W/0qIhF0Jna/mjvJtAR
 CJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VBFOhjOELzONs4QzqrGKY4r1pt4kNYPN+iXUO9A8HRo=;
 b=CW1+ZBbLVVD8ccm9RIO02rQKlc597aeah918klMBG7ee/G6tESaX1hkk9kNjZCqYlf
 I1ESr9W/zObljio2l2iJuuQ0095c24qrBpqQE/d57kUkca2ds4nxOPLXg4xJuC4ppINc
 +XR2u0LkBF5y8OA9mKLF3Bdh4jQ8gj6y6vBuvpvBj8xa9/far/JjL7C6yCPudW7On+Fj
 n+WmEANG4YO0rA/aPimTKXaCxCMnZyh0UoVV/7BhfPUA1SBKFsXYBMrsubtHD73ZsDkG
 0HDQKlCsQhXClSzd8Hjy/lnUVF8r3O6r0SbqwsGo6VLvLSLmRGXz7r3M46/V7Vy4Uqta
 mVEA==
X-Gm-Message-State: AOAM532utRweK99GKHhOng5rslBmkZvpl9ibvj6nwdlOULYeGNnLAswb
 /GuWs862SngrvYcqM/4t92E=
X-Google-Smtp-Source: ABdhPJx8dMsfdRNVpMvtjqsv4yB7q1OfwLARLxoOCcl5wQCeeGCDMPXRWVPYcKy1drB1zqT/sE7kCw==
X-Received: by 2002:a9d:7651:: with SMTP id o17mr6259175otl.205.1627751875242; 
 Sat, 31 Jul 2021 10:17:55 -0700 (PDT)
Received: from Davids-MacBook-Pro.local ([8.48.134.27])
 by smtp.googlemail.com with ESMTPSA id i43sm934749ota.53.2021.07.31.10.17.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Jul 2021 10:17:54 -0700 (PDT)
Subject: Re: [PATCH net-next v2] ipv6: add IFLA_INET6_RA_MTU to expose mtu
 value in the RA message
To: Rocco Yue <rocco.yue@mediatek.com>, "David S . Miller"
 <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 rocco.yue@gmail.com, chao.song@mediatek.com, zhuoliang.zhang@mediatek.com
References: <20210731015230.11589-1-rocco.yue@mediatek.com>
From: David Ahern <dsahern@gmail.com>
Message-ID: <5be90cf4-f603-c2f2-fd7e-3886854457ba@gmail.com>
Date: Sat, 31 Jul 2021 11:17:53 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210731015230.11589-1-rocco.yue@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210731_101756_789597_1531A7F9 
X-CRM114-Status: GOOD (  36.37  )
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

On 7/30/21 7:52 PM, Rocco Yue wrote:
> The kernel provides a "/proc/sys/net/ipv6/conf/<iface>/mtu"
> file, which can temporarily record the mtu value of the last
> received RA message when the RA mtu value is lower than the
> interface mtu, but this proc has following limitations:
> 
> (1) when the interface mtu (/sys/class/net/<iface>/mtu) is
> updeated, mtu6 (/proc/sys/net/ipv6/conf/<iface>/mtu) will
> be updated to the value of interface mtu;
> (2) mtu6 (/proc/sys/net/ipv6/conf/<iface>/mtu) only affect
> ipv6 connection, and not affect ipv4.
> 
> Therefore, when the mtu option is carried in the RA message,
> there will be a problem that the user sometimes cannot obtain
> RA mtu value correctly by reading mtu6.
> 
> After this patch set, if a RA message carries the mtu option,
> you can send a netlink msg which nlmsg_type is RTM_GETLINK,
> and then by parsing the attribute of IFLA_INET6_RA_MTU to
> get the mtu value carried in the RA message received on the
> inet6 device.
> 
> In this way, if the MTU values that the device receives from
> the network in the PCO IPv4 and the RA IPv6 procedures are
> different, the user space process can read ra_mtu to get
> the mtu value carried in the RA message without worrying
> about the issue of ipv4 being stuck due to the late arrival
> of RA message. After comparing the value of ra_mtu and ipv4
> mtu, then the device can use the lower MTU value for both
> IPv4 and IPv6.

you are storing the value and sending to userspace but never using it
when sending a message. What's the pointing of processing the MTU in the
RA if you are not going to use it to control message size?

> 
> Signed-off-by: Rocco Yue <rocco.yue@mediatek.com>
> ---
>  include/net/if_inet6.h             | 2 ++
>  include/uapi/linux/if_link.h       | 1 +
>  net/ipv6/addrconf.c                | 5 +++++
>  net/ipv6/ndisc.c                   | 5 +++++
>  tools/include/uapi/linux/if_link.h | 1 +
>  5 files changed, 14 insertions(+)
> 
> diff --git a/include/uapi/linux/if_link.h b/include/uapi/linux/if_link.h
> index 4882e81514b6..fcd1ae29f154 100644
> --- a/include/uapi/linux/if_link.h
> +++ b/include/uapi/linux/if_link.h
> @@ -417,6 +417,7 @@ enum {
>  	IFLA_INET6_ICMP6STATS,	/* statistics (icmpv6)		*/
>  	IFLA_INET6_TOKEN,	/* device token			*/
>  	IFLA_INET6_ADDR_GEN_MODE, /* implicit address generator mode */
> +	IFLA_INET6_RA_MTU,	/* mtu carried in the RA message  */
>  	__IFLA_INET6_MAX
>  };
>  
> diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
> index 3bf685fe64b9..98eeaba9f86c 100644
> --- a/net/ipv6/addrconf.c
> +++ b/net/ipv6/addrconf.c
> @@ -5537,6 +5537,7 @@ static inline size_t inet6_ifla6_size(void)
>  	     + nla_total_size(ICMP6_MIB_MAX * 8) /* IFLA_INET6_ICMP6STATS */
>  	     + nla_total_size(sizeof(struct in6_addr)) /* IFLA_INET6_TOKEN */
>  	     + nla_total_size(1) /* IFLA_INET6_ADDR_GEN_MODE */
> +	     + nla_total_size(4) /* IFLA_INET6_RA_MTU */
>  	     + 0;
>  }
>  
> @@ -5645,6 +5646,9 @@ static int inet6_fill_ifla6_attrs(struct sk_buff *skb, struct inet6_dev *idev,
>  	if (nla_put_u8(skb, IFLA_INET6_ADDR_GEN_MODE, idev->cnf.addr_gen_mode))
>  		goto nla_put_failure;
>  
> +	if (nla_put_u32(skb, IFLA_INET6_RA_MTU, idev->ra_mtu))
> +		goto nla_put_failure;
> +
>  	return 0;
>  
>  nla_put_failure:
> @@ -5761,6 +5765,7 @@ static int inet6_set_iftoken(struct inet6_dev *idev, struct in6_addr *token,
>  static const struct nla_policy inet6_af_policy[IFLA_INET6_MAX + 1] = {
>  	[IFLA_INET6_ADDR_GEN_MODE]	= { .type = NLA_U8 },
>  	[IFLA_INET6_TOKEN]		= { .len = sizeof(struct in6_addr) },
> +	[IFLA_INET6_RA_MTU]		= { .type = NLA_U32 },
>  };
>  
>  static int check_addr_gen_mode(int mode)

Its value is derived from an RA not set by userspace, so set the type to
NLA_REJECT so that inet6_validate_link_af will reject messages that have
IFLA_INET6_RA_MTU set. You can set "reject_message" in the policy to
return a message that "IFLA_INET6_RA_MTU can not be set".


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
