Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CFAC54E67
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Mar 2024 19:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1uIQtbPp+CdhubuPCR8B+S60vYrvvIp5BNWIA1Z6Gds=; b=gncpU/dTM9N4TjvYMI/eD01hSw
	+RlVulodwyYzrp1dT21YrDwWApGmBhOSZSB+SPsZzhG2b72NSOUH971gsPCI0ziLPbEzU7gzc+05K
	BH3/rxvdnoFSDFGA3WiERXEw+b3lIwDW/y8d7xxHFT3akHfI54N8vs16h9vfM9Bd/Te/8ygBuxdTk
	Cp1YDdSmOHyck7d6VZFhSbbHfdvwqssLwx5nm3lRw60c5j1riKK98ubF4up+5J4YiT0OnjkzYh44R
	6JrlqkUZf/Qwg8Cw/WNYYaV9+SW3plFXH59F6pbShbajfwlOM+79c07oC9VPCH8V2zHGx2445Ps+0
	owUpEfKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlvjl-000000067QI-0rHg;
	Sun, 17 Mar 2024 19:00:01 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlvjg-000000067Ot-31UI;
	Sun, 17 Mar 2024 18:59:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 197A1CE091B;
	Sun, 17 Mar 2024 18:59:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B5F8C43390;
	Sun, 17 Mar 2024 18:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710701991;
	bh=eEcx4nr4CbIEDZ73FBW/lYmpnu9poaFi2q+u8EJ46Mw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uL6wCL8Ds/PV2J7Sw0zzqkchTq9FMew+EtTF9D8//gRncfa7P6EwRlE7psDxtg7x9
	 XvdsaFN85nicMwInVJtjvtU4SAEAX9cqy13Aa7Ow4pnRMrwgw58iEthwsYFl6s9ep2
	 YDahoqi70EM1eNhbdPBhvorFq+QphWsZw43cXuVCL6RT87lWjYME9cNIeXzDuDVOOx
	 oYLk2gwWBC2FIcYLwxxA2pk21YwqZgvgHDUeGfzc80itB7uy9QH2LHOf4caLvJf5Ob
	 D0cIgK/SBSZMha3LLL0kZ7FzJ2n/xxcGUGtEEY2P9WDkycegXQTuzE6jtJCBjnkrWL
	 Ib/2x6KOC1yXw==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-56a2bb7d944so217086a12.3;
        Sun, 17 Mar 2024 11:59:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXYA4BopfpUIVEARRprkto72T8RpXgwCXQW/oTqsIr7D6YTA/4wRY4NG0yy0qGDYtjqEGkLQJ5Bqe0wGY4GkQPvo5LobZG5qlgQ9gY9ZOrMiU/x1nGr6Ay+3gYqjX9nJ+samFGDZP2YFke8KtotRVyBS37Wy2Bl43w=
X-Gm-Message-State: AOJu0YxUh9TJKguVQbRh3mrR9eO9+UvqkbOj+FAek6Bw/tAsAc++Wkmn
	wdf78yF68cKqzLhdUsAI51j1p3LJ+VjydR2inzC/8RsD7LHDr86RLgjBvOXScI7mXQnWOnsuPHn
	z1QLDRl3AbpeI85sF46vGADqmdA==
X-Google-Smtp-Source: AGHT+IHXmDQcoBpEG7P/jd72N8SjRsw/4nVttA2xS0/VB/Czg98Z6kMH1XdW6JGvB1L6zB1PG/og5ahKug3PnUqqfnM=
X-Received: by 2002:a05:6512:606:b0:513:cd77:4a88 with SMTP id
 b6-20020a056512060600b00513cd774a88mr6175517lfe.29.1710701969239; Sun, 17 Mar
 2024 11:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240313110147.1267793-1-angelogioacchino.delregno@collabora.com> <20240313110147.1267793-20-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240313110147.1267793-20-angelogioacchino.delregno@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Sun, 17 Mar 2024 12:58:58 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+zDc3vwAJHgWwSvauXr2-1NMbbznbj3v1PyMv+9UA5wA@mail.gmail.com>
Message-ID: <CAL_Jsq+zDc3vwAJHgWwSvauXr2-1NMbbznbj3v1PyMv+9UA5wA@mail.gmail.com>
Subject: Re: [PATCH v3 19/22] ASoC: dt-bindings: mt8192: Document
 audio-routing and dai-link subnode
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: broonie@kernel.org, wenst@chromium.org, lgirdwood@gmail.com, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com, 
	trevor.wu@mediatek.com, maso.huang@mediatek.com, 
	xiazhengqiao@huaqin.corp-partner.google.com, arnd@arndb.de, 
	kuninori.morimoto.gx@renesas.com, shraash@google.com, amergnat@baylibre.com, 
	nicolas.ferre@microchip.com, u.kleine-koenig@pengutronix.de, 
	dianders@chromium.org, frank.li@vivo.com, allen-kh.cheng@mediatek.com, 
	eugen.hristev@collabora.com, claudiu.beznea@tuxon.dev, 
	jarkko.nikula@bitmer.com, jiaxin.yu@mediatek.com, alpernebiyasak@gmail.com, 
	ckeepax@opensource.cirrus.com, zhourui@huaqin.corp-partner.google.com, 
	nfraprado@collabora.com, alsa-devel@alsa-project.org, 
	shane.chien@mediatek.com, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_115957_139523_B9C41145 
X-CRM114-Status: GOOD (  11.58  )
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

On Wed, Mar 13, 2024 at 5:02=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Document the dai-link subnodes and the audio-routing property, allowing
> to describe machine specific audio hardware and links in device tree.
>
> While at it, also deprecate the old properties which were previously
> used with the driver's partially hardcoded configuration.
>
> Also, since describing machine specific audio hardware and links replaces
> the now deprecated old logic doing the same in a driver hardcoded fashion=
,
> it is not allowed to have both the old and new properties together.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../sound/mt8192-mt6359-rt1015-rt5682.yaml    | 139 ++++++++++++++++--
>  1 file changed, 129 insertions(+), 10 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>

