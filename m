Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B044C47258
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jan 2024 18:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GNwfPpOc+w6+qUvr4c6LiIOhhkOq06R1P3AdfBXYN2Y=; b=UiCmBr10HHADdFrVOB11fmUegc
	WGq2RbupCRNA+Mp3b4+fYlUBIwZ6rNxnl08VPpcAWE5rF5Qgrjnr/4ZhwB+K3o5h9NdOW0s9ml+4l
	lvoikSAZl5BDdoplNk9z5mSxhKfmCEiFx7T9lY8LWq6+zyQrSBUbWXCMewfytLdYxaHK0o5SbPtbp
	65Zk1NJz6ujlYg0ycoxkxNxxlPcnxY3g/FF4aGKVKN6/LrJ+clQCihTyr1+diY7UkJtPau0KJbqv3
	CCj+HdutPmAPrjTRWe0kvIJ0LZKZDG8VMawiIA1dwHG7wW5ylYRLzitYrxRAr80/Z85/8BEq7nM/C
	+2u5z46Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNzWq-000njW-2n;
	Thu, 11 Jan 2024 18:11:44 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNzWm-000nhj-1d
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Jan 2024 18:11:42 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3bbc755167fso5025998b6e.0
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Jan 2024 10:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1704996697; x=1705601497; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GNwfPpOc+w6+qUvr4c6LiIOhhkOq06R1P3AdfBXYN2Y=;
        b=YMS2RajpQQ71eu/F8BeBcMAElVTBWTyAib27FZD1kOHKcY6SfN/vG/KytqRV95wrn8
         fak9JCqkb0w5FM0gXVifR43Zj9earr5SNX7UQKYWzuna20Mbsh3fy1ZPOKUZUN9sN6Pm
         qLw16nAZwAURGbbiZbr+5Zl0sdWk3LR+0m4C4GLYK+QyoIrYGFHO4mva4PeJ0TejTiD8
         JSGYIx6PgXdG9Mm2ACN7tOwjJwPK1EvMC5fxVW6fNZSjJrJ/w8ZcnXlgcz6vIyU1VJnV
         zE9Eyh0wtEYbi6krfGWM0En2tibVdGog1AuZHIRqnNXufNV8/kHcLWKkAtdlWwsRfRjv
         CdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704996697; x=1705601497;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GNwfPpOc+w6+qUvr4c6LiIOhhkOq06R1P3AdfBXYN2Y=;
        b=BrkJcGPkeujCU6nPR7bJhzG6qS/kMkXi3nzsf9MmTMNf0ieLLGOEmWth11H4yymrWb
         eKTPdhNE1ItiHSpkxBbTkyDUYoPhP8Kkycun8qSsXnl+I69/9H1h1Nno6Q9Vyhm8YD6f
         pE6excFPnAQi34pFk10s7AvCCIy4co24PfOUC3Xoye0a2TJPwIoxe3R/vFjeVlUSfrEB
         9Ts/2+uRaB1NOif/Au60DNlC0Il2OMhAI2UdlWvWhAsA0AcjgVusbHgsgfDG8iBw37yn
         tV8IN0VCqRZRljmC4FDKXkBhJg+3qBO85znRXPJBYiWmOvyptgUQvThuyV/Gmj0oG+EJ
         Swjg==
X-Gm-Message-State: AOJu0Yy7VMkBfwUtk9LtOTJylsz2A5urnvRaHGITYY155apvd8LH8Ktw
	sgQbwQrFlTJx5Um3DoRPugWy5WV3za0bKLG002XGsSBP69OWgg==
X-Google-Smtp-Source: AGHT+IEOQA3VGINqdDq3XtCaDe7x77fu7+Iwu6ym4ijoXArXnWe9XYkfG56HHC5HEq3XFTuTf4bmEuP1OyFcAzpA/9w=
X-Received: by 2002:a05:6808:3989:b0:3bd:5006:e313 with SMTP id
 gq9-20020a056808398900b003bd5006e313mr78961oib.105.1704996696986; Thu, 11 Jan
 2024 10:11:36 -0800 (PST)
MIME-Version: 1.0
References: <20231220121110.1441160-1-vignesh.raman@collabora.com>
 <CAPj87rOMPioOK0r74vcnVkXusm6Nah6KNUWyxYgpVLdkMNtW2g@mail.gmail.com> <ad7cbd59-5264-96e8-5e9b-aafde8028e41@collabora.com>
In-Reply-To: <ad7cbd59-5264-96e8-5e9b-aafde8028e41@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 11 Jan 2024 18:11:25 +0000
Message-ID: <CAPj87rPRRfJmxTev50YqxBizyvzCUhCiymoV_bdqsZ-zvcREfA@mail.gmail.com>
Subject: Re: [PATCH v1 0/8] drm/ci: Add support for GPU and display testing
To: Helen Koike <helen.koike@collabora.com>, Dave Airlie <airlied@gmail.com>, 
	Sima Vetter <daniel@ffwll.ch>, Daniel Stone <daniels@collabora.com>, Emma Anholt <emma@anholt.net>, 
	linux-rockchip <linux-rockchip@lists.infradead.org>, guilherme.gallo@collabora.com, 
	sergi.blanch.torne@collabora.com, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	David Heidelberg <david.heidelberg@collabora.com>, Rob Clark <robdclark@gmail.com>, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_101140_726480_03671584 
X-CRM114-Status: GOOD (  17.43  )
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

Hi Vignesh,

On Wed, 10 Jan 2024 at 10:47, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> On 09/01/24 19:08, Daniel Stone wrote:
> > A better sequencing would be something like:
> >    1. add ANX7625 config
> >    2. refactor _existing_ MTK display jobs to use YAML includes, change
> > the existing job name, and rename the existing xfail set, remove
> > IGT_FORCE_DRIVER from the script since it's now set by the job
> >    3. add MTK Panfrost+PVR GPU jobs with new xfails, add xfail entry to
> > MAINTAINERS
> >    4+5: same as 2+3 but for Amlogic
> >    6+7: same as 2+3 but for Rockchip
> >
> > Then the separate rename/update xfail commits just disappear, as does
> > the removal of IGT_FORCE_DRIVER, because it's just done incrementally
> > as part of the commits which change the related functionality. It's
> > extremely important that every change can work standalone, instead of
> > introducing intermediate breakage which is only fixed in later commits
> > in the series.
>
> Thank you for reviewing the patches. I agree, will follow this sequence
> and send a v2 version.

Alongside Rob's patch to add msm-specific tests to the runlist, we'd
need to add the Panfrost-specific tests. Whilst we're here, we might
as well add the vc4/v3d/etnaviv/lima tests so they can use it in
future.

Panfrost should also skip kms_.* tests - since it's not a KMS driver,
it can't run the KMS tests, so there's no point in trying.

Cheers,
Daniel

