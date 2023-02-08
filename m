Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6ADC636D7
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 14:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2CtqUutiexK1fE8rvThH+wZLHHl6K4XsD4uDvkh7n1Y=; b=akn6pDnQhqwo1EhjOtOi7RI0H8
	9DETHQ3VbHVMVsB3B5cT5+RIOsqTzzfJdzvC/96T4K3aDnpbLITAjBRcOcQ671+GnMCExyomIQMSn
	QVRBP3l+Iu02ByFpV8O2P9ViIeQXybl/LIMVeH4Q3EzCUov+0xx8Ks4vOwU/p7Q+PLnPQraQnjiDf
	S2km1Ay+OCNU4CYNU3+hmw2UTfiBkXSby6yNxqFAgmqTdXmbgU51/WmIteLkPdwGzubCasPo5l9/X
	VI+6JWbQ2IAJxOhzzq8TgYVIUtAKqIza24GuKmzrJrmUcVUfQlssvEJdrVLbnnO0Hk2XexecqnFs3
	u/STRjaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPlNs-00FtEt-Ke; Wed, 08 Feb 2023 14:25:16 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPlNi-00FtBj-It
	for linux-mediatek@lists.infradead.org; Wed, 08 Feb 2023 14:25:07 +0000
Received: by mail-wm1-x32a.google.com with SMTP id az4-20020a05600c600400b003dff767a1f1so1605875wmb.2
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Feb 2023 06:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2CtqUutiexK1fE8rvThH+wZLHHl6K4XsD4uDvkh7n1Y=;
        b=GnDIdcwIDW2t6wPFamBykqJGiJ4n5Zz094w5Bovgac5OrpK0bl1pH9AG+xFbtp6qTP
         Z7HDOBjm1CfPXUOfYND42vjWMbm4Pfku9fqjEYrC/4cyB9YafE9moGWQHRCsgFMVsl/g
         H8er034sSndNUBClfg392ziWuqe27ItqjfydBLlu5Ruj/S5Z3I7HhHOpSGlAEmM+t840
         yJFLFnDQj8EaMimFWUTmClBCcR5A26b+y8i0HFK8ZIeTxMHyrV0om5q5fp0oB6o7Lgk6
         96GOIHBIYDSmGqMiKDn6sETcPmJyhutOX+3rIjjWjX+dNbYJKlPcDXNm0yV4w9MJheC1
         6UHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2CtqUutiexK1fE8rvThH+wZLHHl6K4XsD4uDvkh7n1Y=;
        b=oI+In/0fxuDl35EAkMYP2ag/8+Y0OFqf1p40EZwHaeoCJE3ZQH7RkMW5SdzJXiHEBs
         eGvwL26qH9HuC5Qmuj02blOxa+eRrOE2Uz/b/+k2BcQdnh+JKr9aivb0ZWrAB3ilOQ3s
         8e4rCiDpNQ9wvZAFRiwKafYsCD4itS9MQfErdrn7IcBUgz+s9F/SudSoFu7ly84nP4c+
         mJOJwraRH/istozbESAJWwNrQYtpusyCeHoycTHbdv0tbfzS2yLnzasgo1IYwquMiWRW
         EhatYxpb7F/m8DyQlXyFg4uVEpCIbU22t2lupvCaFnOidGQ1mxXAigERjTuOcIbsQKKe
         lglw==
X-Gm-Message-State: AO0yUKV0aJbKgbUNQ44xksM4C5o2hJ33Jiog5qfScY6CCPB7sVhtUKzX
	5Q5PNI8bSOQqdVUqLLlpe7/UcA==
X-Google-Smtp-Source: AK7set8oQQPSSCVq3i/XNX+CokxHBvSTn4BCLWVR+YPp+jCeWNWC5WKvAcN55g7PhhSrYlvIBwBPAQ==
X-Received: by 2002:a05:600c:4d21:b0:3de:e447:8025 with SMTP id u33-20020a05600c4d2100b003dee4478025mr6617024wmp.21.1675866301950;
        Wed, 08 Feb 2023 06:25:01 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id c63-20020a1c3542000000b003df14531724sm2181890wma.21.2023.02.08.06.25.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 06:25:01 -0800 (PST)
Message-ID: <e1a89a4e-8a0d-47e1-a8fd-75ea152ef816@linaro.org>
Date: Wed, 8 Feb 2023 15:24:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/3] time/sched_clock: Export sched_clock_register()
Content-Language: en-US
To: walter.chang@mediatek.com, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>, John Stultz <jstultz@google.com>
Cc: wsd_upstream@mediatek.com, stanley.chu@mediatek.com,
 Chun-hung.Wu@mediatek.com, Freddy.Hsin@mediatek.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230208094813.20874-1-walter.chang@mediatek.com>
 <20230208094813.20874-2-walter.chang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230208094813.20874-2-walter.chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_062506_659037_D5E2F77C 
X-CRM114-Status: GOOD (  16.14  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 08/02/2023 10:48, walter.chang@mediatek.com wrote:
> From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> 
> clocksource driver may use sched_clock_register()
> to resigter itself as a sched_clock source.
> Export it to support building such driver
> as module, like timer-mediatek.c
> 
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> ---
>  kernel/time/sched_clock.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/time/sched_clock.c b/kernel/time/sched_clock.c
> index 8464c5acc913..8e49e87d1221 100644
> --- a/kernel/time/sched_clock.c
> +++ b/kernel/time/sched_clock.c
> @@ -150,8 +150,7 @@ static enum hrtimer_restart sched_clock_poll(struct hrtimer *hrt)
>  	return HRTIMER_RESTART;
>  }
>  
> -void __init
> -sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
> +void sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)

Is there a non-init caller?

>  {
>  	u64 res, wrap, new_mask, new_epoch, cyc, ns;
>  	u32 new_mult, new_shift;
> @@ -223,6 +222,7 @@ sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
>  
>  	pr_debug("Registered %pS as sched_clock source\n", read);
>  }
> +EXPORT_SYMBOL_GPL(sched_clock_register);

Where is the module using it?

You need to bring users of these two changes, not just prepare something
for your out of tree patches.


Best regards,
Krzysztof


