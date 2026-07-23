Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B83CC531D2
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2026 14:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSnnUvI2mi0NCU23ygzDYKRZyp/HiDYy1Aw3/z9yIt0=; b=ZyQIxkka2/998j4LhIouqB9C5f
	iOxweuUMxyNtqWmUuIleJVhG83F4l+5QjiAka6aqjyjJAQ/V0HnqIzQmY2ZCcsJR2Gmq55KGO7k+x
	rT/GyyVZjVPV7+un0bhiuMuuZ0S7h9RALAiH0CZR0cInrmWqVyBQWzaGgSedZzz/ykDc7g/dqNZKy
	LYul9vCPnqt7R8HDjXYtW6BxFoWhA5MordTETdx9iNX+gebPTD70jaah0pwn5GxM3K/zS2IyoZU81
	2Rf4Fk6AjGG15J0SeOTUm3bMZ0KuabEfCdixFQ8O0bOmyKL/gcC21z21+RcPMDdQWMBVneAB/AhIQ
	o41mREDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmu0l-0000000ERq7-0QMz;
	Thu, 23 Jul 2026 14:02:55 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmu0g-0000000ERoZ-40pU
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Jul 2026 14:02:54 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5aea0fff535so757298e87.3
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Jul 2026 07:02:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784815367; cv=none;
        d=google.com; s=arc-20260327;
        b=Rl5HvSH6Y1ThWiFQmvuvDDge+bUx0eWfzNXIrHfG7tvk8yfyTTOu9CNh9ZACDyeODb
         wEdrJETksHB6y5yWwHLLAG/kGzqEGVfeuVS/adMlK33YxOXeOA0FaBSUh6cEAdoOxIEy
         Gy08+N2yHNbKYiWqSTS4oneW89beta7St88JemE3PL5NWk36Bf0SkHuDVtVpaVmAwH7G
         3yohEqDZM4XlK7RMXvrEc7imNihDku0VSAhtD0sSD7LdK9QSGi57s2TvII3ns+g2l0bT
         A02UnWpZTB08Hp5svGlKPs34cI5Cx5KPswglmHVNcTE7QIix7l+yumFkwAZjOhP0w0Fi
         YZWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aSnnUvI2mi0NCU23ygzDYKRZyp/HiDYy1Aw3/z9yIt0=;
        fh=Gxlf4pYm78WJuaSRT7wqPrSYuL2KftoBYXt0KED7fbY=;
        b=P234g8AwG8UKbv+jdOrLlUaM5lAZlBVel5tldJJU+KWQkIeh3B/jT0h6u/uOONeR5B
         Pg3nsQwm/DZXRR6vF4c8SqeXwWR1KtvmdliM4bLG23e5gGydgD0Vd9eD6fB31n2orTYK
         s9A616PdH8SAYhzbooNPkIoTjwpBtUIyKRnhT7RpQogfBlzBECEc9X14ge1U+KZYQ64o
         jKJWE8hmc4bzepXtjgdDn/3hzMyVOYICSDbfHW9sYN/e/LbPqIPMQs09asJTfVvj4mJo
         Z4/Nt2xKO1x+TeWv01yXO+5qpysTz9Z5K8B4Oa46mOv9lx/++1Na1YGOpolqnCfKl53e
         q8Fw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784815367; x=1785420167; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aSnnUvI2mi0NCU23ygzDYKRZyp/HiDYy1Aw3/z9yIt0=;
        b=aOPpRBPPK7jC7YswsroLneGxXNZj/YZiaZxYNXcNOANAuzYTgczj8jvuEyzo5/V4bN
         8VV+CRxo3kHXT9Vl+tzL0VyjoXcHW06YiEfSvcmMx6JewsckA29vGfeos+s0yXg/WNVQ
         yLp6lXkzYuTpbghTuhtUAgzc+G9CZoLKEQ63e7RNibrmwlxGJzqbylTndid1LTyT5k+Q
         SDAhrZ2GWaWrXGUIXLaBnfro+LC52s1mi+oCHNqvG4ZhfZfJnFPVqIn9UQc9eSINJ0xc
         d+h9d2LWYZmt6IoP/vkRa9cE8KvFV7F+/q69lFyy9KF0zRuYmsoRJ6iMoePUBpbnn+1X
         srZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784815367; x=1785420167;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aSnnUvI2mi0NCU23ygzDYKRZyp/HiDYy1Aw3/z9yIt0=;
        b=DHYDFCBjUBW/WtLpMQF1wUB9FQ56xmbJCnyIvHH7dYWBCzUT/fmz5GSzZbTWSjDP8G
         0cTFs/DafsP0ZCRNP2xJiqNEhSHbmUnJfnwhbvcreB9Jo+Yg+mwUFmw4OTjdQpkIzsBx
         lSdpCG8pAUZe7rIs0Tf+dEaGgHezrxghL5Yh5fdcJK08qxZoBR1m4wP4lLvGvSPedqH1
         WxF/IfNsq8pMmJSR272bIXDc788Rg1fn3soi/YWMolAyc4azqaG84++5th5l677CFj1q
         d3WfpxB3hpbVnNpdzW5oJSRMG8Cpyfd0CU9lSt4sYBp0E2qPzuFMgMWDLSHBbfT4qqXk
         /ZWw==
X-Forwarded-Encrypted: i=1; AHgh+Rrf5+C2OPUQEAFqvB0+6R4GjQEWt52Dj4RpN+SII4X/lDHU3njWMER17dMEWt+5wslUChF4+g3PUfB2Afs2pg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzV8Tn165zsj4A+l150lUGydoU+9mXAfHMQAyAztlGSW/rDzmjf
	BVERuN7Hxh4JbTCLkpdLaKwKMjcOk2Gz1+2wtUjs78AYHoIqsF2l0njOQqffMOctAKXLqiJ57eE
	j+/D8l2hlLs0VLTRaOhxb+vHnhba+hjc3oKacobaK
X-Gm-Gg: AR+sD12K9uy8mmPW2IcEURYyl5BRz149svM1TUgWnEyjNZg9hR7EzvhguZucbki7XD8
	V2xpFMVgc8JZnrjCKZcR/fxFBYZaLntanrsvaKFb7A7yVTJZWe1Fg9PtyOWhuAVsgaTbrHUyhZ9
	9NqCxdmPYDq8hf3jle7/doYFu9DvSVj/1nZzxX9tOLkZ9e943VFu63N+2ZgjjAac6g0zZhTsLMc
	fmJW35RA3xtS8B/Bl4YrDntsnAxiAF15jejyC/J9W6LY6Z1hBSuLay02+Xbf8JhQhWWRFcT1p6g
	l9S1bi3BnX391AyY9pEhtypTwnS7mHlGBAXBcWVUVaA0sA8=
X-Received: by 2002:a05:6512:6c9:b0:5b0:1dd0:f20b with SMTP id
 2adb3069b0e04-5b2b2e4b2d4mr696890e87.6.1784815366922; Thu, 23 Jul 2026
 07:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260723091601.72103-1-zhaoping.shu@mediatek.com> <20260723063935.75bf55e3@kernel.org>
In-Reply-To: <20260723063935.75bf55e3@kernel.org>
From: Willem de Bruijn <willemb@google.com>
Date: Thu, 23 Jul 2026 16:02:09 +0200
X-Gm-Features: AUfX_mzhMSefwo5xw0q7T6LspWMg8-GnaTmUAQUYLYyQ56qOjHskx1_zLVTsEoY
Message-ID: <CA+FuTSfgBbPkdLanqEgbDq-jLVQJax4fUxQ-tuzTuFwQANwxBA@mail.gmail.com>
Subject: Re: [PATCH net v2] net: gro: avoid nesting TCP GSO skbs in skb_gro_receive_list()
To: Jakub Kicinski <kuba@kernel.org>
Cc: zhaoping.shu@mediatek.com, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, horms@kernel.org, ncardwell@google.com, kuniyu@google.com, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	alice@isovalent.com, sd@queasysnail.net, eilaimemedsnaimel@gmail.com, 
	imv4bel@gmail.com, hw.he@mediatek.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, haijun.liu@mediatek.com, 
	xiayu.zhang@mediatek.com, lambert.wang@mediatek.com, Iven.Yang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_070251_010750_508C6598 
X-CRM114-Status: GOOD (  18.31  )
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

On Thu, Jul 23, 2026 at 3:39=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Thu, 23 Jul 2026 17:16:01 +0800 zhaoping.shu@mediatek.com wrote:
> > From: HW He <hw.he@mediatek.com>
> >
> > On devices that support both NETIF_F_GRO_HW and NETIF_F_GRO_FRAGLIST,
>
> "devices that support FRAGLIST"? Isn't it a software feature?
>
> > the hardware or driver may deliver packets that have already been
>
> If you have a driver in mind please name it.
>
> > aggregated into a TCP GSO skb with frags[]. GRO may then
> > aggregate the skb again in skb_gro_receive_list().
> >
> > This can create a nested GSO skb, which is not handled correctly by the
> > later GSO segmentation paths. When the skb is segmented by
> > skb_segment_list(), it not be fully restored to the original packets.
> >
> > Avoid this by setting NAPI_GRO_CB(skb)->flush for GSO skbs before
> > aggregation.
>
> I don't think we can do this. For GRO_HW devices re-aggregating
> in SW is quite helpful, HW often runs out of contexts or times
> out too soon, generating skbs with 16kB..32kB of data, the SW
> can help bring it up to full TSO.

Also, after e751256486d0 ("net: gro: fix double aggregation of
flush-marked skbs"), it's not clear an another bug remains.

If it is: as said "nested GRO" of hw + sw GRO is intentional, e.g., for BIG=
-TCP.

But it may not be anticipated for skb_gro_receive_list. One option
would be to skip the fraglist GSO optimization for such packets.

First I'd like to understand better what exact bug remains.

