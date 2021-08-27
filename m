Return-Path: <SRS0=sikH=NS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6495C432BE
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Aug 2021 16:42:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A48160F58
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Aug 2021 16:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A48160F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mW86tOAqrZl99OwW9lAOAL6aYm/G4znJUuSScne+YGU=; b=0f3sUPk4FSAO8BVeFqmc2Bmama
	NMQZa8+17xOttmiuQRnKOI8xUfcvdeuYxgD2LJyrimQXyuIX35d+ciXn/koGMm1h4bBKhtnTLPQMJ
	By/Hed5iLMFTjm+xl1KGN2h0D6/JG5Pj1HooYJEPHEpD4hRAhD3fUrz9YSwz409FjLppK/7TdsOAF
	oQfUpOgDHosK34pOeHMQWhCvGMNrxjbLKQDu4/sa9U+wgmNAwlsHF4f8R3BNMlgudb9s2vbkyB0NX
	lrb27cmq4+BIjKdAX4JGuTfM4PYb5ljnDOu4/ycS5ssmJnkylSr7kt1M2JFIF93pMkhTNKWstvNE5
	D/MU4+Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJevY-00Cm2W-F1; Fri, 27 Aug 2021 16:42:00 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJevV-00Cm1n-D3; Fri, 27 Aug 2021 16:41:58 +0000
Received: by mail-pj1-x1029.google.com with SMTP id fs6so4913752pjb.4;
 Fri, 27 Aug 2021 09:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3V2CZy6dmdkD9GfcdkbWhhKFYcBdzsCBJHlbGNHPDlM=;
 b=iDLnafUOq6WqYT+CV5zlg1K1jj8RSH2+gL+TL710pxFogi71WDp11udZQMWz4G3Cje
 vZHbGQaHIzbIE4hmLZg9PuXRq9gvFMiZ6jA4ywMVdC4BHI1Thda/mGewhWsFd8TviI6V
 6/tflR2Tq2yu8Ky8mi+M7YOFy2NfW2qmlp72ygpg9s7mpgkT/L3IJtlCxsnUx6iYDH3L
 TMYGvQ2IbMKFYWKUCYZidE4G5GtJ2cjLJHDqSQ2ZuEQsqa8rjmNo8WCjQqGg+mEVOXmC
 SQ3tjoR1OAKFPDBUEBzA4YHVJDEdztAalrSnyphgY4y3dDTm7QPA+bpTZoXyoPJs1qFl
 dRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3V2CZy6dmdkD9GfcdkbWhhKFYcBdzsCBJHlbGNHPDlM=;
 b=PaHJMhTq4Erb81ctjviaJi5ru/RRALcimmxBWT51jNB7rPZosJBv5bHKxoohLOp0w0
 rclptfaMxj81QMUpm5jCQDoe1qGFt1UKNXzZ1e8sWNgHck+RLBQng1NwbOAg7sResJpX
 MUacwlC1EVE8MAYMESeSmM6vupex4vs9w2krw2DPaQlCcW6KD4U8G8rC3IEmNLV51QPd
 wJcCwa3JjHDG/w5FrwPO3e7KYKNzq/XnOeSItDEY+2ZnIYl9xugId3QDdn0/nSRoo59A
 m/p2WWIsAWMdfrxnuxHmOh47GvesVBKi4NGXfz7bIVcJ5iHvqD3Ptf6d1pmgD9kfWE+R
 h9kg==
X-Gm-Message-State: AOAM5332FrOeW9+QUwe67flvwhbufy22TF6oUJvL1nIGN/wEJguiegSb
 AZWcMoGJWnVvJIoZEHJiCJQ=
X-Google-Smtp-Source: ABdhPJwASjddcM9h65Sw+qmPBLmmgOUuenDeBxxNvZDAFoEs6Kzmn2wHc4GYH3puhZGsXvYeSqAiKw==
X-Received: by 2002:a17:90a:9511:: with SMTP id
 t17mr24495129pjo.194.1630082515636; 
 Fri, 27 Aug 2021 09:41:55 -0700 (PDT)
Received: from Davids-MacBook-Pro.local ([72.164.175.30])
 by smtp.googlemail.com with ESMTPSA id cq8sm6511133pjb.31.2021.08.27.09.41.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Aug 2021 09:41:55 -0700 (PDT)
Subject: Re: [PATCH net-next v6] ipv6: add IFLA_INET6_RA_MTU to expose mtu
 value
To: Rocco Yue <rocco.yue@mediatek.com>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, David Ahern
 <dsahern@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 rocco.yue@gmail.com, chao.song@mediatek.com, zhuoliang.zhang@mediatek.com
References: <20210827150412.9267-1-rocco.yue@mediatek.com>
From: David Ahern <dsahern@gmail.com>
Message-ID: <88523c38-f0b4-8a63-6ca6-68a3122bef79@gmail.com>
Date: Fri, 27 Aug 2021 09:41:53 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210827150412.9267-1-rocco.yue@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_094157_518245_B860FD1E 
X-CRM114-Status: GOOD (  25.37  )
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

On 8/27/21 8:04 AM, Rocco Yue wrote:
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
> inet6 device. In addition, you can also get a link notification
> when ra_mtu is updated so it doesn't have to poll.
> 
> In this way, if the MTU values that the device receives from
> the network in the PCO IPv4 and the RA IPv6 procedures are
> different, the user can obtain the correct ipv6 ra_mtu value
> and compare the value of ra_mtu and ipv4 mtu, then the device
> can use the lower MTU value for both IPv4 and IPv6.
> 
> Signed-off-by: Rocco Yue <rocco.yue@mediatek.com>
> ---
>  include/net/if_inet6.h             |  2 ++
>  include/uapi/linux/if_link.h       |  1 +
>  net/ipv6/addrconf.c                | 10 ++++++++++
>  net/ipv6/ndisc.c                   | 17 +++++++++++------
>  tools/include/uapi/linux/if_link.h |  1 +
>  5 files changed, 25 insertions(+), 6 deletions(-)
> 

Reviewed-by: David Ahern <dsahern@kernel.org>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
