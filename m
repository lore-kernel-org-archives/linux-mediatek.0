Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14215C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 May 2022 18:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=epYwqUVIA/LBt/KrnwJGdUFY3oAvprWES8h19pJfViI=; b=XgrJbwG1JVXFTr
	HUE9n9Xfpwps7OmuB3N+YWjicTwOfQYGJkuXemC27wonFm5/UcEUXA0HjBN7vtaGrpscV0HzvC2Q2
	r1p05Ht//qWxs95uiu2if+PM7/8Tn8LM7Dh4CHCfR/ulXWLdgkjKb3MlJhAEb13Fprc73apDP6SE1
	jxNkecHCuXDLVMr7aOZIZKxweYPZCcv+6mJl0KtpyD7MXmnfdhBElHlC9d4fKfAOX+jO6H/RcmM5f
	9AD9nm1nRkz1mi0CZ4xsMitFDCaq7f6Fq8LuWHaY6DHEqCok/trjAMg0hRipQfbQMFSEE4CBc/9TI
	KQ9tseznbXOcptUImxxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlatY-002Dqm-Nb; Mon, 02 May 2022 18:35:40 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlatN-002DnA-DO; Mon, 02 May 2022 18:35:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id B8F721F42914
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651516528;
 bh=LNAKoERXNkxOChEkjc56ibMMeMeZRDZq9ArNo0Yf64k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SE1XcgI7Tnd9jrUCWIe+kKGkeveMBSkqfnpzeAxST784bFE4NvXBGVyKtmVTzFQKr
 mpDOuBivzwO3rCkE+y73S6y4rOFyfFJcopT3rZD+7KKBew/QrHsYvAA63H6swWp+iA
 yvm0b7qr6NCBM+H2arXbXISocgeMcw8XvDbH9LeiZbYIPsH0alUlCCKuw21bW3+etY
 gApJ0l9e0G42MnJ4bN1QykoDF04L2CJT45frtB/qiEWKxx6stsS0KFkkd5LX7QTyPL
 2U/yOkW78IG3fL0m/O7SLSgjUtBCMB6k2mBHuBqHJ2Ja89f7pF7B0JBG+POMq0q4qC
 9vw5h2ft9f1Yw==
Date: Mon, 2 May 2022 14:35:23 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: remoteproc: mediatek: Add optional
 memory-region to mtk,scp
Message-ID: <20220502183523.tfrai4wndzhlvjq5@notapiano>
References: <20220429211111.2214119-1-nfraprado@collabora.com>
 <20220429211111.2214119-3-nfraprado@collabora.com>
 <YnAA+7eqP/WzGrhQ@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YnAA+7eqP/WzGrhQ@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_113529_623401_249C990F 
X-CRM114-Status: GOOD (  17.84  )
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

On Mon, May 02, 2022 at 11:04:11AM -0500, Rob Herring wrote:
> On Fri, Apr 29, 2022 at 05:11:10PM -0400, N=EDcolas F. R. A. Prado wrote:
> > The SCP co-processor can optionally be passed a reserved memory region
> > to use. Add this property in the dt-binding.
> > =

> > Signed-off-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
> > ---
> > =

> >  Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> > =

> > diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml =
b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> > index ec9ddeb6ca2c..64a9d2c7ed0d 100644
> > --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> > +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> > @@ -51,6 +51,10 @@ properties:
> >    interrupts:
> >      maxItems: 1
> >  =

> > +  memory-region:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> =

> memory-region has a type already, so drop. What's needed is how many =

> entries and what they are if more than 1.

Hi Rob,

OK, didn't notice this common property was already documented elsewhere. In=
 that
case I'll also drop the description since it's only 1.

Thanks,
N=EDcolas

> =

> > +    description: phandle to reserved memory region.
> > +
> >  required:
> >    - compatible
> >    - reg
> > -- =

> > 2.36.0
> > =

> > =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
