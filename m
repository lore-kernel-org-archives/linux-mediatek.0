Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F4BEB64D9
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jul 2023 13:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lk0KxbPL7g9PHdbTrRV8GwvZTLdNn5RyLE237XDBwng=; b=2lzj738ZQCylb7lYfsXGtwVPgn
	wiHkzrFXT6a2VREWSocupd1sbDW+0W97zuYpp/61Ds+rfPyOoN00gIjVyqImben7DraKQcRTtlZzT
	ngj2dpfWGUuQTwOOpBlugTiG22j1aW4lgdXwBMPvHmKnJ7uBUs5+NuON5oYrFmCZT4sk3kAG9YCKK
	jo/Tm7F3g/DLW+spFXVGTPVXuEOP/+jTLvkDA5SNRpnasNFTFSAuyJgwAgWhroG8sH1VqMjBi4jKc
	iCuQw0j4rTjWUdOaMw/zMP6Y0u6LLizsjZwh31PDXOHfSG4sRhHyz5Gl26hD7/kxONKDNVqvKt8+A
	+k9SDXzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJZZV-0002Sw-0w;
	Wed, 12 Jul 2023 13:07:57 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJZZR-0002Ql-0G
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Jul 2023 13:07:54 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fc04692e20so54378085e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jul 2023 06:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689167268; x=1691759268;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lk0KxbPL7g9PHdbTrRV8GwvZTLdNn5RyLE237XDBwng=;
        b=Pl3dPP9WaagaZa5NZVF07AyuGVkuebSNjvMI/IJzHvl1F1sPHVcp/7u/J80rHfduqf
         UO5wNcVh1Wz2IdYKjZS/uJQwfzdzb97YnykXQEWEEGrVDdK67csEpl9l2inwECsJ1Q8m
         VJqq6NDxmvU5r2ivTTuMRKX6IzfYXVtB/UOLxTM9G4kiuOZg1DZbwSIcc8wGe2yvxi9C
         OtVeqs38kzjyf5rKg1E8KSwGCODuLs7PZLBFui7IOAk8mcdKvqdKw4fRGRE43L6L3sQw
         Wrl7k9WvADMh6sVGcJYBwDD9V8+0nERpFVyG45qBAIIPlXOuG468dazCuwDDEDKlMVrM
         gr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689167268; x=1691759268;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lk0KxbPL7g9PHdbTrRV8GwvZTLdNn5RyLE237XDBwng=;
        b=F2HymYoAHALsoA3sk+3kRkoKUCXBi3eH6++0Pj6S5Zvib0Doj1kZSsCk33ayjDwpaw
         joJs1b/jSquiteLGqc8S1y9qD2xn8JwOoRzGZaddxz00dMhX7bT2+hjX56QJ45Gg1jx8
         5TYmso0mI4R5QvJx3dY7UgA2rBHtR8o0J/FNLaJgCZWweSlxDuhYNLAWfnHliJEFsRho
         Eg8OHMvMMGwpUzwUDPdx5UmhtIS08tqykEZNRTj/KA7NFSMNhhgsyeLSP8yUfuPu/3yD
         dL3ookazOARBlalOAp3pcWSMBpjkOc9F6fb2R+3it12PLbtumKJ7v0PoUmizHbCpy2+R
         dvTA==
X-Gm-Message-State: ABy/qLZMFNx/sAKC8mJexH5wsWYmMZpreFOQ05/L3yJPJK7bm8DaHYiA
	jXzCqC1zIQ8vziMoMMTGDiA8mA==
X-Google-Smtp-Source: APBJJlHfRnv7y9rZI3NMWpRgDW07OG6yBWWWNoyjxIJUDcLnaIvBEGr8R4hrrI4kOutThs0bqhTanA==
X-Received: by 2002:a5d:45cc:0:b0:314:3358:d57f with SMTP id b12-20020a5d45cc000000b003143358d57fmr18305861wrs.56.1689167267884;
        Wed, 12 Jul 2023 06:07:47 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id x6-20020a5d6506000000b003143b14848dsm5050267wru.102.2023.07.12.06.07.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 06:07:47 -0700 (PDT)
Message-ID: <aa92a6da-b406-59c3-8d2e-084bee6ba778@baylibre.com>
Date: Wed, 12 Jul 2023 15:07:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 3/4] drm/mediatek: Add casting before assign
Content-Language: en-US
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Cc: "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 =?UTF-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 =?UTF-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
 <Jason-ch.Chen@mediatek.com>, =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?=
 <Shawn.Sung@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
References: <20230621102247.10116-1-jason-jh.lin@mediatek.com>
 <20230621102247.10116-4-jason-jh.lin@mediatek.com>
 <797c0144-4072-8728-304e-e64213185687@baylibre.com>
 <4d7f86a662429256e5a0a5a52b9e8c375b22c382.camel@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <4d7f86a662429256e5a0a5a52b9e8c375b22c382.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_060753_338800_5B1083B8 
X-CRM114-Status: UNSURE (   9.62  )
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



On 22/06/2023 10:02, Jason-JH Lin (林睿祥) wrote:
>> drm_plane_state *new_state,
>> >   dma_addr_t addr;
>> >   dma_addr_t hdr_addr = 0;
>> >   unsigned int hdr_pitch = 0;
>> > +int offset;
>> 
>> I agree with Angelo, please set offset as unsigned.
>> 
> I think offset should be unsigned, but since src.x1 and src.y1 are
> 'int'. That means 'unsigned int' offset will be very big when src.x1 or
> src.y1 is negative.
> So I just use 'int' for offset here.

Ok

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

