Return-Path: <SRS0=Oval=DI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45FA2C4727C
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 07:58:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E024D2145D
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 07:58:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TPk/Fqcq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="urcHuUAy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E024D2145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Pv4jSX3dwvBaDwxYiMLLzK3bi/jj5mNdeylDKfrSCck=; b=TPk/FqcqtLj9iTNausfaKKHrO
	Z6+pkwLsoBemzkuOza9oaQFoRXkA/m5kFCI/jNDPMpavRNi88wIacX1ioS7RTuvda3DyfvHNspw/2
	rCuIqzjC27QQmsz6TXLXqrfJJkpG95QXNwVyDGqEn5u+b2KB70qf+EdpNkCgSwgcl3vAToO2bJJVy
	ECqLD97QmlNZkDFfXXRJTsAKX/NQjL3FrdClaFT3yq41QNjb6IXqOK5cv7KvhBtePGTqtX9b4BiLi
	vtWXqCSVIaCWloWnNvJpqO3nabmjhCgCb5ooVhAeI6cJUV6AwhPa3A94aw1iSsAabPkyRyMFX5/vf
	ElPlVqSUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNtU0-0005cS-Vx; Thu, 01 Oct 2020 07:58:33 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNtTv-0005Zl-Jq
 for linux-mediatek@lists.infradead.org; Thu, 01 Oct 2020 07:58:28 +0000
Received: by mail-lj1-x244.google.com with SMTP id k25so3823451ljg.9
 for <linux-mediatek@lists.infradead.org>; Thu, 01 Oct 2020 00:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I2RxhvY5NgmVXMLybhimHhtN1TXECVn5tQhd+CCxH3U=;
 b=urcHuUAyChlfg7tAIApcPZY1ihayP5HbBNn8FxBa1EbAIPwKxXi1CpulUJCx0v0fcC
 A6+zt2FWl1dwju9no8JrahYciPOnxelk9+PK4PZbJw5WxwWzYqYo27uO/IwGmDttgwBr
 kC9jRWEkmvN5VbSJN09VG+fYBrVAVb+3qW6fcXRZIWG8l2XQZBwEPjpKpnbw9eB7V6wW
 A2eg5WV6cxo6JaAdZrfF5/4S2/SU76V28aYVZtlLBTTnLu+Gsb0okQwMFIRdZByV7ld4
 HYhVNA1te63uYSpQzKSmRBFq9QH1ksYnbgE6Oghf4tLgTDElmmpCPxZ0XRT+8EB6hg+Q
 62Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I2RxhvY5NgmVXMLybhimHhtN1TXECVn5tQhd+CCxH3U=;
 b=XQpt6t+uH8fR8cRm/y9GTng54SbW0Dh7ZQUomXbbPN1pXZ1J+1XyzvSTQEm5ugkC7m
 QZU/ZObnG1f0rLTPgmzGubPm3pr2bZ986DT227HbH4xszKSiXOJr4SADqNpegcBvghkc
 wiHr1Ls78i+5uyj+Nfcq6SZypkz7X/p2aEjtFwXMv8DrazcqECUG/gDXNyOtoxUbY/nB
 k3cZgei5ivsq/6saeF1P5TC8GB9NZ+ma004h3rwntBVukB/98BDwEtgEGovaMInRtenP
 dEQqLR11CgN4pDM6f5plnfUS7r1ifmZu4WV3VJ0/2ytLzeFKMOoJ+iJuC8od8VgbmKB0
 gI+Q==
X-Gm-Message-State: AOAM5310td5i61fEZOn881yVq89zuj1aStPXhINueQOKqdFOG2kIUAu7
 q8LVnIfKDBz7GaHeOnZNrn3DbGUNUEttnr8wVZfREw==
X-Google-Smtp-Source: ABdhPJxjRqz2yUHvCNFY6FBrV0pvSdM24cdpdLikgyWwKGbflyn3GYJWUChczn+03SJSBKMtngr1He4kzybB8WtYKfc=
X-Received: by 2002:a2e:a306:: with SMTP id l6mr2100470lje.286.1601539105709; 
 Thu, 01 Oct 2020 00:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200821075452.1543610-1-enric.balletbo@collabora.com>
 <99821f85-9a38-7591-f982-872603b6ce8a@collabora.com>
 <CAGp9Lzq-15xjvSVaEJ=2o18o-8ESGWsHf-LNAXXwKfxu4V-0NQ@mail.gmail.com>
 <CACRpkdYPoZX1+rfJb925_+H6YXiwO26cKLpZae=_j=RQKGA0Wg@mail.gmail.com>
 <CAGp9LzqGwvxGF_bhuyGXu1R2516x=twv1j5e0Wx0EQ7GZ4b-yQ@mail.gmail.com>
In-Reply-To: <CAGp9LzqGwvxGF_bhuyGXu1R2516x=twv1j5e0Wx0EQ7GZ4b-yQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 1 Oct 2020 09:58:14 +0200
Message-ID: <CACRpkdYga6XttmMnQ6r--_7wtfebirY5Z58D6xhBkRRDrf98ZQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: mediatek: Free eint data on failure
To: Sean Wang <sean.wang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_035827_820875_0CA6BEF8 
X-CRM114-Status: GOOD (  14.58  )
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

On Wed, Sep 30, 2020 at 6:33 PM Sean Wang <sean.wang@kernel.org> wrote:
> On Wed, Sep 30, 2020 at 1:47 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Sun, Sep 27, 2020 at 7:57 PM Sean Wang <sean.wang@kernel.org> wrote:
> >
> > > v2 seems the same with v1 or I was missing something.
> > >
> > > I just thought we call devm_ioremap_release to explicitly to free
> > > resource when a certain failure occurs after
> > > devm_ioremap_resource?
> >
> > What is the semantics around mtk_build_eint()?
> >
>
> mtk_build_eint is to add external interrupt function to the
> corresponding bound pins.
> mtk pinctrl driver still can work (than means probe() successfully) to
> keep pinctrl functional even with there is an error in mtk_build_eint.
> So the patch is used to explicitly free those data on failure in
> mtk_build_eint to let unused data is being free:ed immediately.

OK then we need a v3 of this that will call *release
explicitly, indeed.

Thanks Sean!
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
