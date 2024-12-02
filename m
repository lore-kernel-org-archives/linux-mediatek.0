Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72E0D4979F
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2024 06:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b0nWzD+Lx38ifdjx/0KeRfxG6lCIDsNbyc9nq09sPzg=; b=KGDG45opZqdOxXewIEDpLsGWWH
	F8CleftcjGF7Ga4S9hFRnfsXocX2jIG2UIcUqH7/V1XwGSyr4wxYxZdXXfY7lXuTcLrLYY4nMc5J6
	Kj83oeb7QxwLrtsMYF+Y7LIE2W5lQINzIyvdGV+DrK3kMHPAOVkQVrckxgJPERCWExGwICaEGO5h4
	0hafI39CJTt7UbHk0mMqRceefXA48hESNUNXiGVjQ9eqLt4lvEyOZ54UGAtmzYJKZ4VXRwGVlVhGB
	4gwWsfw2wTPrnPQ8A+kcN3wwfVZhmlvUmCIyB60OofIyPO6S7Swk3Wo0tqlTOgmbE5AAarSA22T3Z
	HWcjic4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI0M5-00000005ER5-3zAE;
	Mon, 02 Dec 2024 06:56:25 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI0L6-00000005ELj-2uYk
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Dec 2024 06:55:26 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53dde5262fdso4211905e87.2
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Dec 2024 22:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733122523; x=1733727323; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0nWzD+Lx38ifdjx/0KeRfxG6lCIDsNbyc9nq09sPzg=;
        b=jchuIsH20jW7iBjohOdGj05iBdYGE1K/+2u3oP5mIa+R2l0p91eKfWsKn8RgnhaBqX
         T49IMiDrnJiNXI8Rf95RyALNBnFh3b53f/wTyiEU+61Qey4Y3jjFgBVXtIJKlN/FQtLw
         iXQ3i1Imion/Lktr1zuKtYWGA3BcD5dPzMce4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733122523; x=1733727323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b0nWzD+Lx38ifdjx/0KeRfxG6lCIDsNbyc9nq09sPzg=;
        b=NUb4l7/OUy3XWZYey7+18AuWG9no9swppJ5LiliuH5BG3iS+KApf8T9C3MfUQAnXO+
         V5O5nAp62484NcnjnkW10j98JKosyANJpF9nIizxHt49z9abZm+cPf4yRjuJqWpwXKmY
         nLfbxqy6lJgu+JgmEzDFSACFiVKGmdz3iQYM7draZl2eviyU3vluJjGQ9Y0Nar6615TY
         cXwlh+PQo6AzXPUuHf06EtST7MiSBStsstBq04u/u0XcQ9ZxsFHE5tiAExE6gUy4INLJ
         EWijUpNPpOtNeSzbLV0sBF6/RR4iBQEhF7HT6ZSoIvAMQsrJyRSG/IP7v8sSXNEeLHs9
         sg3A==
X-Forwarded-Encrypted: i=1; AJvYcCWp+jceMl2HCIrKCWYg0do7r5pkwR4kPnJQ35g3AdRApRopwX0VHzymJI4/EpZgK9jlsAjw4VRk7vnlVCTWhA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo9cMkpiUPgVRjpwr/MgOsK/TXZM2AATRxtdPVso18pcboKVUV
	h8J4yg7jn6J2jkBYvwpv9qtlaVMIW/6peSuJyzBwTfh+r5K7YUm6LvlD29hDtNIZPgdvrdGuOuQ
	qQ5pZANbAWj7+8e5YWr4yZxhF/J3SHLIMsRt6
X-Gm-Gg: ASbGncs0oLIJ+hLo2Et9/+Ei+5hOKWzdE3uxqI59ST0xdZM+irrNA6XaEGcZ3DyYFQT
	LFnY6fpTcjeo8tEshvEaVqsmrSmJW4D/RRLtGTGLJU8q0pdai80nbqicB5OA=
X-Google-Smtp-Source: AGHT+IEhDuPhpyGV4L/ou+jUfLRVYtfsYdtVwBNOmHBMpBMrZhusEFwHylPLoeDz7/iqzLHY2ZH7xlMhRw1T/BJzw6s=
X-Received: by 2002:a05:6512:3ba2:b0:53d:a132:c68f with SMTP id
 2adb3069b0e04-53df0112a63mr10446660e87.47.1733122522682; Sun, 01 Dec 2024
 22:55:22 -0800 (PST)
MIME-Version: 1.0
References: <20241202062826.66619-1-wenst@chromium.org>
In-Reply-To: <20241202062826.66619-1-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 2 Dec 2024 14:55:11 +0800
Message-ID: <CAGXv+5EYkG=Y1vWDO6DWnUhd0WRuctYn_3w2YkvJoR_7JhsCpQ@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: mtk_scp: Only populate devices SCP cores
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Tinghan Shen <tinghan.shen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_225524_752171_C5FD4531 
X-CRM114-Status: GOOD (  20.89  )
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

On Mon, Dec 2, 2024 at 2:28=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>

Oops. The subject should read "Only populate devices for SCP cores".

I'll let this one sit for a couple days before sending a new version.

ChenYu

> When multi-core SCP support was added, the driver was made to populate
> platform devices for all the sub-nodes. This ended up adding platform
> devices for the rpmsg sub-nodes as well, which never actually get used,
> since rpmsg devices are registered through the rpmsg interface.
>
> Limit of_platform_populate() to just populating the SCP cores with a
> compatible string match list.
>
> Fixes: 1fdbf0cdde98 ("remoteproc: mediatek: Probe SCP cluster on multi-co=
re SCP")
> Cc: Tinghan Shen <tinghan.shen@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/remoteproc/mtk_scp.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 0f4a7065d0bd..8206a1766481 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1326,6 +1326,11 @@ static int scp_cluster_init(struct platform_device=
 *pdev, struct mtk_scp_of_clus
>         return ret;
>  }
>
> +static const struct of_device_id scp_core_match[] =3D {
> +       { .compatible =3D "mediatek,scp-core" },
> +       {}
> +};
> +
>  static int scp_probe(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
> @@ -1357,13 +1362,15 @@ static int scp_probe(struct platform_device *pdev=
)
>         INIT_LIST_HEAD(&scp_cluster->mtk_scp_list);
>         mutex_init(&scp_cluster->cluster_lock);
>
> -       ret =3D devm_of_platform_populate(dev);
> +       ret =3D of_platform_populate(dev_of_node(dev), scp_core_match, NU=
LL, dev);
>         if (ret)
>                 return dev_err_probe(dev, ret, "Failed to populate platfo=
rm devices\n");
>
>         ret =3D scp_cluster_init(pdev, scp_cluster);
> -       if (ret)
> +       if (ret) {
> +               of_platform_depopulate(dev);
>                 return ret;
> +       }
>
>         return 0;
>  }
> @@ -1379,6 +1386,7 @@ static void scp_remove(struct platform_device *pdev=
)
>                 rproc_del(scp->rproc);
>                 scp_free(scp);
>         }
> +       of_platform_depopulate(&pdev->dev);
>         mutex_destroy(&scp_cluster->cluster_lock);
>  }
>
> --
> 2.47.0.338.g60cca15819-goog
>

