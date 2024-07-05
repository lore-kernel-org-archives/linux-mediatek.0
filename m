Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42725C3271F
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 09:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=euAXj9/Zbt00wQcV3hScVKSy3ue4FmA12Ai4cuOhm7U=; b=zfrmuzDdP68RZUAAP8M8hfRS2C
	Ncw7032ahIWROITybVr6oiKWVFE7gFVzBcfjf4uuVFka1Y52p/I8EVXAbsyXW4JXgBOB17bxFTl3N
	yu0hqdjwSMr0h7J4492GvAi5qm7X8Nw/s9VwYHjoiK6x7E7r2LditOqDgtGWkPjmtR7mtl1V4/4qb
	xxXi2ROZbJt/JDLee723jOpoOkwXJlSyy3LcB3Ewfl43O9wjJEx1g3vr5N1ikirse4OmbtbmqlNtQ
	CIGnzHfzCwCQEcBOsNWANcYUChna30pov2yIIKHmDlAkbCL+Zrbeu03EZ8piErdrGgOTXvMChd5C2
	nliuAbTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfLz-0000000FT1n-3z2B;
	Fri, 05 Jul 2024 09:35:43 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfLw-0000000FSyI-3BIG
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Jul 2024 09:35:42 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-58b447c5112so1673134a12.3
        for <linux-mediatek@lists.infradead.org>; Fri, 05 Jul 2024 02:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720172139; x=1720776939; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=euAXj9/Zbt00wQcV3hScVKSy3ue4FmA12Ai4cuOhm7U=;
        b=ASEUIJ1nv4a1eXFjYMSW6/nbz11+gWtFmEV1lN+PPJ9H8eMK8TajZUf6MwNyb0oQqw
         XrROMqRHGVv57q4/IxizCIGr+GyFWxcudOclem9JV/srlyNeOX6XXfKUloGMUcu6esr+
         8pQWhhHzSQXbC6wvLkx+iunfykPPVloh41G1jtm65skMsuCnFvm7lQsrP3nZwVnbkdKI
         S7Uz0Xbd4n5AwZ9AwzgP/oGB5jds/SoTo1sbCKw6oVjHucHMa9WuNAhEFsKgqU9ufpw1
         re7ejAfNtDlrjxiWgoJI7hSVVfWAoRxMRY6DSI6tLiUHZ98wwMQrKdqzqYuMD3EsqtLN
         UfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720172139; x=1720776939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=euAXj9/Zbt00wQcV3hScVKSy3ue4FmA12Ai4cuOhm7U=;
        b=jRReJzp+SgLZf/2WTqre1IL1qYmWE7F2BjQB71otH1yB/v3fT37iKG2semNuE+AjI5
         lC+SgCQdZp9AmcMKJGST7Qs6qDmA3j64QupIRu2fIjMav29aQ0NkwZxEVt/MZI8lD9ND
         QS7k8LJ/KCRp9u+s5l/flQh5aWIaw1k22CskhP0D8dFPZHAhXxAlvjgBfeTdTBb3y6ma
         sOIkDK2ywSbCj9yggJXdgKsUZOrscG2OtePN7ijk3O+Ht4UHumB2aKdww2N8B9UXgWRM
         udh94NXt0TaOl2TbB6fN7d3Ws9TLH+XB3VcmJGktf1l3MhOujMMut9XZktadvkjCoTKZ
         INLw==
X-Forwarded-Encrypted: i=1; AJvYcCVeg4yqrc+Cg/Tx/QQml/8ozYoqJCh87VVxhvwTRHQ1rnLeyGCrZIQ67QCchcBzBfM9UC+9zNGhJFwnCDr0oPzOfrytRImT9eyVOTV9/sOr1JqY
X-Gm-Message-State: AOJu0YzPHS8+frErHoW1aOBbDVWresXPIqrVnclKl41+KiFAnJTRGxvA
	brNRi/m2M8PsmXRZycZLsMPgVpkJ30kyPftfbIAHQNo1T2Ief8pMn5uzoHbL/6rVCSbpX0L8rK1
	Dx1qMFE75JPn3TkMZP7MdV8jS6SuxkXfyf1cS3A==
X-Google-Smtp-Source: AGHT+IGJ8iQG2g8TrtDd3sj0/x1DvXY35ku2dMQviXNSW15txgM1PC4YZj/0UcvfS0C7PajOhp6AWzvAGJwxJW/rsBM=
X-Received: by 2002:a17:906:578b:b0:a72:b803:a1ac with SMTP id
 a640c23a62f3a-a77ba70a6f6mr243833466b.56.1720172138772; Fri, 05 Jul 2024
 02:35:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240704-add-mtk-isp-3-0-support-v5-0-bfccccc5ec21@baylibre.com>
 <20240704-add-mtk-isp-3-0-support-v5-1-bfccccc5ec21@baylibre.com>
 <20240704-catcall-stubbly-9258b056e42e@spud> <CAEHHSvb6Y8g_KCmu0bK__EP2TyPhf8i-ctMNfOGdyMUUGoKQVw@mail.gmail.com>
 <20240705-riding-overtime-642faba3dbbf@wendy>
In-Reply-To: <20240705-riding-overtime-642faba3dbbf@wendy>
From: Julien Stephan <jstephan@baylibre.com>
Date: Fri, 5 Jul 2024 11:35:27 +0200
Message-ID: <CAEHHSvZad9sSo+ubKdgwvdzjVz7mf9gqL551J+n831q+uoJOSA@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] dt-bindings: media: add mediatek ISP3.0 sensor interface
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Andy Hsieh <andy.hsieh@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Louis Kuo <louis.kuo@mediatek.com>, Phi-Bang Nguyen <pnguyen@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_023540_822635_9F4E265D 
X-CRM114-Status: GOOD (  35.13  )
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

Le ven. 5 juil. 2024 =C3=A0 11:24, Conor Dooley
<conor.dooley@microchip.com> a =C3=A9crit :
>
> On Fri, Jul 05, 2024 at 09:50:59AM +0200, Julien Stephan wrote:
> > Le jeu. 4 juil. 2024 =C3=A0 18:27, Conor Dooley <conor@kernel.org> a =
=C3=A9crit :
> > >
> > > On Thu, Jul 04, 2024 at 03:36:40PM +0200, Julien Stephan wrote:
> > > > From: Louis Kuo <louis.kuo@mediatek.com>
> > > >
> > > > This adds the bindings, for the mediatek ISP3.0 SENINF module embed=
ded in
> > > > some Mediatek SoC, such as the mt8365
> > > >
> > > > Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> > > > Signed-off-by: Phi-Bang Nguyen <pnguyen@baylibre.com>
> > > > Link: https://lore.kernel.org/r/20230807094940.329165-2-jstephan@ba=
ylibre.com
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > >
> > > I'm really confused by the link tag here. At first glance this looked
> > > like you were sending out something that had been applied by Laurent,
> > > given the Link, Rb and SoB from him. Why does he have a SoB on this
> > > patch? What did Phi-Bang Nguyen do with this patch, and should they h=
ave
> > > a Co-developed-by tag?
> >
> > I was not using b4 for the previous revisions of this series, so maybe
> > I messed something up here :(
>
> b4 am has an option to add a link to a patch you apply from the mailing
> list (-l, --add-link) but you should not be using that as a contributor.
> In this case, that link provides no value and is just confusing.
>
> > About Phi-Bang, this series has been in our internal tree for a long
> > time, and Phi-Bang has his SoB on it, so I kept it.
> >
> > About Laurent's tags, they were already on v4. But maybe it was an
> > error ? Should I remove them?
>
> They were also on v1. Did Laurent write part of these bindings, and
> should he have a Co-developed-by?
>

Got it! I understood where I messed up :)
I'll remove the link and add the Co-developed-by tag of Laurent

> > > > +additionalProperties: false
> > > > +
> > > > +if:
> > > > +  properties:
> > > > +    compatible:
> > > > +      contains:
> > > > +        const: mediatek,mt8365-seninf
> > >
> > > The binding supports only a single compatible, why is this complexity
> > > required? I don't see other devices being added in this series.
> >
> > Right. The idea is that the number of PHYs depends on the SoC. In the
> > previous revision of the series,
> > the number of PHYs was not fixed, and Krzysztof asked me to fix it by
> > SoC. So I wanted to make it clear
> > that the number of PHYs depends on SoC but maybe I don't need that
> > complexity for that?
> >
> > Is something like the following enough? And if complexity is added
> > later if some other SoC are added?
>
> Yes, that looks reasonable to me. Adding conditional stuff can be done
> iff another soc re-uses the binding.

Will do in the next series.
Thank you for your  feedback on this!

Cheers
Julien
>
> Thanks,
> Conor.
>
> >     phys:
> >       minItems: 2
> >       maxItems: 2
> >       description:
> >         phandle to the PHYs connected to CSI0/A, CSI1, CSI0B
> >
> >     phy-names:
> >       description:
> >         list of PHYs names
> >       minItems: 2
> >       maxItems: 2
> >       items:
> >         type: string
> >         enum:
> >           - csi0
> >           - csi1
> >           - csi0b
> >       uniqueItems: true

