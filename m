Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16475C4829A
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 14:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qmq2UPFRqaq5ws3fnqDxJqDcSha4yTKtswPkJsibWOY=; b=sMGviG8PVVAhkZyUn6S5YhnuH1
	Mn0J7NAg1f7zfDWK1fe3MuXdKXOoxeNjMEI10qlGGGhYvL9hY5MbXhEpu5Kt7+52VeJJlsURd0n/K
	BHoxQZGZFdoEOusy+LiaHT+Y44fgrVYt64eoZntVX1F93tGexvSiG0hW3oJigA2IHXOzeACXhs3n4
	mPBwkI2Ei97qj3ojg9BBRI30YDUwsTgAi91Cw1/InnLKNSRQkEdMkv/rFoH7uJ4FVwb9uLC9P8Lbf
	z/BSwqJjiMtuMoigBFw6YpAQ2R4W4wMSa5MYHPfhQhzImpVdWFOn/f8TniAyex8N4I6RGcCMuex6U
	Bz+M6xdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZtXT-00000009SoD-0Prb;
	Tue, 13 Feb 2024 14:13:35 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZtXP-00000009SlU-09Nr
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Feb 2024 14:13:33 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5112bd13a4fso5714714e87.0
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Feb 2024 06:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707833608; x=1708438408; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qmq2UPFRqaq5ws3fnqDxJqDcSha4yTKtswPkJsibWOY=;
        b=Ab3QgPkjyMozVk5bn+534vx96t5b+NGZPCgOXzp2vEA9vnUjxItFPGoWjZ2n2BF7rp
         RBdARX5sm7OYfZ5J9ydzHxLMeVMLjXj65xi7qU7kKcNqJ31e8T2WW422wKYnoxHjpbac
         xKIHnosLtZh0zSns/qP2bfGOXTzqyUXpLwvH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707833608; x=1708438408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qmq2UPFRqaq5ws3fnqDxJqDcSha4yTKtswPkJsibWOY=;
        b=BHRp+hQGhgE24ChSmuPcfKoKUGyk+lH8TQYuxnH+aonNWIEe4W7dcExZERPBcH6Kww
         oIp74uvNFVp9caL/ON7BD3VCCp4AU6dpHUbr2XNIiQk62PrEB8xynnIMLCH6bJ8yAX77
         WJYD4Ta8uboEbfNsIKlMcy0/ZGCQPbTjgGCtTy7K1TIBRg96s5pu5SguKOV9ZIGWA3+5
         dOayjLoQ6h29T+GMkluS36MtmiRYmZNtS6iaqSRp08iFIcc1qsL4y39JIpHwzALST1km
         1R3wmn0rYA/LEKsAOAxzjFjJo635zJVRRme2B1bDXvFf8vn3BuPAfSQ09mF6s1Q+epiV
         brrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVT55grynXo8m2L5oU8oFNfyvduycBm6dBYYHzIVPSzWOkxJj9WCYgW03OPeiSGA+jysV9dRDwJXGbbHMr1mkQcUiB/8zSl/Hmtgc7dDCYozYtX
X-Gm-Message-State: AOJu0YyE0W2qzMGg5b8sW6swPqeJC069vdufh7w0mc7sEvGtpsE7iG38
	DTkvGinfr78BrqkNwolNtFQh66d5xb1lRnFVYw32VX5Zv6YU9EzCHjisdRR8+QtbX6iUbEu4vPU
	PgOJiO7cIU8fa4x2bvDteUzGYdG3BaaS8qsKE
X-Google-Smtp-Source: AGHT+IHBdt44ohe1WEmDJRwWk0PqMe3siXeot/wfISehMT/XqiceqCjXRIx22oyAYF8z9DxqrEN1z0sOsGsvydhzfN8=
X-Received: by 2002:a05:6512:4db:b0:511:6ef0:33d1 with SMTP id
 w27-20020a05651204db00b005116ef033d1mr949357lfq.13.1707833608459; Tue, 13 Feb
 2024 06:13:28 -0800 (PST)
MIME-Version: 1.0
References: <20240130095656.3712469-1-wenst@chromium.org> <20240130095656.3712469-4-wenst@chromium.org>
 <92d4d421-54a8-4a41-8b47-61ae39b55ebb@linaro.org>
In-Reply-To: <92d4d421-54a8-4a41-8b47-61ae39b55ebb@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 13 Feb 2024 22:13:17 +0800
Message-ID: <CAGXv+5Ej1cEiNegMEf9GOMYTiabiBU1DpfC7QkQAsHEjuNPCxA@mail.gmail.com>
Subject: Re: [PATCH 3/3] nvmem: mtk-efuse: Drop NVMEM device name
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	William-tw Lin <william-tw.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_061331_234702_0FD1BD2D 
X-CRM114-Status: GOOD (  18.97  )
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

On Tue, Feb 13, 2024 at 9:07=E2=80=AFPM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 30/01/2024 09:56, Chen-Yu Tsai wrote:
> > The MT8183 has not one but two efuse devices. The static name and ID
> > causes the second efuse device to fail to probe, due to duplicate sysfs
> > entries.
>
> have you considered using NVMEM_DEVID_AUTO?

Yes, that was considered and what is actually implemented downstream.

However, since the reason for using a custom name no longer exists, it
seems simpler to just revert to the previous behavior, which is to let
the nvmem core deal with naming.


ChenYu

> --srini
> >
> > With the rework of the mtk-socinfo driver, lookup by name is no longer
> > necessary. The custom name can simply be dropped.
> >
> > Fixes: 4e6102d60d88 ("nvmem: mtk-efuse: Register MediaTek socinfo drive=
r from efuse")
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >   drivers/nvmem/mtk-efuse.c | 1 -
> >   1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
> > index f5bebcecf9bd..9caf04667341 100644
> > --- a/drivers/nvmem/mtk-efuse.c
> > +++ b/drivers/nvmem/mtk-efuse.c
> > @@ -86,7 +86,6 @@ static int mtk_efuse_probe(struct platform_device *pd=
ev)
> >       econfig.size =3D resource_size(res);
> >       econfig.priv =3D priv;
> >       econfig.dev =3D dev;
> > -     econfig.name =3D "mtk-efuse";
> >       if (pdata->uses_post_processing)
> >               econfig.fixup_dt_cell_info =3D &mtk_efuse_fixup_dt_cell_i=
nfo;
> >       nvmem =3D devm_nvmem_register(dev, &econfig);

