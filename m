Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D39C38142
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 15:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mlg45T4/VC+7LmAsgOWK4bw3SsjPwjm5InA1atd5cbM=; b=C38pMn4Tqyf9zKHJKLbKat0TUi
	B9vyIesJ6a/eLwDamDdaoGMogIy6jwgMneKL2lVMJCE2Hwewp+RxbqskEualtsUVpYq6V5RIn4p2G
	+4XHKtTZRuEZwzNPxoyFLkO6nhyr4ncCDQ1e7b7szqU4PfeOI0vljrUdZCsEJJO0wy7EiLk8ofVvO
	+mW1GTxXFrE+VMXtl9jGsUhgXmVC9OmDt2IEmHvHKEXB+frR4xS7HKapCKRDOEzBZyNRwbBP5lMzx
	yVcEc+Zat6UtiM0su30IZ6omJjV2mA0dSrr1qMSjhHBGW9+V2lqUQKvMeYxhU3lYbd0aJyKlVFRC4
	lIlUYRig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLR7X-00FYTt-3V; Fri, 27 Jan 2023 15:58:31 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLR7M-00FYQK-Bq
	for linux-mediatek@lists.infradead.org; Fri, 27 Jan 2023 15:58:21 +0000
Received: by mail-ed1-x529.google.com with SMTP id fi26so5115525edb.7
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Jan 2023 07:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mlg45T4/VC+7LmAsgOWK4bw3SsjPwjm5InA1atd5cbM=;
        b=Lb5onOMPT75+MY3z7ZObqs5E6eGtXjhmibCMQ+TiXHxDJcjGv3MQCb44+itMUg6MrT
         YkmJGmVNLkEfIjjTp+Z7Ew5Xbg0s9VQTl3COKoI/4tuXyHHg+xK9/Cq/FI6iV6nvM7PV
         yPsNLyT0miE6du9DKnP5DnHU+uEJOfYt76j9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mlg45T4/VC+7LmAsgOWK4bw3SsjPwjm5InA1atd5cbM=;
        b=bmOmGrZbO3d8O+HsK5IG3ZxMt58q4cf58o/9a29R6OGlVXblAQ7qapFjnJ+eu8rCUL
         hx8s9OMZBLtkzUGQvDK4E3Xu8VUOV8J3Em8y6YTt0/BwoGCqVnm//2n1ICxMypLn7hw0
         G2EmckjnNiBkF6lBsDrvG73WRWbGMpMsas20sxHx2+PJdUkMvPFKelwp4vmXy9VCq10Z
         y5wEZ+oobVKMiBl5NExw/LlPxB2+cpJ79sbxzmohLTs1lZK3f8lhVcaEwZ2koZJIdflJ
         AqpLyx0urjW4qvfSR9RWT0MY27meU80KVVw4a8Prhl0XspOPS7jjn0rRMMCyO0EM9/tg
         2rcg==
X-Gm-Message-State: AFqh2koRH0Z4DsRzO2VIrLJY4iX2LLdmY9eF3tYH77f83ugFbLZiO51Z
	oypbycFRgsAHiKSVr6jDSRkzMFuy9GKxXN9903o=
X-Google-Smtp-Source: AMrXdXv5r0zEsQViAUV8ZkFZalo1tRAVTVzA1Z74QW07EPfoYZaQY6cDEImckTbZfwvyXdpTonYJFQ==
X-Received: by 2002:a05:6402:25c9:b0:49e:ed53:d64f with SMTP id x9-20020a05640225c900b0049eed53d64fmr29734141edb.9.1674835096338;
        Fri, 27 Jan 2023 07:58:16 -0800 (PST)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id n21-20020a170906089500b0087ba1ed4a58sm1284978eje.191.2023.01.27.07.58.15
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 07:58:15 -0800 (PST)
Received: by mail-wr1-f52.google.com with SMTP id h12so5356976wrv.10
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Jan 2023 07:58:15 -0800 (PST)
X-Received: by 2002:adf:f10b:0:b0:2bd:ef96:3889 with SMTP id
 r11-20020adff10b000000b002bdef963889mr1582683wro.138.1674835095329; Fri, 27
 Jan 2023 07:58:15 -0800 (PST)
MIME-Version: 1.0
References: <20230119224052.2879106-1-robdclark@gmail.com>
In-Reply-To: <20230119224052.2879106-1-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 27 Jan 2023 07:58:02 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XqWzrgss7HAsYJASuJjNr3gBgtM7b3rNU=NtGuVgJ+ew@mail.gmail.com>
Message-ID: <CAD=FV=XqWzrgss7HAsYJASuJjNr3gBgtM7b3rNU=NtGuVgJ+ew@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Remove dependency on GEM DMA helper
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:DRM DRIVERS FOR MEDIATEK" <linux-mediatek@lists.infradead.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_075820_407244_64450C75 
X-CRM114-Status: GOOD (  13.24  )
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

Hi,

On Thu, Jan 19, 2023 at 2:40 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> It appears that the dependency on the DMA helpers was only for
> drm_gem_dma_vm_ops.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/Kconfig       | 1 -
>  drivers/gpu/drm/mediatek/mtk_drm_gem.c | 7 ++++++-
>  2 files changed, 6 insertions(+), 2 deletions(-)

Drive-by comment: can you post a follow-up patch that also removes the
"#include <drm/drm_gem_dma_helper.h>" from "mtk_drm_gem.c", assuming
that still compiles? If it doesn't compile, that might be a bad sign
that we missed something. ;-)

-Doug

