Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A564FC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Dec 2021 08:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hnj0odmfRl/mIVZamFPyIY4WF1+vKZ/GVGgLT+cutUE=; b=wNwjMX+quCoxED
	6SiBF77L5LV7mGTFN/M7ZlVkGnuoyUX+VQMTKUKmMfqzPmurk1J997Fl/P8N+ZAO129HJ/HQCjWJo
	/PTgyxICn/ADJcfOHPmtQ7kQvOgAw11slf6km1DmbPDdOS+sgBTZ2N9F3NYyLJC8PC6hZjAeG+1j8
	yfWVswDSLAVz7ELJGAfZRdrMYYYNzJDlF0PHQVZ3pdasnSX7KfXOxT9VLCwkVyYRJWrtf3fXrcJK6
	V50TI8SmK09scLvpiA/lrVZPk6YOnsfRJhxRjHM/GUurDSVsQZt1yvDv2rzLd2HK0Z98KGGBrOJ1Y
	nvRK+m2SdFvOYwiUMhVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2qPw-003zFJ-LU; Thu, 30 Dec 2021 08:04:08 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2q9K-003t0f-Ry
 for linux-mediatek@lists.infradead.org; Thu, 30 Dec 2021 07:47:00 +0000
Received: by mail-ua1-x929.google.com with SMTP id r15so41303492uao.3
 for <linux-mediatek@lists.infradead.org>; Wed, 29 Dec 2021 23:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P6Nx7pKRfOXxRTDSc5fat2rVIi8irKZ4fTXz3GCHr54=;
 b=BDAiEUW5tNIC/4GAd86omeehgKxD48uR8TmGZGn/iiCiixLroQFa6GcpzDo2kmZb+K
 LbxOHqUTXjNFNvSrmgm299A1WopwPJo3g00imtqEHXsTCIKAH+z9Efj6Y3i27lP/+yBH
 Be6uPZe+gDjyeyFoHkb3nU+a2LiX9fVlrLmNzixpRJVVxGy7WSdk/nkiDWJGcRcucxcK
 /7yX0dnto2qBekZwgPI0XHAI4hjBS8mnuqtoniNsO3EZhlTEd1wBZSsXdoSNlZEpwQwU
 IHsO0z7GWi6zgWijQimya8x6/svceecZhHDDRgx8EotGVHFVW+cXe3E9TRnHe66A8HhQ
 RfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P6Nx7pKRfOXxRTDSc5fat2rVIi8irKZ4fTXz3GCHr54=;
 b=MFc6HQygDyiLLR3ykoacfQbcid5PGhxqxGzqJptymnC6GT+WzBrhY9g52DU4sKy4tq
 Q5K6eCPhkRVbFOLykI46bIR2S/GdFEazml7nOwzBVOU2ywFbq97vPOL4BvN2/KdzEXij
 p6J83ZYJ1tYpqlWlBi6C98QpKfSyCNy/nSzP2tUbD4WQSChn0CsYBo8l4O05KXPzAu6A
 sbc4mjdZ5f6QbTe/GxCmOqihu2A6GHIaxQzdE2Dy+h2vXoELuFiU1mluK5VAUCYZszyy
 RR/aIGLC1U2awweIhs2mpJG/Jc8B3wCsuJFzI/Os313LisMcHQoXMeLnmfTg/SNMZFAB
 KWbg==
X-Gm-Message-State: AOAM531CDgC4UsJhguA36+65Lf+neXfr8d4D7t5avAjapWVje0ydZkqd
 O9Zy7wSCE5wZjRsoLRBcNwMFmP6RkFusji99RXM=
X-Google-Smtp-Source: ABdhPJyyCo2cFRBQb0L9ZLLc77idUgVs/rT6BSBTdxr/nqpqkiJhQgmw5IageaCQOu8a6tiFmF0ymDxKDlGSWOZTZ30=
X-Received: by 2002:a05:6102:38ce:: with SMTP id
 k14mr9013310vst.70.1640850416912; 
 Wed, 29 Dec 2021 23:46:56 -0800 (PST)
MIME-Version: 1.0
References: <20211230054713.1562260-1-weirongguang@kylinos.cn>
In-Reply-To: <20211230054713.1562260-1-weirongguang@kylinos.cn>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 30 Dec 2021 08:46:45 +0100
Message-ID: <CAMhs-H-79=2v1oS1640HQRmdxQk3rAGi-YXb8A3OLN0Oc33WHw@mail.gmail.com>
Subject: Re: [PATCH] PCI: mt7621: Fix the compile error in cross complication
To: weirongguang <weirongguang@kylinos.cn>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, 
 linux-pci <linux-pci@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_234658_952635_5D003091 
X-CRM114-Status: GOOD (  35.80  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi weirongguang,

[+cc linux-pci]

On Thu, Dec 30, 2021 at 6:47 AM weirongguang <weirongguang@kylinos.cn> wrote:

Your subject is a bit generic I think it would be better:

s/Fix the compile error in cross complication/Add missing arch include
'asm/mips-cps.h' to avoid implicit function declarations/

>
> When I was compile the latest kernel in x86 platform and
> the build environment like this:
>
> Compiler: gcc
> Compiler version: 10
> Compiler string: mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110
> Cross-compile: mips-linux-gnu-
>
> It make a compile error:
>
> drivers/pci/controller/pcie-mt7621.c: In function 'setup_cm_memory_region':
> drivers/pci/controller/pcie-mt7621.c:224:6: error: implicit declaration of function 'mips_cps_numiocu' [-Werror=implicit-function-declaration]
>   224 |  if (mips_cps_numiocu(0)) {
>       |      ^~~~~~~~~~~~~~~~
> drivers/pci/controller/pcie-mt7621.c:232:3: error: implicit declaration of function 'write_gcr_reg1_base'; did you mean 'write_gc0_ebase'? [-Werror=implicit-function-declaration]
>   232 |   write_gcr_reg1_base(entry->res->start);
>       |   ^~~~~~~~~~~~~~~~~~~
>       |   write_gc0_ebase
> drivers/pci/controller/pcie-mt7621.c:233:3: error: implicit declaration of function 'write_gcr_reg1_mask'; did you mean 'write_gc0_pagemask'? [-Werror=implicit-function-declaration]
>   233 |   write_gcr_reg1_mask(mask | CM_GCR_REGn_MASK_CMTGT_IOCU0);
>       |   ^~~~~~~~~~~~~~~~~~~
>       |   write_gc0_pagemask
> drivers/pci/controller/pcie-mt7621.c:233:30: error: 'CM_GCR_REGn_MASK_CMTGT_IOCU0' undeclared (first use in this function)
>   233 |   write_gcr_reg1_mask(mask | CM_GCR_REGn_MASK_CMTGT_IOCU0);
>       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/pci/controller/pcie-mt7621.c:233:30: note: each undeclared identifier is reported only once for each function it appears in
> In file included from ./include/linux/device.h:15,
>                  from ./include/linux/of_platform.h:9,
>                  from drivers/pci/controller/pcie-mt7621.c:26:
> drivers/pci/controller/pcie-mt7621.c:235:25: error: implicit declaration of function 'read_gcr_reg1_base'; did you mean 'read_gc0_ebase'? [-Werror=implicit-function-declaration]
>   235 |     (unsigned long long)read_gcr_reg1_base(),
>       |                         ^~~~~~~~~~~~~~~~~~
> ./include/linux/dev_printk.h:110:23: note: in definition of macro 'dev_printk_index_wrap'
>   110 |   _p_func(dev, fmt, ##__VA_ARGS__);   \
>       |                       ^~~~~~~~~~~
> drivers/pci/controller/pcie-mt7621.c:234:3: note: in expansion of macro 'dev_info'
>   234 |   dev_info(dev, "PCI coherence region base: 0x%08llx, mask/settings: 0x%08llx\n",
>       |   ^~~~~~~~
> drivers/pci/controller/pcie-mt7621.c:236:25: error: implicit declaration of function 'read_gcr_reg1_mask'; did you mean 'read_gc0_pagemask'? [-Werror=implicit-function-declaration]
>   236 |     (unsigned long long)read_gcr_reg1_mask());
>       |                         ^~~~~~~~~~~~~~~~~~
> ./include/linux/dev_printk.h:110:23: note: in definition of macro 'dev_printk_index_wrap'
>   110 |   _p_func(dev, fmt, ##__VA_ARGS__);   \
>       |                       ^~~~~~~~~~~
> drivers/pci/controller/pcie-mt7621.c:234:3: note: in expansion of macro 'dev_info'
>   234 |   dev_info(dev, "PCI coherence region base: 0x%08llx, mask/settings: 0x%08llx\n",
>       |   ^~~~~~~~
> cc1: all warnings being treated as errors
>
> The problem is that the <asm/mips-cps.h> head file was missing
> and it can resolved when include the file.

True. This include header is not explicitly included because platform
Makefiles seems to add include paths for MIPS. I am using:

mipsel-unknown-linux-gnu-gcc (GCC) 9.4.1 20211208 compiled as:

../configure --target=mipsel-unknown-linux-gnu --prefix=/opt/cross \
    --enable-languages=c --without-headers \
    --with-gnu-ld --with-gnu-as \
    --disable-shared --disable-threads \
    --disable-libmudflap --disable-libgomp \
    --disable-libssp --disable-libquadmath \
    --disable-libatomic

and don't get any warning with normal compilation, but it looks like
other toolchains complain about this and fails if -Werror is set, like
your case here.
This was already reported once by kernel test robot, so I think you
should add 'Reported-by' tag also:

Reported-by: kernel test robot <lkp@intel.com>

I could not find Kernel Test Robot complaining about lore's link but
it was in a randconfig W=1 build using mips64-linux-gcc (GCC) 11.2.0.

IMHO, the correct thing to do is remove architecture specific code
from the driver side. See [0] (I mention this in PATCH 3 of the series
where Reported-by is also added [1]).

>
> Fix: <2bdd5238e756> ("PCI: mt7621: Add MediaTek MT7621 PCIe host controller driver")

This is not the correct way of "Fixes" tag. It should be:

Fixes: 2bdd5238e756 ("PCI: mt7621: Add MediaTek MT7621 PCIe host
controller driver").

> Signed-off-by: weirongguang <weirongguang@kylinos.cn>

I don't know if "weirongguang" is a valid name or not for a
'Signed-off-by' tag, but just in case I mention it. Is this the name
you use to sign documents? (sorry, I don't want to be rude, but I
don't really know the way chinese names should be used in kernel).


> ---
>  drivers/pci/controller/pcie-mt7621.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pci/controller/pcie-mt7621.c b/drivers/pci/controller/pcie-mt7621.c
> index b60dfb45ef7b..8a009e427a25 100644
> --- a/drivers/pci/controller/pcie-mt7621.c
> +++ b/drivers/pci/controller/pcie-mt7621.c
> @@ -29,6 +29,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
>  #include <linux/sys_soc.h>
> +#include <asm/mips-cps.h>
>
>  /* MediaTek-specific configuration registers */
>  #define PCIE_FTS_NUM                   0x70c
> --
> 2.25.1

As I said, there is a proper approach of removing all the MIPS
specific code from the driver and moving into RALINK platform code
which is the proper place for this arch code here [0]. This should be
material for 5.17. If Lorenzo or Bjorn prefer to add this PATCH
before, you can add my:

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

when you submit v2 and I will send a revert when the real fix is added.

[0]: https://lore.kernel.org/linux-pci/20211207104924.21327-1-sergio.paracuellos@gmail.com/
[1]: https://lore.kernel.org/linux-pci/20211207104924.21327-4-sergio.paracuellos@gmail.com/

Best regards,
    Sergio Paracuellos



>
>
> No virus found
>                 Checked by Hillstone Network AntiVirus

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
