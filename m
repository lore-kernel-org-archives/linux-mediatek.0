Return-Path: <SRS0=sikH=NS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4371DC432BE
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Aug 2021 05:28:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11B7860F45
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Aug 2021 05:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 11B7860F45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=B5vsLY9oM+Dvl5wdG4kxiVLDDOQnaNHdcYD9Qa2zL4s=; b=SOjdZ0NV9EmSHQy+mcjku38ruY
	vwBVUK9LmsYh8XjCGuZUeBBLQEw5yhkn3Ps8JQVd2mI7Hfwxz2ySHi1KTnPQOevWcD9/EDas2DMOr
	HYyKUl8nTsJavHHu1FOHoGgAva2htChxZcym69/sXFIHh3E/Ipx4woA6dfFXxjGDAKb7XwJ5FKpCf
	7lYutsiWPqRwk/sfVyIczuWaDp4Hh+omsLNOfyJeFn1vyO5ZhtnmqikWgKPSGFlXOyQ7EM2GiAueH
	pWXN7F9dQXZ3DgfA/I/zEvuCplOV3CpTCFLO5itCzJAQj7wolTte5i++xmV2+n2B7WETa3ziYOGIJ
	yezCRLpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJUPs-00Bc3V-Nu; Fri, 27 Aug 2021 05:28:36 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJUPp-00Bc2k-J7; Fri, 27 Aug 2021 05:28:34 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 j4-20020a17090a734400b0018f6dd1ec97so4020059pjs.3; 
 Thu, 26 Aug 2021 22:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qNKc0AYQOuldCTs6QHf9qwfms0PO9naizoQWpy+ackQ=;
 b=XAR5ukIt3wvSepJyLv4D5M533KJ5eJcfjSXLiZ2s/0Gt7QXSIOdlvAC15xgFt8/dFd
 VCLhEu1cUPT5fIgQjPflV1By2Tqmj7AqcLRty0hkDGjOopBXAL2qKcdXTqUjYuYjq6pA
 OFgCb6bW1IbhMn5RnY1/oRzq7AZbtsmeMXp8qZM6ATBF3U0MVemsUPkiyd+wfJ8vdacs
 1p8j9nQ2jzdCnA36BI0YS84z+5fdtxj99NrgViU6v13VI7j+vSj5qvndN0mS+w+Ll+tc
 3iK8K9NQOAsajRZ97sEfWthH4CNSH5pkBfQD218GPS8406jswkM3VYM5M7Oso5MgxqeC
 2HYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qNKc0AYQOuldCTs6QHf9qwfms0PO9naizoQWpy+ackQ=;
 b=GwbxOOk9dmr/FSIeaeF7loW4AqfrjwIjy5kRAWPTkek6NBOFulGztXO2tXYUrwdS7/
 h+1KFgC0XyAium0dDnFGcX9ll7H+nzM6JyZ/PWeRbz/a0doRVKNYArUtsgB0saZAqj2t
 NQawELzChuwghwuzAXliuEB3USxlxYhRR0zcsdAq13NtUF6idknOiHOuw9wymMm8/FAR
 PVkrYPUnbRN9rYUzPO6xeBf1lx19ZY9L3ftxruZzGcIP+M1Vss8WCixSqiF/4FeLCpNs
 iGelF+8QqTJ4bieE2eRs8AM1HO3NWa0zg+yXxpN/75P0e5WV3ZnU32OB0q6N3W9qzb7m
 uFBg==
X-Gm-Message-State: AOAM530NsN9HAneIq9Ace8JoGLLjiGP7cB5NQEJqwrNlWWI6V+u2VsCy
 o+p69WTinDAyRDJCZnjG3rU=
X-Google-Smtp-Source: ABdhPJw+OyNgNNIUWplkkODVZFudqVskWhN88zO+m/nK+wKJy2ycOtkthXhz85xAFHZ5QXxG4h/Cxg==
X-Received: by 2002:a17:902:b093:b029:12c:843:b55a with SMTP id
 p19-20020a170902b093b029012c0843b55amr7060657plr.83.1630042112170; 
 Thu, 26 Aug 2021 22:28:32 -0700 (PDT)
Received: from Davids-MacBook-Pro.local
 ([2601:647:5e00:7920:e0af:c816:c42a:733e])
 by smtp.googlemail.com with ESMTPSA id l19sm4581153pjq.10.2021.08.26.22.28.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 22:28:31 -0700 (PDT)
Subject: Re: [PATCH net-next v5] ipv6: add IFLA_INET6_RA_MTU to expose mtu
 value
To: Rocco Yue <rocco.yue@mediatek.com>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, David Ahern
 <dsahern@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 rocco.yue@gmail.com, chao.song@mediatek.com, zhuoliang.zhang@mediatek.com
References: <20210826064603.5242-1-rocco.yue@mediatek.com>
From: David Ahern <dsahern@gmail.com>
Message-ID: <6a870141-089d-5e2b-48a7-448695e26238@gmail.com>
Date: Thu, 26 Aug 2021 22:28:29 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210826064603.5242-1-rocco.yue@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_222833_699885_0E7C3606 
X-CRM114-Status: GOOD (  10.11  )
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

On 8/25/21 11:46 PM, Rocco Yue wrote:
> @@ -5651,6 +5654,9 @@ static int inet6_fill_ifla6_attrs(struct sk_buff *skb, struct inet6_dev *idev,
>  	if (nla_put_u8(skb, IFLA_INET6_ADDR_GEN_MODE, idev->cnf.addr_gen_mode))
>  		goto nla_put_failure;
>  
> +	if (nla_put_u32(skb, IFLA_INET6_RA_MTU, idev->ra_mtu))

I should have seen this earlier. The intent here is to only notify
userspace if the RA contains an MTU in which case this should be

	if (idev->ra_mtu &&
	    nla_put_u32(skb, IFLA_INET6_RA_MTU, idev->ra_mtu))

and in which case idev->ra_mtu should be initialized to 0 explicitly,
not U32_MIN.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
