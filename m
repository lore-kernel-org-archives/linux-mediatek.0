Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB22C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 07:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JelGs2Bn2tO3XnL+WkT6NZMNkcHYwr7t2J/JT4aZBq4=; b=1SdzzAymPz3GrdNfh0vGP/CKh4
	707xxoeXwIPslFliOH5UH4gCGUTTvrpYMSe7u/YhWJHTG+yDosBcdxlxGkuzn1IVzjv89rUOCwYcB
	58mUnjem1IXgW6f8fwKxhrykODeOEtZIABrWdMFh0as0LIMVec4VgznaEHF0HBfAn93gnc+ZXEXbO
	iF0sxkX4GCFmlZCZR+J6Jcz7J92UwhWnHBavZSjoSLSbXCrevyhaifxYSWRRi2K9IQddrp7wopmwf
	W4WNzgukNW5tNaS7xPH02nJcQercbE3vv4PeDxO31xQ72YmLu+C8sKZSROOyWTDBlZ+kfznjN9Rpd
	dLItkY0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFsG2-005vJc-PL; Mon, 25 Jul 2022 07:12:02 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFsG0-005vEb-Ca; Mon, 25 Jul 2022 07:12:01 +0000
Received: from mail-ej1-f45.google.com ([209.85.218.45]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MgNxZ-1nYrvX1X4h-00hw1I; Mon, 25 Jul 2022 09:11:56 +0200
Received: by mail-ej1-f45.google.com with SMTP id ss3so18812552ejc.11;
        Mon, 25 Jul 2022 00:11:56 -0700 (PDT)
X-Gm-Message-State: AJIora/xpZ40RBvH5sujqiuovjNH0bVKT3hfn3C8DfDAwLSnEjOvx4TC
	ZO+T/soDFcAhcUQWfWqWWyFDq43hU49z2w42qfQ=
X-Google-Smtp-Source: AGRyM1vsXI3Ky9UWaTbBb62V/2imE1yupiH29WQmI1FGfnsmQmviYwxhNC+GHy4zia5B5lmb/ALvUGKfZkDP6ajCAGg=
X-Received: by 2002:a17:906:dc89:b0:72f:1d4f:cea8 with SMTP id
 cs9-20020a170906dc8900b0072f1d4fcea8mr9259669ejc.654.1658733115829; Mon, 25
 Jul 2022 00:11:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220704025632.235968-1-renzhijie2@huawei.com>
 <CAK8P3a07jGCuAVQAZgpENRP_xFLiogU9W1Uze+n21h7TdOZhog@mail.gmail.com>
 <df9909dc-3303-808e-575a-47190f636279@huawei.com> <CAK8P3a3SA9zvVu0i1m0kqbemLd4WfTMGfpc8VwhsmJOBgZHvsA@mail.gmail.com>
 <af043109-c101-a147-707b-82e79469ae73@huawei.com> <CAK8P3a0LCaMoWArcQNY5qayUABgRXWEogrtQQ-sbR+zY6n=O4w@mail.gmail.com>
 <f565a5b5-8ba2-adbb-8093-6d60b2159222@huawei.com>
In-Reply-To: <f565a5b5-8ba2-adbb-8093-6d60b2159222@huawei.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 25 Jul 2022 09:11:39 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2L4J1Qfu5rw8dvbto25zZDiUrv6vbv-6A6nckgyoRmZQ@mail.gmail.com>
Message-ID: <CAK8P3a2L4J1Qfu5rw8dvbto25zZDiUrv6vbv-6A6nckgyoRmZQ@mail.gmail.com>
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
X-Provags-ID: V03:K1:ceIiTWNYGq0zR39LtvsUKLOfOjK+bXHijoVhEcNh7BsX+J+4yKz
 SqMYEaIrBID8HcLRZvBfzLJwujTCZAf+zXjiVRF0wb5PuioUIIec4gWdGBDdyjm7oJY4XGu
 FfgPT/l0sBstwazIafA6q7HTay3oTLKpnFxVf8vSQ66wngeqmJg5ZTTx41u2SswO+imWfoa
 nU52TnmWhfRR6xd/ki++w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tQFgCzOn+fQ=:6qgrkpvnpDq9Kfr8X7Ivuj
 XI2ZfDKBQNMa61pRpd0wjIjn2ZR8N4KyvIPjZNo68DP9HoqC+KhQBoAFQtqByverW1Ry1Fr6j
 Fvll8jvZhfVLatCL10VsASTIPFszrPHDQKhwDM7JbRLqSBNWwEkMpcz91+4XVI5kIM6ICF7pV
 QjCyqqJFygGnOyV/Mwtq6vpkwFtZtIN1HIqnfT1AfRJKLYuJQlXQ74QdlLtpXrERfRA5+dmhc
 IrZECEu3lZ9jMMxj1US+udx5jM70M0b1tziVMPYjNYJA8vDTu+JPzeF1MEohAoPrdp2rr0X9x
 RlVv2xPZcmX/mzPGq6iluq9Apr4p5icvtgKWGf38xXUC4e6kfjcXQv7ziUmj05S9oICI8+ExI
 HHv0KrOF1DehBVKW5thsIP/lL10vpJ7mNl+UXu9PLRMS1qkhoEb03hgYjbtXLnHqFnagIz21i
 3PN2be+UsnjoEm6Mykmj+UX5jpQOMn9vmBV5On1RWzk2404WKBxtusS+D/1MEj5Y/gCG4+mwG
 icyaECimsTIsjZ+Pa0Z6487/I6yoWA2VQ5bCf8guLma/rQlKtpiJddMRGlsFPn6gsIJnwRs5S
 jVLhzrHiCZz/5Uu9KmaJqc9lWXGCmEJHjtNT8AYQaKhCwkk5dKxN/ZqjAgVmIFqM0Z7/6IRbM
 gcMZckdg/YVlmL3TdMldeXhvrJY+SQhEYkvAdz1YCj+YKDqiQt2y7LNiDGo+PR/o5FsnIXcfw
 URFSUsHD/moyAbUKqyzPWpVyVWddP01KTp7oteAIkEIP2g89WrJeXSOeY9tZzzQeav5MRkHBF
 +TQFfjYPBL6YU5q/H6R2bXguNSkqm4k4jUoVuxj36kLT8ViNc0BgsCPsGeIE7XTYeR6W9gcyE
 Cb8x+5RXwSfRiUA4rDzA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_001200_745938_01A5D196 
X-CRM114-Status: GOOD (  22.62  )
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

On Mon, Jul 25, 2022 at 9:00 AM Ren Zhijie <renzhijie2@huawei.com> wrote:
> =E5=9C=A8 2022/7/25 14:34, Arnd Bergmann =E5=86=99=E9=81=93:
> > On Mon, Jul 25, 2022 at 5:38 AM Ren Zhijie <renzhijie2@huawei.com> wrot=
e:
> >> =E5=9C=A8 2022/7/13 16:48, Arnd Bergmann =E5=86=99=E9=81=93:
> >>
> >> I try to use the new marcos SYSTEM_SLEEP_PM_OPS and RUNTIME_PM_OPS to
> >> replace the old ones, and remove #ifdef around the declarations in the
> >> header, my local changes attach below.
> >>
> >> But it seems  that doesn't work, which has ld errors:
> >>
> >> aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected!
> >> aarch64-linux-gnu-ld: Unexpected run-time procedure linkages detected!
> >> drivers/ufs/host/ufs-mediatek.o: In function `ufs_mtk_runtime_resume':
> >> ufs-mediatek.c:(.text+0x1d0c): undefined reference to
> >> `ufshcd_runtime_resume'
> >> drivers/ufs/host/ufs-mediatek.o: In function `ufs_mtk_runtime_suspend'=
:
> >> ufs-mediatek.c:(.text+0x1d64): undefined reference to
> >> `ufshcd_runtime_suspend'
> >> Makefile:1255: recipe for target 'vmlinux' failed
> >> make: *** [vmlinux] Error 1
> >>
> >> (CONFIG_PM and CONFIG_PM_SLEEP are both not set, and
> >>
> > It appears that there is a mistake in the RUNTIME_PM_OPS()
> > macro definition, can you try this patch on top?
>
> Hi Arnd,
>
> I apply this patch and it worked.
>
> When will this patch be merged?

So far nobody has submitted this, I was just guessing and I had no idea
if this would do the right thing. Can you send this patch to the power
management maintainers with a proper changelog and a

Suggested-by: Arnd Bergmann <arnd@arndb.de>

 line? Thanks,

     Arnd

