Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B481AC04AA5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 13:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Luts5GEZA9PcqRIIAUh6yjwcNrrObsoa2UHgSUmbng=; b=haMzc0fe0/BTAnUxk4+VfUTqLm
	MUgfmdwt3IH+s1TZjSNFiFuPykIgvATf2o05tkjKKWcYDN/K7wiGhIKbmFEAcyPRKsb/e+CJBxZ3Y
	kvkv2PC39oxfqaGrZAt8IXyFBriwCS86ibw5ydGc1KltYoNcLDaupR3I05AEK35XEH+Lmn3Khjlto
	pxLT32IkUtKzSsUkmpOVhAT6pf2NSu0j5tL61WUuPHsk2zyedCBHMadF0Ojr8Ap6uqYDxydBjzcmv
	X9pjnyt78UcYl/mTFNN4F19dFZ55q7hRZIgVuVSGl0N5Gbp3p67XK/TAY045NK30V8KnVoty/+t2N
	B2S1+QPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRCWl-00EKzv-2s; Thu, 25 Aug 2022 13:04:07 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRCWR-00EKkf-SV; Thu, 25 Aug 2022 13:03:49 +0000
Received: by mail-wr1-x435.google.com with SMTP id a4so24575301wrq.1;
        Thu, 25 Aug 2022 06:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc;
        bh=5Luts5GEZA9PcqRIIAUh6yjwcNrrObsoa2UHgSUmbng=;
        b=kVtgvdG48xazTFLfxuGcsMJfy9z51VfOwQ583IS0YpmWqhk5K2XwLzwGUUFByXU/uF
         T8fEDyh/V8Jid1XJ3lW6IXae7CcySf3lqCPf7RXzsp3DxF7GHs9EgKD1i/r822AKzljC
         FFWBeniwt6aXvr59TboeIrhIubm4yJGa0FAMZGJgFMXODrDgjfSV/khe0TAl9cFsjy0k
         um7bTSRUdo7oPKRwKj15L41JproTH9en07SUnNlw0ArVdeJMlQurhRAAFmcCMgVngE6v
         /0an5pI7JL/2Di3EWMM7rYsxQ1+7V+d44qTdppjt6CzNsK9LVYQfJWAJtGPhrJLGfP4+
         FYog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=5Luts5GEZA9PcqRIIAUh6yjwcNrrObsoa2UHgSUmbng=;
        b=cEewFeQzl6sPylgP590SJMPg9FLMndNjkH5hsbAMeXNCZiPcRKXn+GDszYfYL9Wdii
         S9tubocgnFAtixYKHyRiSV50p1B3j6PB/YVZLnIhGIfs9AX9c94Rc8HDUxtxMefcRKae
         HQ00i1eeqK2XYV1dMwr3zDLaKWSzNrpbwhqlexvoR9ZUxtdNoO8RET11J2RC4lEys40c
         tMUPGj8TOLXYU81QnsL8wknxBusENkbh0S+GWdo21esU3rr8rLiHfJGomzv3vfdVDvHZ
         ftsIP82T+IFA08Or+IxGrKnRBWFn7+KVnKdvB6Ds+UrSRnRY43+Bl99x1zqwkNJ0YRnR
         z8xg==
X-Gm-Message-State: ACgBeo38zpgHc2WV1o0EPaXBsqoSnc7lISWnNBJsH0ABezDQW+umFYdv
	0d/gUGg79vzCvJMijY5tqjA=
X-Google-Smtp-Source: AA6agR5ukxuM0sgzKs6kswETJQECh4QnJIkYVbfzcsGqX9G3WFVzIFwWhttfJ0G3HXT4sy5iAA0qzA==
X-Received: by 2002:adf:d202:0:b0:225:4aee:d7d6 with SMTP id j2-20020adfd202000000b002254aeed7d6mr2210222wrh.364.1661432624222;
        Thu, 25 Aug 2022 06:03:44 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id s7-20020a5d6a87000000b0021ef34124ebsm19812406wru.11.2022.08.25.06.03.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 06:03:43 -0700 (PDT)
Message-ID: <83f5f34f-6e71-3d36-e715-71896f0ac9a4@gmail.com>
Date: Thu, 25 Aug 2022 15:03:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
Cc: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "hsinyi@google.com" <hsinyi@google.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20220825055658.12429-1-rex-bc.chen@mediatek.com>
 <3ff08ae9-a4b6-2b74-23cb-69ea1d7e1033@linaro.org>
 <d5a00dc88bed1680caa8af895a1140324b9d079e.camel@mediatek.com>
 <f7ec45b8-ccd7-4776-0524-269e3188883d@gmail.com>
 <781356a88b502661ec23b3869679d80cf682017d.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: mediatek: mmsys: change compatible for
 MT8195
In-Reply-To: <781356a88b502661ec23b3869679d80cf682017d.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_060347_985153_46B8185F 
X-CRM114-Status: GOOD (  19.38  )
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



On 25/08/2022 13:06, Bo-Chen Chen wrote:
> On Thu, 2022-08-25 at 18:55 +0800, Matthias Brugger wrote:
>>
>> On 25/08/2022 08:59, Bo-Chen Chen wrote:
>>> On Thu, 2022-08-25 at 14:11 +0800, Krzysztof Kozlowski wrote:
>>>> On 25/08/2022 08:56, Bo-Chen Chen wrote:
>>>>> From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
>>>>>
>>>>> For previous MediaTek SoCs, such as MT8173, there are 2 display
>>>>> HW
>>>>> pipelines binding to 1 mmsys with the same power domain, the
>>>>> same
>>>>> clock driver and the same mediatek-drm driver.
>>>>>
>>>>> For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines
>>>>> binding
>>>>> to
>>>>> 2 different power domains, different clock drivers and
>>>>> different
>>>>> mediatek-drm drivers.
>>
>> drop clock driver example here.
>>
> 
> Hello Matthias,
> 
> Thanks for your review.
> I am not sure what do you mean.
> Could you explain more detailedly?
> 

Never mind, it's not that important.

Regards,
Matthias

>>>>
>>>> I don't see binding to different clock drivers and anyway that's
>>>> not
>>>> really an argument here. Please focus in description on hardware
>>>> properties, IOW, are devices compatible or different. What is the
>>>> incompatible difference between VDOSYS0 and 1?
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>
>>> Hello Krzysztof,
>>>
>>> Thanks for yor review.
>>>
>>>   From the functions perspective:
>>>
>>> Hardware pipeline of VDOSYS0 has these components: COLOR, CCORR,
>>> AAL,
>>> GAMMA, DITHER.
>>> They are related to PQ (Picture Quality) functions and they makes
>>> VDOSYS0 supports PQ function while they are not including in
>>> VDOSYS1.
>>>
>>> Hardware pipeline of VDOSYS1 has the component ETHDR (HDR related
>>> component).
>>> It makes VDOSYS1 supports the HDR function while it's not including
>>> in
>>> VDOSYS0.
>>>
>>
>> Please include a description of this in the commit message.
>>
> 
> Yes, I have sent v2 and add these to commit meesage.
> 
> https://lore.kernel.org/all/20220825091448.14008-1-rex-bc.chen@mediatek.com/
> 
> BRs,
> Bo-chen
> 
>>> About mediatek ETHDR, you can refer to this series:
>>>
>>>
> https://lore.kernel.org/all/20220819061456.8042-2-nancy.lin@mediatek.com/
>>>
>>> To summary:
>>> Only VDOSYS0 can support PQ adjustment.
>>> Only VDOSYS1 can support HDR adjustment.
>>>
>>> Is this description ok for you?
>>> If it is ok, I will put them into commit message in next version.
>>>
>>> BRs,
>>> Bo-Chen
>>>
> 

