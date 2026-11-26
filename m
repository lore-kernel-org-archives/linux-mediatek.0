Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E18606A32C
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 08:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RkCZ/GtK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kos7nORo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EOFVyGyYJqU+rNVdExuIa/A4KCVvlE3VjOnDJf/GLKc=; b=RkCZ/GtKDHfrtZkrqniK1dBCXv
	bi9cVl4HXK7f4xjmiYbVlRBzMvjvbGs7PXNOi8qLO2jlJMiiQm7cM0/HHndM1s2gOUd8FXUh0mby1
	12764ZWN5wIJpQr6FhP5Su6vrqKwWwMJ3DRYpr9ZRD3dZk+aiG3kk4Dny4HZsdFxD4/0LFJRnuF0E
	/n6xM08cnRO11f1TnbK82/7hkZHh+cpYwpIvuTW18u4m0QshxxCZY+P82KNa3Cyr8xV1cKK5XDzqv
	RdzYyCeEeDe6c12Bby9SJlssrjqadPHdU7g/EQwF+3dfPuDiVVCS06aCZB43WlRj4e90GAFtKzTq9
	e5a0ohcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUsu-0000000CP8n-0SSb;
	Thu, 26 Nov 2026 08:31:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUst-0000000CP8Q-1Pcx
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 08:31:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D6E4E45F98
	for <linux-mediatek@lists.infradead.org>; Thu, 26 Nov 2026 08:31:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEFDF1F000CA
	for <linux-mediatek@lists.infradead.org>; Thu, 26 Nov 2026 08:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795681874;
	bh=EOFVyGyYJqU+rNVdExuIa/A4KCVvlE3VjOnDJf/GLKc=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=Kos7nORo2W5ieReE58LGqeTwKL9Ui9j7e+fXVsWObncWqZQF/zyQDNDtPMsu7kZot
	 4JaTUQlT2vA+9rauHVdYM37L4AzzMcxwvzgiVZ6Lr/1CXh3ts5xvvE1v/Yx7Dh6sRD
	 MWm3iPQ4OHwDJ2eDJBIwch+4m+e+FKW69UNVzbIm3bRIMm2S1SoMMP8oSXsXTDSFtR
	 EXH2PWF4G5zXtRYrMSVl4bOPodP88IS7GnWnYPcev2FO+oDKdWn1sXiLBC+A8bhvoZ
	 0jmGgK6flR/THCtKPLIkUq2ugs8dIEMgnyQ8e7wWI9e/ZhStZKd+nxTTiIrV/rSZa6
	 LsAW2PBDn8KsQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c14470729eso6145864e87.2
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Nov 2026 00:31:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGfs4VpZiU0s9WwFWwdRh/7yclvJ2P6c0Asr7TjJeCodbGnJ2JIUXi9Zm1uVn+NMMN3dViOgXgCOjoEtmKFmw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9J17JX5hHQ8IByVMMXQdVywfan3RaYxBRUXaSp5K7t4gG0IAmS
	pLTefPrVuS45mxgGUBdQAlWVaYK4UZ+k+jPfnUGSHpQcpw22m2kpD/+AXK5TuNQIDoyB2we5rEl
	+8X19BuVZs3Z7KqHHbxqGQot6t/A8GhE=
X-Received: by 2002:a05:6512:2255:b0:5c1:ace3:131a with SMTP id
 2adb3069b0e04-5c1bc8661damr5652240e87.48.1795681873045; Thu, 26 Nov 2026
 00:31:13 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261126-a35bb25eb5-u14-0@mail.sdu.edu.cn>
In-Reply-To: <20261126-a35bb25eb5-u14-0@mail.sdu.edu.cn>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 26 Nov 2026 16:30:58 +0800
X-Gmail-Original-Message-ID: <CAGb2v65-HypXGomrmDzq6fK2sbF5NwCXmGDgfKsJ_UhBu18YLw@mail.gmail.com>
X-Gm-Features: Aa3M54o43cu-6A0TaGG1ukqNIvNBVoMGzQ0_0epz3dGZK25t85Du9OaBaHJIHPA
Message-ID: <CAGb2v65-HypXGomrmDzq6fK2sbF5NwCXmGDgfKsJ_UhBu18YLw@mail.gmail.com>
Subject: Re: [PATCH 0/4] clk: mediatek: Unregister apmixedsys clocks on unbind
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: angelogioacchino.delregno@collabora.com, sboyd@kernel.org, 
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, matthias.bgg@gmail.com, 
	wenst@chromium.org, drinkcat@chromium.org, weiyi.lu@mediatek.com, 
	msp@baylibre.com, fparent@baylibre.com, linux-clk@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: wens@kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 26, 2026 at 4:27=E2=80=AFPM Guangshuo Li
<liguangshuo@mail.sdu.edu.cn> wrote:
>
> Pair apmixedsys clock registration with removal on four MediaTek SoCs.

You are checking the wrong tree.

This series is mostly obsoleted by the following commits:

c9c2fd1a53a4 clk: mediatek: mt8516-apmixedsys: Switch to common
probe/remove helpers
68d1fa487766 clk: mediatek: mt8183: Switch to common probe/remove helpers
9421b0b085c0 clk: mediatek: mt8167-apmixedsys: Switch to common
probe/remove helpers

> Guangshuo Li (4):
>   clk: mediatek: mt8167: Unregister apmixedsys clocks on unbind
>   clk: mediatek: mt8183: Unregister apmixedsys clocks on unbind
>   clk: mediatek: mt8365: Unregister apmixedsys clocks on unbind

This is the only one that applies. But we probably want to convert it to
the common helpers as well.


ChenYu

>   clk: mediatek: mt8516: Unregister apmixedsys clocks on unbind
>
> base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
>

