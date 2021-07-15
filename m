Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45255C47E4D
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 03:03:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0167361374
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 03:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0167361374
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dU1dsEzF5WgQSOjQ37OHYJ+UDpNvsLRzoy/aHCH21pE=; b=NXxMerqX9Y25YX
	P2CRGrZlpqV04tfHuFUa/sPZFNG1w2L3y486Pb4ZgB89fRx3DrsBjBcFl92BCAIA5/TeEYVydtdqF
	rn59CXTIxDbnKY8MJVQV1WMTQ6Bg+bl2gXlCcejI/ee3fNJ+RihpohFbZhVDH3YlEi9j36SmItMmg
	vVBfbqH0opHkhmJ2fCT4Vl+uGwKGfwe45uNSyW/F9f7TpSxNJaFWhcLnRRdqeKaJiY4KPJqY7xzJ0
	UktqytD8PjRoWqzNj0YLncgsN4kBH7+YgNljINlp/Hys65Y00NCJQq2SaF2AlMkvH9+e64JwsJ0vv
	R8c6laZcI7wQW+mXfW8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3rey-00GyKk-Cp; Thu, 15 Jul 2021 03:03:36 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3reu-00GyJJ-UF
 for linux-mediatek@lists.infradead.org; Thu, 15 Jul 2021 03:03:35 +0000
Received: by mail-lj1-x22c.google.com with SMTP id s18so6476420ljg.7
 for <linux-mediatek@lists.infradead.org>; Wed, 14 Jul 2021 20:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RYi1IyWrC6TuRygKynXKx82+IBLap68KkX0wmFXBOkI=;
 b=fPgdJBwqBnYQWiYd11LvyqHQtqUg5/9lZMIisCur2LqH+wrbPrb9p+wFI6xx7YdYJS
 Zyodjwg+cvnrnoCDxqgrKvbXFwm0GydR0FqhsRyxPaZB2yy17AJfsKZtvbS5WayU829b
 DjW/QpTuFE35GDQfTVHNZBWp5+5xBCNEPY3XA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RYi1IyWrC6TuRygKynXKx82+IBLap68KkX0wmFXBOkI=;
 b=U3iTyp5Rvo9QRKun5VEssj6ruXW4Ho8KZ0WKXhPRVtobWkV61mpbzUboh1+CUcqpAP
 SkMRT/LWDCEh23KCy1/9EZ0bOPkcwjF85V2AfYAVr7zROwzF41reDg8yjYbqKulpg+Hj
 ovH+0R0MmAjlPD3tt9k3hMg9rnJDYjwIo2YkSOSSZMTPZLuHNbDxnFhnCQQrH31NnGGY
 ETjFEZ4b52INAL6El9eIKq6pByOLdy8SBFsg2M0/GAE0LEBUd8Y8bt88Paure+Z9HcTw
 oOscf52IiY/37/CmrqYLBUUMTnwLwcj5WaLnzdCilTNh+tNMqDIvzFDAd1t+OhBF1Xm3
 T/Kw==
X-Gm-Message-State: AOAM530ubF3XNOdn81vcQBCHD2VOuTYRUk00XOLnKzFJ1345Cp4pPOGb
 GOnu9RQ0V/5/+PNcO+AYzP50VEBBt3+knmlwEwHLwQ==
X-Google-Smtp-Source: ABdhPJzQk7yOOJgOlV+e8lb/HTrDPbR3LKAVSGY0Jd+8uj7pVvf9Q2SmmBlLZPXG7O+C0Le3DWUNEbjtrttH5wZspC0=
X-Received: by 2002:a05:651c:2115:: with SMTP id
 a21mr1224483ljq.185.1626318210041; 
 Wed, 14 Jul 2021 20:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <1626316157-24935-1-git-send-email-kewei.xu@mediatek.com>
In-Reply-To: <1626316157-24935-1-git-send-email-kewei.xu@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 15 Jul 2021 11:03:19 +0800
Message-ID: <CAGXv+5FKvz7zwi1k=TZ3YTJJ+facezqN_oigRFEeR26OrejRnw@mail.gmail.com>
Subject: Re: [PATCH 0/8] Due to changes in hardware design, add patch to
To: Kewei Xu <kewei.xu@mediatek.com>
Cc: wsa@the-dreams.de, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
 linux-mediatek@lists.infradead.org, 
 srv_heupstream <srv_heupstream@mediatek.com>, leilk.liu@mediatek.com,
 qii.wang@mediatek.com, 
 qiangming.xia@mediatek.com, ot_daolong.zhu@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_200333_378638_4E4A0527 
X-CRM114-Status: GOOD (  18.62  )
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

Hi,

On Thu, Jul 15, 2021 at 10:37 AM Kewei Xu <kewei.xu@mediatek.com> wrote:
>
> 1. In order to facilitate the review, the two series of patches submitted
>    before have been integrated together.

I'm not sure that really helps. We'll see.

> 2. Resubmit a patch to fixing the incorrect register value.

Fixes can be submitted separately, or at the very least, put at the very
front of the series.

> 3. Add modify bus speed calculation formula patch

When resubmitting patch series, please add appropriate versioning and
changelogs. This will help maintainers understand that this is a new
version of the series, and what has changed. This includes times when
the original patches weren't changed, but additional patches were added.

Please also keep the original series subject, which IIRC was about adding
support for MT8195 I2C. The subject you now used should be part of the
cover letter.

If you combine different patch series, you should use the highest version
number + 1.


Regards
ChenYu

>
> Kewei Xu (8):
>   dt-bindings: i2c: update bindings for MT8195 SoC
>   i2c: mediatek: Dump i2c/dma register when a timeout occurs
>   i2c: mediatek: fixing the incorrect register offset
>   i2c: mediatek: Reset the handshake signal between i2c and dma
>   i2c: mediatek: Add OFFSET_EXT_CONF setting back
>   dt-bindings: i2c: add attribute default-timing-adjust
>   i2c: mediatek: Isolate speed setting via dts for special devices
>   i2c: mediatek: modify bus speed calculation formula
>
>  .../devicetree/bindings/i2c/i2c-mt65xx.txt         |   3 +
>  drivers/i2c/busses/i2c-mt65xx.c                    | 229 +++++++++++++++++++--
>  2 files changed, 217 insertions(+), 15 deletions(-)
>
> --
> 1.9.1
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
