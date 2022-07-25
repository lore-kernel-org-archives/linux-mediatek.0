Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1BCC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 06:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=278twR7KUzjcaLjmKFGe9mcrlcZDSktMRdHKtUS8Yno=; b=QBRSbHi3La0T70lgU/Ro4D95aA
	2JJMAZFeg5jaffGs55/sJtu9KJWy7MOnBtLNlwh5wd07q2gV+cUmAnyfIzDRx+Zs6CjMqAJPPfeeG
	n6y6uGi+PQgtGjB/md+cQ/SiUGyvaHuS8kOEM2/WqOf359OxG4MpQqjaHTg1iW9MFmyMJvJZpopa7
	mO0rysoGLHez2EHGL23uG0FdIGDH5MxLxt0y8vSK1CNIR/3/gfilFt990Gj0D4y//Oav8UWp1qfi/
	IDxUBkrmpafWWthROBbTG5OOf30QmujrlLckHnTQ92OGbpikb8wjZeiRHQKGU9NkR2USVRf6ztnb1
	5c0F9hDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFrgM-005XCn-6H; Mon, 25 Jul 2022 06:35:10 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFrg9-005X1V-SZ; Mon, 25 Jul 2022 06:34:59 +0000
Received: from mail-yb1-f171.google.com ([209.85.219.171]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MLR5h-1ny3qL1YRv-00ISEy; Mon, 25 Jul 2022 08:34:50 +0200
Received: by mail-yb1-f171.google.com with SMTP id k85so18384350ybk.7;
        Sun, 24 Jul 2022 23:34:50 -0700 (PDT)
X-Gm-Message-State: AJIora/sqrMnrhnYAl/3VxzyNS1rs1lQn70qEQ4FvkYNbNl7Mrh3Yi1z
	GJ2cX4wcGfm6PFquLKpKBByl4mt1WRhDgw3BBJ8=
X-Google-Smtp-Source: AGRyM1sGLkw4aJn1HNx3IEfYHktSuUgf/62QRFsCyHiqKFcP2xKhpEE3DffyH3k+rdGJlryPzfWKqPb5CFt6r49usFA=
X-Received: by 2002:a05:6902:120f:b0:668:2228:9627 with SMTP id
 s15-20020a056902120f00b0066822289627mr8961174ybu.134.1658730889063; Sun, 24
 Jul 2022 23:34:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220704025632.235968-1-renzhijie2@huawei.com>
 <CAK8P3a07jGCuAVQAZgpENRP_xFLiogU9W1Uze+n21h7TdOZhog@mail.gmail.com>
 <df9909dc-3303-808e-575a-47190f636279@huawei.com> <CAK8P3a3SA9zvVu0i1m0kqbemLd4WfTMGfpc8VwhsmJOBgZHvsA@mail.gmail.com>
 <af043109-c101-a147-707b-82e79469ae73@huawei.com>
In-Reply-To: <af043109-c101-a147-707b-82e79469ae73@huawei.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 25 Jul 2022 08:34:32 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0LCaMoWArcQNY5qayUABgRXWEogrtQQ-sbR+zY6n=O4w@mail.gmail.com>
Message-ID: <CAK8P3a0LCaMoWArcQNY5qayUABgRXWEogrtQQ-sbR+zY6n=O4w@mail.gmail.com>
Subject: Re: [PATCH -next] scsi: ufs: ufs-mediatek: Fix build error
To: Ren Zhijie <renzhijie2@huawei.com>
Cc: Arnd Bergmann <arnd@arndb.de>, stanley.chu@mediatek.com, 
	"James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Bart Van Assche <bvanassche@acm.org>, 
	linux-scsi <linux-scsi@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Paul Cercueil <paul@crapouillou.net>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WU2Kjp81ihSpbhwIvsRJZ6V/n/Oa8AT8yVnO/PbkSTmWAlyV1P2
 3n/125iWr2RA0vLKxqIzctBi142uxPdOLBOQbkctRQi1Cd5EFDotJJsSA9mIZxNxOs7GLz0
 sDXPUCMP+1lrhMps+Fs3eNm97Pblf/7uPpiHQH6LKQFnJIWaieg8IECdU8miKodhXmi/k7y
 DMW7/4y3yqpPpsRa6D3OA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+J/PvW0vngM=:PVJoPYL3wgJ1ltpJNZv20H
 Z+AjKp8E3HgzrJtWyz8AIz3IxPe0NhlJJ7ak0GWyNO5gSYfdkmqpHUVD2WesN5NJTpxMJTBFk
 39XSX8nornD73zwBeF5oHfs6gixjz7I0LIEeM8xm6+2SEQfJAGyM9QRFx+wFrdBw3c3XWCy0m
 5TJxqMS0d/DWmwS8aEsBx7bRRe6KgqguPedeh47Zb8YueGad+GBGtCtjfwkLtXVI/JK9qXGU2
 GyeCmZhUVgAu7ynzeDhWy8njIClK8BoBNiyl+0xCLt68i3jFDWvxnO6gLoRqzhEHCz6OOeA7q
 mHtU3tinw1QmULliZT3svVF0j6ZwySEpoVR+h0hg39OZdnZOptwrDWzHy7X4gvCZK2rsP3joX
 X6Y5W6ZF6CrY3MgZ92DX6RNbGfvUEr+59BPUcb1ZGBqo4B6LoLIqcEPVv9AM2dvzk8IPleSNU
 ctHSikATeETAOFDBGusFYsgMdtjw0GtIWMHIUaaVqkAPN7iOF+y0m5eUhjyiuUF7CzJ2fZq0X
 fWxy+mbRP7fi9peSDipZzNZioUrO5XKXU0p66/vLfQlx88MaOMSt3tFgD12+Fk31z/af4FR0O
 vArSX5bjIz35P5Y8Em16/keRZmcKxfBR2Kx8lHJHnAmzl459Hn1J/Ay+bl8Xq1aErL0Q90u8o
 ICoBOPKEFXLWgryE8f8VQrfAu8eCNepYxU2d/fTrabvXsXstPJ+jGr0JGxxrkpj8WpgdYzy6t
 lH074bSWHZrL14ep3GcgyUd1bZvWpfBqMDevxg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_233458_241883_E5289901 
X-CRM114-Status: GOOD (  18.41  )
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

On Mon, Jul 25, 2022 at 5:38 AM Ren Zhijie <renzhijie2@huawei.com> wrote:
> =E5=9C=A8 2022/7/13 16:48, Arnd Bergmann =E5=86=99=E9=81=93:
>
> I try to use the new marcos SYSTEM_SLEEP_PM_OPS and RUNTIME_PM_OPS to
> replace the old ones, and remove #ifdef around the declarations in the
> header, my local changes attach below.
>
> But it seems  that doesn't work, which has ld errors:
>
> aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected!
> aarch64-linux-gnu-ld: Unexpected run-time procedure linkages detected!
> drivers/ufs/host/ufs-mediatek.o: In function `ufs_mtk_runtime_resume':
> ufs-mediatek.c:(.text+0x1d0c): undefined reference to
> `ufshcd_runtime_resume'
> drivers/ufs/host/ufs-mediatek.o: In function `ufs_mtk_runtime_suspend':
> ufs-mediatek.c:(.text+0x1d64): undefined reference to
> `ufshcd_runtime_suspend'
> Makefile:1255: recipe for target 'vmlinux' failed
> make: *** [vmlinux] Error 1
>
> (CONFIG_PM and CONFIG_PM_SLEEP are both not set, and
>

It appears that there is a mistake in the RUNTIME_PM_OPS()
macro definition, can you try this patch on top?

diff --git a/include/linux/pm.h b/include/linux/pm.h
index 871c9c49ec9d..84592229d754 100644
--- a/include/linux/pm.h
+++ b/include/linux/pm.h
@@ -334,9 +334,9 @@ struct dev_pm_ops {
        .restore_noirq =3D pm_sleep_ptr(resume_fn),

 #define RUNTIME_PM_OPS(suspend_fn, resume_fn, idle_fn) \
-       .runtime_suspend =3D suspend_fn, \
-       .runtime_resume =3D resume_fn, \
-       .runtime_idle =3D idle_fn,
+       .runtime_suspend =3D pm_ptr(suspend_fn), \
+       .runtime_resume =3D pm_ptr(resume_fn), \
+       .runtime_idle =3D pm_ptr(idle_fn),

 #ifdef CONFIG_PM_SLEEP
 #define SET_SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \

Commit 1a3c7bb08826 ("PM: core: Add new *_PM_OPS macros, deprecate
old ones") introduced all the macros with the intent of using pm_ptr()
and pm_sleep_ptr() in them, and I think Paul accidentally forgot to add
those in this instance.

       Arnd

