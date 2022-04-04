Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63A6C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Apr 2022 16:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xHhBNOq4JaGeqp6rWOA64hGufJ4JrReV77+8PgTwKiQ=; b=PqwSyV6Unh26pk
	iMFcBz24OmUPICsvqe9gKGPFczTtDEyFc3OD7TS3Npal3VSFGXzgSsZOcTK7W3QM9ODMSFhvuBeri
	SpltwEtukRtBOeLWSAwGVl2HnO/1D3926X3Eoo8gu8owvicCQPEB83lwfdG2J9bMknkNDhX4xGl0r
	yaEOOGfKjLBfJP9/clhuvtTnkIzzfcJj2lVgrj8mn9IQ0hPynRSPuJvcorKG5as0Vr2ACc/7RMPFT
	XBG+FH/n3/VkIQDGS/3aRUplnzKIGWP9E3ElwufKMqusc/nQIzwRvl+7GADVdVWxN4g2oB9MIkCUu
	OMjMOiIQ+ZVz6Av5CLwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbPBC-00Fh4A-Ms; Mon, 04 Apr 2022 16:03:46 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbP9p-00FgGL-OV; Mon, 04 Apr 2022 16:02:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id E45601F44731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649088140;
 bh=gXcTJN1wEbSuuha2o6PaxF2kCOHsWvsU4lW7wKZ/EhY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mIc5+GBU1VqyZ/IpAbIWiWDuHKZXEFZoZH2h/calTdrlh563WgQ6khtwNaWt4HrJ5
 noocOP+D1uVlFkkZ/D2ku2pgiYZEyJSO17BBcdEeSQ+7bzH3bP9zGCsWxQTqM/qufj
 BB1mNE37AKrgLb6lpHhrp75cl2xgQKAeO1cD9/1gamlzIMiMiJj818OwgMLCP1MnWp
 A+xfDaqUhaL+B5fwWXjYL7x2RAiOB4zNIWMi8kzvayptQzVj3MfH6YHdCpXwFkgUMh
 KmfUCMLMLzzr7aFN3qFlsFVSgdRP61LmmLplFSIN8Yghg33HV6eR/XSGDwADdMgU5O
 jIA1eAZdKHhxw==
Date: Mon, 4 Apr 2022 12:02:14 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v1 0/4] dt-bindings: pinctrl: mt8192: Add missing
 wrapping node and properties
Message-ID: <20220404160214.w6wypnq3b6hfriub@notapiano>
References: <20220315211936.442708-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220315211936.442708-1-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_090221_976365_F575275F 
X-CRM114-Status: GOOD (  12.09  )
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

Hi Matthias,

If you could please also pick this series through your tree that would be g=
reat
:).

This would preemptively fix warnings for my mt8192-asurada.dtsi series [1].

[1] https://lore.kernel.org/all/20220316151327.564214-1-nfraprado@collabora=
.com/

Thanks,
N=EDcolas

On Tue, Mar 15, 2022 at 05:19:32PM -0400, N=EDcolas F. R. A. Prado wrote:
> =

> This series adds the wrapping node for pinmux nodes that was missing in
> the mt8192-pinctrl dt-binding as well as a couple other missing
> properties.
> =

> =

> N=EDcolas F. R. A. Prado (4):
>   dt-bindings: pinctrl: mt8192: Add wrapping node for pin configurations
>   dt-bindings: pinctrl: mt8192: Add mediatek,drive-strength-adv property
>   dt-bindings: pinctrl: mt8192: Add mediatek,pull-up-adv property
>   dt-bindings: pinctrl: mt8192: Add gpio-line-names property
> =

>  .../bindings/pinctrl/pinctrl-mt8192.yaml      | 155 +++++++++++-------
>  1 file changed, 98 insertions(+), 57 deletions(-)
> =

> -- =

> 2.35.1
> =

> =

> -- =

> To unsubscribe, send mail to kernel-unsubscribe@lists.collabora.co.uk.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
