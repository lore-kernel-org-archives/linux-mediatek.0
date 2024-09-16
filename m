Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5ACC3ABA2
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Sep 2024 16:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O/DYkCdH/gmU3Os/Pwqx0cgxO12Vdt0xg3X05ImTUp8=; b=tqVzAup+cN8sQSk3FDslDWVqSz
	tNIPzMnq93Bf1ZPjHKvhgZJsBtPu9Cy6J3e8vd+w9hScnck4Gyo3tscBWWuIRsj5bFopxA8Vhem9X
	sGUUc70sZ3PVkkRQdCOX7iZ+MnlVeTNDBknAPCslgC0J72JE1EzkyQ3rxPxb5QPoKpqnM3b7/D0OY
	iXPfUxp9bRRCpYYXiFEDD57doozwMjGIA1u0HPdhVYcp/0oWzH42AjeeBQAryM/ruRK8wrDiS/wdv
	q2qUtevZ48Cyl+KUyu+0QoQqyr/avK4POKFN4YAsL8D49CbC2dDxUDbwTqYdzPJtrKne/psflz0xs
	Ov7PD/4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqEYk-00000004S9z-48EA;
	Mon, 16 Sep 2024 16:26:43 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqEY5-00000004S3l-3QRV;
	Mon, 16 Sep 2024 16:26:03 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-42cae6bb895so46515865e9.1;
        Mon, 16 Sep 2024 09:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726503960; x=1727108760; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O/DYkCdH/gmU3Os/Pwqx0cgxO12Vdt0xg3X05ImTUp8=;
        b=Mrvplb1WjDS68YEmUXEKiTGEs7RMrGhWn8o4rGKWzDuqN6SIJmIk7BdPMwxuA6FwJ9
         NjlxKjhIOgT+lnRZrT+xboC9Kml4jtgLmATYLIZcQRBz6R5aSL2/MUKBepdV8vUnmneW
         HET+eDi6s3n6nwzzY+Rqx2pHrnSXwx4LmeNcGVis3uT7AjhgU8jy4KPsjEi7VB/p+Jrb
         ZFCw5qksCXu1QSH+s2KqaY8pkH6+NY2KHpzkf3GkfGijj9zGwHvDRrNFFPDG7GZNWH0b
         UbciH+3HpWdMIsPXU7JEyc+DPwyk6bLXO8Mm7JkgsvG/Ph+1NtPOthtgVkwZ7XpoQe0Z
         vZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726503960; x=1727108760;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O/DYkCdH/gmU3Os/Pwqx0cgxO12Vdt0xg3X05ImTUp8=;
        b=jdaXF0vj40FWZnyUhdZTdhxYYZBhguL8XSH8x5x49kzfdA3P054X9iUL+AQedwOzwi
         2cQl5q+nXUSLAMZZ7+RhLh8jM5mzwMRnEiqY27TdSrwWX/YDJNQiej0KBoc1sk1EZ3CV
         2iCNdLY/YQVvBQt8CuVUftZQQw7pZUsxYplilntkRk78gXGFbYpLwaZMzT6dYi37nMKE
         xQNqext2OwG0oqCEd6OuSm5/pWmu+v4IsqFZPjdtYl+zD5cYthln3l6EWzuy8wuY4O9J
         /St/Ju0ewS4oIkgqsPRWlUD+KcdYwSRmDwJ5ZgNhliSMW+cm0ljmG8yBYNJBa+XRNlG/
         JMZA==
X-Forwarded-Encrypted: i=1; AJvYcCV5iOuSbSMzsNjcpEmVa75FFO8MxpjK2izRrkT5rK2S13H1XCLcvQwHWb5m3J1GzuLnPZKqDhINfOjQAbtSXpk=@lists.infradead.org, AJvYcCWVc0/6rPsufmkA1mHHI9WheCwrATTRLamhproTuW/JaN09nOGLCT8cv58J2QoucDi+jIdXtWmE5zwwOwHxJFWJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxcVoO7iWycnCSRfeIZ2+IMerVRCyvRlCsu3pZ0flMqFVUXwz6C
	tQ0FNwvqSyP4pD8BXwzhB44VhcQTwyC8URZpk/ldA1sJ5M0j7SJi
X-Google-Smtp-Source: AGHT+IHdtK4eYtnmHmLxW/z0qkevWcipo3F4LfK611EvaMbZJea3I5V4XWBz27XMAZ+Qt+QiI0wJcg==
X-Received: by 2002:a5d:4811:0:b0:374:c6ad:a7c6 with SMTP id ffacd0b85a97d-378c2d065c0mr7874708f8f.20.1726503959418;
        Mon, 16 Sep 2024 09:25:59 -0700 (PDT)
Received: from [192.168.0.10] ([178.233.24.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e780defdsm7485344f8f.115.2024.09.16.09.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2024 09:25:58 -0700 (PDT)
Message-ID: <63ca91a9-f2f4-483e-b7bf-11febcd49f1d@gmail.com>
Date: Mon, 16 Sep 2024 19:25:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/mediatek: ovl: Add fmt_support_man for MT8192 and
 MT8195
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Singo Chang
 <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240915161245.30296-1-jason-jh.lin@mediatek.com>
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Content-Language: en-US, tr, en-GB
In-Reply-To: <20240915161245.30296-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_092601_894642_7D01AE0A 
X-CRM114-Status: GOOD (  13.40  )
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

Hi,

On 2024-09-15 19:12 +03:00, Jason-JH.Lin wrote:
> OVL_CON_CLRFMT_MAN is an configuration for extending color format
> settings of DISP_REG_OVL_CON(n).
> It will change some of the original color format settings.
> 
> Take the settings of (3 << 12) for example.
> - If OVL_CON_CLRFMT_MAN = 0 means OVL_CON_CLRFMT_RGBA8888.
> - If OVL_CON_CLRFMT_MAN = 1 means OVL_CON_CLRFMT_PARGB8888.
> 
> Since OVL_CON_CLRFMT_MAN is not supported on previous SoCs,
> It breaks the OVL color format setting of MT8173.
> So add fmt_support_man to the driver data of MT8192 and MT8195
> to solve the downgrade problem.
> 
> Fixes: a3f7f7ef4bfe ("drm/mediatek: Support "Pre-multiplied" blending in OVL")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 43 ++++++++++++++++++++-----
>  1 file changed, 35 insertions(+), 8 deletions(-)

Tested-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>

Thanks!

