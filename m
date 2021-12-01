Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6ACC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Dec 2021 23:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1fcpCzSC/thHJHCeocASvScJ2DhtS4oz/jadS7GR978=; b=zps0yQyF71cfss
	qBKIV7gnCrgNKXcSQqiIwXCfWuPwB0b9xWdScFumJW0zj6fEyPnrxq2kL0w/szFSMk7CVRCsY1f5B
	Zm2ZcFfpF4w+XWSilmMESfQX9zNlRVVGAsSQiJLzVT/7MeIhGEb+bSEzszY/ThlzMcSHi3wiCp8t6
	2vV1JSStj7yndPYZ3QeMAaxSyor4jTGW135P396RPAIeF7Ka0MphWthe8/Gb4qoUyhvOrL2aP8l0D
	XZkWIEXLZH28DT1D88qNq5j8OdX36Jgx9FdXaOZNIM0e0ZjUPZGusP2/mQYzZJITAUTAHJPQmA8Nd
	4eJD4Edv2pOw1WG1Yq7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msZUh-00AMN1-7J; Wed, 01 Dec 2021 23:58:35 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msZUT-00AMIm-EG
 for linux-mediatek@lists.infradead.org; Wed, 01 Dec 2021 23:58:22 +0000
Received: by mail-qv1-xf31.google.com with SMTP id gu12so23343509qvb.6
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Dec 2021 15:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RQT5LaKuLpVbjom//RaF2AtN8bjf4gP/+BsDdSre8KU=;
 b=lp4L8B9l+jnHbFKIcbcvNkHjhTK1O6mbofLkPamQb5VBj/MIHd93OExtstUQdeEOqM
 UMQPvKud8dsr3AfHXo6gMpBMwENnXFj/+ikud6r2xfl608m0EjGMEKAeJLoL5VaCPY52
 dUaOIBZ8X7EGC5cw5gsgz1GpdesgTzTFmLImw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RQT5LaKuLpVbjom//RaF2AtN8bjf4gP/+BsDdSre8KU=;
 b=Fsn/H/7oiteq9ObRM3rLKLs6kpE5PgTFuKuac3wM/Nenh0jXAeBL0a9UXN4NhPSLMj
 RTV7zEvYg5ksT3ede6iY+fBZH6ECv7wz54EX/22nvmUTPyPBkTgbIatXNTjMLoQM9SEc
 Y4tGvOlkvT0onvOzFlSKmSV5wdVkBUiWolNJoDAidDcrUPkfN5bCkKkxWhbu2m1ytcOt
 iWu0J8KnBcl/RscQNTC+AeXI6CA99IqGbtPB9JktXFiDK9tAEkp1MdOzpIB75fhImVQA
 gyzpxdm4KNAGk6w/z+kZES1190QxhrONzdZNJ7RYROHloYD4XjdWBFBmX+ltUZ/j9fzu
 egRg==
X-Gm-Message-State: AOAM533g4pi82NvcSSYpPCtRSIeivqCss7hLfB0P2AuNdPSGvoztDY6b
 dEMFTYRuQFxrcYhHp1TpXmUkkWyIBkBlZLBaZpE1LA==
X-Google-Smtp-Source: ABdhPJzlpgZXsoQfRBzDzE58VVCzidR0RvngXil7sYYYYjvo4+YcwcrLBGNoEy/KBUtLRTFiMMMi5pjug9dEP26Q0DQ=
X-Received: by 2002:a05:6214:17cc:: with SMTP id
 cu12mr10393249qvb.66.1638403100004; 
 Wed, 01 Dec 2021 15:58:20 -0800 (PST)
MIME-Version: 1.0
References: <20211129034201.5767-1-yunfei.dong@mediatek.com>
 <20211129034201.5767-6-yunfei.dong@mediatek.com>
 <3fb4e348-295d-9ec4-43b4-0fad06b33010@collabora.com>
In-Reply-To: <3fb4e348-295d-9ec4-43b4-0fad06b33010@collabora.com>
From: Steve Cho <stevecho@chromium.org>
Date: Wed, 1 Dec 2021 15:58:09 -0800
Message-ID: <CAC-pXoOgyTRqYpA9U2ze840moLQ+gTT4EnLq-Pn9H4PHd9ttTg@mail.gmail.com>
Subject: Re: [PATCH v11, 05/19] media: mtk-vcodec: Support MT8192
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, 
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_155821_508386_B9DF9B85 
X-CRM114-Status: UNSURE (   7.19  )
X-CRM114-Notice: Please train this message.
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

Reviewed-by: Steve Cho <stevecho@chromium.org>

On Wed, Dec 1, 2021 at 4:10 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 29/11/21 04:41, Yunfei Dong ha scritto:
> > From: Yunfei Dong <yunfei.dong@mediatek.corp-partner.google.com>
> >
> > Adds MT8192's compatible "mediatek,mt8192-vcodec-dec".
> > Adds MT8192's device private data mtk_lat_sig_core_pdata.
> >
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
