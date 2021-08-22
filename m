Return-Path: <SRS0=dV3g=NN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C45C4338F
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Aug 2021 16:50:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAC0761184
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Aug 2021 16:50:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CAC0761184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6YAsr/d9vLAkuJJstSQp+cBXcXAl0jYHvBe7lIBzzfI=; b=3oYeF8btL3fWN8
	yToFvPP6YkXkwh5hprngKe2IEu3AkF1FTSAiFd146eTaENoGLazqvmbhkafGWhy0QXopOy6UR9z3+
	yrH7nm4pIRU5DCBuWA7D6CY2vdIvcBNCuR0vUS88cnvNcfIkIIDhRRn5QU1LauNRnEpw7IewXLaSi
	463mjG+CtT2dATDZc0FDOd8pvI354EVHPHLmwu/HTXdDz3mRascQg7xLesTyA+ts+x0BeL9x3W+ZX
	8Pfa2t6hP650MMho0w9MgbSCWUw5TS55DTm4YzQ9dpiMGI5ALtGqzlQX+kAOI+SSjmzyh9jdhdx1c
	Ef9KNkSsT5BG+KPESKXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHqgE-00EMgQ-4t; Sun, 22 Aug 2021 16:50:42 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHqg8-00EMeO-Iz
 for linux-mediatek@lists.infradead.org; Sun, 22 Aug 2021 16:50:40 +0000
Received: by mail-ot1-x332.google.com with SMTP id
 i8-20020a056830402800b0051afc3e373aso18217014ots.5
 for <linux-mediatek@lists.infradead.org>; Sun, 22 Aug 2021 09:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dtfidEe/qjxfHjRkhW97hyLbAhf+ZJVGWplTJWO3Pbs=;
 b=KUQ1Wd1A9uHMPtRYx40LKABn7voa02Y4leoq1TyTTpx+BBE1w/r1SsSTOIUgCT4xfr
 oGJeHu5D3NKbu0d+8lZPwpu82/jyg8bA5oOOPJc+3h3eqD/tm+u+bfsB0MVHDBtL1LXy
 QLAGHfOtjkqC9xyeHfDXqtqW8CfEM4VOleO7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dtfidEe/qjxfHjRkhW97hyLbAhf+ZJVGWplTJWO3Pbs=;
 b=IyoH17XOwWf4137MkcgzHMPCjZxqPEl+CHotw1Vzi//CGY/bWV3LPdDHj7AS4f9gVQ
 OzurwhA1f1WJ/in4E8qT6SzCZDif9tTSz66SkCjymYcbPh9X2j7Aggw2PvzyF1i9jAvn
 JxMSkDs23ApvQlaoDTYV1kNDk0o9Ken+iEKgJ2S2N3bE7TKRu2OtQOsuKG7ZkoUcA54z
 mi/fSMdWI5ezj9zOvnjicK5JWmY7ksvQ0mQ5aSb6vrpes3SeBX+te9eWNFJ+yAd0X04K
 5dqTJzmcLRczdke8xFad3nZZ0/RaI4SEf5bdsQozftIQ7o2cv+WT8z0oHpvnnxjuQiCG
 BpRw==
X-Gm-Message-State: AOAM530+2bYtYzAJyOGzMo+mx/PcOIJcRej2C84eaXQ38UAz40wOiN/n
 jo6jIvL7Q582OUZlsCZ26bNk7IcGAZQoqwuWqJ5Dyg==
X-Google-Smtp-Source: ABdhPJzsqYUkGnoKx6cZL/MZd0xVLARgQAiHA36o4mNFCThs4ItbOa2X5Lm6FYKo4igPkf8VSlPht+LiVtxMvPa5diM=
X-Received: by 2002:a05:6808:1449:: with SMTP id
 x9mr9094210oiv.14.1629651034674; 
 Sun, 22 Aug 2021 09:50:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210811025801.21597-1-yunfei.dong@mediatek.com>
 <CAAEAJfDWOzCJxZFNtxeT7Cvr2pWbYrfz-YnA81sVNs-rM=8n4Q@mail.gmail.com>
In-Reply-To: <CAAEAJfDWOzCJxZFNtxeT7Cvr2pWbYrfz-YnA81sVNs-rM=8n4Q@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Sun, 22 Aug 2021 18:50:23 +0200
Message-ID: <CAKMK7uFW3Z=Up=OCJO4dNR9ffaTdFjHwoND9CrUw6LHmQ4t_AQ@mail.gmail.com>
Subject: Re: [PATCH v5, 00/15] Using component framework to support multi
 hardware decode
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Fritz Koenig <frkoenig@chromium.org>, Irui Wang <irui.wang@mediatek.com>, 
 linux-media <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 srv_heupstream <srv_heupstream@mediatek.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 George Sun <george.sun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210822_095036_670170_591FC345 
X-CRM114-Status: GOOD (  24.30  )
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

On Wed, Aug 18, 2021 at 4:12 PM Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
>
> +danvet
>
> Hi,
>
> On Tue, 10 Aug 2021 at 23:58, Yunfei Dong <yunfei.dong@mediatek.com> wrote:
> >
> > This series adds support for multi hardware decode into mtk-vcodec, by first
> > adding component framework to manage each hardware information: interrupt,
> > clock, register bases and power. Secondly add core thread to deal with core
> > hardware message, at the same time, add msg queue for different hardware
> > share messages. Lastly, the architecture of different specs are not the same,
> > using specs type to separate them.
> >
>
> I don't think it's a good idea to introduce the component API in the
> media subsystem. It doesn't seem to be maintained, IRC there's not even
> a maintainer for it, and it has some issues that were never addressed.

Defacto dri-devel folks are maintainer component.c, but also I'm not
aware of anything missing there?

There has been discussions that in various drm subsystems like
drm_bridge or drm_panel a few things are missing, which prevent
drivers from moving _away_ from component.c to the more specific
solutions for panel/bridges. But nothing that's preventing them from
using component.c itself.

I'm happy to merge a MAINTAINERS patch to clarify the situation if
that's needed.
-Daniel

> It would be really important to avoid it. Is it really needed in the
> first place?
>
> Thanks,
> Ezequiel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
