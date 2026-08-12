Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EEAC5CFEB
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2026 18:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PgwvOoLAHdeH5x1LPpK/Ic794djJ4NRcQySFzYPO0Xs=; b=Dy7gx5/Oz8Xn5rRI7ZDEhHCgXR
	dau8UFIo88gSjG9YKj71GCErrSlV3rbVU2VbI0fe3bLqcoglhCuHp06A9eLRavY5j6YqDpCYx0b6K
	FtWRIji0Il9DF8J4gCwmp8lAGoVjqLwEZrzjgIEPqaiD3gim1LOn0o8cemqB0xFf/KTryAmyi6B/n
	8GdwpEBp1jJOiGcf6rJ2CW7FAL6mI6GWAsPJEK/yu44UF971iTHjQAOwg/P+FYZ3AtIA0THQevlFQ
	1D7DxoW9eqExi7reSdpN915VMPqOU643i0qFz5agrBXO+6mM4KMZL7I/I8CX7mSiWjemAx4xKuHv0
	hpzaHPxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuDUd-0000000Gm2S-3RBS;
	Wed, 12 Aug 2026 18:15:59 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuDUb-0000000Gm1R-1YQL
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Aug 2026 18:15:58 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c2020421077so222863866b.3
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Aug 2026 11:15:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786558555; cv=none;
        d=google.com; s=arc-20260327;
        b=V0OkBPuyMv0rF2ryL85m8NinGPAkLSJZ6k9ZOelsIN6NjySOrlsYWu9paYS4HASQBb
         bLNUSuspeKX5AD3fMADabR0zYPkGEj0L8vp4rJVJ0h7/lJUWoEF7Osqlkg7woeQ20L4V
         Yx0x/kAJkjhcrGxvcq5OD8flTor7hqSjfXOW21ed/TIOW8mx+VXQvaQp8EyXzztop17h
         fCUHJTQ7DABKGMf9emFNbZrrbhfgBPqj94+RUapBcaDwphkG7pNm5WiKKa75NFSP5S6Y
         jxhJROYtbG7Gao/tO4kfCQ+56is0mEFujTAYi5EK7nYy0Y9n91PaKG8rA03WBb5hHQcp
         LNlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PgwvOoLAHdeH5x1LPpK/Ic794djJ4NRcQySFzYPO0Xs=;
        fh=YsvXsmx9lNbftHE7m80Gq5XnPBFe3ODWT1AM/83FnTo=;
        b=PlrosCStmjVdQhi7zKmPZsET0ZwXm59IpYS6jRKq9DaVxVrxHT+lUqKN0JC5ABH5JL
         TvPMdjqLWWMyVL8uoiYGqkA44TMBnHmX1VJVPJtMiWHtk7DxmVNJkhY/Zl0TqkF/QkZi
         Cem5AP8VmF7mySf1VdIhbK+j/jtVlu/2170VJJEC8hZR5XASF89Sm4+wq8wW4H/FGMD9
         mbkQqD/hlup02kpIPD3dQRI3F9APbcqT8/+DdOKMotWkznKAMz16w06CAVlw8Z04E/9/
         7X+Z5hC/kGvTagHVicCEZdiLHAyEqnJh5A8fByKltEUepAco+V/zCg7GTyFxTMgSn9iJ
         k3og==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786558555; x=1787163355; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PgwvOoLAHdeH5x1LPpK/Ic794djJ4NRcQySFzYPO0Xs=;
        b=NnUnDbAYTQbOwj/fxcFXA9n2iavnR2lp5BkZkAi8ybEwdmAlrLpefxCKDZTGO7RdRQ
         yse/7WtV9ZxNI31ACFsnfcFjvsNPy4Ztj5uvq1SwtI/Fgnz+Z0TAmNJYrnwsgXjFm7Zt
         ZpWWZxeLETdb5NdxANerTHuCGNJ2rEKCPLOMkQkXnvnZZxNFO/AXacAwNTaKkIPPooW2
         sAkW0rc00GPgwEvCAgPhg8r6ap0vfTC6j+kpJVJgwZsU8yXqK4rEZ+Ulg0ZX42uZOnMI
         kT0OGEBe14bHSVvGaGu4lhQyNAK6y32/qCoTCSOCIl6WcPmXP2eiXNfQZ5h435PwOyLB
         Bayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786558555; x=1787163355;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PgwvOoLAHdeH5x1LPpK/Ic794djJ4NRcQySFzYPO0Xs=;
        b=aqECaFDCYOte2thtalwjzndsmp3OZyT2LcMLX/ESYBm6H6ayXveRT6ktV6kbI1JW1+
         Z2geFKH9Sp8bd7z3LfMOgD4l0bXhV4957eUTUy7AwFwe8elWB1sj7RW/u1yUT0w3lhbJ
         jtRSMQfUj63YPmewt6mxVF2ResWbo0QUObZLO9Yey/j720DpwPIGqGVJEpulC7Ab+VsS
         XNf1Cx6ADwfnKk08Lp4q6h74cii3/dudl6OMkKeoILHNW1Hm8pukbufhZtyZBjBLcG5N
         xSiWWgbEU68wgPlvpxPeFDXcrx4Eu9BVdxV6lx2zBTpx2aruPrZNE4ATIpwHWlFNd8sb
         HMPw==
X-Forwarded-Encrypted: i=1; AHgh+RqgOpK2Yh96MmMlq0G0MXWPxo6vsNPtYpiCTiEyy7z5xz9WcoY5nqHw9gvK8gssZzkBxheROon3D42RsBMazw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxrc9gY65d/QFI8Yy6KLDs0yiFHXEWLlKeqq5XaNJFepLbeq0FL
	HzTHn+JNfnD3MYxgxplDNWnyhpWJQdqeM7jMbdOZFeQRZfkYrwi8ciSJ1J+lffl4X/3bUVTELJV
	n9wQDdnyMvZHoCzuQAlzwP89bO1bJWh1P0A==
X-Gm-Gg: AR+sD100eGCylVojiSbXHvSrkb/gXUZwuzIFNK/tqq+KxpV5GwUfUi5KLzFxsH0R0wm
	tdBM/ZQ2Y+fJhb/2wI2rbVXq7HjQFrfJUSUICAe1ywjoZBvQ+Owar46hJcXTNvkFOhkTqVwjcu3
	q0atROfoEywNwQeIJepGS5dP3Ptf8fZmvEYS99xr3cFZbUBWdq8WwFpG5yCyF3gqKTTZaro6cMk
	tA2jwPds7qhhfH6UEZ6J+qJM3PNhG5KCJPgD4rRxWAk0/zBwE4wKoV12XjQMW2uPGQWLb2aGjCC
	soARJ4KzPQPpMl/l/IWftroSduVOx7kXJhHAL3dqTSGTpVkzajTvljrKMfTvJaaMz8jBLb0mUrd
	6NWk6vwYeMCCsusp8IGNNKCfSLYOwqYn+58VBvCI+jF73VMXokZWImmGwaH2u+frFhriXBsq7nq
	YHi9huCJkn0r7qT8qN9ZR+gcN+T0JT30EUnZgu0yYVOg++xgzFZ8j0PMM=
X-Received: by 2002:a17:907:c0d:b0:c20:899:b8bc with SMTP id
 a640c23a62f3a-c2108ee3cf0mr7867166b.6.1786558554870; Wed, 12 Aug 2026
 11:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260304041400.7236-1-rosenp@gmail.com> <djjg6jwpuu6l5wcc7zbxfi7j4n5hircmhivxohdtgufzrp6rlb@l6eyfdyfrxix>
In-Reply-To: <djjg6jwpuu6l5wcc7zbxfi7j4n5hircmhivxohdtgufzrp6rlb@l6eyfdyfrxix>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 12 Aug 2026 11:15:43 -0700
X-Gm-Features: AUfX_mxqbIvZ73kcSiSnSMXY77gQTI6q5M4UWPSGxgp8t1CwI1GTwLlXmGpI4Co
Message-ID: <CAKxU2N_VYNgYKhS11Frzio4fbg_ZnDsvCfEypvxSiw3-JV0_QQ@mail.gmail.com>
Subject: Re: [PATCH] phy: mediatek: tphy: simplify main allocation
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-phy@lists.infradead.org, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"moderated list:ARM/Mediatek USB3 PHY DRIVER" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek USB3 PHY DRIVER" <linux-mediatek@lists.infradead.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_111557_424157_6EE1991F 
X-CRM114-Status: GOOD (  12.70  )
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

On Wed, Aug 12, 2026 at 6:32=E2=80=AFAM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Tue, Mar 03, 2026 at 08:14:00PM -0800, Rosen Penev wrote:
> > Use a flexible array member to replace kzalloc + kcalloc with a single
> > kzalloc.
> >
> > Shuffled some code around as __counted_by requires the counting variabl=
e
> > to be assigned first.
> >
> > Removed NULL check from of_get_match_data as it's never NULL per the
> > device table.
> >
>
> Please do not combine multiple fixes in a single patch. Also, the NULL ch=
eck can
> be kept for the case of sanity as it wouldn't hurt.
hmm? There are no fixes here. Just a FAM conversion.
>
> - Mani
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

