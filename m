Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A03C072A2
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Nov 2023 17:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=godpBCSFxQqlZHremxgBjkYbgRySRSrjQnKEovvSNl8=; b=aSkGeFHxk1uNV8+o/jJ+JSrxfm
	XQhS4rvgeFKJfocJIn1ZYJqriaqzkbUWcdvohUrNTKNg2e9u2ljD7MsI2tPSmZ1KbRJ4vJmRRUgTs
	fCu9XUtXvSNYEjRR7uIX4fKwcOzXP73sR5/0BqYUbTOqcEH+uBmIaglL2Pn4FlW1E6e3iJyUiH0+C
	nTn9E7hmKNb+yBy+s6sf9AwihZt0eJbF/nXfnHgx3TCyVtu6slPCqf2JsRq/fcBqk8qzx6KUKb0Q8
	1fCOdNroU6JL95V/K1OH9GUdrpsJMvNCZHZWM9+Hyyc0eRWxKa/vtooR4j8ksSAfrvzM1QaSly/HK
	Z0bm2JOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3JmR-001Rcj-24;
	Wed, 15 Nov 2023 17:34:23 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3JmO-001RbT-02;
	Wed, 15 Nov 2023 17:34:21 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c5056059e0so101201381fa.3;
        Wed, 15 Nov 2023 09:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700069644; x=1700674444; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=godpBCSFxQqlZHremxgBjkYbgRySRSrjQnKEovvSNl8=;
        b=mQp4yiDERoTcUlBalxH6FCjXLf7dk0ZmuvKwuz46alC9/JrZjGDLnG2FtUfKvutNRD
         euJg18JNxEJHHMmC/I4y7ZF98MUqq+y9L2XdcAyUiY12hy53IJf9bMoj2TlO2BeomiCT
         uvLUCovI9dectJgvcOhHNksTvr1rZgi5q8//jMsOvN++ZXzpmheJEHx5CpoBpjunKSTZ
         yDD/HL87gQ0ERzKUfcUIfx5iVynRTW5LUFhvD3SCCl8bs19X5AybW1MsgI6mhT+JEhXh
         kj0/njlkrLvSBDSTGgdUWT7c4TZKxBukgsF9mPigHNs/kjwS1Nr52QYgY+5fZWUhsuuj
         5KOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700069644; x=1700674444;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=godpBCSFxQqlZHremxgBjkYbgRySRSrjQnKEovvSNl8=;
        b=n4p2qcD2/RYL60bZIf1C+5SL9twDhkKj34zm0PVBVI7tvwCUnk+TqMp0YZuVtTN9u+
         +zgMs3o1p2pK0xRuvCorXYm1aiZA+a1B2H4tq0fdqauS3FQN+/3KbTznKCEsvT9n0But
         bsr8+GcjQl6mmXTVtNMgv7VPQDaqF65R0ktIk0DIpyY+D/jhrERh433DB+44hlGQw/F3
         PJjR533rzLouNoYjcumdbviiOYTQrjArTwK+efsz1ZeTERlMwp7Y1nLSuNLCbykRxVAE
         6KQ07CpovA53CgOXA+YcqEnPS3J2GYfCMttLrA1daEOAtqvrrNrCKahdokjXoEBfTYFK
         HI3Q==
X-Gm-Message-State: AOJu0YzaUBAFvXDwtJajuQSkQZcxjlBQlrtIHg5kEZUCAYPVzAg7lzeI
	FZ/zbNIwUNJD1+3G9tJA0qChgW0icHE=
X-Google-Smtp-Source: AGHT+IGtmWmLQ9lGrvFvey302BpNZiBUBADZO/8kKO9CeuUMeNQ+ecrsA4FeJsOmdULRyPbxZPF0uw==
X-Received: by 2002:a2e:9b48:0:b0:2c2:9872:dfc1 with SMTP id o8-20020a2e9b48000000b002c29872dfc1mr4795177ljj.42.1700069643684;
        Wed, 15 Nov 2023 09:34:03 -0800 (PST)
Received: from [192.168.0.92] ([178.233.24.52])
        by smtp.gmail.com with ESMTPSA id p1-20020a5d68c1000000b0032fab28e9c9sm11119787wrw.73.2023.11.15.09.34.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 09:34:03 -0800 (PST)
Message-ID: <04fe725d-c6c9-4db7-9ebe-ce6ea3511844@gmail.com>
Date: Wed, 15 Nov 2023 20:34:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clock: mediatek: mt8173: Handle unallocated infracfg
 clock data
Content-Language: en-US, tr, en-GB
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Chen-Yu Tsai <wenst@chromium.org>, linux-arm-kernel@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231108213734.140707-1-alpernebiyasak@gmail.com>
 <3b6c474f-669d-4c6e-8d56-ea65958a3b48@collabora.com>
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
In-Reply-To: <3b6c474f-669d-4c6e-8d56-ea65958a3b48@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_093420_075744_88E1B3C2 
X-CRM114-Status: GOOD (  38.03  )
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

Hi,

Sorry with the late reply. I am trying to get things enabled in Debian
for MT8173 and MT8183 Chromebooks, and needed to post this so I can
refer to this there [1]. Then I worked on things related to that, hence
the delay. Replying here mostly because I wanted to tell you as you
might be interested -- although I do have some module probe ordering
problems that could use some insight...

[1] https://salsa.debian.org/kernel-team/linux/-/merge_requests/906

On 2023-11-09 12:05 +03:00, AngeloGioacchino Del Regno wrote:
> Il 08/11/23 22:33, Alper Nebi Yasak ha scritto:
>> The MT8173 infracfg clock driver does initialization in two steps, via a
>> CLK_OF_DECLARE_DRIVER declaration. However its early init function
>> doesn't get to run when it's built as a module, presumably since it's
>> not loaded by the time it would have been called by of_clk_init(). This
>> causes its second-step probe() to return -ENOMEM when trying to register
>> clocks, as the necessary clock_data struct isn't initialized by the
>> first step.
>>
>> MT2701 and MT6797 clock drivers also use this mechanism, but they try to
>> allocate the necessary clock_data structure if missing in the second
>> step. Mimic that for the MT8173 infracfg clock as well to make it work
>> as a module.
>>
>> Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
>> ---
>> I've tried adding cpumux support to clk-mtk.c then switching this over
>> to simple probe functions and it appears to work for me, though I don't
>> know clock systems enough to recognize if it's subtly broken instead.
>> That'd remove this piece of code, but this might still be worth applying
>> to backport to stable kernels.
>>
>> If I'm reading things correctly, it looks like it would be possible to
>> add cpumux & pll & pllfh support to clk-mtk.c, then move most if not
>> every driver to simple probe, with one file per clock and module
>> support. How much of that is desirable? In what order do the parts need
>> to be registered?
> 
> Thing is, if (!infra_clk_data) at infracfg_probe time, then INFRA_CLK_13M==-ENOENT!
> If you do this, you should at least also send a devicetree commit that adds
> 
> 	clk13m: fixed-factor-clock-13m {
> 		compatible = "fixed-factor-clock";
> 		#clock-cells = <0>;
> 		clocks = <&clk26m>;
> 		clock-div = <2>;
> 		clock-mult = <1>;
> 		clock-output-names = "clk13m";
> 	};
> 
> ....otherwise this solution is incomplete! ;-)

I'm seeing similar blocks added for other SoCs and tried to match what
they did, hoping it's correct for MT8173 as well.

> Regarding the CPUMUX support, when I've restructured the MediaTek clocks, I've also
> been thinking about doing this, but decided not to do it because that'd be a check
> done on ~10 clock drivers per SoC, of which only one is expected to succeed... I
> see that as a waste of cycles at boot...
> 
> ...but if anyone thinks otherwise, I'm fine with it...

Thanks for making it possible to use them as modules, I appreciate it!
It does look like a maintainability vs performance trade off, and I
don't know enough about performance profiling to say it doesn't matter here.

> Anyway.
> 
> Can you please fix the commit title to be consistent with the others and send a v2?
> 
> In this case, that would be
> "clk: mediatek: mt8173-infracfg: Handle unallocated infracfg when module"

Heh, I'm having trouble with titles recently. Sent a v2 just now, with a
second patch for device-tree.

> P.S.: Good job!
> 
> Cheers,
> Angelo
> 
>>   drivers/clk/mediatek/clk-mt8173-infracfg.c | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/mediatek/clk-mt8173-infracfg.c b/drivers/clk/mediatek/clk-mt8173-infracfg.c
>> index 2f2f074e231a..ecc8b0063ea5 100644
>> --- a/drivers/clk/mediatek/clk-mt8173-infracfg.c
>> +++ b/drivers/clk/mediatek/clk-mt8173-infracfg.c
>> @@ -98,7 +98,17 @@ CLK_OF_DECLARE_DRIVER(mtk_infrasys, "mediatek,mt8173-infracfg",
>>   static int clk_mt8173_infracfg_probe(struct platform_device *pdev)
>>   {
>>   	struct device_node *node = pdev->dev.of_node;
>> -	int r;
>> +	int r, i;
>> +
>> +	if (!infra_clk_data) {
>> +		infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
>> +		if (!infra_clk_data)
>> +			return -ENOMEM;
>> +	} else {
>> +		for (i = 0; i < CLK_INFRA_NR_CLK; i++)
>> +			if (infra_clk_data->hws[i] == ERR_PTR(-EPROBE_DEFER))
>> +				infra_clk_data->hws[i] = ERR_PTR(-ENOENT);
>> +	}
>>   
>>   	r = mtk_clk_register_gates(&pdev->dev, node, infra_gates,
>>   				   ARRAY_SIZE(infra_gates), infra_clk_data);
>>
>> base-commit: 2220f68f4504aa1ccce0fac721ccdb301e9da32f

