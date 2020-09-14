Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB0EFC433E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 15:27:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3ECAB20665
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 15:27:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YzuosVct";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wj09zd+L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3ECAB20665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VA6c/0sEJ6bqIHRsNI7OHatchHfJgyZfC9Lg1Voz4ng=; b=YzuosVctWt2PL6g6R/7Zj6235
	LtFJeBDZ6Q5Er4rERBGL3MWYquXbsm9kBbhn0Bknq813S6erhC46FM+YonIx8CIKATBLnSBuSd1MK
	fLAVAwjiz3tAXCh+7S+sV+IfoPpq/AeN7eD5hDfA6S/dsv8wVdBWAodT7ZSZz2W0Q866ZDWOYdxth
	kx6mjk2rs6dDuRbPv7/ywVbPwMYq3+UjnlY4G8jfmEsBBXVtNwg92KfU9cAOsaF+ScC59rqzurQ4x
	3yLHthRqb5ULUMR3lbWbUdWizMZE2TppydWHUjrdcvKwyMjXHR74gUu6srs8nrIGeV5c7T5sK27Qc
	Gt3aWvejg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHqOP-0000Ii-3j; Mon, 14 Sep 2020 15:27:45 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHqNU-0008Fk-Mb; Mon, 14 Sep 2020 15:27:06 +0000
Received: by mail-oi1-x241.google.com with SMTP id w16so308853oia.2;
 Mon, 14 Sep 2020 08:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=43Mo2cDCJQk1bbidqAAmRcOmWVTocCMpFsO0wzwgtfU=;
 b=Wj09zd+LrzMhQxCDjshlAMV6t1w7Rkdf0ywVbMErtypJg88Tnmm0ox2cL54MuraIQm
 xlQxTFS0oHj3PnDZjiAimlYycVfSSnG9TC8yH9drsLXANlVj6P1oPiRnB8mLiHR9tcpU
 gQPanlF8Hr2t05MmAJrikUq/84tyZdDW09yKQDWRuPKFTyQuwQHc3yyvpUv0CuK4REbR
 xTRBDoGQ2nCqKXv9bHgupSx8DQ1IwBX8X1SxvYFxvZyp+V44qsPhCx7HfVCJUb3H8i9q
 8pwrY1YFa/gCPBB1w+OBkjzGdZyaL+B84BcWuUh31d+1iohjVt/8n4xLzKxjGh2LprZW
 m6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=43Mo2cDCJQk1bbidqAAmRcOmWVTocCMpFsO0wzwgtfU=;
 b=b4Dz828+H4hivsBYXXLj6foytyco81W1L6Xpp/smDzr2WA5eseO3WQMFx+hYygaVx1
 CHgokwwZBqnRplk7CAviD/H2tuCFiuQiy4csxUBKr4K4UZdzBLcKbivyQXvE2uw6mnMS
 4q6mHcLinxOVi3nv1vC9E4IVsVoXqnZo349Myz8eHD0Mo+RC5thW8uUXZBAkwp79Rhgi
 WQJjto3dPhv8CZMkQgRi1WOwiuiXy480BqNPHcx/OtsMx8mehG2fCF9niGmKVXeskJ7S
 Vt4B13YI7IYA/k/dOlsoIseibEWCcYznMwk2jC0DrbyJXjwlBIuoFBUyxnsxNdasB09u
 OC3g==
X-Gm-Message-State: AOAM5307FgMV/ZwZ1olM4PrU8KO2EjXCfyYYdpMCbUsqoDueoEPLtPKN
 asZQIUOOFNnAbI5duM7QH+JayBh01ys=
X-Google-Smtp-Source: ABdhPJyrIlzIPp2/8/eTxGNpxg7QwI6VdCEtTRsuyhm8l5bxu8DpAw+V/AZ1oQpVlsIj8g77iZ0VrQ==
X-Received: by 2002:a05:6808:9a9:: with SMTP id
 e9mr9326940oig.114.1600097205618; 
 Mon, 14 Sep 2020 08:26:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 c15sm3772166oiy.13.2020.09.14.08.26.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2020 08:26:45 -0700 (PDT)
Subject: Re: [v4,0/5] watchdog: mt8192: add wdt support
To: Nicolas Boichat <drinkcat@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20200803071501.30634-1-crystal.guo@mediatek.com>
 <CANMq1KA=t8srKfC4XUqk2V2N6Jm0=-P4rQSh9Mqbo2tFFKgTEA@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <e74681e5-640c-5e5f-5daf-e22ed9b2594e@roeck-us.net>
Date: Mon, 14 Sep 2020 08:26:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CANMq1KA=t8srKfC4XUqk2V2N6Jm0=-P4rQSh9Mqbo2tFFKgTEA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_112649_339627_B0CD588E 
X-CRM114-Status: GOOD (  15.70  )
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
Cc: linux-watchdog@vger.kernel.org,
 srv_heupstream <srv_heupstream@mediatek.com>, seiya.wang@mediatek.com,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Crystal Guo <crystal.guo@mediatek.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 9/10/20 8:26 PM, Nicolas Boichat wrote:
> Matthias, Guenter,
> 
> These patches have all been reviewed (apart from fairly trivial 2/5),
> which maintainer should be picking those up?
> 

I don't see an Acked-by or Reviewed-by from a DT maintainer.
We'll have to wait for feedback from Rob.

Thanks,
Guenter

> Thanks!
> 
> On Mon, Aug 3, 2020 at 3:15 PM Crystal Guo <crystal.guo@mediatek.com> wrote:
>>
>> v4 changes:
>> revise commit messages.
>>
>> v3 changes:
>> https://patchwork.kernel.org/patch/11692731/
>> https://patchwork.kernel.org/patch/11692767/
>> https://patchwork.kernel.org/patch/11692729/
>> https://patchwork.kernel.org/patch/11692771/
>> https://patchwork.kernel.org/patch/11692733/
>>
>> Crystal Guo (5):
>>   dt-binding: mediatek: watchdog: fix the description of compatible
>>   arm64: dts: mt8183: update watchdog device node
>>   dt-binding: mediatek: mt8192: update mtk-wdt document
>>   dt-binding: mt8192: add toprgu reset-controller head file
>>   watchdog: mt8192: add wdt support
>>
>>  .../devicetree/bindings/watchdog/mtk-wdt.txt  |  5 ++--
>>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  3 +-
>>  drivers/watchdog/mtk_wdt.c                    |  6 ++++
>>  .../reset-controller/mt8192-resets.h          | 30 +++++++++++++++++++
>>  4 files changed, 40 insertions(+), 4 deletions(-)
>>  create mode 100644 include/dt-bindings/reset-controller/mt8192-resets.h
>>
>>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
