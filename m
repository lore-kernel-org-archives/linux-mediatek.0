Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 558BBC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 18:34:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B9852063A
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 18:34:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hssiHisd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B9852063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+M30vxBvdechbkOzOMH+27gCkKYL4CXYOtZyQXAgShY=; b=hssiHisd2HRS9YSxtops18qOF
	yZR6H0Knfs/Mw3lQYZYSmLtbgdzqbM1tEzg+Fz+aXykI5Ywg9MdekbiuWOrq7v/Y9dWmF14ArKayj
	GmK+EWqRROvZf15Z1R4P6mzWfjl8KdC8mk8Icf+Hus5kXZkzH6/6GSZ8FodmYSHe1Z41TdY6cSmqM
	qWXmavjBKCn3HFWnTXZSHvG49fxNbqsCryWGcqg989E7MBAi//VzM1TDo81zymkoBt60b7d8Is+R2
	PzHfTLzfGGEXbJsL20CJCcuhYj/HNtevJuvhGUboK+p6mr20NIytOpM/ucYJw5hzfVHmR1gnw0jW6
	aOKiAzRvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7jxj-0007fK-Tr; Mon, 17 Aug 2020 18:34:28 +0000
Received: from mail-ed1-f68.google.com ([209.85.208.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7jxf-0007dg-SQ; Mon, 17 Aug 2020 18:34:24 +0000
Received: by mail-ed1-f68.google.com with SMTP id w17so13100813edt.8;
 Mon, 17 Aug 2020 11:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UUC1YYZepwSIaUyyVu4p4E8C9yxfTbr1IBllNcE9Kwk=;
 b=AZ4KcR2Ybi0fa5xrGIVBcIUWjnedYlVami0cArJmqDkIrN3bDDDDScsOu171HtjXJp
 WuJhUGF8Nq3YKYdByTPJe8BfUqws0pXmk4mnCOivTFJs8XjdofgcalJZIZAFKz+7RCWs
 XzaQ0MF8T2zIkF9txWFtrRbeq5MX02EwTxOhVLWapz/U9/LNV84IDNsvo0U7H0dVp0BF
 4YyfGFtTBAJy5q5NdarN6mMmNwOklR6fLqnlb5YJwGcdTIPvH7FB2D/kG3KpkM1McUri
 vm6O9FPYozYN+2ACJYmod0fOn9L6ukQxV3aeurr4b2wASkkhch702pGPbRvVNbGk8YKp
 Cu/g==
X-Gm-Message-State: AOAM531jDseaAGNAKAhMMmT/N401h/CipSi3AxRp9Ul0QKMaeZ5M7jV5
 5DzcCLQa3YSUACqfuTkVs3U=
X-Google-Smtp-Source: ABdhPJyMkkS73tARItUdlMSiGOG9MxnnjtabQxaD28LAXhwot6oVxwb23In6Y3s0rvfq+6XG+6YFUQ==
X-Received: by 2002:aa7:c50b:: with SMTP id o11mr15637355edq.59.1597689262974; 
 Mon, 17 Aug 2020 11:34:22 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id
 ss20sm14764697ejb.118.2020.08.17.11.34.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 17 Aug 2020 11:34:22 -0700 (PDT)
Date: Mon, 17 Aug 2020 20:34:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Markus Mayer <mmayer@broadcom.com>, bcm-kernel-feedback-list@broadcom.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Kukjin Kim <kgene@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 16/29] memory: renesas-rpc-if: Simplify with
 PTR_ERR_OR_ZERO
Message-ID: <20200817183419.GE3464@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-17-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-17-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_143423_948229_9749DD3C 
X-CRM114-Status: GOOD (  13.82  )
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
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jul 24, 2020 at 09:40:25AM +0200, Krzysztof Kozlowski wrote:
> Use PTR_ERR_OR_ZERO to make the code a little bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/memory/renesas-rpc-if.c | 4 +---

Applied.

Best regards,
Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
