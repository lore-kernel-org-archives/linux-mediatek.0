Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AF5C43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 13:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93Mj4Iau0zpmP/JMwi/VFSHRM8pmBMuEnMbb4W4iqXI=; b=fn1vut6IDAy/s72l1gzc83gDZJ
	0a9ccDQU/XuwoNI7mvcVq5W8JPCUydnZxgLiFLcLuQlJxXH0rNWwwKrdTm2E/y834rEp/LL1lXxpj
	fugbV+Ywo9IHniPQMtvsQG1W4bJKcKqmqYs7jr5Qlyn9UNWBg21VrXcVMYh+rwFa3W3loM81/4LcI
	TXbWil2cG2adeQcmdhjM7ZJ5DleZhTbWg5BOPbKdOcMo/FUJOQ/IbcrJ2aCuyjb/MJ5SkfrJbs3jW
	/x51/fM3zrMkWVFN72IziapSXrD6sC15T1CItU6oiQh5x2ckdUYU1+ftSnLEFvWhc/wY8cnwY0VFi
	bbpnYZ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7GQv-004yvM-7i; Fri, 01 Jul 2022 13:11:41 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7GPc-004yFN-Oe
	for linux-mediatek@lists.infradead.org; Fri, 01 Jul 2022 13:10:28 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id v185so3948266ybe.8
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Jul 2022 06:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=93Mj4Iau0zpmP/JMwi/VFSHRM8pmBMuEnMbb4W4iqXI=;
        b=UUCeOLLSa8JxepsV6kbA1FCpTxZVNNOcRM6cLxnQj7WL62ivtMfBPCez7Gpugi+NdL
         VmxfTuKRVEf4VR4Wc6uhRq6c1ihOtEZ/3LpSNAXvMDWX6p6PoyUu2ZPGap3qBomly4UR
         f5rPFPHk6kFebaxaGoDQHMzC8gVIcG9TkQOLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=93Mj4Iau0zpmP/JMwi/VFSHRM8pmBMuEnMbb4W4iqXI=;
        b=OGssMOUhKT/658hXYLYo/1ktHhMA6w3mk0bpGJMNwzGs4uqHLZohaq4nkyuSe5eUBp
         tMfWqRGc6gTVO42e6TREa+zYeXizwYwS3vuhnHl29eFprsiM9T+FzntryWFNR8quNwc1
         wIr0V7FljRUvQa+nH4Yi356XQYhZNI2H3Tp1jXb4j1DU0uNuulSyeKonOnLiMccAjG08
         Z96Xq0WLDwvyK87qAQ2yIQo9Vb4q0ZAcIU9+8bIMTpIGvAsCbg7hExwRQWHySqE848BP
         gQv/4ANEsjZDC67youJlM842Vy96WWOUaJBbfdX0Hp4UHFRf25IpJJqNaJTSkevakPZR
         NbLA==
X-Gm-Message-State: AJIora/aocBsgVu7IrqjqXaY/W6NdK3o2a4veEU/irG20QbqvlubWH74
	h9GYXTAEsi96T/5lJlrZ9J3q3GBbCrSIk+VXn4MpGA==
X-Google-Smtp-Source: AGRyM1uWKenMTsIZlQbeXynKt3mVEKH67yHcrh73gv2A0rWP5WfpVj+e/Wz0OfAPf2Dh6QAOgEjdx2kaTlA2uoioq8s=
X-Received: by 2002:a25:81c5:0:b0:66d:55b5:d250 with SMTP id
 n5-20020a2581c5000000b0066d55b5d250mr14906967ybm.501.1656681019536; Fri, 01
 Jul 2022 06:10:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220701105237.932332-1-wenst@chromium.org> <e601a375-cc80-40cd-9791-e44e9d37cec0@email.android.com>
In-Reply-To: <e601a375-cc80-40cd-9791-e44e9d37cec0@email.android.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 1 Jul 2022 21:10:08 +0800
Message-ID: <CAGXv+5Hrc6RageAu1YMBCA22r0kz+-C+9qO=qdDEmn_QhSCB3w@mail.gmail.com>
Subject: Re: [PATCH 0/6] media: mediatek-vcodec: Fix capability fields again
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_061020_890236_E2BB0296 
X-CRM114-Status: GOOD (  27.48  )
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

On Fri, Jul 1, 2022 at 8:45 PM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Hi Chen,
>
> Le 1 juill. 2022 06 h 52, Chen-Yu Tsai <wenst@chromium.org> a =C3=A9crit =
:
>
> Hi everyone,
>
> The previous round of changes to the mtk-vcodec driver's returned
> capabilities caused some issues for ChromeOS. In particular, the
> ChromeOS stateless video decoder uses the "Driver Name" field to
> match a video device to its media device. As the field was only
> changed for the video device and not the media device, a match
> could no longer be found.
>
>
> This match is not specified in the spec. If you feel like it should, perh=
aps consider specifying it first. To me it's nice if they match, but it's f=
or now just cosmetic.

Right. Even for cosmetic reasons I think my changes make sense though.
Fixing the matching is another thing.

> Though this requires some discussion, as userland is expected to enumerat=
e the media device and find the video device by walking the topology. This =
is the only specified way to match both.

AFAICT, v4l2-ctl does similar matching, though by bus_info. Maybe it's
out of convenience?

ChenYu

>
>
> While fixing this, I found that the current info used for the fields
> don't make a lot of sense, and tried to fix them in this series.
>
> Patch 1 reverts the driver name field change. It also makes it
> explicit that the field really should match the driver name.
>
> Patch 2 changes the value for the card name, making it a free form
> string that includes the SoC model.
>
> Patch 3 removes setting the bus_info field, instead using the default
> value derived from the underlying |struct device| as set by the V4L2
> core.
>
> Patches 4 through 6 do the same as 1 through 3 respectively, but for
> the encoder side.
>
> This series is based on next-20220701, and was tested on mainline on
> MT8183 Juniper, and on ChromeOS v5.10, on which we have a whole bunch
> of backports pending, on MT8195 Tomato.
>
> Please have a look.
>
>
> Thanks
> ChenYu
>
> Chen-Yu Tsai (6):
>   media: mediatek: vcodec: Revert driver name change in decoder
>     capabilities
>   media: mediatek: vcodec: Use meaningful decoder card name including
>     chip name
>   media: mediatek: vcodec: Use default bus_info for decoder capability
>   media: mediatek: vcodec: Revert driver name change in encoder
>     capabilities
>   media: mediatek: vcodec: Use meaningful encoder card name including
>     chip name
>   media: mediatek: vcodec: Use default bus_info for encoder capability
>
> drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 7 ++++---
> drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h | 1 +
> drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c | 7 ++++---
> 3 files changed, 9 insertions(+), 6 deletions(-)
>
> --
> 2.37.0.rc0.161.g10f37bed90-goog
>
>

