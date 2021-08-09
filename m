Return-Path: <SRS0=Eo9X=NA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A47FCC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 22:44:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 573D060BD3
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 22:44:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 573D060BD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7rCK4Up+9J/6MWQST/+f3S0abi62LEBW4w9IEZXvg00=; b=GJlOgFp9NSChhlpeMN+/sT7gPK
	oTalec86amT9pCIUcTxrkIfU9gYxDPhLOWg+6IVzn0TmD2hNcw0jXqgRGbTApQ+RtMbb3+v0CGZal
	W4KVlQaBkAN3AGedaS/ic48jAKpgNAppRusCM8UWc36S/D3fUas8/ZFgEhnEfbFcIfoWB47vT+70V
	ifDaQPLY/ta4MjRQzfe6W5+qNlLxhjPDBxPbzj4gZwvsNtOF3a9E9loWSmHW4FgRcU34xkPqmGLUR
	/Tbczgg0E01Y/cd0+eq5LlR2ty87IGXEmWFAX+zKhwlcUWZXINv4ppb+30QKXPXD26cjBqrsogcCf
	Qc+Ex+MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDE04-0025c3-7N; Mon, 09 Aug 2021 22:44:04 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDE02-0025bb-7c; Mon, 09 Aug 2021 22:44:03 +0000
Received: by mail-oo1-xc31.google.com with SMTP id
 y14-20020a4acb8e0000b029028595df5518so4221141ooq.6; 
 Mon, 09 Aug 2021 15:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JFm3i8hiQ9YKTYc3KaQhJAf5gW+QdhhYGs4FBgzwnT8=;
 b=mMaG/auye7Xh8CSntEKrHBp7K/TKrZsSX3E+NB20n023Qhd/FMMXGpVp/2BQocuOKp
 NwAxSlW6btH0Aj1GFHEVgr4oWtZ1y/bCBPwS3dbBq1WQY83Xe2ZZzH0PS1KmXcTtncJ7
 Vj4mOjYgp8bbWMxz0f7lHZaMgb+EklvK1h3hrRZx0DTgLHR9YUKwbqRhHYaRyTkBOctA
 e2RBA54dSFdVzVf+/RxWcOaxjQxrCnG8Yja6s2motyLHQfqsyne0obEFDSjXAdrJpCjG
 sR1ak3AdO8JGWCCTI2q2BcHpxDaEQ9+i/JTwdIIgwptd7jrjUCFUaR+c4OXLdVDALigl
 uw3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JFm3i8hiQ9YKTYc3KaQhJAf5gW+QdhhYGs4FBgzwnT8=;
 b=PYB8KTSh9QOoLnapd0Zz/5+Ucle33iEht3ZeYaDARnUroOSL84TR8KqF4rg8D3aZDO
 DIoCGpAhEchXxfThKjBzzqe4BLQ7RgNeUpI66lJBPNk15f0HuAd8KfTJWFrHGRbJVtWK
 TBPJaNnakBr16c9WZ565B/aR19TNKycI8R7wg/6M6me6FrcV7zOtN9de/xskkRNUK7vB
 kHkGl6z6AAX5P/h/rPljAiWg46yzxPSZ8kqIosptDEe0CjZ+8vBRyOT62LrLwQuLMQ9R
 GH8O3sByewh4Eb40CFhxIBwdFw3YoGwln9//tpS8nc96cJ/0o4NtRobrAFY0UtfhPpOO
 lCdA==
X-Gm-Message-State: AOAM532kxpuYYdA/T5mCUewPRYt8n+24sQj1RD0vJdxMVSocv3q38QDv
 kssJ1cWAG2xEp85zyEZLQ4Q=
X-Google-Smtp-Source: ABdhPJxLRbIvAqDRZO4Fb+YLII3o1lTEdwpW6gHc06sH2A4nlmKAJtKpv1NgOTak43KOgR9sDGhkzg==
X-Received: by 2002:a4a:9464:: with SMTP id j33mr8555335ooi.5.1628549040579;
 Mon, 09 Aug 2021 15:44:00 -0700 (PDT)
Received: from Davids-MacBook-Pro.local ([8.48.134.45])
 by smtp.googlemail.com with ESMTPSA id s35sm3518922otv.44.2021.08.09.15.43.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 15:44:00 -0700 (PDT)
Subject: Re: [PATCH net-next v3] ipv6: add IFLA_INET6_RA_MTU to expose mtu
 value in the RA message
To: Rocco Yue <rocco.yue@mediatek.com>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, David Ahern
 <dsahern@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 rocco.yue@gmail.com, chao.song@mediatek.com, zhuoliang.zhang@mediatek.com
References: <20210809140109.32595-1-rocco.yue@mediatek.com>
From: David Ahern <dsahern@gmail.com>
Message-ID: <c0a6f817-0225-c863-722c-19c798daaa4b@gmail.com>
Date: Mon, 9 Aug 2021 16:43:58 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210809140109.32595-1-rocco.yue@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_154402_351689_F22FB451 
X-CRM114-Status: GOOD (  21.26  )
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

On 8/9/21 8:01 AM, Rocco Yue wrote:
> @@ -6129,6 +6136,66 @@ static void ipv6_ifa_notify(int event, struct inet6_ifaddr *ifp)
>  		__ipv6_ifa_notify(event, ifp);
>  }
>  
> +static inline size_t inet6_iframtu_msgsize(void)
> +{
> +	return NLMSG_ALIGN(sizeof(struct ifinfomsg))
> +	     + nla_total_size(IFNAMSIZ)	/* IFLA_IFNAME */
> +	     + nla_total_size(4);	/* IFLA_INET6_RA_MTU */
> +}
> +
> +static int inet6_fill_iframtu(struct sk_buff *skb, struct inet6_dev *idev)
> +{
> +	struct net_device *dev = idev->dev;
> +	struct ifinfomsg *hdr;
> +	struct nlmsghdr *nlh;
> +
> +	nlh = nlmsg_put(skb, 0, 0, RTM_NEWLINK, sizeof(*hdr), 0);
> +	if (!nlh)
> +		return -EMSGSIZE;
> +
> +	hdr = nlmsg_data(nlh);
> +	hdr->ifi_family = AF_INET6;
> +	hdr->__ifi_pad = 0;
> +	hdr->ifi_index = dev->ifindex;
> +	hdr->ifi_flags = dev_get_flags(dev);
> +	hdr->ifi_change = 0;
> +
> +	if (nla_put_string(skb, IFLA_IFNAME, dev->name) ||
> +	    nla_put_u32(skb, IFLA_INET6_RA_MTU, idev->ra_mtu))
> +		goto nla_put_failure;
> +
> +	nlmsg_end(skb, nlh);
> +	return 0;
> +
> +nla_put_failure:
> +	nlmsg_cancel(skb, nlh);
> +	return -EMSGSIZE;
> +}
> +
> +void inet6_iframtu_notify(struct inet6_dev *idev)
> +{
> +	struct sk_buff *skb;
> +	struct net *net = dev_net(idev->dev);
> +	int err = -ENOBUFS;
> +
> +	skb = nlmsg_new(inet6_iframtu_msgsize(), GFP_ATOMIC);
> +	if (!skb)
> +		goto errout;
> +
> +	err = inet6_fill_iframtu(skb, idev);
> +	if (err < 0) {
> +		/* -EMSGSIZE implies BUG in inet6_iframtu_msgsize() */
> +		WARN_ON(err == -EMSGSIZE);
> +		kfree_skb(skb);
> +		goto errout;
> +	}
> +	rtnl_notify(skb, net, 0, RTNLGRP_IPV6_IFINFO, NULL, GFP_ATOMIC);
> +	return;
> +errout:
> +	if (err < 0)
> +		rtnl_set_sk_err(net, RTNLGRP_IPV6_IFINFO, err);
> +}

pretty sure you don't need to build a new notify function.

> +
>  #ifdef CONFIG_SYSCTL
>  
>  static int addrconf_sysctl_forward(struct ctl_table *ctl, int write,
> diff --git a/net/ipv6/ndisc.c b/net/ipv6/ndisc.c
> index c467c6419893..a04164cbd77f 100644
> --- a/net/ipv6/ndisc.c
> +++ b/net/ipv6/ndisc.c
> @@ -1496,6 +1496,12 @@ static void ndisc_router_discovery(struct sk_buff *skb)
>  		memcpy(&n, ((u8 *)(ndopts.nd_opts_mtu+1))+2, sizeof(mtu));
>  		mtu = ntohl(n);
>  
> +		if (in6_dev->ra_mtu != mtu) {
> +			in6_dev->ra_mtu = mtu;
> +			inet6_iframtu_notify(in6_dev);
> +			ND_PRINTK(2, info, "update ra_mtu to %d\n", in6_dev->ra_mtu);
> +		}
> +
>  		if (mtu < IPV6_MIN_MTU || mtu > skb->dev->mtu) {
>  			ND_PRINTK(2, warn, "RA: invalid mtu: %d\n", mtu);
>  		} else if (in6_dev->cnf.mtu6 != mtu) {

Since this MTU is getting reported via af_info infrastructure,
rtmsg_ifinfo should be sufficient.

From there use 'ip monitor' to make sure you are not generating multiple
notifications; you may only need this on the error path.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
