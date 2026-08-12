Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599F9C5B56A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2026 07:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4OHjlr/xc0r4k48X0MOpzF2/uMIRWtYmbD232seXJo=; b=z4Gsrsn3NO4K7ibVb7TazilGVF
	GejIqFdQo1TKh54nys1Cl23zEx7S0XmbYhL6zJ5IpO3iNO49oddNKVlHeVcxSgLLz8s8CmNmDniwK
	b7/YdZhLuJMGOlhEfPAMl0w0d8e+YTl2KdDr1gzPbgObhM+ng61mTYgt9F+NwrpUIICQv17F95mo6
	/Ojo/WdPmNTn1PETgQBSRrWRQUUqU8VVwphCr0FN5TOSkQJHbo02mjns8ik8gzJGwTxJUh6eWd+Gx
	X7/P1SdUk19Vfl4bunOJlPWyvkj29QEsr2DIeSIeyx+eFDaqUJJTWZJnzdOjgn4FlDmSPECd+4jPl
	EAMJJTvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu3sQ-0000000FbyS-2FI1;
	Wed, 12 Aug 2026 07:59:54 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu3sN-0000000Fbxg-07iH
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Aug 2026 07:59:53 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-6ae534c2aadso473238eaf.3
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Aug 2026 00:59:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786521590; cv=none;
        d=google.com; s=arc-20260327;
        b=JRltNJISkwDvW7UgjANtpETzGpZrTZPChLvSB8QrgzRbo6g+bDXCDvWwDTR5sufCBt
         gNtFkxKSfGtXxmqxgV82byDUJzvsFPNwpKT7+NVc3+sVj+7/+M+i5sMz964hcupqpYbg
         vNPP2uWA7tM80NpSJbu2VN4E9LYvGr5PSEtnN5ObIUAnPtEOq48pHeO6E91VgSAs9RLl
         TE4D4AIru29KIBjZLnCyZ1dhhT3cAk9/sD9MGH5bLH39XRRFXUQE1R9dKBxIb/oToeZO
         GwSKe7LGV2pl0lO6lyNusjMnOa7q7t4z7qrDiYojHkxIV4yVX0PqW16Ynz9t+C+/hJdu
         yLZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M4OHjlr/xc0r4k48X0MOpzF2/uMIRWtYmbD232seXJo=;
        fh=9yLhSUIm1oU63hKYji2Ow6Z66UgkQrMTtFgN2fI7014=;
        b=fl8Q56fLsGTZ3Vohn/bQSNE006MKhVkTgbAbigXKT2d9o+i1DCRsaZftLSibjCOsc1
         q2KTuqEtqCGxAbEIBDO8Y4kOQYsmBBhnqpskrPGx+Y2Lf3bD3nCBe6pgjgtLjWajCxHA
         4LHcNo0mqvn2hLyyJwoOhwGTGQfl4PkBI5hoh1EjJB4SuqolwDRd89YognIIjT1OWzoY
         T7TgV1HVTuMMoyzXoeHWiJDJyKW49IcZbi8ADbtGawndoG2kipqMb9tJX0Lf1ZFs+TIH
         i9IxmhjyNNDZr3MGXPWtBhDGwmosDSm8m/B4/DxsAAOGxvrgBcBwKQxiJTfrIjSsxsCu
         +NRw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786521590; x=1787126390; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M4OHjlr/xc0r4k48X0MOpzF2/uMIRWtYmbD232seXJo=;
        b=gAzOKxXfiWqb5MYyy+3l0p7vjBKMhmFLmEk42D7pz+STVDgQQno14t1AtyJVnJ8kVB
         0DLAv6UmpO+twbyrXQzEC8WOhgFr0Ew/g+NwB48/FB4MOAHbf1VxhTnkHphcSK+BP5Er
         yk5ScjUe3y3aoS3J1ajHThTz6Vb/pe0I+v0aE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786521590; x=1787126390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4OHjlr/xc0r4k48X0MOpzF2/uMIRWtYmbD232seXJo=;
        b=hmo7XNYljSQInTKe9vAuAEu9ofxu60DXnTYJpBXptZ0lDz4HNRznjAyMP7GbWt6tzF
         XeQAIUVu6PpyzQIgylB2yzxMUilOiaiZBTH9Lliq1dNArda3gwpgQu5nY7143JG8aZ18
         iZCmUcOmnl50unUfi7ni75N2nMJXlU1wjlf6gDyRvFu+yQa7XDXYE9fsAikln2IKMWUp
         q8lgFS/rKR+idVynNjJFuPIXxYborUi3/1Znyz0FqiXWaBQAoVMGJrS8Vph6P1YTkT/k
         VMLBsaQoPtcyiHTxsp5JFCPY1XCG7M5C2Qo0RAIM8RR4YlYxUtuGuH1R34xnciHOIkCy
         lGbw==
X-Forwarded-Encrypted: i=1; AHgh+RpLAOQi5y/JQ4VE1f6KFT5O+lSTn7ZNS2Y40dDQGiXHhAkDOFF/oA+HdkjrU6su2JCPItkT83egrOaR/wUKYA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj1iFETtYnbGzXErN/FWnakcgc/NbnndgJ0TirqSKWm6i0s2yh
	sskFxGNbLZuA1AsNr+yFlIwLF69qf3xJPNt2U1VZxTkWD5BcxIQRB1RQTewbCyGDaXUNc5qaruE
	kR80vEmO8H7iMQzuchAjUIeoIM2JUcbhPXsud83cl
X-Gm-Gg: AR+sD13L9Ww6TSajomORwTSdrluypL3LU9blebRW/zzMqFmsmPELf5YL8f7Ft8V5DpG
	o5/NKR4L4FyhNuZhJHfoluyMXAi5UoqnjtSQlBdFORg4SVqMkQo3QoFL1vajnkv1szRR7AmCl5P
	HhiT0/vEjmxVbIrRtz0XzFaYqTiFww/LdwQIyj0lDjqoDOiDD9qFrHqcdDj70T3F5kz0b7uVfm9
	Qbu+NTDoGNoP9iKQaoRCpNln3QjPSl2NhaObInnLshUZQvyPUAjE+W9t/K3S21Qkk3gtXwaCZs/
	HimLzPe/WcDRNmpDnaZ7v3iWqqPfChbEqnbC/Jesqb7fXg99C7TpSj+H+g3vxa25W016bI59
X-Received: by 2002:a05:6820:60a:b0:6aa:f172:3094 with SMTP id
 006d021491bc7-6b0b2519ad4mr2258206eaf.10.1786521589902; Wed, 12 Aug 2026
 00:59:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAGXv+5HrDw8GWb9zp1AaQU9UW+0FGcr7jOV2jt_zi_2KgfgBqA@mail.gmail.com>
 <20260807152059.GA39821@bhelgaas> <CAGXv+5GNvV0yfX2v7E9HxvFpm0xwhGMQLjec=_xV_6YipXFcbw@mail.gmail.com>
 <CA+_ehUxa6U+0FEFuptJXQZ0kwbthYjshZftx32CmwkisAyo=+A@mail.gmail.com>
In-Reply-To: <CA+_ehUxa6U+0FEFuptJXQZ0kwbthYjshZftx32CmwkisAyo=+A@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 12 Aug 2026 15:59:38 +0800
X-Gm-Features: AUfX_mwExU67hb1lHMqkJS8Gq5qmKGn_UqJ4btHUkFbIphThQrjAQvPqvBvAUwk
Message-ID: <CAGXv+5G=XDXSeyQww_ihogpPLyv2K0ofK3Ym1W+Jdzs9h176=A@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] PCI: mediatek-gen3: Add 2-lanes mode support + clock
To: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ryder Lee <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jianjun Wang <jianjun.wang@mediatek.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_005951_122522_E819550E 
X-CRM114-Status: GOOD (  49.90  )
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

On Mon, Aug 10, 2026 at 6:55=E2=80=AFPM Christian Marangi (Ansuel)
<ansuelsmth@gmail.com> wrote:
>
> Il giorno lun 10 ago 2026 alle ore 12:33 Chen-Yu Tsai
> <wenst@chromium.org> ha scritto:
> >
> > On Fri, Aug 7, 2026 at 11:21=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.o=
rg> wrote:
> > >
> > > On Fri, Aug 07, 2026 at 11:24:09AM +0800, Chen-Yu Tsai wrote:
> > > > On Fri, Aug 7, 2026 at 12:53=E2=80=AFAM Christian Marangi <ansuelsm=
th@gmail.com> wrote:
> > > > > This small series introduce support for 2-lanes mode for Airoha A=
N7581
> > > >
> > > > Just a nitpick, but I would probably name this something else, like
> > > > "cross-controller lane-bonding mode" or "lane stealing"? PCIe alrea=
dy
> > > > has 2x lanes as a standard feature, so this naming is a bit confusi=
ng.
> > > > It's not like dual-LVDS display in which LVDS is only a single lane=
.
> > >
> > > I suggested the "2-lane" and "x2" terminology because I assumed the
> > > result is what the PCIe spec would describe as a "x2 Link" consisting
> > > of two Lanes.
> > >
> > > If that's not the case, maybe "cross-controller lane-bonding mode" or
> > > "lane stealing" would be more accurate, but I don't know what those
> > > mean, so if we use them I would also like to know what the result
> > > looks like in standard PCIe terms.
> >
> > Benjamin pointed out later in the thread that it is just bifurcation.
> >
>
> Yes but as me, you, Benjamin and Bjorn people who weren't there with the =
HW
> team at times the SoC was created, and given how the internal documentati=
on
> these are just assumption and observation... Everyone can be correct and =
wrong.
>
> > I would assume "PCIe bifurcation" is a standard term, so maybe we could
> > call this "Support un-bifurcated 2-lane operation"?
> >
>
> And how coming from PCIe bifurcation to un-bifurcated 2-lane operation ke=
eps
> the standard meaning?
>
> This terms is equally custom as the previous "cross-controller
> lane-bonding mode"
> and "lane stealing"
>
> I want to be honest... I'm not following why we are trying in every
> way possible to find
> a standard meaning for an highly integrated PCIe controller for a vendor =
SoC.
> It's not like there are devices shipped with PCIe slot where you can
> insert whatever
> card you want. (there is only a single RFB board but that is really to
> debug stuff and
> develop)
>
> The SoC is designed to have WiFi cards attached and only a subset of them=
.
> And some of them require 2 lanes mode to work with this special configura=
tion.
>
> Even the DT bindings are not that specific to the details... at the
> end of the day
> everything is modelled as simple as "num-lanes =3D <2>;"
>
> And that is effectively what the HW gets configured to. If then a
> robbery is done
> internally to the HW to get the second lane with probably some criminal a=
ct and
> some murder then those are just details. But unless we have a correct pol=
ice
> report on that (Documentation) we can't assume someone got shot in the
> process.
> (sorry for the joke around the stealing thing)
>
> > On the implementation side, having to reach into the second PCIe contro=
ller
> > is a bit messy :(
> >
>
> I can assure you vendor hide all kind of bad stuff behind single register=
...
> It's just Airoha that loves to expose godzillion registers and configure
> everything clearly... Something that most of the time is better than hidi=
ng
> everything behind ATF with SCM commands (or even configure stuff
> in bootloader from HW strap)
>
> A bonding solution where 2 controllers are configured and then bonded mig=
ht
> also be problematic as for 2 lanes mode the configuration needs to be don=
e
> in the same time segment. (and that would introduce lots of complexity in
> both DT and driver for the sake of just having an additional reset and
> an additional reg)
>
> Aside from these 2 point... I'm open to any kind of naming and change
> but it seems sad to me to delay this feature for these details that would
> only affect the commit description and nothing else... This is currently =
needed
> for Eagle WiFi card to correctly works... With the current code it works =
but
> sometimes it doesn't as the reset and configuration phase is not well def=
ined.
> This series fix exactly that to have stable functionality (tested on Open=
Wrt
> from at least half a year)

It was not my intention to block this. Having worked on other MediaTek
SoCs on which the PCIe gen4 controller, supported by the same driver,
can do up to 2 lanes natively, the subject of the cover letter was a bit
confusing for me.

Now that you've explained it, everything is clear.

> > > > > SoC. This is needed for correctly functionality of Eagle WiFi Car=
d
> > > > > normally attached to this SoC that require a 2-line PCIe card to
> > > > > correctly work (and give the proper performance)
> > > > >
> > > > > The first 2 patch address a limitation of the PCIe implementation
> > > > > where the PERSTOUT reset were indirectly asserted and deasserted
> > > > > all at the same time (for all the 3 PCIe card) with PCIe
> > > > > enable and disable.
> > > > > The 2 patch address this and introduce correct reset to control
> > > > > reset line for the relevant PCIe line.
> > > > >
> > > > > The last 2 patch add additional logic and support to assert
> > > > > and deassert the PERSTOUT and also apply the required configurati=
on
> > > > > for 2-lanes mode.
> > > > >
> > > > > 2-lanes mode is implemented in DT by adding the required property
> > > > > and by defining the "num-lanes" to 2.

