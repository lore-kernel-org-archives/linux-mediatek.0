Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71BA9C4320A
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 14:33:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F4D860F58
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 14:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F4D860F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rcNujrg4eSdy/jJ5sZYmWSMqP+4h0A/zfRDmR/qhVQo=; b=P7ZQ1wKpmzB69lF+nVxjNFhlyN
	OTArdog2stVhzMR9BRJLi/h1ycdu/rDSK4aGuWQs9tqffFmAet0ZocUdSmk+DivBkq4xF3MNPb0cp
	qY23ztXdITIsk8gx2gpGhXmxr4C6+9KVJBOj2f2ZAPH5A1AOFg0LuZlZ7MSn04UI8D7MRv3kjIjNY
	y7Kq1YOp7w8vjteou7ltjAnpkvbLolD95fasvQRazjDwDORqy0EMghic3f8DT0NwH3R/wQqQlSKtY
	OvQIZtSLdccGXZEG7Xsu6UHJOgIP68ytrf9OSG5nW+0xU652HHZcSDqWtz/ndHKV041cp0/R8iMEZ
	rVHT5q0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAvTR-003EiJ-Tv; Tue, 03 Aug 2021 14:32:53 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAvTP-003Ehn-LD; Tue, 03 Aug 2021 14:32:52 +0000
Received: by mail-oi1-x230.google.com with SMTP id u10so28348344oiw.4;
 Tue, 03 Aug 2021 07:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SOCfIEH2j9G9zTnYlmTQahFNZrsF6MnMcDCjvCkaZ7U=;
 b=lP89XUc0nfNSvTOOpPc3cPSFuOAv6RkXHnmAWVEF4UY+9Zrxwa/9D8bfFWJZRSW0eQ
 rTUg7+QWJInd5VlXSHN8Tc2Oi432pR3mcYABiG3pHVB4e/zOfN8jVIiBr6WZ2fj0DMWE
 13W9CrDYSlKpjtwptjS+ggiekrx9D38qFZG5TSuARkqZJ1R/Ykj/NXaIaattIj8cUfHe
 nJieVi/CuJzcrLG/5fonGGmyQvb4a0Ec640QzPRNPOWcu4OhrnH8Dr3OIZRLqu4Uj4lu
 EFOQhSb/x+GgCO3Ixtn/ewd7EvxLX/QR7IOS3Tqrfm/IQSvt0/vTBS4i9XIJOhFEVVNn
 W4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SOCfIEH2j9G9zTnYlmTQahFNZrsF6MnMcDCjvCkaZ7U=;
 b=Z4jx7df7OqBZyxon4r9DYk55QfwU2hTYrNIIkh+x93faBoCxXHsLAPvEmDOGR6a1so
 hUOiQ2qEmphiN61xKqJk/Tpkxx7Wt0mATXoVQ5Dg8en7VYFsbdZYESk9MGuTIl61IZYn
 jU+/rPoNNK45wecTgmxymPzzlZrDySGX5GctSq7/aAQe1yOn7Uf0HmX3z8/zqVlfORv/
 iTAiwa5sX/z3wC67J4oQs60MVeSOLQp9fvSWpuv/6Ku2wdz2a3fdCvypO+PbxY81yofW
 oUKQBY6GsUVc0pcJWO8r5iWR/OpFMHqf3oVC5t3qyATRdbkFT1sZ6IcgEW3oEA+s5PTI
 Ls6w==
X-Gm-Message-State: AOAM533BotcLTOC7QEFsuXV4AyMmGd7b9Pqpyq92HI1oqnq4c+9eBeov
 afl0kZIuof0qBMSlK5fXKOc=
X-Google-Smtp-Source: ABdhPJzmDycLIxOOfr1TXxB4X/LwSri3dv/Dr1S4HM1kwG2oCJ4Pk8l337iTvxrauijBrRCPEswIZw==
X-Received: by 2002:aca:a8cf:: with SMTP id
 r198mr14370480oie.143.1628001170299; 
 Tue, 03 Aug 2021 07:32:50 -0700 (PDT)
Received: from Davids-MacBook-Pro.local ([8.48.134.27])
 by smtp.googlemail.com with ESMTPSA id b21sm2272075oov.26.2021.08.03.07.32.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 07:32:49 -0700 (PDT)
Subject: Re: [PATCH net-next] net: add extack arg for link ops
To: Rocco Yue <rocco.yue@mediatek.com>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 rocco.yue@gmail.com, chao.song@mediatek.com, zhuoliang.zhang@mediatek.com
References: <20210803120250.32642-1-rocco.yue@mediatek.com>
From: David Ahern <dsahern@gmail.com>
Message-ID: <f6f10fe7-afdd-fdce-c091-861a738feb8a@gmail.com>
Date: Tue, 3 Aug 2021 08:32:48 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210803120250.32642-1-rocco.yue@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_073251_764645_BA872CFF 
X-CRM114-Status: GOOD (  12.43  )
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

On 8/3/21 6:02 AM, Rocco Yue wrote:
> Pass extack arg to validate_linkmsg and validate_link_af callbacks.
> If a netlink attribute has a reject_message, use the extended ack
> mechanism to carry the message back to user space.
> 
> Signed-off-by: Rocco Yue <rocco.yue@mediatek.com>
> ---
>  include/net/rtnetlink.h | 3 ++-
>  net/core/rtnetlink.c    | 9 +++++----
>  net/ipv4/devinet.c      | 5 +++--
>  net/ipv6/addrconf.c     | 5 +++--
>  4 files changed, 13 insertions(+), 9 deletions(-)
> 

Reviewed-by: David Ahern <dsahern@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
