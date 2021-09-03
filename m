Return-Path: <SRS0=h4nU=NZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D693C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 04:10:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2A7361058
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 04:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F2A7361058
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1X/drakGn0N3zm9JQQPn4nSP1KqZlZjefGho2/2sQ9s=; b=LBsxxUcm6BRyhV
	BPzn9LcT0UJbDY2S4OjnrJoCg4WCPQFjhzYsq3arl1aa1tQ9FzVh2V23iaanKeNR9l+Jr46DbtKb/
	p8hvi8pQtpZXxaydarRJmG69bebrVk2QEzqWdMq9xCSkKtqBkwG5RjY55EPwzyT/jhyfs0pl6LcXk
	50mq8NevQuCMazqg0Zo4ZnlrhdTU6HV3YrXFg7J6O73HP0dZZHkzWM6t6lHPV1Jb92pubEd9vKoDe
	cEds8FobWTbrE9fNHtdJI7zgnsRq2Wsuo+xaDyz4zvk73smrM6tiav1Tphi63I8XtcWxxIidgtC4i
	COubYoNba7WRa0RLbzUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mM0Wg-00Aw89-7X; Fri, 03 Sep 2021 04:10:02 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mM0WR-00Aw4f-TV
 for linux-mediatek@lists.infradead.org; Fri, 03 Sep 2021 04:09:49 +0000
Received: by mail-lj1-x230.google.com with SMTP id l18so7503772lji.12
 for <linux-mediatek@lists.infradead.org>; Thu, 02 Sep 2021 21:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=joW/G6DY+txuyPmVNEIlO2p6pd362DkeC8kCVshvDTc=;
 b=ZIbvv2MoZCfOXe6LWEUxhC8fScArp+zt/1ot3m7EM6GACqj9dlCM7f5i4DhEqn8uYH
 d74b3ix3sflk7mxX6JPQVLBF7rgk4eCJy+wgpyUBhPBMnDB49i8UHC6Gxp//bkLuZ6OW
 8hfk1vHOiK1XmbwACEuRIqpduzex9euGg7Wkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=joW/G6DY+txuyPmVNEIlO2p6pd362DkeC8kCVshvDTc=;
 b=jSDbZjISRZrCCoohrTKK3pDewyNo+9FP7Um5PuCQ96huv9TSIsS6uwsVAVsNfodvyV
 R1HgjlwR9e35UXFzfbJ5ooSnoOcfuIHKqQ+X4jWio6oU1GQRbFMlrj3zrbkRd8W0AENp
 8WIkDu+3hd6iXvyDSbVJpOf4xzR6Gt220d4qWstp7lkJN3ySWVISa4lwGiAUDLJ8kfLB
 BI0xV6pAM9ZMutwyeFDPVJZZsC6AuTnLZEfvZ0Kz180qkHJEzFdSRS0i8hayhyyUlFT3
 BA1ki2FoICG8Mc9brywnMjYxlwsCByPW/t3quWlH5h3S+Sd4LsmgEZCp5T+J7HqFbvkC
 4rxQ==
X-Gm-Message-State: AOAM531qsct5qyT/JFvTdxonvmUfRAGb7WuRx2ULOzVGp05X79XGyhkS
 W84avBXjTqqQZzxSw6h5U21Y0mos96BHTGa/SPT4iw==
X-Google-Smtp-Source: ABdhPJx4XKG0lvFDetGV90273eSD7bOwt7ysolxtpaJkRUK9uLWj4p8fL3g2ooVhI35FhJ7mJLx4mBVrJkVVhWz8scM=
X-Received: by 2002:a2e:b16a:: with SMTP id a10mr1352765ljm.18.1630642185751; 
 Thu, 02 Sep 2021 21:09:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
 <CAAEAJfDOt_GyDPojcj5P6Wou9HC2GC8YzRt2wYyqdrCOjfeOog@mail.gmail.com>
In-Reply-To: <CAAEAJfDOt_GyDPojcj5P6Wou9HC2GC8YzRt2wYyqdrCOjfeOog@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Sep 2021 12:09:34 +0800
Message-ID: <CAGXv+5Fr1gdeGFQnjjZ0JHf4sVanPb9QFqdYnrnmZ-ff8TrrdA@mail.gmail.com>
Subject: Re: [PATCH v6, 00/15] Using component framework to support multi
 hardware decode
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, 
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Irui Wang <irui.wang@mediatek.com>, 
 linux-media <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 srv_heupstream <srv_heupstream@mediatek.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_210948_039132_01D1D2FA 
X-CRM114-Status: GOOD (  35.92  )
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

On Fri, Sep 3, 2021 at 12:31 AM Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
>
> On Wed, 1 Sept 2021 at 05:32, Yunfei Dong <yunfei.dong@mediatek.com> wrote:
> >
> > This series adds support for multi hardware decode into mtk-vcodec, by first
> > adding component framework to manage each hardware information: interrupt,
> > clock, register bases and power. Secondly add core thread to deal with core
> > hardware message, at the same time, add msg queue for different hardware
> > share messages. Lastly, the architecture of different specs are not the same,
> > using specs type to separate them.
> >
> > This series has been tested with both MT8183 and MT8173. Decoding was working
> > for both chips.
> >
> > Patches 1~3 rewrite get register bases and power on/off interface.
> >
> > Patch 4 add component framework to support multi hardware.
> >
> > Patch 5 separate video encoder and decoder document
> >
> > Patches 6-15 add interfaces to support core hardware.
> > ----
> > This patch dependents on : "media: mtk-vcodec: support for MT8183 decoder"[1] and
> > "Mediatek MT8192 clock support"[2].
> >
> > 1: Multi hardware decode is based on stateless decoder, MT8183 is the first time
> > to add stateless decoder. Otherwise it will cause conflict. This patch will be
> > accepted in 5.15[1].
> >
> > 2: The definition of decoder clocks are in mt8192-clk.h, this patch already in clk tree[2].
> >
> > [1]https://patchwork.linuxtv.org/project/linux-media/list/?series=5826
> > [2]https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?h=clk-next&id=f35f1a23e0e12e3173e9e9dedbc150d139027189
> > ----
> > Changes compared with v5:
> > -Add decoder hardware block diagram for patch 13/15
> >
>
>
> The discussion on v5 was still on-going, so sending this v6
> is not helpful. The context for v5's discussion is now harder to find.
>
> Please avoid sending a new version without properly
> discussing all the feedback, and without reaching consensus.
> This is very important, please keep it in mind.
>
> Specifically, the feedback on v5 was NAK, with the request to avoid
> using any async framework, and instead try to find a simpler solution.
>
> For instance, you can model things with a bus-like pattern,
> which ties all the devices together, under a parent node.
> This pattern is common in the kernel, the parent
> node can use of_platform_populate or similar
> (git grep of_platform_populate, you will see plenty of examples).
>
> You will still have to do some work to have the proper
> regs resources, but this is doable. Each child is a device,
> so it can have its own resources (clocks, interrupts, iommus).

AFAIK of_platform_populate doesn't guarantee the drivers actually
probed (modules loaded late, missing modules, deferred probe, etc.),
only that the devices are created, so you still need some sort of
(async) mechanism to wait for the subdevices to be in operational
state. Most of the examples using of_platform_populate are there
to ensure that the parent device is operational before creating
the sub-devices, not the other way around.


ChenYu


> You don't need any async framework.
>
>     vcodec_dec: vcodec_dec@16000000 {
>         compatible = "mediatek,mt8192-vcodec-dec";
>         reg = <something>;
>         mediatek,scp = <&scp>;
>         iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
>         dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
>
>         vcodec_lat@0x10000 {
>             compatible = "mediatek,mtk-vcodec-lat";
>             reg = <0x10000 0x800>;      /* VDEC_MISC */
>             interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
>             // etc
>         };
>
>         vcodec_core@0x25000 {
>            compatible = "mediatek,mtk-vcodec-core";
>            reg = <0x25000 0x1000>;      /* VDEC_CORE_MISC */
>            interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
>            // etc
>         };
>     };
>
> Thanks,
> Ezequiel
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
