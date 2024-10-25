Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F8DD1038E
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Oct 2024 00:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R5EDM7WCg2HOqPHWF0Z+QG+aYFeqPcDdQtBhvkydGgw=; b=Ew9gKaxIIXjL7RGpnwjI5ucnkj
	+SkyxNrgD8La/OSy+JffUlVqOCuxPYP5vqmWBzPi5rC2WYVAgLHl5PiTwK0nG71iaZd/ahuh7T/hc
	cWiePhmPQtpQTHYUGKoo4tLikGP3tARHVUgvekGQYAs/J/re1y14mKhA8p6pMU4PPX9K19plEn4k1
	dypP1/5oxjnlrxStgETFYw3OgyhjviZD/hX4KG9rbwUr6AuC0VzQ/ybLGmlLhU5FNMBMTt2bvDiCq
	9/XmG45GFRqya4iijERofyOmAFxkYlfW4Tt9bbWF9JVeAK3DUiLJZs/cUFknr/72J0jd/biqlfucu
	VsJ5n9kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t485t-000000025Eu-1szO;
	Fri, 25 Oct 2024 00:22:21 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t485q-000000025C0-0gD7
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Oct 2024 00:22:20 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so1915367e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Oct 2024 17:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729815736; x=1730420536; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R5EDM7WCg2HOqPHWF0Z+QG+aYFeqPcDdQtBhvkydGgw=;
        b=k1e0g1ajcGE9RboUGt5RCLhLl7eTbdisFByI94CMYtnwDosCS2oj3cIytrIOkpHD0z
         ecC6ZHizshpHQqgw46yLi2hjEKTaf3YCabYvznMj95/lCdYr0eplO3zsDMsw08gqErPF
         jQMCI3sWzKQ2nAhDpL0bXi0cVwAUMw8bTR9VD5nzoqFTUgCe8UBT8HoFxetc86ZLW6Cr
         SkFrZDzoN4aW59lEopyl783wb3oB/9ZPuMs/fZp+0oKPylwDEiWLxGPXeiRdDmymlzDk
         9InqPmYUaQ/p8JVq5UJWAiNFPoJSMQf/2f+mCxhnztzEoego7tjiKo9kdqJhDTH4FAJz
         YZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729815736; x=1730420536;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R5EDM7WCg2HOqPHWF0Z+QG+aYFeqPcDdQtBhvkydGgw=;
        b=MrAY9KLpgzd77MxGoTJeUt4NkcEoK+/AMTAdChN8QY3ItEM4Ghqymh6+3kXXocA1Fc
         X/PlNxVBTgil7P3q3zOHi5hO5g97NrgJTpKAiTjrC7PDbESGqMWbe3l6pLB6JKQbBVIj
         RlaqyAJVySQSSgUoAq0/QcwOchULIHmrzP2KDQE4eCp+aAUVlpemwIa70B+c4bWa1fvU
         iqQi4OqSmte4RiC80jjotHVFqxyaZ4nS2HY4/D6byk54ASx6w66RQPif7gbAwKsCGCdg
         AZ6J92YvxA08WTdSyjhqX/ku37hODHKKHAxY1rdP3PBaXOa1sQJzLoHSNfXremPcSYmW
         QSnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGRTMO4hFQ4PZRRXN9GhxMSygteB61goLFIP+9Qlruw+NodCnt0VJuOixyjnlLzFQKU1y14FkAdpFawc0rdg==@lists.infradead.org
X-Gm-Message-State: AOJu0YymGFJj4E5HHDl/Zx2ycdC6ZStw3MvpR6yV7Wmsjl76s5TMypV6
	pqmxpsB3Ky0n3US0IcudPe8IF9ZQ5+DQFT1jA4hy8335VXH3ElLeVbFE0gdQaB4=
X-Google-Smtp-Source: AGHT+IEwuZSNpMSc/jRW5N16zJFZH30TVd1uv/g/woovx2Ntbz3yvr/09wQ54BLmhll7f9heX5zoUg==
X-Received: by 2002:a05:6512:10c5:b0:535:699b:b076 with SMTP id 2adb3069b0e04-53b1a31f1d6mr4467181e87.16.1729815736306;
        Thu, 24 Oct 2024 17:22:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1afe39sm6621e87.140.2024.10.24.17.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 17:22:15 -0700 (PDT)
Date: Fri, 25 Oct 2024 03:22:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Saravana Kannan <saravanak@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, JC Kuo <jckuo@nvidia.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] drm: display: Set fwnode for aux bus devices
Message-ID: <dz2tfpufzgmvxls2stxagz73x3krbammkc2zdycqsiy62tnlog@ztg4yujvyeob>
References: <20241024061347.1771063-1-saravanak@google.com>
 <20241024061347.1771063-2-saravanak@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241024061347.1771063-2-saravanak@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_172218_237513_442C9F3B 
X-CRM114-Status: GOOD (  13.62  )
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

On Wed, Oct 23, 2024 at 11:13:42PM -0700, Saravana Kannan wrote:
> fwnode needs to be set for a device for fw_devlink to be able to
> track/enforce its dependencies correctly. Without this, you'll see error
> messages like this when the supplier has probed and tries to make sure
> all its fwnode consumers are linked to it using device links:
> 
> mediatek-drm-dp 1c500000.edp-tx: Failed to create device link (0x180) with backlight-lcd0
> 
> Reported-by: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>
> Closes: https://lore.kernel.org/all/7b995947-4540-4b17-872e-e107adca4598@notapiano/
> Tested-by: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  drivers/gpu/drm/display/drm_dp_aux_bus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

