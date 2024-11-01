Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF29E674BB
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Nov 2024 08:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L0cXB2oLG+I0p8wPr8eMU8Ys0SYe6ZSBDu+SHl0SmyM=; b=Lj1cjoFicpsvhC+32ct4ShGXhQ
	jALtAzbunn8eP8CGyC5Ho10lx3Je3OhodxjOU+cLxBB3uddVDw39ZAhMv3zvT0yRXHr26/0wXZCiR
	IZAmNFDAoXz+FNFpIcApZ0kaWBLuftjxdoJXgP/Ha1F322EpEeJOB+Eb/UGyJvy6Zx3RwF7LrtsaC
	mlr9jfie47aTbvXBJiS1p2n/hXCCRjWB8YjYtC4MSGtlVCZBAII9PFg7E575AEUE07FkXIJitpuvv
	PeBOcZGCxWGjkFwgTv3HIHRuyGZF7UkTzPqu/gEXl3zf8FJT9gWAuPWGPC0mN5vYckyNVTPYYsdfi
	opG0Sotw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6nIL-00000006JaA-3ZTu;
	Fri, 01 Nov 2024 08:46:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6m9x-000000068MR-1ZGA
	for linux-mediatek@bombadil.infradead.org;
	Fri, 01 Nov 2024 07:33:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=L0cXB2oLG+I0p8wPr8eMU8Ys0SYe6ZSBDu+SHl0SmyM=; b=Qn6PzaPG/BQ6E9o0Sgr+8NlOSb
	HlM5oF3OCUGKOvzoKMaN8dij72b6Xf7WusJJJ230aTiF9f42PXoDZPRP7MthJDRUeDAzA8PFBVaQG
	tEqXZJ5oNp3Ds1OHJHF+7vsJXDwNyNA+VEaVcMi/rvJ8COiU00TI21vXCdtBje96kRPDxrEdOYBtc
	/eeJGemS6zQWHCH5fFyOtOFBV9CM/DNIjlfUZY71FmISKbQURfX5OTv4JCeHA6B90+pOzxZ8XziEo
	gwZ9n2wzT7XB1HWSogDUaDXKm1F3zDck+IBHRymcny9W9LIXkW3q/DnvRdXekBeuawP3X8e/KcnU7
	aOrF1k0g==;
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6m9p-0000000Adgw-3D7E
	for linux-mediatek@lists.infradead.org;
	Fri, 01 Nov 2024 07:33:27 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-7183a3f3beaso803387a34.1
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Nov 2024 00:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730446397; x=1731051197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0cXB2oLG+I0p8wPr8eMU8Ys0SYe6ZSBDu+SHl0SmyM=;
        b=ABxBKfBx/QKC7IXRdunV6FQ4uhkdaZfaPJlWLFr7sgqY8BAbcl7n+1b6VJwe1B3hrI
         t1Dq5E1dX+2gydVeKr9nnap2RlUjkyRA4RHVpDoqlO72s7q2X5ms/j3wLtVtT7Ew+uB9
         eFDj+TqY1SzpEmPP9lc286E5Wm83+ePTa8W6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730446397; x=1731051197;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L0cXB2oLG+I0p8wPr8eMU8Ys0SYe6ZSBDu+SHl0SmyM=;
        b=K56JnWPmLSvgdgdemulNPfHA/yt7uQ1d4tj4GXi48YjKEUN1l/FOoQA3j3caKDogaV
         pBYHZBXnARgiWGLcMo9cTGZ1RxetLnXASmweu8frOMGlqgY5xSRL9FanBnYlACMbfrRH
         inIt19oOHFRB9NIpavoTTWNwQynaf4emZy6zrqs24axxtczP0WJj+xdjSYN5W0PQTVht
         H1SxuzeFKiBXcvqjuEOkcuo6On5T9UQYk01gm+hUXh3/nm/0dd2+QLhEBMVTok5JU7Sg
         vtxrmpbB5VyPN163Nxpv7rsND4RWeBKaGsxdvMqquy7s/Pxm0kW+gFi7o8WfWm0uPF52
         tnkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXG5I0e1pUpNT4nbdXD2Pb1WIG1adnMowhJbIr4StBnMAud7CwY8wfrOdlaPkbjZs/nmR0K7YJIhQH26FJ9HQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp1gZ2qvYYpQ3ahKpHWuJIEPDenKRHWac4eTkGH0Mfo9ndZWqA
	UA1Gq+Ldk13PRGoq2atHW+Hbyu8CRLy+mMruUaHe0CmM2LpGQLZd17W6kPba/Q==
X-Google-Smtp-Source: AGHT+IF7PmhAZPjT6v19uhaxDIcL8ZqQPNKppM7diN4JF6fjnpDhQzbGaadEPd6E9VLB8W0ZrCAg1A==
X-Received: by 2002:a05:6830:43a3:b0:713:ce15:d4d3 with SMTP id 46e09a7af769-71867f1bcfdmr20115290a34.1.1730446397237;
        Fri, 01 Nov 2024 00:33:17 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8ad8:6f24:a74a:4668])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee45297636sm2003601a12.12.2024.11.01.00.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 00:33:16 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
In-Reply-To: <20241029111309.737263-1-wenst@chromium.org>
References: <20241029111309.737263-1-wenst@chromium.org>
Subject: Re: [PATCH] drm/mediatek: Drop dependency on ARM
Message-Id: <173044639489.1615222.7952709085038498555.b4-ty@chromium.org>
Date: Fri, 01 Nov 2024 15:33:14 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_073325_805357_0E7B993E 
X-CRM114-Status: UNSURE (   8.21  )
X-CRM114-Notice: Please train this message.
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


On Tue, 29 Oct 2024 19:13:07 +0800, Chen-Yu Tsai wrote:
> The recent attempt to make the MediaTek DRM driver build for non-ARM
> compile tests made the driver unbuildable for arm64 platforms. Since
> this is used on both ARM and arm64 platforms, just drop the dependency
> on ARM.
> 
> 

Applied, thanks!

[1/1] drm/mediatek: Drop dependency on ARM
      commit: 89115aeecf38bfee3c5e79561b5c34a256e1a06a

Best regards,
-- 
Chen-Yu Tsai <wenst@chromium.org>


