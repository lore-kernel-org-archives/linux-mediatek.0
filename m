Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E62C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 14:11:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7410C2063A
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 14:11:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nhgfFEwe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7410C2063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zdC30hTzZnitAjxxhDIhMUxrZIHtilFpuH8ybVMyLxE=; b=nhgfFEwenITg7lfbW7pghiTri
	C2Ry0PVbiYIisrO+usD2b+MB+5gZrHoi9JYsPe83Z/OocsapZHXj+HEcHFWTVVFeoIHAPQr8GPrhQ
	bpkdPlRmEKxSyet56AxxvxPdm3aBEPW5b6+7dwXVBu8mCo1Cbrgao712RG2diqoTT7rIeEpIktakB
	/osLMv9ELKpnzYIfn227BprzdZbh0yfSgQ/hXHfzSgcupoRU9T8MQdxEV87qwZO/X2ORo5Z66u7MK
	EkZRXb9beIFKMg7+t9zmV5LIK9bVxbWzpLh9+6TgU780VtrvTi4J0q+Q8G9JLmitxxhrdJhKtLg7z
	4/h9X3C+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyyQB-0003fP-Jl; Fri, 24 Jul 2020 14:11:35 +0000
Received: from mail-wr1-f66.google.com ([209.85.221.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyyQ3-0003bJ-Gz; Fri, 24 Jul 2020 14:11:28 +0000
Received: by mail-wr1-f66.google.com with SMTP id f7so8468984wrw.1;
 Fri, 24 Jul 2020 07:11:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2RbvOcNTBCcTHmXNREDJs12mgijnjhzxCtnjRZr8ol8=;
 b=ubqhr0yLkUTDOxkXoDjC5IFOAipG4C3Vs+O5D5RxaYQtI1yohmeMUa4yX+34g+qVQO
 xJAPbpQMYMEr9jCxTD1ZJzkR8arYstOkqxFqBeb7gs7l33mcpLMmhWVzQ1CjKLJjoMgI
 UF9Y/MJWjs2UoQgEo8cvfpTwNMhOUBz887bNaS9LwnzHSpbVheXZPH2FvRGnYXVgzAjP
 zJ+/Gead3+Vne/Q0I/shYxGMbhTG3lANCXFVB9e/FlXRMGLzApX2kTgJ8XSd6w0k6AlZ
 lgkMuAxMRDITpzHgBHIL4HhhjG20/GbKaNvO24Dnp6E2jiT5Y+ZI4/LhuGXfEhNY2OTU
 Zesg==
X-Gm-Message-State: AOAM531PmsYskeLJQUVfra/wyGYOuZmbj1TtEBNvVPGejEsEvDyVOE3m
 Kg/cpB5XdyZ5TMvqFjkixzA=
X-Google-Smtp-Source: ABdhPJxuanK99JgtCFD/kyLYhj1m3VPN7GVyIvcjAjLoBgeFmxoxxrCiq+S0zBIRvkmJH9aZHm/a1w==
X-Received: by 2002:a5d:65d2:: with SMTP id e18mr8593283wrw.70.1595599886067; 
 Fri, 24 Jul 2020 07:11:26 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
 by smtp.googlemail.com with ESMTPSA id p8sm1592476wrq.9.2020.07.24.07.11.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 Jul 2020 07:11:25 -0700 (PDT)
Date: Fri, 24 Jul 2020 16:11:21 +0200
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
Subject: Re: [PATCH v2 14/29] memory: emif: Silence platform_get_irq() error
 in driver
Message-ID: <20200724141121.GF14851@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-15-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-15-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_101127_630466_14CDB2CE 
X-CRM114-Status: GOOD (  13.97  )
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

On Fri, Jul 24, 2020 at 09:40:23AM +0200, Krzysztof Kozlowski wrote:
> The platform_get_irq() already prints error message so there is no need
> to do it again in the driver.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/memory/emif.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 

Applied (and part of pull request to arm-soc).

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
