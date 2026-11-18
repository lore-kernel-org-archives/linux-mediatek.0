Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254CB60A262D
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 15:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dRLQxvuL;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UwezS82B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oKUUXTVJS/LFVlMihYz3ZWqF9UHg5n3wCBX0shTUj3s=; b=dRLQxvuLY7GvU8L1RxtkffIfXc
	M6nUn35V8xRZKPTHl5NAVMnhvexbutGIhUT+s2FhcDyo44kRG4CuZPR1rTTV0hMs+uWALzN0A5MZg
	XCgHv5lOGxF6NcZtvbdNj8SyJFKFs2zQpm9q+DVvI47g+w+EjYprd5QLaidAfaxcUGSpH+RXT8kxO
	+rj21K4tQApqtfrDKFDQa8s5lAie9h8Ovo4SNYWz33USCD61QhzP7Oyyg56YZoyYX8XtaaBYK9iUi
	vbzgBqs0UEqbhnfndJbn2VyUJm1XxxFWdB+v5H+FIhbaUrws58iTlOGRV4Ay/3S7mBPK9th7AY34D
	afmvOKRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThVs-00000009HQC-3F4X;
	Wed, 18 Nov 2026 15:23:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThVq-00000009HOk-2eZO;
	Wed, 18 Nov 2026 15:23:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FCE642157;
	Wed, 18 Nov 2026 15:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 474E81F000C4;
	Wed, 18 Nov 2026 15:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795015434;
	bh=oKUUXTVJS/LFVlMihYz3ZWqF9UHg5n3wCBX0shTUj3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UwezS82BdpUqMBy6fK1UgkbsZuFIzeYBAHayDD/gHgjNKwteAV2kDw6lP/s8WB/NS
	 uFYMT3oyayM+8iacAsp3s09qOWnYngmh2Or5c2BtPU2iAPrb2Kq5YjwOv6X0LUlIG5
	 QD2BI7vedjejC0Kcb1nFhR1YuVhV8YJ4hIPKCj2Bhgz0zR4YGP2iNdVB46kZ/B8naV
	 gt66QUhOjmUbeK3Hqij0aZlR+oZWjXPajS9gXG8CUx808RdK0K6BmeSNbBTp9WmtWN
	 ujAQqkV2RVk2jF/Ir/CFHuarhIT7ypMfUzRRpHQWdiw7mULKhlA67SBziSrWogtWO1
	 s003oniKbOejw==
Date: Wed, 18 Nov 2026 15:23:46 +0000
From: Lee Jones <lee@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v12 0/8] Add support for MT6392 PMIC
Message-ID: <20261118152346.GC98456@joneslee-macbookpro.roam.internal>
References: <20261105194426.1113050-1-l.scorcia@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105194426.1113050-1-l.scorcia@gmail.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 05 Nov 2026, Luca Leonardo Scorcia wrote:

> The MediaTek MT6392 PMIC is usually found on devices powered by
> the MT8516/MT8167 SoC and is yet another MT6323/MT6397 variant.

[...]

>  .../bindings/input/mediatek,pmic-keys.yaml    |   1 +
>  .../bindings/mfd/mediatek,mt6397.yaml         |   6 +
>  .../regulator/mediatek,mt6392-regulator.yaml  | 112 +++
>  arch/arm64/boot/dts/mediatek/mt6392.dtsi      | 145 ++++
>  .../boot/dts/mediatek/pumpkin-common.dtsi     |  82 ++
>  drivers/input/keyboard/mtk-pmic-keys.c        |  18 +
>  drivers/mfd/mt6397-core.c                     |  97 ++-
>  drivers/mfd/mt6397-irq.c                      |   8 +
>  drivers/pinctrl/mediatek/pinctrl-mt6397.c     |  37 +-
>  drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h |  64 ++
>  drivers/regulator/Kconfig                     |   9 +
>  drivers/regulator/Makefile                    |   1 +
>  drivers/regulator/mt6392-regulator.c          | 764 ++++++++++++++++++
>  .../regulator/mediatek,mt6392-regulator.h     |  23 +
>  include/linux/mfd/mt6392/core.h               |  43 +
>  include/linux/mfd/mt6392/registers.h          | 488 +++++++++++
>  include/linux/mfd/mt6397/core.h               |   1 +
>  include/linux/regulator/mt6392-regulator.h    |  42 +
>  18 files changed, 1913 insertions(+), 28 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi
>  create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h
>  create mode 100644 drivers/regulator/mt6392-regulator.c
>  create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulator.h
>  create mode 100644 include/linux/mfd/mt6392/core.h
>  create mode 100644 include/linux/mfd/mt6392/registers.h
>  create mode 100644 include/linux/regulator/mt6392-regulator.h

MFD looks okay now.  How many more Acks do you need?

NB: This patch-set looks split in two in my inbox?

-- 
Lee Jones

