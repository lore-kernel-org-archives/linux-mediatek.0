Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2017BC4167B
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 07:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=arTRaSO7qb6afExZuPum4dyf3xlHerUlvm4TwoAJ7bo=; b=NKWwwC41Qm98NG/3VcoHx4aNoA
	O4H/ImnvhOYlCwQs9fkQMb3P3QxO0JPyobzGZLLiGyv7cuoQG3LmfU62Ff9GT72g1yMiEKIz2/HmW
	6fZR3ttzkI+2aoJjBMHl4ZOr3MhyfimYH2+xtiBKq+12mIvWYkxfg19YTLruIBwkQhSykEWQpCNOS
	oc/XkchOGZRZtp6rbzEghxKNLD2uJJ7g5x5lHAc9JX+6Q1MH+9+7lAQ08/4aou7MwpxZ176g/jxlZ
	/0l6Sz+Vy9g9F6MXcJvoqvVvdryJK0+7klQqedFzwi6iHdj30S7a2DWr6F6haRHZqQ1mOst6p8MSt
	0guC6oQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA3jf-003BiR-2i;
	Mon, 04 Dec 2023 07:51:23 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA3jc-003BhY-1j
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Dec 2023 07:51:22 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5482df11e73so5301245a12.0
        for <linux-mediatek@lists.infradead.org>; Sun, 03 Dec 2023 23:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701676278; x=1702281078; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=arTRaSO7qb6afExZuPum4dyf3xlHerUlvm4TwoAJ7bo=;
        b=CEfNfXN3o0auK6FWmzvhgk3JVVAgA3Z/3pGJ4ZowJcY+0towT6X/LpglI9mtgimxMY
         OswjsF1LP2bIzzFf1EkpLSOutiDbQ6NuT5AObAYoyYpoj5Hp99jUNwu92G/WCtG4Cp2J
         jLYq/AurcbfsNBGPrxmyMs7DvN15CU8pdLqJOCJOMAAXzR6iGxlmS8wwYZWU7MwzkPta
         +E+JPl5P1ZjPztYOiHmuTi5qqxqbrqYmgwzbCauZ1f2riaj6jW8hz2uDhUiIaJ+LAjiZ
         Emy3Dy9mN7ReUTrarwpp9//PdPATKWjgr/ZMLg3iNfALjT39S9RcKpuammon7kM/sf+X
         gf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701676278; x=1702281078;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=arTRaSO7qb6afExZuPum4dyf3xlHerUlvm4TwoAJ7bo=;
        b=fje9RjeWWv535UHamsLL0S3FlFPDX0MYq0Py2G9zL47lZP7ffYOu713ob3OO0YrmGY
         UTMqXin5pVkU2ngSmmT++KOw7k8akZNRgkPpWb5FW1FD82h8rimPMSSjv8898wu+jcoz
         P6QK358mewF4IJRSsYP6Dq0/WPQ7GIMPgH0ppsAvzB7spnCUrsJKkEp3Sm23j16gsse3
         metIb8FeEkxiAoYGPkwUWlHcBrnveQZHpx11IZDo5/ErU4wxaoSGRvWu7bNHdBvrCq2n
         l7wwvtVsVEGoixoqVAg0pdjdNeCLXz3mCmfUzVMjW4cqBwCo2blqTH1BjRW2nBhG9kMV
         Gl/w==
X-Gm-Message-State: AOJu0YyjPNooDVt8TuDqlO9RllayIQWfOHUdm23s877TQrqEEPs01dhC
	TGpOCt4lnwBWfpN3UWExyuybii/Dw6JA/zBDJCA=
X-Google-Smtp-Source: AGHT+IGU4wYxHD6TOqoPdgUQdxysOxQy4nBbwxzlUrixFStp0EoRpziwnF1+QzV7A/z4bBcuk/mp6A==
X-Received: by 2002:a17:907:3ad1:b0:a19:a1ba:8ccb with SMTP id fi17-20020a1709073ad100b00a19a1ba8ccbmr2367531ejc.105.1701676278547;
        Sun, 03 Dec 2023 23:51:18 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id p20-20020a170906229400b00a18db59797dsm4694966eja.127.2023.12.03.23.51.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Dec 2023 23:51:17 -0800 (PST)
Message-ID: <ed981149-5d96-43a9-9534-c1e52443a983@linaro.org>
Date: Mon, 4 Dec 2023 08:51:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/23] pinctrl: Convert struct group_desc to use struct
 pingroup
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 openbmc@lists.ozlabs.org, linux-mips@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Dong Aisheng
 <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>,
 Sean Wang <sean.wang@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>
References: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdZAriTP3iOgmwvoAH-3-aO_ugoEkBHE7mHH5YLxhMXSXg@mail.gmail.com>
 <b2175abe-b989-4b77-891e-67e8240ba0be@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <b2175abe-b989-4b77-891e-67e8240ba0be@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231203_235120_581220_557745A8 
X-CRM114-Status: GOOD (  12.49  )
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

On 04/12/2023 08:49, Krzysztof Kozlowski wrote:
> On 01/12/2023 15:05, Linus Walleij wrote:
>> On Wed, Nov 29, 2023 at 5:15 PM Andy Shevchenko
>> <andriy.shevchenko@linux.intel.com> wrote:
>>
>>> The struct group_desc has a lot of duplication with struct pingroup.
>>> Deduplicate that by embeddind the latter in the former and convert
>>> users.
>>>
>>> Linus, assuming everything is fine, I can push this to my tree.
>>> Or you can apply it (assumming all CIs and people are happy with
>>> the series).
>>
>> I applied the series to devel so we get some rotation in linux-next,
>> augmenting the relevant commit messages as discussed!
>>
> 
> ... and this next fails to build on standard defconfig:
> https://krzk.eu/#/builders/76/builds/420/steps/9/logs/stdio
> 
> I did not bisect yet, so I am just guessing that error looks like
> something introduced here.

One more for arm32 defconfig:
https://krzk.eu/#/builders/5/builds/2532/steps/9/logs/stdio

Best regards,
Krzysztof


