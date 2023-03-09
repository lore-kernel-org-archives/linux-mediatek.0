Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC07C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 05:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBx6cp7gHlzzyiw50Fcm4ZihmX1Tn6O8/g1KToDdjpU=; b=mLrksTkpIsTkygJvLilw2UHxJb
	45/h19BaXznwgtPjDH2qKf+j8bVBQ1CcArNLhW6EHLLjvLOzwCEwgpM/WBVy8BPeAj3D9QNOhZrHB
	j46r5Tzva5S4y7ekQcUCTz07eBwJMRcgfu1kP16fbjieA9VFOFiLurXWHh1LZZ9nCISCc/fTdXi2Y
	Q8H5VzKcYzUIlPZoiT+nChSfzkYYAH14eTooU+74PLSE0+HsKla1ermNSmlcqOpUSu/fgxZe3JhCr
	dHASBOcC74HT7fUaQ48UhoQKHw3Zq9cIXIjHJrfbjZjIrYbDwz8mK7Y42c8GYM9fk40cLxfiMRbtF
	EbOjg43A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa8rc-007w14-GU; Thu, 09 Mar 2023 05:30:52 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa8rR-007vxe-BS; Thu, 09 Mar 2023 05:30:42 +0000
Received: by mail-ot1-x32a.google.com with SMTP id r23-20020a05683001d700b00690eb18529fso469074ota.1;
        Wed, 08 Mar 2023 21:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678339837;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rBx6cp7gHlzzyiw50Fcm4ZihmX1Tn6O8/g1KToDdjpU=;
        b=pJgTx2ACTWq9Vi/m6xTr+0eLA15KWrFy5Cc+PrMjqyBtghSnyA16i58Diq5jTPrX5N
         NCNugpWvgFqQZo/Tp7uA4T4WGJR/WGSPzW1gqTjhNYRyidWm7hOtWDLxA7fCTCYFBZ8A
         nN05OOFR5JRTYyACfyec5V2qrqBKe79RfsTlaeuBLCSwn5QHIxBsKaKX1kanbr5kVDB/
         +zaBAFHYlokSm0PBilee6sh8OC4UW0qShhRPhzv9Y1gh2/gVP/quAVc9seNK8q9Dw4/x
         MwPbkffTAZbVNXS/w8FE6MzmDp2wywrDABknElejDNX8RrwsDVg60QkSJQxW+bvgvFmE
         2cEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678339837;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rBx6cp7gHlzzyiw50Fcm4ZihmX1Tn6O8/g1KToDdjpU=;
        b=5n4X8fAJSKAfs5iZ7ZVCeXWUHNRS4ALg0QgqOHhl6a7L63Nep8mTfQNO+tqqY+NTvu
         44g+uapQBT3OYuWLPvqV08NOvJPoj+B9Rud6nFG+9DZOKTnb1zw0mvu4wQfC9e8R3SfL
         dKDD1xzzRo/fGCS+YN1a4uw8jwTPw2kkRjEen7OYSR3mshbaSASM6uq58xQRVf6Ia4sW
         UyjO22+aIkC+uEpa6CAEaiKVo806nY2yWaqKOLNZtlKqICP8HNg2pcm+u1WESU2HMiZq
         SpTMCSxMI4RzTba+aKTCCzvO52Ei4RU2ErWRwJSIAaJ8JhcIy1h/jXu7dejhKc7KACy1
         Kq2w==
X-Gm-Message-State: AO0yUKXUbiMdmvH6mfn1ZF01/45zqw15yusyzAHjGwN94KsMZMneSp0Z
	XH16cPa4UccrJw2ao0ismLU=
X-Google-Smtp-Source: AK7set//aNvXJL2L9m465QciZubMY9vK0At6lO6HMUcqeWjKBotFOmPUl7XA1eJJBAKKOrROfAFZJg==
X-Received: by 2002:a9d:378:0:b0:68b:c06f:5e67 with SMTP id 111-20020a9d0378000000b0068bc06f5e67mr1920117otv.37.1678339837297;
        Wed, 08 Mar 2023 21:30:37 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i10-20020a9d4a8a000000b0068bcb290a38sm7146004otf.55.2023.03.08.21.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 21:30:36 -0800 (PST)
Message-ID: <e03134f9-9433-ab6b-170a-8ce752fccdeb@roeck-us.net>
Date: Wed, 8 Mar 2023 21:30:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Zheng Hacker <hackerzheng666@gmail.com>
Cc: Zheng Wang <zyytlz.wz@163.com>, mchehab@kernel.org, bin.liu@mediatek.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 1395428693sheep@gmail.com, alex000young@gmail.com
References: <20230302093715.811758-1-zyytlz.wz@163.com>
 <d27127a1-2572-4ad4-b69c-8a6f53384009@roeck-us.net>
 <CAJedcCxYQYmORfnqcdudFKwy9hhU=mZh_d9MM7x+37ies2S-MA@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] media: mtk-jpeg: Fix use after free bug due to uncanceled
 work
In-Reply-To: <CAJedcCxYQYmORfnqcdudFKwy9hhU=mZh_d9MM7x+37ies2S-MA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_213041_398667_9E0462FB 
X-CRM114-Status: GOOD (  25.74  )
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

On 3/8/23 19:58, Zheng Hacker wrote:
> Hi,
> 
> Thanks for your reply. I think you're right. I don't know if there is
> other method to stop new work from enqueing. Could you please give me
> some advice about the fix?
> 

Top-posting is discouraged.

Anyway -
I don't know the code well enough to suggest a solution.
It all depends on the driver architecture. The maintainers might
have a better idea.

A worse problem appears to be that the worker is also canceled
from mtk_jpeg_enc_irq() and mtk_jpeg_dec_irq(). Those are non-threaded
interrupt handlers which, as far as I know, must not sleep and thus
can not call cancel_delayed_work_sync(). I have no idea how to solve
that problem either.

Guenter

> Regards,
> Zheng
> 
> Guenter Roeck <linux@roeck-us.net> 于2023年3月9日周四 08:27写道：
>>
>> On Thu, Mar 02, 2023 at 05:37:15PM +0800, Zheng Wang wrote:
>>> In mtk_jpeg_probe, &jpeg->job_timeout_work is bound with
>>> mtk_jpeg_job_timeout_work. Then mtk_jpeg_dec_device_run
>>> and mtk_jpeg_enc_device_run may be called to start the
>>> work.
>>> If we remove the module which will call mtk_jpeg_remove
>>> to make cleanup, there may be a unfinished work. The
>>> possible sequence is as follows, which will cause a
>>> typical UAF bug.
>>>
>>> Fix it by canceling the work before cleanup in the mtk_jpeg_remove
>>>
>>> CPU0                  CPU1
>>>
>>>                      |mtk_jpeg_job_timeout_work
>>> mtk_jpeg_remove     |
>>>    v4l2_m2m_release  |
>>>      kfree(m2m_dev); |
>>>                      |
>>>                      | v4l2_m2m_get_curr_priv
>>>                      |   m2m_dev->curr_ctx //use
>>>
>>> Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
>>> ---
>>>   drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
>>> index 969516a940ba..364513e7897e 100644
>>> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
>>> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
>>> @@ -1793,7 +1793,7 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
>>>   static int mtk_jpeg_remove(struct platform_device *pdev)
>>>   {
>>>        struct mtk_jpeg_dev *jpeg = platform_get_drvdata(pdev);
>>> -
>>> +     cancel_delayed_work(&jpeg->job_timeout_work);
>>
>> The empty line is needed (coding style). Also, this doesn't cancel
>> the worker if it is already running. This should probably be
>> cancel_delayed_work_sync(). Even then the question is if it is
>> possible that new work is queued before the device is unregistered.
>>
>> Guenter
>>
>>>        pm_runtime_disable(&pdev->dev);
>>>        video_unregister_device(jpeg->vdev);
>>>        v4l2_m2m_release(jpeg->m2m_dev);
>>> --
>>> 2.25.1
>>>


