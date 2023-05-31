Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BAAC77B7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 May 2023 07:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4X5Wohwv6l7HU9svLxZYiAxT8tGzCt99NLg9x4sH48=; b=1eXW4X+PKChsHaWx27KKTrykFJ
	Q6AwnUKbP+CjCoVkFE9jiX48B7ewoRpUEvBSdvqiLxF/1UZ0xxNx/HQWBq/sXNvBzCPa7HkctY9/I
	uaGBC+Zygk2r5yYIfFavnZ66NmeC1AAQ9NKhrnup6rblDyPm2gr3E36yzlzOQ9Xys+QTNcd+RIwMg
	za8ICX3ixIXM473Ud4Ix5lkiw68PreZgm7o2ELB/ho53K5/ArTLqzVwGDBSklkxLYV2aADeIWtwl/
	UQe0tzgBomwIDtKvqMPyCQuo5UyYYw+XKm/93MKPw3Dwm6iUTPXNOd/2sf0sI/+E2N5uUv8GZIwid
	hOjMuyNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4GF2-00GR2y-1r;
	Wed, 31 May 2023 07:27:32 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4GEz-00GR0W-0O;
	Wed, 31 May 2023 07:27:30 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f6077660c6so39113025e9.0;
        Wed, 31 May 2023 00:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685518045; x=1688110045;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y4X5Wohwv6l7HU9svLxZYiAxT8tGzCt99NLg9x4sH48=;
        b=P25pgQT4ztxcFXczUNWGPi84IBW6g/Jd+safyXGsj1qyVbTfUqAwQUh05EY1POVK00
         USnZasIvT7j38RpnlHdUc6+WdRdVJ7Hn5Be6yGxWeD4upOozgjPRU0hOO6hpzqloDrBW
         p5U/v4nvimUTATKPslhEh0YfzCyr5nfv0yaMKiY+2Wjk4y2AkWIOxxNlOoc7Cl3XP0/G
         YgEb8bHNFCtAmdj51k/Xam1zavfP2aVGCNHd+tsLEkEKrCBP63N7RkaMrq99CUwZEznx
         4SjaxtXjJHLIUUiK96j9wy2r58lOGyTEGf5pQFpf6aH9cm+e7beTlp+gQ5OrVZyi/5+4
         Kp1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685518045; x=1688110045;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4X5Wohwv6l7HU9svLxZYiAxT8tGzCt99NLg9x4sH48=;
        b=Ho8znri41zmJ1WDcZ3uKEtxStw1UYXt2MEIPpAsgFE6Rl0HFZtK6qPAQ0CD4JrtcGs
         F5+OP2OA5XPy6qPCxJGhnnTVbRb5wdJHgX6v+flhWKc29jQGfrjx2JHJhc3RiEIys0uv
         ne8g7kvrY5LaEoMRYPPnxFGvnISfjP2wIIiKsiZBUoV7HyQ4/g/wegjQABg/LbGqlF2w
         uGi183grRdh4lqWYQWly5MVutPr2kRGn/lAjLmA2uatLhl0UEhcBrIgqJpq3CpkDmt+m
         NxU2toRV/GNvi5Yx61WPGtxQm2HJSI5SKMN2LxbYTcB3GbRowgHdphpMjCQ4hUPOeyiu
         DBpQ==
X-Gm-Message-State: AC+VfDy6rTXr2F/hOwDla5gkszI34FKWTUbEIQhrkMlZ5jwe/Fp4QuZl
	H8sFsLtWq0fd/30lpu6NX5g=
X-Google-Smtp-Source: ACHHUZ4l8Rpu8ekx4hkNFGccONUxbjH37LBEkRGolmNei00ETECpzfuyFqy5GtAbgRijq28rpDHzfA==
X-Received: by 2002:a1c:c906:0:b0:3f4:2c21:b52c with SMTP id f6-20020a1cc906000000b003f42c21b52cmr3293418wmb.39.1685518045063;
        Wed, 31 May 2023 00:27:25 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id n15-20020a1c720f000000b003f6cf9afc25sm19476238wmc.40.2023.05.31.00.27.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 00:27:23 -0700 (PDT)
Message-ID: <de7389cb-8b38-49c9-4768-ba0ad49993d1@gmail.com>
Date: Wed, 31 May 2023 09:27:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RESEND 0/6] media: mediatek: Update video decoder nodes for
 MT8195 and MT8192
Content-Language: en-US, ca-ES, es-ES
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20230303013842.23259-1-allen-kh.cheng@mediatek.com>
 <4ebd1c9f-0460-4436-8e17-0e46e88f4828@notapiano>
 <CAGXv+5Hd-8e9QWGQ2MB++xjNH0sRemmQnVnAk=CfE8DBhkYZQw@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAGXv+5Hd-8e9QWGQ2MB++xjNH0sRemmQnVnAk=CfE8DBhkYZQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_002729_158825_DCCAF07A 
X-CRM114-Status: GOOD (  15.46  )
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



On 30/05/2023 09:28, Chen-Yu Tsai wrote:
> On Tue, Apr 4, 2023 at 6:19 AM Nícolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
>>
>> On Fri, Mar 03, 2023 at 09:38:36AM +0800, Allen-KH Cheng wrote:
>>> This series is based on matthias github v6.3-tmp. Since there is a
>>> dependence in the following series, I resend a series for them.
>>>
>>> patchwork.kernel.org/project/linux-mediatek/list/?series=702423
>>> patchwork.kernel.org/project/linux-mediatek/list/?series=702078
>>
>> Hi Matthias,
>>
>> this series has been completely reviewed and tested for a while, and the
>> bindings patches were already picked up by Hans and are on their way to 6.4 [1].
>> So could you please pick the devicetree patches?
> 
> Ping again on this series.
> 
> The device tree patches can be picked up.
> 

Nicolas, Chen, thanks for the ping. It's unfortunate that there are no email 
send by the maintainer to the mailinglist to confirm that the patches got 
accepted. So it's very helpful if you help me on that.

Patches are applied now.
Regards,
Matthias

