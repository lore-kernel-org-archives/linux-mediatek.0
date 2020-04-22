Return-Path: <SRS0=Y6KA=6G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FBEBC55181
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Apr 2020 06:18:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 417CB206CD
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Apr 2020 06:18:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BhGvJr+1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 417CB206CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2PWJr5G0OFLmipz3GqoPhc1lTQN4soJ/3pwfwxg6n5M=; b=BhGvJr+1E1Js+LOIKzpFw+9vn
	UjHt2Yto0VtnmFL40VsVTy3hJDOMFFE0U4bASwhB/cT+jq00FUcXaeBZKz3eucwOcEys78VrJ4Xwy
	7mbutf5QQZTbg41mYYKZkeqt+rurWuhA8QgxER0uKEEQOfCHFljB5oNA/xRdVAGeZAI59kvxXVj3j
	fPSnun3aoUn5fdN10RfVvsVZFGPfNQ3stB7k2bllmljE/bBtHvBapcrYkuE7+ndp8pr4l9HsQRzZz
	YZgkTlBt8hdgRoOKurUI1unZqbvN2V7qZGf0aKu44EtIteSs4lfWu3++aygH+66UjVvszhzwdU/ZX
	KmvSqxbSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jR8hj-0002U6-8h; Wed, 22 Apr 2020 06:17:52 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jR8hU-0002Km-LK; Wed, 22 Apr 2020 06:17:38 +0000
Received: from [10.28.39.241] (10.28.39.241) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Wed, 22 Apr 2020
 14:02:22 +0800
Subject: Re: [PATCH v2 2/2] watchdog: Add new arm_smc_wdt watchdog driver
To: Evan Benn <evanbenn@chromium.org>, Julius Werner <jwerner@chromium.org>
References: <20200421110520.197930-1-evanbenn@chromium.org>
 <20200421210403.v2.2.Ia92bb4d4ce84bcefeba1d00aaa1c1e919b6164ef@changeid>
 <CAODwPW9MtDLSL_up9W0TO1PcjyA_9cUtNo3No7XXusiwqKBLDw@mail.gmail.com>
 <CAKz_xw3-tvYoCDs07xEUBBMf024aezGMoZ35LsTN+_dXT9nC2Q@mail.gmail.com>
From: Xingyu Chen <xingyu.chen@amlogic.com>
Message-ID: <bbd8f97b-8479-c38e-011f-b52e2cf34403@amlogic.com>
Date: Wed, 22 Apr 2020 14:02:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAKz_xw3-tvYoCDs07xEUBBMf024aezGMoZ35LsTN+_dXT9nC2Q@mail.gmail.com>
Content-Language: en-GB
X-Originating-IP: [10.28.39.241]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_231737_192971_8370A5F3 
X-CRM114-Status: GOOD (  19.75  )
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
 Yonghui Yu <yonghui.yu@amlogic.com>, Leonard Crestez <leonard.crestez@nxp.com>,
 Will Deacon <will@kernel.org>, Xingyu Chen <xingyu.chen@amlogic.com>,
 Rob Herring <robh@kernel.org>, Anson Huang <Anson.Huang@nxp.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Guenter Roeck <linux@roeck-us.net>,
 LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Olof Johansson <olof@lixom.net>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,Evan

On 2020/4/22 9:39, Evan Benn wrote:
> On Wed, Apr 22, 2020 at 6:31 AM Julius Werner <jwerner@chromium.org> wrote:
>>
>>> +static int smcwd_call(unsigned long smc_func_id, enum smcwd_call call,
>>> +                     unsigned long arg, struct arm_smccc_res *res)
>>
>> I think you should just take a struct watchdog_device* here and do the
>> drvdata unpacking inside the function.
> 
> That makes sense, I avoided it because smcwd_call's are made during
> 'probe', ~while
> we are 'constructing' the wdd. But this is C, so I think I have
> permission to do this!
> 
>>> +static int smcwd_probe(struct platform_device *pdev)
>>> +{
>>> +       struct watchdog_device *wdd;
>>> +       int err;
>>> +       struct arm_smccc_res res;
>>> +       u32 *smc_func_id;
>>> +
>>> +       smc_func_id =
>>> +               devm_kzalloc(&pdev->dev, sizeof(*smc_func_id), GFP_KERNEL);
>>> +       if (!smc_func_id)
>>> +               return -ENOMEM;
>>
>> nit: Could save the allocation by just casting the value itself to a
>> pointer? Or is that considered too hacky?
> 
> I am not yet used to what hacks are allowed in the kernel.
> Where I learned C that would not be allowed.
> I assumed the kernel allocator has fast paths for tiny sizes though.
> 
>>> +static const struct of_device_id smcwd_dt_ids[] = {
>>> +       { .compatible = "mediatek,mt8173-smc-wdt" },
>>> +       {}
>>> +};
>>> +MODULE_DEVICE_TABLE(of, smcwd_dt_ids);
>>
>> So I'm a bit confused about this... I thought the plan was to either
>> use arm,smc-id and then there'll be no reason to put platform-specific
>> quirks into the driver, so we can just use a generic "arm,smc-wdt"
>> compatible string on all platforms; or we put individual compatible
>> strings for each platform and use them to hardcode platform-specific
>> differences (like the SMC ID) in the driver. But now you're kinda
>> doing both by making the driver code platform-independent but still
>> using a platform-specific compatible string, that doesn't seem to fit
>> together. (If the driver can be platform independent, I think it's
>> nicer to have a generic compatible string so that future platforms
>> which support the same interface don't have to land code changes in
>> order to just use the driver.)
> 
> Yes I think you are correct. I got some reviews about the compatible name,
> but I think I misinterpreted those, and arm,smc-wdt would work. I did wonder
> if Xingyu from amlogic needed to modify the driver more, EG with different
> SMCWD_enum values for the amlogic chip, he could then just add an
> amlogic compatible
> and keep our devices running with the other compatible. Although of
> course it would be nicer if
> the amlogic firmware could copy the values here.
Using DTS property(arm,smc-id) or vendor's compatible to specify the 
Function ID is available for the meson-A1.The generic "arm, smc-wdt" 
looks nicer for MTK and Amlogic sec wdt, but the driver may not cover 
the other vendor's platform-specific differences in the future, so the 
platform-specific compatible string may be introduced eventually.

But again, I can accept the two methods above.

Thanks
> 
> Thanks
> 
> Evan
> 
> .
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
