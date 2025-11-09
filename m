Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8CBCCF9F8
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Nov 2025 19:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Y3W5ywvn7drSnOuge5r3/YGn5rwH+Mp+hb7awIgl3s=; b=3mUP+EQX++2HQBSiJxCpI7D0cx
	iuIsXlJ9tuHCsNnhKUZGYPSMYxzuCcE7rHcFhh6UdGKcSsgCv0TH6slTaGWc6ytG882XjbjLq9c5j
	m0pkYNTgWjfnCS0DNxPdvfrzNvyk0Mz7n2G34vRPRxFUEg9Aik1itunWX3vltpYFDpTEZgZe7GW5x
	h5UwIsZVq8l/y4qsjjZGrzmUFIa7zD9p3n9v7zzk62j7PSlenQnUPLaJz+R+O7XtWYRNOp3JjI5QU
	uniM4clIj9ebODbwWvhuoW3benUSM7iZUvaYcDQ3TEvlA12A49jUT3GtI4AglDVrLvgVO1A2HOmUF
	yoGcQWGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIAkA-00000004Jms-3Nsk;
	Sun, 09 Nov 2025 19:06:30 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIAk4-00000004JlU-45Pn
	for linux-mediatek@lists.infradead.org;
	Sun, 09 Nov 2025 19:06:27 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-42b30bf0feaso133658f8f.1
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Nov 2025 11:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762715182; x=1763319982; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1Y3W5ywvn7drSnOuge5r3/YGn5rwH+Mp+hb7awIgl3s=;
        b=Ajq6kKRRMrAMbvHWZHokkucNWOIrbGtpzuS7A1s7ifBQwKNZp5GSXfgxQkFljBlfrN
         /WZB/S923KNm+PMHyLmoCbH8HNiYPvAOQ/1XaDf0w8f83fnFf2Sw5xm2npiWOC/hrnK9
         DiECMn1BhQBNrY+a41qWl/pcSINuDv8nMK6OcEcKg7U/pBUlhljzzFAErb70zmni4TX7
         mOksJG/enmFEThl6R8XFTS3JxDJWzYMp5QmYgf2mTLberEZT+c9QoXVCCIkNcofNVhVa
         zBvz1nPrZg3FO09RpCtyGtQJ3jJgi2mCZjNG/5WK4DLvZDC2Rr2fG2Jx0RoEwSe7IOmy
         i68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762715182; x=1763319982;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Y3W5ywvn7drSnOuge5r3/YGn5rwH+Mp+hb7awIgl3s=;
        b=sqwaEDO8bB7jHsTmHU51NEWKJ4UHU304hgl1ebOC/8zD/wv/UI7Pk7g0KhFX04h4T7
         GSyOdS7lLeW5mIxInFscROmjpkFqNBnvXHX8Hs4MH99bkKY5CtAczFm0+mfeDMiOZqSw
         fNehCW/WbXZY9D6dm4dvjahbSaak/KgrtwryDuZXQnz3vuEye/9hBvifcXNPR2W2xXt9
         qP+83VPiGfvQv7TLeViTxnm17GIBCtWSOFrCLntv6Seaj8DtFnUYuGwqI0BuTXaO+M72
         JdMNdbzhj1eiQGAT7Pm0N0NVUTsNiAJTnF8KH3qQJLm+Q81ShxzkEDqPdapgTFlG4ijW
         Aq9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUY9poZFKUme2FsLt3ytbzmtnw9Cctic7WE28ckS9BJfp9WXD0pPZ+2qPEMIUhi9cF8os6NVPcG3i42z6ZxEA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCEc/OM6xEjujzY7mUFOHqDn6K4MR0k35KL4RGBfKFpnzvIg3b
	fNpiJCCKx7G/s/byIp6wGt3T6iWxUKTmm/JDw44kKONRmE2v+aYms487GL1f74RpsAs=
X-Gm-Gg: ASbGnctabW5vu+uj+j2ZLW4KR35OrzN4rG9n/hcUeqp+upqeJ30VUPGpkNY2tWX8oAm
	uT8937aXMSbKp0kuvY2pRsoeTGoSw9QnSfjNx1nGJsdSM47H7i8UdRocWLVhJq5JaC0CO1B3Vl1
	KIkQeLrdNOLBbngJnaucJMUPH/1aTQ/KKS1wzmxpgjq4LQIyAY2zJ9TCWPafxLlp3lhENetTjQR
	RcO75B7/3zp0IR4JXkSlcE5ghRXr3TfGDDRLFdD6ZwCbWixm/tTvX67JHp6G75vyw3Zj5siv0J3
	VUnXyvcc/gqcwUHxOc601HuaCim4CIJyW8UauufbagqYFtuBcE9qUjQd3FOQNi6T1ik50QWoW+G
	+gTliMzCmh+iOmbYmTYHNcYavQJk84LD74zZ//zf+tKzIUDVxpkMxiqFtzGKvTRolaGMH5f8BA9
	nxNAWx8BEaC3qPdFNTm88UJyevXH513ss=
X-Google-Smtp-Source: AGHT+IE/lbhJ0vCe2mId2P7awStumT/sI1M3BLEL1gPp+PFhAxOunSK8kwDpAn8OgL+MDe5CdFcyfg==
X-Received: by 2002:a05:6000:2002:b0:426:fe0a:1bb3 with SMTP id ffacd0b85a97d-42b2dcab74dmr2388569f8f.7.1762715182253;
        Sun, 09 Nov 2025 11:06:22 -0800 (PST)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b380a3a30sm4153513f8f.4.2025.11.09.11.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 11:06:21 -0800 (PST)
Message-ID: <86139020-d2bf-4dc8-8b38-d7faba838e46@linaro.org>
Date: Sun, 9 Nov 2025 20:06:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] soc: qcom: Simplify with
 of_machine_get_match_data()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-11-d780ea1780c2@linaro.org>
 <odmsib3dsxzzggq4gcx7gmh6vq3crlv25fz4z2l2ntezvx6gbi@uelqojwjjait>
 <a8952b46-94b6-4fe5-a5be-d69aa41d44cd@kernel.org>
 <a06ed143-c497-4141-8b4d-98fcb322e130@linaro.org>
 <rxhmiudlnrn2pexqtwuuv2jrenrl2ezepknvrc3o34gaap247u@2tsfw6g33rmr>
 <8fc8c945-ae67-4c58-837d-40bdf4d60035@kernel.org>
 <3q5bpkktogs3pxjboihynjduabqrcuayyexjqdv3cgp5krjaxo@afnknyguuzxl>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <3q5bpkktogs3pxjboihynjduabqrcuayyexjqdv3cgp5krjaxo@afnknyguuzxl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_110625_106269_3E7C44A1 
X-CRM114-Status: GOOD (  25.54  )
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

On 08/11/2025 17:31, Dmitry Baryshkov wrote:
> On Fri, Nov 07, 2025 at 03:58:26PM +0100, Krzysztof Kozlowski wrote:
>> On 07/11/2025 15:23, Dmitry Baryshkov wrote:
>>> On Fri, Nov 07, 2025 at 08:08:28AM +0100, Krzysztof Kozlowski wrote:
>>>> On 07/11/2025 08:02, Krzysztof Kozlowski wrote:
>>>>> On 07/11/2025 04:19, Dmitry Baryshkov wrote:
>>>>>> On Thu, Nov 06, 2025 at 08:07:18PM +0100, Krzysztof Kozlowski wrote:
>>>>>>> Replace open-coded getting root OF node, matching against it and getting
>>>>>>> the match data with new of_machine_get_match_data() helper.
>>>>>>>
>>>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>>>
>>>>>>> ---
>>>>>>>
>>>>>>> Depends on the first OF patch.
>>>>>>> ---
>>>>>>>  drivers/soc/qcom/qcom_pd_mapper.c | 17 ++---------------
>>>>>>>  1 file changed, 2 insertions(+), 15 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
>>>>>>> index 1bcbe69688d2..07198d44b559 100644
>>>>>>> --- a/drivers/soc/qcom/qcom_pd_mapper.c
>>>>>>> +++ b/drivers/soc/qcom/qcom_pd_mapper.c
>>>>>>> @@ -613,25 +613,12 @@ static void qcom_pdm_stop(struct qcom_pdm_data *data)
>>>>>>>  static struct qcom_pdm_data *qcom_pdm_start(void)
>>>>>>>  {
>>>>>>>  	const struct qcom_pdm_domain_data * const *domains;
>>>>>>> -	const struct of_device_id *match;
>>>>>>>  	struct qcom_pdm_data *data;
>>>>>>> -	struct device_node *root;
>>>>>>>  	int ret, i;
>>>>>>>  
>>>>>>> -	root = of_find_node_by_path("/");
>>>>>>> -	if (!root)
>>>>>>> -		return ERR_PTR(-ENODEV);
>>>>>>> -
>>>>>>> -	match = of_match_node(qcom_pdm_domains, root);
>>>>>>> -	of_node_put(root);
>>>>>>> -	if (!match) {
>>>>>>> -		pr_notice("PDM: no support for the platform, userspace daemon might be required.\n");
>>>>>>> -		return ERR_PTR(-ENODEV);
>>>>>>> -	}
>>>>>>> -
>>>>>>> -	domains = match->data;
>>>>>>> +	domains = of_machine_get_match_data(qcom_pdm_domains);
>>>>>>>  	if (!domains) {
>>>>>>> -		pr_debug("PDM: no domains\n");
>>>>>>> +		pr_notice("PDM: no support for the platform or no domains, userspace daemon might be required.\n");
>>>>>>>  		return ERR_PTR(-ENODEV);
>>>>>>>  	}
>>>>>>
>>>>>> Here you are mixing two cases:
>>>>>> - There is not match in the table (in which case the driver should print
>>>>>>   a notice)
>>>>>>
>>>>>> - There is a match in the table, but the data is NULL (the platform
>>>>>>   doesn't have PDM domains). In this case there should be no notice.
>>>>>
>>>>>
>>>>> Why? Existing code printed notice in both cases. Why refactoring which
>>>>> tries to keep code functionally equivalent should change it?
>>>>
>>>> Ah, you mean there was a debug before. Well, then I am a bit confused
>>>> because table has entries without data (so expected condition) but old
>>>> code returned ERRNO in such case - so unexpected condition.
>>>>
>>>> Wail failing the probe on expected condition?
>>>>
>>>> Unless it is not really expected and notice in second case is valid as well.
>>>
>>> If we know that there are no domains on the platform, then the notice
>>> definitely doesn't apply. Failing the probe is a separate topic. The
>>> rest of the code expects that _qcom_pdm_data is not NULL.
>>
>> I hoped that separate topic would be the reason, after commit msg
>> adjustments, to keep this change, but if you insist that this must stay
>> debug, then this patch should be just dropped because it is impossible
>> to achieve with current helpers.
> 
> Having the same pr_notice would be misleading: we point users to running
> userspace daemon, while we _know_ that the daemon is useless because
> there are no PDs. One of the ways to solve it would be to add extra
> wrapping, so that the data in the match table is never NULL.

The message does not matter. It still returns ENODEV which is failing
the probe. This leaves error messages in the dmesg already, if pdm is
ever probed for these devices, so my change of debug->notice here
really, really does not matter. Failing of probe is always a failure of
system, so it is not an expected behavior.

Anyway, I will just drop this change as I said.


Best regards,
Krzysztof

