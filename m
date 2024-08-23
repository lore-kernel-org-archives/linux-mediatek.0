Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68906C531DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 05:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wN8gOGozgTRHYua5nqn1vSL/fYA2BgScIc4AbKs4NtE=; b=BDdsJ/9Et2yjQyubpKW7/U4FtT
	wCvAUG5jc/jivXKgKEOy3mtjEEOgJA9gX/X4TmV+Cd8V9dgHNdcVbplD1W8GMCdxMsb5jzbqmJHXv
	foEOl2LMhqQ2Bpy+1bpZ+PNWxQQFQ0FmAo7MwfvyoOIemCK6DotoV/OOOrDdcI90uvs/43DgVoEE8
	SMEQxl56nYw2LD1hFjMAaterjNdyhFZaBqBpt2xvkOdHihYi22Pc3kkK8D4QSjf0cJJMhuFHTpn1j
	Ma9IM7CUnfgq+bpfOBa0iwrlUKMVi+LJrf8iXut0MMlvm7WgFl1mTN+f8rlRijY1sS77lK5mrQSGH
	dsmIMP6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shMZJ-0000000FGbD-1pTK;
	Fri, 23 Aug 2024 05:10:37 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shMZG-0000000FGaD-1plU
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Aug 2024 05:10:36 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2d3b36f5366so1168243a91.0
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Aug 2024 22:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724389833; x=1724994633; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wN8gOGozgTRHYua5nqn1vSL/fYA2BgScIc4AbKs4NtE=;
        b=g+fPnsCWA30kt8oZ6CKkGgub2oSTQIt6MjnFPPlMdGel/Rq6my0QCCMu7+PmDhSfGb
         HYhnObhBet7P/jPQfR9788+8e+JGoOoLcmDDZ22/z1WYHfKt/54ptqqTVH4tvc4nYXYZ
         N0+Of/me2F8L/hO9OPbeaf3YMs/eEjzyyxYOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724389833; x=1724994633;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wN8gOGozgTRHYua5nqn1vSL/fYA2BgScIc4AbKs4NtE=;
        b=NK6ZZIRu5IlaHYX81Zgs0tj4cpzMUJBULdxTdNzt8OUlCvmkVBic6cot4NX2wOh+6C
         9qYkUSDK4EPlwrDg8SQ7jqRm/Fv0YRRLJwM664UdBWFSoMgdbiv4NORrq3P25xIvKhkS
         sI/WPqk6y0tGmUAh+iYkHfXequgHyttrh+2pQV338yFl+rR6cvT98o4JYUf9D+oJ0BHA
         6F7iiH5gpw1RFPBu6ae9tQK8RQHEWGHaZ7FZpeNpbnuzoN4GyqVQN0OFmBAjbeN21x/C
         6v+3BqZ76WGvVR1IITb6EpV24r04GtOjYk9+U16NIZI+mEVIk0H8tz+vQRIQkIYbKwiG
         vR+Q==
X-Forwarded-Encrypted: i=1; AJvYcCW77jXQAIsza+7vzJ+n+EWKsywqisacIkE7JU5ypktGRcb8BmfHxBX6VfrNBxfH7AyhNJErOANp5DPonxlI1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzdmz+82gK7un+/Rd1HhasKU1YvhReNo3q2VHk5ln/4R3wrkKfl
	n7vwK273jG3YbDbzxmTsH3VvCp9EdO9ngXmha/vMJBCDObAMODd4aj1B5NORIg==
X-Google-Smtp-Source: AGHT+IGg4uq6MI3y/JbYEI8jxZWGx3L02gsDpQuY7H9ymAL/QzcibgLlO8pq6VpSjkyB/mVihZCNtA==
X-Received: by 2002:a17:90a:fd82:b0:2d3:cbf8:9083 with SMTP id 98e67ed59e1d1-2d646d37f30mr955978a91.26.1724389832777;
        Thu, 22 Aug 2024 22:10:32 -0700 (PDT)
Received: from [192.168.0.105] ([103.163.98.66])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d613b1f0d5sm2889947a91.55.2024.08.22.22.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 22:10:32 -0700 (PDT)
Message-ID: <776af05b-6855-4006-a3b7-804c5414cb41@chromium.org>
Date: Fri, 23 Aug 2024 10:40:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: mediatek: mt8186: Add svs node
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com,
 jitao.shi@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240822064650.1473930-1-rohiagar@chromium.org>
 <20240822064650.1473930-4-rohiagar@chromium.org>
 <545e9e80-5b38-40f5-9a23-ff5112b13917@notapiano>
Content-Language: en-US
From: Rohit Agarwal <rohiagar@chromium.org>
In-Reply-To: <545e9e80-5b38-40f5-9a23-ff5112b13917@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_221034_525245_CECE3D59 
X-CRM114-Status: GOOD (  12.97  )
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


On 22/08/24 9:36 PM, Nícolas F. R. A. Prado wrote:
> On Thu, Aug 22, 2024 at 06:46:50AM +0000, Rohit Agarwal wrote:
>> Add clock/irq/efuse setting in svs nodes for mt8186 SoC.
>>
>> Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
>> index e27c69ec8bdd..a51f3d8ce745 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
>> @@ -1361,6 +1361,18 @@ spi0: spi@1100a000 {
>>   			status = "disabled";
>>   		};
>>   
>> +		svs: svs@1100b000 {
> There's already another node at address 1100b000:
>
> 		lvts: thermal-sensor@1100b000
>
> You should set the starting address of the SVS to 1100bc00 and decrease the
> iospace for lvts to avoid intersection. See this commit for a similar change on
> mt8195:
> https://lore.kernel.org/all/20231121125044.78642-21-angelogioacchino.delregno@collabora.com/
Sure. Will update this according to the reference.

Thanks,
Rohit.

