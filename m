Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12E5C30658
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 09:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CsnKKfoqyK2A5HU8vBu354UlV5krTU6DfwXD+4cLA2U=; b=HsIV1ya17zOepk97J1/pS9+2aS
	oUNHjgzo+JZDx0v9QnwFKGouaUIg0x6LIMpClnM8bf92HzFwpbY/K+uvVZHQ0awosp9RcUWsDT+Dl
	m4PaDLQ2PD/KedDjMpGz3V+9eu7+IlA9wQRBO3+MftaFBgOxn+7JzScCGZktICcJy20Fmt1GZmy/s
	LM8mATQc/yaud3vBAHlFgOr1ZTPmGC87ugkGnFhCj6LEbkSFH7pC/FGd5zVWtCBX9oEJY4CFjHwk0
	zTjxdkk8n+vSU7ZktbYEN5Yu5m3+sjfR/uGccJQZNuU04ZBK66qu6DkktPjcoCrnC8JX6DV98wBR6
	0YqGXSIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfBY-0000000FR92-1GUL;
	Fri, 05 Jul 2024 09:24:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfBV-0000000FR8W-0UqV;
	Fri, 05 Jul 2024 09:24:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1720171493; x=1751707493;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IpzYlcLyGZggZz37P8C2WpNn+1o1JR+g5xfz2xJPw88=;
  b=YRpYZfYYA7h6UymUch26jwIOATaozbzGjAF+cd5NtsOhN7iqIZmSGtTE
   UDQw393qselBbhO/cYkFuz8vUzUO4qhBO+cmhKO5k8sPBtbsOZ6tzXkbF
   nEZfkQPo6SyXtZOraSQjksgqBtKCqADKRC6atvbnZ4fg2bnwsiayCAeqx
   xXNs8/0mHrN5+JgUvroKKH6TuThLl43Nm6DnhF39rqSnRwHuqyxZzjvB9
   JK785wzAp5lxtcJs8BPnU0XaJzA/efOjt+l/KUZN2nqnSut6lPivmdNmL
   G7+pymZZZ2ZHYhb0MxJVNkkGjZq8hn2ppii6Nqxf4bqjZ25k1j2UM6Ied
   Q==;
X-CSE-ConnectionGUID: Yn65gHikT7axoCy5KcB3PQ==
X-CSE-MsgGUID: 4/jZXMxxQ8uDQgruNOjggA==
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="asc'?scan'208";a="31512592"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Jul 2024 02:24:48 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Jul 2024 02:24:15 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 5 Jul 2024 02:24:13 -0700
Date: Fri, 5 Jul 2024 10:23:52 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Julien Stephan <jstephan@baylibre.com>
CC: Conor Dooley <conor@kernel.org>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Andy Hsieh <andy.hsieh@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Louis Kuo <louis.kuo@mediatek.com>, Phi-Bang Nguyen <pnguyen@baylibre.com>
Subject: Re: [PATCH v5 1/5] dt-bindings: media: add mediatek ISP3.0 sensor
 interface
Message-ID: <20240705-riding-overtime-642faba3dbbf@wendy>
References: <20240704-add-mtk-isp-3-0-support-v5-0-bfccccc5ec21@baylibre.com>
 <20240704-add-mtk-isp-3-0-support-v5-1-bfccccc5ec21@baylibre.com>
 <20240704-catcall-stubbly-9258b056e42e@spud>
 <CAEHHSvb6Y8g_KCmu0bK__EP2TyPhf8i-ctMNfOGdyMUUGoKQVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PEGn/ECUutpW8XYs"
Content-Disposition: inline
In-Reply-To: <CAEHHSvb6Y8g_KCmu0bK__EP2TyPhf8i-ctMNfOGdyMUUGoKQVw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_022453_262171_4AF44CC1 
X-CRM114-Status: GOOD (  30.13  )
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

--PEGn/ECUutpW8XYs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 05, 2024 at 09:50:59AM +0200, Julien Stephan wrote:
> Le jeu. 4 juil. 2024 =E0 18:27, Conor Dooley <conor@kernel.org> a =E9crit=
 :
> >
> > On Thu, Jul 04, 2024 at 03:36:40PM +0200, Julien Stephan wrote:
> > > From: Louis Kuo <louis.kuo@mediatek.com>
> > >
> > > This adds the bindings, for the mediatek ISP3.0 SENINF module embedde=
d in
> > > some Mediatek SoC, such as the mt8365
> > >
> > > Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> > > Signed-off-by: Phi-Bang Nguyen <pnguyen@baylibre.com>
> > > Link: https://lore.kernel.org/r/20230807094940.329165-2-jstephan@bayl=
ibre.com
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> >
> > I'm really confused by the link tag here. At first glance this looked
> > like you were sending out something that had been applied by Laurent,
> > given the Link, Rb and SoB from him. Why does he have a SoB on this
> > patch? What did Phi-Bang Nguyen do with this patch, and should they have
> > a Co-developed-by tag?
>=20
> I was not using b4 for the previous revisions of this series, so maybe
> I messed something up here :(

b4 am has an option to add a link to a patch you apply from the mailing
list (-l, --add-link) but you should not be using that as a contributor.
In this case, that link provides no value and is just confusing.

> About Phi-Bang, this series has been in our internal tree for a long
> time, and Phi-Bang has his SoB on it, so I kept it.
>=20
> About Laurent's tags, they were already on v4. But maybe it was an
> error ? Should I remove them?

They were also on v1. Did Laurent write part of these bindings, and
should he have a Co-developed-by?

> > > +additionalProperties: false
> > > +
> > > +if:
> > > +  properties:
> > > +    compatible:
> > > +      contains:
> > > +        const: mediatek,mt8365-seninf
> >
> > The binding supports only a single compatible, why is this complexity
> > required? I don't see other devices being added in this series.
>=20
> Right. The idea is that the number of PHYs depends on the SoC. In the
> previous revision of the series,
> the number of PHYs was not fixed, and Krzysztof asked me to fix it by
> SoC. So I wanted to make it clear
> that the number of PHYs depends on SoC but maybe I don't need that
> complexity for that?
>=20
> Is something like the following enough? And if complexity is added
> later if some other SoC are added?

Yes, that looks reasonable to me. Adding conditional stuff can be done
iff another soc re-uses the binding.

Thanks,
Conor.

>     phys:
>       minItems: 2
>       maxItems: 2
>       description:
>         phandle to the PHYs connected to CSI0/A, CSI1, CSI0B
>=20
>     phy-names:
>       description:
>         list of PHYs names
>       minItems: 2
>       maxItems: 2
>       items:
>         type: string
>         enum:
>           - csi0
>           - csi1
>           - csi0b
>       uniqueItems: true

--PEGn/ECUutpW8XYs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoe7qAAKCRB4tDGHoIJi
0odFAQCqSuKOC6xxTTtCAhTTnqB1QzwpVY7IpRWZIyMf2ypITQEAhhOyvYTb2vfL
J5TietI11/9desdP1qsxIOxlj8iUcwU=
=Oeen
-----END PGP SIGNATURE-----

--PEGn/ECUutpW8XYs--

