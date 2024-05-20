Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E3EC04FFE
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 10:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=icwVF42TmZ2hZjEXcduZvhpSy5tVelIfuJSjSBSENHo=; b=WXkh+k8n2iJnmGO7s7mvyH+A+0
	ODsP1kqH+UO3oQBSipwZ3MmVsZnHb0Qaj7PwnkSU0yw5/kurmbNf5KcDbyTs5UZeuhq44Jvv9LMDW
	HIQvmJid9mDSw55xI45N4BuDAWTQe/KJ23ppijGRrkSEm8LEmjh5EUi5rAdwkI/Et9HNj5Vv9DjN+
	45cBM4IaWv8+x2rjq0poP39U5xMfhbV8MiWU1YTl5cBrpDZL7OOX5qs1bdKMIl6MXJfl3hmvQad8N
	tLV+2e1HqDIIQ1y0zRHU5oncpeMIICbC8Pc8rVfTJb+rVBsIKrEc96BQcT8+3rBt1nExpz2uK5MaF
	pGLuR6zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s90UT-0000000EBiZ-3Ymg;
	Mon, 20 May 2024 10:43:37 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s90UO-0000000EBdy-1ubT
	for linux-mediatek@lists.infradead.org;
	Mon, 20 May 2024 10:43:35 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-51fcb7dc722so3667196e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 20 May 2024 03:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716201807; x=1716806607; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=icwVF42TmZ2hZjEXcduZvhpSy5tVelIfuJSjSBSENHo=;
        b=WhPs+B6L2+z9wNokzXkUDMHQ2ik9RPqpwHUOWb9XenZqNTHg3W15d9Bu17tmOf3MWv
         8cyuBNAzWLwKx8IVYHnxZhZYLAcbY2wk47Y1YgjAZg976X0D0bwHqjRWzZm++HXcv9ml
         rIsdrQeatyZ07ojnpLn92GYSaN+NOZaW90gURClrxFBz4iGaDpnRH0rtpOHeqeMB53E7
         htVNI5ipnv7GPgYUshmibcDcpx4nUv/mOEt1Oskn7Yj3pY48eo+Bhl2pdxvZH0dsjpPF
         9P2veOQFmwvvRjwRSWp1lNYiEVukNnRTiTvDiDEHEoSW0jGnILpflDcO2DfkLu5aiL7s
         C/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716201807; x=1716806607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icwVF42TmZ2hZjEXcduZvhpSy5tVelIfuJSjSBSENHo=;
        b=HWzz5fqzSzUNowm5bZba5lSyJDZOVITQiQho1sh4itEpxho7kEmC+uBvxo231vs5D1
         NNvrbm0cggRMq/qVseTC3CkfimJNq35EP/eICVvbtrRs9lsdP8x8NH5xS5GAzpaQznvb
         qn2CDmcu4tDDo7BDbMubipKjFBLDePhah1phdY8zmeLc5mm/Y/xpYw/B8LyDlgpF4n1P
         YlimxMigoI8uJQD/dY8N1c3HHFz3NdPmzeuYsgcF3kxc2QwMFyfcDCyl04uvidWUejRt
         1Qu9DSbfQmqnMo6Eg8OuxpVl7ozOhr91Thc4JTdopNlliYTSICtztAqUb7oGwuWGnrU1
         2KKA==
X-Forwarded-Encrypted: i=1; AJvYcCUlpKcmurOjwXH2VXu6cTDqgzfMuCIFCM2Vh8Qfxq9p4EPV8Ccsvii06vj6bNsp7rNvlf8m1Onug+evICI9qoKszDtEv+ZrgzRj69yU3pdAj8JQ
X-Gm-Message-State: AOJu0Yys3DTLxK4HyVVc38ojmohGNcjgsd7q5qXekr1qcighMCXu5CcD
	p1knKLU0ZYavyFzOW/vy0YSZJz7cXWFSMxCJPAlZrwNxQ4WA44TZUgXbL4K5mtU=
X-Google-Smtp-Source: AGHT+IFzot8n6xHV0OHm6wH4k0sEr+LYxBLD0eD+umJwBs/mAovf2bSRWjBos0WaEoAs2a0risJ1Ww==
X-Received: by 2002:a05:6512:4801:b0:51d:8ff3:f835 with SMTP id 2adb3069b0e04-52407cddc3fmr1595444e87.26.1716201806986;
        Mon, 20 May 2024 03:43:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5238bee41afsm2044239e87.294.2024.05.20.03.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 03:43:26 -0700 (PDT)
Date: Mon, 20 May 2024 13:43:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	david.heidelberg@collabora.com, guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	mcanal@igalia.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] drm/ci: uprev mesa version
Message-ID: <2qzmfv3oc6feihwxu3tl37rg6w3qsj2vddu5olvqk6vhqr26cc@bxu5y6ijvtfa>
References: <20240517092502.647420-1-vignesh.raman@collabora.com>
 <20240517092502.647420-2-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517092502.647420-2-vignesh.raman@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_034332_567842_055F3957 
X-CRM114-Status: GOOD (  17.56  )
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

On Fri, May 17, 2024 at 02:54:57PM +0530, Vignesh Raman wrote:
> zlib.net is not allowing tarball download anymore and results
> in below error in kernel+rootfs_arm32 container build,
> urllib.error.HTTPError: HTTP Error 403: Forbidden
> urllib.error.HTTPError: HTTP Error 415: Unsupported Media Type
> 
> Uprev mesa to latest version which includes a fix for this issue.
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/908f444e
> 
> Use id_tokens for JWT authentication. Since s3 bucket is migrated to
> mesa-rootfs, update the variables accordingly. Also copy helper scripts
> to install, so that the ci jobs can use these scripts for logging.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v2:
>   - Uprev to recent version and use id_tokens for JWT authentication
> 
> ---
>  drivers/gpu/drm/ci/build-igt.sh   |  2 +-
>  drivers/gpu/drm/ci/build.sh       |  6 +++--
>  drivers/gpu/drm/ci/container.yml  | 12 +++------
>  drivers/gpu/drm/ci/gitlab-ci.yml  | 44 +++++++++++++++++++++----------
>  drivers/gpu/drm/ci/image-tags.yml |  2 +-
>  drivers/gpu/drm/ci/lava-submit.sh |  4 +--
>  drivers/gpu/drm/ci/test.yml       |  2 ++
>  7 files changed, 44 insertions(+), 28 deletions(-)
> 

[skipped]

> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index 8bc63912fddb..612c9ede3507 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -150,6 +150,8 @@ msm:sdm845:
>      BM_KERNEL: https://${PIPELINE_ARTIFACTS_BASE}/arm64/cheza-kernel
>      GPU_VERSION: sdm845
>      RUNNER_TAG: google-freedreno-cheza
> +    DEVICE_TYPE: sdm845-cheza-r3
> +    FARM: google

I see that this is the only user of the FARM: tag. Is it correct?
Also we miss DEVICE_TYPE for several other boards. Should we be adding
them?

>    script:
>      - ./install/bare-metal/cros-servo.sh
>  
> -- 
> 2.40.1
> 

-- 
With best wishes
Dmitry

