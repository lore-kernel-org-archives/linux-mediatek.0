Return-Path: <SRS0=M7U7=AV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74620C433EC
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 13:34:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4137E20578
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 13:34:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D6R+ulhY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q53oHFKs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4137E20578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ehTga1R7m2b3RCNOxO8UnYjs9EgwDgtYfxH2Nv1rIac=; b=D6R+ulhYnshI07crozk/SwK4N
	qK8r0vZpZUPdUE/FpliU5q6xOhwpPb7HTvmxA25Z+BlaJTTRepo12crXF68dfPsm1wNUtYn33IQoH
	WfbR1DybL1mnB++fUYK2rnEELcxTAmEW6E+u7QnkuSAqIXFW7GW0QWVepRu/mxHUXy+5tlMRSr3r2
	CSNlkGVJmehiRCWASbsn9KP8Iw6vSeloHdkMqU+BnwKqaItwTUkpjgentTT/JgcHnBkiwzOzAAlpR
	MpVfW9f2thF+uwYVo9Z3pGIABZ3jzS7TKkVwHmgjcTXM2Zb6z05V8DekQKUZguLpkhXAbXrO+dvme
	UbcLZ1O3Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jttAg-0006ji-39; Fri, 10 Jul 2020 13:34:34 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jttAe-0006ix-32
 for linux-mediatek@lists.infradead.org; Fri, 10 Jul 2020 13:34:32 +0000
Received: by mail-wm1-x343.google.com with SMTP id a6so8500340wmm.0
 for <linux-mediatek@lists.infradead.org>; Fri, 10 Jul 2020 06:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RNU/6302rcOODFLCEwANfmyQpoUQ2vOd8B0eKLChpSE=;
 b=Q53oHFKsaw4OCYx49+iBVCsst7Y23PSx8gEhnEI2UKg0iwX6IkQ0CBC6B0RDNn5s4d
 DK2QjnkLusfxi72FE6JTvMdjJ87VRBrt/0YbjVaWHPPx8YuwhYTkdQbYSP71h6RbKf6a
 4lGKKX+4tqrHetgXHFWXML1Oub7m6pxY/GYXBIM6HBsbZsOlcQ71S+GucXslavCvZpvM
 RE750aTeLEev9RNXORjzl6/cRUCbh0g3Un2CFnxBLPcu8ez3dEp9IRDXRvRVEsi9YwgK
 E8+2ZZph3FZs0VJgREz+venk9okouoeUCh1cEh67QCjs5Fru0XTjiyJPZtkOub9rTFUY
 ELCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RNU/6302rcOODFLCEwANfmyQpoUQ2vOd8B0eKLChpSE=;
 b=D5nxun/MixlsLITQ3wm6kFU1jJxLkOgLJuFczAZAnPGjiS6hEVew8DfxO7FcXNfjUZ
 ybCSkSLFV1Jc0FJAFbySuAwPdH1Ntv2xl+sXXcVPyJsxwXccXOBkjF7jdKitEgWv3kff
 fRygXNQPFMyNhe8Qust5658P15Yam9jQEjErcsJdA9wSvA3nKbe0eMt4sNl/3a+Z+Zuf
 B9X98LeGkhMeXb7F2HfHL98k0+lrqpAeqHTaqFb5AwBDsdvAF9FSPE8quoEs1IupuxLP
 z7TI7oH293g/sDIg3/0zyelj67DVKLKS+AQLnJ1TOshSKdaRmNCgZHnz+GO/fh8ybWcY
 fC6w==
X-Gm-Message-State: AOAM531d02XQDw69KL5jWhuL/G3aUTF8gwxJN4WnZmX4w+5MgHB9gXxH
 RFXg0xVzhub0vsrvQdTdlX0=
X-Google-Smtp-Source: ABdhPJxwuzAwkiVu4PKL02+ytwiGtWwViRpoEp4epFrba7W8NasX5QwhcrD97o5Wahrp3YlAFpJopQ==
X-Received: by 2002:a1c:96ce:: with SMTP id y197mr5118147wmd.86.1594388071128; 
 Fri, 10 Jul 2020 06:34:31 -0700 (PDT)
Received: from ziggy.stardust ([213.195.114.245])
 by smtp.gmail.com with ESMTPSA id l3sm9911568wrx.22.2020.07.10.06.34.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 06:34:30 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: mt8173: Re-measure capacity-dmips-mhz
To: Hsin-Yi Wang <hsinyi@chromium.org>
References: <20200706083705.2343150-1-hsinyi@chromium.org>
 <71bc5fa2-0869-5d91-6bb8-e8d59176e19c@gmail.com>
 <CAJMQK-iGwXFwkvY_1nYiVQ6D-N5yU8YNqxeaSy-1XNMJHj1H0A@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <fe75ae59-99a7-3eec-b481-f1ec3264a86f@gmail.com>
Date: Fri, 10 Jul 2020 15:34:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAJMQK-iGwXFwkvY_1nYiVQ6D-N5yU8YNqxeaSy-1XNMJHj1H0A@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_093432_199883_3E710395 
X-CRM114-Status: GOOD (  18.39  )
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
Cc: Devicetree List <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Ikjoon Jang <ikjn@chromium.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 08/07/2020 20:55, Hsin-Yi Wang wrote:
> On Thu, Jul 9, 2020 at 1:01 AM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>>
>>
>>
>> On 06/07/2020 10:37, Hsin-Yi Wang wrote:
>>> Re measure capacity-dmips-mhz on elm and hana:
>>>
>>> cpu 1:  9502 DMIPS @ 1703 Mhz
>>> cpu 3: 16250 DMIPS @ 2106 Mhz
>>>
>>> ==> 740 : 1024
>>
>> I have some trouble to match the commit message to the actual patch. Commit
>> message talks about cpu 1 but patch changes cpu0. Where are the values of the
>> other CPUs?
> 
> Small cpu on 8173 is cpu0 & cpu1, while big cpu is cpu2 & cpu3.
> Small cpu: 9502 DMIPS @ 1703 Mhz
> Big cpu:   16250 DMIPS @ 2106 Mhz
> 
> 9502/1703 : 16250/2106 = 740 : 1024 (scale big cpu to 1024), and this patch
> changes the small cpu value to 740.
> 
> 

applied to v5.8-next/dts64

Thanks!



> 
>>
>> Regards,
>> Matthias
>>
>>>
>>> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>>> ---
>>>    arch/arm64/boot/dts/mediatek/mt8173.dtsi | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>>> index 70b1ffcab7f0..5e046f9d48ce 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>>> @@ -167,7 +167,7 @@ cpu0: cpu@0 {
>>>                                 <&apmixedsys CLK_APMIXED_MAINPLL>;
>>>                        clock-names = "cpu", "intermediate";
>>>                        operating-points-v2 = <&cluster0_opp>;
>>> -                     capacity-dmips-mhz = <526>;
>>> +                     capacity-dmips-mhz = <740>;
>>>                };
>>>
>>>                cpu1: cpu@1 {
>>> @@ -182,7 +182,7 @@ cpu1: cpu@1 {
>>>                                 <&apmixedsys CLK_APMIXED_MAINPLL>;
>>>                        clock-names = "cpu", "intermediate";
>>>                        operating-points-v2 = <&cluster0_opp>;
>>> -                     capacity-dmips-mhz = <526>;
>>> +                     capacity-dmips-mhz = <740>;
>>>                };
>>>
>>>                cpu2: cpu@100 {
>>>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
