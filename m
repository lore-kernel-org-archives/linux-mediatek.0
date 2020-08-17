Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74A19C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:14:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E5112078D
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:14:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kQ1A48gp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="rBkaeThX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E5112078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V8MPOKNvXEf7KF5NTFBt6rPvx6YKYisGSD2TSL9Il3c=; b=kQ1A48gpdAI6g1no5PijlPmLU
	Xq4TBK7efRGo+BEBJ1WhCAcen7QTW46BDuSRjdjge4sYCX6NxLCevxpBwJ7bCTILI/q+4fnWfXsV4
	ucunCoZICetbt2+Dilllo6TVCPAa9aXa3cn6XytAHuZ2jX/Leyvh934QUQEiraxA1hOwx8TOdth/1
	uKX/r7Dq/qve3VSRnmWAdhY03R5MvtqqNdkqUs6kUS5Hx5q0jsN7xobN3x4YzO9Lc3vojoArCTzUZ
	vRxPjRfGPnyXk9nxzfMHbXvskxLiE81VjjUjmZ0qOfJ42UNckL9wk2EP2BxDZzBr3J7t24IfqRIzk
	AGkCsqRlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7aHK-0004vR-Dk; Mon, 17 Aug 2020 08:14:02 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aEf-0003D4-Bk
 for linux-mediatek@lists.infradead.org; Mon, 17 Aug 2020 08:11:19 +0000
Received: by mail-il1-x141.google.com with SMTP id p18so9924399ilm.7
 for <linux-mediatek@lists.infradead.org>; Mon, 17 Aug 2020 01:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lt6hzq5ZQO4HiO3QNUBUTHvgybU3ir4bEXy46hXUV98=;
 b=rBkaeThXVt8B5nb+Cq4kDmKYVxa3SVAFiCNoqheXNihqyvUk+53LxPMfauwnzPS/Na
 VRJpDtqSyoEubgQMwX5GaMPK2SauuRNWBft/Ll8blgxDhTDb280lDQuj3Ua1vXwiKtAL
 5f3iuTgwO8le7b0VoFCIVgWpwHE22MTNbAZbUAF6edvZ7yUV42kD4KbloBmuHLcsa+br
 md9pqQns95LBAeST17auuF2R08fHlmesmmfLAMjB0hmlYLVK0q/BNfJxhRHLzU14ZMIY
 D1l+CW8LUOqZ/eYtjR+lH1FWGMbZ9SkMoSkB800k7o6EHxI711PFk/oynbxsi0OkySqw
 SmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lt6hzq5ZQO4HiO3QNUBUTHvgybU3ir4bEXy46hXUV98=;
 b=aNGAZuoQWCzq6+xtG5nkbz6+EuBhPWIoDfKbDKtSDCFcESAPjZjr82lTWmSjTIDklo
 tLS+9S/k9W0Vj17Cx2TIEK9+g95Tia5IsoYrIVcXZudMjttkZZqRBtXMZq92QmHUfpgq
 1Gs+RlZFj7ytBFz6lnekpWPk4nayJRCZnyiYbAwvTZRPjBvwsCvGhSxJDGOo05ggd3xV
 Be8pbZG7uZjFzfoWXCVdzTCJuD1vVjLQxRB5grQG3AcyOv1V/kgR8DyAGOKoZEb0kQ7E
 nW4uwXKuL88OHu0RL+yrr+9wK+xg4yyClGcn2iiH8XYTn992gBq78mY84Gt/590PPNfa
 I/vQ==
X-Gm-Message-State: AOAM530AUPHvKP4pXLk62QyVnj29btAOXZymf9ZO/TDxFlwPZwkubsMp
 PfHVuPK2xefO+HQ+VCcfJo1yfM6rEOIiv+n+7FWwtQ==
X-Google-Smtp-Source: ABdhPJzyL87H7xo+SFVJo6OxddJRwCf8TqTo/jG/8v4crswXEsNPG1scfuanoeHlA4HikpKT8hXnnNsJOLQbgj4Ix9w=
X-Received: by 2002:a92:c904:: with SMTP id t4mr12816222ilp.257.1597651874349; 
 Mon, 17 Aug 2020 01:11:14 -0700 (PDT)
MIME-Version: 1.0
References: <1597644455-8216-1-git-send-email-jiaxin.yu@mediatek.com>
 <1597644455-8216-3-git-send-email-jiaxin.yu@mediatek.com>
 <CA+Px+wXSbGLb+AZnF8ETRycRUVjqk4xacm5DH6MzuMw0vh6Wzg@mail.gmail.com>
In-Reply-To: <CA+Px+wXSbGLb+AZnF8ETRycRUVjqk4xacm5DH6MzuMw0vh6Wzg@mail.gmail.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 17 Aug 2020 16:11:03 +0800
Message-ID: <CA+Px+wUMXoSL6w0wBduE7obJRWgCteeT8=_=U=8LR34JKTTGZA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] dt-bindings: mediatek: mt6359: add codec document
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_041117_638009_82FD79C8 
X-CRM114-Status: GOOD (  12.19  )
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
Cc: ALSA development <alsa-devel@alsa-project.org>, howie.huang@mediatek.com,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 shane.chien@mediatek.com, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, eason.yen@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, bicycle.tsai@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Aug 17, 2020 at 3:29 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Mon, Aug 17, 2020 at 2:08 PM Jiaxin Yu <jiaxin.yu@mediatek.com> wrote:
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt6359-sound
>
> The compatible string has been removed since v3.
>
> > +required:
> > +  - compatible
>
> The same here.
>
> > +examples:
> > +  - |
> > +    mt6359codec: mt6359codec {
> > +      compatible = "mediatek,mt6359-sound";
>
> And the same here.

I misunderstood.  It still needs the compatible string to match the
corresponding driver.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
