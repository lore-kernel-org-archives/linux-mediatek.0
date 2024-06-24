Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2F5C2BD09
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jun 2024 07:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P49JDi1xXPAYpLbhrU13RiWekT68KiQTL8uhFa+r3Dc=; b=lLUF2lM8AvSyIfyBkuOGwJHwaf
	2ORDjTMaPQtfB/1VLlhHiansvdC4LVdKdL8CuVTZvYH9Y8U7jmN5IXM/qaJoWtnXCPgaHMCu+oCGU
	/c6cJg+sOCIAHqU5jUXGU9b1zzNjbEuVfR96RJcIAJEsGg9efdAL8YLYEV16RUvTrDZmC54sgGQtG
	x8lxlL8KvnTu5g/bDfUenGbxJgAWh3FliU75HIpMLPYibFJCjsxXmA8IUV3nStolSO7xv97P/dV2b
	I4qccJvOYriGQ9pZYAyqAItgIYLdjEQoY+tIm3kCB7d7uiz76EHQUWQj89fpVdGLABKQ4qt7Xr+nS
	NX22cBTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLe2I-0000000Frv8-2PXD;
	Mon, 24 Jun 2024 07:22:46 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLe2F-0000000Frtt-1wj2
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Jun 2024 07:22:44 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-57d15b85a34so4050135a12.3
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Jun 2024 00:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719213759; x=1719818559; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P49JDi1xXPAYpLbhrU13RiWekT68KiQTL8uhFa+r3Dc=;
        b=ypaJYvzhYhf4Uq9oT9ZUNFV3jnobdRVCjEWPtr1mcQesMfI+/VWV1IfYp4E6VdGIEo
         q8rjvUo3zNrXaTwHbwSm+dQMLfRsFGp7ZoJAoE5CJn/06n5BcNAHUXgSrup0EQTthCNQ
         hDSsJ/slxckSSRtgGTL71i1fx2cry4ar20Iabt/DVpZezFIpC1yfKuyNdrUSYO5R2Ld2
         DLEQLj9Gc1ISqV39EVve/KpFFWqEvCRQUiNwKOjzT9LtGB9NkBKjvN/A+FA8zVDJ8enX
         ZPHNmroMYWzSFzyemgltDCJ1iuotwaH2BJehQi9bQWvFva7v3CSXihUBNNRfqDmoAr5t
         c+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719213759; x=1719818559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P49JDi1xXPAYpLbhrU13RiWekT68KiQTL8uhFa+r3Dc=;
        b=mYnh8Lngme5133dx/YL4vwPmOwx/eKEkcx5PMyo5YVZCYJCpSYYImcptRAZeTYL/TU
         7OW1ajOuYp5UZX+lTUoBvT95XokGZaBStys6Y7QBJ3sfs1O4EeyzwLLrR3CV1/z0y33d
         gVq426AAxq9NURkn3NHDTVgWTuzYFQ1IQjGIeWyKTu9BJnCLdCG1M3YcTipCT7/oS+8j
         mFiqO5jbxeKxxAU+yUQJ6tHyLk/AXoUAzAfRmzAEUEAnahYOA8VGk9GyPVyXeftEmVa0
         gFaQSCASUEbwyqwe8P9n0ZZDqEfCLClpAxCHCJU+LhXl/mcqHQI+ogBHAsYuCM1QOmnK
         jvNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXy1eelCpn3BX4/MXdfAlBFQGIdkLgk2XEnkuGbAlK/YSlFAy5VESJZCHjR3DDiJwoQ6p9pDbGA+twdLbhNC7P45eUDuxYZo9XfHoXZ+seujXp9
X-Gm-Message-State: AOJu0YwJI7X7oNYzjyYjwGIXkgVPNb1czhlDAXTC/qGvEWr8l9hdfRsi
	af69XApa+eZKvknk81zNGmXUJ5D1BTsm/Gk8hAjzH9qKx+EhIu+Att0KvQifmCI=
X-Google-Smtp-Source: AGHT+IEMa8s/IzqM0+yHmNkv5YbQAah63TcfDGwvHHxW+U4X+runaXjbqEZ9o5SWB9bNGeVYIuUvmA==
X-Received: by 2002:a17:906:9c96:b0:a72:5598:f03d with SMTP id a640c23a62f3a-a725598f1dfmr116904766b.59.1719213759525;
        Mon, 24 Jun 2024 00:22:39 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a710595adedsm238162166b.214.2024.06.24.00.22.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 00:22:39 -0700 (PDT)
Message-ID: <cc50cb9e-cbae-43dc-8845-da11a6fb7074@baylibre.com>
Date: Mon, 24 Jun 2024 09:22:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/15] drm/mediatek: add MT8365 SoC support
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
References: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
 <20231023-display-support-v4-12-ed82eb168fb1@baylibre.com>
 <CAAOTY__ZLjuJHnGsVLvGkFK0WhJJ6r=miqewRHsPCJhqO=8qoA@mail.gmail.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <CAAOTY__ZLjuJHnGsVLvGkFK0WhJJ6r=miqewRHsPCJhqO=8qoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_002243_529214_D545595D 
X-CRM114-Status: GOOD (  11.49  )
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



On 21/06/2024 17:24, Chun-Kuang Hu wrote:
> Hi, Alexandre:
> 
> <amergnat@baylibre.com>  於 2024年5月23日 週四 下午8:49寫道：
>> From: Fabien Parent<fparent@baylibre.com>
>>
>> Add DRM support for MT8365 SoC.
>>
>> Signed-off-by: Fabien Parent<fparent@baylibre.com>
>> Reviewed-by: AngeloGioacchino Del Regno<angelogioacchino.delregno@collabora.com>
>> Signed-off-by: Alexandre Mergnat<amergnat@baylibre.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> index ce8f3cc6e853..e1c3281651ae 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> @@ -318,6 +318,10 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
>>          .mmsys_dev_num = 2,
>>   };
>>
>> +static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
>> +       .mmsys_dev_num = 1,
> You do not describe the pipeline information here. I think display
> function would not work.

Hi Chun-Kuang,

I don't describe the pipeline information here because I do it
in the DTS thanks to the OF graphs Angelo's serie [1].
I've tested DSI and DPI display, they work correctly ;)

[1] https://lore.kernel.org/all/20240618101726.110416-1-angelogioacchino.delregno@collabora.com/

-- 
Regards,
Alexandre

