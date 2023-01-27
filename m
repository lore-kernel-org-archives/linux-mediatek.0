Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C2BC05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 03:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d+E/ciOddonwX89Pr/UzACdU9CC36pXiU0naEEzfTFE=; b=MzYx7m0o9qfo0w
	FLW/fyn4Ouon8SnZT/KpxMgssoEichoKcB++6uNpUTSGodpn6BcB5i5YGq12rn6RIyDgHlgVPDRH1
	AQ+lGrFGZpLrH/yHbeQtW08JQfVNaTz7QyG8NkshpHU6V9GdkgRctnTqSlaQF3Ap4xl1bwPLCnehc
	rPC2A2c7N6w05VcryLS/XFI2G8Uw59om2H+pk3IvBtjQIVS3FmjDr6W3QlnQPMkgQS6KSoi9ymq5V
	Ft+9dL7+jWtIpUPJ7ig/3tDXID7pnCaCS9heCIP4t653Ull+JQzvTI6EVNoXkZtnUZiwi6wS+QXqi
	cctSQYOiZaknojWHNWXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLFGa-00DBY5-1H; Fri, 27 Jan 2023 03:19:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLFGP-00DBWM-Dm; Fri, 27 Jan 2023 03:18:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 360F7619EF;
	Fri, 27 Jan 2023 03:18:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B2E8C433EF;
	Fri, 27 Jan 2023 03:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674789530;
	bh=yMqlqxCiTXbV0sP0tQtRNJGlz4yIWf+ozTmq0CkGlQQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=P6jgqiXM8BVBHL56uLfm1UkhlNvMqPIi/hT1o64MO9DXD1PjyMy8pGKoP0EDvnWrF
	 1VLtOfjs68otRVoa8oq6ur8Ff3exwsg24OWOwiCEPfXYKBFtua/i+VrH+xWmOiB9aF
	 4NGLqOzt6Alr2+NLlq7/sqSeltc8dPCcNYe77tp92UHdm6PN1EGePXpuG3+crZFGgY
	 fC5+CuskVGFNu3UeErdf6CoNy47PZnl3gclDBaEclmEVJGEMbrl78lWRZ6oAqHhgIU
	 d+gGOheYNK6AQWq8DT2ykPw+xxOzDk+eyRczvDwshqvZNXLWNslZno5FkWDJ9UzAt2
	 TFWAaYxHgUcPw==
Received: by mail-lj1-f170.google.com with SMTP id g14so4155119ljh.10;
        Thu, 26 Jan 2023 19:18:50 -0800 (PST)
X-Gm-Message-State: AFqh2kqXWpBl3ftEPe9NZyI9tb9nqId+9oVn8GTs2Ofc0soDVCv5AvSo
	f/+crGQvL5peGKN6KsVMlQzHHI0jR8r1u3Hdcw==
X-Google-Smtp-Source: AMrXdXuKl/XfTZtyJDk7sSww33tWah9JPd78aB+WMh0SYqRDti1pFGSaFGG6NZv1jxA2fNc7q0W0F+cePoApqEB7OBM=
X-Received: by 2002:a2e:82cf:0:b0:28b:bde3:7871 with SMTP id
 n15-20020a2e82cf000000b0028bbde37871mr1699213ljh.269.1674789528603; Thu, 26
 Jan 2023 19:18:48 -0800 (PST)
MIME-Version: 1.0
References: <20230119231255.2883365-1-robdclark@gmail.com>
In-Reply-To: <20230119231255.2883365-1-robdclark@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 27 Jan 2023 11:18:35 +0800
X-Gmail-Original-Message-ID: <CAAOTY_81bQaU0CqavppEuXk9ZCr_V136KU_NURTGfmszz38FwQ@mail.gmail.com>
Message-ID: <CAAOTY_81bQaU0CqavppEuXk9ZCr_V136KU_NURTGfmszz38FwQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Drop unbalanced obj unref
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_191853_546685_0D183B04 
X-CRM114-Status: GOOD (  14.73  )
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
Cc: Rob Clark <robdclark@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Mao Huang <littlecvr@chromium.org>, CK Hu <ck.hu@mediatek.com>, "moderated list:DRM DRIVERS FOR MEDIATEK" <linux-mediatek@lists.infradead.org>, Daniel Kurtz <djkurtz@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>, David Airlie <airlied@gmail.com>, "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Rob:

Rob Clark <robdclark@gmail.com> =E6=96=BC 2023=E5=B9=B41=E6=9C=8820=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=887:12=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: Rob Clark <robdclark@chromium.org>
>
> In the error path, mtk_drm_gem_object_mmap() is dropping an obj
> reference that it doesn't own.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT817=
3.")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_gem.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/med=
iatek/mtk_drm_gem.c
> index 9b3d15d3a983..f961c7c7456b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -169,8 +169,6 @@ static int mtk_drm_gem_object_mmap(struct drm_gem_obj=
ect *obj,
>
>         ret =3D dma_mmap_attrs(priv->dma_dev, vma, mtk_gem->cookie,
>                              mtk_gem->dma_addr, obj->size, mtk_gem->dma_a=
ttrs);
> -       if (ret)
> -               drm_gem_vm_close(vma);
>
>         return ret;
>  }
> --
> 2.38.1
>

