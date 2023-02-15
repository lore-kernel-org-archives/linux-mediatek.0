Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD4FC636CC
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Feb 2023 12:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yusYi2FAiD6ZBqVjV9Pi4vjAzKiGTHpBtiT6/ae6X38=; b=RJna9Vz6M68cGPS/Rm4eQnqLlQ
	wbqellhnCLOdZvzpOdzQMhhDlB2Hv0wR4tb6pwHoxIvP8hf1/1rXBDoSEhvLBncPUoL0l+n8j+EST
	UgXoOXxiib925c2mNi53h6GjI6eRscJK1iAad53KzXJakeLNAA4EjFg6+ykmTg4JndByBlvSzIuhz
	YRDnevGRaoYOoiqAGLkM39pFN6BjmImvZ1+H21sRsh/2H+mn+PZNIWH9y2o8r0DBnU9eu/z6Yy+/J
	otgTQixLHBOOMlMSPwgWxj+gC+YdrYyUP99h34k6eTi1XLEPvR+dohIv17KSSTv6und+6QaClCgBW
	kSPB/BvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSH8J-005pEb-5O; Wed, 15 Feb 2023 12:43:35 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSH89-005pBd-1g; Wed, 15 Feb 2023 12:43:26 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D40236602181;
	Wed, 15 Feb 2023 12:43:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676465003;
	bh=S7nLX3IZonOhS+d8LFEoYzIH1ZLb+irQXxGjTuxZ/Qc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hJ0fsacMsLzm6uMaaC3kOr4xo3yAPNVADj80sx9LHvDtST9SFgCXijXdd2hSEIIyF
	 dylSHaNgnB+r/Dxe4N2HBSJjJHRI0PsD8uulRDE4db4Mj7YCWA3z/aPRCjtTDSiB6d
	 utj5G/y1Cyr/+8P09Yfo+BWu3yWxLIXXt01PgQDcC+QHoO58T/WGC/xzklAVXzw5Jn
	 ZmDg/92w8S+5kBANeZX58kPNshwkMmu5CK2xjuTsFlM9FGUgO1eCLhT77AZtVEA4Jn
	 XjZpfvZqTazeYXby39ASm+Zd7z3D6mlvu2nzjUbSwYUDP80gfFiHD8Vw/Dd3O4z/H2
	 ggdYken7G3JtQ==
Message-ID: <996b4e61-8486-d939-7367-1240b3c5c5fa@collabora.com>
Date: Wed, 15 Feb 2023 13:43:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 4/4] clocksource/drivers/timer-mediatek: Make
 timer-mediatek become loadable module
Content-Language: en-US
To: Sudeep Holla <sudeep.holla@arm.com>, walter.chang@mediatek.com
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>, John Stultz <jstultz@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 wsd_upstream@mediatek.com, stanley.chu@mediatek.com,
 Chun-hung.Wu@mediatek.com, Freddy.Hsin@mediatek.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230214105412.5856-1-walter.chang@mediatek.com>
 <20230214105412.5856-5-walter.chang@mediatek.com>
 <20230214222021.k3tsfwezhnh7tdlx@bogus>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214222021.k3tsfwezhnh7tdlx@bogus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_044325_248087_5019238B 
X-CRM114-Status: GOOD (  22.06  )
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

Il 14/02/23 23:20, Sudeep Holla ha scritto:
> On Tue, Feb 14, 2023 at 06:53:14PM +0800, walter.chang@mediatek.com wrote:
>> From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
>>
>> Make the timer-mediatek driver which can register
>> an always-on timer as tick_broadcast_device on
>> MediaTek SoCs become loadable module in GKI.
>>
>> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
>> ---
>>   drivers/clocksource/Kconfig          |  2 +-
>>   drivers/clocksource/timer-mediatek.c | 43 ++++++++++++++++++++++++++++
>>   2 files changed, 44 insertions(+), 1 deletion(-)
> 
> [...]
> 
>> diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
>> index d5b29fd03ca2..3358758ea694 100644
>> --- a/drivers/clocksource/timer-mediatek.c
>> +++ b/drivers/clocksource/timer-mediatek.c
> 
> [...]
> 
>> +static const struct of_device_id mtk_timer_match_table[] = {
>> +	{
>> +		.compatible = "mediatek,mt6577-timer",
>> +		.data = mtk_gpt_init,
>> +	},
>> +	{
>> +		.compatible = "mediatek,mt6765-timer",
>> +		.data = mtk_syst_init,
>> +	},
>> +	{
>> +		.compatible = "mediatek,mt6795-systimer",
>> +		.data = mtk_cpux_init,
>> +	},
>> +	{}
>> +};
>> +
>> +static struct platform_driver mtk_timer_driver = {
>> +	.probe = mtk_timer_probe,
>> +	.driver = {
>> +		.name = "mtk-timer",
>> +		.of_match_table = mtk_timer_match_table,
>> +	},
>> +};
>> +module_platform_driver(mtk_timer_driver);
>> +
>> +MODULE_DESCRIPTION("MediaTek Module Timer driver");
>> +MODULE_LICENSE("GPL v2");
>> +#else
>>   TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init);
>>   TIMER_OF_DECLARE(mtk_mt6765, "mediatek,mt6765-timer", mtk_syst_init);
>>   TIMER_OF_DECLARE(mtk_mt6795, "mediatek,mt6795-systimer", mtk_cpux_init);
> 
> Why do you need these ? If this driver can work as a module, it can be
> built-in module and doesn't need to be initialised early using of_timer_init
> (can't recall the exact name)
> 
> 

Some platforms need early initialization; this is seen on ones for which the
bootloader does not initialize the "CPUXGPT" timer, which is used as the ARM
arch timer. (No, on those platforms you can't upgrade the bootloader, as it's
signed with a OEM key which is not obtainable, and signature verified earlier
in the bootchain).

As a matter of fact (and somehow obvious), on those platforms (for example,
MT6795.. but many other as well, really), you *need* this driver to be
built-in and, well, initialize the CPUX timer as early as possible :-)

Regards,
Angelo


