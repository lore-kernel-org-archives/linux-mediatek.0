Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD95C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 17:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ErHMSwdaiJ/JKmiLBWReEz08isktKSUXzVv/z82V8M8=; b=Nktw5kJygcalOZ
	Wegz55xCA2gAo1mzvkIHEMB3N8N6yVfJmvzcDohOYX14Wv/a9jLOoEigXNjZRopGHcigQHzF0FPrs
	0xBKczLSaOx2KeSpaVqKyP3nezFyBXjuRZtEABxe3+76hoUH8NwgQmfourO7rHlPagQ3AhmOHegkz
	sKJbahKO3Q5lqurlC6z65Wt2N35T758hfViwaz+71+eW0ghyelGmvefDAGNC2SUDv/C4VAEg3jhE5
	6W8rU6RpLy30L07VbopzQO3EcOCUfUQZ/Ay5qep1SKNeubdL2gs4MF048flBERlAaixZZSUNbDp5E
	x8stRE+lTNMsKpPh2iYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlwnm-00772j-Dm; Tue, 03 May 2022 17:59:10 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlwnb-0076zW-9e; Tue, 03 May 2022 17:59:00 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 21D721F444FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651600732;
 bh=7qeurYzZslyi92N7K5GArfwgsQTF+nE6W05wCQTva6g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KE3YCHnds6v61AHs797rcMxewdX/sIbzN30yeH2p3JVFqHeQHknJxi9OKbV6GF2VQ
 rv1NRCEazWRyygqG8BFNQz7eko9yQwa3q4nJCkg63kpOq4MrPu/4h4H71V4eDGLypB
 VSTqFlZE0yhMWQmsq3ZU8HaFB3Mw3SNZ1kLJpYiOl6i1OctOClXfpdyCfQmFvN/pcJ
 /+2v6IA2oOeJ1mXX8CrVN+ok0AIR1YYuOSeFtO5WIXDukZlo8fSvq99hKp/6YzNkXe
 UG1bklTUiYvZLcIvF+6ZX7DDRyts0Q0Frto1rgPA84ma0eSLFdp0uKVCRV6exJxQc5
 ZpaF5oqb4rusA==
Date: Tue, 3 May 2022 13:58:46 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Tinghan Shen <tinghan.shen@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: mediatek: Fix optional
 reg-names for mtk,scp
Message-ID: <20220503175846.pth5px74fzirizep@notapiano>
References: <20220429211111.2214119-1-nfraprado@collabora.com>
 <20220429211111.2214119-2-nfraprado@collabora.com>
 <a95fc4a9-af6b-e2c2-ef41-df9742d393de@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a95fc4a9-af6b-e2c2-ef41-df9742d393de@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_105859_493543_9B87EE79 
X-CRM114-Status: GOOD (  20.34  )
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

On Tue, May 03, 2022 at 02:19:39PM +0200, Krzysztof Kozlowski wrote:
> On 29/04/2022 23:11, N=EDcolas F. R. A. Prado wrote:
> > The SCP has three memory regions: sram, l1tcm and cfg. Only sram is
> > required, the other two are optional. Fix the dt-binding so that the
> > optional regions can be omitted and passed in any order.
> =

> No, cannot be passed in any order.
> =

> > =

> > Also add the missing minItems to the reg property and update the
> > description.
> > =

> > Signed-off-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
> > =

> > ---
> > =

> >  .../devicetree/bindings/remoteproc/mtk,scp.yaml      | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> > =

> > diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml =
b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> > index 823a236242de..ec9ddeb6ca2c 100644
> > --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> > +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> > @@ -24,14 +24,20 @@ properties:
> >    reg:
> >      description:
> >        Should contain the address ranges for memory regions SRAM, CFG, =
and
> > -      L1TCM.
> > +      L1TCM. Only SRAM is required, while CFG and L1TCM are optional.
> > +    minItems: 1
> >      maxItems: 3
> >  =

> >    reg-names:
> > +    minItems: 1
> >      items:
> >        - const: sram
> > -      - const: cfg
> > -      - const: l1tcm
> > +      - enum:
> > +          - l1tcm
> > +          - cfg
> > +      - enum:
> > +          - l1tcm
> > +          - cfg
> =

> This allows them in any combination which is not what we want. If both
> are optional and both can appear, then last should be a const:l1tcm.

Hi Krzysztof,

yes, that's the case. I'll update it in v3 then.

Thanks,
N=EDcolas

> =

> Best regards,
> Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
