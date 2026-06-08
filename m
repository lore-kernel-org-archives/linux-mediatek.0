Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CEBCD8CA7
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2026 22:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B3T4j7OBsymsUW8sk7AIgEhfmNfH3xykTHDf4YdxftU=; b=tMsQ5/IqMwLR0cyIjmiGODH3QJ
	gXFFb44qmoEJIim+hb3M6pc/feizKKgiWB4c/AmwoybP624Nz5+K0b8gcy6nCcJ25STUGGgSeuZOc
	a7a8Ue1KMQ6xCFZRmxGdUCd4URwIBaL6ZmYidtmlROhBnE6pVRRQ58u5lbhOd2IUGvR9OvDZe4LCd
	51y1WDTRYh0C8Huq3+M212wEHGRwK+ASo5/1cnSxh3rLaj0TrIv7tJectuNOnFICEWZnvnyBVToHh
	GWuLYVlnq81DdUTmyymYNaAuihjbp2E8f0LWfQdcGaPRoz518yaFxYb16gZ3Q+THvS9b9bRfV1e/N
	UMKrTLZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWijl-00000004VUV-496D;
	Mon, 08 Jun 2026 22:46:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWijl-00000004VUG-0Kww
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Jun 2026 22:46:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8397A43E17
	for <linux-mediatek@lists.infradead.org>; Mon,  8 Jun 2026 22:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 675011F0089B
	for <linux-mediatek@lists.infradead.org>; Mon,  8 Jun 2026 22:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780958788;
	bh=B3T4j7OBsymsUW8sk7AIgEhfmNfH3xykTHDf4YdxftU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SPcmg9gSpqzLhPQ4DUxzeLr6C6gvQ+2sHHktTS9Sq3n8C9ba1o423+s2T+OkBEwee
	 NSQhMGqUYw0rMBAxx6zzm+3AvPSldX5QtCcGfRRWGN4JyDAEvCCSLm9fXFa8YO3I1j
	 IEUGelLtoIcqdmVt5XMkMY+qWrxP+xt+QR8Ez5I3Unk3FYBCWZNiEaP2Ul6eI7EtVX
	 boGc/VxU6fOvh4VTJ3kMyrBFktC1OmwKyMhVu5iXK5JqpCo/nNIXbqYkO4uEW/Cacr
	 3kDyx/ZB0e4gD6WlcKK3mmzmWoMB3VedIKGX7OCznQL8kMlssvJFRnRH8l43cEBW8r
	 J8Pp2U7c1fD6w==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aa61e3d3f3so4685223e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 08 Jun 2026 15:46:28 -0700 (PDT)
X-Gm-Message-State: AOJu0YygEi4eRZWMvatGS9IYUifvefFTJGa3+W4okWapjWOyITGIC7C+
	V0DdSVAIpyvTMl/eGVDppokAE7LbiUFyxP8zv/wvD3dRKIvdmPHapWPVgxm5vC98rbYdiQrEVNk
	BrmVdI1Zm8veF8635snwBvXuPrm11Psc=
X-Received: by 2002:a05:6512:15a4:b0:5aa:6eca:f382 with SMTP id
 2adb3069b0e04-5aa87b76dc4mr5708333e87.11.1780958787136; Mon, 08 Jun 2026
 15:46:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260601152707.29039-1-l.scorcia@gmail.com>
In-Reply-To: <20260601152707.29039-1-l.scorcia@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 9 Jun 2026 00:46:14 +0200
X-Gmail-Original-Message-ID: <CAD++jLkFGZ4YYwDrtWsirRF238+K5TiDBeczz-FOZtq-MBA3Kw@mail.gmail.com>
X-Gm-Features: AVVi8Cdb81KyiQYHN3WaKg4cCLnATFx4zGUZo2-MGBsT-bnCL_TrgRbJJGbJYZo
Message-ID: <CAD++jLkFGZ4YYwDrtWsirRF238+K5TiDBeczz-FOZtq-MBA3Kw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: mediatek: mt6795: document the
 slew-rate property
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Jun 1, 2026 at 5:27=E2=80=AFPM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:

> The driver for MT6795 pinctrl already supports the slew-rate property.
> Add its description to the documentation.
>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Patch applied!

Yours,
Linus Walleij

