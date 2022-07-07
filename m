Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C3BC43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 14:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7RZhPlwt1IWmYSR6QIVRvM1HZdmbksMxnLZ6G0dxCYQ=; b=kgn/KTFhP5Alpf3FqA4+PADjnr
	yeGGbYWg59fSWwm1oxIIoUFnNUli0rZxJSpSuIazkMIsxY+/la6pmE3IewrnYgqJ0Bool7Aq9uvp6
	h0mrCKvg2zasZ4zXDttFIcFxkzZfT5hYVKIBByH8nacmRUYmYpme42xDtrj7c4ZymoObcc9st2221
	ONaxdT+A9xJgLA0db/0WS75h3fDlumyGzj5NwaCjsm4G+RexqiF2i9l5BrUm7nMnrUpxMwAiyl0CH
	TiE1OiD9nlgmHS3VuGl/G87oMMST+yNJbYWqhPRtFbgamd5vO06OuZ+YiYdKKRWT/LrWU88bCQE+l
	9ykYO+Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Ssk-00GdGf-Ap; Thu, 07 Jul 2022 14:53:30 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Ssg-00GdDQ-GY; Thu, 07 Jul 2022 14:53:28 +0000
Received: by mail-io1-xd2c.google.com with SMTP id 190so952534iou.6;
        Thu, 07 Jul 2022 07:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7RZhPlwt1IWmYSR6QIVRvM1HZdmbksMxnLZ6G0dxCYQ=;
        b=dbVWNRlsTl7pk7ptifukmXY/Z4krWR8gWS1OPftdqSoHwDjWWnGVMVy30wrrJmPKKM
         m0ZjLpTxKOMe2z/X6TWznoYb3kbkXITLAxeWjACt51IJ9WoapHp2v1xGaRa9UDPSfk7X
         GpEOzxaenVdYrb//0k6tqNyS2ahPCcwz9r6jjuTurfbgqiOUgMcHkoLGNCx80BPAwRkb
         cqxPGv08JM1nzHaSW8paawSNd7Zk81EwVEk0stflMy7AX3tTrPs4FAgk+NK+wQg+euEt
         BYzYXF1shibZRX60BLl6dzud3s0hIauMRUtUgOp2j6JbGhDl4wOG53FHmw1ki6dzr9De
         07dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7RZhPlwt1IWmYSR6QIVRvM1HZdmbksMxnLZ6G0dxCYQ=;
        b=AXN+DfeoMg7jikXzfHxyCOIyOVpJhDbXQGU54xQ7rypR9VF/a+5Rad54xuoNw5XjpO
         QrenbKnhXZUjBiKViLvmF21jEx8tbMmo1wR5OQ4IpAJ/wjCfWFyv5xn+r+hvQMs4FLWO
         KXKR11WHaePdipvOBSa4JEp3MmqadOo4OF6PMwGlUKlUrpeMob97Mgt6ELUBlOsLaLAt
         2MzI/yo+upZEViWpkDWL08JD8JMAmIfflivVlcSsaNmj2kD1gPTq8CNzZv7DkYorKEiQ
         Jyh6aDu+trTD9CpPsN9zinYFUdao5hVO1Duk/e8K9N0XyTArtS4EqcmPsMbWQf7XXbKO
         tOsA==
X-Gm-Message-State: AJIora+T15NKO9Q4WkEffJyKQCwQDAb2BtfwsAebLUOEBz2diY27OcO7
	kEQq12yMorj5QbLH5rMqaO3+71q0BYGspw==
X-Google-Smtp-Source: AGRyM1trLe7RvY+9Rq0/Nq/y6Bbr3vIvsEr0rsX6bbBeVsNbTLy47V5SXuWGN+FGfuJ/2U+3fJpyLw==
X-Received: by 2002:a05:6602:154b:b0:675:8bce:8a5 with SMTP id h11-20020a056602154b00b006758bce08a5mr24784705iow.108.1657205605448;
        Thu, 07 Jul 2022 07:53:25 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id w1-20020a5ed601000000b00675305c58bdsm14794205iom.18.2022.07.07.07.53.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jul 2022 07:53:24 -0700 (PDT)
Message-ID: <15fe441c-205e-2953-44b4-d3c377cba7b1@gmail.com>
Date: Thu, 7 Jul 2022 16:53:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] arm64: dts: mt8183: Add panel rotation
Content-Language: en-US
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Rob Clark <robdclark@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220530113033.124072-1-hsinyi@chromium.org>
 <20220530113033.124072-2-hsinyi@chromium.org>
 <CAJMQK-jw+sgunEwgEQAw-V8DAbybZ7WVnZJ6vwOdzQ+-SX_bQg@mail.gmail.com>
 <c3286fc9-06ed-d1e1-a731-94cdefdf7fab@gmail.com>
 <CAJMQK-gJ4AoNQtLeKoOO=GLLtjDRhCdVnYuPJSBD4ZnFWJ5qrw@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAJMQK-gJ4AoNQtLeKoOO=GLLtjDRhCdVnYuPJSBD4ZnFWJ5qrw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_075326_595452_71847174 
X-CRM114-Status: GOOD (  20.28  )
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



On 17/06/2022 16:25, Hsin-Yi Wang wrote:
> On Fri, Jun 17, 2022 at 10:10 PM Matthias Brugger
> <matthias.bgg@gmail.com> wrote:
>>
>> Hi Hsin-Yi Wang,
>>
>> On 06/06/2022 17:29, Hsin-Yi Wang wrote:
>>> On Mon, May 30, 2022 at 7:30 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>>>>
>>>> krane, kakadu, and kodama boards have a default panel rotation.
>>>>
>>>> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>>>> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>>>> Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>>>> ---
>>>
>>> Hi Matthias,
>>>
>>> The series ("Add a panel API to return panel orientation") might land
>>> in drm-misc. With this series applied, we can add this patch to give
>>> the correct default orientation for mt8183 kukui devices.
>>> I didn't send this patch again with the series, since they might land
>>> in different trees.
>>>
>>
>> I had a look on Linux next (next-20220617) and wasn't able to find the mtk_dsi.c
>> changes. What is the status of this?
>>
> The mtk_dsi change got dropped. The latest is this series:
> https://lore.kernel.org/lkml/20220609072722.3488207-1-hsinyi@chromium.org/,
> still waiting to be picked or others' comments.
> 

I saw this got merged, so merging this patch now.

Thanks!

> If the dts patch is picked without the drm series, there will be a
> WARN, but won't affect boot or display up.
> 
> 
>> Regards,
>> Matthias
>>
>>> Thanks.
>>>
>>>>    arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>>>> index 8d5bf73a9099..f0dd5a06629d 100644
>>>> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>>>> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>>>> @@ -276,6 +276,7 @@ panel: panel@0 {
>>>>                   avee-supply = <&ppvarp_lcd>;
>>>>                   pp1800-supply = <&pp1800_lcd>;
>>>>                   backlight = <&backlight_lcd0>;
>>>> +               rotation = <270>;
>>>>                   port {
>>>>                           panel_in: endpoint {
>>>>                                   remote-endpoint = <&dsi_out>;
>>>> --
>>>> 2.36.1.124.g0e6072fb45-goog
>>>>

