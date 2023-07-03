Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1914EB64DC
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jul 2023 12:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+6M152gdY/lBTJnlZGUQ74XMgASY/+UfhDS7moIYzgc=; b=EDJOUiFc5GBfWzPNwUx5oosa8n
	0b3QMBDx1IZs+JXbW7v7BX+zDMWjsCUCXr7CX8+p5zThdGKUqGDPZOP3/zIeyQiuJ/Em3+avJOd8m
	XHgYfr62BlipNxavtDOSMGZj5qaor7gWfzRztUobmmjqtqqrYJYiVpcRFLOklovAtgGqtSavj42oG
	691wiKc4mrBUSaSohx7xJsd4B0lyzWxRX+tXsqEByo/b8Ev2cEhKmikGpGRG5oiBcN418EQadPx0s
	0us4G2/CLFGqUajFlAkTGFzXDXn00GZ0+WDIkp3odAUmaTVg3Mp3KHqfBajpQ73DQU4V3kJcqkTRA
	D1VoOChw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGIfT-00AU9e-1J;
	Mon, 03 Jul 2023 12:28:35 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGIfR-00AU7V-10
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Jul 2023 12:28:34 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-991f956fb5aso411390566b.0
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Jul 2023 05:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688387309; x=1690979309;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+6M152gdY/lBTJnlZGUQ74XMgASY/+UfhDS7moIYzgc=;
        b=ueP9DH+RCuR7d/Eb3Tl6FM81FNi5B+ZGthqHlULhWOQEW4GACtYosybTXU8F1WjCOm
         XMnSL6j4JyMNQZ285JysTI7LbK1xjsBVJCKcqwmlXZa7Rtgine/lxt/vTZv2cSY9NPO7
         1t/uVFiNDaadc4l4nESKqIPgL7jdS7Sb1IXwolrrAVwGNvQXIf9kFbaJLAAuJqVnCUgc
         x9WRMCL+zGDOajscVz5gVa8x5aeakL2SgKUU0VziTk7CMSeNliAQy+3e8lcJtK0TYY//
         Wng/lEgJnOHJP020f/CQQiytbwFCAdgZcNkZUgMmdTQDD2qAy94Vk5gWAVEk2Om+VD4I
         8VOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688387309; x=1690979309;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+6M152gdY/lBTJnlZGUQ74XMgASY/+UfhDS7moIYzgc=;
        b=Wd/Bm9ZngqCVAiH8nno5oqkYbc9trf8llqoUoS7ttMLEulvBXknMHgI6j3ud+NrUSJ
         EmxTUaK1/gxuGu+JsEF2qkZafD4HPnVS9og6HaLRyz2Jt61NGkI2rJz8QB6d479xh38e
         HqyXBvQK5t0JytFGpEW4pRw9qD9FeSIElTMNeB+u8QGTfA/Iw0UokmJdGr3bsT5J/ZQl
         ROtd+3xXXQaHtpPwIUEA5dgawcaZSvFZFFHCXqzA7NHaozlj/Ahrlkm4iY8Z8XeuwM+L
         wI1VOWxvu29Y8eE7br0/e/IajbzqyEFwxIOSTe3mWVHkF5RbMVEslht9NiqOJQ/jVgU5
         /RFA==
X-Gm-Message-State: ABy/qLb0Hq8nyz72J1IPF3gUl71bK+yU7Y/EA93e3mV7o7oGAKhSCGJr
	Dvksd04GS14lqTmsHjdeZMgLvg==
X-Google-Smtp-Source: ACHHUZ5z9X4wnEecRoQBccdRRk1O19p3dtkMCjmwrIO1xJ1bN3Oa+qfbZPRY1w6NaUL14nbysKhzZg==
X-Received: by 2002:a17:906:4a91:b0:98e:26ae:9b07 with SMTP id x17-20020a1709064a9100b0098e26ae9b07mr5185183eju.35.1688387309422;
        Mon, 03 Jul 2023 05:28:29 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id x26-20020a1709064a9a00b009786ae9ed50sm11848089eju.194.2023.07.03.05.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 05:28:29 -0700 (PDT)
Message-ID: <9d0ce727-6473-e326-6b75-f8415fdb85b9@linaro.org>
Date: Mon, 3 Jul 2023 14:28:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 01/15] genirq/devres: Add error information printing
 for devm_request_threaded_irq()
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: miquel.raynal@bootlin.com, rafael@kernel.org, daniel.lezcano@linaro.org,
 amitk@kernel.org, rui.zhang@intel.com, mmayer@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, florian.fainelli@broadcom.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, thara.gopinath@gmail.com,
 heiko@sntech.de, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com,
 srinivas.pandruvada@linux.intel.com,
 DLG-Adam.Ward.opensource@dm.renesas.com, shangxiaojing@huawei.com,
 bchihi@baylibre.com, wenst@chromium.org, hayashi.kunihiko@socionext.com,
 niklas.soderlund+renesas@ragnatech.se, chi.minghao@zte.com.cn,
 johan+linaro@kernel.org, jernej.skrabec@gmail.com, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20230627101215.58798-1-frank.li@vivo.com>
 <20230627110025.vgtplc6nluiiuvoh@pengutronix.de> <87h6qpyzkd.ffs@tglx>
 <247a8166-f131-2d07-ec2b-479a4c19297f@vivo.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <247a8166-f131-2d07-ec2b-479a4c19297f@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_052833_394096_BF20BA4C 
X-CRM114-Status: GOOD (  23.00  )
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

On 03/07/2023 13:54, Yangtao Li wrote:
> Hi Krzysztof,
> 
> On 2023/6/30 19:11, Thomas Gleixner wrote:
>> On Tue, Jun 27 2023 at 13:00, Uwe Kleine-König wrote:
>>> On Tue, Jun 27, 2023 at 06:12:01PM +0800, Yangtao Li wrote:
>>>
>>> While I assume changing to dev_err_probe is a result of my concern that
>>> no error should be printed when rc=-EPROBEDEFER, my other concern that
>>> adding an error message to a generic allocation function is a bad idea
>>> still stands.
>> I agree in general, but if you actually look at the call sites of
>> devm_request_threaded_irq() then the vast majority of them print more or
>> less lousy error messages. A quick grep/sed/awk/sort/uniq revealed
>>
>>       519 messages total (there are probably more)
>>
>>       352 unique messages
>>
>>       323 unique messages after lower casing
>>
>>           Those 323 are mostly just variants of the same patterns with slight
>>           modifications in formatting and information provided.
>>
>>       186 of these messages do not deliver any useful information,
>>           e.g. "no irq", "
>>
>>       The most useful one of all is: "could request wakeup irq: %d"
>>
>> So there is certainly an argument to be made that this particular
>> function should print a well formatted and informative error message.
>>
>> It's not a general allocator like kmalloc(). It's specialized and in the
>> vast majority of cases failing to request the interrupt causes the
>> device probe to fail. So having proper and consistent information why
>> the device cannot be used _is_ useful.
>>
>> Yangtao: The way how this is attempted is not useful at all.
>>
>>      1) The changelog is word salad and provides 0 rationale
>>
>>         Also such series require a cover letter...
>>
>>      2) The dev_err() which is added is not informative at all and cannot
>>         replace actually useful error messages. It's not that hard to
>>         make it useful.
>>
>>      2) Adding the printks unconditionally first will emit two messages
>>         with different content.
>>
>>         This is not how such changes are done.
>>
>>         The proper approach is to create a wrapper function which emits
>>         the error message:
>>
>>         wrapper(....., const char *info)
>>         {
>>              ret = devm_request_threaded_irq(....);
>>              if (ret < 0) {
>>                 dev_err(dev, "Failed to request %sinterrupt %u %s %s: %d\n,
>>                         thread_fn ? "threaded " : "",
>>                         irq, devname, info ? : "", ret);
>>              }
>>              return ret;
>>         }
> 
> 
> Here.
> 
> V3 was modified according to tglx's suggestion, if there is any problem, 
> please point out.

The comment was about request_thread_irq, not about devres alloc. Don't
mix the places. Really, since when do we print any errors on ENOMEM?

Best regards,
Krzysztof


