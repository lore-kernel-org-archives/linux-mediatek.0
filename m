Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 813D3C2A09B
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2026 18:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iAAQGBdBoRkovVpJQHo5IAsY4ppMJrT4CJ2byK1QahQ=; b=oKw+L/YCA/+1Ve8siTOejKKY5l
	tEm+/oePODGLERfhnVztuSis00rCO26onhudhVDq8clVilF6z7vwvatW5b4Vzo8pjoyq8ntkKCt54
	5Fp7k7tRgx2i8KY6tUAyTcbkYKKdt4OrGMgXcp4C2XLeedIVCyHVafzH+FTYW6SBaMb9dZNf1Bloa
	eglEHoC6swgvj5fMjO6IDVcTWZps+iiAR7z6IyUdGAYQuz2H8FGHNU2RpSdwCLdgrR7Oe57m+eZzV
	hGBCJtYktuPGW0QKkZyFE9eV4+vhjLR0l036Vk2H1gXWkm3Hv6kaSi+QDQU/BAJInv7YgyqAnbPbk
	lPuszuaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsPZp-00000008csW-3IcQ;
	Fri, 07 Aug 2026 18:45:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsPZo-00000008csH-1lHe
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Aug 2026 18:45:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AE541600B0
	for <linux-mediatek@lists.infradead.org>; Fri,  7 Aug 2026 18:45:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 674C21F000E9
	for <linux-mediatek@lists.infradead.org>; Fri,  7 Aug 2026 18:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786128351;
	bh=iAAQGBdBoRkovVpJQHo5IAsY4ppMJrT4CJ2byK1QahQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eaHqZsGUnGMcADqx4BeggqvVTdls6zjBr4TBOnKeO1H6CHTJ1cDJ3PjB+SJwMuIAE
	 ipZ67WAh1NWPvOngGBK4VkeYlzR0H35V1iRzA1tMZuwpvBbnETduGrX3am5ZBRpa8B
	 hVS+WCc+Imo8qEdzTvXcQpE/hRKoEiqB+TbBRiGV07nVM5s/iJ43jaxJXwloSuYt1u
	 tHj+yKClCoGcO55p3Qbc9AQL1UZNn3TSJYySEDqxT4xtHwyQMNeADJynNjSDhL0qnu
	 F6iQTEblCKSPU+fWswpig6ImTO1Vi+BTmQvMy3NHSuLKiphz2Ur4oN3mTsSgXWBb++
	 5Sf8QpHUjeNJQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b0148201fbso3355299e87.3
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Aug 2026 11:45:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrY/ekpegtTqjHbkA0EkIoQyM5Ru+AW5CobDxDFUjy6EguzJ0xQ43EPOrUfXN2VBhZ38FiwKgSZxgr3wl3HNA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxyITtShVgNkKSdRiHhUTRWf+8jIdFgIbfq7ki772JNPt4AUMyx
	IKy0Lhbgv/u8ekUYfBMHJWyknRqm0DEZK5d9XlZHbt9PEnKi8/L8lfnwjPn7uvIv8Jx/CnaL8Iw
	QZb+zwkOwustuTFJjKBJzet6uDxvTSI4=
X-Received: by 2002:a05:6512:2911:b0:5ae:bfd6:173b with SMTP id
 2adb3069b0e04-5b30b73dcecmr333543e87.20.1786128350255; Fri, 07 Aug 2026
 11:45:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
In-Reply-To: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 7 Aug 2026 20:45:37 +0200
X-Gmail-Original-Message-ID: <CAD++jL=2vt6qJcXdnyuCSEWMTAdZA0-=yhKtsXX9Qqzm9scjEA@mail.gmail.com>
X-Gm-Features: AUfX_mwyyr_F-MwW0ZW6ZC4tI78PAU_OowRuALyPIokafW-F9bK_08tyDxfajbs
Message-ID: <CAD++jL=2vt6qJcXdnyuCSEWMTAdZA0-=yhKtsXX9Qqzm9scjEA@mail.gmail.com>
Subject: Re: [PATCH v11 00/37] pinctrl: airoha: split on shared and SoC
 drivers, add more SoCs
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Markus Gothe <markus.gothe@genexis.eu>, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>, Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
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

On Fri, Aug 7, 2026 at 12:06=E2=80=AFAM Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> wrote:

> This patchset
>  * fixes more airoha pinctrl issues
>  * split combined driver on common code and several SoC specific drivers
>  * improves an7583 pinctrl support
>  * adds support of en7523 SoC
>  * adds support of an7563 SoC
>
> The driver split changes are based on Matheus Sampaio Queiroga work.

Patches applied!

I had to manually fixup one patch due to orthogonal changes,
check the result!

Any remaining nags; let's do patches on top of this.

Yours,
Linus Walleij

