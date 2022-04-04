Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E942AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Apr 2022 15:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oQzVcCtAcCtXEk0bytDz7UBR4sCXSkcLj2cKRoMZ8Sw=; b=I9uFJ5gJg9BXv1
	byTSup1kyaZ6H209XKoBPHozpKPOtrVMsNn1c3iFJtdIvJ95831RBeU15CE+MGGx6PS2xCJGfTX5i
	bc+RU6GI+hWy8jg4LD6Abv9sSb891w0LxhRiwJRiiDeJWfhtU5zfMnkGojOJIpox3LqKn7lf7s9fr
	b0aszw5Dk8P8d1/kmgCJ5GeTwloBUT3/V878Wh16/h8D9Us1PpbJJ6ML5YNZuIbnkFg4Psg721UlH
	qjRiz1CsRjqf8SN/kF9375WQB/SpuPLnQ/X/BDloOI17XUjkDDiGdgATDfNYNrfrQzWkUGPkB6pGH
	R5yckoTiQtXzhzFK9vHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbOY3-00FXZ3-T5; Mon, 04 Apr 2022 15:23:19 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbOXs-00FXVH-Lo; Mon, 04 Apr 2022 15:23:10 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id BB1741F44DDE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649085782;
 bh=qbJezh9FVSlhATk9a76wow3aDuv/GZNqoYfnfWao4EU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R7qKfLTC3UmDAuTrk7Sdcc/sJ1Lpxi0Ca5GwE67PS2YO22fgBBcDd0D7TpqZadE8o
 XGDCbTylFJGGnGuT2B1b5F0SyoKVcubPoi/pJOq0/9RPpumwbMmIHknuX6MErUo7PQ
 sLZZIzPmq2//Lu3qhFR4NxGCkryoWI+uzVu0NcE3TZGh/MYJqcAB1A4V4naOrLYoJ0
 byW0eSj7opuZOsNgMm1+mAPtiplmrzw0nErUW0A6B93An+DljdSfvKGtMStmEi+3oU
 XDuDd/hThpRzIbLLMZ3QmMcuh7bvAhDzkh5daBThqVAzEh1FGIbuMa8i2qNTUN1d5j
 SPd2y3bEPXEmg==
Date: Mon, 4 Apr 2022 11:22:56 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-remoteproc@vger.kernel.org, linux-usb@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v1 0/3] Fixes for Mediatek dt-bindings
Message-ID: <20220404152256.mkksr4oqjt65ytlf@notapiano>
References: <20220225225854.81038-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220225225854.81038-1-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_082308_869679_D8181D08 
X-CRM114-Status: GOOD (  15.17  )
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

Maybe you could pick this series through your tree? It addresses some dtc
warnings that are introduced with the new nodes in mt8192.dtsi that you just
picked up on your v5.18-next/dts64 branch.

Thanks,
N=EDcolas

On Fri, Feb 25, 2022 at 05:58:51PM -0500, N=EDcolas F. R. A. Prado wrote:
> =

> This series has some fixes for Mediatek dt-bindings. It solves some
> warnings printed by dtbs_check, both for already merged Devicetrees, as
> well as some that would be introduced by the changes to mt8192.dtsi in
> [1].
> =

> [1] https://lore.kernel.org/all/20220218091633.9368-1-allen-kh.cheng@medi=
atek.com/
> =

> =

> N=EDcolas F. R. A. Prado (3):
>   dt-bindings: remoteproc: mediatek: Add interrupts property to mtk,scp
>   dt-bindings: usb: mtk-xhci: Allow wakeup interrupt-names to be
>     optional
>   media: dt-bindings: mtk-vcodec-encoder: Add power-domains property
> =

>  .../devicetree/bindings/media/mediatek,vcodec-encoder.yaml     | 3 +++
>  Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml      | 3 +++
>  Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml   | 1 +
>  3 files changed, 7 insertions(+)
> =

> -- =

> 2.35.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
