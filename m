Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7118BC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 08:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U/FWSM0L4soRL9TYGepSeA/Pl0CJDQW0kQ788p+uEZc=; b=CWnr0FORUCuZ5i
	Di+YGx3le+YOYR9oh+W7BcM6pADpagrx4wP26nCtZ8QaBJZmiR+C5JryU+wc1Gc5xrqZ6PTZoZyL6
	ecRikdfS5iEMedI8tbGuhSWcNICf8Ji2P/xK8nYlGxjTe7dkURvj2DdH9mCzG/eg0M7MDXTKSW7Sf
	eZs8s6jsR9K/I7vLVRTehJlft6JpxEIm2uWb39lXX4ROHkK+Z3TA+dTqCF3xja5GG3PAXFueAzOv+
	twXoaNEw7nGZg/aSfaFunB9HpobnLoaWW2dmbWXp/QTO4ZXl63aMdmKNBaB1TUKQq2YHe76mApaX2
	Djd9rjURgVxmm2B+pVjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noKt9-000Wbq-IT; Tue, 10 May 2022 08:06:35 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noKsw-000WWw-4o
 for linux-mediatek@lists.infradead.org; Tue, 10 May 2022 08:06:24 +0000
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2f83983782fso170803727b3.6
 for <linux-mediatek@lists.infradead.org>; Tue, 10 May 2022 01:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eHvmD3RUYratPZzeW7RFq74TZhAFuN/+YFV/XQLuaIM=;
 b=kEvdUJMTS/1kAQeVQAfzGFEjLuxG4aGpB9eCqNr8CJgwcLLrB8t2T0vDWYVLfsJyNS
 knTQtZLTPrq3iIYk1tn3i/YgEAr8upz//UzjmC/J2lhA+8RJFIwewTuKFUINKj3B3Jvt
 P5EBGE5pStkpL78kvyiVNvBXBOKlD+wcA2Ces=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eHvmD3RUYratPZzeW7RFq74TZhAFuN/+YFV/XQLuaIM=;
 b=RU6dDWea3RUXlFdobGtxEntNkUDjxONdaS91Noh2bJnsgrMZ941yNePK8ftPC71Eua
 vHQhkdNPUUAIjb8sU8ZKbQVBNXY9QsbbjPIagx/SD6PKQbhACdo+W+LAQuSGbzsfrcrh
 PxtTMcNILQ5sS558gAnA68rhn1hJyoUTXMWFom4kKCC2gZrTMGae/uDfghj4holAWQMg
 va8eu8BXbr0+QovksYtmpquVx504aNk1ddeTqu6Bk8QhV8SOTNkmf36kFcHlq1QLvc2H
 dPoa1fJislEVMaUNL5h+4KiC5xAdB41got9fNU4YTkFSyPWEvYOME3lWZ99JngVtEcfp
 mv6g==
X-Gm-Message-State: AOAM530cI+gfy1uKp75JhUzU0I3d2laIU9nvqZe+AK9uyil1x0a3H+AI
 bPj6Semu78fWowOa2vm0Ko+iwLdcgXCrz6XaviPFfw==
X-Google-Smtp-Source: ABdhPJxR8UmyAqpm0NDx65RbTGAH+Ic2Inl0X39zKERnNgLItx7XsVM1Qth05XhIcMo2iCuqBDcNOSxhJk4Y3DPsOxI=
X-Received: by 2002:a81:be05:0:b0:2e5:6c26:59fb with SMTP id
 i5-20020a81be05000000b002e56c2659fbmr18802203ywn.94.1652169980102; Tue, 10
 May 2022 01:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <62793d83.1c69fb81.71b96.033e@mx.google.com>
 <YnlBAoZTJ6WbM394@sirena.org.uk> <YnlaZgJfGASYwO8Y@sirena.org.uk>
 <9a2b8b38-c4c0-b1a3-832b-74a937d66047@collabora.com>
In-Reply-To: <9a2b8b38-c4c0-b1a3-832b-74a937d66047@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 10 May 2022 16:06:09 +0800
Message-ID: <CAGXv+5Hx7cRwNzLWrExcFGy=MMOc3-0EbqCanv2E0G_DKXLCgg@mail.gmail.com>
Subject: Re: next/pending-fixes bisection: baseline.login on mt8173-elm-hana
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, kernelci-results@groups.io,
 bot@kernelci.org, 
 gtucker@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_010622_256165_9ECFC23A 
X-CRM114-Status: GOOD (  16.11  )
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

On Tue, May 10, 2022 at 4:01 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 09/05/22 20:16, Mark Brown ha scritto:
> > On Mon, May 09, 2022 at 05:27:51PM +0100, Mark Brown wrote:
> >> On Mon, May 09, 2022 at 09:12:51AM -0700, KernelCI bot wrote:
> >>
> >> The KernelCI bisection bot found a boot regression on mt8173-elm-hana
> >> which bisected to 6f81fdded0d02 ("serial: 8250_mtk: Make sure to select
> >> the right FEATURE_SEL").  With the patch the output terminates at:
> >
> > There was also a similar report on mt8183-kukui-jacuzzi-juniper-sku16.
>
>
> Strange, we tested it on another Kukui device and it didn't produce any issue...
>
> Doubt is if it's just about the FEATURE_SEL register, as that may be protected
> and/or not exist on 8173?
>
> I'm investigating that today.

Confirmed it regressed on MT8183 as well.


ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
