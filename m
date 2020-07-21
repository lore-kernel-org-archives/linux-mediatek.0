Return-Path: <SRS0=w0xa=BA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46BEEC433E3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 22:09:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E9AB20717
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 22:09:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PbvEAb/w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UbYmBjCB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E9AB20717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JyYROKTSO319ZcV6gOfOPxQkPQmrj5aWpgCpO6K+c0A=; b=PbvEAb/wtcozE4XZwFjcSCasz
	GpB7aLruxLdH9hrGo0T7ZoI/n455lPLnA5BQBDSzNjjOQvV6NVC++H98LFq+JQkx4YHAbZyLkGbIO
	OHD0EedhlkdLp7FZo7tAU6CBil2UYmSzKlqowLmkkcDX2++hOoOwc48mhYpqE7A2KObOvW+p6H9CI
	bjtkC89HjjahfygC17hJ2s/kHSbq9JMQ4dPD5uG5nij4g+Z3Z/y4YG7V+EAVmLXO1UyNdkqqH1CfQ
	FpAoX4RbuvUSSHZxaQg94/UE/T9V2aIlacGYbK23J7HPvnNInLCfVnmmsw6PBi8HtpfsyrxMUqe6Y
	mt/JIvLYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy0Rk-000086-PB; Tue, 21 Jul 2020 22:09:12 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy0Rh-0008Tz-E4; Tue, 21 Jul 2020 22:09:10 +0000
Received: by mail-wm1-x342.google.com with SMTP id w3so89051wmi.4;
 Tue, 21 Jul 2020 15:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jmxp9ZjwzrYU1CbK6BbkvHp9azWbhVXBGBSwuvDU5/Q=;
 b=UbYmBjCBdVt56lbOo9uLJj4QIJ93bEJNWqYyy0Aa7BP07xdb46QT1/1hS69tOeS55S
 Y/lDYpWJrncj7JgrdrarkD8BaI28v7fMrFT8WoWmDeDgmlbG47qvkTdrZNE6phccwm2g
 OiFvnenr1w2xNP2h4Bo3JMQTdKOUic5WmGHVw7AP0bgxou9WmkssfHWWNhUXIYOEEAFp
 xM9g/GkplKSdNyKy9IG7FWHJn1kRLzwqBCPSz8abbMuVY3hFhtBRhcpu3XXfh20e9nHD
 c1scEShv0oNJGjuJlh1hXzjN63AwBsgs4VdA+sQRvf3/9zUK6fsxN1zvjye/Q0A4/DYL
 zOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jmxp9ZjwzrYU1CbK6BbkvHp9azWbhVXBGBSwuvDU5/Q=;
 b=V3BH4/9bDVnLPfYX3GGTR3lAH/iqnuLmoicXQGHprynu0hp18oWIUBumvC7TRM3DZo
 b3OCVvfeqdKK3zMc6rUD9nlXSkPCfli8dKx7zsM6/5ObU/ioV4kijFaqqEIcYZNq5+rE
 m6uCS+2fXMflQh4mG+J5AKkU4NkDFSt/RtbqEDzUW/Pnm2OBkH3xFkPKk24fNYiN7ear
 iaHgqRgigqwdfq55/zNjwhmgkcgzms5kFskjwRsGLE6TQLQvt3jthV4m6k2H7B1KbyF8
 vSUB59vdIX8sTbnR6xRY7VC+R9jr5G6UOSsc5qaQganJ0KiU7ai5Jqio/I+j4mJfTeDQ
 JTRQ==
X-Gm-Message-State: AOAM532Kc0VQJ8nvDyV+DE+EREgpOnslg7t3QLqT+95xATFJ/4G9vanq
 w73+lty7DqP6T7qwXF6QF+I=
X-Google-Smtp-Source: ABdhPJwl/nnr+jBNsRDdiUcJoX66N+yahxMmWnzmyCTxkv1EFWyNbM9CrmHt1yr/mCOJmwbNuTKUkA==
X-Received: by 2002:a7b:c4d6:: with SMTP id g22mr6095038wmk.170.1595369348208; 
 Tue, 21 Jul 2020 15:09:08 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
 by smtp.gmail.com with ESMTPSA id k126sm5110920wmf.3.2020.07.21.15.09.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 15:09:07 -0700 (PDT)
Subject: Re: [PATCH v8 6/7] arm64: dts: add dts nodes for MT6779
To: Hanks Chen <hanks.chen@mediatek.com>
References: <1594718402-20813-1-git-send-email-hanks.chen@mediatek.com>
 <1594718402-20813-7-git-send-email-hanks.chen@mediatek.com>
 <1b335463-b0af-9010-feed-c4b673ebb6c5@gmail.com>
 <1594872242.11090.8.camel@mtkswgap22>
 <742eefe1-954b-eb3f-98b7-469833df729a@gmail.com>
 <1595311242.5599.3.camel@mtkswgap22>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <1eb11f7f-603a-4aa9-92c5-1e18e6e2ce01@gmail.com>
Date: Wed, 22 Jul 2020 00:09:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1595311242.5599.3.camel@mtkswgap22>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_180909_541128_83E3F8CF 
X-CRM114-Status: GOOD (  17.42  )
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



On 21/07/2020 08:00, Hanks Chen wrote:
> On Mon, 2020-07-20 at 18:13 +0200, Matthias Brugger wrote:
>>
>> On 16/07/2020 06:04, Hanks Chen wrote:

>>>>> +		uart2: serial@11004000 {
>>>>> +			compatible = "mediatek,mt6779-uart",
>>>>> +				     "mediatek,mt6577-uart";
>>>>> +			reg = <0 0x11004000 0 0x400>;
>>>>> +			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_LOW>;
>>>>> +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART2>;
>>>>> +			clock-names = "baud", "bus";
>>>>> +			status = "disabled";
>>>>> +		};
>>>>
>>>> Devicetree describes the HW we have. As far as I know, we have 4 UARTs on
>>>> MT6779. So we should list them all here.
>>>>
>>>
>>> Actually, We have only 3 UARTs HW on MT6779, but have 4 UART clk in
>>> header file of clk.
>>
>> Correct, I got confused by the four clocks.
>> With that clarified I'm fine with the patch and will take it as soon as the
>> clock driver patch is accepted.
>>
>> Regards,
>> Matthias
>>
> Got it, I send a new serial to fix the redundant UART clk
> https://lkml.org/lkml/2020/7/21/45
> 

Ok, also I was talking about:
[PATCH v8 7/7] clk: mediatek: add UART0 clock support

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
