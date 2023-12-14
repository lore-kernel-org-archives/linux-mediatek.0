Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280DBC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Dec 2023 12:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/2CpqYu2Yz1Ozrx0CUYVWM6SPUKyooHq2Zq4S2qE3CE=; b=hZtzNRKaAGxPDjlR2nGSsiodqD
	OUWF1AR4Z89d13TgEUa3FHypxJVKf+NozvPjNwp/Gsjwoqmz1AYr7HaqU4vGknJ0QW9s0mDZ3Gtvb
	0z6DtKu0RCx36jeWhuNnbe0XHswytYi0ePetjVs9RL8JPNZYhOGhieUvBGd/4yfqjRJXVHr3tf64f
	zUeYFcOFt5MESc6f3jTkoKgkENkNr700OJsHnhOMYcGaMLTxjxlcr3YnBSBCWyJcrD9plsK6Abbwu
	Fb4nQpp8jYC0sn1bY0Th214EsHtEcFh85zyGnvj79GWv5a8kQT0qE9N4D4VkC51FzQjxZ4MkBE1Np
	xLE7EBDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDkzw-000IoE-2s;
	Thu, 14 Dec 2023 12:39:28 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDkzt-000In1-2l
	for linux-mediatek@lists.infradead.org;
	Thu, 14 Dec 2023 12:39:27 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3ba2dc0f6b7so916564b6e.2
        for <linux-mediatek@lists.infradead.org>; Thu, 14 Dec 2023 04:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702557563; x=1703162363; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/2CpqYu2Yz1Ozrx0CUYVWM6SPUKyooHq2Zq4S2qE3CE=;
        b=flAG74PqRPO/v99JvlqgnSRfPjFHwtn499GThel5UAsSaPNYag1nuq7NW64yMJkFOO
         fcFhkvyco2bZvZu+G/5tI1ACx6WSY6xns4NeEWKCC2ptD2aFYH3R0/zov4Yy3M/HvIVr
         1RiseGMAYwwSGRG2Zm0dt2/H1dX354HbGxZins/JIHiqgPGQ819vnguV/znTAJ8mG76l
         pza9eS58N9t8T50PEfcgLeI6a60u+hn5GSPEECNgFxkTcJJ+qFB/+YU8nqJMykCKKH0h
         b38qgvX0N+Hy5R+eWWiRD1BwG/087UmrjioUs7ICkI8vPAyHWpOAdPdZiJnXLyyMPKgq
         9ygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702557563; x=1703162363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/2CpqYu2Yz1Ozrx0CUYVWM6SPUKyooHq2Zq4S2qE3CE=;
        b=GYrj9xyHCpODdKEPiysDdMKLmUd0Tv47VqMwg+SrzEidpnOzckIwlbAIEafrHhsaaN
         s4T6wwmzKlnaeUIQ7pYCXt/bCJh9VDEpE/VMqPqkZ9LNlmOpgvsq2Izo/vWaVBXOR4DY
         jeEtVbcOPs/OTsxQayDstidY+/prVQ9Y/dYRUwKj1+bTiWql6nud9S8S2HD7syqTS+Gq
         CZPtRvQn3QezttLPTohnzT3yjl+rOz30DyQ3j9ecRg/Mx0Phs0olgKv5eDzyPGIUTkgl
         z27X8g5B3Vj4GGiHpEnOdLGq8iCR6pAmeXsb1atVQPbgSRK2t868PZwK47zOgxJFK2MI
         XCng==
X-Gm-Message-State: AOJu0Yx4vArWXssP1ewSPZk5rFlGQZmmJlDtPPeVqW7mUgrwr6htEzsL
	93VYRKoTkaYN/Y/5koH47s0=
X-Google-Smtp-Source: AGHT+IGPMLwm24ar1acxnS3uJOwx1vCUvY364Zwt7fHWyytA0SrFUbX3usGL3teXpIfhBy+VQwBCpw==
X-Received: by 2002:a05:6808:bc7:b0:3b8:b063:5048 with SMTP id o7-20020a0568080bc700b003b8b0635048mr11757906oik.73.1702557563334;
        Thu, 14 Dec 2023 04:39:23 -0800 (PST)
Received: from [10.102.4.159] ([208.195.13.130])
        by smtp.gmail.com with ESMTPSA id or15-20020a05620a618f00b0077da7a46b0fsm5250357qkn.69.2023.12.14.04.39.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 04:39:23 -0800 (PST)
Message-ID: <e0fbe9cb-22de-462f-9123-14a220d5a9c6@gmail.com>
Date: Thu, 14 Dec 2023 04:39:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: mt76: mt7921: Disable powersaving by default
To: Mario Limonciello <mario.limonciello@amd.com>,
 Ben Greear <greearb@candelatech.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Kalle Valo <kvalo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Deren Wu <deren.wu@mediatek.com>, Ming Yen Hsieh
 <mingyen.hsieh@mediatek.com>,
 "open list:MEDIATEK MT76 WIRELESS LAN DRIVER"
 <linux-wireless@vger.kernel.org>,
 "open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Sultan Alsawaf <sultan@kerneltoast.com>
References: <20231212090852.162787-1-mario.limonciello@amd.com>
 <874jgmnud8.fsf@kernel.org> <ZXmxD1foASMaCDIe@lore-desk>
 <d92c081e-47dd-5c57-a6f1-bd72b2748141@candelatech.com>
 <1ef12773-74ca-489c-b36b-d3cf7da22c43@amd.com>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <1ef12773-74ca-489c-b36b-d3cf7da22c43@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_043925_894228_DAB9EF49 
X-CRM114-Status: GOOD (  14.42  )
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

On 12/13/23 11:27, Mario Limonciello wrote:
> On 12/13/2023 08:45, Ben Greear wrote:
>> On 12/13/23 5:26 AM, Lorenzo Bianconi wrote:
>>>> Mario Limonciello <mario.limonciello@amd.com> writes:
>>>>
>>>>> Several users have reported awful latency when powersaving is enabled
>>>>> with certain access point combinations.
>>>>
>>>> What APs are these exactly? In the past 802.11 Power Save Mode was
>>>> challenging due to badly behaving APs. But nowadays with so many 
>>>> mobile
>>>> devices in the market I would assume that APs work a lot better. It
>>>> would be best to investigate the issues in detail and try to fix 
>>>> them in
>>>> mt76, assuming the bugs are in mt76 driver or firmware.
>>>>
>>>>> It's also reported that the powersaving feature doesn't provide an
>>>>> ample enough savings to justify being enabled by default with these
>>>>> issues.
>>>>
>>>> Any numbers or how was this concluded?
>>>>
>>>>> Introduce a module parameter that would control the power saving
>>>>> behavior.  Set it to default as disabled. This mirrors what some 
>>>>> other
>>>>> WLAN drivers like iwlwifi do.
>>>>
>>>> We have already several ways to control 802.11 power save mode:
>>>>
>>>> * NL80211_CMD_SET_POWER_SAVE (for example used by 'iw set power_save')
>>>>
>>>> * CONFIG_CFG80211_DEFAULT_PS (for kernel level default)
>>>>
>>>> * WIPHY_FLAG_PS_ON_BY_DEFAULT (for the driver to control the 
>>>> default setting)
>>>>
>>>> Adding module parameters as a fourth method sounds confusing so not
>>>> really a fan of this. And the bar is quite high for adding new module
>>>> parameters anyway.
>>>
>>> agree, I think we do not need a new parameter for this, just use the 
>>> current
>>> APIs.
>>
>> Is there a convenient way for a user to make any of those options 
>> above stick through
>> reboots?
>>
>> To me, the ability to set system defaults through reboots is a nice 
>> feature of
>> module options.
>>
>> Thanks,
>> Ben
>>
>
> Some userspace has the ability to do this.  For example in Network 
> Manager:
>
> https://unix.stackexchange.com/questions/595116/wi-fi-powersaving-in-networkmanager 
>

And recently added to IWD for this very reason, there are no decent ways 
to persist between reboots (except when using NM).

https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=29edb1626d88bb713db71f7b374d8f24832fd94f

Thanks,

James


