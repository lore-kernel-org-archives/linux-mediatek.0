Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED4AC4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 01:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hsY9pw0TDst5fn7pyaJpwFYHQHsp2P8sIo6DgROWKDI=; b=GGPY3MrE0QGtV5Z5GzWGOl0zPT
	vbuPQp0XElT69/ADaFdlIAlY4+S8KDSNY60tW8ZHsVhfl0M8dhJhWFaoAczWpSnF+PirlgpneuP8J
	BHD6T3JoUMp5naa8HbQaFgnbhuTLdOGc9J1ApDyFmXKmQzeTWOizYnrVngKxzPXOnxHiMPbIT7A8W
	dSUmRrEnVg94TIXjO8/EC/IWwfOqCtNqhySJjxVi1zApezTI/wij/+y9EwwA6fR+LPhzYQ3ImW8Tf
	DtWqIVT/6G8EUY0qWPJp/dKS8iqv2eJSlU6nL35eKfKrczVnT1RbMTBJ2TkzX56zFgZtEVrDEheTg
	mILd8dIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rB2mO-00Bbbg-0M;
	Thu, 07 Dec 2023 01:02:16 +0000
Received: from mail-pg1-f176.google.com ([209.85.215.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rB2mK-00BbbC-2b;
	Thu, 07 Dec 2023 01:02:14 +0000
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5c66e7eafabso291309a12.0;
        Wed, 06 Dec 2023 17:02:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701910930; x=1702515730;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hsY9pw0TDst5fn7pyaJpwFYHQHsp2P8sIo6DgROWKDI=;
        b=FsLYUFNRMOcqucArnIrtwTD+rkgNf4xxf3LClLhwn3hDlZUMRbLPCVbUK0VXxuRDCL
         0l5Ol3t4q4DG/vdy1klcIiudA/9HM0fEZBTmxwsFxrzdLNjTFa4i9fCugL9zoANPVSWC
         7DZE8YTVqiE8FN8Yc9jede/i8wNdejOTV8Gg0OTJ8gP1UHTsWy4e0+xMjX6EDxqNxVpd
         Z+RSzx4wX36pfgdfhWpr/AqIEet6WkwmvTWzQiUsgnQr0/aHZ6R7BbEEc3olaT86gFRB
         Fcdjw5cDRfJybgO85qn7TC9qyvGZKOpU/BaVdUVFsTeCkr/cNNn194OsCGf46rIoFCSM
         Vp1w==
X-Gm-Message-State: AOJu0YyECB1F1N+2tV6C+IC7LEavaFm91TOqnYu/2+HKJ9MWX4NuoO0n
	IIlYNP6Jldvg2Mqyj0sU10o=
X-Google-Smtp-Source: AGHT+IHMqy62pr33s+axRTNU9zRKI+eQxYUdPtYiMKmdFwxGEZ5YOdCxe0OaOGpyoMV2n57/gKS5ZA==
X-Received: by 2002:a05:6a20:43a7:b0:18f:bf91:2938 with SMTP id i39-20020a056a2043a700b0018fbf912938mr2423155pzl.125.1701910930060;
        Wed, 06 Dec 2023 17:02:10 -0800 (PST)
Received: from [172.20.2.177] (rrcs-173-197-90-226.west.biz.rr.com. [173.197.90.226])
        by smtp.gmail.com with ESMTPSA id p2-20020aa78602000000b006889511ab14sm134543pfn.37.2023.12.06.17.02.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 17:02:08 -0800 (PST)
Message-ID: <effb603e-ca7a-4f24-9783-4d62790165ae@acm.org>
Date: Wed, 6 Dec 2023 15:02:04 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/3] ufs: core: Add CPU latency QoS support for ufs
 driver
Content-Language: en-US
To: Manivannan Sadhasivam <mani@kernel.org>,
 Naresh Maramaina <quic_mnaresh@quicinc.com>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Peter Wang <peter.wang@mediatek.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chu.stanley@gmail.com, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
 Nitin Rawat <quic_nitirawa@quicinc.com>
References: <20231204143101.64163-1-quic_mnaresh@quicinc.com>
 <20231204143101.64163-2-quic_mnaresh@quicinc.com>
 <590ade27-b4da-49be-933b-e9959aa0cd4c@acm.org>
 <692cd503-5b14-4be6-831d-d8e9c282a95e@quicinc.com>
 <5e7c5c75-cb5f-4afe-9d57-b0cab01a6f26@acm.org>
 <b9373252-710c-4a54-95cc-046314796960@quicinc.com>
 <20231206153242.GI12802@thinkpad>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20231206153242.GI12802@thinkpad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_170212_841021_A98764B9 
X-CRM114-Status: GOOD (  14.94  )
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

On 12/6/23 05:32, Manivannan Sadhasivam wrote:
> On Wed, Dec 06, 2023 at 07:32:54PM +0530, Naresh Maramaina wrote:
>> On 12/5/2023 10:41 PM, Bart Van Assche wrote:
>>> On 12/4/23 21:58, Naresh Maramaina wrote:
>>>> On 12/5/2023 12:30 AM, Bart Van Assche wrote:
>>>>> On 12/4/23 06:30, Maramaina Naresh wrote:
>>>>>> +    /* This capability allows the host controller driver to
>>>>>> use the PM QoS
>>>>>> +     * feature.
>>>>>> +     */
>>>>>> +    UFSHCD_CAP_PM_QOS                = 1 << 13,
>>>>>>    };
>>>>>
>>>>> Why does it depend on the host driver whether or not PM QoS is
>>>>> enabled? Why isn't it enabled unconditionally?
>>>>
>>>> For some platform vendors power KPI might be more important than
>>>> random io KPI. Hence this flag is disabled by default and can be
>>>> enabled based on platform requirement.
>>>
>>> How about leaving this flag out unless if a host vendor asks explicitly
>>> for this flag?
>>
>> IMHO, instead of completely removing this flag, how about having
>> flag like "UFSHCD_CAP_DISABLE_PM_QOS" which will make PMQOS enable
>> by default and if some host vendor wants to disable it explicitly,
>> they can enable that flag.
>> Please let me know your opinion.

That would result in a flag that is tested but that is never set by
upstream code. I'm not sure that's acceptable.

> If a vendor wants to disable this feature, then the driver has to be modified.
> That won't be very convenient. So either this has to be configured through sysfs
> or Kconfig if flexibility matters.

Kconfig sounds worse to me because changing any Kconfig flag requires a
modification of the Android GKI kernel.

Thanks,

Bart.

