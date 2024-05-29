Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945F1C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 06:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l8XM/FgEx6d8NuTgtXrGUs5+LoMJwxG6LNXhNDqRvo0=; b=mM8cRit9RXNyk26xuDzAa13/zq
	TbbI55eZcVOJ6PTSNm45ptmU9JyXN6g1uXt7pVkIq8wW2Ic4XH7yX0qxbVO3lbWErjjCLtiDzZB29
	6uqeNXyRTcyq3nxA1pcCLOC/CZ98eB8cEQZL0uXgRYbMU+TQJ0eAcZrFZOzNx1CqWpNuCenRRcz2s
	JVr/EGy2adrvOj68PGYMnWiYqNHiTE36nBq2uTv8LPU+ZfwsENdTKkqVxwYeeMNDyNwkO2HSrXehf
	MFnU20LnitrDgV+Vvf8gnZuBoEWYW5QQJ9KdQgkBLsrai7rhbwyoeFwUXsRN+JIcLxxxO7i9zpoU4
	noSzUrNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCDEQ-000000034si-1RhX;
	Wed, 29 May 2024 06:56:18 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCDEN-000000034qe-04i9
	for linux-mediatek@lists.infradead.org;
	Wed, 29 May 2024 06:56:17 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-52b1ba74d39so212846e87.1
        for <linux-mediatek@lists.infradead.org>; Tue, 28 May 2024 23:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716965767; x=1717570567; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l8XM/FgEx6d8NuTgtXrGUs5+LoMJwxG6LNXhNDqRvo0=;
        b=pUl10l/KNrCq1TVW1Xy66EbMD7JVMYz2L/pgNSvbtf6XorlQDJyUQsxqg0LRcpbGJ/
         wXtDE9VpxkgsLs7LwTwSmqEqUgXJbjHW+WwAS1/NPXSpE4K+v5x6NwgGJJu2AN0c2NH+
         0aM+nEWyzIXorNfGMZlTzrHiZ/0M00nKfgF1N9+VW4WSvGblWY/KIh5ehz5iLRs/PeKD
         fHp0IP5aG2qVb/frScnyvDQYd9H0Ei0VcJTZ+9XmrDg6ZP0t1GwrY+IdZGttJJZmvIeg
         8t3OL5pcp1khLBKWjJ+JzQfauU6V1iWQUYSwU7QX+QZIe9VxstMd31QrrR7RLRrTrVPd
         RDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716965767; x=1717570567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8XM/FgEx6d8NuTgtXrGUs5+LoMJwxG6LNXhNDqRvo0=;
        b=v7gPZUH/wT7dxsGfEnAJ3BclkxnxPiQm5U6kPGbMifqZDthHGhxiumnCEszwsmJNbC
         +f7MXbfeVL2xp0E8FThaZIO9rkDxEzFAzOf5ilnCAmDSJfo9/c0jbQNMxl4eOLFdofmI
         VU/CmJtE/P38SR5im+4V2RsPPtLPhgGLgyd0YMAEog/Vh20wZnoFVWTuRqyatlDEx+t/
         RoYh03iiL/j3NjUgtjcdoEWBFn8Bk1KN9i/5aGmIew+pj1n7U4Y7jaeAq0JkwuWmR2yT
         vbFtWFzokNqTlE0d50ZOzF4bpKB/P15r6B3qvy+7e3pOPcGMfNLuy/8RHvOWuZje5FjG
         tORg==
X-Forwarded-Encrypted: i=1; AJvYcCUu/Iz4Exh+ri3Ye/ybuKvdbEVF9yB1Zn3qYoxQ8Qp9otjK2NVBhyJf0wEBtbqkhs+S4OcBTUP3ZgkG4ctS+/6MNGsztMnCIuOjhyAVI9F1oAIt
X-Gm-Message-State: AOJu0YyDTUjlO9hXjaCb+Rvb8h8vDGHGvlzoaNDe0uYWSGgYjzcWJv+V
	u6ozl398u+RXB9jS5JofMJ7jQsJ2p9ndF78r0RLe7787Xztdrtw+09NTCWy4cXc=
X-Google-Smtp-Source: AGHT+IE8Vr6rfevCpWjYYJnFoMwyjAbgft8519qmMf8AdXmrOTwD8aPPvmWsyWzNiVDX4RqJ44Re8w==
X-Received: by 2002:a05:6512:902:b0:51d:4af6:bb86 with SMTP id 2adb3069b0e04-529612c529amr9109860e87.0.1716965767480;
        Tue, 28 May 2024 23:56:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52aff3f65d8sm88039e87.181.2024.05.28.23.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 23:56:07 -0700 (PDT)
Date: Wed, 29 May 2024 09:56:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	david.heidelberg@collabora.com, guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	mcanal@igalia.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] drm/ci: uprev mesa version
Message-ID: <jzb7oa2qtbavelujxwzk5vmcchazvva4aynxo2ceoigthgth2f@j3kjkj6okmwz>
References: <20240529024049.356327-1-vignesh.raman@collabora.com>
 <20240529024049.356327-2-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529024049.356327-2-vignesh.raman@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_235615_091333_FEEB6BDD 
X-CRM114-Status: GOOD (  14.29  )
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

On Wed, May 29, 2024 at 08:10:44AM +0530, Vignesh Raman wrote:
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
> v3:
>   - Move adding farm variable and updating device type variable to seperate commit
> 
> ---
>  drivers/gpu/drm/ci/build-igt.sh   |  2 +-
>  drivers/gpu/drm/ci/build.sh       |  6 +++--
>  drivers/gpu/drm/ci/container.yml  | 12 +++------
>  drivers/gpu/drm/ci/gitlab-ci.yml  | 44 +++++++++++++++++++++----------
>  drivers/gpu/drm/ci/image-tags.yml |  2 +-
>  drivers/gpu/drm/ci/lava-submit.sh |  4 +--
>  6 files changed, 42 insertions(+), 28 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

