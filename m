Return-Path: <SRS0=VpQz=L2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 555E5C11F68
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 12:01:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BD7461416
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 12:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BD7461416
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X3YhE4ikLEtexQyezU9bl43r1frCSjXOdGUqIeLzJ4I=; b=HE+4+xTRkdvw0r
	nZffKyxqZ36XdED896iZP7M7pLruUIlkTYBDa/9P731E6A/qp95dPiYqdcJtiC36aa3R/v/AHpuoR
	Du4j4ndrYdzXcI4RDPHZSkzCMwVnDru1ALLVXINZ5CtlhFbxRhu9GBH1QPmTvmb75vGH6RIeYbbaF
	cJgg8/KbqIHY1Z/eEIc2HKEZe7+oIHuYkwe2MP1T6S5CxghSIzMoBhIPhN82KyIHN2LIOh20Zsq9w
	9a2NcuDP7JMAXLSxXD1LFKgm7wE72tukq8DSfLutLze+SWP2AP4IT1NhtvwkR3i/Y4sAe9XxA3OdJ
	EnvYYFB+uUoYzIVLaYkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzHr0-002xK7-I5; Fri, 02 Jul 2021 12:01:06 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzHqn-002xFD-96; Fri, 02 Jul 2021 12:00:54 +0000
Received: by mail-oi1-x22b.google.com with SMTP id q23so10973301oiw.11;
 Fri, 02 Jul 2021 05:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YJ+EtDWQs+us5BNhruD1jgDhGjdRaOspQtCVuCEvz6w=;
 b=HjTbAAxcGzjV6TBksscfbS39Y0D5cXtkVuCR9ZUNTYvK7MNOcQXOaW6LVxvxFcxiNa
 259jkdIOYViNy6gVGSIDmEiAt0DLNGa66t+q01Oi7MYvCrIntzJ6mgd80d3Ww+oiAPQp
 w9Df7ljvR+MRo4t6/YhXSeERV1yKgCzkyG4/PhNtUan/GFDZMHtlGveKMjyvTbhwKgsJ
 FXlFT9mIe58Gqjus8GKGNWfJHpJQZ5AyVHHdNZnHVgkpuGZxwhHqnZ4A1FcaEaB5qSyl
 DTBfAnG99kySz8EwXWQwrtXBk9PgfDMJNHmGz0OOCN9fexL5hTL4XGFhZC+Mj8XcajRi
 152A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YJ+EtDWQs+us5BNhruD1jgDhGjdRaOspQtCVuCEvz6w=;
 b=YfaMHwF90010cfyYJMjfXNwxCMluS5sBl2hnelQZuSY+etj3ixOS9PNlXoDoWdZ/Mo
 qrUjgCvb+BjUVUtmOEj05JcTmUgCIz6f/VnOpLa7A1ksrifRxmC6lRZiLbmTHDQCjeIf
 s43DKQVIZ6dCkgYnRaY5cdFJxMUrQJ64u2CdBMOxkTZ/XmYPj8xoq8UFTJMfR094vlHU
 TrK0ZgXUOK/Lhey5+fyBbThB+hcf0CPXi+ZzYSVGy5dHDUQQKYmFDrcITji9tJtx51jC
 iwcatXmzAtwPN2WiNa0G9nCq7OhZXCITkEC5cqnZcDNdQ9wtF5RQbbpF8tcKAgzDBnu5
 QOqQ==
X-Gm-Message-State: AOAM532VhLiMsKxi7az3Kzww6Qiq2w6ReAgYfgUnhRPPSeFG7QWGgLRE
 gC9lIgtYJzCDlvnayJ38skBVDKm31y9AiKUYjz4=
X-Google-Smtp-Source: ABdhPJxaqD6iLUK7oN18ismHWnS+wN5LDYUpPu6kfPNxTL9+T0VoE/IqpdnTG+Nc8XgAtZvT3BpB6IhtsXLxXXkfxco=
X-Received: by 2002:aca:a9d0:: with SMTP id s199mr3600343oie.47.1625227240500; 
 Fri, 02 Jul 2021 05:00:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210623073549.24170-1-moudy.ho@mediatek.com>
In-Reply-To: <20210623073549.24170-1-moudy.ho@mediatek.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Fri, 2 Jul 2021 14:00:28 +0200
Message-ID: <CAFqH_51+wQ=MxOKAfjA7nBspjcqfsRPy0oxg3iripuYJQ3HEmA@mail.gmail.com>
Subject: Re: [RFC PATCH V0 01/10] media: mtk-mdp3: Add Mediatek MDP Driver
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maoguang Meng <maoguang.meng@mediatek.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>,
 daoyuan huang <daoyuan.huang@mediatek.com>, 
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Rob Landley <rob@landley.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, tfiga@chromium.org, drinkcat@chromium.org, 
 acourbot@chromium.org, pihsun@chromium.org, menghui.lin@mediatek.com, 
 sj.huang@mediatek.com, ben.lok@mediatek.com, randy.wu@mediatek.com, 
 srv_heupstream@mediatek.com, frederic.chen@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_050053_349843_77290FCC 
X-CRM114-Status: GOOD (  19.98  )
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

Hi Mody Ho,

Thank you for your patch. Some comments below.

Missatge de Moudy Ho <moudy.ho@mediatek.com> del dia dc., 23 de juny
2021 a les 9:36:
>
> From: mtk18742 <moudy.ho@mediatek.com>
>

Please fix your git configuration, I assume this should be something
like Moudy Ho <moudy.ho@mediatek.com>. Note that the author and the
Signed-off must match.

> Add MDP driver for MT8183
>

In general please use a more verbose commit messages, you know what
MDP means (I probably also know, but not everyone knows what MDP
means) It is a good practice to when you introduce a new driver to
explain well what is and for what is used.

The first question that I have here is why current MDP driver (that
supports other Mediatek chips like the MT8173) can't be extended to
support MT8183. How different is this MDP driver and why can't share
the code.

This single patch is huge, and is unlikely that anyone spend time
reviewing it just for that. I'd recommend to split it and introduce
step-by-step, functionality by functionally. I also have the
impression that you're just reimplementing things that are actually
upstream or not taking advantage of what is already upstream. i.e the
access to the mmsys registers. Please use current kernel
drivers/interfaces API instead of reimplementing it.

I'd strongly recommend to look at current Mediatek mdp driver and see
if you can add support for MT8183 there, and if not, looks at it as
reference.

Best regards,
  Enric


> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  drivers/media/platform/Kconfig                |   17 +
>  drivers/media/platform/Makefile               |    2 +
>  drivers/media/platform/mtk-mdp3/Makefile      |    9 +
>  drivers/media/platform/mtk-mdp3/isp_reg.h     |   37 +
>  .../media/platform/mtk-mdp3/mdp-platform.h    |   58 +
>  .../media/platform/mtk-mdp3/mdp_reg_ccorr.h   |   75 +
>  .../media/platform/mtk-mdp3/mdp_reg_rdma.h    |  206 +++
>  drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h |  109 ++
>  .../media/platform/mtk-mdp3/mdp_reg_wdma.h    |  125 ++
>  .../media/platform/mtk-mdp3/mdp_reg_wrot.h    |  115 ++
>  .../media/platform/mtk-mdp3/mmsys_config.h    |  188 +++
>  drivers/media/platform/mtk-mdp3/mmsys_mutex.h |   35 +
>  .../media/platform/mtk-mdp3/mmsys_reg_base.h  |   38 +
>  drivers/media/platform/mtk-mdp3/mtk-img-ipi.h |  282 ++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   |  521 +++++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.h   |   54 +
>  .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 1329 +++++++++++++++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   |  155 ++
>  .../media/platform/mtk-mdp3/mtk-mdp3-core.c   |  282 ++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |   86 ++
>  .../media/platform/mtk-mdp3/mtk-mdp3-debug.c  |  973 ++++++++++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-debug.h  |   39 +
>  .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |  804 ++++++++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-m2m.h    |   42 +
>  .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   |  748 ++++++++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |  373 +++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-vpu.c    |  313 ++++
>  .../media/platform/mtk-mdp3/mtk-mdp3-vpu.h    |   79 +
>  28 files changed, 7094 insertions(+)
>  create mode 100644 drivers/media/platform/mtk-mdp3/Makefile
>  create mode 100644 drivers/media/platform/mtk-mdp3/isp_reg.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp-platform.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_ccorr.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_rdma.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_wdma.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_wrot.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mmsys_config.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mmsys_mutex.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mmsys_reg_base.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-img-ipi.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-debug.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-debug.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.h

 [snip]

> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
