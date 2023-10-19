Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB39CDB465
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 08:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8Difn/D+XiTI90dIkn0xG+fv+x0la3KPldZ4kHjxUY=; b=jcitbqbDPkwk71et4o9hFoGvH4
	iG/Q3BB55TBYGuSjgyh4/qTpc3L6PAU7CKeLi6nYljC/KuyOQEnJB/Dwa7dzTVfJIeF73h65nUwG5
	zzK7u1hAVQTeAV2guvfmuKOHXLjYcj3r1BXfsp0iSDKM4BZu53PN58+7gkzuGSwjTL8nQBNRm+JbQ
	5SM6tYIZiIlNf+lmBrNhiZKkXeeG/39wuH7/H2Xut++6LvD4I5mqKl3sClmVM2OjyTuf9tfiCV0yB
	EkQ9AJeX+lrWg95onEzLPJuZjiQ75Hs/oiyclmHjqvn4eBDmSrMoEfj8E+ziPn8yZYzcmf3eG5nil
	pJs9h9uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtOLc-00Gi2B-2C;
	Thu, 19 Oct 2023 08:25:40 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtOLZ-00GhzW-34
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Oct 2023 08:25:39 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-53d9b94731aso13447091a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Oct 2023 01:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1697703920; x=1698308720; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v8Difn/D+XiTI90dIkn0xG+fv+x0la3KPldZ4kHjxUY=;
        b=OmR2A4WbhGU7rg3LnQ4VXP/P1ab1OCUbmHeiLyq0aD49ylfgRpJ9KPD/+8lgx6PP78
         xPGjdLsB1K21+rLEC1QOzAvGUKDhyw5k9S5W77mreqJTeAAZkGJhmwr6CuELLlSBd45r
         4trV7Tt25U3AYaE7PkCdsms91SnfRq3mc1KRQXiRMqFXaiZ6vzeqbG5T5IyFEK27M/0b
         1qsvNfDxPpvaXzfLqrOFZTpgmCxW2PFajrm9zgR3BJzOJ+IkPYmfW01WRrJm4+3FYd12
         dOD68db2Mshq92x0dYcfL1rAgY+1x2eT/NWYxZ4QvIryraLjBM6a6beBOl+Dsfb3r+8+
         Fnog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697703920; x=1698308720;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8Difn/D+XiTI90dIkn0xG+fv+x0la3KPldZ4kHjxUY=;
        b=nSZURb873KYwPbgfjltlSSz4wS+6BVX+xO99f83SVF/vwvyKpPxJJXzHvqHwJfBqbf
         F3xYtdAjlfLIACv0cepi6tMvzLl3TsiL6+gS66FGSLFrSVjdfINFU3qj/J9O7bH9D3ze
         vmdQGzzGiK3MOcYH1/b6cISwBMU+Dwzv950kBHySQJ3CDcPMDR/gTJviJUaToqUF4zA7
         Be05UDj8+S10YINaOAkTudDuIJ345xqGV5cM54jXSoy971D5bySF9ZEyy0bFq+iyv8ay
         WETI9rii3lrqnRK74s13K2E00wd+4B5U184lb5ze3wc7ayDneOwWrCj8Y/qB2da97gRW
         TzYA==
X-Gm-Message-State: AOJu0YwETB2Fi2+vTchh9HpMUdzmNNzf0UlLRDlp10YnOVaBYflSovzT
	rJ1DyFuFPpgZJfAnbI5BGMFW4Br3lR4m2Vefn0HB1w==
X-Google-Smtp-Source: AGHT+IERXq0bO1AmEurHewxhpzh6tNz4IbqMPHu+sifIOgs6RxCQnRc88SwKIglHJnVB5fDIiwqiPj8rxg9FYRI0joA=
X-Received: by 2002:a17:907:97c2:b0:9c1:4343:60ab with SMTP id
 js2-20020a17090797c200b009c1434360abmr974298ejc.10.1697703919882; Thu, 19 Oct
 2023 01:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <20231019070650.61159-1-vignesh.raman@collabora.com> <20231019070650.61159-10-vignesh.raman@collabora.com>
In-Reply-To: <20231019070650.61159-10-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 19 Oct 2023 10:25:07 +0200
Message-ID: <CAPj87rP=22Fw0h42U-p9fHd=6OHOu9Lj9kbpVMQVqL9U6BRE1A@mail.gmail.com>
Subject: Re: [PATCH v5 9/9] drm: ci: Update xfails
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, 
	daniels@collabora.com, emma@anholt.net, gustavo.padovan@collabora.com, 
	linux-arm-msm@vger.kernel.org, guilherme.gallo@collabora.com, 
	sergi.blanch.torne@collabora.com, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, 
	david.heidelberg@collabora.com, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_012537_987060_4B627AEC 
X-CRM114-Status: GOOD (  13.08  )
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

On Thu, 19 Oct 2023 at 09:07, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> +# Some tests crashes with malloc error and IGT tests floods
> +# the CI log with error messages and we end up with a warning message
> +# Job's log exceeded limit of 4194304 bytes.
> +# Job execution will continue but no more output will be collected.

This is just from GitLab warning that we have a huge log, so not
related to the actual fails here.

> +# Below is the error log:
> +# malloc(): corrupted top size
> +# Received signal SIGABRT.
> +# Stack trace:
> +#  #0 [fatal_sig_handler+0x17b]
> +#  #1 [__sigaction+0x40]
> +#  #2 [pthread_key_delete+0x14c]
> +#  #3 [gsignal+0x12]
> +#  #4 [abort+0xd3]
> +#  #5 [__fsetlocking+0x290]
> +#  #6 [timer_settime+0x37a]
> +#  #7 [__default_morecore+0x1f1b]
> +#  #8 [__libc_calloc+0x161]
> +#  #9 [drmModeGetPlaneResources+0x44]
> +#  #10 [igt_display_require+0x194]
> +#  #11 [__igt_unique____real_main1356+0x93c]
> +#  #12 [main+0x3f]
> +#  #13 [__libc_init_first+0x8a]
> +#  #14 [__libc_start_main+0x85]
> +#  #15 [_start+0x21]
> +# malloc(): corrupted top size

By the time we get this error, it indicates that there was previously
memory corruption, but it is only being noticed at a later point. The
skip lists here are way too big - stuff like drm_read is common
testing not affected by virtio at all - so we really need to isolate
the test which is actually breaking things.

The way to do this would be to use valgrind to detect where the memory
corruption is. VirtIO can be run locally so this is something you can
do on your machine.

Cheers,
Daniel

