Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98877C531C9
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Jul 2026 09:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+sHLG58jMqxDvbOMKd1AgXZwgrkw+Z6jJpWALEhEDl8=; b=dpmSlBDlqSnU2D
	Rkhv7CYUGQ91GWEiPQJJiNEZ9WsSFEXdnFOXjLzlq8CO1LR8hnijCpe3sZBnBlecgX/9gHeGOBtIJ
	4QDLm0HVcdEqA5sZZJB30KsqYrgQ0/I4m4zMCM0CAbuFAyRZs+KEJ6FZWjPp3ejleDhjyljwoX2fR
	SiGBVkWuJXRk+uwYJz0MzR3wA/Ujx5znaYKt1wx4qMDVPNF646rSMoiersRJfk48XYFHZNabHuVuY
	0MStvJcfSJa9ZkZz3Z54+HWYlH3Rh/02HffkFRNJFwiu2cTacph1qWDPH80E7s0ODyHXkUL4RHqPC
	QH2meU7c81+0uv+amCDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnYvO-00000000Do2-0vGa;
	Sat, 25 Jul 2026 09:44:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnYvM-00000000Dnp-3q95
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Jul 2026 09:44:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 50CB443A99
	for <linux-mediatek@lists.infradead.org>; Sat, 25 Jul 2026 09:44:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3446D1F00ACA
	for <linux-mediatek@lists.infradead.org>; Sat, 25 Jul 2026 09:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784972644;
	bh=+sHLG58jMqxDvbOMKd1AgXZwgrkw+Z6jJpWALEhEDl8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oWyN4RD6GUDboGVxC/E5Q+yQ/MY51Uzx+fjHr4jaNAziLLzsQiQEOHChVRxULpQTe
	 4i1GDClV1ncnrzIm8zAVk8TzAWIdy27nOlvL+SKyXbcHdXjb5/pWJpv2MmSPM1pzSR
	 Lf7hNM6GMvX+VZp7GoQUcGfuJV7hBXRgx/bPFVdZopBpcsN66FUaFtOVI09f65dkxy
	 590cupVPQEkkZdg6cB+zT9nrfo7g+bR3DxwZ0Crzl8MdsQORplhpoRurQHffXpJAYA
	 18Qkra+Kd3BTp//vz8vElA5iYi3ZqRoAp+6KtBMFZs3l+VpeBKCGC6ViV/BckkEQPu
	 nhxmng/peIj0Q==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aeb24c0807so832609e87.0
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Jul 2026 02:44:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoZUswSraCxMyUqJwOCpJFa57w83NucZno+gOKOIMDtURWUbyufIfFpw0FrnaHBajmtmoNYOCRDy38WRjgMyg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUnGV4DdzRRlB8vlXFgOznJo5LzVbk73zfG+Pny/ZN/HncN/ig
	Yvndm2dam8/SlAh3HCeX8nEu3qmUEdlH5G7gNjU8PJE7oJ1LWVyglvBjAj7jI1f76lzMgtyuvFC
	DF1eAj2O+gIfI6KjnJziNtXFRRW11m6E=
X-Received: by 2002:a05:6512:6c3:b0:5ae:d80f:c77c with SMTP id
 2adb3069b0e04-5b2c1b2ef16mr275541e87.30.1784972642983; Sat, 25 Jul 2026
 02:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260709193927.108105-1-chenyou910331@gmail.com>
In-Reply-To: <20260709193927.108105-1-chenyou910331@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 11:43:50 +0200
X-Gmail-Original-Message-ID: <CAD++jLm07h6-HSeZNj3gf9vnh7KpUMw_qwC9_td0LBnbiM_8Pg@mail.gmail.com>
X-Gm-Features: AUfX_myp3ksAlUiIcfmHpUh-uA1XaXUKqtDVaCvq7z8kF7LlzbztHb7BNOGJzyo
Message-ID: <CAD++jLm07h6-HSeZNj3gf9vnh7KpUMw_qwC9_td0LBnbiM_8Pg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: mt7622: allow gpio-hogs
To: Chen-Yu Yeh <chenyou910331@gmail.com>
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 9, 2026 at 9:39=E2=80=AFPM Chen-Yu Yeh <chenyou910331@gmail.com=
> wrote:

> Commit 6e3b067d3c5e ("arm64: dts: mediatek: mt7622: Align GPIO hog
> name with bindings") renamed the asm_sel GPIO hog to asm-sel-hog to
> follow the GPIO hog naming convention, but the mt7622 pinctrl binding
> only allows child nodes matching '-pins(-[a-z]+)?$', causing a
> dtbs_check warning:
>
>   mt7622-bananapi-bpi-r64.dtb: pinctrl@10211000 (mediatek,mt7622-pinctrl)=
:
>   'asm-sel-hog' does not match any of the regexes:
>   '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
>
> Allow gpio-hog nodes in the pinctrl node, following the same pattern
> as commit 9322da935c9a ("dt-bindings: pinctrl: mt7988: allow
> gpio-hogs").
>
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>

Patch applied.

Yours,
Linus Walleij

