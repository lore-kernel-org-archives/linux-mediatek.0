Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760CBC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 21:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QghjhbLMc3lcG/Ng4wweRsZoIYvs+bzq6kVNdVKiPTE=; b=o//OUMTgl/FQ2d
	4Ia1+uZ9sLU+wNCqrDyqBQtXQ7mDSQGnuARhyyYgdyc/E+wpKBzDZdi5OtVWWqMxGuMsOvcjAt/+V
	FN+HhzALBiAw5M9+bhqWVR81/47ZL3h6WnQm4qyMFBsssp94O6pgTOKTQUeIUz8SjW9LDreDc8UQk
	q8LcBX/tD+h9xZwPSxDwUsNl0hOU41It/CgOegRtdUS1l9GWIuivK2+FhTkpx1HDq9LKnTOL9XQr3
	1m9GMpgKusCydtcU6vMHFJ5dO8A3D2BPPD1UmTcq07FPvmPw5PjFv7cwQ8buqCubvzjFo+QBlUtSB
	gcBe0wNZHCUP9XHyzF/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw9HC-00Cgws-DV; Tue, 31 May 2022 21:19:42 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw9Gx-00CgqV-AK; Tue, 31 May 2022 21:19:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: nfraprado)
	with ESMTPSA id C06CA1F43F0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654031966;
	bh=68k5y0jKYIIMSTFMtmsmSALMYTfSSep8zYGcyyvXciU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kB8pT4aFB5cbKdOyctjFzW6Hekmjw0u2cSQOLAshFZIQ0pRIK1muB9rFlcFy+4Yoc
	 vJvJMBOOwvWF5XZXf9M0ZFg8p+6rVT2ZynREraW+MyNrqlI7HxyG/38GYV8g5S0Qpt
	 wyMyBoiiYvZAzRMqvXaPnLiYgxEKFC6KahgxPsqaQVXffQ2t2OyZxtBma4piAMcRCJ
	 pa70jEWdaBl/3kLXdVRkPZIEWg6cro/JU1n6IBaTNbQOs3aiAHXML92nrTuDF4YPoi
	 WaCUyqnMxES1EOYtUjER5uKX655zDqtNhyxw8Kyq47+Eb0RRsEV/r9jZCPJ4WJjqjb
	 06xP+NOEp36zw==
Date: Tue, 31 May 2022 17:19:21 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, kernel@collabora.com,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1 0/2] MT8192 pinctrl properties adjustments
Message-ID: <20220531211921.uhdd2exxv2uhic6x@notapiano>
References: <20220525155714.1837360-1-nfraprado@collabora.com>
 <74a6159b-40d0-bbc3-5b4a-ebf6ed98bac7@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <74a6159b-40d0-bbc3-5b4a-ebf6ed98bac7@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_141927_525635_58ED5D37 
X-CRM114-Status: GOOD (  16.52  )
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

On Mon, May 30, 2022 at 10:34:19AM +0200, AngeloGioacchino Del Regno wrote:
> Il 25/05/22 17:57, N=EDcolas F. R. A. Prado ha scritto:
> > =

> > The two patches in this series substitute properties in the mt8192
> > pinctrl dt-binding for ones which have a clearer meaning and are more
> > standardized. At this point there's no DT using the mt8192 pinctrl
> > binding, so if such changes are to be made, they need to happen now.
> > =

> > =

> > N=EDcolas F. R. A. Prado (2):
> >    dt-bindings: pinctrl: mt8192: Add drive-strength-microamp
> >    dt-bindings: pinctrl: mt8192: Use generic bias instead of pull-*-adv
> > =

> >   .../bindings/pinctrl/pinctrl-mt8192.yaml      | 58 ++++++-------------
> >   1 file changed, 18 insertions(+), 40 deletions(-)
> > =

> =

> Hey Nic,
> =

> As you know, I definitely agree with these changes, but they don't deserve
> to get any Fixes tag: backporting should be useless in this case... and y=
ou
> anyway aren't fixing a faulty binding.

Alright, I was on the fence on this one, but I can drop the tags for v2.

Thanks,
N=EDcolas

> =

> Cheers!
> Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
