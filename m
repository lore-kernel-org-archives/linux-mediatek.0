Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1650EC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 21:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5TFshhwBEzKbmS30dbz+EBJ9DGxZl1mTE8tLMqBwmF0=; b=DIc/slCjhvxN41
	UoUTk6vuGxesyM3SI9tdGhwJ6xXY5BVY26lSixat62i5q8rQhpJnDJ+jWBwgHlUL/ih8YHwl/cEFB
	zB00dBJl1YLfFxgUAHFjDjfVJswJpORU+CaK1KRzs0gr7onGuAGq6fG4g7M0sk/THLzUNG9AncNgi
	JX5pc5okn/avbtbbfEjJLnS1D4UI7oTCKw/kzctmOF84kAYC8MUfXPkZ1Ej4a2RWQvDEkC+nSjKcN
	kcEblsGXe+9faUrU1eX5aPUBT4uQKrKGyq1VNr1TYOZUYtoUrcxS1EkWbqcLlkEH0BnWKKVchawkF
	9NYKEiUJdzpowfre0UkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw9EE-00CgQ7-VN; Tue, 31 May 2022 21:16:38 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw9E3-00CgOs-5a; Tue, 31 May 2022 21:16:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: nfraprado)
	with ESMTPSA id E80101F43EB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654031781;
	bh=8X/Ojz+FGTuRQ5jA25wjSSQqOhrJ7O4PjLJxLYdEHMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C5pk1xLlV2Cr1FAMqGFilb/Mdlt3WOE36NolfY4TAmFMku/oWkJf7HgczZZRWt1tO
	 ZlE97EuEn+7QBXGj+DbRrOmZVeg2oD8UG7kUmpiHYq1wMCShpc5aMPGum17UILhIZJ
	 24qi0I2KwfZbHsq9+ui2+Y1ABYz7bxV+ynajL+XXwIKTJoJYPWzDc8NlfvmsLfF3H5
	 NdYU4oFMOnAtvS2q0F1lObyhM/AzRd+5Wf5Khmq9735dYtfrDkSHirsk4McWvmQt+r
	 aVy40nL/72wqdLolmjgKtECxrSzz1raE6ClsihfFPVqr+KOQBCDQCa5pSVz3Ms94wD
	 szS+ElZvXeRZg==
Date: Tue, 31 May 2022 17:16:16 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1 1/2] dt-bindings: pinctrl: mt8192: Add
 drive-strength-microamp
Message-ID: <20220531211616.vq73g6r4vrxxahqe@notapiano>
References: <20220525155714.1837360-1-nfraprado@collabora.com>
 <20220525155714.1837360-2-nfraprado@collabora.com>
 <CAGXv+5FRAvJpn-Nz08NLzqj+X+-yXLx6w-Bz7qa9g8Ct5xTNYg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGXv+5FRAvJpn-Nz08NLzqj+X+-yXLx6w-Bz7qa9g8Ct5xTNYg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_141627_383865_3FE17F2B 
X-CRM114-Status: GOOD (  17.95  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 30, 2022 at 04:48:51PM +0800, Chen-Yu Tsai wrote:
> On Wed, May 25, 2022 at 11:58 PM N=EDcolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
> >
> > Commit e5fabbe43f3f ("pinctrl: mediatek: paris: Support generic
> > PIN_CONFIG_DRIVE_STRENGTH_UA") added support for using
> > drive-strength-microamp instead of mediatek,drive-strength-adv.
> >
> > Since there aren't any users of mediatek,drive-strength-adv on mt8192
> > yet, remove this property and add drive-strength-microamp in its place,
> > which has a clearer meaning.
> =

> Cool! Thanks for taking care of this~ I was looking at this and tried
> to make drive-strength and drive-strength-microamp mutually exclusive,
> but since they are optional, it didn't really work, and I put it on the
> back burner.

I didn't think of enforcing the properties to be mutually exclusive in the
dt-binding, but that is indeed a good idea. After a bit of head-scratching =
seems
like it is possible although unintuitive (by using 'required' inside the if
block). I'll send a v2 with this restriction added, and the same thing for =
patch
2, since bias-pull-up/down also shouldn't be used together with bias-disabl=
e.

Thanks,
N=EDcolas

> =

> =

> ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
