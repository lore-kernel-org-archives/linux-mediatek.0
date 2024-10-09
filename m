Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923B2CF0430
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 02:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=weUUuRAoghyBz6FgerXA1YixGamIMNDhvhsUYrGfjKg=; b=Ru4vnMF+0vut58MdOl8LLHbW4Q
	msSVRWEZLkFyCxiPzBWcDAv0QBJxsBb7s/lefj9qwvady19gEot3i+V3AoFN8p80Vr+HB/AwoAVuG
	Rn+iYyuO35RrszAd/VLaxbMX/fGAMdKkN5TaYRQb82FQzzM/WXyNrZwNOGkpo/cNdXvUiGugl6ctN
	QHiq1jgagGF5m6h2r0XH/b6RHv02WV+BkzmsbWVcVck386NXe7qPDo1w3MX1JrGj2cpXb8ZEOf/pl
	a8/iZytHYNqUQTuv24fO9QfZj8EqtMp5RyifpGEoEyAnAFz6OJXf6zBrPxkOuCHtqgDNrYJHLtY9g
	qxOSk3pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syMNH-00000007hnF-1JVJ;
	Wed, 09 Oct 2024 02:24:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syMLy-00000007hcT-0DaG;
	Wed, 09 Oct 2024 02:23:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=weUUuRAoghyBz6FgerXA1YixGamIMNDhvhsUYrGfjKg=; b=gZQbTtku1du57GgjOloFcXDmJO
	wz2tbBxHo4sLncigWoTb4hvjPKbuVn9Z3x2BmEqACwWWjuI9yAb9IeeCQMK2jgXnlj0imv3exufxJ
	tLaLc85C4uHwVvbXSed8VwYRpdxBBStuRf3QcrEfyAvok0R8ifVp6zEg82DW5ruPAjpfjkftqONma
	k6w2a2Ovuec+qRASi3x/yz7jdkoLCoYW8fcDXld7c8M0JUw0LJUv335lNk4id/r2zeJpBN1E2KI+B
	jaZZGV4GPwmLTjpTck+sArjh3ki2rCtU3ZdLc88EL+sQttsBfTSdMzittsGzq/2AYTpCwSLqRoOSk
	OB4p2EaA==;
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syMLt-00000004nsf-1Rib;
	Wed, 09 Oct 2024 02:23:04 +0000
Received: by mail-qk1-x741.google.com with SMTP id af79cd13be357-7afcf50e2d0so32941285a.3;
        Tue, 08 Oct 2024 19:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728440576; x=1729045376; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=weUUuRAoghyBz6FgerXA1YixGamIMNDhvhsUYrGfjKg=;
        b=KLy3WTIIMiRWasNbDOEG67uihHoBHBfHC/MGzwM+kzcb9N4kw/M+FP6/KfHSO0rZGn
         VuWTK5ibWy1w6zO9iRqascMI1gof2o34q/f+hsDqOZDfRh+5qw1pQdRLMfje+I0Cptd0
         Ub5eSbjiPNYpTYPu903tzyN79TLBhHkGhuey783pZZv0ZcGPKBZh8LB4YKqDQ77yv9UT
         7O10db6ric4Yoqp0Xmb+kADXVeAu5Z1sYfAZ1v+jAFgTGMP0qfyqhoLXYu2QFRBdfc94
         rUn4Or6ULXkVDnPjZlMhqp6OTvvDBzQGHqRQfcw1yARIaoVBfY66ch2CZmc3yvFPG3Uk
         RPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728440576; x=1729045376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=weUUuRAoghyBz6FgerXA1YixGamIMNDhvhsUYrGfjKg=;
        b=qtLnny2MKwPkoR/CsVPX5sbAVUMMCUENzzGPedNfuNsLRiX8mxPUl8vk7eOOmRFWHr
         R32KJ4FMNqp851GSHdJKwBY4w4IpJgB5c2Y1rsPDvlk6WFgQCv/+WKj61U3evVJ+CHj/
         GFXa6HJDL7WgmofWcDia5AlgnMQx0YGNvqMxawM7MBfJ3FDjtGyWHXIci9YwUyjPZ2PB
         rp8J6Z0CbH6tPg//YtzV3Jh43EhhHd6PyZmLsFRn0pvxuGKAnJC46ajmq9xlnt2uUA23
         BYhO6ZZdUtWe/s1Rcnc3s5osKsgBZg0wVvdzrwcXK3jKgzPPw5jVBOE7tdoEhLFSeKPz
         24jg==
X-Forwarded-Encrypted: i=1; AJvYcCW1K4vsjSGcNVYc/GiRcI8uTuaAf+hxEd8pvO0L6OSbyGfB5sGv/6sCRMCKZ7PTXf0fY/ji3EKwklcIuo1VDig=@lists.infradead.org, AJvYcCXnS5Q2ytj5F2Yg97gB7r6YnYYmH0Djyri6c2iI+QG5ge24Oe1BKi0L4KuhB2tEfQl8klSl94yCk+zY9CeGNrTH@lists.infradead.org
X-Gm-Message-State: AOJu0YxSAL9wC/r1peJgZwEQ6Tai5aMU1ZqR2B20gMNYmY0sE1EgBJ3T
	Jm2yxb4Yo+CUY5u2uPV3IAAi6Z4DjGvBlKrkcCD3i3wbcwHXVDWQ
X-Google-Smtp-Source: AGHT+IEwxJNvuKRSiqyXP2M2lr4oU40745qAIbLo93EQkHwaH7MNfxd5KNVlwE3LpA96Ps5I4tmMlg==
X-Received: by 2002:a05:620a:410f:b0:7af:ccb5:c8e6 with SMTP id af79cd13be357-7b07953a4bfmr150264285a.18.1728440576377;
        Tue, 08 Oct 2024 19:22:56 -0700 (PDT)
Received: from [10.194.139.248] (mobile-130-126-255-54.near.illinois.edu. [130.126.255.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae756611b5sm414861485a.77.2024.10.08.19.22.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 19:22:55 -0700 (PDT)
Message-ID: <3262c5dc-42e1-4e02-b77f-d11e9cd3d08b@gmail.com>
Date: Tue, 8 Oct 2024 21:22:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] wifi: mt76: Fix NULL Dereference caused by
 mt76_connac_get_he_phy_cap()
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com,
 shayne.chen@mediatek.com, sean.wang@mediatek.com, kvalo@kernel.org,
 angelogioacchino.delregno@collabora.com, johannes.berg@intel.com,
 quic_adisi@quicinc.com, deren.wu@mediatek.com, chui-hao.chiu@mediatek.com,
 mingyen.hsieh@mediatek.com, howard-yh.hsu@mediatek.com,
 StanleyYP.Wang@mediatek.com, allen.ye@mediatek.com,
 benjamin-jw.lin@mediatek.com, Bo.Jiao@mediatek.com,
 evelyn.tsai@mediatek.com, meichia.chiu@mediatek.com,
 linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, chenyuan0y@gmail.com, zzjas98@gmail.com
References: <20241003180959.12158-1-zichenxie0106@gmail.com>
 <e116a42e-877e-439e-a83d-1afbaf35748b@gmail.com>
 <CANdh5G4mnj-N1gV=O=OiFFrZYFP+nzjte2dZTCAobzBHxSdhpA@mail.gmail.com>
 <7daf8976-91ee-4045-a9a7-d9d14d53c6dd@gmail.com>
Content-Language: en-US
From: Zichen Xie <zichenxie0106@gmail.com>
In-Reply-To: <7daf8976-91ee-4045-a9a7-d9d14d53c6dd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_032301_987805_4FF4F9ED 
X-CRM114-Status: GOOD (  17.33  )
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


On 2024/10/7 14:13, Matthias Brugger wrote:
>
>
> On 07/10/2024 17:36, Zichen Xie wrote:
>> IMHO, using operator "&" for a NULL dereferenced pointer won't cause a
>> crash. 've' will only be assigned to a invalid address.
>>
>
> Please don't top post.
>
>> So we can put off the NULL check after
>> 'const struct ieee80211_he_cap_elem *ve = &vc->he_cap_elem;'
>>
>
> You are right, nevertheless for better code readability I'd still 
> advise to change the code so that vc is checked for NULL before any 
> use of struct vc.

The code snippets here does the same thing like me.

https://elixir.bootlin.com/linux/v6.12-rc2/source/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c#L1547

Should I also repair it for readability?


>
> Regards,
> Matthias
>
>> Best Regards,
>> Zichen
>>
>> On Mon, Oct 7, 2024 at 9:23 AM Matthias Brugger 
>> <matthias.bgg@gmail.com> wrote:
>>>
>>>
>>>
>>> On 03/10/2024 20:09, Gax-c wrote:
>>>> From: Zichen Xie <zichenxie0106@gmail.com>
>>>>
>>>> mt76_connac_get_he_phy_cap() may return a NULL pointer,
>>>> leading to NULL Pointer Dereference.
>>>> Add a NULL check for the returned pointer.
>>>>
>>>> Fixes: a5c372f77aa7 ("wifi: mt76: mt7925: extend 
>>>> mt7925_mcu_bss_he_tlv for per-link BSS")
>>>> Fixes: e6d557a78b60 ("mt76: mt7915: rely on mt76_connac_get_phy 
>>>> utilities")
>>>> Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek 
>>>> Wi-Fi 7 (802.11be) devices")
>>>> Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
>>>> ---
>>>>    drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 5 +++++
>>>>    drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 2 ++
>>>>    drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 2 ++
>>>>    3 files changed, 9 insertions(+)
>>>>
>>>> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c 
>>>> b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
>>>> index 87d0dd040001..762be3a37228 100644
>>>> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
>>>> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
>>>> @@ -551,6 +551,8 @@ mt7915_mcu_bss_he_tlv(struct sk_buff *skb, 
>>>> struct ieee80211_vif *vif,
>>>>        struct tlv *tlv;
>>>>
>>>>        cap = mt76_connac_get_he_phy_cap(phy->mt76, vif);
>>>> +     if (!cap)
>>>> +             return;
>>>>
>>>>        tlv = mt76_connac_mcu_add_tlv(skb, BSS_INFO_HE_BASIC, 
>>>> sizeof(*he));
>>>>
>>>> @@ -1145,6 +1147,9 @@ mt7915_mcu_sta_bfer_he(struct ieee80211_sta 
>>>> *sta, struct ieee80211_vif *vif,
>>>>        u8 nss_mcs = mt7915_mcu_get_sta_nss(mcs_map);
>>>>        u8 snd_dim, sts;
>>>>
>>>> +     if (!vc)
>>>> +             return;
>>>> +
>>>
>>> That will already blow up at line:
>>>           const struct ieee80211_he_cap_elem *ve = &vc->he_cap_elem;
>>>
>>> This needs some more code changes.
>>>
>>> Regards,
>>> Matthias
>>>
>>>>        bf->tx_mode = MT_PHY_TYPE_HE_SU;
>>>>
>>>>        mt7915_mcu_sta_sounding_rate(bf);
>>>> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c 
>>>> b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
>>>> index 748ea6adbc6b..55e4cda2f20f 100644
>>>> --- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
>>>> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
>>>> @@ -2508,6 +2508,8 @@ mt7925_mcu_bss_he_tlv(struct sk_buff *skb, 
>>>> struct ieee80211_bss_conf *link_conf,
>>>>        struct tlv *tlv;
>>>>
>>>>        cap = mt76_connac_get_he_phy_cap(phy->mt76, link_conf->vif);
>>>> +     if (!cap)
>>>> +             return;
>>>>
>>>>        tlv = mt76_connac_mcu_add_tlv(skb, UNI_BSS_INFO_HE_BASIC, 
>>>> sizeof(*he));
>>>>
>>>> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c 
>>>> b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
>>>> index 6c445a9dbc03..55bb2d0e67e5 100644
>>>> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
>>>> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
>>>> @@ -798,6 +798,8 @@ mt7996_mcu_bss_he_tlv(struct sk_buff *skb, 
>>>> struct ieee80211_vif *vif,
>>>>        struct tlv *tlv;
>>>>
>>>>        cap = mt76_connac_get_he_phy_cap(phy->mt76, vif);
>>>> +     if (!cap)
>>>> +             return;
>>>>
>>>>        tlv = mt7996_mcu_add_uni_tlv(skb, UNI_BSS_INFO_HE_BASIC, 
>>>> sizeof(*he));
>>>>

