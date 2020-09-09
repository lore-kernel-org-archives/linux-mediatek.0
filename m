Return-Path: <SRS0=qDs2=CS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98199C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 08:26:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41BF821532
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 08:26:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uOvpXgfa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPnzPnO4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41BF821532
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tZCG6VyykDhm8w2XR/YJeDARoJFsTPmIqTGTd9S3BFA=; b=uOvpXgfa2WSHr6vk2F2eVLDdk
	PTwgZv+E/VgOZUXPTziuvGPiXNqkTJIa99i0Y81l396YZ/nKWHBwZLoiPUaWmTM4fmSQ52gOS2DcZ
	kHJ1px7YZ44F10N6O3M3/AwIHGgQlPq/zeFh5Yrt374sQNhADG/wgurQzIOvBzZ6p87NF5tQZCBoW
	Yz/CeLvNju0Tatf9YeJImrQwBAcQr1YFvebz7Q4sTPePC53VXwfryfqKg57ncnh2G+WprmHwJHCW9
	x/CbMaALMaxQ7Pj2e/xl6zN/KT4z9L7+JHLVLCt96LLyo82VchxvgYGIrRFPUq43ZC8GsY7ihG7nn
	KoH3QqOQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFvQs-0004xB-SG; Wed, 09 Sep 2020 08:26:22 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFvQq-0004wL-Ih; Wed, 09 Sep 2020 08:26:21 +0000
Received: by mail-wm1-x342.google.com with SMTP id c19so1286546wmd.1;
 Wed, 09 Sep 2020 01:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0tser96rfwYDofy0EPeasgbVCZPbEY4uhvx+UNJk7TY=;
 b=BPnzPnO4oojkbPwwQ+0Z61XoMwy6xYQQjtqbkQFAMBZZi0u2dYGWUYuTuhCQDBnylT
 pxRTHvu/EFFhd/QFpWTxRI/iQkaI7wvBE6NqGmbAJQl6jzPAdc+YZevHGIB4vQy1UTP2
 kFhNq2lvB61ZSBHEtCsg6fWNkQUYp1VTsHfgy4NAEgUNhICBJmxpVlAmVPXrRdKJP8lQ
 pDv/AgNWCr5FQfsegNeWRO3S2jATIcW4F21Z4J4AV85E/oe0Hw5X4BjFZy1daUaXkyQs
 z7B+/v4LZEoAQ93xKVCYVlduyJcBC+iVMJ8LdP66/9/azKhj/0/qrQZL7MwM0R5jrgh5
 QMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0tser96rfwYDofy0EPeasgbVCZPbEY4uhvx+UNJk7TY=;
 b=poOFTQDZ6qTixWserR64txEv/xNWhDM4uXkqJCIVhoFuPbMmUqj/vDc2vhnPhNrvTB
 G3zR+4WATkf9c5hSHyysH2EKJRZ9ThibQBi9vnz5nzrl1fgFxNVFhIW6+1PnT/K2ChFE
 lFfN+k6EagFGM0Ryvamto8KNk2fU+5yUFQ++J3HOM9U34jju3YXLPFP23o4WY2m/dZow
 BAUNeUCpVrOFaNmdqOK8nX4bgKXSHmi6b73YK6+wJ+HFA+3R00TOk0e05mvkJPZT2gvJ
 o0XUSDQziRNMuDzyIBR1GaINGbrPBZurbH1SsBj2kvMs/hnJtqt5DG974LOZmca9766T
 +yJA==
X-Gm-Message-State: AOAM530c4/90mzO/Gl8lNZbwwBcer0+Br0u2GPF4o1z2Q4a0m5OTQioj
 x3g8l6YYLHeuo655VkhE3+w=
X-Google-Smtp-Source: ABdhPJyraZ15izydbCG6UBgB4j4rhsVZ2DuZgUSzsoM3JvzdEpsWBZA+CaCVMh9UKb9tgibKOdkJtQ==
X-Received: by 2002:a1c:dec2:: with SMTP id v185mr2357481wmg.1.1599639978820; 
 Wed, 09 Sep 2020 01:26:18 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id o128sm2672667wmo.39.2020.09.09.01.26.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2020 01:26:18 -0700 (PDT)
Subject: Re: [PATCH v21 4/4] arm64: dts: mt8183: add scp node
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>
References: <20191112110330.179649-1-pihsun@chromium.org>
 <20191112110330.179649-5-pihsun@chromium.org>
 <2abf8fdd-7b7c-73b0-beea-9c9ac56869dc@gmail.com>
 <CA+G9fYt9AujG6gyfeV5AaAv0EgggUfGT1jow8DJjVfetVWV3EA@mail.gmail.com>
 <CAJKOXPeV9zCg4v0kBfToGdJSxswbKtT16LVYADALpYRHqWXBOg@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <ced30a81-5893-6379-cdc1-c2e57d35bae4@gmail.com>
Date: Wed, 9 Sep 2020 10:26:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAJKOXPeV9zCg4v0kBfToGdJSxswbKtT16LVYADALpYRHqWXBOg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_042620_636015_BA65B9B5 
X-CRM114-Status: GOOD (  19.17  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Anders Roxell <anders.roxell@linaro.org>,
 Alexandre Courbot <acourbot@chromium.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Erin Lo <erin.lo@mediatek.com>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Pi-Hsun Shih <pihsun@chromium.org>, Eddie Huang <eddie.huang@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 02/09/2020 18:23, Krzysztof Kozlowski wrote:
> On Wed, 2 Sep 2020 at 16:45, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>>
>> On Thu, 27 Aug 2020 at 15:44, Matthias Brugger <matthias.bgg@gmail.com> wrote:
>>>
>>>
>>>
>>> On 12/11/2019 12:03, Pi-Hsun Shih wrote:
>>>> From: Eddie Huang <eddie.huang@mediatek.com>
>>>>
>>>> Add scp node to mt8183 and mt8183-evb
>>>>
>>>> Signed-off-by: Erin Lo <erin.lo@mediatek.com>
>>>> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
>>>> Signed-off-by: Eddie Huang <eddie.huang@mediatek.com>
>>>
>>> Sorry I somehow oversaw this. Next time please don't doubt to ping me.
>>>
>>> Bjorn, do I understand correctly that you don't send emails to the list
>>> informing of the inclusion of a patch/series in your tree?
>>>
>>> Anyway applied now to v5.9-next/dts64 :)
>>
>> arm64 build dtbs failed on linux next 20200902.
> 

Sorry I was on vacation.

> I just hit it as well... I wish the kernel was built after applying
> patches... it would make the next a better place.
> 

Right...

I'll remove the patch now until this is fixed. Once again sorry for the trouble.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
