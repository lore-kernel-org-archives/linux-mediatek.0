Return-Path: <SRS0=WlSZ=LD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 742FCC48BCF
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 14:28:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42AFB6136D
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 14:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42AFB6136D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dJvofYk3C5I8E08sedfaaghqJfpWFCjKypIeeASeRAk=; b=bk7I655XZGmQ5R/uLL3pWelNA+
	UiDTT+N/d3MSckRUQ/CreB+3CqO8zmDStc8clNugSfB6tVrCXM/YiRvxcXhLY8VmXbI8vR7k/d6qC
	/GInQ2mPn7svFDCCXLr/zgGRFBsLnzGTc5ulUATbPFWJBDQizKxt4EP3N+ugBgceqTeu6fupUNxZI
	oHbj4gsN9+3nev35mMF8gCqmP97i6TeyQxP3FxRKYLWdyalWt2FXj9llcla6TJgQbnbWrmKh4T1+R
	9uMU3+kPRNnb7BVFT8DrEIDO5DxO6Jy3j1PkVbu/TFIcwePFf/76nFljjb+o6g4pC5jE6CQ/LAQjb
	F72b9MlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqzBv-00EJO2-1Q; Wed, 09 Jun 2021 14:28:23 +0000
Received: from mail-wr1-f52.google.com ([209.85.221.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqyef-00E8XM-KC; Wed, 09 Jun 2021 13:54:03 +0000
Received: by mail-wr1-f52.google.com with SMTP id a20so25657896wrc.0;
 Wed, 09 Jun 2021 06:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0acANAgz0MlP9hPrB8I/frs/iBRqhU+q6XEBhj3gv8Q=;
 b=Cb4nEUXmhZvh1I1hdtpEsgGzcI8hqQQrc7hh7BmIb/NX9p0nBm+QjwFq9gL6Ze2N9k
 5/kF/QBn0UJ0x7F6q/wS/GIekJmnYYdLBYYwnYGSwRI8T1fFvnS0Vt3wj9kG6zU0uN0H
 ZFPOXyzQVSXJJbyAkKMZ/rIMtRGWVYMRDbH30IuOvtdrAUkcjtlT+BNnp+toj6YK68x+
 SW+2wbaS6w12L2ph1J9OfxsbLKm6oQc0N4ZXjcenr30sAKY3LkKYddG/44vFeDVCwMyZ
 s+hkxsGE2LffD4jYDQDPDULTxBaqYCM1nxoPITOvQOymZOUkwmXNOGqH6G9uQtQPxHqg
 NrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0acANAgz0MlP9hPrB8I/frs/iBRqhU+q6XEBhj3gv8Q=;
 b=Cy3JACg3NvDFkTabpBXdSItFiyX5ARRWPZc89dtoK6uZZ6770OzzU6L8OdGl2YR6Oo
 5Mg09nRpAP6ysiy8iZ24pn0GD3yEOl+i2ihI+8/qUmjXonfqofWUBmaF47zjBWL9yyG9
 Ki2+CY67eKnQdkEu3M2+9UoIJLgzMeCFfc/2JVAqN7Pt+LENNFCcaZRVnKB2eZe+b8gZ
 rPdi1NbdXUoL9RVr8Bg6ArwS0LC+YoJgQcl06yom0YHAs/ugGsCvZgKuwIYMtezLzlE4
 T9p2Kh4G3cZdPfpPWyfsax5SszdFU8Vy9ArqP5yvsM+7PaBuso6Fiojxmsqoj27MqnAo
 dMIA==
X-Gm-Message-State: AOAM5336P6f9uFafeikZ0S0/y+V5XoSne9FThR4x8v/xXgdGmU34N8Vv
 0yVUpwkjXj6c3SMd9v0IZz0=
X-Google-Smtp-Source: ABdhPJwdmtEhrw/I6sV9OLtji5VUn/ZbC7buSNEwtJICXxu0yAJLmTXM7NFYTrhsWxKQQG1r2WrGig==
X-Received: by 2002:adf:9d81:: with SMTP id p1mr27685928wre.287.1623246779787; 
 Wed, 09 Jun 2021 06:52:59 -0700 (PDT)
Received: from ziggy.stardust (81.172.61.185.dyn.user.ono.com. [81.172.61.185])
 by smtp.gmail.com with ESMTPSA id v16sm10195wrr.6.2021.06.09.06.52.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 06:52:59 -0700 (PDT)
Subject: Re: [PATCH v5 09/16] drm/mediatek: Use pm_runtime_resume_and_get for
 PM get_sync
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, anan.sun@mediatek.com,
 chao.hao@mediatek.com, ming-fan.chen@mediatek.com, yi.kuo@mediatek.com,
 eizan@chromium.org, acourbot@chromium.org
References: <20210410091128.31823-1-yong.wu@mediatek.com>
 <20210410091128.31823-10-yong.wu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <299857fd-533d-5e6e-0744-92ee56078638@gmail.com>
Date: Wed, 9 Jun 2021 15:52:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210410091128.31823-10-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_065401_738763_D52C7247 
X-CRM114-Status: GOOD (  17.93  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 10/04/2021 11:11, Yong Wu wrote:
> pm_runtime_get_sync will increment pm usage counter even it failed.
> This patch use pm_runtime_resume_and_get instead of pm_runtime_get
> to keep usage counter balanced.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 8b0de90156c6..69d23ce56d2c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -259,7 +259,7 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
>  		drm_connector_list_iter_end(&conn_iter);
>  	}
>  
> -	ret = pm_runtime_get_sync(crtc->dev->dev);
> +	ret = pm_runtime_resume_and_get(crtc->dev->dev);
>  	if (ret < 0) {
>  		DRM_ERROR("Failed to enable power domain: %d\n", ret);
>  		return ret;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
