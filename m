Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC4CC67861
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Apr 2024 16:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5FuW79ExhVaYHqCiZlpo/Zq84Y3dUcBVOYo1OkPc05Y=; b=zMhxgL0T8XUDc2nrvxV7VQYLq9
	LKRYdAoyV0kX3/J4TTMoZqgaMBndcGx/XpxFbkaEGhOenS5ZeksXsYkF6nE8dFukUb9rOKGzgS/Mz
	CxqEILUCdVzphhTmZKl8m8fIYGdQKvZD6Cixiaisa62s8yMKXAI6xLG81b81PoQzI6b1wStc9HBKq
	p7V5DFuczfnbpo9lW4BfGGs6Biwg4ngPsvY1AR7uoqX/4MKp6WcRyzdDhrVkm8jBDAZjfXqjpmySv
	6AQ9bGPpZH5I9uqpEI1FBrRWmfar02M52AAM8Peg0zdfX4yKrE/hRDJo1YgKERUqXV/WmlWTURQu9
	2v88m5vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsmCJ-00000007wtU-1R8X;
	Fri, 05 Apr 2024 16:13:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsmCF-00000007wrD-3TpX;
	Fri, 05 Apr 2024 16:13:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E9DED6120E;
	Fri,  5 Apr 2024 16:13:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDCE2C433F1;
	Fri,  5 Apr 2024 16:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712333622;
	bh=Q8DxPoGFwNt1vwUx+kL+4TrG1ntiPpirQuVvn+D6NKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SrsDaaZJEZNam0u270Lqu6ITF3tmsHbfl5xJzBiMP+xzKqRg3dW9jJzcFcKtlTeuf
	 /gwDGmvJJfEDAvIO0XBmb0KytS7+b/X3C9wPmxFqGEC3ddumLytl9WB1gewdhH+O1C
	 X11MjfDn9ssOtSnJXJF4G3ysSkWpqBEIHH6VCRWXr/qVbQmYFTqbYYp1iYGAW4EEml
	 ffaZdaGxwhRAZ7i3eiY1ArIdlfsmCZOES1t8uQifZbRKvsRClf4qLKK3ivwhFYQn/Q
	 t/ZsB8JXwcSbDWZuUB1Wua9pSKwuayucxVll6yPrdUTZGdVQdzWuR3qfdLtWOJtCR3
	 PgS/O2g3G1BtA==
Date: Fri, 5 Apr 2024 17:13:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	Houlong Wei =?utf-8?B?KOmtj+WOmum+mSk=?= <houlong.wei@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Shawn Sung =?utf-8?B?KOWui+WtneismSk=?= <Shawn.Sung@mediatek.com>,
	CK Hu =?utf-8?B?KOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v5 02/10] dt-bindings: mailbox: Add mboxes property for
 CMDQ secure driver
Message-ID: <20240405-remindful-galley-2dee9eec4f34@spud>
References: <20240403102602.32155-1-shawn.sung@mediatek.com>
 <20240403102602.32155-3-shawn.sung@mediatek.com>
 <20240403-conflict-detest-717b4175a00c@spud>
 <9b9707a4a0e285a12741fe4140680ad2578d8d2b.camel@mediatek.com>
 <20240404-lankiness-devouring-d4d012b22cb9@spud>
 <e6a30feb1e4bb41c90df5e0272385d0f47a7dcab.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Q/1d7/5euK6JVvYU"
Content-Disposition: inline
In-Reply-To: <e6a30feb1e4bb41c90df5e0272385d0f47a7dcab.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_091344_015593_201CE008 
X-CRM114-Status: GOOD (  49.88  )
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


--Q/1d7/5euK6JVvYU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 05, 2024 at 02:33:14PM +0000, Jason-JH Lin (=E6=9E=97=E7=9D=BF=
=E7=A5=A5) wrote:
> On Thu, 2024-04-04 at 15:52 +0100, Conor Dooley wrote:
> > On Thu, Apr 04, 2024 at 04:31:06AM +0000, Jason-JH Lin (=E6=9E=97=E7=9D=
=BF=E7=A5=A5) wrote:
> > > Hi Conor,
> > >=20
> > > Thanks for the reviews.
> > >=20
> > > On Wed, 2024-04-03 at 16:46 +0100, Conor Dooley wrote:
> > > > On Wed, Apr 03, 2024 at 06:25:54PM +0800, Shawn Sung wrote:
> > > > > From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
> > > > >=20
> > > > > Add mboxes to define a GCE loopping thread as a secure irq
> > > > > handler.
> > > > > This property is only required if CMDQ secure driver is
> > > > > supported.
> > > > >=20
> > > > > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> > > > > Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> > > > > ---
> > > > >  .../bindings/mailbox/mediatek,gce-mailbox.yaml         | 10
> > > > > ++++++++++
> > > > >  1 file changed, 10 insertions(+)
> > > > >=20
> > > > > diff --git
> > > > > a/Documentation/devicetree/bindings/mailbox/mediatek,gce-
> > > > > mailbox.yaml
> > > > > b/Documentation/devicetree/bindings/mailbox/mediatek,gce-
> > > > > mailbox.yaml
> > > > > index cef9d76013985..c0d80cc770899 100644
> > > > > --- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-
> > > > > mailbox.yaml
> > > > > +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-
> > > > > mailbox.yaml
> > > > > @@ -49,6 +49,16 @@ properties:
> > > > >      items:
> > > > >        - const: gce
> > > > > =20
> > > > > +  mediatek,gce-events:
> > > > > +    description:
> > > > > +      The event id which is mapping to the specific hardware
> > > > > event
> > > > > signal
> > > > > +      to gce. The event id is defined in the gce header
> > > > > +      include/dt-bindings/gce/<chip>-gce.h of each chips.
> > > >=20
> > > > Missing any info here about when this should be used, hint - you
> > > > have
> > > > it
> > > > in the commit message.
> > > >=20
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32-arrayi
> > > >=20
> > > > Why is the ID used by the CMDQ service not fixed for each SoC?
> > > >=20
> > >=20
> > > I forgot to sync with Shawn about this:
> > > https://lore.kernel.org/all/20240124011459.12204-1-jason-
> > > jh.lin@mediatek.com
> > >=20
> > > I'll fix it at the next version.
> >=20
> > When I say "fixed" I don't mean "this is wrong, please fix it", I
> > mean
> > "why is the value not static for a particular SoC". This needs to be
> > explained in the patch (and the description for the event here needs
> > to
> > explain what the gce-mailbox is reserving an event for).
> >=20
> Oh, I see. Thanks for noticing me.
>=20
> We do want to reserve a static event ID for gce-mailbox to different
> SoCs. There are 2 mainly reasons to why we set it in DTS:
> 1. There are 1024 events IDs for GCE to use to execute instructions in
> the specific event happened. These events could be signaled by HW or SW
> and their value would be different in different SoC because of HW event
> IDs distribution range from 0 to 1023.
> If we set a static event ID: 855 for mt8188, it might be conflict the
> event ID original set in mt8195.

That's not a problem, we have compatibles for this purpose.

> 2. If we defined the event ID in DTS, we might know how many SW or HW
> event IDs are used.
> If someone wants to use a new event ID for a new feature, they could
> find out the used event IDs in DTS easily and avoid the event ID
> conflicting.

Are the event IDs not documented in the reference manual for the SoC in
question? Or in documentation for the secure world for these devices? A
DTS should not be the authoritive source for this information for
developers.

Additionally, the driver could very easily detect if someone does happen
to put in the reserved ID. That could be generically useful (IOW, check
all of them for re-use) if the ID are to not allowed to be shared.

> The reason why we define a event ID is we want to get a SW signal from
> secure world. We design a GCE looping thread in gce-mailbox driver to
> wait for the GCE execute done event for each cmdq secure packets from
> secure world.

This sort of information needs to be in the commit message, but I don't
think this property is needed at all since it seems to be something
detectable from the compatible.

--Q/1d7/5euK6JVvYU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhAjMQAKCRB4tDGHoIJi
0g9NAPsHTqr3FpCqnixCtTXtxW69Xrc2gEnNIQPw1BJYSwFYigD/dCkJ0WhN+ox9
Bo19dT70y5DIOhKbgSd1tK3mieXUxgo=
=/DXl
-----END PGP SIGNATURE-----

--Q/1d7/5euK6JVvYU--

