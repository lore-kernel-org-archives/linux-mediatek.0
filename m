Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 917C1C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Dec 2023 17:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LIgtlDTFB4ifEMLDlLmo9Odq54+Ds0nrV8Ow5EkAIJU=; b=TDJ5cDfS4ysE2RrQIRGcTYEKoE
	lvFVx11XA//ycgnPJK18W+Q8jK/u4/+AEyfrUwv8opVHR8craTCtzNXCjZ6GoyLYhg5dwYhQijVwc
	MF64FEDi67Bg2/UuUErQVIErF7r2bC3+ZGmgE9IjlmboNu/vJtudVD8kPqcy8y51sMqWdf5DnUsvy
	uX27u5jFfdLTURPEa0ZK9lotG8XtBAsPWZ6XkTcNgHmsTEYgKtARM3S3lGhJpkUrq8mvZjyP/nQ7C
	lpoKDqshoqqOoOlPliLFkzpFOd2TJy46PXS8Poij4a90ONK6Yz9jcIB2nmAtKixdus0t3VUPZsVIZ
	PPYzGAUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAYxs-0080Hh-2C;
	Tue, 05 Dec 2023 17:12:08 +0000
Received: from mail-pf1-f170.google.com ([209.85.210.170])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAYxp-0080GO-07;
	Tue, 05 Dec 2023 17:12:06 +0000
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6ce32821a53so1796182b3a.0;
        Tue, 05 Dec 2023 09:12:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701796320; x=1702401120;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LIgtlDTFB4ifEMLDlLmo9Odq54+Ds0nrV8Ow5EkAIJU=;
        b=gG5TAjPUQk6LuqXVBhvW/xynIqbwoWMadX/Te2ZAQ5LPgJvWMMre1Lzj4EKiHfWk3g
         I77nLtwQcij5FQ/m20tbVKHegh6aPq8tc3sbQ03aNI0d8yQeGqqlRJ4Q4uWtfvW+GBYp
         N8Aa8N6TRFyNfjO+k/H7AoaZNDKCejEIKp3Ar8uyKipCYi3o4oHDaNWDSKwHahrlKtMC
         cSXX5HjR18ula34SYYN7pAXmm4qOYxw6hc7ZHXleVNXry/9HBSCmb/NdIlCKAoBPRlRS
         frkkktXnU7qBUdByryDNI3KiTCvL2rmbWQ4EhzG4nLPblJkc2AfUXgNpVtPVDaogOnfs
         qm9g==
X-Gm-Message-State: AOJu0YziJVQ0NpzF6FoVH0rBJK8oavPA/FIatn5RG0/SSHKLf7Eu+VDc
	dwRL9kzzsUI01Isv4LYdKxo=
X-Google-Smtp-Source: AGHT+IF7E5x8UjIWIzapLtbdXMzc56ip0B+yOdQGhzLNbJWo3FqUwECSSsaBg30dT08e4RQCQaiGiA==
X-Received: by 2002:a05:6a20:9384:b0:18b:94c5:24c2 with SMTP id x4-20020a056a20938400b0018b94c524c2mr3656735pzh.60.1701796320419;
        Tue, 05 Dec 2023 09:12:00 -0800 (PST)
Received: from [172.20.2.177] (rrcs-173-197-90-226.west.biz.rr.com. [173.197.90.226])
        by smtp.gmail.com with ESMTPSA id bf8-20020a170902b90800b001cfd077fab4sm10409920plb.282.2023.12.05.09.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 09:12:00 -0800 (PST)
Message-ID: <5e7c5c75-cb5f-4afe-9d57-b0cab01a6f26@acm.org>
Date: Tue, 5 Dec 2023 07:11:56 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/3] ufs: core: Add CPU latency QoS support for ufs
 driver
Content-Language: en-US
To: Naresh Maramaina <quic_mnaresh@quicinc.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Peter Wang <peter.wang@mediatek.com>, Manivannan Sadhasivam
 <mani@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chu.stanley@gmail.com
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, quic_cang@quicinc.com,
 quic_nguyenb@quicinc.com, Nitin Rawat <quic_nitirawa@quicinc.com>
References: <20231204143101.64163-1-quic_mnaresh@quicinc.com>
 <20231204143101.64163-2-quic_mnaresh@quicinc.com>
 <590ade27-b4da-49be-933b-e9959aa0cd4c@acm.org>
 <692cd503-5b14-4be6-831d-d8e9c282a95e@quicinc.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <692cd503-5b14-4be6-831d-d8e9c282a95e@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_091205_070451_7AE65128 
X-CRM114-Status: GOOD (  12.86  )
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

On 12/4/23 21:58, Naresh Maramaina wrote:
> On 12/5/2023 12:30 AM, Bart Van Assche wrote:
>> On 12/4/23 06:30, Maramaina Naresh wrote:
>>> +    /* This capability allows the host controller driver to use the 
>>> PM QoS
>>> +     * feature.
>>> +     */
>>> +    UFSHCD_CAP_PM_QOS                = 1 << 13,
>>>   };
>>
>> Why does it depend on the host driver whether or not PM QoS is
>> enabled? Why isn't it enabled unconditionally?
> 
> For some platform vendors power KPI might be more important than random 
> io KPI. Hence this flag is disabled by default and can be enabled based 
> on platform requirement.

How about leaving this flag out unless if a host vendor asks explicitly
for this flag?
>>
>>> + * @pm_qos_req: PM QoS request handle
>>> + * @pm_qos_init: flag to check if pm qos init completed
>>>    */
>>
>> Documentation for pm_qos_init is missing.
>>
> Sorry, i didn't get your comment, i have already added documentation for 
> @pm_qos_init, @pm_qos_req variable as above. Do you want me to add this 
> information some where else as well?

Oops, I meant 'qos_vote'.

Thanks,

Bart.


