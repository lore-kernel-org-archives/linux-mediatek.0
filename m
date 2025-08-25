Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AA6CA0FE8
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Aug 2025 17:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gaSCgp+9x9wgETscmsm6/J/E9Z0jSnaLlgjGoTawuZE=; b=2Ztu5vgRA0xwMnq9QQ88ysP1yc
	lILAQHuSRSDSWc+MjjyMblwtw/u3A9E8Q+SbRtDWqZrzqYGRJOygZeFKdHLi3E4uZfDBeCQ02wZ2N
	KHy8RCqHwLNHycwOkjc63KaolgWH8efuVwBcS+O9IJV/PRPu0G7km1LOEIXPbFgyl0o5v1Jtnk+6c
	3wZHkp5xMsAihyssx4nOvF+xpqoWN0Rg0Z7zN1XKrUN1sQJclwNBZK6E3lxm0tuODFvQTFRQ/xm4N
	KybRiwgc22c1LvYKdTz8qdSKfCG5qz3NBFV+hNZR80vYnZZiEg6FIeE2f3w7EVzj/rnLfD/dlWxCb
	93e4Jnsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqaYm-00000008kMl-1c2J;
	Mon, 25 Aug 2025 17:00:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZcp-00000008ba5-2D4m;
	Mon, 25 Aug 2025 16:00:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gaSCgp+9x9wgETscmsm6/J/E9Z0jSnaLlgjGoTawuZE=; b=rKlaxKiecO6by1bn0DLtFNBDXA
	BmgKGRJR0Fs5X9kwz7LEMOz3m7ZR/jXMP8P0zmv+BHXkQNKCjyB3S0P4tMAK2jBytun2I2mgckYE/
	Cbc3uaIssoEk99ZwaE+JlAyYyjYr30MN2W8f+pOZL6o0n/v2/yZmTThMtr1XZcs6AouekfrMvSjFr
	dQ0DK1Nda4d6ux2slgSvZpp6WM6Br+Qee2D6nguvtZb8XoVM5NYvun5HodjDE/29zA6683Eg1KwOz
	zYrglqeIImApIJEGyyKiSnf4F3GWH1fBio7c6XPcNpkClHUOU56QaVomE/0+ZsUCHFyS9Mzlud3ty
	wJiCmAMw==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZcm-00000001vR7-2goK;
	Mon, 25 Aug 2025 16:00:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756137644;
	bh=gaSCgp+9x9wgETscmsm6/J/E9Z0jSnaLlgjGoTawuZE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=K5cSiuiNyUlYig3gKw/Pjj8VRjMsSG/tQRnivKT87u8PoxdsqfWiKfs/lEN/BjDul
	 YXcr+hei3+I2ZidXLOkn8JZnAmouiTOcVvtekkzgZkg2fjxKznWWD1UoyquCGhh5F5
	 lM8M/Mqx2PvIN0+1c+3CA64FuDBiBS26UgHtt0fNtR+3h4O4/EcTl4Qjnu0p0Ve0v8
	 g5U0haJrieuKeHvC5yLqOY0MSLzy2UdA8XXs1vKabJ9EMn5dA+cTVh8xXMpml6gf7c
	 fKWl9gSQTYKapeF5r+YHs4yQN5nxRNeHiJCEYT3MzfbinYdWkeM1FivxAGgdiyLVg7
	 LOYmef7KeMQqA==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85Cf092D4Af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A47A017E053B;
	Mon, 25 Aug 2025 18:00:43 +0200 (CEST)
Message-ID: <9c544d68ec10da176b062333b8a04903ce77a406.camel@collabora.com>
Subject: Re: [PATCH v2 2/6] ASoC: dt-binding: Convert mt8183-afe-pcm binding
 to YAML
From: Julien Massot <julien.massot@collabora.com>
To: Rob Herring <robh@kernel.org>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,  Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Ikjoon Jang
 <ikjn@chromium.org>, Enric Balletbo i Serra <eballetbo@kernel.org>, Chen-Yu
 Tsai	 <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>, Eugen Hristev
	 <eugen.hristev@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown	 <broonie@kernel.org>, Julien Massot <jmassot@collabora.com>, Sean
 Wang	 <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Date: Mon, 25 Aug 2025 18:00:43 +0200
In-Reply-To: <20250822143945.GA3709669-robh@kernel.org>
References: <20250820-mtk-dtb-warnings-v2-0-cf4721e58f4e@collabora.com>
	 <20250820-mtk-dtb-warnings-v2-2-cf4721e58f4e@collabora.com>
	 <20250822143945.GA3709669-robh@kernel.org>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_170048_811764_030A011A 
X-CRM114-Status: GOOD (  13.74  )
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

Hi Rob,
On Fri, 2025-08-22 at 09:39 -0500, Rob Herring wrote:
> On Wed, Aug 20, 2025 at 03:44:53PM +0200, Julien Massot wrote:
> > Convert the MediaTek MT8183 AFE PCM Device Tree binding from the old
> > .txt format to YAML schema format to improve validation.
> >=20
> > While converting, also document all clock inputs and memory-region
> > used by the AFE block.
> >=20
> > Reviewed-by: AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com>
> > Signed-off-by: Julien Massot <julien.massot@collabora.com>
> >=20

> > ...

> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +=C2=A0 - |
> > +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/clock/mt8183-clk.h>
> > +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/interrupt-controller/arm-gic.=
h>
> > +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/interrupt-controller/irq.h>
> > +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/power/mt8183-power.h>
> > +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/reset/mt8183-resets.h>
> > +
> > +=C2=A0=C2=A0=C2=A0 afe: mt8183-afe-pcm {
>=20
> audio-controller {
>=20
> like you changed the .dts.
>=20
> With that,
>=20
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Thanks, I will fix the node name in V3.

Regards,
Julien

