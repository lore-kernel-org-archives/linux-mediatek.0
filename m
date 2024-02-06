Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA7BC4828D
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Feb 2024 15:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c6oZEpefRF0Tyn24g9i4ewrS1OGMx8/CRX4tNeqvynA=; b=r80x0rh/M23rUp
	svCmx78TXElgd8T4sy83PoqIsIJZ7jlopZFcoUwHiWhil4Ti45rqI2AiIcCPR575eAJdkZAQk8+g5
	aPeL639RLkbJL1WZQzmbE6qvZRymxkRvKiwkvepSw9R1WHg9PKfoY3V6GJgnARtZ7P72Lf2gnQeg0
	yVe3qdkVZ8Dit7OUYmsF/VlMMJwOFhZDRz7yE/Zj/RuU2v20qH7xmwmtPlcba6DmTybUaJDLG+8qe
	hbNnj/4qtr9ijqYmqDeRiCZlszmBVyDoi7BHWmO9lcElPxOjZkJgzd+KBVMbRudJhWsy698UapdS3
	kk9xbNmjT3EqDAz6I45Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXNJ4-0000000853D-1IGl;
	Tue, 06 Feb 2024 15:24:18 +0000
Received: from mail-ed1-f43.google.com ([209.85.208.43])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXNJ1-0000000851O-1nIh
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Feb 2024 15:24:16 +0000
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5606f2107ebso1419725a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Feb 2024 07:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707233052; x=1707837852; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c6oZEpefRF0Tyn24g9i4ewrS1OGMx8/CRX4tNeqvynA=;
        b=dXnMYlVpVOrr9j1d0bjNfqoq9LghrkvIQrPplu4xb02NP5cmaLsqSWH/da5tTKQTv+
         kQqiMJcP3C56j1xkWHUoa31pOBIgsCONaIiF5jt+My0fyZocQi4ygIGjY9Pf2EKrBUr3
         lNiKDfgrYBikkDZix8uTwPPX15urPIYn4MoKwAcXsJZPx0ojXbxhQvw8PkD7ROQiZdQL
         6O5MvMwNlIR3gnkWGJxf9HARwyMJQjUOV/DqOLwbmtRbP2tPiNTaZy2xc6QYr4DtHqBm
         o/DcvIL9tCJu4eug0xRK1R8PozJmbVtqek8ODokML9tjDVARFKyeVRrKHfnWmAeryS9L
         azgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707233052; x=1707837852;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c6oZEpefRF0Tyn24g9i4ewrS1OGMx8/CRX4tNeqvynA=;
        b=KtnhJQvL6lEJim9XpRw4qy0LSnmCY18yj+SRFng5abJct1yrqsHGXJqFQWNezPaEAm
         Ui2cFsdKgw/zNVygJLzVHo56AkgVr9n69pMXKV7JXVU9049Scr9ZUy/X0cxcduamUNGe
         cYTcszQK70AD8Lo+wKvBT/4yPR50msyDFPwSioavdBKjRVxApVI63Ht9atHTMQ3P7+FL
         O72pxdDvX5+o9hEZvp5wOQZ9NcdXBRenj2/7YidFY1lwS108x88K8YXiYCmIAmYFyQhN
         QMuBOqGUGRmxpCE/ywyGSvWto8CRGuP5jY3Z2aME+ER6XKxwToTqGxFLiDtj4QqwatH+
         Pm0w==
X-Gm-Message-State: AOJu0YxtmbrqosQZWVyr+1PEoxqvO5U8XOfxhw5okJdfzlOO6G6W4oGi
	RHTzMmTu/xMvlh8eLVn7CmZ+hanL0+RfBnATq7L29RiIu4bOUZhB1r7PJl6hw6I=
X-Google-Smtp-Source: AGHT+IECn1jgZhlrG7/6jnwm37Zc7btXkbtdP+hBe0rhldbgW5nxFV90J4gPvjCdN1SPFQYj6LTRow==
X-Received: by 2002:a17:906:f90f:b0:a36:f672:5dab with SMTP id lc15-20020a170906f90f00b00a36f6725dabmr3379018ejb.16.1707233052557;
        Tue, 06 Feb 2024 07:24:12 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUVPrzdjhB8UqYzeAqOPAW1mFIJ+nEKHTmOwLUcBxGgvscPTDBVF8z1qZTrHEFsvtpNhdImONs8V8ARS+FNS9Pxl/Zw05V/dFmhstQfk5/XNeatnegHKoIO8eR1DzgVzZmbqd+f/vpMbFtwGlxnFeIt5og1MDpqdLVxs5KvI3/tbpSZNzf+L7FDLSdRpGbYHqMLqCO7QvpK1YztVlBkmhJwKBjWsvDM2+8EDnTUw6gOR1aeT/oNfYbf6k5TvQH774/Z3iiBzAXBW5xd0IfA1fFHmPtyyYIibzTu5oi4A6ltGVhQBuQodgQIWk8RRq/g/Y2hN9cnFj/9gelQ2Bd8CeYa6ibQ6nt4SgxzeweuMR+KtddOS1Rns9BdHrLg1Uu6Ybhzo2N9SC7TeQCX7V5GP2TfdQvVEvVfnD/veg==
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id ca3-20020a170906a3c300b00a35d6482fdbsm1270170ejb.77.2024.02.06.07.24.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 07:24:12 -0800 (PST)
Message-ID: <282d07cf-97b4-423f-b148-42a5d5ff9d10@baylibre.com>
Date: Tue, 6 Feb 2024 16:24:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 9/9] drm/mediatek: dsi: Use
 mipi_dsi_pixel_format_to_bpp() helper function
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20240206120748.136610-1-angelogioacchino.delregno@collabora.com>
 <20240206120748.136610-10-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240206120748.136610-10-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_072415_475019_2265F6D0 
X-CRM114-Status: GOOD (  11.45  )
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
> Instead of open coding, use the mipi_dsi_pixel_format_to_bpp() helper
> function from drm_mipi_dsi.h in mtk_dsi_poweron() and for validation
> in mtk_dsi_bridge_mode_valid().
> 
> Note that this function changes the behavior of this driver: previously,
> in case of unknown formats, it would (wrongly) assume that it should
> account for a 24-bits format - now it will return an error and refuse
> to set clocks and/or enable the DSI.
> 
> This is done because setting the wrong data rate will only produce a
> garbage output that the display will misinterpret both because this
> driver doesn't actually provide any extra-spec format support and/or
> because the data rate (hence, the HS clock) will be wrong.

-- 
Regards,
Alexandre

