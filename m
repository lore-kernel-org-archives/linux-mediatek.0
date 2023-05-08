Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D95CC77B75
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 May 2023 12:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZwIMXRuES2XSnRGW5u6aMt/UwVSYJump/WpCRzaAaMo=; b=pxddAp88KSt1jw/CigTkETd1tn
	bQLrmNy90foV4ffbD/5suILkFEcI1MaPwT3Rrbks16QJcvMb2+CSv24+a46OXrguH2Fhhaovz3fsv
	jwXplMvJ6bljsdnrSipM+0QGVWlK+B17q5XprBeTIvbU/rI64XvO2JRhZ6QiOyRrjifgC019U70Rw
	xSFxRqSbrBDa6bcCvzUcU5nLB1dvOsv0td6X1ohPd/VbjS8FFGQqsZh6BSq/erKDQAQyu4RQQCre7
	Ym4kYy2oe7o8itywtBmbLcMTmAgVywgRGagewEOqAni3+IAnNgF4iZ9pDHxEsUqfXp2yaTqwW4XS6
	bkedwbZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzlY-000Uaw-2x;
	Mon, 08 May 2023 12:14:56 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzlU-000UXv-2m
	for linux-mediatek@lists.infradead.org;
	Mon, 08 May 2023 12:14:54 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:6a18:41e7:fcfe:24c0])
	by albert.telenet-ops.be with bizsmtp
	id uCEY2900F2WBekD06CEYzh; Mon, 08 May 2023 14:14:43 +0200
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pvzlA-001VjV-5u;
	Mon, 08 May 2023 14:14:32 +0200
Date: Mon, 8 May 2023 14:14:32 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-kernel@vger.kernel.org
cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
    Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
    Tudor Ambarus <tudor.ambarus@linaro.org>, 
    Pratyush Yadav <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>, 
    Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
    Johannes Berg <johannes@sipsolutions.net>, 
    "Darrick J. Wong" <djwong@kernel.org>, 
    Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
    Philipp Zabel <p.zabel@pengutronix.de>, 
    "David S. Miller" <davem@davemloft.net>, linux-um@lists.infradead.org, 
    linux-media@vger.kernel.org, linux-mtd@lists.infradead.org, 
    linux-xfs@vger.kernel.org, linux-mediatek@lists.infradead.org, 
    linux-phy@lists.infradead.org, sparclinux@vger.kernel.org
Subject: Re: Build regressions/improvements in v6.4-rc1
In-Reply-To: <20230508115727.2597864-1-geert@linux-m68k.org>
Message-ID: <749c2fc2-93dc-585-3826-dea581602d6e@linux-m68k.org>
References: <CAHk-=wiUxm-NZ1si8dXWVTTJ9n3c+1SRTC0V+Lk7hOE4bDVwJQ@mail.gmail.com> <20230508115727.2597864-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_051453_037954_C56FDD05 
X-CRM114-Status: GOOD (  17.15  )
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

On Mon, 8 May 2023, Geert Uytterhoeven wrote:
> Below is the list of build error/warning regressions/improvements in
> v6.4-rc1[1] compared to v6.3[2].
>
> Summarized:
>  - build errors: +9/-16
>  - build warnings: +1/-1439
>
> Happy fixing! ;-)
>
> Thanks to the linux-next team for providing the build service.
>
> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/ac9a78681b921877518763ba0e89202254349d1b/ (all 152 configs)
> [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/457391b0380335d5e9a5babdec90ac53928b23b4/ (all 152 configs)
>
>
> *** ERRORS ***
>
> 9 error regressions:
>  + /kisskb/src/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c: error: 'mxc_isi_pm_resume' defined but not used [-Werror=unused-function]:  => 328:12
>  + /kisskb/src/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c: error: 'mxc_isi_pm_suspend' defined but not used [-Werror=unused-function]:  => 314:12

sparc64-gcc{5,11}/sparc-allmodconfig
(fix was available before the merge window)

>  + /kisskb/src/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c: error: "CONFIG_ARCH_DMA_ADDR_T_64BIT" is not defined [-Werror=undef]:  => 66:5, 33:5, 51:5
>  + /kisskb/src/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c: error: "CONFIG_ARCH_DMA_ADDR_T_64BIT" is not defined, evaluates to 0 [-Werror=undef]:  => 51:5, 66:5, 33:5

mips-gcc{8,11}/mips-allmodconfig
xtensa-gcc11/xtensa-allmodconfig
powerpc-gcc5/ppc32_allmodconfig
(fix was available before the merge window)

>  + /kisskb/src/drivers/mtd/spi-nor/spansion.c: error: 'op' is used uninitialized [-Werror=uninitialized]:  => 495:27, 364:27

um-x86_64-gcc12/um-allyesconfig

>  + /kisskb/src/fs/xfs/scrub/scrub.h: error: initializer element is not constant:  => 112:28

powerpc-gcc5/ppc64_book3e_allmodconfig
powerpc-gcc5/powerpc-allmodconfig
powerpc-gcc5/ppc32_allmodconfig
powerpc-gcc5/powerpc-allyesconfig
powerpc-gcc5/ppc64le_allmodconfig
arm64-gcc5/arm64-allmodconfig
(fix sent)

>  + error: modpost: "__floatunsidf" [drivers/phy/mediatek/phy-mtk-hdmi-drv.ko] undefined!:  => N/A
>  + error: modpost: "__gedf2" [drivers/phy/mediatek/phy-mtk-hdmi-drv.ko] undefined!:  => N/A
>  + error: modpost: "__ltdf2" [drivers/phy/mediatek/phy-mtk-hdmi-drv.ko] undefined!:  => N/A

sparc64-gcc5/sparc64-allmodconfig

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds

