Return-Path: <SRS0=oVGr=EB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5822AC4363A
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 18:38:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA5112084C
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 18:38:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qq+kxrPj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="U6rgcLPo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA5112084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5KRwaOHOZUWlkqpVJUpZPuL+mLcsC1JSHeV4yvj46iU=; b=qq+kxrPj20hlJS2obW/xtb2Cg
	KUpNv8RY3AGFele6V7SPF2nlSlbFlmp9XlY28GmsvmKl0ieHXW2nJkQgOWTJXpSKRNBgSmcZWZRbe
	kDom7vYRJvTvpc5ySnRknb5D3GHu1DsoHMh585KfSyorUiEAEgLlpy658pDGVE4vEtwXxHVLRdAiu
	PHL+4AMlBBjDvMGQ5hoxquuOQZacgawGkWz8LmjTDUkdSrvAcjYh74Rfk0kluUEgTpSA/Pe+QKdba
	+GTepD+BqiYLa0vYdJTgNzIabAWPeBtn6AhLOv9vSWbx+PZsnbn7c+e31w01gNSMvZTwVa9P6xlNv
	nCTvoAx8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX7O8-0004hl-8u; Mon, 26 Oct 2020 18:38:36 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX7O4-0004fs-8J
 for linux-mediatek@lists.infradead.org; Mon, 26 Oct 2020 18:38:34 +0000
Received: by mail-io1-xd44.google.com with SMTP id k21so11165761ioa.9
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Oct 2020 11:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1XLqJl5vO2wWqmgb9LT+ITrNAM4FaYnH32PMkyjUkwU=;
 b=U6rgcLPopeY+yLxDRznBLJXxFLKGgrzqcjfFpNlkRuTjUZU3L6L4X9PU1ee3RvMa7+
 tCNGjsczrHyLeuJpp1FJgIusoZAD2HQRw/b0XMwu3MjheCJPPp5miFBqKhQ2awQB5ARS
 Quh6VF2ccXhCSoc422X2K9Iw5F7vGpvUkXKgZhR2yBiTYrLcv6qBpFW6o+pyFKIvFLdi
 IH0K6HDRCn6/4tc3gyOB5Sju904nMvGLHbtkK83c+fIFJE5RKwlKJpWXosyPofqszADl
 RkjngwAtJtRSWaxQVC5doRFFBX+p+JxbGtgkaher5nXaaL7lLDWPrzrTVor88nQkjsKu
 ILHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1XLqJl5vO2wWqmgb9LT+ITrNAM4FaYnH32PMkyjUkwU=;
 b=iuZVdvZFrDHY8hdIziOlTBHcGkk2zvtWhWxDWtRb5CoYQWl8KsJv0aC+baO9wcIMz4
 9dNIiJTPIJez3CHQfFWg+F07osht+wrPcEXs7W/ws95LxOQ6SOxXJjpPTLcbauotlwNd
 mZsmA+gB1RCG89Jx5rkjuSk25Mtm1fh4qI6LF0w0jffLfAtvQuOgzPp3WmPm4Lija85L
 diSrRP8cNIuyg5fZbVAzOwKvvXBXN/2/q/FGViejEr9jd3F2bUUgydvxtT5Y1MewGKOc
 2mC2heDahwZt08+cffIBK3VpGQD+oLVIGgyKkI45CK4n9qdgL7toQ7Sz8oICjfvcYKQw
 yxBg==
X-Gm-Message-State: AOAM530ER/U6fT3ENoSQJQzE3muaA2Dlqi9H8bu49A2wygjVnBKZzT/B
 3i7V2IsfvgiqnR94f7YPtF46A2taC74414rleXWDNV23Ykg7yg==
X-Google-Smtp-Source: ABdhPJwf56+lb7bD44CUrLWq/bsLRBUFkrCwKEnxLO52La3PA3TL1ljkGdJ1n02YMO6sRL1kgcUE4qOIFcgHOMQErFw=
X-Received: by 2002:a05:6602:2d8c:: with SMTP id
 k12mr5570349iow.46.1603737510347; 
 Mon, 26 Oct 2020 11:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <20201024200304.1427864-1-fparent@baylibre.com>
 <20201026121316.GB7402@sirena.org.uk>
 <CAOwMV_w5N0_Qgg3MFph1147cbvFP1Y=mUtNjGbcr-Tca4ZJ3yA@mail.gmail.com>
 <20201026172431.GI7402@sirena.org.uk>
In-Reply-To: <20201026172431.GI7402@sirena.org.uk>
From: Fabien Parent <fparent@baylibre.com>
Date: Mon, 26 Oct 2020 19:38:14 +0100
Message-ID: <CAOwMV_xt=OV6cKqQTZUUSAvYKxUUQZAUywAHtFFHL=E5xVu-Zg@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: regulator: add support for MT6392
To: Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_143832_345403_A093E3EA 
X-CRM114-Status: GOOD (  24.04  )
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
Cc: DTML <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, lgirdwood@gmail.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Mark,

On Mon, Oct 26, 2020 at 6:24 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Oct 26, 2020 at 06:18:35PM +0100, Fabien Parent wrote:
> > On Mon, Oct 26, 2020 at 1:13 PM Mark Brown <broonie@kernel.org> wrote:
>
> > > On Sat, Oct 24, 2020 at 10:03:03PM +0200, Fabien Parent wrote:
>
> > > > +Required properties:
> > > > +- compatible: "mediatek,mt6392-regulator"
>
> > > This is no longer used by the driver, should be unneeded and therefore
> > > should be removed.
>
> > It is not used by the driver but it will be used by the MFD driver [0]
> > like this:
> > static const struct mfd_cell mt6392_devs[] = {
> >     {
> >         [snip]
> >     }, {
> >         [snip]
> >     }, {
> >         .name = "mt6392-regulator",
> >         .of_compatible = "mediatek,mt6392-regulator"
>
> This is still unneeded, it's just a reflection of Linux implementation
> details and should be removed.   The MFD can just register the child
> without supplying a compatible and things will continue to work just as
> well.

I'm not exactly sure how it is supposed to work. mfd_add_devices seems
to register devices based on of_compatible or acpi_match from the
mfd_cell. This platform does not have ACPI so I don't understand how
the regulator driver would probe without this line. Anyway I tried to
remove the lines below in the MFD driver and the device tree and the
boot of the board failed because the regulator driver didn't probe.
Any help to get me understand how it should work without this line
would be helpful, thanks.


                regulators {
-                       compatible = "mediatek,mt6392-regulator";
-
                        mt6392_vproc_reg: buck-vproc {


@@ -135,7 +135,6 @@ static const struct mfd_cell mt6392_devs[] = {
                .of_compatible = "mediatek,mt6392-keys"
        }, {
                .name = "mt6392-regulator",
-               .of_compatible = "mediatek,mt6392-regulator"
        }, {

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
