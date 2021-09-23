Return-Path: <SRS0=soVQ=ON=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E2AC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Sep 2021 18:50:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D474261029
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Sep 2021 18:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D474261029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XufD6JMquW1/Cn3KBO45H4vhq47XCtCq8yUXV3FLOAY=; b=JlFAd6GvVO7/Mz
	mmnmRLoLYNuKHth3KeL3tsb8Y2/QXF+nwGc19Bm/kOo/SywA6MMJzJDh+rgDlp3YlxeinSsJsKLFq
	j/1QXy0Ah1WqvJhNGp5tEF+458A1Yfjio+9gmzY/RjZFVbWdkXaXUIy4XbsmkO2Zfh+HnK0lGyfsO
	uBd6NpeoYZ5mxFzLqgKYyI5A/9zwiYcPshxpkkZ58vAl5kEI6eCGhVxs3mPsPY9cTrDViQThnu00O
	Un0Gl+ySaIOA6GLOVqF6w+V9P4VuVfNNMO4yfwOtBpkA1jIMW9P+2tlhtzFzkCCyz2mwQGs4nN29x
	q5esDiPpBgYWI9BB/BzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTTnm-00COaN-Ta; Thu, 23 Sep 2021 18:50:34 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTTne-00COYj-S7
 for linux-mediatek@lists.infradead.org; Thu, 23 Sep 2021 18:50:28 +0000
Received: by mail-lf1-x12d.google.com with SMTP id e15so29941439lfr.10
 for <linux-mediatek@lists.infradead.org>; Thu, 23 Sep 2021 11:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9CBqcEeaNCIzEJmTkQKL3nnjymx6WgZloiotm1WXO5Q=;
 b=FZGhrTospEri7qgpD9SosYC6mllXRRt1rSBWvIvR7N6iRArrjJ4He4QebBVd+cajfD
 75fqVz58YQWNarvpFpkkshoUQ62pc/Xe8n6xbmSQJF9zUVNOeKhStA+uKX2UcVm7EVDX
 Oy2VDS9I5ojFOcoejlAFsjwE2gYhurBMeUudMpVhx8DYuubujSTOjpaah5SevSeFR9fd
 bJJulkeZTBrwxYSgMoUp91EPJgOSmZmRGChxEzA3RrYPVyj2xVvHy4uAlTZ+3HyF/FLQ
 DewTEnSJEiN4q72dr569yuFVpZzyGZvKSBiRcBIGcho9zS2k+bcHL8F0ipPMf7u9VYmx
 kEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9CBqcEeaNCIzEJmTkQKL3nnjymx6WgZloiotm1WXO5Q=;
 b=ZWPuAJWgAo8HJ211ETvIqMykPxtWiik86FDwUnPuGKbUSh4oYDxWXs0e63RqjRBt7z
 7YM5sxPcGgua3X3/AW0iXS/tGIwooqbn6W6FuhukFDBD2apHo6j5uA9mCAUAwQfGcSau
 lt3KV6TFjdcXPtEy6NhoODz2o2sjT3s7a4rLK4Sgo3iB6THAWOYV1nYo7uVhUfU+kLX0
 +urq8Da6KMbXFERbjlJauVD0xJz2aFVuBdGGgO0+3a0PLDVVsXx/8aKTlq9TH6VJX0Og
 ++cggIxrlHKJXWSAl6/BBVx4yInePWCnHfXeuGHJ9a7XDaauPijSfj4YCcutl5ecWIvV
 cKUA==
X-Gm-Message-State: AOAM531cRPhJgwPC2NP2756KvdXOcbwkH5tUY+JTWdJmuwddvIqEiIr+
 V3Ov7sh5DEk3mhnacg05zLagsERES+twWOR4D/8SWw==
X-Google-Smtp-Source: ABdhPJy/jBdtZppzF1VrwwZlD+f66NRxMptTHpqaUXWgpxUCUuKpfe5ziBVMZ1OUWRIIDczx8iHpuWgdHYKaXL61ooA=
X-Received: by 2002:a05:6512:1515:: with SMTP id
 bq21mr5554685lfb.71.1632423025387; 
 Thu, 23 Sep 2021 11:50:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210917124803.22871-1-wenbin.mei@mediatek.com>
In-Reply-To: <20210917124803.22871-1-wenbin.mei@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 23 Sep 2021 20:49:49 +0200
Message-ID: <CAPDyKFrtrY4qDU7nxynXuvyw32zkHcwMkmJJjftj7EzMcsD9Lg@mail.gmail.com>
Subject: Re: [RESEND v4 0/3] mmc: mediatek: Add HS400 online tuning support
To: Wenbin Mei <wenbin.mei@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>, Avri Altman <avri.altman@wdc.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Yue Hu <huyue2@yulong.com>, Bean Huo <beanhuo@micron.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, linux-mmc <linux-mmc@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_115026_951789_3CF9E384 
X-CRM114-Status: GOOD (  16.26  )
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

On Fri, 17 Sept 2021 at 14:48, Wenbin Mei <wenbin.mei@mediatek.com> wrote:
>
> Change in v4:
> - split driver patch into a core patch and a mtk-sd patch
> - use mmc_get_ext_csd function
> - move mmc_get_ext_csd() to include/linux/mmc/host.h
> - modify some commit message.
>
> Change in v3:
> - add detail descripthion for hs400 dly3
>
> Change in v2:
> - remove the check "mmc_can_ext_csd"
> - change the hs400 tuning condition for "msdc_cmd_done" function and
> "msdc_cmd_next" function
> - use "-EIO" instead of "-ERANGE"
>
> Wenbin Mei (3):
>   dt-bindings: mmc: mtk-sd: add hs400 dly3 setting
>   mmc: core: add tuning support for HS400 mode
>   mmc: mediatek: Add HS400 online tuning support
>
>  .../devicetree/bindings/mmc/mtk-sd.yaml       | 12 +++
>  drivers/mmc/core/mmc.c                        |  8 ++
>  drivers/mmc/core/mmc_ops.h                    |  1 -
>  drivers/mmc/host/mtk-sd.c                     | 79 ++++++++++++++++++-
>  include/linux/mmc/host.h                      |  4 +
>  5 files changed, 101 insertions(+), 3 deletions(-)
>
> --
> 2.25.1
>

Applied for next, thanks!

Kind regards
Uffe

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
