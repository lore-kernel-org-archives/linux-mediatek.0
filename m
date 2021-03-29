Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD671C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 23:06:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3355F61935
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 23:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3355F61935
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bOOuuioldy9eVxR5ZMGKufWoaTqmWMOoXWDRMP4eaxY=; b=C0WtiMgFM6MDk+mhVmCDcJpf7
	09ISIKKutOzhfiTXCKJJ+cpn2fZkSw24Y1pL9UVOfJG8KEk9IQhfp5U6LcJvLF4jiC9kou79yKbw4
	7zWWwhBl7x1Jz7vaqfdyngO+r4yLNKVAspQBaIhNFHlqwWPy+WE6OdPEkOnGyCyspSYSz8iUcRum3
	8G+PGci5G5ryI9FRfwzTh5HIXb7n6vjiLVJAsen+C0Rlm+PnnoGKpseMUbfjF6S+B5Apuz+b9TLP6
	rwzzZdvJQvYvUtdXG157+aKUoLouz2HIUIbwvZrTkLayacmeo5MEOncV8mce6/IWlWi4Ji4CrA/NW
	rg9sh5chg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR0xX-001phW-Tv; Mon, 29 Mar 2021 23:06:12 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQtt1-000jn5-Vs; Mon, 29 Mar 2021 15:33:09 +0000
Received: by mail-wr1-x42f.google.com with SMTP id v4so13267135wrp.13;
 Mon, 29 Mar 2021 08:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6S59QvVKMEA7QZNeRiH/vZL9UgEuqddM2QtPabiSR8Q=;
 b=krqbhuOQUCF06c9G5rFIWOgWukje7i42PIxNHOoDCRMY3ECy74CSt4d7QsZKGE52iV
 YlELxYZfM1zHCREEZlQM1F+lNa1lh6gMY8+MZ6IR712yHgVNPrR/RF8fpFdZ3+Fc8mvV
 6EZOGxeaF9b6vxPl1cGWC3AA5NCcieErs8Cqw9dvQ+kmpcQ6BE4aDwJKztE0mVaEWeFa
 wT0XXFveMTf26ZO/6H9Z/g+HphlUqdvz1Rhnk8a9yIenZ3BujGUedBTlE1r8KFRzlvUh
 XajKk1zUBFnjum8BmgGARuL/E8Qt8d7hzZ9caB/JQKv3qta6kErXjJrD1v9suu2aumXc
 o7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6S59QvVKMEA7QZNeRiH/vZL9UgEuqddM2QtPabiSR8Q=;
 b=a2XiG9yQmnykDUBpH1hGGSm02jAqdZZZIVLrv2xAro4ngHFYotbS4z1l1yhRUqa31U
 +PYJPxxctRaysPCXf8uSFmAD6eebGEGSHnRRSrWCQMw2u0T6jvENmhL5Isz2RMuOKGzt
 ZOU/pSew8hZaHzmISr80n0pKYCGxQ/B9eLGHdzbygTebauJx1FhxzgKoWrAMJQ0sOWSM
 gygck4cYZxtiBafqM9ZNw+g49pjH8j3w+SxapwCSX8ksdV57j150jDPtLZqmRywGTqMm
 Z/+RJernTf0QHOqYBHuSMgwmKZy80PbmDQKPer/PJRqAgJEB89Prm79uIfn5eMY3Zn8q
 Sf/A==
X-Gm-Message-State: AOAM5334a3g2pdzAPOp8fA3rc6tOtuaFbwgueu/kyERAhIJKbilDg5DI
 elO8lycMuJK+EHqUA802TSQ=
X-Google-Smtp-Source: ABdhPJwm5DBW5AJ1gpDpOlcDBiySR4KqOD2ncs88GWPolI3TDxRgp4K/jQFr2xrL1nc74QSrUC+94Q==
X-Received: by 2002:adf:bb4c:: with SMTP id x12mr12293184wrg.271.1617031982409; 
 Mon, 29 Mar 2021 08:33:02 -0700 (PDT)
Received: from ziggy.stardust (80.174.240.175.dyn.user.ono.com.
 [80.174.240.175])
 by smtp.gmail.com with ESMTPSA id v18sm31634589wrf.41.2021.03.29.08.33.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 08:33:01 -0700 (PDT)
Subject: Re: [PATCH 1/2] drivers/clocksource/mediatek: Split mediatek drivers
 into 2 files
To: Evan Benn <evanbenn@chromium.org>, LKML <linux-kernel@vger.kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, Julia Lawall
 <Julia.Lawall@lip6.fr>, linux-arm-kernel@lists.infradead.org,
 Stanley Chu <stanley.chu@mediatek.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Fabien Parent
 <fparent@baylibre.com>, linux-mediatek@lists.infradead.org,
 Alexey Klimov <alexey.klimov@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>
References: <20210318160414.1.Ia2a09ce93b47eac45308205820db0938d47604df@changeid>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <1f4dd7b1-3bb5-51eb-f980-e2ba41f43823@gmail.com>
Date: Mon, 29 Mar 2021 17:33:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210318160414.1.Ia2a09ce93b47eac45308205820db0938d47604df@changeid>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_163306_787363_D80E6D26 
X-CRM114-Status: GOOD (  16.86  )
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



On 18/03/2021 06:04, Evan Benn wrote:
> mtk_gpt and mtk_syst drivers for mt6577 and mt6765 devices were not
> sharing any code. So split them into separate files.
> 
> Signed-off-by: Evan Benn <evanbenn@chromium.org>
> ---
> 
>  arch/arm/mach-mediatek/Kconfig                |   3 +-
>  arch/arm64/Kconfig.platforms                  |   3 +-
>  drivers/clocksource/Kconfig                   |  13 +-
>  drivers/clocksource/Makefile                  |   3 +-
>  ...mer-mediatek.c => timer-mediatek-mt6577.c} | 100 -------------
>  drivers/clocksource/timer-mediatek-mt6765.c   | 135 ++++++++++++++++++
>  6 files changed, 151 insertions(+), 106 deletions(-)
>  rename drivers/clocksource/{timer-mediatek.c => timer-mediatek-mt6577.c} (69%)
>  create mode 100644 drivers/clocksource/timer-mediatek-mt6765.c
> 
[...]
> diff --git a/drivers/clocksource/timer-mediatek-mt6765.c b/drivers/clocksource/timer-mediatek-mt6765.c
> new file mode 100644
> index 000000000000..b4f22f226feb
> --- /dev/null
> +++ b/drivers/clocksource/timer-mediatek-mt6765.c
> @@ -0,0 +1,135 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Mediatek SoCs General-Purpose Timer handling.
> + *
> + * Copyright (C) 2014 Matthias Brugger
> + *
> + * Matthias Brugger <matthias.bgg@gmail.com>

The mt6765 was written by Stanley, I think we should reflcet that. Please see:
e3af677607d9 ("clocksource/drivers/timer-mediatek: Add support for system timer")

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
