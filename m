Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B557BC55174
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Aug 2026 14:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6+/fm2qOcTXIyjtL2DGzrA32WfRZi/Wok9xvh1oVjxM=; b=K9oq2gtxgavhlzlCwwbXC2miC2
	8nCity/rN084N0ZyjwsQ2J+5xfSuNbhLAcA9ZbwRyEo0zgrC6qkmstDs3pT1av3jUZ6xTHxtI4r6P
	d22KunQhJ8NOSpLZ3PKxsj5Z+zJ1gHQkfqZnilRtd2lMHMb5tVh2NchdksOi6U6aI/csVbQeKpM7h
	dfo4H4+Cfs7HvCjCYtY0y0/fPeANJ6vg9jPsUOih7H3LdEkcNKjfSPYqlQXVAtTRtfgEeNcjcrdvv
	aU2QPvcHzyxed+T6SzLT6hqqb7G4BOMFaNNqTrXM3lkEyGc8DwW1i2Q/xKbdLkoryso01nuvlyvgY
	/Kun3CgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsiOB-00000009T9k-2WrT;
	Sat, 08 Aug 2026 14:51:07 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsiO8-00000009T8V-0b00
	for linux-mediatek@lists.infradead.org;
	Sat, 08 Aug 2026 14:51:06 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2d049069377so4476115ad.0
        for <linux-mediatek@lists.infradead.org>; Sat, 08 Aug 2026 07:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786200663; x=1786805463; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6+/fm2qOcTXIyjtL2DGzrA32WfRZi/Wok9xvh1oVjxM=;
        b=h4MqzqeWUatYOjQecP/HfojMJOoFq54/Th0Ni1CdNxsKAJ9F9Mu/fslyt9kM46x14L
         wGdkEBd/+eqM3rz+7gGLNn+H1xgWPr/tHLTJTh4VlOnwCRIn+ITRmp1IC3E1sEOa57hI
         7Be1hPM3VFoQANDeUHl0UuVUpeMrns8UXyD3TDCToDItaLE6C7cx8xCQcG6fCONo3DJt
         wAjtjd/JCeicqDFYJEkQPc1YCS0B9Nm7qtXlZ5hvYBM8v+5j/56GQ/h2bE9KYA/+cWeF
         btWGSccGxAzb724uKQLoOvNMksgX78Q5U46CiauxYN1otdluDTeulVqB+WLk2KXj3GCg
         dyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786200663; x=1786805463;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6+/fm2qOcTXIyjtL2DGzrA32WfRZi/Wok9xvh1oVjxM=;
        b=G3u5Bf3hSwPUwAsfwwty7Ml+klaPvDcovLfgv3NsdQfrCHBz1fd5BR/rPoeKoRvxFK
         Dy0YAXUuzLgaVLAchIvrsG8isAz5U6E93DdFSzOQkbMZLjdCg+hxVu+HOkyGZBwuer9+
         AZp+h0aMi8fx4HEbUIWwnu9JsUwszAjAg0S+HyAngS3dqDt/yMAWSmXZbmlgP8Cr5W+s
         1Kfx67xFJ9X0Ut//ifUnosQt7yzWV61td57IHwSoLMNSmXaaT2eNofTH8nDRDywbvxp2
         fRlVneLIzwDusyGwl/tmYzq3luxNeR/8ECojNr5y3AwlR6mves67AOr1yZrv1dcY8Vzx
         ivcQ==
X-Forwarded-Encrypted: i=1; AHgh+RqqWdxa1zSOIsKHDI6TmldXaDCj8uKy4q66gsEFAfynt/Wj/iHy48AGvaqVQohwE29dkBm/c9VV6aAOzoYSIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzRFC4WCVJv5dS8l9GuYKzrOGLZLKmj7LQP0TRPfSwbDXd10+w
	mfr/R/1EhxpJXuuW5/maSImgzZezzJKFthfWBplgflSP7DkekD86/fE7ALRKFw==
X-Gm-Gg: AR+sD12KA2/XxnHBgS9+qR7iAc2zS/GVDnTb6hQrAJV+EfH4hqrhd5uwdi1AMi579dO
	+XYR3bmOkJ1CGPTbAujqbK4RFtTSbjFrBe3dKdv2znYgKOKp8HiWwtuWKUUVjXEc2VhnJJ8jpD6
	LYg5wbTTu9xkErbLKtPhbF6+/gozV3XsOCcCWAjrz9p9Cd9oCLOAvl/Q9+AWcPJF/gt8Cdfhlkb
	UGtH9mYdYEE8vf97+PuDfnkA/UTgXjbhF/RMIOgWFceQHq8blolRWQTrglTKZ3Id78PHQWSTGck
	RXTLcKk+LurL4T0Nxv2Ap9qbxXG/AZZAr1T4XsAKxcqydLo/nfySDyyK4bl6LJ5dRSghi+CEIWp
	49y8WarRyaLIpQpWt0X8IbhNOVmCyOHeFdVwBTBEDvYMIlQS+yHnQokkbQ6tyu4qDUKQ+9W6Bxb
	gZAJFsnx//Q+qHvnzYjd8G0iS14Jczett0ZfTbMAiesu8zJRnfIgqWx2VwamJDrO4XA5sDUquRv
	bAzQBjCEcmkASCfjU8zhWfe7BHWE4GNZ7ANEw==
X-Received: by 2002:a17:902:e787:b0:2c9:c083:cd50 with SMTP id d9443c01a7336-2d106e333f0mr206689685ad.17.1786200663232;
        Sat, 08 Aug 2026 07:51:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14ccac170sm19398045ad.8.2026.08.08.07.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Aug 2026 07:51:02 -0700 (PDT)
Message-ID: <9971b3aa-cb1f-44a9-9d58-4f75f0c6ccea@roeck-us.net>
Date: Sat, 8 Aug 2026 07:51:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] watchdog: qcom: Propagate errors from optional IRQ
 lookup
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20260807081652.38692-1-phucduc.bui@gmail.com>
 <2eb8b31e-a3c6-4310-b9cc-7acd135b6c99@roeck-us.net>
 <CAABR9nHqKKbxkzBNkENadhFJgC_HuetV+ab7SVsGH+cwbF+OFw@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAABR9nHqKKbxkzBNkENadhFJgC_HuetV+ab7SVsGH+cwbF+OFw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_075104_302666_7511DF2F 
X-CRM114-Status: GOOD (  14.15  )
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

On 8/8/26 01:59, Bui Duc Phuc wrote:
> Hi Guenter,
> 
> Thanks for the review.
> 
>>
>> This is wrong. Check the if() path - the code ends up here if pretimeout == 0,
>> even if irq > 0.
>>
> 
> You're right. I misunderstood the condition in the if() path.
> I'll rewrite it as follows:
> 
>   irq = platform_get_irq_optional(pdev, 0);
> +if (irq < 0 && irq != -ENXIO)
> +        return irq;

This is still wrong. If there is no pretimeout, it does not matter if there is an error.

Guenter

> if (data->pretimeout && irq > 0) {
> .....
>   } else {
> - if (irq == -EPROBE_DEFER)
> -       return -EPROBE_DEFER;
>    wdt->wdd.info = &qcom_wdt_info;
>   }
> 
> Best regards,
> Phuc


