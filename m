Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34E2CAC5A7
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Sep 2025 04:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bA18vrXqBDWyLf0pzyXROoXutYNoxoKmYfGadP77a2Y=; b=mdPUbXbMmFwTcZEMjOWdmFGhm1
	rh5ZHPtB/vEh7q/L5PZC/fAeCzA/yABUcoQgxiee1IXIdhZEQpvWg2o880BsRtl/6MAkk/ibtpjcL
	tlb2Z8xG8nsod9pU9Ujdqce4jTrSOKiuPZGq3wJfq0IUd3f3dpF8ErSXcNwM9tncv64nRBrB/2vJ1
	mbofSQCNb5it/OG4KtU4Ct20hsTm8Jp1cuXc91KVQEmN5d5L/N00pzLL4fvP48tWzmpeatIM9YmGf
	A6lbmL1jyfWk02I+HCf15Euv+56aQ3BHBYN19cHq1RfoMAopUmjX3b5RIjHn4/dy4MrPkqVOvWgx2
	zuH8iO+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0BHo-00000006UbA-1lj9;
	Sun, 21 Sep 2025 04:02:52 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0BHl-00000006UaJ-36rY
	for linux-mediatek@lists.infradead.org;
	Sun, 21 Sep 2025 04:02:51 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-3357b8aeddaso4988908fac.0
        for <linux-mediatek@lists.infradead.org>; Sat, 20 Sep 2025 21:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758427368; x=1759032168; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bA18vrXqBDWyLf0pzyXROoXutYNoxoKmYfGadP77a2Y=;
        b=awCTuYARRrO7nbsZkyBdt3zzfoxflGe56BZX1IUWUOmD0C373uW7ifZ8QNH6wyjkaO
         vqaxPPvD8bKRdbORjVt0umFqFCFpyiwFCkcGxNo1FamGFO10MA3hmKKxE5d1UGeSMtG/
         dsUbduEQeOwc1lJiQvBTJXWCmIDDh+CijV30Kb1Vq25CO9Nw0cozAsQTXdasPwSY9u95
         46SeWzEthu4HVTKbQEbIB2WZdgoMBv0VlW76mTQ+F7gOKo8GH+Js+9dk5UxmTS11nIY6
         bx4wvOWzfmZCSrZKyysGsJss99cOmXbPxot4UrqRVsPopSGW7h9NsJhLO/BxQr/LnhMi
         p+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758427368; x=1759032168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bA18vrXqBDWyLf0pzyXROoXutYNoxoKmYfGadP77a2Y=;
        b=nZcPR2JhBWxnf6OQAIh0AYYWeYze52DgHIUsl95zG2SYqLN9n8N/XfJstpixaz5JOs
         /vo2Fjz//mubvWlgJL3TRSGsQ4ImX3mfNNSpa+h6/rwvLZ7DuTLQIerMhTsa5AnAbJCl
         54P53Y6WQaB3Qt1kh5iB52HvHyqj26HzddE1Xl8GogBNx9BTlCFna4EoM6EYeTkYMbXF
         oh13Q3qbLo59tNIV2k12fSPZwbtjAhP+vZGA9p9y1ylxaDclhBdArH0ZgAZPzl8DHW1G
         AXPdqlVcifu5SKJbtMnfNl/2yBsnk+VkZb00oAL0hH3raJjX8fYe5iJq0DXHHCMlayCZ
         2z6g==
X-Forwarded-Encrypted: i=1; AJvYcCWBSiKn9gzdUjhzzbIyURwqxGJT3vq0u8HIZwTHuu+7TYMb9oC/Gj8x1/mmZMev81mwxzEPXPNX6e6CjkIS8g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7UfmFeqm1q0PzLQQX/YAqtWfqtBRVe4n9DW6KTUKoEhsdVBMn
	L8UQHuGvDSjidXC7hmVCQqTXL9XWKxO9mcl06+U0aE04QBu7/taV8PSZR7mxb9ub5ox+VonK6KZ
	/gjRqSA5z+OCsL14mycOVHNj5g/l015Q=
X-Gm-Gg: ASbGnctfajnJpgTM/IOOm9ZjSDRI2zY0G19dO1e3H0LG56f7gzd1XS7GNtXeqdcri3a
	NR+AIiEUeHsx6VEhUyX7OO6/M7jm3KzjF4BNCHf01kNCkGnZ7o/JjtWHItbZ6zgF48CNLZUoT4K
	0lQksj++jVFWWDoGmM87XrJHS8LwkaNgT8oYX7xX819ponxl2B15pz+ye9062FICqc0dOXdSIJ2
	PUwamaa
X-Google-Smtp-Source: AGHT+IFZLr/xsThdfBtqHXf4ZSYYWdYKPhHyHU+8bF5NmoloZBLoe+bOTD86dgsH7ivu1U7543S8yu2mTI8ezy8bXJU=
X-Received: by 2002:a05:6870:e98c:b0:315:8a2a:3f59 with SMTP id
 586e51a60fabf-33bb46243bbmr4362489fac.21.1758427368277; Sat, 20 Sep 2025
 21:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250822021217.1598-1-jjian.zhou@mediatek.com>
 <CAGXv+5F-L2+4PGixx7OG2+vp2yXc_2885yMzqWtkQDwhxVAPxw@mail.gmail.com>
 <CABb+yY3N2=01yKJon25_6_vmihj09H=T9pLwzdGPrqY5h=hRFQ@mail.gmail.com> <5789241.GXAFRqVoOG@workhorse>
In-Reply-To: <5789241.GXAFRqVoOG@workhorse>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sat, 20 Sep 2025 23:02:37 -0500
X-Gm-Features: AS18NWDJ-i7DOGCOG3Z1nAPhjBByGeEhge0EG9gSltw9wqhDLGlBL0w1VItqTxU
Message-ID: <CABb+yY2Ay+KqviJvOQC8X8kfzJN6-fQT04A+TCJAkLnWx+XwZg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] mailbox: mediatek: Add mtk-vcp-mailbox driver
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-mediatek@lists.infradead.org, 
	Jjian Zhou <jjian.zhou@mediatek.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_210249_789976_D1425CC8 
X-CRM114-Status: GOOD (  21.95  )
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

On Fri, Sep 19, 2025 at 2:02=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Friday, 19 September 2025 18:32:12 Central European Summer Time Jassi =
Brar wrote:
> > On Fri, Sep 19, 2025 at 3:31=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.or=
g> wrote:
> > >
> > > On Fri, Sep 19, 2025 at 7:50=E2=80=AFAM Jassi Brar <jassisinghbrar@gm=
ail.com> wrote:
> > > >
> > > > On Thu, Aug 21, 2025 at 9:12=E2=80=AFPM Jjian Zhou <jjian.zhou@medi=
atek.com> wrote:
> > > >
> > > > .....
> > > >
> > > > > +#include <linux/module.h>
> > > > > +#include <linux/of.h>
> > > > > +#include <linux/platform_device.h>
> > > > > +#include <linux/slab.h>
> > > > > +
> > > > > +struct mtk_vcp_mbox_priv {
> > > > Maybe 'mtk_vcp_mbox' is a more appropriate name ?
> > > >
> > > > > +       void __iomem *base;
> > > > > +       struct device *dev;
> > > > > +       struct mbox_controller mbox;
> > > > > +       const struct mtk_vcp_mbox_cfg *cfg;
> > > > > +       struct mtk_ipi_info ipi_recv;
> > > >
> > > > Maybe also have "struct mbox_chan chan[1]; " so that you don't have=
 to
> > > > allocate one during the probe.
> > >
> > > > Also if you have  "struct mbox_controller mbox;" as the first membe=
r,
> > > > you could simply typecast that to get this structure.
> > > > Something like "struct mpfs_mbox" in mailbox-mpfs.c
> > >
> > > I read somewhere that this way of subclassing is not recommended.
> > > Instead the base class should explicitly not be the first member.
> > > And then container_of() should be used.
> > >
> > > I don't remember where I read this though. But I think the explicit
> > > container_of() is easier for understanding the intent.
> > >
> > And how does container_of() work ? :)
> > typcasting the first member to its parent is the simplest form of conta=
iner_of.
> >
> > -j
> >
> >
>
> Which is why it's completely equivalent and since code is supposed
> to communicate meaning to humans, container_of should be used.
>
Nobody is suggesting typecasting cfg, dev or anything else.
Typecasting between mailbox controllers is fine and arguably easier on
the eyes than using a container_of.

-j

