Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E9BC04FFE
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 11:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gDt5zL9HqHL0LNTVxzu6RK9k/3ub+zUe1M1krBVr+UI=; b=X3FNB3Kcreh/0ollQUph5tXLsu
	7Dqcs5syUuG1Wg7nHhxPzWJVdLmc2jpIhnGqpxrdKlStVjNXagBgaJ2mdb2fczqlpJjawDXasf277
	Xyybmg9AF1NXqiOQbEoHb1TulTMYKL6F+d0w3uzEzg69aYosBasLHxvkrWeuj9EgD8Dqb1qH8AVBz
	KWMXtd/C1eXHX/6oVKDZKiC67F/YkzR19BIGEDqLJacyAXZpWltRRiLfZ0pM7iKGWDUS+gsyb+SkN
	n79Vv4I2ViiSysXsyqmR+wVcJZsi1Z6PRma9pSJC10/aoMQ/z5FzncXjQVtBN4sWc5mfUivUFoTzD
	/112eyKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s90nT-0000000EEUL-2tvq;
	Mon, 20 May 2024 11:03:15 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s90nQ-0000000EESk-47ht
	for linux-mediatek@lists.infradead.org;
	Mon, 20 May 2024 11:03:14 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-51fdc9af005so5175785e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 20 May 2024 04:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716202991; x=1716807791; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gDt5zL9HqHL0LNTVxzu6RK9k/3ub+zUe1M1krBVr+UI=;
        b=bmHpPXdUSwJ6cBQ5LYw9062E5m4tONJNOP+8WyCY9lMj2tTa/5BSy1GxIVnWkW2qPw
         pY5we+ekpPcKqXZOKv7J+pX1F5ifyNFWFxLGV0PErRCgQ6yZ/vt4vSOE6kuPumxTne5K
         7AOU8iGoT4zuUlS1X5ZGkWjXqfR6mYCwBGfBgqdf4xWKz/FnfMgx+T2GF6J/PLNgcEgp
         6X/+Mpo4k6NdR5+t1N+kSAU7JZ348wr15JO4OwGCkRI2qzUNzrWVUzF1iqd/TOxNkFtF
         g240WPuB4eqtn4UKK/ZuowHQbtncIx3wxkq/64jkhwUlIJkOe7Of3kaYuQQGTA+3raC2
         gVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716202991; x=1716807791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDt5zL9HqHL0LNTVxzu6RK9k/3ub+zUe1M1krBVr+UI=;
        b=MhhmUlNjHHFz5AFybCKNgUg1gRAmbO7+OKQCPRCWSjJY65p4z95dMnkpkp4h/F60Lp
         0ZMJ82hg1wUB1PDSIwIgXxqOYtfsKQ6Sh+NVldDqHqsSc4o8KlGEtXw5wlDoXGt6raeD
         KriLu9Ufe/Ddc/igcF9U0RT4Q/Tos+DhdN4qgD7v76vpU9sxxL7nxamWFxMkUxizK1AP
         F7e6zaM0HHyOOJ8xh9FzPNiwPlX76HUnSnBijEXmA45O0uv6bc4IS6H24V+VsjssbOUT
         riU8FxK+qcFQsBkPkUyC802nysYp1KRjKzkNcSW7C17ei2mcRgTWhPU+VV0pw6bLT1QL
         OGfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyIinfcf+hOG7vjtFac7td3cOAwTlnWbX0qnD0dPyQ9EFWiyCeTFVlS5JSwBgmBXrapki3C2AouYfer4Uq/jV9tPMHhJTtwGlndJ6BVwRuYxmn
X-Gm-Message-State: AOJu0Ywf6OrPa5/jdv35IU0Z1EQ7ua/QTcKfuAm12ao4x7yBCAnFH7r5
	oah1BOczV6irvCOFdNyyY2ZWmIJfQBqrTWuuAAjalucdzHRA4LLlrNnJIMssN70=
X-Google-Smtp-Source: AGHT+IEACx6wIZ/owZMa9fgLdIORVLGiIVgPJ5CApXgwF8B9qZycal7wPuLLAhEdV381KLhAEa79fg==
X-Received: by 2002:a05:6512:33cf:b0:51d:9291:6945 with SMTP id 2adb3069b0e04-522102785abmr29386158e87.44.1716202991332;
        Mon, 20 May 2024 04:03:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5225132505csm3241339e87.116.2024.05.20.04.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 04:03:10 -0700 (PDT)
Date: Mon, 20 May 2024 14:03:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	david.heidelberg@collabora.com, guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	mcanal@igalia.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] drm/ci: uprev IGT
Message-ID: <4hnd6bznqsp3ve7dh6uhz3ygs7yyapqcrainnqlhfejomcdbvo@htlnfpqb3jg3>
References: <20240517092502.647420-1-vignesh.raman@collabora.com>
 <20240517092502.647420-5-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517092502.647420-5-vignesh.raman@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_040313_048570_DD57937C 
X-CRM114-Status: GOOD (  10.30  )
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

On Fri, May 17, 2024 at 02:55:00PM +0530, Vignesh Raman wrote:
> test-list.txt and test-list-full.txt are not generated for
> cross-builds and they are required by drm-ci for testing
> arm32 targets.
> 
> This is fixed in igt-gpu-tools. So uprev IGT to include the
> commit which fixes this issue. Disable building xe driver
> tests for non-intel platforms.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v2:
>   - Split IGT uprev to seperate patch.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

