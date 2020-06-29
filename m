Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2675C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 17:20:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDEE1255C4
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 17:20:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eTcDiVPn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ewKodK9a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDEE1255C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vILqJIuyt6ClmGhhkrYqV+c9Ao8zAzyfWYbxXGWUSOc=; b=eTcDiVPnguz0i3K9YRcbivjaW
	0qk7dTvd9QmE5kjVdZco7cuv01iFok7RcQZyYCTvkUBIsIKbvmaPRjb8e3wVXFVqyz2UjHYYVOtVq
	9q0V1o9wad1Tbd9YrPGmlcnIzIzYE8JXSuhJZQClZ917PexPPr3Cd/7YcryE5ZhFPD1Pgx0x8+c+7
	C16NWrkqb2vFx+sou3qD6HwD90rmIwh0e9kOkanldA8Kr12D68nt5bw2h9YidihGNgh7YT13yJOU8
	n/Qhf21p69QLJi2wmu3MUn2h/ExPRyLiaFOBmS/VKZgOaQAkkvA+h7K6roEi1l/I76sYjPc7lI9Cu
	AZl6s5U6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpxSM-0002n5-Vl; Mon, 29 Jun 2020 17:20:35 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpxSL-0002mM-LY; Mon, 29 Jun 2020 17:20:34 +0000
Received: by mail-pl1-x643.google.com with SMTP id g17so7339896plq.12;
 Mon, 29 Jun 2020 10:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EBxO7W3vjKfKExb7YIhRFg//dsteKdeNGdPmppkjMb8=;
 b=ewKodK9aN0OWBZQbu44iYiVfZECWxTo16lvDvRM89Z4teK9Y+NqZrKgHYKIHfQNOTY
 vWSJsKDUNNqYREungOJwclpKtKpmRkrGL+hMdIqE94CYuq5fgEYhUIMzysHUIT76AEss
 9/Hf9IgN/E1R5MQ6oWDqXpxAzTI8bKdOJqf3X5whfi8CQo95Fb5coiHOOJu0SF++m1CG
 xuFod+DMFoP8uTRz17dh9MvwIzMuRq7CCB2EiZri8RNCupv/MdpyiQacCznzyf9Hd0Hm
 FhBrhOLm+FIsA6Wt/Uu/B/3Nlo28pPvmhyhjwn+WhNH66L0Y/en19olQMt1/sRgiJtSM
 LrFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EBxO7W3vjKfKExb7YIhRFg//dsteKdeNGdPmppkjMb8=;
 b=Rrlw3GOI+ik4yotTUaZi8APKLjBr882sf+iVnvObyYrPA8OS+xSCdR54y/ZR/IcOQz
 /pwjC5I/l5DQdvUCcIpsg/lKu5ww8YTMM2vQPhraqQdfWHVWWzsdchXA6VHLQHFrcpTS
 GqQOEv0OhKGxevUy07hIF3pm/6TkFpfpimGEECz9155zrztNEtGHB8HCZN5NG8/+8a6v
 LzBGHrOnQuha4ZXTFGnIhVwrCPOIziAkvDllybXTOQXWoyZDYEYbRP0Wdk/A8sY54Pmh
 sofTxdj27sR6CS7Zk73ee3OtgFRscwwqIDLiJXdMEALEzgA7GTjJWFaK9yLBFtmE3dfv
 9vMA==
X-Gm-Message-State: AOAM532xiGuwWSQzkzHlogJV+FoM6ihQKXJQPXkF75tyGerhDvNi+X4r
 qyfculMLeLgOezfPEhgQHlY=
X-Google-Smtp-Source: ABdhPJwBXYzSqVqaej7MrTtvAoxQQyVfrLurS2VT0FpRREZWIImH+ognZwMO6/Mmioqfe4mIEvAzzw==
X-Received: by 2002:a17:902:301:: with SMTP id
 1mr14726130pld.214.1593451231314; 
 Mon, 29 Jun 2020 10:20:31 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id f29sm331735pga.59.2020.06.29.10.20.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2020 10:20:30 -0700 (PDT)
Subject: Re: [PATCH v2 08/10] of: mdio: remove the 'extern' keyword from
 function declarations
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
References: <20200629120346.4382-1-brgl@bgdev.pl>
 <20200629120346.4382-9-brgl@bgdev.pl>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <4ec2d4c1-3169-da94-2fe2-1165e1fbd531@gmail.com>
Date: Mon, 29 Jun 2020 10:20:28 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200629120346.4382-9-brgl@bgdev.pl>
Content-Language: en-US
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 6/29/2020 5:03 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> The 'extern' keyword in headers doesn't have any benefit. Remove them
> all from the of_mdio.h header.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
