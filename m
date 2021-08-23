Return-Path: <SRS0=it3p=NO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D2B9C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 10:17:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6DC361248
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 10:17:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D6DC361248
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rKuPC/J8okwYWIxJpLMPw9m/EWVG+0apLPSMR3IphKc=; b=UwyZTLvbt01aJZ
	46Qb+7IjiC6Qg3vgLlDNJ0YH4cBgGQJuNUPe44MWLreNmNxrrbY+ZPTKkEcYYlMAb00ERd77X/k65
	Fk4jWco/zoshSUMz1YHvJOONtR2eqW1Jdt6R1p/eA4+pv49rmAufnQXxk4CfMMHydKd+oTfuMrGRq
	jTVHqUQIXH4m9OzXktBLl+9eYmLpFpeblF6Oee4jB1KJGuIRmpOSmrzv/X6saAiH/mBhXNexd0vM8
	lvPpuWLNA2O0qZz1rZAIodp68pH6ef6hMGiF9H/JvbbZxLqEVpm7TneVJTCBbuK34vbGJCbTEn0Mp
	+p6jtsGUE/pgxmKBQtPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI70v-00GJbx-SU; Mon, 23 Aug 2021 10:17:09 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI70f-00GJVv-Cy
 for linux-mediatek@lists.infradead.org; Mon, 23 Aug 2021 10:16:54 +0000
Received: by mail-pf1-x432.google.com with SMTP id 18so14933519pfh.9
 for <linux-mediatek@lists.infradead.org>; Mon, 23 Aug 2021 03:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9sK/RO+vAHWLBWoM3ZyA29r4bWb/1hcnS47SNH5khGc=;
 b=wQBC/gwt1+LStQC2ASYvn+IHLUg1RkDC7LLqbN852KwAQDHhT7TvSognZ5nzBxFR8Y
 f0+WCGa4TsHPsSI+esH7OPVRGqU+gOqsgyi1cGgx7DgMOZEfpQFzmsCpo9clJte0DI0J
 D46kyX45RpcOK6WNk0hwAQht6Z5+xpZ3dti1KfOfkQMdru5v7J7VFz16cmeTisU8/xXQ
 QtE0Wp0V3ZTjmQjs8NosQQrxYcGkKaCBgniW6eKWE5bHk5T0uKP6qpVX2QKuNtHzjWmz
 800yWoY4Rb0KzL6mX1yGLo0lMU7DQKPDGylyPd84FsF1ar8fBlPeeeF5JHq039hw5qtJ
 BXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9sK/RO+vAHWLBWoM3ZyA29r4bWb/1hcnS47SNH5khGc=;
 b=S93HSVLncPZmmgRPT1ESTxB811x4W/hVQhmZNJRPlvk3DikY1XYr+VaWYJ+n5XYPKv
 zuQ9MfzamGubkLYmtdH990PiVQfx4w5A8jiAq0NsBGmKIdgoLoRPVMkcLTESe3nvGUEC
 qoz8nHIElDNLvasgoRsJD3IaJG+DZY9gGmO313c1GWqB2If+3IQcf3gFvQiJGFQkL8n8
 zWYcRGwZSUrRjTcijwLaCE5UTkWMb30wkM6CMGnIxzd1v5q/jP5TiH6sM6oLfagGFBwl
 k6ZN8KUUwKQZUsC8+mPxIFfRklUwjWTSn/oz2mRo2+sa1TT1DKrda7vOA1iVQJG4mIu+
 Jotw==
X-Gm-Message-State: AOAM533xWgJvKziUHwBXcr0lYbR8d7sjqJvm1Ot7F3qDhESlkbOjP0X/
 V/3M9BwciFgPmVckMgrxEU+Atw==
X-Google-Smtp-Source: ABdhPJyRWj7JJ3uSCqHFjtFJri25dJ4A+gm2UzaZ6kNWYFkB1lyGxchigxCWWxBH8xmZnrvu7go3+g==
X-Received: by 2002:a63:5f88:: with SMTP id t130mr31596784pgb.6.1629713812275; 
 Mon, 23 Aug 2021 03:16:52 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:bc5a:af6a:3f08:a084])
 by smtp.gmail.com with ESMTPSA id x42sm15258542pfh.205.2021.08.23.03.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 03:16:51 -0700 (PDT)
Date: Mon, 23 Aug 2021 18:16:47 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Irui Wang <irui.wang@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Alexandre Courbot <acourbot@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Yong Wu <yong.wu@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 3/9] media: mtk-vcodec: Rewrite venc power manage interface
Message-ID: <YSN1j7o5+Tzk0HlH@google.com>
References: <20210816105934.28265-1-irui.wang@mediatek.com>
 <20210816105934.28265-4-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210816105934.28265-4-irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_031653_474154_8346DEB4 
X-CRM114-Status: GOOD (  12.44  )
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

On Mon, Aug 16, 2021 at 06:59:28PM +0800, Irui Wang wrote:
> @@ -105,6 +106,14 @@ static int mtk_venc_comp_probe(struct platform_device *pdev)
>  
>  	comp_dev->plat_dev = pdev;
>  
> +	ret = mtk_vcodec_init_enc_pm(pdev, &comp_dev->pm);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "Failed to get venc component clock source!");
> +		return ret;
> +	}
> +
> +	pm_runtime_enable(&pdev->dev);
mtk_vcodec_init_enc_pm() and mtk_vcodec_release_enc_pm() is more like a pair.  Does it make more sense to call pm_runtime_enable() in mtk_vcodec_init_enc_pm()?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
