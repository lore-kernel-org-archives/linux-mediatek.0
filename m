Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA24BC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 08:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Cc:To:Subject:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPQel/35hWIJPM94sA5/FSXttvqtiNGBtFglYvAjWfM=; b=lvpnjC1KuScxopoNX+eH2N0VLW
	i3QUDJC0RED5/72hX7afBkkB0K6t6sZOkubpi95IoLy+yH3VwGGLJ2zHidEAudFHZpSAXLvP+46qt
	PViw3HpmYVfL9LMJivOaEqOGda3g8avkegOy0iuM0eIujRJ+YKJAryWKzKm0U5AdqOHAjIr8hNItN
	a38ROFtZ9RY9JeOPqsh4wTABZniHOWbkbxB6UR2sbZHZd7Wbv/bxPv1Y15ZYtforq85XjP90u6Phn
	Pv0a6i3M431bXOtzz32pydoMJMQWUwpCT2idWJBpIYgQeWTX0bo3oRZF7CTyR5Qw/q+wz4KUme3Qd
	T5dxI3ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFtkp-007871-MT; Mon, 25 Jul 2022 08:47:55 +0000
Received: from aposti.net ([89.234.176.197])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFtkd-0077v4-IB; Mon, 25 Jul 2022 08:47:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1658738851; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TPQel/35hWIJPM94sA5/FSXttvqtiNGBtFglYvAjWfM=;
	b=tHujnarTp1a2IeCxqv7V7p0ZYM+XAQkUf6h2bzPhZAXtGabexkpEqtJIk3riIG+KD72GCt
	rfgngCkeMVeNIGR86FW8u0m95+M2aZUF7ZmSCzmZir9XhlmQkEMozE8c4Y/XCjH3vb4sMf
	UOQU8nHSOqTI2TQ70ZGL4h88/sbskZg=
Date: Mon, 25 Jul 2022 09:47:20 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH -next] scsi: ufs: ufs-mediatek: Fix build error
To: Arnd Bergmann <arnd@arndb.de>, Ren Zhijie <renzhijie2@huawei.com>
Cc: stanley.chu@mediatek.com, "James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, Bart Van Assche <bvanassche@acm.org>, linux-scsi
	<linux-scsi@vger.kernel.org>, "ARM/Mediatek SoC..."
	<linux-mediatek@lists.infradead.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux ARM
	<linux-arm-kernel@lists.infradead.org>, Jonathan Cameron
	<Jonathan.Cameron@huawei.com>, "Rafael J. Wysocki"
	<rafael.j.wysocki@intel.com>
Message-Id: <W2JKFR.Y0JWFHU8ZIJU3@crapouillou.net>
In-Reply-To: 	<CAK8P3a0LCaMoWArcQNY5qayUABgRXWEogrtQQ-sbR+zY6n=O4w@mail.gmail.com>
References: <20220704025632.235968-1-renzhijie2@huawei.com>
	<CAK8P3a07jGCuAVQAZgpENRP_xFLiogU9W1Uze+n21h7TdOZhog@mail.gmail.com>
	<df9909dc-3303-808e-575a-47190f636279@huawei.com>
	<CAK8P3a3SA9zvVu0i1m0kqbemLd4WfTMGfpc8VwhsmJOBgZHvsA@mail.gmail.com>
	<af043109-c101-a147-707b-82e79469ae73@huawei.com>
	<CAK8P3a0LCaMoWArcQNY5qayUABgRXWEogrtQQ-sbR+zY6n=O4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_014743_820281_2E60DEA1 
X-CRM114-Status: GOOD (  19.59  )
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

Hi Arnd,

Le lun., juil. 25 2022 at 08:34:32 +0200, Arnd Bergmann <arnd@arndb.de>=20
a =C3=A9crit :
> On Mon, Jul 25, 2022 at 5:38 AM Ren Zhijie <renzhijie2@huawei.com>=20
> wrote:
>>  =E5=9C=A8 2022/7/13 16:48, Arnd Bergmann =E5=86=99=E9=81=93:
>>=20
>>  I try to use the new marcos SYSTEM_SLEEP_PM_OPS and RUNTIME_PM_OPS=20
>> to
>>  replace the old ones, and remove #ifdef around the declarations in=20
>> the
>>  header, my local changes attach below.
>>=20
>>  But it seems  that doesn't work, which has ld errors:
>>=20
>>  aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected!
>>  aarch64-linux-gnu-ld: Unexpected run-time procedure linkages=20
>> detected!
>>  drivers/ufs/host/ufs-mediatek.o: In function=20
>> `ufs_mtk_runtime_resume':
>>  ufs-mediatek.c:(.text+0x1d0c): undefined reference to
>>  `ufshcd_runtime_resume'
>>  drivers/ufs/host/ufs-mediatek.o: In function=20
>> `ufs_mtk_runtime_suspend':
>>  ufs-mediatek.c:(.text+0x1d64): undefined reference to
>>  `ufshcd_runtime_suspend'
>>  Makefile:1255: recipe for target 'vmlinux' failed
>>  make: *** [vmlinux] Error 1
>>=20
>>  (CONFIG_PM and CONFIG_PM_SLEEP are both not set, and
>>=20
>=20
> It appears that there is a mistake in the RUNTIME_PM_OPS()
> macro definition, can you try this patch on top?
>=20
> diff --git a/include/linux/pm.h b/include/linux/pm.h
> index 871c9c49ec9d..84592229d754 100644
> --- a/include/linux/pm.h
> +++ b/include/linux/pm.h
> @@ -334,9 +334,9 @@ struct dev_pm_ops {
>         .restore_noirq =3D pm_sleep_ptr(resume_fn),
>=20
>  #define RUNTIME_PM_OPS(suspend_fn, resume_fn, idle_fn) \
> -       .runtime_suspend =3D suspend_fn, \
> -       .runtime_resume =3D resume_fn, \
> -       .runtime_idle =3D idle_fn,
> +       .runtime_suspend =3D pm_ptr(suspend_fn), \
> +       .runtime_resume =3D pm_ptr(resume_fn), \
> +       .runtime_idle =3D pm_ptr(idle_fn),

Not a mistake, the pm_ptr() macros are not needed here, because the=20
dev_pm_ops pointer must always be wrapped with pm_ptr().

The proper fix is:

-  .pm     =3D &ufs_mtk_pm_ops,
+  .pm     =3D pm_ptr(&ufs_mtk_pm_ops),

Cheers,
-Paul

>=20
>  #ifdef CONFIG_PM_SLEEP
>  #define SET_SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
>=20
> Commit 1a3c7bb08826 ("PM: core: Add new *_PM_OPS macros, deprecate
> old ones") introduced all the macros with the intent of using pm_ptr()
> and pm_sleep_ptr() in them, and I think Paul accidentally forgot to=20
> add
> those in this instance.
>=20
>        Arnd



