Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5587ACAC5A0
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Sep 2025 05:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTQs86DAm2tZv18wSt1opDcS3zS26ZYKcrgH0Yd9fmQ=; b=aDkhGLbVWD2L/0p/rHPO1mhWM0
	p2P+2KaxmzTk0wzcL/vUIIORG3sHVoNeop8VIEpaV9huOsgyQ/0j1XybL2vvEIp6Dm6SWLgoaahvk
	TojiGDqDeUuOHDaxosSU1mB+f2kAnz9eB0bAts4iKnjq9645DqGWB+vsDxblHPpS7fhzsVQx+zQc4
	Y77ROPNIKr/UagYbJpEcOx6894h9IvyCezDh2m/49OjmigFVR17RTsBHO8zR8gH1luEJUYaw5oYQX
	uCSudsK1wSYPiZdkguzaQ0YKngkcNpfeJXyiJXZ5iHnz7ER91SqJ0nHbMp98w44NtNIxiy8zl/NF+
	N1riaExQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzqP8-00000004pQ3-49bV;
	Sat, 20 Sep 2025 05:45:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzqP5-00000004pPI-3mPQ;
	Sat, 20 Sep 2025 05:45:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 349774417F;
	Sat, 20 Sep 2025 05:44:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E65DAC4CEEB;
	Sat, 20 Sep 2025 05:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758347099;
	bh=rTQs86DAm2tZv18wSt1opDcS3zS26ZYKcrgH0Yd9fmQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=cGpfmWndf5HUwxCZa9NfrgZLcoIsJ1CoQN4e4qsm1oNoisRq5jF4TsDewMKr7ZKCt
	 BRwsS8tjb7XQ77Kb621epmaGTL4+1moxlokJq2zHDuAqWuKV3uZevwYaIZ2/S/QSon
	 VU/jcHBIzQPMcj9+QtNL7/J5MhNBQW23rGy/Mr04Ry6BHNcrL7hresy+qXbOQB0sgZ
	 zHN4R2a5UjaO8XY1zRrKhJY5WOqZ2SMoUZDw4I/c1ifITPAtfsxZ+fI8Yn/Nz2bEX+
	 PFwfA8QOwzN1IQfJ66+Gr+sjjSSgXd+vX5cCY2sDxug1EAPfviYAuzbrQbisb5x+yI
	 HI/u24mCsYofA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250826-mtk-dtb-warnings-v3-1-20e89886a20e@collabora.com>
References: <20250826-mtk-dtb-warnings-v3-0-20e89886a20e@collabora.com> <20250826-mtk-dtb-warnings-v3-1-20e89886a20e@collabora.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: clock: mediatek: Add power-domains property
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Conor Dooley <conor+dt@kernel.org>, Enric Balletbo i Serra <eballetbo@kernel.org>, Eugen Hristev <eugen.hristev@linaro.org>, Ikjoon Jang <ikjn@chromium.org>, Julien Massot <jmassot@collabora.com>, Julien Massot <julien.massot@collabora.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Sean Wang <sean.wang@kernel.org>, Weiyi Lu <weiyi.lu@mediatek.com>, kernel@collabora.com
Date: Fri, 19 Sep 2025 22:44:58 -0700
Message-ID: <175834709805.4354.2882057128826835319@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_224459_959706_327D8E56 
X-CRM114-Status: UNSURE (   7.83  )
X-CRM114-Notice: Please train this message.
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

Quoting Julien Massot (2025-08-26 00:39:34)
> The mt8183-mfgcfg node uses a power domain in its device tree node.
> To prevent schema validation warnings, add the optional `power-domains`
> property to the binding schema for mediatek syscon clocks.
>=20
> Fixes: 1781f2c46180 ("arm64: dts: mediatek: mt8183: Add power-domains pro=
perity to mfgcfg")
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---

Applied to clk-next

