Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE10E77188
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2025 04:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e4lTg0T9hFxSt/NfABOy8Ts2GGYfCa7L7ZN3BcykZak=; b=XKzBjudcAEYMhxuHdGOH1E3F7/
	XGSHUTQg8W0PExEvhk7IvWLieScIT8uuxEXoeXzjsjk4o3UUhp72FjIa12/cuzkbdDJIp2qhdUI3U
	8aiz0annY688WuwLBfvb8NJuzj0zdcF1bEC6D59DHb0ciRX+7++l2O3ulRIKUIsHy/4u9vT8/h1FX
	X1lYBfVZ5ngj+SKmxvEXs0xAagNgXuw+DjM+I9ElDVu7LJY2Bqtfqw7bxhdjL2fIRqX/1BBji2Yqf
	A30Ir5+jXYvUTC8Ym2tKss/QLGDSNXNTlCqirfYlA192vX6TRuRxPGDahypEhb3pSJVkzUjFl59rS
	nvqU241Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYHtd-0000000Dpfb-3WGg;
	Thu, 16 Jan 2025 04:54:21 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYHtb-0000000Dpe7-1awE
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Jan 2025 04:54:20 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-215770613dbso5207305ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jan 2025 20:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1737003259; x=1737608059; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e4lTg0T9hFxSt/NfABOy8Ts2GGYfCa7L7ZN3BcykZak=;
        b=aZbhMDHIBtw5gzHl49KpCAUtFM7bCmR7CsITIGMinrx0Lcge7UEj6mkLg9kHRRTL/3
         ulMornvRkiT9MdS70a7b6iz6xliSvi2M455pBh/vxe3FsJEqKylLQpR63Q8FuTpkdg5H
         xUaYqikFn+gusgwu3jj/+lUXeE7lNXUm80iGvMP2DYgxraN8a+7hvASRfyIscFmkskWv
         +dIHYLDaDEKlG4CuxS9tmB875ddbHfWzHRDSbiBoOeH6KSyCU5FiUZdcBY340PflN5RG
         +uYFfWfvdMdEMQZQgrOjg2uTURndzj7G+PXW2UFiwfNyEiMuoKat8TrVU+ef1u017wj1
         H8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737003259; x=1737608059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e4lTg0T9hFxSt/NfABOy8Ts2GGYfCa7L7ZN3BcykZak=;
        b=eOgCWq5wkB//81A4xJe/KMLTEVntbOV4p26xnYY0Suw5rZvn4tWxfvnp38I8naJejg
         Pb+Mr0zSjkJ9rbp2qBEmczo85LxfoyDCR4hzKABj4dXm5BfuT3XuoBrBoyRVeRny3OCo
         ouqOeHx70pEH4OCATyb9SHdN+oT4FYmDOpeXgHhsa+quCezy6TA+QDfWlOe0dIiYMYWR
         VdvPuiytHXFx8L3WHxhsEj1stSjCNzFVopIe0vLqhHGGdvB5bFr3syhQJOJ6WMVVFrEh
         eu76mWcfuEchAnn2otebzSZcBnWvB1HMAq/uiKR0CKrR2oMpMS2w/+V8IE69kLRnbSQW
         H/jw==
X-Forwarded-Encrypted: i=1; AJvYcCUhW3EPp7S01W+PcLHAb8Hry2YvxFwzyQXjsBcQpU2ikw9mvaFM7a08wyL4yLJOMWvKEJubtDvi3O/FhzoLEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKTsP4n7MTyfdby6r0kbMw8vNSzN6La1vV0FPOmQFKiYiaz7bw
	qKVHT+/bdF3vc4HX1sdAgQji0dnw6VN2kl0P0SdomlIYO/P7ivie0r98SuZGzyw=
X-Gm-Gg: ASbGncvlcFZebr3YKeTZjR/kVlLTXbHWtwx/Jv1v3IUHeZIKrX9D8N9YCFGk3w6M6g4
	Ts54zIJOdEE8cIghdKpiyh5LYD6RJa1+W64MPYGSLa1l3mcBKL14Q/7lZKF9ahieDlK6cvnbSuX
	Xi5K4p0J7UOKEQDDCOVXKegpBlPYWEf6/eDYiARwth2kEppXPlWrwPMhJSzhz5KwS+tNu08EiCj
	HkbBpkvMx8ewf/is4zMWSYVFw/Ck5mGHu5DNmw43Fnrvl9dS5lQ2GCeo5ftFNu0iGb9Hs0=
X-Google-Smtp-Source: AGHT+IGrIee2UMyxZ1TjWISfaNWFFsUV/xQqvtny3X7oWRWZJQq5c4TtrQOvGnVq1jkMQDFxC4rirA==
X-Received: by 2002:a05:6a21:a24b:b0:1d9:6c9c:75ea with SMTP id adf61e73a8af0-1e88d0df9efmr47653820637.5.1737003258724;
        Wed, 15 Jan 2025 20:54:18 -0800 (PST)
Received: from [157.82.204.145] ([157.82.204.145])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a31857cfb2bsm10568472a12.26.2025.01.15.20.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 20:54:18 -0800 (PST)
Message-ID: <b864aba0-fb12-4409-ab82-a7c6ed09674a@pf.is.s.u-tokyo.ac.jp>
Date: Thu, 16 Jan 2025 13:54:13 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] spmi: Fix controller->node != parent->node breakage
To: Stephen Boyd <sboyd@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Konrad Dybcio <konradybcio@gmail.com>, Konrad Dybcio
 <konradybcio@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250113-topic-spmi_node_breakage-v2-1-dd35a3a6daa6@oss.qualcomm.com>
 <5b139af8d639e20a14c8bd00e8e03a4a.sboyd@kernel.org>
 <58cb6c37-0ea0-4866-a2b1-92cb0f0391a7@gmail.com>
 <305d7cf5f0a66efc01181f24d3a288d3.sboyd@kernel.org>
 <91e2bd5b-71fa-402a-82cb-e68d3295804a@gmail.com>
 <848b4dad4f38dc6545b97f7c5007e514.sboyd@kernel.org>
Content-Language: en-US
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
In-Reply-To: <848b4dad4f38dc6545b97f7c5007e514.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_205419_424235_FC20354D 
X-CRM114-Status: GOOD (  12.63  )
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



On 1/16/25 08:16, Stephen Boyd wrote:
> Quoting Konrad Dybcio (2025-01-14 12:37:20)
>> On 1/14/25 19:30, Stephen Boyd wrote:
>>>
>>> Ok, I see that I was reading the already reverted state of the tree
>>> where the 'ctrl->dev.of_node = node' assignment came back. So there's
>>> nothing to do besides drop the patch in fixes, which I already did. We
>>> can then apply this patch to drop the duplicate assignment as a cleanup
>>> and to avoid a refcount bump on the of_node that isn't needed.
>>>
>>> ----8<---
>>> diff --git a/drivers/spmi/hisi-spmi-controller.c b/drivers/spmi/hisi-spmi-controller.c
>>> index 3cafdf22c909..122140b97579 100644
>>> --- a/drivers/spmi/hisi-spmi-controller.c
>>> +++ b/drivers/spmi/hisi-spmi-controller.c
>>> @@ -300,9 +300,6 @@ static int spmi_controller_probe(struct platform_device *pdev)
>>>    
>>>        spin_lock_init(&spmi_controller->lock);
>>>    
>>> -     ctrl->dev.parent = pdev->dev.parent;
>>> -     ctrl->dev.of_node = of_node_get(pdev->dev.of_node);
>>> -
>>>        /* Callbacks */
>>>        ctrl->read_cmd = spmi_read_cmd;
>>>        ctrl->write_cmd = spmi_write_cmd;
>>
>> That works for me, thank you
>>
> 
> Joe, care to send this patch to replace the one you sent previously?

Thank you for the fix and the suggestion. I just sent a patch removing 
the three lines [1].

[1]: 
https://lore.kernel.org/all/20250116044725.2946205-1-joe@pf.is.s.u-tokyo.ac.jp/

Best,
Joe

