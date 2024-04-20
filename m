Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57948C4345F
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Apr 2024 23:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r4SJobPXiJZTeUtb9I6Mhq3OcgAMqPAgBwxUvUsXgSw=; b=HLqhSPQf1MPKLzU7vVfFmkKilP
	V1jnFmIqMc5XXIejNFwGE19VWAYuLzeCvmR6cxkOONvnFXb1wdFwyJ4N1i211ygOb0h5MeaFnD9DO
	NY2e12fO3KXW21E6cfxfMU774xeqfPHGhKnaHA7DEvbrG+iytu7Lezzi0IJv1VVvYvINWee8W9oeb
	zjK0lJKSRKKyPRo+/5U3IFRnWEmR4491hN2awXAKPgySmCTDBwoyeIGsGbpb0NZDpuvCaDl8FCK+p
	eaR831zbqRVr1rNJ9NFT/MNZgZBeCNgwMkovVXV9NA2xQIvkc/U57Jff+UiomOX8wATeCJv/giEyt
	vBJepSHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryJsK-00000009N3z-3jPk;
	Sat, 20 Apr 2024 23:12:04 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryJsI-00000009N1k-13Vm
	for linux-mediatek@lists.infradead.org;
	Sat, 20 Apr 2024 23:12:03 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-41a225fbf64so1761065e9.3
        for <linux-mediatek@lists.infradead.org>; Sat, 20 Apr 2024 16:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713654713; x=1714259513; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r4SJobPXiJZTeUtb9I6Mhq3OcgAMqPAgBwxUvUsXgSw=;
        b=QEiwfRtBGVOxyZWEO83FNFs1GIK1HPQfYS3Aal0DS2UF2UQuJ4C5ArAAd3qT0SLmcL
         gJ+npfVp3wsohZ3JlcVa87VaT5F+mVGzozKidwiZXenxBusHiuQYvGaPU+k8lp7o81Db
         i05bHz5icuyxW1euu+r2R92QEprZfY+3N4nZPNaXnhpvvViRTkZiif/Ol0Ip5E1IyTPH
         OezN8pzZ8lTGjFMvG19TP0B2WLrEcXzlLFCzThiRQ2+QNjarY82qwaQ7EQqIe0bbBkTZ
         EjPN2F1JxLNyiCxUoVggYXJwgNLSzBboPhTOGYjqe719+qsnoauIaxVkFm8NRnyKTvRZ
         uZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713654713; x=1714259513;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r4SJobPXiJZTeUtb9I6Mhq3OcgAMqPAgBwxUvUsXgSw=;
        b=oYb79ka1lzYLPc20SHnYHsBlrOiSYVRLbIXREyG5BWAZrxCIdHX0LOS1EwaS12SDAz
         4f10/g26c1kri/84UCjypVe62athK6zRwluI69RS1qn17f8w1+rNHLuQ5MbbQeUuk1rM
         RSjrp1bTG2K6JwADLiBVgR9opigk1/O3GHOVltgPBIKJYH1d5keW3nVK9/4Bp8iuDehL
         Ta1v31FRtLChLgaNqyfynQNLBIxgprOEFF3y+1DiYl8dWLQU/w7aOMXhlCdZyDSALtX4
         hkkn1Kz2R1vfRNXfpd2WaNuVhNkAqdNYA9rvundNm/o8N3FGYY2K8bR2tSW2FehfvHfp
         htzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUC16i0CX0CcqhuomHf3gvLWIq+0Zdu5FCk0WW9pqJdZw2pnhgw0Q3chpBKr8pW7mWXlNmONA3HrpoFqvlM47y10HUzIrLy/efjIcaxrnZ/HEoR
X-Gm-Message-State: AOJu0YwSIXN1t+XivngHigokUfMzTXEud8rTLW3AA+n3ETmOnsR5Ww+d
	GjWf8uY9ONIWfvp/eJM2Ya27xhFemwMUDPqCMHUp3ugBbCvEkYF0u9s/1dOWADA=
X-Google-Smtp-Source: AGHT+IHhrXMbVyPQ3xu0BxAvDr/qwuPP5+bQspGoLom9YV5UOhqLd7IShzLKZACYdNB5R60XxGZpSg==
X-Received: by 2002:a05:600c:1d0a:b0:418:7c58:d592 with SMTP id l10-20020a05600c1d0a00b004187c58d592mr5521241wms.28.1713654713122;
        Sat, 20 Apr 2024 16:11:53 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id f8-20020adff8c8000000b0033e7b05edf3sm7827624wrq.44.2024.04.20.16.11.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Apr 2024 16:11:52 -0700 (PDT)
Message-ID: <b288c62b-6a9f-4c6d-8e70-de04b6fa5fa6@linaro.org>
Date: Sun, 21 Apr 2024 00:11:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/26] media: go7007: Use min and max macros
To: Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
 Abylay Ospan <aospan@netup.ru>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Dmitry Osipenko <digetx@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
 <20240419-fix-cocci-v2-5-2119e692309c@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240419-fix-cocci-v2-5-2119e692309c@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240420_161202_308784_38370EA4 
X-CRM114-Status: GOOD (  15.33  )
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

On 19/04/2024 10:47, Ricardo Ribalda wrote:
> It makes the code simpler and cocci happier:
> 
> drivers/media/usb/go7007/go7007-fw.c:1292:14-15: WARNING opportunity for max()
> drivers/media/usb/go7007/go7007-fw.c:1293:14-15: WARNING opportunity for min()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/usb/go7007/go7007-fw.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/go7007/go7007-fw.c b/drivers/media/usb/go7007/go7007-fw.c
> index 018019ba47d4..86ce593e0c54 100644
> --- a/drivers/media/usb/go7007/go7007-fw.c
> +++ b/drivers/media/usb/go7007/go7007-fw.c
> @@ -1289,8 +1289,8 @@ static int avsync_to_package(struct go7007 *go, __le16 *code, int space)
>   		0xbf99,		(u16)((-adjratio) >> 16),
>   		0xbf92,		0,
>   		0xbf93,		0,
> -		0xbff4,		f1 > f2 ? f1 : f2,
> -		0xbff5,		f1 < f2 ? f1 : f2,
> +		0xbff4,		max(f1, f2),
> +		0xbff5,		min(f1, f2),
>   		0xbff6,		f1 < f2 ? ratio : ratio + 1,
>   		0xbff7,		f1 > f2 ? ratio : ratio + 1,
>   		0xbff8,		0,
> 

Code is correct, but the commit log could use some expansion.

Suggest:

"Replace ternary inline selection of f1 and f2 min max values with min() 
and max() helper functions for the sake of readability and to make 
coccinelle happier"

You can take the RB either way though

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

