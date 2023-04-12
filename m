Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4858AC77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 10:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KGPoMrimq4ykC+CCAmU0vfBHgEx9Wc5sSeoWOQ7Muos=; b=hCA+++42haJyP4Q8jfo+st7/V4
	75/RoD7zfyoV1oBLMLDLYold8yq2ehEHCuDBBbBLg0EGVuw2rlv1WlI01pu0Anbvg2BBF0UcPxETu
	1axSoAs0DJrysn6IpNV8dv+60GlrQcW/M3v6lZ0NBvdeb3KxBoirK3EyqUXkLx4pXadSNNzIc8NER
	B6cZkNkOSSuS4/2wpe/NuMHWYYMt0WemW27MgK9ZvQZEfglSKZSB6jkU3bBHFcT0rHmjR0PiItiGn
	DFwFO9NYbkUlbu6K4iOxCqY4YTqEoYy5qxjQnxOoG4AUdefiLk7MqswVyBV1TEJ/d2XwJCtDfkp4y
	JbyIoKDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmXtK-002h8B-1h;
	Wed, 12 Apr 2023 10:39:54 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmXtH-002h7I-3D;
	Wed, 12 Apr 2023 10:39:53 +0000
Received: by mail-wm1-x329.google.com with SMTP id l26-20020a05600c1d1a00b003edd24054e0so7722912wms.4;
        Wed, 12 Apr 2023 03:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681295990; x=1683887990;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KGPoMrimq4ykC+CCAmU0vfBHgEx9Wc5sSeoWOQ7Muos=;
        b=nk7EYXw1Ck11A+VETjG1M3ziBr3z9h7J/pLLp1qaOO9bYjTOZGD8Z+Mt1H+WNWMGs7
         vgoO38EJ2garxLct10JyNXGnzma39thy3k1VdUY0kr+CBZnJLOu+HXrLHJ46mBet2yw3
         kUtKUKQK9rw45b2T/NgNMK8slwgW3rNVGB9atEnQ77r2Jbx4XFwi2Y5DVExFgY5B2u0W
         jkfD3QEgpAxqq3aJ2zjeivGn6U/YbJdGu7H4XeDF3+G+wh0gNTudngb/SvfHOZioOITh
         HP/1V3fSvyWIZlJmPx7vJNoC4KgrVS1ADE3FtMAHgzV4k1h9AyiESOvs1OHTCo3Asr6Q
         Mc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681295990; x=1683887990;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KGPoMrimq4ykC+CCAmU0vfBHgEx9Wc5sSeoWOQ7Muos=;
        b=Sk9RXzFPufkvlpqjdG+bxsjnW1sck6kI1GwZtZSTej1l6ufpSZnSQYK40+nZqEUMWv
         6mjXGhwPMx2srl2TPvMl5hjnyzaqr9nxjAdif9NaMfA5vOGnvTb0n46WMqPMWoJIb/MY
         pRZ2zLc9qJl4BgGfSd9V5xUHEXLB2z1NMVkOVraZCPam5ZcksfCC9mTj4iS1Mw9h2b+i
         Y8YipIEKXdppLvdRUJrf547MjW7eI/0uSSk/NdBAmvewWoY3SWXqWP2tZs6oMdPzxB/5
         Qi6cU2XD+w2CsgGwFwfvIVkMvqIh4Pjg6WnAf4VMe8zPLQigwaMEKVZ1ahs3Th82l8hl
         Nhyg==
X-Gm-Message-State: AAQBX9dA3SLu7xZCZAFtj35XN20DzJWLYz5nAPsthheunHv9k3hnW2Hc
	mO/i3trcjsvyB7ierZYOPDQ=
X-Google-Smtp-Source: AKy350Zus9gjtjUqe2oU8CgEhLggOze5DqaENaV5ht12OYm2dkXU4dJQKK8YoUOw/rwWYacl7Qr8Qw==
X-Received: by 2002:a05:600c:2284:b0:3f0:a023:2614 with SMTP id 4-20020a05600c228400b003f0a0232614mr558740wmf.6.1681295989743;
        Wed, 12 Apr 2023 03:39:49 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id g15-20020a05600c4ecf00b003edc4788fa0sm2043373wmq.2.2023.04.12.03.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 03:39:47 -0700 (PDT)
Message-ID: <a1136c32-0c29-3803-da15-59b40fcf333e@gmail.com>
Date: Wed, 12 Apr 2023 12:39:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 1/9] drm/mediatek: dp: Cache EDID for eDP panel
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, wenst@chromium.org
References: <20230404104800.301150-1-angelogioacchino.delregno@collabora.com>
 <20230404104800.301150-2-angelogioacchino.delregno@collabora.com>
 <09c61b94-1ed1-eb72-9682-1f1f203f6f63@gmail.com>
 <783c03af-fc88-96c8-c6fc-6f02051dc6b1@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <783c03af-fc88-96c8-c6fc-6f02051dc6b1@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_033952_035646_D233E4E0 
X-CRM114-Status: GOOD (  27.47  )
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



On 12/04/2023 10:06, AngeloGioacchino Del Regno wrote:
> Il 12/04/23 09:08, Matthias Brugger ha scritto:
>>
>>
>> On 04/04/2023 12:47, AngeloGioacchino Del Regno wrote:
>>> Since eDP panels are not removable it is safe to cache the EDID:
>>> this will avoid a relatively long read transaction at every PM
>>> resume that is unnecessary only in the "special" case of eDP,
>>> hence speeding it up a little, as from now on, as resume operation,
>>> we will perform only link training.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno 
>>> <angelogioacchino.delregno@collabora.com>
>>> ---
>>>   drivers/gpu/drm/mediatek/mtk_dp.c | 11 ++++++++++-
>>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c 
>>> b/drivers/gpu/drm/mediatek/mtk_dp.c
>>> index 1f94fcc144d3..84f82cc68672 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
>>> @@ -118,6 +118,7 @@ struct mtk_dp {
>>>       const struct mtk_dp_data *data;
>>>       struct mtk_dp_info info;
>>>       struct mtk_dp_train_info train_info;
>>> +    struct edid *edid;
>>>       struct platform_device *phy_dev;
>>>       struct phy *phy;
>>> @@ -1993,7 +1994,11 @@ static struct edid *mtk_dp_get_edid(struct drm_bridge 
>>> *bridge,
>>>           usleep_range(2000, 5000);
>>>       }
>>> -    new_edid = drm_get_edid(connector, &mtk_dp->aux.ddc);
>>> +    /* eDP panels aren't removable, so we can return a cached EDID. */
>>> +    if (mtk_dp->edid && mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP)

Maybe better like this:
if (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP && mtk_dp->edid)

To in sync with the if statement below. Anyway we are only concerned if it's an 
eDP so check that first (and hope the compiler will do so as well ;)

With that:
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

>>> +        new_edid = drm_edid_duplicate(mtk_dp->edid);
>>> +    else
>>> +        new_edid = drm_get_edid(connector, &mtk_dp->aux.ddc);
>>
>> Maybe it would make sense to add a macro for the check of mtk_dp->bridge.type 
>> == DRM_MODE_CONNECTOR_eDP
>> it would make the code more readable.
>>
> 
> I had the same idea... but then avoided that because in most (if not all?) of the
> DRM drivers (at least, the one I've read) this check is always open coded, so I
> wrote it like that for consistency and nothing else.
> 
> I have no strong opinions on that though!
> 

I think the only reasonable solution would be a macro like:
DRM_CONNECTOR_MODE_IS(mtk_dp->bridge.type, eDP) which in the end is longer then 
open-code it, so probably just leave it as it is.

>>>       /*
>>>        * Parse capability here to let atomic_get_input_bus_fmts and
>>> @@ -2022,6 +2027,10 @@ static struct edid *mtk_dp_get_edid(struct drm_bridge 
>>> *bridge,
>>>           drm_atomic_bridge_chain_post_disable(bridge, connector->state->state);
>>>       }
>>> +    /* If this is an eDP panel and the read EDID is good, cache it for later */
>>> +    if (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP && !mtk_dp->edid && 
>>> new_edid)
>>> +        mtk_dp->edid = drm_edid_duplicate(new_edid);
>>> +
>>
>> How about putting this in an else if branch of mtk_dp_parse_capabilities. At 
>> least we could get rid of the check regarding if new_edid != NULL.
>>
>> I was thinking on how to put both if statements in one block, but I think the 
>> problem is, that we would leak memory if the capability parsing failes due to 
>> the call to drm_edid_duplicate(). Correct?
>>
> 
> Correct. The only other "good" place would be in the `if (new_edid)` conditional,
> but that wouldn't be as readable as it is right now...
> 
> Cheers,
> Angelo
> 

