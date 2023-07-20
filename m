Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D6CEB64DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 09:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MbEixaOkxNJN74ak67fuMAe8qbP5jIXA+BkpUoZ/+vw=; b=mriVZX6x+uk9MHQRdOXTTdVJ8+
	iksTuCy8m9xmU44Wt/N+ASJq98ZCimVtYuew/krHnYu4lbT0UXcKplJw0fWL88o/ewWT+OKWGgsB1
	rowUhZjGqNUqrAXwNl580Ef8noSZBEN+Uu/OtR9TjCWEuSAOQdVmmwdb9zSX3syUpvSrc9tRVKdUN
	MzHs0Z+YyJQBdr4BYXF7ThdgC0ZmQNFiMVJNLVCtQxb08McHmmghv/Ru/ujaxd1UizKBkFoKeFWd9
	HAENLTZ+yWaO8kmoS2yewurZvdxdmpAtCpqWESYG+Vozk3F4gNlfhG7GIXNtM/wFHiqKflIHiUhRE
	UXgf7Paw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMQ4s-00AYSe-2A;
	Thu, 20 Jul 2023 09:36:06 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMQ4n-00AYRC-2O
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jul 2023 09:36:04 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51f7fb9a944so780625a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jul 2023 02:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689845760; x=1690450560;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MbEixaOkxNJN74ak67fuMAe8qbP5jIXA+BkpUoZ/+vw=;
        b=DyBZCxUTKXm94FjQXQ7w8jrcELARpqFqL+Kg0e7f1vQIwD46ODVgs6YOY8OpfvDtAR
         KTDMJxfZqdo2XWn2fRr44udKWcP9k6VxBv7qTq9MQMSKPNr00WULucw30rJPezx7HU+r
         9oVqxAFlbNjB1i9UED2nkTueAVo5545WyqLFfUK1TvY6e+XOQoWL4hGOsYCirnhmKLxA
         GlvPrr6FtX/2aXYd5+c3sl4mDhH8MBSOnopNn+29pHLiEIPi6z9naAV74MRxqYKTa+WD
         vkGkyObwNkpGgXAnJ/Mmkmw8KxqrfFSmpXy7v6un9wZLIBGgDA/OBufg14vk9r9uEFOc
         l5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689845760; x=1690450560;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MbEixaOkxNJN74ak67fuMAe8qbP5jIXA+BkpUoZ/+vw=;
        b=fr+OtsvSVOV2LHe9DJAB4AC8Jzu5SAHRh2B1e0du+zDKpM8cPDbM3/mbfbu6uUxsJF
         Ez9xdH5zXiZmcBnYSdptZMamidSuLuT7Y8ppjflEa2IDMBGTCLrfk0J6G7TiwBO8PLQR
         hgpoemSKNaY4HsIDQATAYDswCS8yiBy+epvMQxWA9YC1wXuuTg3NYv+aCIIrF3iRsFll
         +MRCuYFfeQY2dxQqUUOGje3ek+UuQdf5UbwHDhEw0ASlBIXCulvDbgrDxJUfywUlFnSr
         aNZ3nfz6dRlREame5yx5CrUGire5aCnqIeaaROoDVZhl9S4cZ5Y1xTQEnoBmsp+IcwWt
         owug==
X-Gm-Message-State: ABy/qLbBZXBgmvT5Ifq5a0wxVs4XGUHtRCxjx2RYv1Q9zmwQDEmm/AMa
	QJ1+eDjLaVWEQNMuZauueSKvtg==
X-Google-Smtp-Source: APBJJlHdcqWTCi4MqbmDQdedPbHXGtLDE+1AHMjwt6QtLxsX6n9wzm9peAh8UPM3H/gm2b/+7s6XsA==
X-Received: by 2002:aa7:d7d1:0:b0:51e:ebd:9f5b with SMTP id e17-20020aa7d7d1000000b0051e0ebd9f5bmr4608092eds.36.1689845759752;
        Thu, 20 Jul 2023 02:35:59 -0700 (PDT)
Received: from [10.1.3.131] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id w17-20020aa7cb51000000b005217a24addbsm489507edt.20.2023.07.20.02.35.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 02:35:59 -0700 (PDT)
Message-ID: <2e497eb2-f927-90bf-daf4-684d6aa0fbd6@baylibre.com>
Date: Thu, 20 Jul 2023 11:35:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3,2/3] drm/mediatek: dp: Add the audio packet flag to
 mtk_dp_data struct
To: Shuijing Li <shuijing.li@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230720082604.18618-1-shuijing.li@mediatek.com>
 <20230720082604.18618-3-shuijing.li@mediatek.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230720082604.18618-3-shuijing.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_023601_789001_9677AA6D 
X-CRM114-Status: UNSURE (   7.59  )
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 20/07/2023 10:26, Shuijing Li wrote:
> The audio packet arrangement function is to only arrange audio.
> packets into the Hblanking area. In order to align with the HW
> default setting of mt8195, this function needs to be turned off.

-- 
Regards,
Alexandre

