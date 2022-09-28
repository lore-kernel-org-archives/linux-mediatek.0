Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79EBCC32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 17:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=szYRUNTBzhtYD1dEwWP+61BLschhE4HnOh0yg58NYWc=; b=Zf2PonjTI0d7FLegWOomXPG9/i
	QuLEZmrkB7Qao8iol37izz/oe0tfsZAXgMvyhWdTf0jVC4UG/Qpe9liRU931r+DyHC8bfwmMMDG/m
	nMV7adBL118YcTNyEX6agD1RULGEW3Mcnjia379vM0qFOQOkLoQcnPZxl+AKxF9HKcBGuuAyIP7nb
	mPrpUetjYIu7+PoAXw4vlEHmILh3TU1j9v+HnttLFyXyeIOgFPu2+qnO7/B6THPUtre0TmbxL4XpE
	OoUFc13Kth774nRATC4Xlnh8n9k7RAxdJc/ArR5QXPXjo+eNKAizdn2e+wLcz195qz0FvEC+1s5iJ
	WJjm5LgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odbCk-00HSPa-6b; Wed, 28 Sep 2022 17:50:42 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odbCg-00HSMt-Gz
	for linux-mediatek@lists.infradead.org; Wed, 28 Sep 2022 17:50:40 +0000
Received: by mail-lf1-x135.google.com with SMTP id u18so21462650lfo.8
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Sep 2022 10:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=szYRUNTBzhtYD1dEwWP+61BLschhE4HnOh0yg58NYWc=;
        b=mC7G9bQo9HU0f6epli3GndKdWBSE8mKRNHsJbfkCwBZ7Ul8WpsecgIkm8+ZNy2E/dR
         0HrdfJS1VZjm0/7ynVDeqMsQDJoQ0ZAurec+DhV40EWxROgQOG8HPTt0UiF2d9aKQ0BM
         RwsL+gAlJ2kLN4JFQeKYkymK3z6xGwiVXeqOR84hVPaDIndoofLqwt3rOjJSl8pvKcJD
         1LdIdHyU9WzWpBu7lSWCaRpFh7TB+qx+LC+nG8sbqQ+tsDoGCqE0nfUk+up8twztsbjb
         hyKGsUKPSG37/aORpxP1YRncPExyozhskt2hNplrHLzoQpVJGBi4FDXYrClymntdLOCk
         mj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=szYRUNTBzhtYD1dEwWP+61BLschhE4HnOh0yg58NYWc=;
        b=Yt4nb8+lMiDWVgOiwp3pyGwjoPDIIpUFiwkQSLDz/DRGScONHP3AYccmp+GNkDfmT6
         VQ4UglxCpPcNdLbn5YWjAuqwt7o1/WHVZzoy/ztsVu5yCfUGLNzMVR6o8gfY6mhAfoOc
         RQrIHIX+l7XYr76KCaNI2QRXsiIeSBzS0NAvGnAfMtS6oMuXf44XtAF502wj1TmpeORM
         du4pXZyzqg1QYYZ2F1yKr1qhG02E2jSKxXX97qfq58Zf8+M8TzA5mPe11/VnJ0cZGEgK
         BOZMElPYxXnYUGrfdj5iG1kDStZgNdeEri+TFpKHFQBBywbipiSj73x+coZqWPbzOnuA
         4Iag==
X-Gm-Message-State: ACrzQf31pLx+Dpd3OaG1xjOyU9mNxtBmwi0X1l6Vy5xaiAWc8lqr17U1
	L6hCTeANaBCO8MyHI7wE9v9jLw==
X-Google-Smtp-Source: AMsMyM5rxIZDytENB8AHhahxxOtrIFCEJdUiYcgZbpXU+ZEkOnoiYOmcLtFg6ddHKwNiFLOfdB0k8A==
X-Received: by 2002:a05:6512:1056:b0:498:efaf:5bd1 with SMTP id c22-20020a056512105600b00498efaf5bd1mr13304252lfb.64.1664387434846;
        Wed, 28 Sep 2022 10:50:34 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x25-20020a056512131900b00498ebd60c35sm532566lfu.165.2022.09.28.10.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 10:50:34 -0700 (PDT)
Message-ID: <dfb09b81-43e0-2fec-47f8-f341dea15f04@linaro.org>
Date: Wed, 28 Sep 2022 19:50:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v3 02/11] dt-bindings: remoteproc: mediatek: Support
 MT8195 dual-core SCP
Content-Language: en-US
To: =?UTF-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= <TingHan.Shen@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 =?UTF-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 =?UTF-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
 "peng.fan@oss.nxp.com" <peng.fan@oss.nxp.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "andersson@kernel.org" <andersson@kernel.org>,
 =?UTF-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
 <Andrew-CT.Chen@mediatek.com>,
 "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20220927025606.26673-1-tinghan.shen@mediatek.com>
 <20220927025606.26673-3-tinghan.shen@mediatek.com>
 <08abade9-f6f5-77cf-b83d-739b0b81543a@oss.nxp.com>
 <d16002714baf1eccb9b0ef5a2ae60e9b25194701.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d16002714baf1eccb9b0ef5a2ae60e9b25194701.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_105038_616392_5000536D 
X-CRM114-Status: GOOD (  14.67  )
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

On 28/09/2022 11:17, TingHan Shen (沈廷翰) wrote:
> On Wed, 2022-09-28 at 15:01 +0800, Peng Fan wrote:
>>
>> On 9/27/2022 10:55 AM, Tinghan Shen wrote:
>>> The MT8195 SCP is a dual-core RISC-V MCU. Extend the yaml file
>>> to describe the 2nd core as a subnode of the boot core.
>>>
>>> The configuration register is shared by MT8195 SCP core 0
>>> and core 1. The core 1 can retrieve the information of configuration
>>> registers from parent node.
>>
>> I think the commit message would not convince people you put
>> scp 1 as subnode of scp 0.
>>
>> Regards,
>> Peng.
>>
> Hi Peng,
> 
> Thanks for your review. I should give the most reasonable explanation
> for why SCP 1 is a subnode.
> 
> Adding SCP 1 as a subnode helps to assure finish probing SCP 1
> before starting SCP 0 by using of_platform_populate. It's because
> that I want to probe SCP 1 as a remoteproc subdevice of SCP 0.
> such that when SCP 0 crashed, SCP 0 can reboot SCP 1.

As Peng noted, this is not proper description of hardware. The SCP 0/1
do not have parent-child relationship, so do not model it that way in
Devicetree.

Probe ordering is operating system specific, not related to bindings.

Best regards,
Krzysztof


