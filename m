Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C05C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 08:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=enlxS5GkWub7qfeq6FBQU5uJl3JqVotYfwFdD9Rt9Ng=; b=WKpaAorubVKk+UZ9+YOGb2+x14
	viTKzrvHEsseLgAH2FgS9OpwFkDWHfWnUOFv7WFjbefwEVLgZzotH4oDxIcJJKPeIB2vpffRrgjJS
	2RLQznKg2jceQgS2NAutk0koONmo1qSY3OgcAHAvF+VZDa304XxNr8uXehKagUHP4BcAqyG9/15Y8
	W043WnmWS2hDvfXtcJ8aHU+q+1QE/4OBxzFSUa+TKe79OGLGNEk5cvJASWWLW5FscdlwcS84VLfFS
	KfuuKoZyU+ga5iEsHLaS1BcuvCfZf20rIZp1wS62Q9SxrGRn8JGOHz2bCft1q+Ij9tGtFRrh0k5aP
	3vfDkM2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCENo-00000003IZd-2Zy0;
	Wed, 29 May 2024 08:10:04 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCENk-00000003IUK-0LIi
	for linux-mediatek@lists.infradead.org;
	Wed, 29 May 2024 08:10:02 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-52965199234so2003388e87.2
        for <linux-mediatek@lists.infradead.org>; Wed, 29 May 2024 01:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716970195; x=1717574995; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=enlxS5GkWub7qfeq6FBQU5uJl3JqVotYfwFdD9Rt9Ng=;
        b=OO07Fuvf61OoDPVRqYGj7bgtRiJzgNdxdYegvrqz5eau/vreEA5cJNJh0X6i44JBaW
         eHvmNjnYW+2Z8TH/iiig4kBZyLEYC1BZJ7xE0dn2c2x6fjjoxhd4dde0e5qKJRNEwdbQ
         K5N8KFZNuulmtBwGPsjXojzxkWqBLpif6Pixt7nvOy/kTpDUA/hmyqwL8wtye5ASLIP7
         KaJC6HYy8nDqG/Zdl9uZ1lCg+DKH59oIxQPUATunvdSnsA8LLbf4o1pQYByZRPtoc5IR
         fzcb6K1x/wk20DfzdetukeHgXhMrL1DB4f9mnB8uRNI199Bw2UDpOeDFO6mgT74SD7IB
         X68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716970195; x=1717574995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=enlxS5GkWub7qfeq6FBQU5uJl3JqVotYfwFdD9Rt9Ng=;
        b=TodJHjpBrrItCyZ08p+xyX+K41wReK8riBHYAUPV1+Z4SlqHgak0rVQ5b6GGmS+reI
         LTOeZLGkqXmshBZBsn5qRW+Vm1pSb/fEiPArh0+NDamhjPvijH1al3tt5/U5qxNfzJKe
         84DqQbFMKCMsNoCNK3GUJrDDb98TRcVfVncpJfl9KZIpgqDzzuddu5XF/fH5FlfICtiv
         ih2tGwQb+LZPX7XU6157QNNUySDh9JTcHDuUnynkk2pkBhbIOMPeU3EDJjqAFnio2Wmh
         GtZlJ5sHx+x2+DdwP3eGQm+YhNXe5qj2QwVX35qRW86t6ZXu0jN6RV2V4PonbZ0yW3+K
         Dx5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV9qRYRoCB1mIj3VkNitbhp6rA40patkvlRb/JkA4KXzoAaHAe7ZKG13Kxlf80uF/VCQQG47106VCSOvzbTH5ChkASPlFaDIpnl4cBo9cwi07qc
X-Gm-Message-State: AOJu0Yy27dT5Jd0Gj1V13IOjmzEX6fYwQD2VsjP7pMe8GGhVLOm+D9hH
	GC2FphwKTJj4RGor33OLk6MFFXy+ZNKZ4U141cMa1Hp92oXZYkKH9fWUWOnFLDk=
X-Google-Smtp-Source: AGHT+IHAAOSe1YF9ohma3qLilcNBhTgUrp5XW+R17Dfxhf/XQBKuTb9CXtbrrq9LBMBwT336LwrXXQ==
X-Received: by 2002:a05:6512:3128:b0:522:33cd:64bd with SMTP id 2adb3069b0e04-52964aba466mr8988769e87.27.1716970195416;
        Wed, 29 May 2024 01:09:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-529aa049e3csm859093e87.167.2024.05.29.01.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 01:09:55 -0700 (PDT)
Date: Wed, 29 May 2024 11:09:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	david.heidelberg@collabora.com, guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	mcanal@igalia.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] drm/ci: uprev IGT
Message-ID: <bj6mpegmxo6i5o34xyxwiytdaokv2u6p5iu4eoek3ctqimwviy@jbo5aw7gy4ue>
References: <20240529024049.356327-1-vignesh.raman@collabora.com>
 <20240529024049.356327-5-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529024049.356327-5-vignesh.raman@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_011000_169425_991A81AB 
X-CRM114-Status: GOOD (  18.02  )
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

On Wed, May 29, 2024 at 08:10:47AM +0530, Vignesh Raman wrote:
> test-list.txt and test-list-full.txt are not generated for
> cross-builds and they are required by drm-ci for testing
> arm32 targets. This is fixed in igt-gpu-tools. So uprev
> IGT to include the commit which fixes this issue. Also
> disable building xe driver tests for non-intel platforms.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v2:
>   - Split IGT uprev to seperate patch.
> 
> v3:
>   - No changes.
> 
> ---
>  drivers/gpu/drm/ci/build-igt.sh  | 4 ++++
>  drivers/gpu/drm/ci/gitlab-ci.yml | 2 +-
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ci/build-igt.sh b/drivers/gpu/drm/ci/build-igt.sh
> index b7d2a49a6db3..eddb5f782a5e 100644
> --- a/drivers/gpu/drm/ci/build-igt.sh
> +++ b/drivers/gpu/drm/ci/build-igt.sh
> @@ -45,6 +45,10 @@ MESON_OPTIONS="-Doverlay=disabled                    \
>                 -Dlibunwind=enabled                   \
>                 -Dprefix=/igt"
>  
> +if [[ "$KERNEL_ARCH" = "arm64" ]] || [[ "$KERNEL_ARCH" = "arm" ]]; then
> +    MESON_OPTIONS="$MESON_OPTIONS -Dxe_driver=disabled"
> +fi
> +
>  mkdir -p /igt
>  meson build $MESON_OPTIONS $EXTRA_MESON_ARGS
>  ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
> index 8f32de63d92e..1b29c3b6406b 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -5,7 +5,7 @@ variables:
>    UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
>    TARGET_BRANCH: drm-next
>  
> -  IGT_VERSION: d2af13d9f5be5ce23d996e4afd3e45990f5ab977
> +  IGT_VERSION: 0df7b9b97f9da0e364f5ee30fe331004b8c86b56

Let's land this, then I'll ask to uprev to
dc2d7fb4f978048b87707ea9ec32da748b01b378, which fixes an issue with the
writeback tests on MSM devices.

>  
>    DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/anholt/deqp-runner.git
>    DEQP_RUNNER_GIT_TAG: v0.15.0
> -- 
> 2.40.1
> 

-- 
With best wishes
Dmitry

