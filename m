Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672A4C7EE23
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jun 2023 09:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6orbtq17lQKjI9Icb5c6jZzUdG10XE40HYo5IhwyFNQ=; b=MuRQECKS03vsY7wxlDQGi4FEYk
	4NkdvtvgZyK4QZIV1P+UzDteufadUN6cSFp9rRN6NUxU+jX4iPBU3GKrTdqhbhA/3iugyivjOw989
	U8AzqT6gGrNzDFd2+tsWqlhr2mCv6ygiUEKvWFpjG689t38b4W/y1IdJ9AaF+Ccwh82uSxYwnEcfZ
	13fH45eA05ohzndU+8j3hvlOmpV+j/9+5quP2aR1+oN4iTBHORJY/xgO3fy6HUAXnkYMSWvXn30tr
	Pqv9kt13raQoNJ1Tru7wB/4HTiabotwPDoFnWkypiamS9Dag79ToxzwMiDKnEde6h54ub3R3lXkZ7
	4vOUukTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7C2k-008hwx-1N;
	Thu, 08 Jun 2023 09:34:58 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7C2h-008hvW-0q
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Jun 2023 09:34:56 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-307d58b3efbso278824f8f.0
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Jun 2023 02:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686216891; x=1688808891;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6orbtq17lQKjI9Icb5c6jZzUdG10XE40HYo5IhwyFNQ=;
        b=WrlC02M0T6mrZAv6GxmUy2UCBV9sf40gKGoNcw+gAKVsv+UVlMfBfPLqHGTgiUbUGA
         15Si5VnX3hMyAurhjup1Ff8JtS6/xS/zgwJ7AkOi//bMZ+Csu63ck6Uu80HkFVzMCPlq
         +mMi0PPRDhm2lzgAqfy47HkaqxRFnZk7cClWhBYDUANdyAdWU1oibYUQkw5+IgKyRh2g
         SitroCQ8lkHaw13o6uv/LW/hseTspMkBvei2ACbHKGFh9uKNsSklgUY4LDbRo2NSqctv
         SCBpxGRrBb56OSOrJGpKyEA+2YqMpw1JxQxHK79K97MkQ8YpobUgj4BNHSSnX9TCqtUH
         5Tng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686216891; x=1688808891;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6orbtq17lQKjI9Icb5c6jZzUdG10XE40HYo5IhwyFNQ=;
        b=lV4e4hIQZIIcKDLf+zS8007fGgpdN+wSsuxqEZhvH46Zs75EViez7qqBaGk/Q2CS8/
         CibHS3n87GqDt25UEwlmoEBGMxklYurusxIM92eiajC8e522lzSRMyigwiF/AQQOiSCc
         ISmui/tjIrNDQuwFQfHpWQq3V2Qyn8ze8fUWt7YR3Jn1RUnOvIdqP6vNYoo3MAWXTkJO
         YIkmCgSE9lZtpj9aRFOlk6VzIw6nXeple8x8hqfFNgWERnZl57ZnR2HNvvX4urDd8Xxi
         xrs3gR9VqWWrJxftkXYfkr9Z1CColl1wpyuPdQwTS2rlLhQj90ghFxtjV7aLqtGWOTZM
         EDWw==
X-Gm-Message-State: AC+VfDxPM7thkjhXcr4IVanQ6r4SoEVrG6YAq9BR+xSLnc/jjDBp71f6
	RKqlkajM0qyqnESgHtGmOOKzuw==
X-Google-Smtp-Source: ACHHUZ5UVQSczbkfardAghLYw8rGvYBCqD9G/YSIbOG+ijQ2ZPpGa/a32Zq9oHH2OrmLw0nLnbDPMA==
X-Received: by 2002:a5d:684e:0:b0:30e:5b63:7487 with SMTP id o14-20020a5d684e000000b0030e5b637487mr3188877wrw.58.1686216891475;
        Thu, 08 Jun 2023 02:34:51 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id bf3-20020a0560001cc300b003063a1cdaf2sm1025954wrb.48.2023.06.08.02.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 02:34:51 -0700 (PDT)
Message-ID: <578cc882-527f-5367-942a-d3d187786780@baylibre.com>
Date: Thu, 8 Jun 2023 11:34:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 4/5] ASoC: mediatek: mt8188-mt6359: Clean up log levels
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, dan.carpenter@linaro.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20230608084727.74403-1-angelogioacchino.delregno@collabora.com>
 <20230608084727.74403-5-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230608084727.74403-5-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_023455_306895_1214BD6A 
X-CRM114-Status: UNSURE (   6.52  )
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

On 08/06/2023 10:47, AngeloGioacchino Del Regno wrote:
> Change some dev_info prints to dev_err() and some to dev_dbg(),
> depending on the actual severity of them.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre


