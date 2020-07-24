Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8022C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 14:11:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A801920674
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 14:11:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J29gwcIH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A801920674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zwZDyMFZiC5H0xKBHQ4T+GAKO0JWJFUdlhcuQbkPZZA=; b=J29gwcIHeTTbaqpG+p9O3g8CZ
	UFjRgW7T4CdMa+SVsZbPF9bsELhHm8+e2BKyw7JTJRHmrCBRPD/XhupFuUfDsX+ZfPD2jovQY0VBP
	OtfXf5s7qnNs9HtetmDlA1286oo+pdyHGAW3hi8+h9z9QJruGY18XTlyg1WVMD+pidNSZ3cI+cM5Y
	uggXFv13tjmmJn7EO1ng9fmbKVIVkSWNy1zT1mDwVUxOxTJuOSQOiLW0b1SE/Vfv97W52/v6kIZkM
	5hw7jMk6LDGMAVVVW68QH1raibgOjRAUsSfy09/l0iOWOsUKCe+uUQfusoR5FiMEeBpEStlVkJ7zg
	TvVniI7og==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyyPe-0003Pb-7a; Fri, 24 Jul 2020 14:11:02 +0000
Received: from mail-wr1-f67.google.com ([209.85.221.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyyPW-0003MG-0h; Fri, 24 Jul 2020 14:10:54 +0000
Received: by mail-wr1-f67.google.com with SMTP id f18so8472661wrs.0;
 Fri, 24 Jul 2020 07:10:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ImFzmFIKK2H2nANXLXd3qxiApcEikV7VM9V9o6SJtnk=;
 b=mr3LiHTXMPnAkob2e41JPwRyqFUXbo5Z3yTeN4i39H1FMWEkndKTUkS2J3wMQH1/iC
 rD6p2iBn7eQWbZUikk2uJCAjM0WuuR1qdzcPACS9YkH4ZwaBNePW4V1FvayvCtL2MuVC
 JuJhEMqNRpM1Y4FFXT8dUvd3RqsSCizRBJGaJkuRoynvCQEelx/f1vTw7zrvYqA23bh1
 ynfgfWfvCORs7emBWqm9d3y+hJ6jenmkPQ2GO2heYGTyeuojXo5FXN7Pz8QjImkx3fM9
 hUD8y7LHBZ28zCeSzunJOxHHAjMv3rbAfQDQW6xXjxCAMtHQDuSa0qtKUnYvUEYRM5bE
 KzTA==
X-Gm-Message-State: AOAM532nvnNjEFMxDvL0TolEG13wGy8OetXd4Z1f9k6IF5vakHsmq4/a
 9usT6GY8J4XOsiz6v6e+OQVafmsbLgE=
X-Google-Smtp-Source: ABdhPJwnBVOwUfzxAP/bVrE3rgtnqO3Qtmb3o6jbq4oG5/rcbWYkcM90AMtLUkNyJ01GAbEXmxrCXg==
X-Received: by 2002:adf:f785:: with SMTP id q5mr7903553wrp.298.1595599852416; 
 Fri, 24 Jul 2020 07:10:52 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
 by smtp.googlemail.com with ESMTPSA id t2sm7829924wmb.25.2020.07.24.07.10.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 Jul 2020 07:10:51 -0700 (PDT)
Date: Fri, 24 Jul 2020 16:10:48 +0200
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
Subject: Re: [PATCH v2 12/29] memory: emif: Put constant in comparison on the
 right side
Message-ID: <20200724141048.GD14851@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-13-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-13-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_101054_076819_4EB44DB4 
X-CRM114-Status: GOOD (  13.94  )
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

On Fri, Jul 24, 2020 at 09:40:21AM +0200, Krzysztof Kozlowski wrote:
> Fixes checkpatch warning:
> 
>     WARNING: Comparisons should place the constant on the right side of the test
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/memory/emif.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied (and part of pull request to arm-soc).

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
