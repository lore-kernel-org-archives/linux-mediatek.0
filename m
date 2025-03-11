Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DB0C28B2E
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Mar 2025 08:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:To:From:References:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UFNNBRGR/6gDpDCHdvz/G/BUoK1siPWwMWJCgE09xoA=; b=ChwzwmXMZhrE9w
	HlW70FwQ7noV/4T2giH0Lq9oZpd9hcEuDWeY50IAJEve3vhtYOpYHFOGzk2Np2w6gjwKEbvzxcDfG
	kon/ndj0uI/yy8fRTayfkeMq+r75gpget4NV6Rdt4XnAvTC0huj2XB7/2GP/7yQl85MMkIW33xl2o
	SPQbqS7LKjUdVG+LD80WxIxQP0DxpHSVbD3vM316UHkED6ZXQr0sl69O96Cpyc5z8mhy9wDCB9woQ
	mEena0jQFNea3cy/tPYQ+Uv1AsqgSnym2NK2WyJFsN3WmEeqAqGZPef5bKYUZrjZHgL4Uu2O8JywQ
	/YqHzxl/wQJwZ2+d2/0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1truuV-00000004zkx-1e9c;
	Tue, 11 Mar 2025 08:24:23 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trusq-00000004zen-3wUq;
	Tue, 11 Mar 2025 08:22:42 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so6691294a12.1;
        Tue, 11 Mar 2025 01:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741681358; x=1742286158; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:to:content-language:from
         :references:cc:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UFNNBRGR/6gDpDCHdvz/G/BUoK1siPWwMWJCgE09xoA=;
        b=DWbqChunzPt84OYgesLdOxhsvlmbkKONmouy/FHf4R2mS3HuVcMy/2OC6EkZ5aOy93
         nUn55mjhy9BHwWPA7BgmxijGRc6s34qr2AhRZa7KTwHKOHFrEej5B2p4k+Vm5ebDgmHf
         5SfpqtO9AdwVoSYgScGtcG2HRbskqGCCgWHv1qdGmMyBR/fUsW2X3gAb2yAUKN8llzfG
         +EYyTpnV6vtoAArxImaoZIL8+IWIVNawUzuw54nDJosXj5pEHWq/PxYeDDAls4f/CSYE
         NGFcEGnihnRY+zkgFcTm8Ni1oRc7fYMwcZDoVXdPb+vWKh+TRKLG69hZ+4YqWaTNfQb8
         4BWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741681358; x=1742286158;
        h=content-transfer-encoding:in-reply-to:to:content-language:from
         :references:cc:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UFNNBRGR/6gDpDCHdvz/G/BUoK1siPWwMWJCgE09xoA=;
        b=fCHNdl6kidJYAH+D3w5r+kNFKDkXP+gOPPyDgXlZbjp+dP6WMRdhc4wLVUsOyM8wJ0
         2pO4AqPtBFLqU/6DqDXZwRuuR9b/QxMfHo9a9hnfLZ8D7MPUe8ONsFUJoR74pQRvI5Ut
         2EjFNfoOkmh5pVAp9HSY9Bl+EN//HGoApm6eDepozkzpkc3wdMo08YiPSsYWn63HZjT6
         FhEJ5lfghvBOyydSiud4BREKYjFY9IN/8m8kya/is6YS9sZEye4Kho5P5+PCueWe8Q4f
         bZeyoXgzm0v5Wk9gaXVkEmqXo3QdtCtKz17N8lF53cqDgs89nK7NzDvzYAPYnfv43iiQ
         7dBg==
X-Forwarded-Encrypted: i=1; AJvYcCUluGG/b79DH2jeuYuI5dAaaKkl9wCvkqh5I9bjpS16qaKw0hPwuvvDYcoO5pG8wvYmR6SdUAuutPAP1Oj/zhYo@lists.infradead.org, AJvYcCX1t/9YMX892C903YbtC/SpQ45jdg/LlmrQQKBHNOS2z+5AUlozks1mUGWARctRe3J93AsAWlw/v5UFUTy+vvg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzzVe9elgzMXWVK7stZ+Iv+ZEmcpbWj2J3lEawYg6KjnPl5ivd8
	D1xHuHotU/LHTsVuW7BchOoQ33SulN3eSOWWS5sswOzLxgvv8CzP
X-Gm-Gg: ASbGncthlyrFjwaU8UihAYS87HuDPcuAz1mBRgiyA72I/srlCy7E5m+xPUUmKzlxz2A
	nd4BLQeTRAAhQdxGNlTuSCbGugALD7nPjicYzRLkm1hfP19pUjpUBI6Ek5NJvnkPFEWgMeo0UTq
	pVFkQWdjZrAZj6ZvbLJc7hG/e9b4Ri2wqAIF3wmLz4ddrIMAhLaM70tTZLFq7lCeaf4UD5DY/1y
	dDE0Iy7E7jdXcgTeDwdMcRkf5BIw1VhzXQ+Hw1P+Ne84x8yvkhQDbi0JrwNUqLF6z+TWtlOPgOE
	lZsmJg5/lkLCRTIJoscdmkwCjOpL3/jt+7rbeVYN2Cyi/uIyeWk4Co6wz2JSCEVWF1ThscyXacd
	x5tQziDkOfhBi/vLWy/JxOomf2KB9KfHny+4MPAPb9d2NEWEZ2CNawVSBiG7A3pWUfrgcjVTurx
	FJeNouePZxpiiNFZJ5dVQ=
X-Google-Smtp-Source: AGHT+IHVZMV/MbyEPPexb7J3WeNZYZ5CxjZ+VTFaUFe+rZPsUq+igvni96NJQxPQP+jJ8ClbAvXlfA==
X-Received: by 2002:a05:6402:4302:b0:5e7:7262:3bb6 with SMTP id 4fb4d7f45d1cf-5e772625471mr1960367a12.29.1741681357815;
        Tue, 11 Mar 2025 01:22:37 -0700 (PDT)
Received: from ?IPV6:2001:1c00:20d:1300:1b1c:4449:176a:89ea? (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c76913bbsm7880931a12.78.2025.03.11.01.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 01:22:37 -0700 (PDT)
Message-ID: <897ade0e-a4d0-47d0-8bf7-e5888ef45a61@gmail.com>
Date: Tue, 11 Mar 2025 09:22:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 nf 00/15] bridge-fastpath and related improvements
References: <20250305102949.16370-1-ericwouds@gmail.com>
From: Eric Woudstra <ericwouds@gmail.com>
Content-Language: en-US
To: Pablo Neira Ayuso <pablo@netfilter.org>
In-Reply-To: <20250305102949.16370-1-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_012240_983719_A6C62393 
X-CRM114-Status: GOOD (  12.32  )
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
Cc: Kees Cook <kees@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Ahmed Zaki <ahmed.zaki@intel.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org, Ivan Vecera <ivecera@redhat.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, Jozsef Kadlecsik <kadlec@netfilter.org>, coreteam@netfilter.org, Roopa Prabhu <roopa@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Nikolay Aleksandrov <razor@blackwall.org>, Jiri Pirko <jiri@resnulli.us>, bridge@lists.linux.dev, Kuniyuki Iwashima <kuniyu@amazon.com>, linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, netfilter-devel@vger.kernel.org, Simon Horman <horms@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 3/5/25 11:29 AM, Eric Woudstra wrote:
> This patchset makes it possible to set up a software fastpath between
> bridged interfaces. One patch adds the flow rule for the hardware
> fastpath. This creates the possibility to have a hardware offloaded
> fastpath between bridged interfaces. More patches are added to solve
> issues found with the existing code.


> Changes in v9:
> - No changes, resend to netfilter

Hi Pablo,

I've changed tag [net-next] to [nf], hopefully you can have a look at
this patch-set. But, after some days, I was in doubt if this way I have
brought it to your attention. Perhaps I need to do something different
to ask the netfilter maintainer have a look at it?

Best regards,

Eric


