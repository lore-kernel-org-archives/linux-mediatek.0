Return-Path: <SRS0=VpQz=L2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3941CC11F68
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 10:34:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0644F6141C
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 10:34:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0644F6141C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KpJcxr1hqLyb9mgJSVy7s4KddZI/js8NJqxSf7iqqMo=; b=zCs+u+JZ0XJ4BR
	8/eCmh1yvjfl4bWD7DNfnbm+XwCEqGOyne+nXcgJmymb/ZF2AJIe+ITfGRKOEdfSrGzL1KjTuHprj
	GVri1dlXX/o/sKfZcbJoh9/sBEkJR3SesoSZqbs/DEzzAZ/gwKQhbhOcxtfP6SNPH0JkQ97X75+Po
	QCtKv+/B2r9xzB8lsowg0MFB5btK7RGUoq8Rs46TI98s7Mj677QHC6sgn0o40hmclDTOsBiWOomc9
	KZUmVk86MszM6btE1hp+1ESAyI4hZXutBH7EflB2sA8vy+Zt7l0QG0u5uQkWJ84h4N4nsAxxsGzx7
	SWPICbrDcoEZymQdZSoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzGUz-002nAa-KF; Fri, 02 Jul 2021 10:34:17 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzGUx-002n9V-8L
 for linux-mediatek@lists.infradead.org; Fri, 02 Jul 2021 10:34:16 +0000
Received: by mail-il1-x132.google.com with SMTP id o10so9278485ils.6
 for <linux-mediatek@lists.infradead.org>; Fri, 02 Jul 2021 03:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s3EPRF1pEN1wQqk7o7Umd29HQktIGf0pO66kMZbdGeo=;
 b=n7GF7qwgngIJQ+Wly8+ZE8j4351YUt1QljTVtcvz7EjxYgdErZmqS1MMFrLeuxSHIb
 7R6FgTwhdUfQv8hLKYXmgU9cXXGruseoDTatriaJ4JjPXgy6OL/Y9k56gfWeMflcDHEr
 Ot4+wO8yuLGwDUY2tbuL23zF1sy3Yqly5smB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s3EPRF1pEN1wQqk7o7Umd29HQktIGf0pO66kMZbdGeo=;
 b=kkSgo1SJvCQI8JsHblmuBU/sW/cebXXAObmZfYHUnrtvPy8d+8w2hxgkeevWchhPsf
 w0bdwdvrE75fh8ZwYWyBAZTc2pZhGAfGumihnaib1x9TEe85Opa/JpvGE7+HJhlMjJ0V
 J/DzD9+e+ayx0l4yr/7AftHkfxJT4YgogsQimwH3JcMzAxO+LGnq/ZRdVhy5Wmop1LbG
 5reM4R1dMSqsKapUerxL1WZ1bf90lPcP/1413kTiyvMMUVrWQ5zA46PEedXY5VlG1zfK
 7UuhicCsQNua3ON8/qcXZp7Tm7jmuspgaq/WyAjH/0O6Iuq/HKWr06RpYh3k6T3yc1Ni
 HTpQ==
X-Gm-Message-State: AOAM5336n/MOUlDtskaPGJoiyfdxTCymj4y7SlmVhnOupONxK8SOH3TV
 Jv/Va363oGqJsjXJqFlyA/sCvsB+lYBMFcpiTsZKEQ==
X-Google-Smtp-Source: ABdhPJzxVN9HaXoMeRol98y3X1xzmiqrkgjuq/VatFVk0MZX+R5NP0ktmPrhdGsERlJXh8YVKe8mmCZXs/n8qMfGnCk=
X-Received: by 2002:a92:7b07:: with SMTP id w7mr896465ilc.308.1625222053373;
 Fri, 02 Jul 2021 03:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210504054612.3585017-1-hsinyi@chromium.org>
 <20210504054612.3585017-2-hsinyi@chromium.org>
 <20210506203124.GA753747@robh.at.kernel.org>
 <a573e490-44bd-d6a1-d0c0-075b6541f720@gmail.com>
 <CAJe_Zhcz3yPcyxHMtAYTY+wKAzWxt2LJsj-AU7QFneW8MTv1HQ@mail.gmail.com>
In-Reply-To: <CAJe_Zhcz3yPcyxHMtAYTY+wKAzWxt2LJsj-AU7QFneW8MTv1HQ@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 2 Jul 2021 18:33:47 +0800
Message-ID: <CAJMQK-jMWQErHS+5Uutre4yXzae_5=RySrFo4gsyuxei-_zPMQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: mediatek: Add optional mediatek,
 gce-events property
To: Jassi Brar <jaswinder.singh@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Devicetree List <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_033415_366478_04F7217D 
X-CRM114-Status: GOOD (  18.16  )
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

On Fri, May 14, 2021 at 11:25 AM Jassi Brar <jaswinder.singh@linaro.org> wrote:
>
> On Wed, 12 May 2021 at 10:55, Matthias Brugger <matthias.bgg@gmail.com> wrote:
> >
> > Hi Jassi,
> >
> > On 06/05/2021 22:31, Rob Herring wrote:
> > > On Tue, 04 May 2021 13:46:12 +0800, Hsin-Yi Wang wrote:
> > >> This property is used by gce clients.
> > >>
> > >> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > >> ---
> > >> v2->v3: move definition to Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> > >> ---
> > >>  .../devicetree/bindings/mailbox/mtk-gce.txt       | 15 +++++++++++++++
> > >>  1 file changed, 15 insertions(+)
> > >>
> > >
> > > Acked-by: Rob Herring <robh@kernel.org>
> > >
> >
> > Will you take this through your branch, or do you prefer me taking it through mine?
> >
> I see I was not CC'ed on the patch. So I can't.

Hi Jassi,

A resend version is cc'ed to you, thanks.
https://patchwork.kernel.org/project/linux-mediatek/patch/20210622030741.2120393-2-hsinyi@chromium.org/



>
> -j

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
