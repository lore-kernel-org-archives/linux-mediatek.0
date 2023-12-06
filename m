Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD52C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 10:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n539aH6KJwgaK9Yc5+YnpenGy5m+hVKGBVlcyBN6r04=; b=jPBqV0QwlEPZe2sJbU1ol6FfHJ
	/W6b6JR/GiXCAqyApw4m1oyF5gXslv043Q3jULK3BXXKFzh+agfajCoakMuNOSwcc9+HX7lVskH8k
	uZADbcJz4xme1NMv/dIGU3DxSg+mrTGB0Z4ADFfEgyoyr1A9ro+Xw3eQ6p3XK9q1XvCt1jXkgh9e5
	wODRZ+NAr5gx0whsVl5ZiVLTGlk5D/9iQnshbLYqKinFyw7082txk/VVlMq3WOu3nLwX0mVMxmcXT
	HFRP1T4PBzKvJdysTP5MFruiK5FAyw/tqQorcTdKJinB38gVODFsje8JtEFLYiOmPn3HjSssfqJi9
	rbK9UIbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAojq-009csG-0O;
	Wed, 06 Dec 2023 10:02:42 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAojm-009cpl-0h;
	Wed, 06 Dec 2023 10:02:39 +0000
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 73A4166072EC;
	Wed,  6 Dec 2023 10:02:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701856952;
	bh=cr+tV0XqzVvByUwmvFvRoMfvYN0mf8oLqsTQmUgIzdI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QqSgwEI2TEj20+Ep5cFRKALAPW2dGLQ+U6+O//hmeymH+I85vaA544p42v4fUIYGq
	 kMTDOzwhdnCgN0qBdKruKDYPv5cEtZ/wsKeAU9n6p7vqnXjI0wXAidADulKD6AOpUG
	 ++lhp2UKrtuta7g1DPvnGCIsleozW5Px79utFaF1GLkYQjuwKXpfBK+LyQauseX66+
	 /Y2FfupnUpxOAnSQEA7GHWDWvXcJzC0hFTZzBg6ENhNKkqDhTNTlBifqMgGHYo2QKI
	 xBmn+cRsEul8n19Mmgk7LsBm/5G5JIG0W5sBfdxuLyqMhsgDyv0h+ZHinXRZDricCI
	 +SIkKoNwWXvew==
Message-ID: <4b9ea82c-d1a4-47b6-ba03-346cfdedef05@collabora.com>
Date: Wed, 6 Dec 2023 11:02:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 4/5] arm64: dts: mediatek: mt8173-elm-hana: Mark
 touchscreens and trackpads as fail
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Doug Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 andriy.shevchenko@linux.intel.com, Jiri Kosina <jikos@kernel.org>,
 linus.walleij@linaro.org, broonie@kernel.org, gregkh@linuxfoundation.org,
 hdegoede@redhat.com, james.clark@arm.com, james@equiv.tech,
 keescook@chromium.org, rafael@kernel.org, tglx@linutronix.de,
 Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org,
 linux-i2c@vger.kernel.org
References: <20231128084236.157152-1-wenst@chromium.org>
 <20231128084236.157152-5-wenst@chromium.org>
 <CAD=FV=W01gfxV6RN2o6CVS7jjf8qgKP-jUy9Bp94d2hWzVC48A@mail.gmail.com>
 <CAGXv+5E+R292XsOFSL-j0KJMmVJjWtxMRgCK8besP7mo6NDOWA@mail.gmail.com>
 <CAD=FV=UQkAjgMuR85cPikNtCxsODWPWs7cibOcOoNGdjSSvF8Q@mail.gmail.com>
 <3700f05f-2411-4422-972f-f3df690efb84@collabora.com>
 <CAGXv+5G5fFTv8zn=YamSdccjuYemE5oKBqjb8CSyGzu9aMJ0eg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5G5fFTv8zn=YamSdccjuYemE5oKBqjb8CSyGzu9aMJ0eg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_020238_382659_FDD8B7C9 
X-CRM114-Status: GOOD (  17.32  )
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

Il 06/12/23 03:55, Chen-Yu Tsai ha scritto:
> On Tue, Dec 5, 2023 at 6:22 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 04/12/23 17:50, Doug Anderson ha scritto:
>>> Hi,
>>>
>>> On Sun, Dec 3, 2023 at 10:59 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>>>>
>>>> On Sat, Dec 2, 2023 at 8:58 AM Doug Anderson <dianders@chromium.org> wrote:
>>>>>
>>>>> Hi,
>>>>>
>>>>> On Tue, Nov 28, 2023 at 12:45 AM Chen-Yu Tsai <wenst@chromium.org> wrote:
>>>>>>
>>>>>> @@ -44,6 +46,7 @@ trackpad2: trackpad@2c {
>>>>>>                   reg = <0x2c>;
>>>>>>                   hid-descr-addr = <0x0020>;
>>>>>>                   wakeup-source;
>>>>>> +               status = "fail-needs-probe";
>>>>>
>>>>> While doing this, you could also remove the hack where the trackpad
>>>>> IRQ pinctrl is listed under i2c4.
>>>>
>>>> Sure. I do think we can do away with it though. According to at least one
>>>> schematic, the interrupt line has pull-ups on both sides of the voltage
>>>> shifter.
>>>>
>>>> BTW, The touchscreen doesn't have pinctrl entries. This has pull-ups on
>>>> both sides of the voltage shifter as well.
>>>
>>> I dunno if the convention is different on Mediatek boards, but at
>>> least on boards I've been involved with in the past we've always put
>>> pinctrl entries just to make things explicit. This meant that we
>>> didn't rely on the firmware/bootrom/defaults to leave pulls in any
>>> particular state. ...otherwise those external pull-ups could be
>>> fighting with internal pull-downs, right?
>>>
>>
>> MediaTek boards aren't special and there's no good reason for those to rely on
>> firmware/bootrom/defaults - so there is no good reason to avoid declaring any
>> relevant pinctrl entry.
> 
> I think this should be migrated to use the proper GPIO bindings: the
> GPIO_PULL_UP / GPIO_PULL_DOWN / GPIO_BIAS_DISABLE flags.
> 
> But that's a different discussion.
> 

100% agreed.

Cheers,
Angelo


