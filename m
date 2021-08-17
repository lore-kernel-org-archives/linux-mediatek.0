Return-Path: <SRS0=tEpm=NI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4BB0C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 15:05:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD37660F41
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 15:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD37660F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HktpzgcNDyjYq1Mrj/FcH48xmHOOTqYAlLknVEgfGcU=; b=3FGpqd+r1PPxPI1MVxm0zUIKzq
	gcKsooJK6jj2D7e28QN/CUXzohqoW6PweSCGP9MQ4e1Ncxqk3ohScEucTUvjncZhZ/hd6LfA7MZDA
	tV4SKRhkbU45rh56UBbREtgtskC6C0vw22Nl/eRnebriH3olQabxAeAPf/82i7D+TPUWBhXoXLJ3s
	FKM+/HCMZPVEAo3bvf+LZ19c3+sZ70dUtB3X4aoXfE0IZtUZu82Wnhmp4pu67pBM3Z/vTpuytDQ+V
	u+2qs8qigOfnSUA/HmSdXo5LcaLh3vcvR7N0RiMinsi5zIZD8r2EIzWmwJmNA5cD3yPibPSf8Yq7g
	rN0DCebg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mG0eu-002knX-0t; Tue, 17 Aug 2021 15:05:44 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mG0er-002kn4-6T; Tue, 17 Aug 2021 15:05:42 +0000
Received: by mail-ot1-x333.google.com with SMTP id
 e13-20020a9d63cd0000b02904fa42f9d275so25352557otl.1; 
 Tue, 17 Aug 2021 08:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QVfvljS9yxMRLzJtSOULzVoQt76MWkNy0TQqqNBW6Ig=;
 b=qhGKl1NxybX2OZInj1F15H7pPHUfQ4Dpbv/J38dZIdgu9nN6y5fjjBuZsWVD2SC5fB
 5bY+gkep8cKcRx0dwj3xV4232jYrbdKEwQoI98+dsQYIC/3FAawJ7t6s+gceuLHmVPTg
 YI6GkzMQTS2MfY8TDy9168Zsnxb4xnhHCj1NzSI+tA3MIWQDk5ejigGZavGI4/AgQuLd
 1yC6T2uJSHfKTBhO5y6E7JmQEkcl6hatqrZyj344WBxg9mO6TJoyCEngXkHYGiBaTMV3
 RdjIGF19V5OdMW+NzFIn4PRHJNZjQ83CI/giVjaHxizaHmfINZgqwQ8+eEHud/1NQY7N
 Cm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QVfvljS9yxMRLzJtSOULzVoQt76MWkNy0TQqqNBW6Ig=;
 b=Oq4Izs+cyoPz9UhjgQzJ3SukyDC8a2GAdJF1L2EO5x5fZvahYD5DURS0Hh1S99x7FS
 Jd8CPiDfV6wHFgtECMXP3tQXrN7D2B54F+0kFbzyKjEWVNOuXtqBIxV+dKkWuzTfGlDP
 rdgO2BY8Vs+6w2Pf4eMESgOQVVnbAgVHX2bUNnNQ+V+tTrnXBPFb7B+OT/nZo1I2oO/g
 bdkwuVNUXfc+mOBktNuPpLyo4iXvh0LylpU7o1ChKamDwELIbadH1G9n1TCZhlWyht4i
 1FJjt9OGExT2zclmEgWBc75i/R3nJszItCxtZQqP3kZChHwzRW+lw++S6denKq9lOndH
 kWUQ==
X-Gm-Message-State: AOAM533UFglmPn3yC6elZWTedo6oTLOOY9eiVLCkQSNwsFjNXkBdzMLw
 w/P9wTuKrhLnofSUFXjZszE=
X-Google-Smtp-Source: ABdhPJwbmBTJXUOlktACFWj/KDoKpiNsYfLOJ16DAofBaApV6Fzby8JQrRKv67PyndRVp7LHyDoxmw==
X-Received: by 2002:a05:6830:236d:: with SMTP id
 r13mr3040332oth.130.1629212739821; 
 Tue, 17 Aug 2021 08:05:39 -0700 (PDT)
Received: from Davids-MacBook-Pro.local ([8.6.112.214])
 by smtp.googlemail.com with ESMTPSA id u14sm425086oth.73.2021.08.17.08.05.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 08:05:39 -0700 (PDT)
Subject: Re: [PATCH net-next v4] ipv6: add IFLA_INET6_RA_MTU to expose mtu
 value in the RA message
To: Rocco Yue <rocco.yue@mediatek.com>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, David Ahern
 <dsahern@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 rocco.yue@gmail.com, chao.song@mediatek.com, zhuoliang.zhang@mediatek.com
References: <20210817072609.2110-1-rocco.yue@mediatek.com>
From: David Ahern <dsahern@gmail.com>
Message-ID: <ad32c931-3056-cdef-4b9b-aab654c61cb9@gmail.com>
Date: Tue, 17 Aug 2021 09:05:36 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210817072609.2110-1-rocco.yue@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_080541_291756_517145C1 
X-CRM114-Status: GOOD (  12.07  )
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

On 8/17/21 1:26 AM, Rocco Yue wrote:
> @@ -1496,6 +1490,11 @@ static void ndisc_router_discovery(struct sk_buff *skb)
>  		memcpy(&n, ((u8 *)(ndopts.nd_opts_mtu+1))+2, sizeof(mtu));
>  		mtu = ntohl(n);
>  
> +		if (in6_dev->ra_mtu != mtu) {
> +			in6_dev->ra_mtu = mtu;
> +			send_ifinfo_notify = true;
> +		}
> +
>  		if (mtu < IPV6_MIN_MTU || mtu > skb->dev->mtu) {
>  			ND_PRINTK(2, warn, "RA: invalid mtu: %d\n", mtu);
>  		} else if (in6_dev->cnf.mtu6 != mtu) {


If an RA no longer carries an MTU or if accept_ra_mtu is reset, then
in6_dev->ra_mtu should be reset to 0 right?

rest of the change looks good to me.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
