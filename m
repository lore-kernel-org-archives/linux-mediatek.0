Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F438CF8840
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Oct 2024 19:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5HfbdgHbABODTaTjHs2WrlvZ31IfcWLv08zvorE0ME=; b=HspXbiBV+v0jcKqSjvLSTTutF/
	cIN6qsq/DDxmLsCN+VCGcmU74xf/vyx7VCSWZZw47LsphYfihggQ8+MQRRPgvxHr+sai+ywOFaAVJ
	LCUZ0cWFnGP+3ZatLbXPz21fg/KNZ+d/haZfXOFQa27Ue4qSyS9tMpkuV+349KIWFw0KFr20/efhV
	iLQySlCeiqOLq6DFr76TGusFzJml3ih97zk3QibzGlP0dWQfl8o65oByymba32oAF/wzR5d1pzMFW
	oaf25rtSj1QHTGvEyOuTIwjXR/Ls3iC3xqAOBjHtfkO6bkPv6suNozk2K2+6klnxxtKsV77BXUqvi
	3BF2o3fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swnds-0000000DpMc-3Gqj;
	Fri, 04 Oct 2024 19:07:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swnbY-0000000Dowg-0VO4;
	Fri, 04 Oct 2024 19:04:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=B5HfbdgHbABODTaTjHs2WrlvZ31IfcWLv08zvorE0ME=; b=RJ2LnklGF1Fw7+oucTXKLqyVKl
	lBweDFp1A6G40dexxEAbW5xrm002ht6fY6vr3ru7txjuzf55xf6Ce7XgYBHYwwROKFyUSmrY7bswz
	vYk/COS0iCQvJ3TfnQNotFRuGafqPlM2DAtpHEGNbLoW/SEKj/xzE0QQjE/Dg67LJxj+0QtCWH2aA
	g74wubNGuLUQ+7ihRiCotZbYysGiGVci0zd6FHicP4mFK0wlCl40I06I3PV1xpm572SM4w6kvF023
	5yeswmYFghOWf/ELL1jKKBMhETTZs2uu+QHVXXvqLjAbvZ8W5/5+inFJlPk3R+/PFCNrw+bU+/0mw
	G7ScPuRA==;
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swnbU-00000003uPb-3bbq;
	Fri, 04 Oct 2024 19:04:42 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-6e129c01b04so21546987b3.1;
        Fri, 04 Oct 2024 12:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728068677; x=1728673477; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5HfbdgHbABODTaTjHs2WrlvZ31IfcWLv08zvorE0ME=;
        b=LWLH3KWiND0kyFsxU2wDJ5twWG6f3A2p84R9QaSNja4h5SjWjs1GDev2bR9loAU6yf
         GA6Wyacvm+ibVL9JO1UQJwDB09yXp2OjNCxrPD6/y7ngFGSTk6M2xfjw/Z4MXQVX/r18
         fN807zF3Tar7++ZNfv81yUc4WmK+//DznohjvXs0MOcOnLRg3a6g6mzC2ssNpwaOhuza
         NT8uKDNNQ9f7NTl9w8Whc2LEvyy0kEy7dkmOMhz6jbyahcooSVVCx9fxvvh0a5XG5NMR
         /nuhDu+GJgSTlNpRBU0m+QVtuCgtD9xLsSW6Dvh7juUNTh0k5RhErHpMaPNaSVMjohjK
         DwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728068677; x=1728673477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B5HfbdgHbABODTaTjHs2WrlvZ31IfcWLv08zvorE0ME=;
        b=MAs8ViCYwXkD9SnaQKpO48sfL+KpDKD00sNZWXqln7uWbSwp+ky863nWguov8mhCN9
         BcL3pnNz5mEgjymKl+ovZT+4g0sdJF8P6BqiXnf5R8Z2U7BJoQIJcwyx2KkpvaP7Iekn
         vbxRZM1U1Ss+qF+SQQL9k358cmIX+JaZ/emC/Kfg9s1S1aY3PbadDxE54FllWErfSqq2
         NJCwAMLQmEh7jMSUYqIZ6akEqv4aPU8zONhB/kxfR4fSzx4S0dq/ktHrkPjHI+bTqXhj
         U6dZHCGiGKd0VF5vVSnA+oF5iVcO3T+ICnQ08wS1iAaDCgrzZxbfjmirvEYxwmZ59clD
         unAg==
X-Forwarded-Encrypted: i=1; AJvYcCUdAgsP2lMUYQes416EES2Omev+ZdFwyDtuaeeyed0VEbm/H1q+LXGp7OprA9EAv8UoFsH4ed5USTEqwfPHGUM=@lists.infradead.org, AJvYcCVQAXjj0a+j50rhAi80JnY8XCNrl8uI/dUg0fab9GnqNVQ4bjpkQgA3j+CU93NEcCH2eDG59yU5sZ4q@lists.infradead.org, AJvYcCX+B4OeTTugjk4wm8N/ziYFXqir8DVLAiS2NS8bUr5ipReqP8dWs9eZIFgfsw7H+/POJkAHaxmTa2zZzUYbiwXp@lists.infradead.org
X-Gm-Message-State: AOJu0YwiVwBSzpLO4ltHb5NwxKh+1tkG+G69CByH6JTLFjVKbOFa8LV3
	ZiHI7iUgd5CHt1ss43wp00QYyD21B+VQXbJDLpj+HwvszNw7EBERgWRh6RwNAu8ouYh+1bPB9lf
	GXRxTXy5CuZc3ZKxfImK0DJqVbYA=
X-Google-Smtp-Source: AGHT+IH9scQLWNqJQHayBVbx3/oOvir8TuLyhF6I1u9sp0NdVUUfeeiiIOFw8tGmDwqe/ZpBUA1tc6SRGklljrBAiUA=
X-Received: by 2002:a05:690c:6813:b0:6e2:2600:ed86 with SMTP id
 00721157ae682-6e2c72f779cmr34932837b3.45.1728068677613; Fri, 04 Oct 2024
 12:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <20241004000015.544297-1-rosenp@gmail.com> <20241004000015.544297-6-rosenp@gmail.com>
 <39dcfa4b-1a22-4296-b190-ac39480d034a@kernel.org>
In-Reply-To: <39dcfa4b-1a22-4296-b190-ac39480d034a@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 4 Oct 2024 12:04:26 -0700
Message-ID: <CAKxU2N9-DxfsANMfT8DZ-LuKJ3bqjckyfd=+Lg_qtRn985BuoQ@mail.gmail.com>
Subject: Re: [PATCHv2 5/5] documentation: use nvmem-layout in examples
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Christian Marangi <ansuelsmth@gmail.com>, 
	"open list:MEMORY TECHNOLOGY DEVICES (MTD)" <linux-mtd@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>, 
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>, 
	"moderated list:BROADCOM BCMBCA ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_200441_004120_0647E753 
X-CRM114-Status: GOOD (  18.95  )
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

On Thu, Oct 3, 2024 at 11:25=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 04/10/2024 02:00, Rosen Penev wrote:
> > nvmem-cells are deprecated and replaced with nvmem-layout. For these
> > examples, replace. They're not relevant to the main point of the
> > document anyway.
>
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-pat=
ches.html#i-for-patch-submitters
>
>
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  .../mtd/partitions/qcom,smem-part.yaml        | 19 +++++++++++--------
> >  .../bindings/net/marvell,aquantia.yaml        | 13 ++++++++-----
> >  2 files changed, 19 insertions(+), 13 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem=
-part.yaml b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-par=
t.yaml
> > index 1c2b4e780ca9..8ae149534b23 100644
> > --- a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.y=
aml
> > +++ b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.y=
aml
> > @@ -45,17 +45,20 @@ examples:
> >              compatible =3D "qcom,smem-part";
> >
> >              partition-art {
> > -                compatible =3D "nvmem-cells";
> > -                #address-cells =3D <1>;
> > -                #size-cells =3D <1>;
> >                  label =3D "0:art";
> >
> > -                macaddr_art_0: macaddr@0 {
> > -                    reg =3D <0x0 0x6>;
> > -                };
> > +                nvmem-layout {
> > +                    compatible =3D "fixed-layout";
>
> This does not look right - the binding still expects nvmem-cells. I
> wonder how does the nvmem-cells.yaml work if the compatible is being
> removed so it is not being selected.
Not sure I follow here. You mean replace nvmem-cells.yaml with
nvmem-layout.yaml ?
>
>
> Best regards,
> Krzysztof
>

