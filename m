Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5C8C4829D
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Feb 2024 15:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WwVsqoGAIzE5l9Xu7dUQGRgCnLWg+E4gxnq7lDMjVy0=; b=ghSlwvSJKWditv
	Vqxtyc65Yid2dA/LUrBeUNTXQXt5oBGKWjrU6x8LRHPw34qcCazpYB9u86cCCXCtwqGhLhkNc9Aq0
	cWwHbif/QtXQM3fLoq39Oljkq0xzOqPFZW3vzgGbbEfU2yWKQXLwf7D0QzeQxXpytWpaqQFiIFoZv
	WK+yhUOlF+utBdNRaMXV+BpdqIY9Zvxpw/6ojVqlodfMbpqXasTgQfAjFg9vD8nsUG7z79l042VuR
	ZfK0/uAGnXz4UcBrBSqcCuWBeERgMJ5JDKX3jrynuvj8SBM3LZmQEDjsZFpI5+cx2CI8NtKlipWd/
	oE0B//waE0B5eUUysuDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXN4y-000000080Mc-0wrU;
	Tue, 06 Feb 2024 15:09:44 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXN4v-000000080KK-1dpJ
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Feb 2024 15:09:42 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5112d5ab492so7971487e87.0
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Feb 2024 07:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707232179; x=1707836979; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WwVsqoGAIzE5l9Xu7dUQGRgCnLWg+E4gxnq7lDMjVy0=;
        b=OduvbltLQ4oUkKMqvxOfcX9gnE5pWvGQCMnP3gOTrAL1MTLzoDNJPJH4ahqN4gRZh4
         swMyCDKKjX6k/oc7ZCe6ZDCSPf5lXVeKPqP1IGtSDahtO9Kcc5n3oOcBRh1RqiQGdnom
         AHu9YhY5VsmnYeGKTPSjndCdtJIVUiqXWyt1LxhZlzUfrabZaEF+Bo6pdXXHyrKqz/nl
         7OMFWRoO/4oPYD3MvAJO7ODzpFLoqqqjA1IH80TPb+z+tkvJWRzF9TPj7lyyMGLt20FR
         Kcf23q0n81lex5QcaB9C592FdtGhCWgEoSWBJJkZhtkv3ZxK10TwHUHAYZpyiKaw5OZp
         vhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707232179; x=1707836979;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WwVsqoGAIzE5l9Xu7dUQGRgCnLWg+E4gxnq7lDMjVy0=;
        b=p6QMn8Hn65WijBS5aktbTcPHzaznr+N9lVLCdDnY8GPrdGYotg5vFxxc5Yw6uSHDWz
         ambsHi9kWxBwPRYwEMQWkIiSfBafluT3IL17ulGWgrulpZt1IpMXIYlJBH+CWjNHT4TB
         7YPIRR5gpWpEiVvEdlikevmL8k6cQSfvzUhi9SZTai8ZR4a9UKOSYGpEScmPZNyjhvgi
         2424aZq76ntXXVo0pJAPU+ykJIAN+eisieIluoJq/6BoEd8W9/JyBI2wIFOJRRz1Mgck
         Cq2uAWk8D4U7A91Fq6HdV+D+Usxg1s6TuOd0E6ZFpvbSGwKxCo6ykTPiIQg3mn0MX6ZT
         rIzg==
X-Gm-Message-State: AOJu0YzGDy2DkronOmarx+TNaGwPC0uuFJuPeeD5jZsMvICihhut4rSk
	L9KGBjvqyfjMZ+OyhU9XreSdfeCZdg0Sb+qNxezv5aJKrOBqo0y5QJAbemAsCdc=
X-Google-Smtp-Source: AGHT+IHIK03nqgzi0UIQjD/r5eQ2ej+6ZZNo5AQO8975rLcfk1byiQAQT6jFYjw/zsDV+iNnbg9VtQ==
X-Received: by 2002:ac2:5147:0:b0:511:3bd4:6a97 with SMTP id q7-20020ac25147000000b005113bd46a97mr2159245lfd.7.1707232178665;
        Tue, 06 Feb 2024 07:09:38 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVGkNAqTncHn8u9NySFFtDQqD8pscjT/JrKzey5HdYBYNb9Vz4cfuYJr7DavYYjySH0mR6+iOdinYPmM90PzTNIRnozIZN09rANAAbPujFAAY77eZBTuNuh80moOl4xO1aEGGxkyrKIEMMkZbFVyfaXr7OR1pn8OMlHfFW5voh4+4ayQFTuW/ADqVzBD4GFghg/qcCiL2gi/kUGqBklehKOZ/R0xTI5FrR8HuNeBPimYzIU5g8d/5hDTmzeiq89/xIGjYKgh6YadASA8qRf00j4DMprLo64d/4xKv5aE+Dq4INDxNnV4o2jO0kucyFKF46JqsNL7flwfzbEvNHqKstOIlemSLSTf6ClwPVh/JZX2A4VOdYuacC0kjNiGhd2aoIH1RPcw2oej+1wkclZL4mdFWY44actr5ic6g==
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id f14-20020a170906048e00b00a378377030csm1252795eja.41.2024.02.06.07.09.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 07:09:38 -0800 (PST)
Message-ID: <f5942f06-c4c5-4b5f-bcfb-10b7976d38be@baylibre.com>
Date: Tue, 6 Feb 2024 16:09:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/9] drm/mediatek: dsi: Use bitfield macros where
 useful
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20240206120748.136610-1-angelogioacchino.delregno@collabora.com>
 <20240206120748.136610-5-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240206120748.136610-5-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_070941_436976_1ADC96F3 
X-CRM114-Status: UNSURE (   9.24  )
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
Cc: p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, daniel@ffwll.ch, matthias.bgg@gmail.com, kernel@collabora.com, airlied@gmail.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 06/02/2024 13:07, AngeloGioacchino Del Regno wrote:
> Instead of open coding bitshifting for various register fields,
> use the bitfield macro FIELD_PREP(): this allows to enhance the
> human readability, decrease likeliness of mistakes (and register
> field overflowing) and also to simplify the code.
> The latter is especially seen in mtk_dsi_rxtx_control(), where
> it was possible to change a switch to a short for loop and to
> also remove the need to check for maximum DSI lanes == 4 thanks
> to the FIELD_PREP macro masking the value.
> 
> While at it, also add the missing DA_HS_SYNC bitmask, used in
> mtk_dsi_phy_timconfig().

-- 
Regards,
Alexandre

