Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E135E8FDB0
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Dec 2025 17:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yaWWygL8WsP4cVvJT6R3siyfFYnRS5lDtTG/t4oXvO0=; b=rOJqQA1zmo4Ly4DxZRFAdLjfeZ
	kP3EMI3gE3MuxOIhxZNRn+CTawVyMC64y6AyEM90eG59wCXYvdsh5JD+uTMrvyQdzJpdb5FY0WDLh
	UnQuK44ScMOX+MUuVX9cVq/wp8Dv2qVu55De/p5JVes5qq7YnA6rhVZHwJ1vJM54DxLbjNyLeD9Cm
	/PwXVa6Wdf4ZjpDjtWT5sP5dRcoPwOSqS/auKcpP+Sdtl/wNJ+lavuO9gJOk0orWLRNifexT4+ss9
	IaGCHxI8qWLZUcseMal2rbKDoHQMxdJdC7a4JH9VOrFP4umTxo/3iHQvLshwmvV0Mb32Ce/+3HhPT
	L8/MfDHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZBtH-00000001LN5-0fTW;
	Fri, 26 Dec 2025 17:46:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZBtE-00000001LMI-3paG
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Dec 2025 17:46:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0546A40795
	for <linux-mediatek@lists.infradead.org>; Fri, 26 Dec 2025 17:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA198C4CEF7
	for <linux-mediatek@lists.infradead.org>; Fri, 26 Dec 2025 17:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766771170;
	bh=yaWWygL8WsP4cVvJT6R3siyfFYnRS5lDtTG/t4oXvO0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AmI/6adOPlKtoWCWqKZe5yJ8oG3l7QmB6BbKWw9PHiLE4tV6bO6ppPs6EZc4/Mvo5
	 BjWFzvBn3Qb+2938U+x2In324OewndYjEoiGA/Hw5Lu/asj+hGzh2cw64zgT7fE4/u
	 U/n2g3PR+kAcRcNK7qFD+pdAZr4pwngYfob6YN3eD7/S/ulXVd5Rnl+Sfj+LvhRFSg
	 nGuEoUds1QWt16egeOkTcuQVERlbhN7u/q3mpxsPxTWlCJTsfc/SPGD4dNKcGKsOZI
	 7Sj1/m7i30EuY3YG84OmaMZArKg4RaWE1y6BIuUKyZ7mb/7fl7maX3SxZ/FpXjkRaK
	 IwWMLTZ/mE13w==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-787df0d729dso61345157b3.3
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Dec 2025 09:46:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUuFLeL9kFJlSJRLPWgeiDBuXFXmFFLe2b2PBfuYapEC7WglLNH2QkYJnaCF5sazCehVt15uGAZmURxW0xmIg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1Mw4mgRHLLhwbMx/pE7eS+TNUaEeadc5NdUlkXx3orpVZDzWt
	i3Qa3JC3pSX1blVkuqGWAtf0UVSGkl4s01d0Pn+igurLuGql/iC38+kq+8useUY/fFtUcy81msX
	CjKqj2y5FuYq30s1bUY7qLtDL92CrKqY=
X-Google-Smtp-Source: AGHT+IGkQ6XUIR2QS+jzQzwyb+uH06UnhoOZauP500HEuu+uE09VYZhz6TrKU/N7A068s7lGjbjGraZIx3VxSmvZI40=
X-Received: by 2002:a05:690c:680c:b0:78f:9854:2603 with SMTP id
 00721157ae682-78fb406ad93mr234198697b3.28.1766771170211; Fri, 26 Dec 2025
 09:46:10 -0800 (PST)
MIME-Version: 1.0
References: <20251203-mt8189-pinctrl-fix-regname-order-v1-1-16c8ff5490a7@collabora.com>
In-Reply-To: <20251203-mt8189-pinctrl-fix-regname-order-v1-1-16c8ff5490a7@collabora.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 26 Dec 2025 18:45:59 +0100
X-Gmail-Original-Message-ID: <CAD++jLnfTdN7Wwa+a-ze2112vkMPcTtvEUoOZDtu166hu4DP3g@mail.gmail.com>
X-Gm-Features: AQt7F2rJr7E3FC3Q9d909t1YtxKsBcuUtJWHcYVrXihmnvhQlQW_9VrzDPk4caM
Message-ID: <CAD++jLnfTdN7Wwa+a-ze2112vkMPcTtvEUoOZDtu166hu4DP3g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: mt8189: restore previous register base
 name array order
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kernel@collabora.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_094613_006318_CFFB61E2 
X-CRM114-Status: GOOD (  14.90  )
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

On Wed, Dec 3, 2025 at 12:33=E2=80=AFPM Louis-Alexis Eyraud
<louisalexis.eyraud@collabora.com> wrote:

> In mt8189-pinctrl driver, a previous commit changed the register base
> name array (mt8189_pinctrl_register_base_names) entry name and order to
> align it with the same name and order as the "mediatek,mt8189-pinctrl"
> devicetree bindings. The new order (by ascending register address) now
> causes an issue with MT8189 pinctrl configuration.
>
> MT8189 SoC has multiple base addresses for the pin configuration
> registers. Several constant data structures, declaring each pin
> configuration, are using PIN_FIELD_BASE() macro which i_base parameter
> indicates for a given pin the lookup index in the base register address
> array of the driver internal data for the configuration register
> read/write accesses. But in practice, this parameter is given a
> hardcoded numerical value that corresponds to the expected base
> register entry index in mt8189_pinctrl_register_base_names array.
> Since this array reordering, the i_base index matching is no more
> correct.
>
> So, in order to avoid modifying over a thousand of PIN_FIELD_BASE()
> calls, restore previous mt8189_pinctrl_register_base_names entry order.
>
> Fixes: 518919276c41 ("pinctrl: mediatek: mt8189: align register base name=
s to dt-bindings ones")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

There have not been any comments on this so patch applied for
fixes.

Yours,
Linus Walleij

