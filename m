Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCAB0C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jul 2022 08:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KAJGDHVTsZlT/WHINtcOEMp0CrLGzH2Dsz05m/nXaNk=; b=t5UZ+cgXQUrUmJTelhl4+yH+H6
	bM02t7E6BfV5bBQta6m2VOzY7kgxCikubyQcHt8KqL9CrsUggFYuj55pfT1MqMLpaiOFEdljoWT7N
	+r/VoCwnUKJKcMGtw/dwap8DhiZVG0nGJjYjVhr58jExf20JkxabCzbXK3QOHsPCAMKgXBcfxqA3W
	F/+ubJQBwC8ID68QS5TAzVvUuxPT7GTYKcyg98fFhaXXxsUa7oGDYvINRa5Q4lWBTljXlGWyj3vHX
	WL7neCIiRAcwzUz1w7Z9YSKMR9jLTSOqJ+voBV79eQJmRXIHOUt0kvLJuVKV8270f4rBUo5kreXkj
	AKfCf76A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBBFf-008iVh-Gw; Tue, 12 Jul 2022 08:28:15 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBBFc-008iS6-QX
	for linux-mediatek@lists.infradead.org; Tue, 12 Jul 2022 08:28:14 +0000
Received: from mail-yw1-f174.google.com ([209.85.128.174]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MWzXd-1o4KiI46AL-00XK7w; Tue, 12 Jul 2022 10:28:04 +0200
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-3137316bb69so73263287b3.10;
        Tue, 12 Jul 2022 01:28:03 -0700 (PDT)
X-Gm-Message-State: AJIora++20db0ka1cNeFqDsP6i6uM8bOsuL76w6y5A0AdwTs3QUfKQvv
	kf7npSxL0w0kukpIxeZKzS8AyFNUUaTS2xRae1I=
X-Google-Smtp-Source: AGRyM1u9HrvdVLUYfcTjxl6JYK42QXCE/vx+bUc1E+DlIYc4j8YKWLUVVYfD/FHC1DMwxhEvHUxz2HArNEw2IL5mAk0=
X-Received: by 2002:a81:d93:0:b0:31c:d32d:4d76 with SMTP id
 141-20020a810d93000000b0031cd32d4d76mr25884738ywn.135.1657614482595; Tue, 12
 Jul 2022 01:28:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220704025632.235968-1-renzhijie2@huawei.com>
In-Reply-To: <20220704025632.235968-1-renzhijie2@huawei.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 12 Jul 2022 10:27:45 +0200
X-Gmail-Original-Message-ID: <CAK8P3a07jGCuAVQAZgpENRP_xFLiogU9W1Uze+n21h7TdOZhog@mail.gmail.com>
Message-ID: <CAK8P3a07jGCuAVQAZgpENRP_xFLiogU9W1Uze+n21h7TdOZhog@mail.gmail.com>
Subject: Re: [PATCH -next] scsi: ufs: ufs-mediatek: Fix build error
To: Ren Zhijie <renzhijie2@huawei.com>
Cc: stanley.chu@mediatek.com, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Bart Van Assche <bvanassche@acm.org>, linux-scsi <linux-scsi@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:zP7g0NuEsODx7PHiLhcQ0TvuJm0h6s0tWYpm1V8Hr4qQzHtcVWk
 7HszeOOjEjzgN7I5QJnWcG3YOyLDwgLemCUlVFxeY8WHome2w9J5ihDuZA2oPYqxlaFQbZv
 nDw84KmIaOwiEaJXtpOrD4jxiYP8M9YtRK+mzcCWSzT8iBJdkVLrocFbum23HIkXApDpFz7
 E+itCBVkim+6CBvqQo6Iw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NwsYL36LhKk=:UDkeJsFtUp1baTzVbLfMCe
 FjNd7i/ksCmGOCc6/gq9RwxxssnfIr1EA10bsGWHT27HpB6Embx+OMDb9yEkArF8i9XtMMPsC
 vFzB7jweaTsMWuHwLXZPE0WQXzXoBNBBN+iRnVLCfHDnSpcP5ZKNfcnGez1YMRD6tVHOLHAlx
 YZvi/+stnTb6wgUFXVl5ndt9vU/HJXRhMDXPYxk+FRmbsUBU2ib+gsQiGeg8ak56WcpTYcuTr
 aqwQbiOZyJFGskqsp/gydpRsQiwKOJelfTGRjRvFe3Rn57b729F1U1lQxZA23W794wCp19+cR
 9woalrfIH2E5izuBvOiTRFfaRY4SE4stCAs0xvD/wJBJ7VWnZNoK5+nbNe2HndCu0WysA9C4G
 NnzuKZcbUV332sgwa/FudwMeuYyc+/mUmJ/f38VhSXC8FlWp0ZEQ1r2M8nfSNIPY/EWdvzZvT
 YD4gmALkI4RPNTUpThCMq7db73buAE9agn3Ota5Elkr4a6xBAsJ3TAp3RskEG6bfUe2WEozTC
 bs9z6ZQsZiVMn91I3uXLph2P9Rnq/MqJ5sfnsofqvziniZF6Y9uofOUfs7aZOszMTXHmT4XUu
 WPSUZO+Pi8t5ab6d+VAoL4bdx/lEclYflQRTN4OisWXrM/1zifqfy1ArAL97+KKSxpzDdvg0q
 M76P92dxisGdCjrX+JAzFp9KTwquD0WsLrcG2mDa+t4TpIbjq+yUyH/53oeUkX5/GaXHFd2sn
 h9RHF7BTncqrTKV6f9YZQUKKTV5x7DPIqfhA4/hCjfaFA83sDEEyU1/QPnG2z4G3uZ/r+RKqm
 aBn6nxC+5e6e5fW0mHM6gEkC4JQFlOxbD/YEeLYElcoejRY0UCoAsKMlIkEeWoC6tZAZXTGHR
 G15riEvmYIks+uX+5sQ0PCNj+cZAlN0mWehnf7+dI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_012813_189171_CF849465 
X-CRM114-Status: GOOD (  15.27  )
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

On Mon, Jul 4, 2022 at 4:56 AM Ren Zhijie <renzhijie2@huawei.com> wrote:
> diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
> index c958279bdd8f..e006c2528a3a 100644
> --- a/drivers/ufs/host/ufs-mediatek.c
> +++ b/drivers/ufs/host/ufs-mediatek.c
> @@ -1427,6 +1427,7 @@ static int ufs_mtk_system_resume(struct device *dev)
>  }
>  #endif
>
> +#ifdef CONFIG_PM
>  static int ufs_mtk_runtime_suspend(struct device *dev)
>  {
>         struct ufs_hba *hba = dev_get_drvdata(dev);
> @@ -1449,6 +1450,7 @@ static int ufs_mtk_runtime_resume(struct device *dev)
>
>         return ufshcd_runtime_resume(dev);
>  }
> +#endif
>
>  static const struct dev_pm_ops ufs_mtk_pm_ops = {
>         SET_SYSTEM_SLEEP_PM_OPS(ufs_mtk_system_suspend,

This change works, but it's not great. It's better to change the
SET_SYSTEM_SLEEP_PM_OPS() to the new SYSTEM_SLEEP_PM_OPS()
that works without the #ifdef.

         Arnd

