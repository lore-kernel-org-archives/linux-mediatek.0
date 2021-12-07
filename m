Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB085C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Dec 2021 15:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=caFIbyCFlXXFUHOdPmRiXgOZVCPCVvKjt7cyQXH/jsI=; b=JWQatveYg/alNa
	+T7kXrvuRO9uPqOe0FPYORm8KrdtFgJj2DYEINGQ8fO3TZq6/OZHKjR3XSNw6S0WveGxE49/6nQhl
	HgMnJ8WqhuyzY00d8ft5O4CyMGdPheMJgtY6YrxMHskUsU2SKnlw7JWCQ7Ah5UvfH/O5+MNSYYHCU
	s3dE9yxkA3Ei7F6CuS5L68ecsO/Awv4mX8zsoPgiqRuhHzFmjg1uuX0a33Ku1WPyHNocMCBD5/aR/
	xDqZsML4GoJxrFGQSiHbEzFUYweXVfogUl7RblObGs2cKfXGzCsDMAmSgYJwID8gXpB6CgQ7hr6bu
	3xVYXp8Zp7O7thrCaMxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mubzU-0094qD-6C; Tue, 07 Dec 2021 15:02:48 +0000
Received: from mail-vk1-f172.google.com ([209.85.221.172])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mubXd-008xKj-RQ; Tue, 07 Dec 2021 14:34:03 +0000
Received: by mail-vk1-f172.google.com with SMTP id s17so9411776vka.5;
 Tue, 07 Dec 2021 06:34:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qpQwqoT8XwAAdzoQ9aX+buSx+t+PONUN1DKB1Js0qIY=;
 b=gemZYnnnXnLO/T9wxAxtZgiaCfWKTX1lHDtNl1CRAaXX1tI5wZQKEWn3g8X8GIq7PC
 eUINAqUkfUtDFAYRwT7aQWV+nCVOFXTm/CaJ/WRaPzzBSWar7q9WCbODfvs5V1yiQEBq
 ULTfVh6q4Rz94VWY/20/aOhEIfeHhYG2fkvQiFhFIC6GJa9F8sryO9CuOnV85+0ITAjI
 eLjhrcws5v507KAeVlwOogBvZftnHP3vPMCs7Lhu6E/xBl8gCC06tNMgiUbH/nvSdd3M
 Ph3O7qc5x8ruPMESOz7hL3Re642Uw6LNy329cL3x1S7pTS1zNQImIF0r5UQQw+UwpsxH
 NleA==
X-Gm-Message-State: AOAM5337PbM2Yd2zZFicEV2yUxg1vvbZfecQrBVfiGtGsUge+LbTlqta
 z3FyXPfQrfhFWjlBGlOT92PwCBk+kWWptA==
X-Google-Smtp-Source: ABdhPJxSS4o+ORv8tES7OaF8R4Q+hWEoC4fldaO4NoJqzv4TeihrxTko0q35RptK+tZpSsFh+15Jiw==
X-Received: by 2002:a05:6122:d09:: with SMTP id
 az9mr53844015vkb.23.1638887639733; 
 Tue, 07 Dec 2021 06:33:59 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com.
 [209.85.222.43])
 by smtp.gmail.com with ESMTPSA id q9sm6256870vkn.44.2021.12.07.06.33.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 06:33:59 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id j14so26849148uan.10;
 Tue, 07 Dec 2021 06:33:58 -0800 (PST)
X-Received: by 2002:a05:6102:21dc:: with SMTP id
 r28mr46694326vsg.57.1638887638783; 
 Tue, 07 Dec 2021 06:33:58 -0800 (PST)
MIME-Version: 1.0
References: <20211202062733.20338-1-moudy.ho@mediatek.com>
 <20211202062733.20338-4-moudy.ho@mediatek.com>
 <c48154b9-b202-c47c-c27e-53aa97877430@xs4all.nl>
In-Reply-To: <c48154b9-b202-c47c-c27e-53aa97877430@xs4all.nl>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Dec 2021 15:33:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVDQMUcYSnvPj=TOepSbgSj7fO7oxd9QvQBDSttpVz=ew@mail.gmail.com>
Message-ID: <CAMuHMdVDQMUcYSnvPj=TOepSbgSj7fO7oxd9QvQBDSttpVz=ew@mail.gmail.com>
Subject: Re: [PATCH v10 3/3] media: platform: mtk-mdp3: add Mediatek MDP3
 driver
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Landley <rob@landley.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Alexandre Courbot <acourbot@chromium.org>, 
 Tomasz Figa <tfiga@chromium.org>, drinkcat@chromium.org, pihsun@chromium.org, 
 hsinyi@google.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Maoguang Meng <maoguang.meng@mediatek.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>, 
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, menghui.lin@mediatek.com,
 sj.huang@mediatek.com, 
 allen-kh.cheng@mediatek.com, randy.wu@mediatek.com, jason-jh.lin@mediatek.com, 
 roy-cw.yeh@mediatek.com, river.cheng@mediatek.com, 
 srv_heupstream@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_063401_931717_37A27EDF 
X-CRM114-Status: GOOD (  33.70  )
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

Hi Hans,

On Tue, Dec 7, 2021 at 3:20 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> On 12/2/21 7:27 AM, Moudy Ho wrote:
> > This patch adds driver for Mediatek's Media Data Path ver.3 (MDP3).
> > It provides the following functions:
> >   color transform, format conversion, resize, crop, rotate, flip
> >   and additional image quality enhancement.
> >
> > The MDP3 driver is mainly used for Google Chromebook products to
> > import the new architecture to set the HW settings as shown below:
> >   User -> V4L2 framework
> >     -> MDP3 driver -> SCP (setting calculations)
> >       -> MDP3 driver -> CMDQ (GCE driver) -> HW
> >
> > Each modules' related operation control is sited in mtk-mdp3-comp.c
> > Each modules' register table is defined in file with "mdp_reg_" prefix
> > GCE related API, operation control  sited in mtk-mdp3-cmdq.c
> > V4L2 m2m device functions are implemented in mtk-mdp3-m2m.c
> > Probe, power, suspend/resume, system level functions are defined in
> > mtk-mdp3-core.c
> >
> > Signed-off-by: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
> > Signed-off-by: daoyuan huang <daoyuan.huang@mediatek.com>
> > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > ---
> >  drivers/media/platform/Kconfig                |   19 +
> >  drivers/media/platform/Makefile               |    2 +
> >  drivers/media/platform/mtk-mdp3/Makefile      |    6 +
> >  .../media/platform/mtk-mdp3/mdp_reg_ccorr.h   |   19 +
> >  drivers/media/platform/mtk-mdp3/mdp_reg_isp.h |   27 +
> >  .../media/platform/mtk-mdp3/mdp_reg_rdma.h    |   65 +
> >  drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h |   39 +
> >  .../media/platform/mtk-mdp3/mdp_reg_wdma.h    |   47 +
> >  .../media/platform/mtk-mdp3/mdp_reg_wrot.h    |   55 +
> >  drivers/media/platform/mtk-mdp3/mtk-img-ipi.h |  280 ++++
> >  .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   |  505 +++++++
> >  .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.h   |   46 +
> >  .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 1264 +++++++++++++++++
> >  .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   |  147 ++
> >  .../media/platform/mtk-mdp3/mtk-mdp3-core.c   |  338 +++++
> >  .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |   76 +
> >  .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |  789 ++++++++++
> >  .../media/platform/mtk-mdp3/mtk-mdp3-m2m.h    |   49 +
> >  .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   |  737 ++++++++++
> >  .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |  372 +++++
> >  .../media/platform/mtk-mdp3/mtk-mdp3-vpu.c    |  312 ++++
> >  .../media/platform/mtk-mdp3/mtk-mdp3-vpu.h    |   78 +
> >  22 files changed, 5272 insertions(+)
> >  create mode 100644 drivers/media/platform/mtk-mdp3/Makefile
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_ccorr.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_isp.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_rdma.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_wdma.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_wrot.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-img-ipi.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.h
> >
> > diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> > index cf4adc64c953..e6c1e8892154 100644
> > --- a/drivers/media/platform/Kconfig
> > +++ b/drivers/media/platform/Kconfig
> > @@ -315,6 +315,25 @@ config VIDEO_MEDIATEK_MDP
> >           To compile this driver as a module, choose M here: the
> >           module will be called mtk-mdp.
> >
> > +config VIDEO_MEDIATEK_MDP3
> > +     tristate "Mediatek MDP v3 driver"
> > +     depends on MTK_IOMMU || COMPLIE_TEST
>
> Typo: COMPLIE_TEST -> COMPILE_TEST
>
> After fixing this, trying to build this driver on my PC results in:
>
> ERROR: modpost: "mtk_mmsys_mdp_connect" [drivers/media/platform/mtk-mdp3/mtk-mdp3.ko] undefined!
> ERROR: modpost: "mtk_mmsys_mdp_camin_ctrl" [drivers/media/platform/mtk-mdp3/mtk-mdp3.ko] undefined!
> ERROR: modpost: "mtk_mmsys_mdp_isp_ctrl" [drivers/media/platform/mtk-mdp3/mtk-mdp3.ko] undefined!
> ERROR: modpost: "mtk_mutex_prepare" [drivers/media/platform/mtk-mdp3/mtk-mdp3.ko] undefined!
> ERROR: modpost: "mtk_mmsys_mdp_disconnect" [drivers/media/platform/mtk-mdp3/mtk-mdp3.ko] undefined!
> ERROR: modpost: "mtk_mutex_unprepare" [drivers/media/platform/mtk-mdp3/mtk-mdp3.ko] undefined!
> ERROR: modpost: "mtk_mutex_get_mdp_mod" [drivers/media/platform/mtk-mdp3/mtk-mdp3.ko] undefined!
> ERROR: modpost: "mtk_mutex_put" [drivers/media/platform/mtk-mdp3/mtk-mdp3.ko] undefined!
> ERROR: modpost: "mtk_mutex_mdp_get" [drivers/media/platform/mtk-mdp3/mtk-mdp3.ko] undefined!
> ERROR: modpost: "mtk_mutex_add_mod_by_cmdq" [drivers/media/platform/mtk-mdp3/mtk-mdp3.ko] undefined!
> WARNING: modpost: suppressed 1 unresolved symbol warnings because there were too many)
>
> include/linux/soc/mediatek/mtk-mmsys.h should probably provide dummy functions
> if CONFIG_MTK_MMSYS is undefined. Ditto for include/linux/soc/mediatek/mtk-mutex.h.

Or add a hard dependency on MTK_MMSYS?
The latter can be enabled when compile-testing.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
