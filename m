Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F301C61DB9
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2026 03:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KcCMs6Dmp6e/c61eU4qREyq4ydHiJTI5GYvkaDUBoPU=; b=vSjuPoSAnYhwcOsaLD1cDK6ASC
	x6vmJJ28RE1nNdcZ7ONb9qIfiqNv2IzTOyOscOaMPtCuIqRlVa3UJwypQ4jxTQDTfTsA5+ZSicaRN
	ebSdHFlVr+4rZ7v6FkOk6KvJEVAsKk9sqb/LZzlRPOsQbK8eaalMz31nVpMUWD6VpFi1YtkKjiFgJ
	f4/3zreMy5RsKqQKuLyC28OFZf/qmhE06ccVAkzWc/+T1OkEHjqBirlu4YHpLhnv0LzM+WuQC5rVW
	97WUhUfYjVm4sgCYMs5UjH2/NDRQ6Uvi7hDGYMJQxtYG6lbhtvHbFag+DQ0g4xgmBWt1jRY7lDCzw
	eIt7Z+3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzmxK-000000052yD-3jhX;
	Fri, 28 Aug 2026 03:08:38 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzmxC-000000052xJ-2f3y
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Aug 2026 03:08:35 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2d71e253c90so5207845ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Aug 2026 20:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787886509; x=1788491309; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KcCMs6Dmp6e/c61eU4qREyq4ydHiJTI5GYvkaDUBoPU=;
        b=KP7W+2OpkNSqX1fiwGJMoW0u+XkfD3wr10cN9OPWiTDrkmFgfHxn0xGil3DzEmVt6p
         XSo7PD0m8DHhdHXV4YUZ9A0GC4f+HanXYMVdqqPA6Q9sldgEasFtk/F9ziP1taVreXC9
         Jizaeij+Kh4iwzyfbRfCVCbvYk5E4l1B8vGMcffxOD0KGPh+QOGOUjjpyvTds1zEm+fR
         vRWUAznvuEPXRFEg91pxlEdxPW/CHuNy0J4DfBj+FrbNwyKM802FlmYEfrWe70z1f31F
         NgAsmIEEy935h6O7D2pgQDzknLywEyzz0C4xD5UMgVLnWYQmjyRkJ98fsHKAW0Ai0bLS
         l+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787886509; x=1788491309;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KcCMs6Dmp6e/c61eU4qREyq4ydHiJTI5GYvkaDUBoPU=;
        b=n+aFSnkLTFqSNS9VlTJTCf0bWF+AvwdThMIpFU8k6rmErFF9w4G1+2mjPZSNC0uu0Z
         PP+8jVffUTCOAO/bUrqrSnQuPyDvN6n7S9TjtOF4zyJ61aqmgVDMKBg6XiPedJU6YWBO
         ecQlm0ENRPkeEt4Zq/NnacS9DKo2IDDfN9azFE5MuklxVtavsnzIGe/M4MbXDQTsjAO1
         amhkxu69ecsqIdKM5areroQF8CqAJs14GR/MnKnjvCa77F1bVjR8XOk7/pWXpCZJGdTV
         aONJ+rj9/+fgtXEZRA3uGdieaPudXxsoA4L9sAZYRgWyZOW4qbWKE9uTPktp5tV/W9fz
         tmeg==
X-Forwarded-Encrypted: i=1; AHgh+Rrzx7o642ECAEVyf2EJHTkRIv1fB+NYv8nSeZfEy8t3AIExFknz5IC/ZtkNO3P61mybHFwmO7sH8JZ0RJF4xg==@lists.infradead.org
X-Gm-Message-State: AFuF++mwt1nKiom7OKGoXoSLelGZkhu4fdeKLhyutT7hCKBRGCYQ+KTB
	NAcBcrky2aE8sMnTEvtBGMavSwo90thH/yP5ieP/GZsSR6WLCCxubwYPNAhSgg==
X-Gm-Gg: AR+sD11vqq/OTqKYqJXhFa+AVR05hKQRA4GfzX7kIiV8XFWeZoWioDInSDZ33229Od4
	P1AId8JCRDVUBX5JXdN6IFo8+QChsRz6WbiLXqAsY/c+XvvClrQgCGIDSH/m0qe3fiqmV5tvhnn
	/hi5S7G4J9nZaVzIuQyiA35fdM6MXkTPaZnF52xufiPpjPKhy8AYsYLvchS8OUiUuiitDCpoD+D
	f/KDflmCj/G6rYxVl2UR0J8RQTm2EHXZ3FKi+vN9gHku61phpOap8tgFK9oBltJtnS/QZT66kEK
	cWAqh6nhcjyjGBFjP6aIw+CKBZAvIKYjaJVyNAOLhKngAReMLaJRRGsFVVlwtn/KWdqxkhNRJ3Y
	AGgYLZ9d14RxeybeCARTT2wNCYhpwxFWWUGzP4wM8/dw3Uk/p5GhNzrGoSxSEUzJlSskMyLf8mg
	CyP3Om6njip/Q9nuRbcsoL0yjR01lyU8xfYV/M/i/mLBCjzjYbnGRqvnIb0Tep8TGwbgeakylxW
	QW0OhQ0YDAMYWD2eI3SvE1Lrno2YeyLxaKIXg==
X-Received: by 2002:a17:90b:17c7:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-396d0fc1b2fmr7004791a91.16.1787886509555;
        Thu, 27 Aug 2026 20:08:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9595bbsm926366eec.14.2026.08.27.20.08.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 20:08:28 -0700 (PDT)
Message-ID: <1bc0aeda-aa67-4541-85cb-752017f376eb@roeck-us.net>
Date: Thu, 27 Aug 2026 20:08:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] watchdog: mediatek: acknowledge pretimeout interrupt
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Wanming Gao <wanming.gao@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wallace.yu@mediatek.com, Jarried.Lin@mediatek.com, vince-wl.liu@mediatek.com
References: <20260827092616.2724197-1-wanming.gao@mediatek.com>
 <5e1793d5-6c78-4372-872a-069fcd99a07a@roeck-us.net>
 <apDtp62h_4uZQ84H@google.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <apDtp62h_4uZQ84H@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_200833_871332_B64909E4 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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

On 8/27/26 19:08, Tzung-Bi Shih wrote:
> On Thu, Aug 27, 2026 at 06:54:03AM -0700, Guenter Roeck wrote:
>> On Thu, Aug 27, 2026 at 05:26:12PM +0800, Wanming Gao wrote:
>>> The MediaTek watchdog pretimeout interrupt is level-triggered and does
>>> not have a separate acknowledge register. The interrupt is cleared by
>>> changing WDT_MODE_IRQ_LEVEL_EN and then restoring it to its original
>>> state. Without this transition, the interrupt may remain asserted and
>>> cause an interrupt storm.
>>>
>>> After changing WDT_MODE_IRQ_LEVEL_EN, wait 70 us before restoring it.
>>> This is longer than two 32 kHz watchdog clock cycles, allowing the
>>> level change to propagate across the clock domain.
>>>
>>> WDT_MODE is also updated by the watchdog start, stop, and pretimeout
>>> operations. Protect its read-modify-write sequences and the complete
>>> IRQ acknowledge sequence with the watchdog spinlock so that concurrent
>>> updates cannot overwrite the temporary IRQ level state.
>>>
>>> Signed-off-by: Wanming Gao <wanming.gao@mediatek.com>
>>
>> Applied.
> 
> Might be a bit late, but tested on a MT8196 board:
> Tested-by: Tzung-Bi Shih <tzungbi@kernel.org>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

Never too late, really, unless I already sent a pull request.
Also, I have not pushed anything out, waiting for v7.3-rc1.

Thanks,
Guenter


