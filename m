Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B571EC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 16:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GaTGxsKH/0zGrAohuPHnxpte5eeK+4t4Fbj3JfDjF/8=; b=p6ad5KPpcq1bwJ
	hLW0DvUXTACsvOXGD2RezsGny6OnL99Zbqvisye/uZP+/9O5rulX3Txt0OKgsDAOJxIcBueVYIs17
	VnCJsyMKwMCdLDTJhffYO3rg/6HBkAJLUYiOZS85hubwiD0qFj+t9l2/+aB5hdfq2/OEAuTKezHJx
	5V2p02bOqtxvZXNmmDsE7s7M4/V5OHIs+FbEJmCYzfLzD10Bd4LYWH/pA+mTQrzCoBRFGsl2I74p8
	viGGKYptY3CYx/aJDJrVVuz8G341FJSDTDmNvWINGlUTt5rW95DBPPe6BBIpzXWPcxzlXNjTzxRdc
	1KAtpNb+6yPSWmunNWfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8P2W-009fuH-Kd; Fri, 14 Jan 2022 16:02:56 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8P2U-009fta-2t; Fri, 14 Jan 2022 16:02:55 +0000
Received: by mail-wr1-x42b.google.com with SMTP id d19so16493449wrb.0;
 Fri, 14 Jan 2022 08:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xZzF8jRq/y/h9eqJLnj+PjpGmcmPav5EfqP3FY3NYi8=;
 b=V0aYU9lM2tThUDewNR5coBOdW+kY8Mvww7QlK8ifg2d/pqtYeCEz5U18blbnxmXsRy
 b6z8n+PdphvpY4Tp4G6aZdBMmPDk/T/RpWFhkivQbwBkJWBldglHGky8IK9cwu51HzmM
 w+gzXxJo47L/wEUJgiKP80YTs73vI2MwAgaJJ3G2Tzhuqkbk1LRvGyU5oe0r3XBUpwd/
 aMgkUxQDGnprMTKsym76aHy5xGHCeefPwBcN2QBwspbHnjnLrXCrOwUDndgDadLg1bRB
 b3pNBcnqBxsEY3hWK9Ifxgk1i3tuJwnYZuF8n60p4fOF4c18zsf7ovExSTxgz9qGF5Ms
 DWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xZzF8jRq/y/h9eqJLnj+PjpGmcmPav5EfqP3FY3NYi8=;
 b=nxYFbL6x4+Y7/TVuW/H/28zI4bWgwuoFqYrcY2LOKW2I1AIa1dmYJDkmfECIcKg/cN
 3Ky7z1pGJg0zSdmKjNW1B2nEkeXsaToURBB4KutmRYjoOA/c6FuH7vWhUyiajdQ4Wcg4
 WkjTnJoyi3/rlrv2POIzlsnWRCNZZvIadX1vj1/VWhDDMU0GSv7m9UEucuGeDjYVho1c
 HmBESo4gJltn6TwlNNaXrQlc/CnoMOxPPUygtxfO9M/A1lwSW2uTYaeM+EYcHWNkeUes
 Qqf9QaQoxBNsVYyqpgN4V8tUIDEg/6RUWJSoQgI1/aj/xg7dpj7IIXs6nvZ6ZvQ+rx5B
 s++w==
X-Gm-Message-State: AOAM533N0R1fHbyaRPNINCUcD0aZ4R/jKuweO4b5Co4n+1Oas+QB2wAg
 wTSu2gTDFP3ZlYcke4Mm+Nw=
X-Google-Smtp-Source: ABdhPJz3vgPy4mEKsWeLWZJldjyCHIe5FYzFAjuNKRgD2AKZZB7ntFwrYzveqy5NL+dYmtVd2No7Xw==
X-Received: by 2002:adf:ce07:: with SMTP id p7mr9023006wrn.329.1642176172085; 
 Fri, 14 Jan 2022 08:02:52 -0800 (PST)
Received: from [192.168.0.14] ([37.223.145.74])
 by smtp.gmail.com with ESMTPSA id x8sm5487523wru.102.2022.01.14.08.02.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 08:02:51 -0800 (PST)
Message-ID: <56d0a5d3-65e7-db59-7704-e9868952bb45@gmail.com>
Date: Fri, 14 Jan 2022 17:02:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4] drm/mediatek: Fix mtk_cec_mask()
Content-Language: en-US
To: Miles Chen <miles.chen@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Junzhi Zhao <junzhi.zhao@mediatek.com>,
 Jie Qiu <jie.qiu@mediatek.com>
Cc: Zhiqiang Lin <zhiqiang.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220103054706.8072-1-miles.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220103054706.8072-1-miles.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_080254_195491_12A9EC39 
X-CRM114-Status: GOOD (  20.74  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 03/01/2022 06:47, Miles Chen wrote:
> In current implementation, mtk_cec_mask() writes val into target register
> and ignores the mask. After talking to our hdmi experts, mtk_cec_mask()
> should read a register, clean only mask bits, and update (val | mask) bits
> to the register.
> 
> Fixes: 8f83f26891e1 ("drm/mediatek: Add HDMI support")
> 

Normally there is no new line here.

> Cc: Zhiqiang Lin <zhiqiang.lin@mediatek.com>
> Cc: CK Hu <ck.hu@mediatek.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> 

Neither here.

> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> 

But that are nit-picks. I leave it to the maintainer to decide if he want to fix 
that when applying the patch:

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

Thanks a lot,
Matthias

> ---
> 
> Change since v1:
> add Fixes tag
> 
> Change since v2:
> add explanation of mtk_cec_mask()
> 
> Change since v3:
> change misleading subject and modify the commit message since this is a bug fix patch
> 
> ---
>   drivers/gpu/drm/mediatek/mtk_cec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
> index e9cef5c0c8f7..cdfa648910b2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_cec.c
> +++ b/drivers/gpu/drm/mediatek/mtk_cec.c
> @@ -85,7 +85,7 @@ static void mtk_cec_mask(struct mtk_cec *cec, unsigned int offset,
>   	u32 tmp = readl(cec->regs + offset) & ~mask;
>   
>   	tmp |= val & mask;
> -	writel(val, cec->regs + offset);
> +	writel(tmp, cec->regs + offset);
>   }
>   
>   void mtk_cec_set_hpd_event(struct device *dev,
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
