Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C491FD4F16
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2026 18:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RYHwf92flHnUfSHhGWu39REnpB8D3KhXnDbPehoNQKQ=; b=AmVmwgsXf2MTsF0xTkaw9LjZbq
	lXqRBx7kncl5MSwQwCBySCo8RxqtxZQvOQPep/DX8FnED1FnPoIqYZdzK+GK8sTfUQvakBGuHJiVW
	kJdJz94Kk9X8+XMmSPUCQVqKGCH4YEvk58q2nJZNnUWA5AGysAcj5QqkYs7RsPcbL17fBHi4NHPo/
	2Fv1PsC2PHgpIB36SHO6juw2i6yYgmuErAcah5u1Jv35zm573XvoUtvxsrxn1Gik/xwH+Khaae5Bb
	QoG2+wOdzUwFNnZLDEY7zu3UfeqIEnqr/B+qCiE7qHePP94JOFyUv5VuOReaOT6ZPDQ8TZtZ8VAK8
	1dRXHzqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01hy-0000000A4Iq-38px;
	Tue, 10 Mar 2026 18:21:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01hy-0000000A4Ig-1JUJ
	for linux-mediatek@bombadil.infradead.org;
	Tue, 10 Mar 2026 18:21:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RYHwf92flHnUfSHhGWu39REnpB8D3KhXnDbPehoNQKQ=; b=hDA03riEyd4trQK7mkI9WR9nXr
	ip8ZNFjNmuEBcr2DED5jPbr3OxFGh9ZEM/9mo0LkPr/2j09S9fpcHV40oZBHABHibKPXnojRcCAnY
	YZAArXcjzLMarWWkYYza0TFAJanC+tfVrW9DltfWVqwRjlbSMZ/R8y1vKsdCNg2GcMZkDeUn8tphs
	XUwNxarPR15GX7KYz75UsF3ZvyjdZLkYzN/Jjc8U8gY1weRVoHx3tqMcvlLiQ6lDy5nwp5IzhQ8w1
	AbhRGGBpofHYuGJu3eek/GjrXCsKZvO5q6377VurgIDSuvFfiMHZWcmXqNGtIriu9IgwrHzoR7jB8
	Lw+HtydQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01hu-0000000FJz1-3o94
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Mar 2026 18:21:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A83A442C8
	for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 18:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DCE2C2BCC7
	for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 18:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773166882;
	bh=RYHwf92flHnUfSHhGWu39REnpB8D3KhXnDbPehoNQKQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VLp7+7J9llrwvCmETGQRw3htvlndh6m1nt/RRmA9Uxn1bhz+K/B+q6H0nosrrJG24
	 ualDb+AMHRYw11phgtZL8RQve4Fni7wZOk59ZLka5e+KPtlbhUxjNSzE/u7nYiB2MG
	 4bV3VcillBEcNpXDxDtrt3iOrWD9Xz8KTLy0tBBoJR7VPRwrGT4Bipusr7CoKRL2ml
	 l7zOALrl2J90A/S7t+sxsILHs96E/Odocww2PrRZOWkgKyzHu0R0BCxGsyhR7v+CIf
	 Ky6UMX9xuNxOpFUg5ny0u2vMeWHrFW3AaDx6+eRfY/UL0WbUJETU9XHUwMA1DbqaxY
	 zFxqVd4KpzOUg==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6616cb8c80cso8361559a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 11:21:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVxKTsa3Y30noBmsCQL3TrUquapDnjfPfXrhgO3mJoei00mtcgW7m17MdROnuRytw8+2qaLwdWja0Urj7V3AA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywix3tjH8m617NNxtfVbN09skX0y9eKXEvGW9scE3G1/xYZJaTm
	M18ch6rh3Lh0n42BJ3DEAK818IdqcNE/whD9NUFeUwX6rJZ1zsKG98WIKgJ37nNPFWo2A4rsFAB
	Pt+BHhHyJz/KofFVc6VDGYJ3/GeGI4w==
X-Received: by 2002:a05:6402:a290:20b0:662:aa89:2ffd with SMTP id
 4fb4d7f45d1cf-662aa89325dmr2220648a12.18.1773166880808; Tue, 10 Mar 2026
 11:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260306-mt8196-ufs-v9-0-55b073f7a830@collabora.com>
 <4089450.ElGaqSPkdT@workhorse> <yq14imrwp3z.fsf@ca-mkp.ca.oracle.com> <5973984.DvuYhMxLoT@workhorse>
In-Reply-To: <5973984.DvuYhMxLoT@workhorse>
From: Rob Herring <robh@kernel.org>
Date: Tue, 10 Mar 2026 13:21:09 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKGxrNuaTb9+n3ZYjAdY=UHC6z-neXK-aieTXeROCN5og@mail.gmail.com>
X-Gm-Features: AaiRm53EXEYwn_27B-gILkkR9Yt_6ubl80Y5DTYqzcMmOl6Xp1DwezMjgTnFj3c
Message-ID: <CAL_JsqKGxrNuaTb9+n3ZYjAdY=UHC6z-neXK-aieTXeROCN5og@mail.gmail.com>
Subject: Re: [PATCH v9 03/23] dt-bindings: ufs: mediatek,ufs: Add mt8196 variant
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Peter Wang <peter.wang@mediatek.com>, 
	Stanley Jhu <chu.stanley@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Chaotian Jing <Chaotian.Jing@mediatek.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, kernel@collabora.com, 
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_182127_333359_6EE56977 
X-CRM114-Status: GOOD (  23.04  )
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

On Mon, Mar 9, 2026 at 5:04=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Saturday, 7 March 2026 19:01:17 Central European Standard Time Martin =
K. Petersen wrote:
> >
> > Nicolas,
> >
> > >> "ufs" is redundant as all the clocks are for UFS. Same comment on pr=
ior
> > >> patch.
> > >
> > > Is this naming a big enough concern to block this series with two
> > > explicit acks on this patch that fixes a wholly broken and useless
> > > binding?
> >
> > It is if it comes from one of the DT maintainers.
> >
> > > I am trying to put out this dumpster fire of a downstream turd that
> > > made its way into mainline as the review process has been completely
> > > subverted, and is only getting worse with each passing month
> >
> > This has to stop. Please read Documentation/process/code-of-conduct.rst=
.

I have little doubt that that is an accurate description of
downstream. And if properties are getting added without bindings, then
that is certainly a problem that should be complained about.

> >
> >
>
> I apologise for my tone, it's my frustration getting the better of me.
>
> I'll be handing off this series to someone else, so you won't have to
> deal with me anymore.
>
> I do ask however that you don't apply patches from MediaTek blindly;
> if there's code to read an OF property, and that OF property is not
> in the binding, then the patch should be rejected, even if there's an
> Ack from the MediaTek maintainer.

There's functionality to find undocumented compatibles in kernel code
(make dt_compatible_check), but not properties. Sounds like I need to
add that.

Rob

