Return-Path: <SRS0=Kazo=DH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E00C3C4727C
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 16:34:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 677062072E
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 16:34:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OpfkvxPt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TO8SqM/Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 677062072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7RgYm5KaouuGxPlguwnon1VLXS4JlpXoc9gHC7yfqf8=; b=OpfkvxPtl5laF6CSRT1y9BW3e
	h4V9N3+ATkQtipZbaSFP9EORSa7kqYdrJrZG4uvW35FnjvntKrTUM6uRQWYagV8MpBiCRzcap4Yx0
	nlS2G4uqz3cAieuPdfZPdKliwGSVyLF0NbgqlKNsF6psxQy6McGQgQ+xc4yviiUH0E0A/OrqyhJPH
	KPRFAe56l385rGU1BAutRZrLZlo9/odR/mpY4C23RxPXe48yWMXBdRn0jcwa4jwutfg/sl/PIXrjX
	kt7AWBkLXCWZZljOvOPU7OwIIBd+9sSoZb8aL0rw5OWKsmzxN8rqxJG+KANoCrVoT2NQxDXJ4EyLw
	CPFHXX1xQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNf3H-0007bT-Uu; Wed, 30 Sep 2020 16:33:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNf3D-0007aM-34; Wed, 30 Sep 2020 16:33:55 +0000
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3EC962072E;
 Wed, 30 Sep 2020 16:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601483633;
 bh=1O4lOqfyVB4oTb4crlwIc0lAP0SUUw2QidU8mzgA6Xw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TO8SqM/ZFmVTJLnCSlBppXbSIh9FIrsJ9XgLZstk7U9AvTy3zxi4LgiUe2rxc6gxT
 7QMpdjpMM6inMlenW85XE3Xdo0uJaVLwuPoo54Nv053Pc+2qdo7dqUEU96q6ND3V1A
 kinSJ4UzVFWvs6B6a+RrbPokLvdIHNwmefMYHqEw=
Received: by mail-il1-f174.google.com with SMTP id y2so2357613ila.0;
 Wed, 30 Sep 2020 09:33:53 -0700 (PDT)
X-Gm-Message-State: AOAM533aPZTZp7B9w9ERvzuO2MAaO47YNfmSOnAbvjymekJ/4u799DYu
 7tR6lbGrmxZNRxSymp+bc1172P0KylnovIxj1Ns=
X-Google-Smtp-Source: ABdhPJxXM2Kr0C/YtBqYVYU1FPUtTxS5zLOfFi5/zR5/xuZTLomxJNlDGyhFBdcKLMwwtM+l7Fs8uZnNR9LuUdTsFF0=
X-Received: by 2002:a92:d842:: with SMTP id h2mr3008966ilq.176.1601483632564; 
 Wed, 30 Sep 2020 09:33:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200821075452.1543610-1-enric.balletbo@collabora.com>
 <99821f85-9a38-7591-f982-872603b6ce8a@collabora.com>
 <CAGp9Lzq-15xjvSVaEJ=2o18o-8ESGWsHf-LNAXXwKfxu4V-0NQ@mail.gmail.com>
 <CACRpkdYPoZX1+rfJb925_+H6YXiwO26cKLpZae=_j=RQKGA0Wg@mail.gmail.com>
In-Reply-To: <CACRpkdYPoZX1+rfJb925_+H6YXiwO26cKLpZae=_j=RQKGA0Wg@mail.gmail.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Wed, 30 Sep 2020 09:33:41 -0700
X-Gmail-Original-Message-ID: <CAGp9LzqGwvxGF_bhuyGXu1R2516x=twv1j5e0Wx0EQ7GZ4b-yQ@mail.gmail.com>
Message-ID: <CAGp9LzqGwvxGF_bhuyGXu1R2516x=twv1j5e0Wx0EQ7GZ4b-yQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: mediatek: Free eint data on failure
To: Linus Walleij <linus.walleij@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_123355_226268_2A011D08 
X-CRM114-Status: GOOD (  17.66  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 hsinyi@chromium.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Sep 30, 2020 at 1:47 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Sun, Sep 27, 2020 at 7:57 PM Sean Wang <sean.wang@kernel.org> wrote:
>
> > v2 seems the same with v1 or I was missing something.
> >
> > I just thought we call devm_ioremap_release to explicitly to free
> > resource when a certain failure occurs after
> > devm_ioremap_resource?
>
> What is the semantics around mtk_build_eint()?
>

mtk_build_eint is to add external interrupt function to the
corresponding bound pins.
mtk pinctrl driver still can work (than means probe() successfully) to
keep pinctrl functional even with there is an error in mtk_build_eint.
So the patch is used to explicitly free those data on failure in
mtk_build_eint to let unused data is being free:ed immediately.

thanks,
Sean

> If it is called on the probe path no explicit free:ing is
> necessary: anytime probe() exits with an error code,
> any devm* resources will be free:ed.
>
> Yours,
> Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
