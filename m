Return-Path: <SRS0=Y6KA=6G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB71C54FCB
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Apr 2020 03:23:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B12C4206F4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Apr 2020 03:23:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CSPzFmrn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CJlF4wJO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B12C4206F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PIQB0H84vSP4+22IDmEVL/JA2pfdc8ZE0JxOA1I/KRw=; b=CSPzFmrnZRe9Kz
	jFBDWDGTpI/ZEsPJU+Zt+RkUnrxynPYXJYgt+2Q/Ip5MMTCdW69R/a3CvIIc/KtkCDTaVV58kN1Zn
	Fcxrpk5oANijbYMduTqKT0PFC3tO9kLklRccIvHib7EDeSytlIZwTvGqtTPau/zhXdhkJB0sj/9Fh
	KAfJm5ph+gwrrdsnfW8ENk5UDCRLfVlbXSYJ2DwMOs2Oi/4OLCry7AkGWTT1D+OAzDPdBbxsFy/Is
	MkHCg3DiZUT9NyWbKutw/wH3sJJh6he9yVqNPds0Hch+aeZ62r89cP0NGXVbaQm6u3sUTw5CM8mWi
	gOYNQk61kMC6hDcjHJAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jR5z1-0007gP-4c; Wed, 22 Apr 2020 03:23:31 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jR5yx-0007ft-5t; Wed, 22 Apr 2020 03:23:29 +0000
Received: by mail-pg1-x543.google.com with SMTP id n16so382239pgb.7;
 Tue, 21 Apr 2020 20:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HPFpz21JuDXUPFU+5CkFUTKdUzagbUbfsrfVpNgHypY=;
 b=CJlF4wJOme+r6e61VQ+j97yb8EywOUssW8ux5Pzjw5i5q+lctQA0K3TTTFU/YPxrye
 5/1jcUKom3o7FLcazdpeV0xeXppwFP+ASabaauWNkm6RYAMHoVUTexILCxX/Ee9DqU/7
 6WxHn4jNcVnGglzYmY4PxTCrwu/+vB96suazQLHuCGQOrGLchkQM30Ftw8B0wJkyZcLS
 H+8JpBDoIhixOCIE28eMpGWT5FRJyMfHTRZVYBfjbmry4ahWuf2YBPXa9/HwlPwLG2Nc
 nxiTqbK2PTH0ETJyVv6xRUuKFxo2HaShKs29WQZhOuOmhHS78rrAH5rZw/6QHyjNTvLM
 xt+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=HPFpz21JuDXUPFU+5CkFUTKdUzagbUbfsrfVpNgHypY=;
 b=uK6X+FpjRQD43n1uQZeWuQlC5B8z+nV+p5ieudJhoMnWZkbVPDi/+qXbEl+2IH2ujt
 lK3CS7HqhzlEpUx5WHvPLdGY2/QnH8FolSA58grZgoUOADeDCykXt4ZpCYBaEBzaPsxz
 zTsXSyRNt9uX1aanMT4eUIkSCEhwZcz+s6mJeFkgwCViVzwWfCgT3lCiTrXYb7mrZYaa
 kK2ER2obj05JRHIG247SiPpjEqOFvBmD8ncw7t9Cm9K78GJb2WU1c0z0/bhrEMYsvC6g
 5WFIgS8P5SyxnYx6sF9dYnfyk1YtPZ+YdbVplSsliWcdXLdlhzdXptgT40BFurBGIMPi
 ByIA==
X-Gm-Message-State: AGi0Puas48bguhmhHCKo4ViUsGBf5kxi5q3G20deVbgbd7Bi/Q1k9Atk
 fnRkzgA57qW+5hHvZIcFaSo=
X-Google-Smtp-Source: APiQypKZ1UETfezXnPsNQGhXgPN+D/pchmvoIp1U7gUDRE24xZJKWYXoyn/pnZO2kb2KiIxId1+A3Q==
X-Received: by 2002:a63:e607:: with SMTP id g7mr23935131pgh.303.1587525805347; 
 Tue, 21 Apr 2020 20:23:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 185sm3943742pfv.9.2020.04.21.20.23.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2020 20:23:24 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] watchdog: Add new arm_smc_wdt watchdog driver
To: Julius Werner <jwerner@chromium.org>, Evan Benn <evanbenn@chromium.org>
References: <20200421110520.197930-1-evanbenn@chromium.org>
 <20200421210403.v2.2.Ia92bb4d4ce84bcefeba1d00aaa1c1e919b6164ef@changeid>
 <CAODwPW9MtDLSL_up9W0TO1PcjyA_9cUtNo3No7XXusiwqKBLDw@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <e382a9fe-9909-5d07-4b71-efe80cb35e4c@roeck-us.net>
Date: Tue, 21 Apr 2020 20:23:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAODwPW9MtDLSL_up9W0TO1PcjyA_9cUtNo3No7XXusiwqKBLDw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_202327_222953_C7F7A234 
X-CRM114-Status: GOOD (  20.16  )
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Leonard Crestez <leonard.crestez@nxp.com>, Will Deacon <will@kernel.org>,
 Xingyu Chen <xingyu.chen@amlogic.com>, Rob Herring <robh@kernel.org>,
 Anson Huang <Anson.Huang@nxp.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Valentin Schneider <valentin.schneider@arm.com>,
 LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Olof Johansson <olof@lixom.net>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 4/21/20 1:31 PM, Julius Werner wrote:
>> +static int smcwd_call(unsigned long smc_func_id, enum smcwd_call call,
>> +                     unsigned long arg, struct arm_smccc_res *res)
> 
> I think you should just take a struct watchdog_device* here and do the
> drvdata unpacking inside the function.
> 
>> +static int smcwd_probe(struct platform_device *pdev)
>> +{
>> +       struct watchdog_device *wdd;
>> +       int err;
>> +       struct arm_smccc_res res;
>> +       u32 *smc_func_id;
>> +
>> +       smc_func_id =
>> +               devm_kzalloc(&pdev->dev, sizeof(*smc_func_id), GFP_KERNEL);
>> +       if (!smc_func_id)
>> +               return -ENOMEM;
> 
> nit: Could save the allocation by just casting the value itself to a
> pointer? Or is that considered too hacky?
> 

Actually, the current code is what is hacky. I'd either do
what you suggest, or allocate a structure such as

struct local_data {
	u32 smc_func_id;
	struct watchdog_device wdd;
};

and use it accordingly.

Guenter

>> +static const struct of_device_id smcwd_dt_ids[] = {
>> +       { .compatible = "mediatek,mt8173-smc-wdt" },
>> +       {}
>> +};
>> +MODULE_DEVICE_TABLE(of, smcwd_dt_ids);
> 
> So I'm a bit confused about this... I thought the plan was to either
> use arm,smc-id and then there'll be no reason to put platform-specific
> quirks into the driver, so we can just use a generic "arm,smc-wdt"
> compatible string on all platforms; or we put individual compatible
> strings for each platform and use them to hardcode platform-specific
> differences (like the SMC ID) in the driver. But now you're kinda
> doing both by making the driver code platform-independent but still
> using a platform-specific compatible string, that doesn't seem to fit
> together. (If the driver can be platform independent, I think it's
> nicer to have a generic compatible string so that future platforms
> which support the same interface don't have to land code changes in
> order to just use the driver.)
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
