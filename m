Return-Path: <SRS0=WTSR=MS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2677CC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 09:43:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC83A60F47
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 09:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC83A60F47
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TxM5KdWdGLIxZD49X3FhAv/fdJgb3zks9GwhXsPVKsU=; b=Kaf+iWKnGGqghd
	FOGGVS8+X/cdoRj3YhDUWjryNcFbmuQ4BpltGNZcpTOQO8M61rQuvP5mdLb8XnGjHVeXrFuyAmhPI
	GBclXhftutt+9QuAjQ65tnivmVnYWDTiC1EWLjGSt9TKOCJzbA3OwlN9HV33ZyakyQSsN+UWd+jsQ
	uSDk49UmlhLCYSnbgOGciuUTWlnUWvkkW2sVpKKTi3fFmLhb2KSdocRiZI3CU9gDJlbqhORGHASFj
	CcGSegMjIekKz9zG7T8c3sq9Oymz9YXH6gsv2fPf3Sx0Tw8/twybvZZyiQ9W77zLrKxxFdmA8SRHs
	QczErCcr7Pw7F2hKWbjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7x8p-00AX6I-QJ; Mon, 26 Jul 2021 09:43:19 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7wyC-00ASn5-3N; Mon, 26 Jul 2021 09:32:21 +0000
Received: by mail-oi1-x233.google.com with SMTP id o185so10100943oih.13;
 Mon, 26 Jul 2021 02:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TvB2lU3cpIiYxB3yUvnpi686GY8PdgzLtSomY5oaEog=;
 b=cI8CEovvUbYc4RTo/50NJmMV+CsWTMEGKA2jXDrWifgQtrm1C034WUzFAh59x/KWzF
 XVvMZwU8i6pcw2sEQ2haz8972spAgFHvwQ7ccCLOQq2qKpvt2r7qPwbMbFuWT+t+AMwz
 ZSgld8ytrnY+GWNJy7HUPPs0h/sgXc3Dl7KJHVAYM0hPWrjTgWPJN82BXXozDEqa4fer
 kqCo6Xy+5MNLnvcBpihc+31Jo3gF9DY8U9RjX7uVGMETeZpAn/rILAA+L/cNUfkIB3e6
 NVtU91VCF/a/ORP58S/3IrDKNRGhy+6R09dBM2ophufne8uoZ6UkzV6Du4Stu3QO3AdN
 Fxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TvB2lU3cpIiYxB3yUvnpi686GY8PdgzLtSomY5oaEog=;
 b=B0xNpLe3JKtBvdhGH5WjEI6PsjLD3oTVbrLvPlEPwzRUMw6JX5rwwgVlTCzo5NdSjI
 t+NEmunAfjoFaftmBqaLACd0PpvM47/PsJco7ReHRC4FmqcPwX9LXJygEZqEREw4vVkm
 j2uYM3mBUKIx9Xqs3Y9U+3BSgbsFRrd0OpUEMitr61A/3EH2geTwWjZ+Y4heRzCINwFy
 8XJWKkhXYkPDe5APEALIKvalJLm3fxgWUXPs7gsdw9/vty44zJBobIj8YuR0y9NQRjmf
 irNCfS2KfrHuyR2NptTtWNHcSt+R9sexhaQztIjlM6oCTu5pYiZ8GtqNZ12pU4YWYjFw
 lEZg==
X-Gm-Message-State: AOAM532UH1VerAvSsbh9kBPy0pQcSfTMaUIOHFZMvoKMg6ccXERsLAEQ
 xXYXS7dHXIcXNOvZgK3cpdChpW+PUNjH51jjAt0=
X-Google-Smtp-Source: ABdhPJxPbsQMG7e++KYhaErKSQEC0RsF92zrY6kaJhfP72TiFAKnUN1wA6vD9nUlwwCYUS14lzoHWQg/3ZmrduoI81Q=
X-Received: by 2002:aca:c0c3:: with SMTP id q186mr4872462oif.39.1627291937488; 
 Mon, 26 Jul 2021 02:32:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210726050831.1917982-1-hsinyi@chromium.org>
In-Reply-To: <20210726050831.1917982-1-hsinyi@chromium.org>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Mon, 26 Jul 2021 11:32:05 +0200
Message-ID: <CAFqH_53zJp7ejwXn3qqiVPnoTy6W3WonvvDxsZDCjmaQA57h6A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8183: kukui: Use aliases to mmc nodes
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Eizan Miyamoto <eizan@chromium.org>, devicetree <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_023220_207310_8A20C393 
X-CRM114-Status: GOOD (  17.32  )
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

Hi Hsin-Yi,

Thank you for the patch.

Missatge de Hsin-Yi Wang <hsinyi@chromium.org> del dia dl., 26 de jul.
2021 a les 7:08:
>
> Use aliases to mmc nodes so the partition name for eMMC and SD card will
> be consistent across boots.
>

This definitely helps with my "troubles" flashing the kernel to the
correct place" so

> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Btw, I think that a similar patch should be send for Elm, could you
take care of it?

Thanks,
  Enric

> ---
>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index ae549d55a94fc..ed499e17b6570 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -13,6 +13,8 @@
>  / {
>         aliases {
>                 serial0 = &uart0;
> +                mmc0 = &mmc0;
> +                mmc1 = &mmc1;
>         };
>
>         chosen {
> --
> 2.32.0.432.gabb21c7263-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
