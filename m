Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6A3E7D0A3
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 17:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9SVUFZn2boEnF5GwKRdG3SSt8HtSOHZO4l12UhiSWo=; b=j3n8NHzPBbAd+XJ3BHxl6QTIYO
	ui2XKcQSYiw+/oJrekHIM2w52qJBO26NXaEZ3kqvHxaqGEiSQOF872C0ClIU/1EtKKlbB3MrGRnRa
	QqnVqWI4EyCeHfMu38UdHDw5C1rUt8VYA4wLcXcVW3rJdwgfNMJAJPHHiLSqyL82zoaGP8vQP0j4s
	cxnuDSYIQrpjkdT7JJPTBNEXGGaNo/pjj1RIPuul4UL7Jj8XtEhWlbihs8WtqghWiZr/horuqPL6w
	l0D8t1EoNUv5hczhIIP2i35mWOLtUU2oYNP6u9PEo0/cGXapF4YrTFb8x4naVue26ijxsgvTXrSSK
	5pMmVPtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjNx5-006jxY-0a;
	Thu, 21 Sep 2023 17:58:59 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjNx1-006juy-2n
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Sep 2023 17:58:58 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-34f1ffda46fso15795ab.0
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Sep 2023 10:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695319133; x=1695923933; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f9SVUFZn2boEnF5GwKRdG3SSt8HtSOHZO4l12UhiSWo=;
        b=S/LyS1mJlw0ZXHHE55aUVv/s4WQMJAh6UF53ak1ndE+rBCnYpUrE0WzW7jAQcrMCtL
         QoOT1PWlvzxJYBJvSJfqk7O67tYnM2TMyw93RtKyGk8LMJY0Q/zN42mhUMhipn1PLGys
         u/bvvPzHu5Uq3WOPz93SVsIOeAiUkpJXZ/CM3eAC0kZK4tMxq8AjivI47XQFO66yl3od
         B3OoI6f/caXHsWJS6MGc5F8qWjlsYsW6oMQqf4MsJs01PEtxfQPciud5GY5gXs6Pus/9
         Zq3tT+duAUkpz9/AWQhg5EQ4hfxuNNjGy9G/FBhwr/v3+NCKn4OMuBkRvaknVJL4V8Vc
         anmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695319133; x=1695923933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9SVUFZn2boEnF5GwKRdG3SSt8HtSOHZO4l12UhiSWo=;
        b=nv4IZbYZVRXbNM9qnwktAFzLBsun00AxXTFQ8DWKogsRlKj9j7QW8N+FmU7rkehF6I
         +q0wGguZPcf70iO0kJpNEVfwF/lBtNfQVuSAc6mmlPOOEwsaAwRmywHxEp4DPYXBQLGt
         o193/is80L9+QVvgfUXUXrPLjF6pG4eG/ZSjzCLSxuZc9YjLsXGX8ozIgcfNRvKBngZ9
         EpdfMRr5C9ZB4N74vDyIcuXsquN5nHK96le3VfT2l9spz9XSoZiR9qKcLYZKhnJqcEeq
         jnOQpNJHDbJHO38PVvGP5AxS6oI+RpcUluLc8tFd+X3Q598bR4VPi9Br50IlnVvrv14R
         0tNQ==
X-Gm-Message-State: AOJu0YxxuX1GUF0FVP55xEXeolEJl+8PhCNk2/NbCFxVdT2YKx0DBXx6
	5LPP5lbRP1yedm9oLctASVuv4eVPW6Os9CnwZiZ6
X-Google-Smtp-Source: AGHT+IHn3jby0f9lrLxQXMCYIcclXtaVrAkIXpzr0C33TkWnHakXxvV7Um0L9DLm0Wo7YYavt5pjNW6jZDyfCtBiki8=
X-Received: by 2002:a05:6e02:156d:b0:346:1ca6:c27a with SMTP id
 k13-20020a056e02156d00b003461ca6c27amr292898ilu.13.1695319132831; Thu, 21 Sep
 2023 10:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230911125936.10648-1-yunfei.dong@mediatek.com>
 <20230911125936.10648-13-yunfei.dong@mediatek.com> <1df3e79b84933dda0313d0d9719220dbc06c9022.camel@collabora.com>
 <d4cedcb0-32ed-495d-a8cd-a635d5105824@xs4all.nl> <5307203d79c0d90cc742a315bb161fa796b9960f.camel@mediatek.com>
 <bafc37e8-96e8-41c0-b805-c6477f0d7c4a@xs4all.nl> <CA+ddPcN6EaFERC60_Z_-ZmWzqyUEwxiDCZwt_U6Y-gpaAu76tA@mail.gmail.com>
 <ff7aa575-c820-4dfa-853f-77438b8b149a@xs4all.nl> <b7d661637eacbda3e83d192b1126fc3970c4f50d.camel@collabora.com>
 <c3d14f64-bf04-46b9-ac7b-af7ef9014335@xs4all.nl> <CA+ddPcPbox=mknpmDkwfYTfDMca49wU10SNF3mJspYu=5T64FQ@mail.gmail.com>
 <c7cd83c49a9226e72c272365653dc8b998b6adcb.camel@collabora.com>
In-Reply-To: <c7cd83c49a9226e72c272365653dc8b998b6adcb.camel@collabora.com>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Thu, 21 Sep 2023 10:58:38 -0700
Message-ID: <CA+ddPcPm4aZ9LKu1D1rO3qguPN7E7jbnXTOqdjYCtDm7sk4nzw@mail.gmail.com>
Subject: Re: [PATCH 12/14] media: medkatek: vcodec: set secure mode to decoder driver
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	=?UTF-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>, 
	"nhebert@chromium.org" <nhebert@chromium.org>, 
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>, 
	"nfraprado@collabora.com" <nfraprado@collabora.com>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"frkoenig@chromium.org" <frkoenig@chromium.org>, "stevecho@chromium.org" <stevecho@chromium.org>, 
	"wenst@chromium.org" <wenst@chromium.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	"hsinyi@chromium.org" <hsinyi@chromium.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_105855_903893_8F05E565 
X-CRM114-Status: GOOD (  28.88  )
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

On Thu, Sep 21, 2023 at 8:46=E2=80=AFAM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Le mercredi 20 septembre 2023 =C3=A0 11:20 -0700, Jeffrey Kardatzke a =C3=
=A9crit :
> > > >
> > > > Also, regarding MTK, these are stateless decoders. I think it would=
 be nice to
> > > > show use example code that can properly parse the un-encrypted head=
er, pass the
> > > > data to the decryptor and decode. There is a bit of mechanic in the=
re that lacks
> > > > clarification, a reference implementation would clearly help. Final=
ly, does this
> > > > platform offers some clearkey implementation (or other alternative)=
 so we can do
> > > > validation and regression testing? It would be very unfortunate to =
add feature
> > > > upstream that can only be tested by proprietary CDM software.
> > >
> >
> > It would be possible to use this with clearkey w/ some additional work
> > on our end. If this is then part of the public ChromiumOS build, would
> > that be satisfactory? (the TEE would have some binary blob components
> > like firmware does though)
>
> From my point of view, this would fully cover my concern. To clarify this
> concern, the  decryption into secure memory currently only ever take plac=
e in
> proprietary code that implements the protection (Widewine CDM). With clea=
r key,
> we can have an open source CDM (made for testing purpose) so that we don'=
t have
> to have hidden code to test the entire pipeline. So appart from the TEE
> firmware, which is just a firmware like all the others, we could have ope=
n
> source tests in kernelCI and other CI, and we could extend these test to
> eventually support other vendors.
>
> Note that currently, with other proposal, one could allocate and fill a n=
ormal
> buffer, and "secure" that buffer to test the CODECs and display, but on t=
his
> specific architecture, with the limitation on the number of secure region=
s, this
> feature isn't available.
>
> Alternatives to this end-to-end solution, we could consider a TA (Trusted
> Application) that simply copy data from a untrusted chunk of memory into =
a
> trusted chunk of memory. That seems like a cross-platform solution. It wo=
uld be
> even better if this get standardized in TEEs for course (or at least requ=
ired
> with all secure memory implementation). Then copying from untrusted to tr=
usted
> could easily become an ioctl generic to all TEE drivers. That to me would=
 be
> equally acceptable, and perhaps easier to use.
>
> Nicolas

It's very likely for the clearkey implementation that I would just
have it copying the data from a non-secure to secure buffer in a TA.
We would never do that in production of course, but for testing images
that would suffice.

