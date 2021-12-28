Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBDCCC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Dec 2021 15:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QBZOdBD7B0PIaHHylTKvN9eduidzQQhE1Fm9kOeBIMI=; b=TCzdyds+1ssPXm
	6nGJg24lp7Yz3ms0zYTHnbLXxj7+WiBCam6dSliLITqiWbDjgBX7PW50v3uColVGqS06Keuex/TNJ
	1Z3bJxgnAZI2ALe7aHIk0nPRofELi+tYIC7V/4YaHU+7ms8M+k02DVqHa0+NeCUV9B2WO3K80v/RU
	zqPjzYIPXe4gnEcV2b178AWen0gOHTAuzAEaDz/wF24s9bODj1Odp29NE6rzrYsAB5B29/Jr9lZTa
	YzE3LYe/i3c1tiHZgOzefVqIww3ZAoqwvzbOE2Iw1bDe2su3C/DKZgkuVp/pjF7W7BnHx7UTHDzYo
	D8a90uDLLK9+Tbs5nbgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2E6f-001M7p-Sw; Tue, 28 Dec 2021 15:09:41 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2DrS-001GBx-SH; Tue, 28 Dec 2021 14:54:00 +0000
Received: by mail-wr1-x42f.google.com with SMTP id i22so38793981wrb.13;
 Tue, 28 Dec 2021 06:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=25qf0XUnbGHEj5vg+5G4WLH5F89cbHHWYGCIQ9dS1uY=;
 b=fxY3OcVQeu1QknWvAhC07wCcatiSI0pUUHId/HZzZ1pm8Mvt+9c4IniVsMFxvEQWXZ
 69nDOtXhTUKrYlXCEvKDPf6UkxV5L2F1r6iizH10fmZpGm00D91SHR+Iavb2yl20VAdx
 6ZhhNFYOfTirbi07w3gQPem7NLp22mSxtTthStSG6PsFBUdyJEAt7qOQFAMkH4LgQ5zc
 59UfcheyQdr3QXZmHe02a2JCtfL2nh8UO74GwrP3+f0JjuBXJLjY4yCv1Sei605sEvEF
 NhyAjzsLvaUai8dj6ugFs4kzoSCSMD5niHAM/vs8jnK2mbUKAob3VisluT05aI9KdOOz
 WCGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=25qf0XUnbGHEj5vg+5G4WLH5F89cbHHWYGCIQ9dS1uY=;
 b=zYRyD7OiYYvBXLM53zAPpVzNfxdJY3Fa5ahPWDGE5KiREKOdte8ESr4x2F+ykmzg6D
 C2wpLiO0G1VVDskOdg14uZUC193QpDpONlo10fDHW2CeEnk2HC8xxx0Z2cnzi1QCYVzW
 Mz5wX769luD0E2Q41oxSmMREACEPnRcaPvqA/ugudSZou6H0IzI5czXm6WFk0fMkVVqZ
 DctdF9RnmSZ0bJPEeNJZjq1mkF7RTDpALd+i2iZLDaQR+emf6e2s3a4V7GWrw3vbnX6w
 0EoNKF6d5WMWakOLIU2ch0xBLNFje2iROmIJMmlOGlnZHm2AnWdmgNBMMaUW7pj4jK9p
 owTg==
X-Gm-Message-State: AOAM531xHzmRFxwumVUQWs+qUGWyhKbm9E3pD2Snxx684ZlqLI8/KNta
 dZJB1CtuEOUyDkqscp4RwHk=
X-Google-Smtp-Source: ABdhPJxHVFXemI/84jypP87JEPzJM3v8K0/yYjNa6T2mSJs3rhe4xR1SVFGvstCb2ymf1aisIUBVcw==
X-Received: by 2002:adf:f390:: with SMTP id m16mr16261571wro.589.1640703236599; 
 Tue, 28 Dec 2021 06:53:56 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.251])
 by smtp.gmail.com with ESMTPSA id l26sm18003618wme.36.2021.12.28.06.53.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 06:53:56 -0800 (PST)
Message-ID: <fcaccc97-e920-08eb-ec3f-4c4b11ea8925@gmail.com>
Date: Tue, 28 Dec 2021 15:53:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Miles Chen <miles.chen@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211228092527.29894-1-miles.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] drm/mediatek: Fix unused-but-set variable warning
In-Reply-To: <20211228092527.29894-1-miles.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_065358_984649_C1E9C727 
X-CRM114-Status: GOOD (  16.33  )
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



On 28/12/2021 10:25, Miles Chen wrote:
> Fix unused-but-set variable warning:
> drivers/gpu/drm/mediatek/mtk_cec.c:85:6: warning: variable 'tmp' set but not used [-Wunused-but-set-variable]
> 

Actually we ignore the value passed to mtk_cec_mask. In case of
mtk_cec_mask(cec, CEC_CKGEN, 0 | CEC_32K_PDN, PDN | CEC_32K_PDN);


We are not setting CEC_32K_PDN. I wonder which side effect will it have to set 
that bit.

Anyway, if it's the right thing to do, we should add:

Fixes: 8f83f26891e1 ("drm/mediatek: Add HDMI support")


Regards,
Matthias

> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
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
