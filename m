Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE51C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 20:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iu4TsmsR0yr+hZlSUf3nbeWPU6VyzUbHeXgBs5JQM8I=; b=XkU9O3Yz1OW6ryGwe5a/V+fO2m
	Zpb9YYEKU+euPeEXetima9taX5UW8hOzZJjwddB0Z3DKrVuFbO1fIWO2/ckhJLMts0EQchZq1V7cx
	JzLRgzyjQk0EhBYkmDvchvdRaxcuY0oLAah0GqVKRlOwetjZaid8RvDFtaQUxFP57gBtyVcW1B5b6
	jWrnBuA5QXwstvECkSHMKrvcof5qBjbhIZyThRMt0ax3VDunycTHYETIh4tg0RrwXNeP9x/a9PM9g
	r0I8s31yW7xs4lfj4gDg55yYp8NAnptBxkEYVcwKAnbTtaymGLSa2TbDKy/qpo1CqQgVZeyHa2wMS
	cot4gKMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwSV6-00000009lHu-240g;
	Mon, 15 Apr 2024 20:00:24 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwSV0-00000009lFU-2Jod
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Apr 2024 20:00:20 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-518b9527c60so2317296e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Apr 2024 13:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713211216; x=1713816016; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iu4TsmsR0yr+hZlSUf3nbeWPU6VyzUbHeXgBs5JQM8I=;
        b=jcUcUG1lCEy432P2gkd7dE/czuHwhxF7cvBF7Qh4aZkWLFBuvX+r/+7UyjVvX85++J
         685FvYZ1ZtoDMUtnVgsT7FfPPqfaj5OSO7DsZZsvbWiJpMyZGJbL8GH/O7MpNSjbCV+g
         btzc6Tjuej39nViqqvnJgAYL65PnrMaKRVpPXcfQZZ2jRVAZWg3nMF6Ablh4qM9fhVzz
         gkdu1wobNuguvYv6zmmnCzNjeoBHHgx/+6tz6RW9NU2ORjayjRwYvzPeWR6EOSUxU8Ra
         FmXU6q9o1Z9UT0zsWNnSFUnClv9cEk09qt47jJ+4a33S2nJM7qmtsH5b9JN9ymCUzQvC
         u/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713211216; x=1713816016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iu4TsmsR0yr+hZlSUf3nbeWPU6VyzUbHeXgBs5JQM8I=;
        b=jX3VBpEN67eF3G2Zu/EPNuaJHIQmMQPilywQbWSL/TK+UPncRM6Extqs0OwtP+A/+/
         gX008dZt/KUVpYubzT2iSfdAbBJH43SFtu9QF9bMG7vf804d1WzeYJRkP5y2nVR5YSIO
         7B2kDCwaiPTPcvb9jKXJuAEpofIIyEyB4V8SdYo8Yrk2jnyeTrWCIgiXWeV8VqWtSpNB
         idJAvJ3TMcZhDVCZNA4iF89RmnHKyinq3EivQx8viEQrsswXS5eZn2vXlqYVlDUdJlTr
         qBDU+aFKk/TWERj7Xt1muzAOnrpRbnKEiMFuc6O0Z00DHLMbx1oZuYLbumaLlqI5vmUX
         GZug==
X-Forwarded-Encrypted: i=1; AJvYcCVCWfhWfcrfFGcHVk0h1knETTE4O16Lch2sCGJeo4vfp5BLTkv/TP1xl2q+fBBJ4IYAPIrf0j0UWPangyi/FQe9h1Yje+i7R6bXXq7IkIrPfgdf
X-Gm-Message-State: AOJu0YyXQ46TFEZhkvO4M+PvygdhVMC+k4ZoUS7mPQ6H6vGSk4VPCWzX
	f60cjZqpXLPNYdH2a2YE1AYcqJKIc7au/i/2L4S6sR3kxE8O+nu7dvRfH7o3wDo=
X-Google-Smtp-Source: AGHT+IEg2HPeaum23ALkOp0qFvulXUMO+CauhwOhhqKEHowUZVDqwmA6Yvnmjzgd6CxVDLPgd6HQRg==
X-Received: by 2002:a19:7409:0:b0:519:3ce:a12b with SMTP id v9-20020a197409000000b0051903cea12bmr1612742lfe.23.1713211215573;
        Mon, 15 Apr 2024 13:00:15 -0700 (PDT)
Received: from [172.30.205.18] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id g33-20020a0565123ba100b00518b0fdbf60sm706180lfv.258.2024.04.15.13.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 13:00:14 -0700 (PDT)
Message-ID: <b1462fb5-df86-45d9-9f67-697321e2b7dc@linaro.org>
Date: Mon, 15 Apr 2024 22:00:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm/arm64: dts: Drop "arm,armv8-pmuv3" compatible usage
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>, soc@kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Tsahee Zidenberg <tsahee@annapurnalabs.com>,
 Antoine Tenart <atenart@kernel.org>,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Robert Richter <rric@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, "Paul J. Murphy"
 <paul.j.murphy@intel.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Bjorn Andersson <andersson@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?=
 <afaerber@suse.de>, Heiko Stuebner <heiko@sntech.de>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Jisheng Zhang <jszhang@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-fsd@tesla.com, Michal Simek <michal.simek@amd.com>,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-realtek-soc@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20240412222857.3873079-1-robh@kernel.org>
 <Zh0vXinxy7woerJQ@hu-bjorande-lv.qualcomm.com>
 <CAA8EJpqL2T4bJZqtZ9KF=V2NLnFxUjouA6_Hu_H07DofifZaoQ@mail.gmail.com>
 <CAL_Jsq+q3OLEMT=d8=d9o1D9deKGQ5TAtZg_bgptDPQ1cWcctw@mail.gmail.com>
 <CAL_JsqKSz_WVTTi7+AgjgDzXAnAqaxXM3i2NUv93nZSpyuZK5g@mail.gmail.com>
 <CAA8EJporYZBfDoN6m0Wu2wGqq=Y+TskNCguMOHtDAz05eXS6LA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJporYZBfDoN6m0Wu2wGqq=Y+TskNCguMOHtDAz05eXS6LA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_130018_631953_B8DABEC8 
X-CRM114-Status: GOOD (  12.46  )
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



On 4/15/24 19:41, Dmitry Baryshkov wrote:
> On Mon, 15 Apr 2024 at 20:15, Rob Herring <robh@kernel.org> wrote:
>>
>> On Mon, Apr 15, 2024 at 12:05 PM Rob Herring <robh@kernel.org> wrote:
>>>
>>> On Mon, Apr 15, 2024 at 11:52 AM Dmitry Baryshkov
>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>
>>>> On Mon, 15 Apr 2024 at 16:46, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>>>>>
>>>>> On Fri, Apr 12, 2024 at 05:28:51PM -0500, Rob Herring wrote:
>>>>> [..]
>>>>>>   arch/arm64/boot/dts/qcom/qcm2290.dtsi                | 2 +-
>>>>>>   arch/arm64/boot/dts/qcom/qdu1000.dtsi                | 2 +-
>>>>>>   arch/arm64/boot/dts/qcom/sdm630.dtsi                 | 2 +-
>>>>>>   arch/arm64/boot/dts/qcom/sdx75.dtsi                  | 2 +-
>>>>>
>>>>> Acked-by: Bjorn Andersson <andersson@kernel.org>
>>>>
>>>> Note, we'd need to override PMU compatibles in sdm636.dtsi and
>>>> sdm660.dtsi. Ideally it should come as the same patch.
>>>
>>> Uh, that's an A for reuse, but an F for readability... It's sdm632 as
>>> well. Will drop sdm630.
>>
>> Actually, aren't those Kryo cores just Cortex-A53 derivatives? So the
>> A53 PMU compatible is an improvement over the generic one still. We
>> can't just add kryo260-pmu compatibles because that breaks
>> compatibility. We could have a fallback, but then that introduces a
>> pattern we don't want.
> 
> I think it is believed that Gold cores are A73-derivatives.

8xA53 on 630
4xA53+4xA73 on 636/660

Konrad

