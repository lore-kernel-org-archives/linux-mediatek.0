Return-Path: <SRS0=Y6KA=6G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15A70C2BA19
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Apr 2020 01:40:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D933B20724
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Apr 2020 01:40:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sjJ72ADC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EQfvQRYk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D933B20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UqfSxA2hcZ3zPGF4KFDLz+kqKdxACguFPraIs++rl/4=; b=sjJ72ADCUS2Kx6
	aQ78W+JKMGPfk8XBBcSWFYwfCe/KhHQq5PP3XW5fj9N+IvF3FhJGYjYAphUtjYhk4Njltzxxg5nSH
	8rPBERqSgyF/GJgexX6TKTSgh1foAg6OL77lxF5tZNBEDPFx4QUWd7X53ZAR9PJOEJYFVMJiy+7WR
	DYMe1ZHRP2N7Crym/0cdEOqWN9LzaSWNztkAZKG/FIwPtzlayjLVMyuKvqAzQ+XVFH3sRNMD0aZIM
	ICU6DTja/xfSLDjkXZAwvGhWWUbE1St3IUrOUVCkCr9kLAw14BBiBRWHW4YUzcvV3Piqds85MbQmA
	JE3we//pxhCD4g1aVgVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jR4ND-0004eu-CR; Wed, 22 Apr 2020 01:40:23 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jR4N6-0004Zd-IC
 for linux-mediatek@lists.infradead.org; Wed, 22 Apr 2020 01:40:17 +0000
Received: by mail-pj1-x1044.google.com with SMTP id 7so1848646pjo.0
 for <linux-mediatek@lists.infradead.org>; Tue, 21 Apr 2020 18:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fCEr6pXIIH8a6wvkqNzUF108BpUBYKo9yQQ8CIUa6jU=;
 b=EQfvQRYkh1XrsrAz+l9+x0k+vOSp/UM4fgbCnYQ64D1Dq8B1FWcLG+ca/ZEvrLDjeK
 Lh2aJ9ttT5kKR1+EZokWVRzp6P4jAQiExqYM9Uq7+iSd8vkAer6L1ObRJBmwUbr+Saq+
 DKZprigLH+OXKegSJ60ezTDhpCv/UN11QS9qQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fCEr6pXIIH8a6wvkqNzUF108BpUBYKo9yQQ8CIUa6jU=;
 b=j68dawYkfXXACRmCaPrvDYDR22pHp69hhLTY3/X5aGPxNPcMu8lpQ8rQ2EE5AHubcc
 ftaNfJEQ/FM2W3c49um6sGDnS995P4FFShqOEX6prUujs1NvBVKqh22wLzsM0X0CkscX
 RdNvRFcP913BtSvA49sp5eUED1ue+7vC2ufIO1S9tq3DAefkL8hbqeys642JZhdV7oku
 kTSOWyS51RZVlP10Pmvnx0oKYnbGVG7wtrMJ578C5JEC++MW0e4K1t5DSfDYUbztpnyH
 MXZVBwnBeZdPFQLX6BcZtGdxtYBnEIZ7fUPa2EO5Px1qtL4Qckxd+E4GfmHMGiRH69pc
 gHAg==
X-Gm-Message-State: AGi0Pub50CRSD5WjVRm67dY64oWrWrI6hF5dNLgqHxxnfXSr3jjaAyMd
 0BM1ZbQwvkqhYGBWUjM1pP2MYoxFJak=
X-Google-Smtp-Source: APiQypKYpj2w3PJvyRMhd7REA2wKUAaTdyGZi/x1CEVsL6LuylBYYnCJo4kIMvescGHUJwz8/B254w==
X-Received: by 2002:a17:90a:630b:: with SMTP id
 e11mr8626466pjj.167.1587519614899; 
 Tue, 21 Apr 2020 18:40:14 -0700 (PDT)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com.
 [209.85.214.175])
 by smtp.gmail.com with ESMTPSA id a138sm3709006pfd.32.2020.04.21.18.40.13
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2020 18:40:14 -0700 (PDT)
Received: by mail-pl1-f175.google.com with SMTP id f8so270508plt.2
 for <linux-mediatek@lists.infradead.org>; Tue, 21 Apr 2020 18:40:13 -0700 (PDT)
X-Received: by 2002:a67:907:: with SMTP id 7mr17409548vsj.42.1587519611840;
 Tue, 21 Apr 2020 18:40:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200421110520.197930-1-evanbenn@chromium.org>
 <20200421210403.v2.2.Ia92bb4d4ce84bcefeba1d00aaa1c1e919b6164ef@changeid>
 <CAODwPW9MtDLSL_up9W0TO1PcjyA_9cUtNo3No7XXusiwqKBLDw@mail.gmail.com>
In-Reply-To: <CAODwPW9MtDLSL_up9W0TO1PcjyA_9cUtNo3No7XXusiwqKBLDw@mail.gmail.com>
From: Evan Benn <evanbenn@chromium.org>
Date: Wed, 22 Apr 2020 11:39:44 +1000
X-Gmail-Original-Message-ID: <CAKz_xw3-tvYoCDs07xEUBBMf024aezGMoZ35LsTN+_dXT9nC2Q@mail.gmail.com>
Message-ID: <CAKz_xw3-tvYoCDs07xEUBBMf024aezGMoZ35LsTN+_dXT9nC2Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] watchdog: Add new arm_smc_wdt watchdog driver
To: Julius Werner <jwerner@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_184016_629737_9F21C087 
X-CRM114-Status: GOOD (  21.72  )
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
 Guenter Roeck <linux@roeck-us.net>,
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

On Wed, Apr 22, 2020 at 6:31 AM Julius Werner <jwerner@chromium.org> wrote:
>
> > +static int smcwd_call(unsigned long smc_func_id, enum smcwd_call call,
> > +                     unsigned long arg, struct arm_smccc_res *res)
>
> I think you should just take a struct watchdog_device* here and do the
> drvdata unpacking inside the function.

That makes sense, I avoided it because smcwd_call's are made during
'probe', ~while
we are 'constructing' the wdd. But this is C, so I think I have
permission to do this!

> > +static int smcwd_probe(struct platform_device *pdev)
> > +{
> > +       struct watchdog_device *wdd;
> > +       int err;
> > +       struct arm_smccc_res res;
> > +       u32 *smc_func_id;
> > +
> > +       smc_func_id =
> > +               devm_kzalloc(&pdev->dev, sizeof(*smc_func_id), GFP_KERNEL);
> > +       if (!smc_func_id)
> > +               return -ENOMEM;
>
> nit: Could save the allocation by just casting the value itself to a
> pointer? Or is that considered too hacky?

I am not yet used to what hacks are allowed in the kernel.
Where I learned C that would not be allowed.
I assumed the kernel allocator has fast paths for tiny sizes though.

> > +static const struct of_device_id smcwd_dt_ids[] = {
> > +       { .compatible = "mediatek,mt8173-smc-wdt" },
> > +       {}
> > +};
> > +MODULE_DEVICE_TABLE(of, smcwd_dt_ids);
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

Yes I think you are correct. I got some reviews about the compatible name,
but I think I misinterpreted those, and arm,smc-wdt would work. I did wonder
if Xingyu from amlogic needed to modify the driver more, EG with different
SMCWD_enum values for the amlogic chip, he could then just add an
amlogic compatible
and keep our devices running with the other compatible. Although of
course it would be nicer if
the amlogic firmware could copy the values here.

Thanks

Evan

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
