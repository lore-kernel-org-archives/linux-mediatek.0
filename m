Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E122EC61DA3
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 13:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yHDCxAcJaedrGqTVZwCTHm84tYpUUPJR5+QzoEgSiUI=; b=ZQYmrG3xJjWxYOhsvh4cUoMrzK
	BfdHRWmee+qfCkBTzYyp1Ox8mSf0GFQneULbmV5dlPMkqrPT8znbfceF+M2Z3i2MK5mRlTlIs8X2K
	fGiPG81f6k+GJi79O2iVaVPwXNMxEIdzVnx8Ktx/jrb0nuyxNPZguLAGxm55+3hbMVYWPNfwgqvPS
	zcNKcEAYZYaa6bQmN9JNZlNr6vR0sAOGs8Fe+tqqBHKsgnK0Ny0H7RNk42c/1ij5N+M69HwLRFp61
	uqax/VYq91q35WVztY+GXQxqAy6jj/5mnjqc8+FTdyjG88N2r51kKeJmv5bQLdl2kf2ZTzU/7oRtw
	Sge1DGxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXoc-002YH2-ON; Fri, 24 Feb 2023 13:08:46 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXoO-002YBN-LF; Fri, 24 Feb 2023 13:08:34 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1FBF16602FB6;
	Fri, 24 Feb 2023 13:08:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677244110;
	bh=xo1yhPMyDaRz4SOUHsbsxgo14//hh0ZQOfocbNC6veY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HG7SbVCmRnaklGIxLLZ099L6hajqr5lOYvMIJevUkx5q9DdLxc1+srkL5FwkIkOc9
	 gIh6txekjwYdcHBCd8PlmthiS0jFcHJjOxEWPUSQQuB5fC4x8UScMzRMNH8yyEcPxN
	 TSq8kMBt7bc84NaGim7cVvVsZ1U0MEAxTQBOVUMTAJ06ByhGPObyz120YrlGpjtMl9
	 1q00viChtTV3R82CqSrwejD18qI/QDH0/dcXGJgWYPOg8mfVzBX1Zm4j9lhgpxEurg
	 2dulDaLggfhytozyqrxYUEVB8o4GSf+qRGNSIKWK1s9MXXMXIOrwkK4B4//s4KufTM
	 2uUVpfXa7lmxg==
Message-ID: <61ebdd1a-2737-0516-08fd-3b9aa0ddd4fe@collabora.com>
Date: Fri, 24 Feb 2023 14:08:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 08/11] drm/panfrost: Add the MT8192 GPU ID
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, robh@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
 <20230223133440.80941-9-angelogioacchino.delregno@collabora.com>
 <CAGXv+5Hzin_5aTqMRRztWbDR64z6_oFOx2hUVnpJBvk9xDzrfw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5Hzin_5aTqMRRztWbDR64z6_oFOx2hUVnpJBvk9xDzrfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_050832_857619_55D1B253 
X-CRM114-Status: GOOD (  20.01  )
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

Il 24/02/23 11:06, Chen-Yu Tsai ha scritto:
> On Thu, Feb 23, 2023 at 9:35 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>>
>> MediaTek MT8192 has a Mali-G57 with a special GPU ID. Add its GPU ID,
>> but treat it as otherwise identical to a standard Mali-G57.
>>
>> We do _not_ fix up the GPU ID here -- userspace needs to be aware of the
>> special GPU ID, in case we find functional differences between
>> MediaTek's implementation and the standard Mali-G57 down the line.
>>
>> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Reviewed-by: Steven Price <steven.price@arm.com>
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> 
> As previously mentioned, MT8195 Mali G57 has minor revision number 1.
> Do we need to handle that?
> 

Maybe something went wrong while sending the reply to the same question on v2?

Anyway, from what I can see on my MT8195 machine, it works fine without adding
any particular handling...

Alyssa, Steven,
are you aware of anything that we should consider?

Regards,
Angelo

>> ---
>>   drivers/gpu/drm/panfrost/panfrost_gpu.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
>> index 6452e4e900dd..d28b99732dde 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
>> @@ -204,6 +204,14 @@ static const struct panfrost_model gpu_models[] = {
>>
>>          GPU_MODEL(g57, 0x9001,
>>                  GPU_REV(g57, 0, 0)),
>> +
>> +       /* MediaTek MT8192 has a Mali-G57 with a different GPU ID from the
>> +        * standard. Arm's driver does not appear to handle this model.
>> +        * ChromeOS has a hack downstream for it. Treat it as equivalent to
>> +        * standard Mali-G57 for now.
>> +        */
>> +       GPU_MODEL(g57, 0x9003,
>> +               GPU_REV(g57, 0, 0)),
>>   };
>>
>>   static void panfrost_gpu_init_features(struct panfrost_device *pfdev)
>> --
>> 2.39.2
>>



