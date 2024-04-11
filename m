Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4CFCD1284
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 09:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VvNwsiJeMA7Qr/EyaBx9I0OkF4w8O8NC6WXdusd8vRk=; b=kQF+YXuCSjcOphXSCo3vHAWUjQ
	EcwilEKPqoELOIxLE11Leb8iIw4iZCsLwiSXfI1E0oCaZ8fVwk/nnUniXT+/xITU9MwcpQhR25Vxl
	dt147lDXKJg6V61pHI6QTYS4iETAJZ+pw0cwma2od0MAFi/TdLFqiflqZOcksfj7QYOCGT23Whprz
	Jg9c6J8ibrXD1LGGK67XxpiOnvzGg1WDYndXPSThL4gmH7vjyW93CuPlld9yU4hcmsV0rQemaxyd1
	vqtRsbhA0/89mUBU5RqZHMd1W6dfqaonWhU9D11knbDMOfW89enTYMYSlF6Rc2hiqgcMs+vs9qsAC
	cZEF6tqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruqUY-0000000BGp8-2xBY;
	Thu, 11 Apr 2024 09:13:10 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruqUV-0000000BGn1-2PbH
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Apr 2024 09:13:09 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-2330f85c2ebso941485fac.1
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Apr 2024 02:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712826784; x=1713431584; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VvNwsiJeMA7Qr/EyaBx9I0OkF4w8O8NC6WXdusd8vRk=;
        b=Wlk2bVGAsRyFssXG6Rt3d2/HE+imjBYOkwCOrRiAPxuFl6IJKlwkyv5qWdPvX7t0Zq
         k76WDAPFkXaLarJ3L3eUNi+sw+37nGSaIW0PjY5VKzjzM4MDgI1iWx2KPbvcABBooXGF
         RcHX8htJI/wgYGnV5FNzRUY72Cxpkg63qrS64qxnxHdP8ASF7FM9jgrSn8D2Eov7tu2G
         pTEESdb6hPmVJg1LqPOPJS/b+bOwWyYW98CYQ/s0R4KC5BVVd9ZQmp1V+yINQO6HUVbg
         2wyjxcOhqKo01pcMMW8DW7/dOJ2SNq04PHSnqVqkUHPDY51dT05/pePMuGvX1JQE2r/D
         D6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712826784; x=1713431584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VvNwsiJeMA7Qr/EyaBx9I0OkF4w8O8NC6WXdusd8vRk=;
        b=Q7VftJsSyWtR1NDjEB8nL6qWcCVoO2TJKQfJgOSmMARTKpXqVHjtWv+Nk0CGKIKlSn
         1sAyOb4FEv8HGn2jEFVWBSpb4aXpVarrcMkCNA2mtTGN8S79RphuNmNiXxVTs+F67xBW
         Nelz1idUoEvfbcPs3JeePeFpnA6ChzH2gOMMIj+rgnLCfSx/D0mo4vKaEBTjFEcHrrac
         7eMhm91oENMsqPo1mCgab7j1pmUMqzyDfPxH9sbNZbWpxRXfxJWT9LJI35DLxSkI8sTf
         J6L46gANfEupCPcY1VzwXV/T0A1ZGnhQnryc6oAtpK8E7xi2y9V5bVGD5eXPxRSle4y/
         GZtA==
X-Forwarded-Encrypted: i=1; AJvYcCViYzZU+eWXtw1PG80PjAGUbfNe95WfJXFwsIKA/AO61SdPTrNiRX09Cg7wRy3Ex2pbSzjAfGYF8S/nw3mwNrFQs3rv/MPISHpMNu2YGm6x8RyD
X-Gm-Message-State: AOJu0YzAmxXESJ7H3uBnJoVGm9CXjWjhovACCVcs6mNTGOxCvpzS+/rn
	D50nQCdbTiXZNXb/TNkEDC7gRUoaTeMrsGkz8xAWnS9tG5D+CfsobKmAN1h8itMMYJ1HkbPn087
	LymwAPrjQhsyF+2KHET+evx8GyGc=
X-Google-Smtp-Source: AGHT+IG4Tbvl/3bgKG7P9+GQDIw3SVCCbcugECWBfqRopTCh5nwIsFnlNAdD1Sb2wTH5yeVYwgaVQrG6GT1R6gRK76w=
X-Received: by 2002:a05:6871:b203:b0:22e:ddde:adab with SMTP id
 bb3-20020a056871b20300b0022edddeadabmr3980205oac.36.1712826784642; Thu, 11
 Apr 2024 02:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240111082704.2259450-1-sergio.paracuellos@gmail.com> <CAMhs-H-Nab+NAcdZ4+VoiikzXgDH55USREhYA6=6xd6ac_OCww@mail.gmail.com>
In-Reply-To: <CAMhs-H-Nab+NAcdZ4+VoiikzXgDH55USREhYA6=6xd6ac_OCww@mail.gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 11 Apr 2024 11:12:52 +0200
Message-ID: <CAMhs-H8zKEt9wxLiz1cKVXdasCR=oNtyvcDGp3ZNuF16vvZARg@mail.gmail.com>
Subject: Re: [PATCH] PCI: mt7621: Fix possible string truncation in snprintf
To: linux-pci@vger.kernel.org
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bjorn Helgaas <helgaas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_021307_822728_46B230A3 
X-CRM114-Status: GOOD (  17.81  )
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

Hi,

On Fri, Feb 23, 2024 at 12:24=E2=80=AFPM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> Hi,
>
> On Thu, Jan 11, 2024 at 9:27=E2=80=AFAM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> >
> > The following warning appears when driver is compiled with W=3D1.
> >
> > CC      drivers/pci/controller/pcie-mt7621.o
> > drivers/pci/controller/pcie-mt7621.c: In function =E2=80=98mt7621_pcie_=
probe=E2=80=99:
> > drivers/pci/controller/pcie-mt7621.c:228:49: error: =E2=80=98snprintf=
=E2=80=99 output may
> > be truncated before the last format character [-Werror=3Dformat-truncat=
ion=3D]
> > 228 |         snprintf(name, sizeof(name), "pcie-phy%d", slot);
> >     |                                                 ^
> > drivers/pci/controller/pcie-mt7621.c:228:9: note: =E2=80=98snprintf=E2=
=80=99 output between
> > 10 and 11 bytes into a destination of size 10
> > 228 |         snprintf(name, sizeof(name), "pcie-phy%d", slot);
> >     |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > Clean this up increasing destination buffer one byte.
> >
> > Reported-by: Bjorn Helgaas <helgaas@kernel.org>
> > Closes: https://lore.kernel.org/linux-pci/20240110212302.GA2123146@bhel=
gaas/T/#t
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >  drivers/pci/controller/pcie-mt7621.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/pci/controller/pcie-mt7621.c b/drivers/pci/control=
ler/pcie-mt7621.c
> > index 79e225edb42a..d97b956e6e57 100644
> > --- a/drivers/pci/controller/pcie-mt7621.c
> > +++ b/drivers/pci/controller/pcie-mt7621.c
> > @@ -202,7 +202,7 @@ static int mt7621_pcie_parse_port(struct mt7621_pci=
e *pcie,
> >         struct mt7621_pcie_port *port;
> >         struct device *dev =3D pcie->dev;
> >         struct platform_device *pdev =3D to_platform_device(dev);
> > -       char name[10];
> > +       char name[11];
> >         int err;
> >
> >         port =3D devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
> > --
> > 2.25.1
> >
>
> Gentle ping on this patch :)

Another gentle ping on this patch :)

Thanks,
    Sergio Paracuellos

