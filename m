Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48072C7EE23
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jun 2023 10:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bsOWfs49wC5N4v4NWtXmUnjFbzqZWXOVySuGPn3htMg=; b=r3MhbaZ9kJMl5U0OmHzbRe3gdc
	uovMvHCpV2k3r5Qz9Q1nhkE8olNNkWzTHD3011bYprcsOKLk+egCIKmkx9qvQPdA+mpeeQ0jgMtI3
	BYC/HjWOr+o0dVdTJL3swn0lZdzeawY5bZesUeMUNsEajrimePqNeimRK2yoFPPB1h3hgQdH7TSOh
	e6CnAXf0CzGl27BLdViaIBxQ5wuO3b43cECg6gjVojvC93Y+HlaEf5uXZP0r4yR5eAIKg3elZGPtv
	1+qKUeSXtURUJtvwFXc9ypJYtRJ7mPAITlWgG0myvQEAnoUuG1o07TGOcAX33pu822gBgw2oa7nnS
	xsmmAyNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7CRx-008luI-1c;
	Thu, 08 Jun 2023 10:01:01 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7CRu-008ltA-0K
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Jun 2023 10:00:59 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f654d713c0so150837e87.3
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Jun 2023 03:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686218455; x=1688810455;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bsOWfs49wC5N4v4NWtXmUnjFbzqZWXOVySuGPn3htMg=;
        b=4tyzkukruKe8ZPA7RPnB00YrCnc3YfBJt40uG0nLFHL/S2MxEM1ID/0mg1wM6qR0Ap
         O6/bzxhLWfWakDYYZSaELapb2cid4mN9Qnf2sxD64w4Inu9p5V0q7j0Kb3j5FjK6MiEi
         9rSVcTKSTVnpx2CbhZ1k9pwKoDK+tf+kjFRRemHmgKPM8VlM5XJXahH2nLusHzlp1cL2
         lJ+1UPZmC9MQjEgSw97kO1BYmj2wLUR5IIp58Ih7u9fTwzaxTuQ6ZQQfqXUg6UNVatUT
         AKCn8JIS+6M9f9RI39+UNwbBbt1dKCMmz6jGVlDbdIifcAXhzBsnbyl6U4DkjmiB+V+E
         C6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686218455; x=1688810455;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bsOWfs49wC5N4v4NWtXmUnjFbzqZWXOVySuGPn3htMg=;
        b=RZaeTxTdB6JCF/bBtpzCpXVxSWSImf1mHpObrs/O84lM9M0PpL8OB7k3RVAgyPTyy6
         0BHeQUFRj/vcbdXlyISxP/OF8LTLo6gY1Qj/DQqYVtU6oJx2UyIO+qoe5NLaHRrx13Co
         p6AS+bBmLkt50JQwv0dwDdMigXihGAfQQZIBYXS2gD/QumkLtiXVJfOHOzdYcZTmbgpQ
         6JaCDYM+bEp0/IVdnkQWlVKtURC+9inkFc1PaAFtgCB/Zl6dYqKqQTB1RcnDLIFYAZ6E
         P0lNar7V3CPIdgDCKuJkLG4qOk60IWSDPp0MBy1TW4PQ60AElhCdpp3a3NOWTMRdmztQ
         tkoQ==
X-Gm-Message-State: AC+VfDypbMFJ5tp8AqPQ+JvKi/CUo5bhVuGq4BOE23/S8wql/hYw+HYs
	+sCT6JpkFckCvwb+fPMJpfDJZA==
X-Google-Smtp-Source: ACHHUZ7LlWK64M5lFh/5PM74dhnqSCP79zYgwvl4PUklZhQtn1sfsWVhk/BVkBSv4bhXZyQ+/Lckrg==
X-Received: by 2002:a19:a40e:0:b0:4f1:4504:2679 with SMTP id q14-20020a19a40e000000b004f145042679mr2891573lfc.41.1686218455474;
        Thu, 08 Jun 2023 03:00:55 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id p23-20020a1c7417000000b003f60eb72cf5sm4786261wmc.2.2023.06.08.03.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 03:00:55 -0700 (PDT)
Message-ID: <f4547bf6-5e95-331b-5d8e-b6d71209859d@baylibre.com>
Date: Thu, 8 Jun 2023 12:00:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 5/5] ASoC: mediatek: mt8188-mt6359: Use bitfield macros
 for registers
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, dan.carpenter@linaro.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20230608084727.74403-1-angelogioacchino.delregno@collabora.com>
 <20230608084727.74403-6-angelogioacchino.delregno@collabora.com>
 <8bbbc852-6139-29d4-417c-a2d9c77c192f@baylibre.com>
 <a8b454e3-dded-02d6-b97a-6a7aa3420cf1@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <a8b454e3-dded-02d6-b97a-6a7aa3420cf1@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_030058_357115_748E5986 
X-CRM114-Status: GOOD (  11.67  )
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

On 08/06/2023 11:57, AngeloGioacchino Del Regno wrote:
>>> -    int test_done_1, test_done_2;
>>> +    u8 test_done_1, test_done_2;
>>>       int cycle_1, cycle_2;
>>
>> Shouldn't be unsigned too ?
>>
>> I'm wondering if it would be better (probably in another patch) to 
>> change the data type of the other variables too, to match their 
>> use-case. (maybe it's already the case, I'm just wondering)
>>
> 
> In theory, yes, cycle_1 and 2 should be unsigned, but the signedness of 
> this
> variable is getting used in the calibration logic later, as in the for loop
> they are both being reinitialized to -1 ... so I couldn't just switch 
> 'em to
> unsigned.

Understood, thanks for your explanation.

-- 
Regards,
Alexandre


