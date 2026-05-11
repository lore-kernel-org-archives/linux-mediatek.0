Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902EDCD484E
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2026 20:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jye6GvFlEjzThLUvmLkambJ/dmm3iU6zf37i3X16hC4=; b=4CJCUOQVK3zPHIerXykwbwa5c+
	xkzT/5Tyo92o5bSGKRJflQcRAez2qDEoXjNqw7O7NlMYIJpyJNXPF7IqyCrNWIuuI/PosMTWQaT6M
	660aFLv+Q/v3tz7KHzlN14OIAlAFh+zK8v+1vkKuLmDjU4jHlJTpobeT46DWAlccRLW1CC0AndU+M
	Gc3rhhQw5CBbXaJbVRwqL6PQa/sbkwgpg3RsvMAGDA6PhWtKte40A56PMzaz9seIlCElt/4xjrsI2
	95cBZMSoR2WA6nkduUw8/7IoJ7sRtdhiEq+cOoA4fhuJH4dmxLygmPoyc61DjDgWqx73/2SmppuDr
	ahKEV9kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMWzz-0000000EgGS-2FSt;
	Mon, 11 May 2026 20:13:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMWzx-0000000EgG2-3Ba5
	for linux-mediatek@lists.infradead.org;
	Mon, 11 May 2026 20:13:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 00B9960121
	for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2026 20:13:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA8CDC32781
	for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2026 20:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778530384;
	bh=Jye6GvFlEjzThLUvmLkambJ/dmm3iU6zf37i3X16hC4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f5F/JnQHSKYkh1ZDoeWc0yFbkA3ZlVxuZe1RZYlXXFqzidoA5HlbOcLTxiK3W7N6C
	 SBpq8Ql8L5DzkKbCGSTqXYwN8cjP5vHAiAXIJaLDObBnWKjXhUHL1Yeub6z2c9Tgis
	 gYLFbF/JWJP2ymiBrR+9eq5aiYO0n83rc5H7/pzeDmvC9vCSypoMZJW7J7/5aKguCx
	 pARHjI2mFhaxJbYy/hUzCjyYMB2ulCHjCDd131nTytK4p/ov3GJ3tQClaeGEgqMhhE
	 Xv1CYUsTHPdRPMzGpwuFW5d7ToUpMGLGnwpv+ch6F4r0t52PMdMs95TAZS0ys4WAq4
	 uIHvAQ1yaUUyw==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39378db197aso48988711fa.3
        for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2026 13:13:04 -0700 (PDT)
X-Gm-Message-State: AOJu0YyHXR/NjJ44i+/BAtKF0RJb23qKplA6ycC76RcmLUwo7NxkVWXW
	y9OQlxA5Ia6CkBcUX+5EjM5z+7KZGmK92nzLxDVaYMTjc6hV4OsLOHo+tPjeg5wz8Od/UB8vUpr
	EXT+12yCL1MiGAhUoNh5ZCsgg0byKM3M=
X-Received: by 2002:a05:6512:3a88:b0:5a8:9aae:3c99 with SMTP id
 2adb3069b0e04-5a8b6e8f606mr4490300e87.16.1778530383250; Mon, 11 May 2026
 13:13:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260420213529.1645560-1-l.scorcia@gmail.com> <20260420213529.1645560-5-l.scorcia@gmail.com>
In-Reply-To: <20260420213529.1645560-5-l.scorcia@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 22:12:51 +0200
X-Gmail-Original-Message-ID: <CAD++jLnypYKUmKjnPX811m5Gc0guUwYeN=cQuxpAT3_gS9JWWg@mail.gmail.com>
X-Gm-Features: AVHnY4LX3rah_STGf3_slNDMEwQfgJHe21tHW014S60VT0tshZIqHNAjHJXvWcE
Message-ID: <CAD++jLnypYKUmKjnPX811m5Gc0guUwYeN=cQuxpAT3_gS9JWWg@mail.gmail.com>
Subject: Re: [PATCH v5 4/9] dt-bindings: pinctrl: mediatek,mt65xx: Add MT6392 pinctrl
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Gary Bisson <bisson.gary@gmail.com>, 
	Val Packett <val@packett.cool>, Julien Massot <julien.massot@collabora.com>, 
	Fabien Parent <parent.f@gmail.com>, Akari Tsuyukusa <akkun11.open@gmail.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
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

On Mon, Apr 20, 2026 at 11:37=E2=80=AFPM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:

> Add a compatible for the pinctrl device of the MT6392 PMIC, a variant of
> the already supported MT6397.
>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

This patch 4/9 applied to the pinctrl tree.

Yours,
Linus Walleij

