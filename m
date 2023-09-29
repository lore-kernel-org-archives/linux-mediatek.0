Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFC3E728C5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Sep 2023 16:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WIPQ+mq4ibCqI5jqpIgOMLXR3PB1xuDdnJNEgz17YYw=; b=Rigxvul3d/4EuMN3NOIxWDVLs0
	eViqumXhmn11GiPHTFuRGVxoDD5HhNHe+K+JML3FCbMMiWsYlLkT0rzYO7arirBAF/NK5FC5XnhOw
	5xYkb6P79KvFfLGIjBt0Ds7fclGMIaPjMz17Vz4RX9EIgH2NzscbvbkHeRra24HSGminilUHlFD9s
	U+QAJuKxBVuCU6jv8DNPm8ebgWF6SHhbWOUmopGuBQcuDwfpLDTBNzUG+sNb+wm2ZPwCnp/GsLtYT
	oNjA33vhIL/fetmiLIIag9mvePvpuqP+KfNJY8yl4gbYB1H8sXiCOEoZJ9Ibr55/Qoubgl41+CHfY
	qEC5jshQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmG5F-008GZy-2k;
	Fri, 29 Sep 2023 16:11:17 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmG5E-008GZW-0H
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Sep 2023 16:11:17 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-307d58b3efbso12389740f8f.0
        for <linux-mediatek@lists.infradead.org>; Fri, 29 Sep 2023 09:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696003872; x=1696608672; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIPQ+mq4ibCqI5jqpIgOMLXR3PB1xuDdnJNEgz17YYw=;
        b=ZdiCIEtkHMSLiGMr/TvjPmviL8amxQmsxWGep4lzpwVMrrgYYHGt8m1f5d9NZWcsxd
         Vdx5KQ8wp4OoiyAla8k6igGu2vmGPd6M/5vJ8jRq75McRAcoSkwAlbgiB9lOXnKD1Vv7
         WFQ0HZS8P3bPhFzmiASDTV/U7pgp2runqRarkIozHBrTtrLtdSd+v9gSErAs50XLqrD6
         pbIlkf+HZokPOx/4k1kxqt7C7sfTe0mOpC9yzb59KITVPuo79Fg9qPR+T656F5z8Bwy4
         1jtV/PW1+QTrLjCQEJA2aOZydPQu5eJxfD+WGGiS0GqGQJlfysw0RKhJL+M1Gcq14BWG
         OR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696003872; x=1696608672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WIPQ+mq4ibCqI5jqpIgOMLXR3PB1xuDdnJNEgz17YYw=;
        b=onXMvKH0TFvKlSuvJsEY187gLMhj2ZaI73JQaPw+rGqXwQOdi4Dy9OwkWGPgWtoAzr
         b1nrzTqnvleRk7mOgTInWWdO9k0G1uITt8Bl7AOl/tBG+pXpOdBskzu6KsqfAwnQfqN/
         OfsN/CWtrg8CTsTHop0Tc1O36lTyrvkdQHZAJHSHIqUPDkj80bFExch67D+5RS4LPn35
         OCaf0/AeYeKVJNNYINBox+4WT9hEtvsObiIBGf3Hsm4qGr1pdZxl1k9kNc5AGN41IoOt
         4bzCdWXBngbSdg/vbdFZ6VhIVSLgWddepvu821LJ/gQOUpjuMTOWwsKyEte+2tjZ68ou
         Vsag==
X-Gm-Message-State: AOJu0YwSjqh4zRmXtTY6TyAaNYB+nWkzTfyC7e7VY33uVEzNh0WwSji3
	2sDhn84k7CkF7N4bQPyRtrdn+9BFWneMUi8oY8NvDw==
X-Google-Smtp-Source: AGHT+IHTkXbH1QknEI9Ysx3L+jH5s7p8b7Rc2XdNP9tA/fdwT11V/0psMIJDE4SeahHKIE8IAqZpA9dtji9ugui/hZw=
X-Received: by 2002:a5d:58cd:0:b0:314:152d:f8db with SMTP id
 o13-20020a5d58cd000000b00314152df8dbmr3503480wrf.58.1696003872116; Fri, 29
 Sep 2023 09:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230922-5-10-fix-drm-mediatek-backport-v1-1-912d76cd4a96@kernel.org>
In-Reply-To: <20230922-5-10-fix-drm-mediatek-backport-v1-1-912d76cd4a96@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 29 Sep 2023 09:11:00 -0700
Message-ID: <CAKwvOdkvJgrstZdVCMRMy+QC4VqHYq0+n5fRGbH7iYDxgAov1Q@mail.gmail.com>
Subject: Re: [PATCH 5.10] drm/mediatek: Fix backport issue in mtk_drm_gem_prime_vmap()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org, 
	llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_091116_149803_EF495D93 
X-CRM114-Status: GOOD (  23.28  )
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

On Fri, Sep 22, 2023 at 8:51=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> When building with clang:
>
>   drivers/gpu/drm/mediatek/mtk_drm_gem.c:255:10: error: incompatible inte=
ger to pointer conversion returning 'int' from a function with result type =
'void *' [-Wint-conversion]
>     255 |                 return -ENOMEM;
>         |                        ^~~~~~~
>   1 error generated.
>
> GCC reports the same issue as a warning, rather than an error.
>
> Prior to commit 7e542ff8b463 ("drm/mediatek: Use struct dma_buf_map in
> GEM vmap ops"), this function returned a pointer rather than an integer.
> This function is indirectly called in drm_gem_vmap(), which treats NULL
> as -ENOMEM through an error pointer. Return NULL in this block to
> resolve the warning but keep the same end result.
>
> Fixes: 43f561e809aa ("drm/mediatek: Fix potential memory leak if vmap() f=
ail")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

(resending as text/plain)
Did this get picked up? Our CI has been red for a few days on
linux-5.10.y over this.

> ---
> This is a fix for a 5.10 backport, so it has no upstream relevance but
> I've still cc'd the relevant maintainers in case they have any comments
> or want to double check my work.
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/med=
iatek/mtk_drm_gem.c
> index fe64bf2176f3..b20ea58907c2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -252,7 +252,7 @@ void *mtk_drm_gem_prime_vmap(struct drm_gem_object *o=
bj)
>         if (!mtk_gem->kvaddr) {
>                 kfree(sgt);
>                 kfree(mtk_gem->pages);
> -               return -ENOMEM;
> +               return NULL;
>         }
>  out:
>         kfree(sgt);
>
> ---
> base-commit: ff0bfa8f23eb4c5a65ee6b0d0b7dc2e3439f1063
> change-id: 20230922-5-10-fix-drm-mediatek-backport-0ee69329fef0
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
>


--=20
Thanks,
~Nick Desaulniers

