Return-Path: <SRS0=A+tK=A7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A02DC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 16:14:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59F94206E9
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 16:14:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UOsFwcRO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bViycVFx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59F94206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y/ixu6Md4TyrcBHKOauptDY+Dau+igC1ZUUwAN6MsbY=; b=UOsFwcROw0ojTMIyERod/48s0
	flQkNEGwA+P87TzbN6batT+xMbaoulkqUDEVF8Ur7A7XK0MqpWZLLng526RQPwWF6Jpx1HwHpsMMw
	M98R7ioupE9UjDJNl5whiMHu9tUNDPT6T5FbNCn5Ge6UbkAWOnEEpTDd55VAwYOJjy9Nw2ooWiTDf
	9quPbsw+MHveo1q6yPRPYouo5qUpoMK7BjFlygeKZYBzBXFA42Gy34vDK43ugCS3byDnjNOFeO/Tb
	D3+UIi4xjhHJ0kQ3Qhbdxx6ZBR5xFWFXbGMjw8apJfUTe2Cs9EEOCUXagX9qK0u6LSHskdfCh7Di7
	C48K6gmrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxYQJ-0001Ss-H6; Mon, 20 Jul 2020 16:13:51 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxYQH-0001RP-Ay; Mon, 20 Jul 2020 16:13:50 +0000
Received: by mail-wm1-x342.google.com with SMTP id g75so70809wme.5;
 Mon, 20 Jul 2020 09:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YGGS+lJpiE0eLgk6zkqUqROfE8WRidPw66ft3m8PrAw=;
 b=bViycVFx8iriZx27qZBxJSpd3rB14eEO3Ix1ovgt1PvsYFN1OKJMePH2P6SrHpf4ED
 L5gN+i7f30DD0zUxuhUEegm1GGQ3EwDcwMSEgZt1CIiWmT/ZyY9AVWmh2uRKW8N9h1kl
 IgN/sHJdsOU4LmICiOdrzBtNL8OtD4rENHbVcbpZyMM061QrCiSlvnrNXBFibemfTjBG
 Lehc8ImZr+MWMxuxNWqx6s83kYDNJNZz3v2bDdDn+KUaz6B7//hhtwq3db8Z7wV+5eDO
 uozjqa4rTkiVyDVyf4Ays0tyfTlg06YjzGSslK3JAdFQS0KDf9aYVpUIufefWx2dIjg4
 M7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YGGS+lJpiE0eLgk6zkqUqROfE8WRidPw66ft3m8PrAw=;
 b=SpH2z2xiD4wlAokW3UUCRkkLJ8rX+r+iO/0uXQmd/v81/TRf6yQ1hlkmtObMGsRDjo
 Cv2fi8/uQKroASzi1kOM3A/QTIX5iNcHPggY2DtoZqCIKNO2AvfLYsXrk4D0N/ROnaIm
 WgcjUk7x/+Ls6X8iiPs9rwXEe/kYvF1aYIHcqdcVPqawcpda0Kxsfs1ZwLYNq6an0rQS
 1QZbCNOLkFOQUOJkypVTaOKFwkmgs5rLQhg6WD1j7+b3g+V8lA5NJElU1sIBL7lLGDW1
 T5LfMu2EdJGQas+1NvPfHrQPz77x1p1KIiHicDD7YoUx9pPKKFtZR/QIQvwQsx2EY3rd
 kRLw==
X-Gm-Message-State: AOAM533+RSxt9SY1hxcsSStEefx1vaqRmxxSS92S9dvI72T6Z78y5UjJ
 ZpuW5G1b4Eq6ZrPm9mvzO/qqvPz6gvE=
X-Google-Smtp-Source: ABdhPJw9IDtKuHVh4un4iPMF4LNiPzwqgzZ73RwATsGe8QmFlE85s3PsZxWK0uEjjI9rY0din4fQRQ==
X-Received: by 2002:a05:600c:21cb:: with SMTP id
 x11mr73928wmj.141.1595261628261; 
 Mon, 20 Jul 2020 09:13:48 -0700 (PDT)
Received: from ziggy.stardust (81.172.57.81.dyn.user.ono.com. [81.172.57.81])
 by smtp.gmail.com with ESMTPSA id
 207sm55718wme.13.2020.07.20.09.13.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2020 09:13:47 -0700 (PDT)
Subject: Re: [PATCH v8 6/7] arm64: dts: add dts nodes for MT6779
To: Hanks Chen <hanks.chen@mediatek.com>
References: <1594718402-20813-1-git-send-email-hanks.chen@mediatek.com>
 <1594718402-20813-7-git-send-email-hanks.chen@mediatek.com>
 <1b335463-b0af-9010-feed-c4b673ebb6c5@gmail.com>
 <1594872242.11090.8.camel@mtkswgap22>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <742eefe1-954b-eb3f-98b7-469833df729a@gmail.com>
Date: Mon, 20 Jul 2020 18:13:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1594872242.11090.8.camel@mtkswgap22>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_121349_418717_D6EF2717 
X-CRM114-Status: GOOD (  23.00  )
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
Cc: devicetree@vger.kernel.org, CC Hwang <cc.hwang@mediatek.com>,
 wsd_upstream@mediatek.com, Stephen Boyd <sboyd@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>,
 Sean Wang <sean.wang@kernel.org>, Loda Chou <loda.chou@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 mtk01761 <wendell.lin@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 16/07/2020 06:04, Hanks Chen wrote:
> On Tue, 2020-07-14 at 20:14 +0200, Matthias Brugger wrote:
>>
>> On 14/07/2020 11:20, Hanks Chen wrote:
>>> this adds initial MT6779 dts settings for board support,
>>> including cpu, gic, timer, ccf, pinctrl, uart, sysirq...etc.
>>>
>>> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
>>> ---
>>>    arch/arm64/boot/dts/mediatek/Makefile       |   1 +
>>>    arch/arm64/boot/dts/mediatek/mt6779-evb.dts |  31 +++
>>>    arch/arm64/boot/dts/mediatek/mt6779.dtsi    | 271 ++++++++++++++++++++
>>>    3 files changed, 303 insertions(+)
>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt6779-evb.dts
>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt6779.dtsi
>>>
>> [...]
>>> +
>>> +		uart0: serial@11002000 {
>>> +			compatible = "mediatek,mt6779-uart",
>>> +				     "mediatek,mt6577-uart";
>>> +			reg = <0 0x11002000 0 0x400>;
>>> +			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
>>> +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART0>;
>>> +			clock-names = "baud", "bus";
>>> +			status = "disabled";
>>> +		};
>>> +
>>> +		uart1: serial@11003000 {
>>> +			compatible = "mediatek,mt6779-uart",
>>> +				     "mediatek,mt6577-uart";
>>> +			reg = <0 0x11003000 0 0x400>;
>>> +			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_LOW>;
>>> +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART1>;
>>> +			clock-names = "baud", "bus";
>>> +			status = "disabled";
>>> +		};
>>> +
>>> +		uart2: serial@11004000 {
>>> +			compatible = "mediatek,mt6779-uart",
>>> +				     "mediatek,mt6577-uart";
>>> +			reg = <0 0x11004000 0 0x400>;
>>> +			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_LOW>;
>>> +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART2>;
>>> +			clock-names = "baud", "bus";
>>> +			status = "disabled";
>>> +		};
>>
>> Devicetree describes the HW we have. As far as I know, we have 4 UARTs on
>> MT6779. So we should list them all here.
>>
> 
> Actually, We have only 3 UARTs HW on MT6779, but have 4 UART clk in
> header file of clk.

Correct, I got confused by the four clocks.
With that clarified I'm fine with the patch and will take it as soon as the 
clock driver patch is accepted.

Regards,
Matthias

> CLK_INFRA_UART3 is a dummy clk interface, it has no effect on the
> operation of the read/write instruction.
> 
> If you think it is not good, I can remove it in the header file of clk.
> 
> Thanks
> 
>> Regards,
>> Matthias
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
