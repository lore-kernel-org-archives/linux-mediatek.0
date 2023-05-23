Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F5DC7EE26
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 May 2023 11:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=de919cKCe4wT4S260hv+KZxN0tV8ssN9pP3EBr3fXco=; b=kxZh2wQDjz0GaQL4Sv+AuBzIKH
	RykyAaBw2MOOdJs751UnpFqBa1gpPC7Cf/Lh8B6iZY/LclFbPXg5viqcbOb6pwnI+nrYs7y1ZNgUM
	b1SfZ7sf/PlaIsr5M0GL37nzB34eA52wlEvTlbbfgHZEkB62gVKH5EMUdwt5Ujc/hVRLehp1G5S6a
	1JYOsc4lG/3ciGk9YO/qiSrhcwDmOTEQ/5LMchCwMjPR1rujmT77Ch3H73cTBJ/wBrdc+p/Ws/PfU
	YfkH7VCt3CuykZRcbrYPoR/aMK6HqvKfr6bATF8d4FjJ+XeHvUPjcbfRaC436eVJtceC/YUzDgf6L
	30VzlR9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1QBt-00A4sh-02;
	Tue, 23 May 2023 11:28:33 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1QBn-00A4qq-2b
	for linux-mediatek@lists.infradead.org;
	Tue, 23 May 2023 11:28:31 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f608074b50so15481575e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 23 May 2023 04:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684841305; x=1687433305;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=de919cKCe4wT4S260hv+KZxN0tV8ssN9pP3EBr3fXco=;
        b=P8jxl9ew7AY7pYFsvzp2552hspigR6Z9lTpMrx/E/rm0e9IVC3n86B9YEwEivObDJL
         pnKZVxH6JW3C7k0XuIoSYxW7ST2AQFmiyT8AK+Cdf4KW1E6Nxh2aOrbPP8VXJjL0icbQ
         tjFstIeHLlMxleXsg5vBL3c/Do6TW7Xi6cH9nTNfKt4Qy8vP3p5bNa3F1lBR0jdICuoY
         jkfK40NRUmzqYK1DBInaQADMSh/vP4OpRURdNPpkdhT0N+vlN5db0iVSZ1qKfw6aOmoM
         Ss8eeVP1m1v0Ax1plx4Yij+URN26nen6sEwae7yzxtDWpFCjmb2uT5EL4pspmsja6FER
         aaFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684841305; x=1687433305;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=de919cKCe4wT4S260hv+KZxN0tV8ssN9pP3EBr3fXco=;
        b=Gd53A/FKutHV8lrkb0r6zzZOCfaXkNiuffWE/OuIKoqDVtsZpZ8IR+oOT82LpXkk1T
         OA6KHgQsgmAJ5Z9j1t7xKl2Ili0Ihz5Y5zEmvqZgMcLpU/T3JZiVjetSM8x2EOIV8IlF
         sQcWlwSV0UxcEbW9mFGm/jmsmhnjdp2yJRscL2sW+fIyiLlvfiHDZeawBlOv/D3NIPHq
         5oU0kcrwZ7EbDiYIXk2tdqHJKZZwYkxqnI5/ixTgMly+807JQWRBB7CU8rZ9qsVzOUQA
         FtiJRNV+roeMzsQm/QJrrMDGGW9ttrvYbgK0fRmKPITAzmNyrugOPlo08d3SOfZcmhtq
         nsgA==
X-Gm-Message-State: AC+VfDzargtZiIdCHXuDxo52kDjftXsdf013ILY+arPt/1KnKQTjq3LJ
	53x8K/m3A/T2lYlEkxPB1vmqqw==
X-Google-Smtp-Source: ACHHUZ6ZUa+nR/kj5kFbDcpE0lUe0Vuodny5XRTkBlniwziBN4L/FCtuVVfY4htvApP+nKiAfJ0p4Q==
X-Received: by 2002:a05:600c:ac5:b0:3f6:44e:9d8 with SMTP id c5-20020a05600c0ac500b003f6044e09d8mr4801602wmr.22.1684841305153;
        Tue, 23 May 2023 04:28:25 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id p19-20020a05600c205300b003f60101074dsm9380658wmg.33.2023.05.23.04.28.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 04:28:24 -0700 (PDT)
Message-ID: <b0a1d728-6ef5-9cca-4cb9-18e35df61748@baylibre.com>
Date: Tue, 23 May 2023 13:28:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 4/4] clocksource/drivers/timer-mediatek: Make
 timer-mediatek become loadable module
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
References: <20230517022557.24388-1-walter.chang@mediatek.com>
 <20230517022557.24388-5-walter.chang@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230517022557.24388-5-walter.chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_042829_240331_5F940AAB 
X-CRM114-Status: UNSURE (   7.68  )
X-CRM114-Notice: Please train this message.
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

On 17/05/2023 04:25, walter.chang@mediatek.com wrote:
> Make the timer-mediatek driver which can register
> an always-on timer as tick_broadcast_device on
> MediaTek SoCs become loadable module in GKI.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>



