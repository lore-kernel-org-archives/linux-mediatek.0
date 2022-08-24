Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B82C04AA5
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Aug 2022 20:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Message-Id:Date:Subject:Mime-Version:From:
	Content-Transfer-Encoding:Content-Type:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bS9tansBU/mS+uLByVfBLtD82ZsrEu9pPMJgjJjQdUo=; b=xQjcmNWP72VDa22kJLsKnC7tGW
	OMocBGXQ81oENYnYPmeL0OT54U4x4Y0EH3jxLpVDmXhK444o5so/1yPB1MY37eghKw4sgu3doAzr+
	tL4fR9u0IFZmd+XBsTEZF8g44EMb7735qii0Bw/QUY8FPwju5yQqLFpzctcU1FvEeTGu+7KTVfsy+
	YzrWzQqmTOsiCKjR0flIi4FXRtauZbNtxe/H9yllhAm+EPUVV5Nr9QG7WoIwq+awhpSMDhyLu2qbR
	PkG6DdshvJIkN9knIwF8kiEmbSAEyrhlpVf3feZtEOD+sB4oM6IhRP28XrsLBg3aGYlpztKlMAShD
	8kOs1Pxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQwgg-00GKFr-1n; Wed, 24 Aug 2022 20:09:18 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQwgc-00GK7R-Kh; Wed, 24 Aug 2022 20:09:15 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1661371731; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XgjFwLYa7IBedppKBr0lLTdnZbp/TPpl8VwTvpe3PsAd2sv2DCzAKEd2AJax31Iex4F+WMiZSX/uz7zNE0HzIjRe7nDzgtVaiH+hgPJ3xBVogMm6HtxcOtHjGeTDFoYAfKVhWey6zTW/YOrQCDXkwFUdKB7gJJ1is3fppqo6j64=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1661371731; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=bS9tansBU/mS+uLByVfBLtD82ZsrEu9pPMJgjJjQdUo=; 
	b=EWN66Zd8S+jZ5y7vztJxZeCtA29ChJ/tOAlmPXK54B4Y/1QkcPM5OKa1Qg8SS2t+Uqa5AhJxfVdE9a1I7praE9cEVLeug9dGPDOd/Exl7uRPTNiIgWN6gR7nZrHq9XNNDveHSkgaJ56/LyxmKZwrwEv1+pm4cThZq56agEvqHrE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1661371731;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Content-Type:Content-Transfer-Encoding:From:From:Mime-Version:Subject:Subject:Date:Date:Message-Id:Message-Id:References:Cc:Cc:In-Reply-To:To:To:Reply-To;
	bh=bS9tansBU/mS+uLByVfBLtD82ZsrEu9pPMJgjJjQdUo=;
	b=kKccrKLa1Q2FHhRwlP7KyOqdNW0H1uLfj8lhqPnSd5Kw98/4245wTO6nTScl1MgQ
	G9iZ4KVCDJuqvg56uFxLLT+XwhQAcLgoevgWvyDDPboILR05sO1RahksjUmudfm2XOT
	+uk9gjIoZqjAaxzgndtgoop402w6i9kWx1FJy2BE=
Received: from [10.10.10.4] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1661371729628874.3633283035331; Wed, 24 Aug 2022 13:08:49 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: =?utf-8?Q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v5 1/7] dt-bindings: net: dsa: mediatek,mt7530: make trivial changes
Date: Wed, 24 Aug 2022 23:08:40 +0300
Message-Id: <C36EB263-8C1E-414C-B7FF-E6359AA6031A@arinc9.com>
References: <20220824194454.GA2768100-robh@kernel.org>
In-Reply-To: <20220824194454.GA2768100-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
X-Mailer: iPhone Mail (17H35)
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_130914_771306_B84219DE 
X-CRM114-Status: GOOD (  13.83  )
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
Cc: Sander Vanheule <sander@svanheule.net>, Andrew Lunn <andrew@lunn.ch>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> On 24 Aug 2022, at 22:44, Rob Herring <robh@kernel.org> wrote:
>=20
> =EF=BB=BFOn Wed, 24 Aug 2022 13:40:34 +0300, Ar=C4=B1n=C3=A7 =C3=9CNAL wro=
te:
>> Make trivial changes on the binding.
>>=20
>> - Update title to include MT7531 switch.
>> - Add me as a maintainer. List maintainers in alphabetical order by first=

>> name.
>> - Add description to compatible strings.
>> - Stretch descriptions up to the 80 character limit.
>> - Remove lists for single items.
>> - Remove quotes from $ref: "dsa.yaml#".
>>=20
>> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
>> ---
>> .../bindings/net/dsa/mediatek,mt7530.yaml     | 39 +++++++++++--------
>> 1 file changed, 23 insertions(+), 16 deletions(-)
>>=20
>=20
>=20
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>=20
> If a tag was not added on purpose, please state why and what changed.

Thanks for the info. This is what I did on the composition for this patch se=
ries.

Ar=C4=B1n=C3=A7


