Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B41C88E72
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 21:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NevuUkbIbY8Xir1EiuknrCzVePMTrnsw9qsLi8W12R0=; b=mHxNNzYCDvxmrx9D1eIGUxfd74
	5V4VFbWzuqjYwBAVCO1InHoJG5ToqurnMZuAcpv5tpHNgth59g4APw2PwddIXN4S89K7DGvYTC+s5
	tr/XsOzJM8p8eAcLLHR3yA+BVf28CUw6iN+yQxDm1n3zK9FWP3hT04+1QtRiGxBk0yq5CK01UgINa
	4KyIw1zd34J4Semy3dElQfvS5WyPax8ZAXmkjuC1+fjkzaDLDqQ2PiVWygQrPENgRJqbwy1Z60ZLa
	wfTR2qILyjruMVd7Hu5CWhxfTNTG2WO9OwEYNi2HrhYfbksoRd0pxY4//1SHLYfd1ar5X+jOZm6T8
	m4J8o8IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6E1b-00000004hrq-24yt;
	Mon, 14 Sep 2026 21:15:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6E1Y-00000004hrF-26Cg
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Sep 2026 21:15:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AC3266025B
	for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2026 21:15:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65C511F00893
	for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2026 21:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789420535;
	bh=NevuUkbIbY8Xir1EiuknrCzVePMTrnsw9qsLi8W12R0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nZ3svjAWFX3+xqUFjVpIL9dgPp8tQFeM5gg5QoY7Pu7qXBjj4Xt4sf+78cNwfD5Y3
	 gVAngk7ti3CFZ92sivt3gMZFqY2SYum3QAw2RronjZ8MTENStKYof7+tNtUAFp9zFW
	 51SM5bXydhxNXEQOy87BV8o3tqVL75/Y3pFuku/MJl/IR/oUUNdWZj+fQO5d1OmSxS
	 2+N/aeuRXGkaHbyOqCleTd55yqKAnO3VXOEgHsmKKhvoY/bhz23CuGFHm1Wtw706L3
	 w7ZPkrmlkJd8Yy8r6N0rWzr0l3nJdogRCztyFnYBBmfphr7Q+79HaU2FyG9C0BDZHz
	 xb2iaQxsriXZg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f18010so2620597e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2026 14:15:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxxfuSAC1punav7Nlr0g2Girn50z5CvF6WK37j3C5BDOi3j1f529VF6E6oywbsNPjNLjnv3N1MbR4Ke1/ZPag==@lists.infradead.org
X-Gm-Message-State: AFuF++mDH1MzsyXQe8GWmJADDdOQe6Xkru6+QZhZxEY9NouLjdf4NdK4
	Um0k7Dk4NET0xkeLhuB5ZcJdFeirxQgSFx17KZ1WfzGuao0V5CdCCa4g8UzOQaTBV1twMgspeYd
	DCbQo8hhd+6LE1SwZdt8XVtUIWCGcfrA=
X-Received: by 2002:a05:6512:3f0e:b0:5b6:183b:d214 with SMTP id
 2adb3069b0e04-5b8ae6a6fbbmr1185441e87.59.1789420534106; Mon, 14 Sep 2026
 14:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260914155645.112508-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260914155645.112508-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 23:15:20 +0200
X-Gmail-Original-Message-ID: <CAD++jLmu2vovxXa9jqX+pq32KV6ONQ-=Yoo3fKF-49oMFVv3GA@mail.gmail.com>
X-Gm-Features: AcwNN1W41lYuox0pw4JKzbuFr7Ojh_AWjTCNy5TnXF9BlZMG2RX-71m9k3IWIl8
Message-ID: <CAD++jLmu2vovxXa9jqX+pq32KV6ONQ-=Yoo3fKF-49oMFVv3GA@mail.gmail.com>
Subject: Re: [PATCH v2 net-next] dt-bindings: net: Use consistent indentation
 in the example
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Justin Chen <justin.chen@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans Ulli Kroll <ulli.kroll@googlemail.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jeff Johnson <jjohnson@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	"G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Alex Elder <elder@kernel.org>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, 
	bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, ath10k@lists.infradead.org
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

On Mon, Sep 14, 2026 at 5:57=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
>
> In cortina,gemini-ethernet.yaml also drop the wrongly indented mdio bus,
> because it is not necessary for the example.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

