Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1D10C433F1
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 14:16:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D28B2063A
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 14:16:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rRJt90ma"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D28B2063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BEaJjog4Qw8+ahgkvOIDopSQOXj1KpAD6t4HfE8Zpjs=; b=rRJt90mam2Xne7xn0PdNZUr3Z
	tNhHH+xV/FL935/+z9ya2FJeMXnUBx2weMKAGKp+Z4k0vhlJAa3Re95Z5UX9/9EO0sy8z0tzOMXK0
	O+qeQogMNP/jqjsOUM3YWBLIwvd0Fh/+IwRID4+OFm/7VkuEVaV6YcroykI/0VE4snxfHaY7lfibO
	VyAz7BHMU5RW+z96uaG+pvGkZsjsi/7V+2Yl0/CJMee8bZywpj5rl0uaV5kc5I0dXjnGQU7tHQBRi
	s5sBkw+o6eFIIF61a9+fbQ7wNHCjOehrCRuWdPFM0FIt8kUqZF5k10U5srSPwixTeWi0xc+qwmnRA
	kD5sdLgtg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyyUh-0005Yo-UI; Fri, 24 Jul 2020 14:16:15 +0000
Received: from mail-ed1-f66.google.com ([209.85.208.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyyUY-0005Ud-2S; Fri, 24 Jul 2020 14:16:07 +0000
Received: by mail-ed1-f66.google.com with SMTP id by13so7121886edb.11;
 Fri, 24 Jul 2020 07:16:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tY5Z6idGhGaqy3j7rWihq62kp3XpN6wVWhfnttBTXk8=;
 b=Qrt/X36IZXKN91Oc8mOrKqbL5T4o08/uv3jL+inIfYEb8WPqCG48J6wE4Sqjmiq1kz
 wtOzIevi9WJ/Da2GoY4h8c5wt2mkkx1THUt5Gs5E5vfJSNAISj3a78BgrnVL0tvA2UwM
 rUm5Zna8SIeN7sPkCWH2JXTP4p33I8PTgOGkhl5I/K4XbffcIGBYpuqda3jTjDOKUgnV
 WXY72bWMA+NAFz3uQNeObNZF6BYh4geOfRe48wMnsr27kXqov4u8Ojgo75RWHYF8kkVz
 H84SKBO6tDxlxfhbrDKsVBE9nDvOdOVDhRLY1+YCa1MiPEius/OYF3L3Yf2KKMSSxm7w
 NkTQ==
X-Gm-Message-State: AOAM531ukrGRsOhfaXZY/k4jS6Yikbz2sxGH9skqirZipBmNQ/6BtpnY
 ZktYWp+ss4q8Et5bu9f7qQo=
X-Google-Smtp-Source: ABdhPJxbtj3fM+AjJ6hvcrUuIeJieCO2lk2efSggfaPTyqvT5VX+nS/1FqCch3ryhjUR2m21oTec/g==
X-Received: by 2002:a05:6402:1b1c:: with SMTP id
 by28mr9171688edb.270.1595600164984; 
 Fri, 24 Jul 2020 07:16:04 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
 by smtp.googlemail.com with ESMTPSA id fi29sm758336ejb.83.2020.07.24.07.16.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 Jul 2020 07:16:04 -0700 (PDT)
Date: Fri, 24 Jul 2020 16:16:01 +0200
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
Subject: Re: [PATCH v2 23/29] memory: pl172: Add GPLv2 SPDX license header
Message-ID: <20200724141601.GC10663@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-24-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-24-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_101606_144159_2CF19697 
X-CRM114-Status: GOOD (  11.99  )
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

On Fri, Jul 24, 2020 at 09:40:32AM +0200, Krzysztof Kozlowski wrote:
> Add GPLv2 license header and remove GPL boiler plate text.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/memory/pl172.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Applied (and part of pull request to arm-soc).

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
