Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013F1C05027
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jan 2023 16:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hrw9IaKBt2RjGFFOLVmUTAC2ysW/K7FJYVGxgEZT6RI=; b=JZx83QpVzy1D4PP7yAOQoidAFh
	rrS0/iPRM7qRb0/SVpbrQ7cRzhyPbrImTIUCFynwYn7t//15QZPcqcyhSaQzUCHXWg90osYcnmvuA
	sB5g1F8gowR2ygBsQkWRJrhkXuCKk2zhsM9fuvX6o11U9ozs25YbfbboSV4uCkTfFgEEDo1KtMYH5
	Nu7PFZP6hKr4zlGSv6onYzXdOGD5qbE4pSDoVzrd8j/HKqGMOylrS7ye1kD9u2VhOmQ1s0APqCgU2
	ruIqEnUpavUYFqaqYh89s7oUOciXC/XDOLTqmWmif2TJk/eEqvjStD6trK6qllmwNBgHZe3fVdZA4
	x4zCvuVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzjL-000YoD-1C; Mon, 23 Jan 2023 16:31:35 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzPU-000RrG-8Y
	for linux-mediatek@lists.infradead.org; Mon, 23 Jan 2023 16:11:09 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-12c8312131fso14465998fac.4
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Jan 2023 08:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hrw9IaKBt2RjGFFOLVmUTAC2ysW/K7FJYVGxgEZT6RI=;
        b=4+nypBxcvKlmdQifMiVAOKFFCDGoqo0UYC7kFTEqUq3/3B7HBju9+zs+AhD43xFNTH
         4P5H+FtPQyj9+ZHS6iZkVvtG0b74k2+dbv5msX7EdzA8NExYb01S2F6xNB6kmcVMjaZl
         wKb1mLTeq5P50r2MvsT1XJoey9531BySinmBn3ehYmkCqcfILqrrgd/QQ2/MrsZy0qME
         xSCucu/NQc8NfV48Zp3kJhghNJVZhtfLgiyRBxmHgknfXVc0DXONAkXV9jYvohTLKSus
         nDR1JZJEWpaFCPMMB+CO/QsQ4jqY9lRQtnBiYLRgzoY1CNbkgCtFd60TG6A/0dSy4+5c
         zW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hrw9IaKBt2RjGFFOLVmUTAC2ysW/K7FJYVGxgEZT6RI=;
        b=I1iOomQLoFOckFvVZo7soxZcsHTmZef+IB/2cFIvM8j57WkFSctUlExVNWioHZONuK
         VYppwVbzZrUdZ+Ea7h0sXqmBzsZB6VNj0umeL4hscIKax+jmE20dtjuwOCEahm3TpyNW
         GTTVgNT0aWM860mTmewmtxbLYAB+Drb/izLnR3E/C0P4EKgdLJO7Tgodfm2QVO7cXMKc
         HHbdba6IUM0jUkbGzAP3yya5ByIqmkua2MpHW+d3cMyFcMVRYCUEQ8YO69dBz0id9PmI
         T2r9rYiSMWwu9IB3UzluqbGeTqugJYfrxS6Qr/DvHsF1H+ngqPfHsppXskpEWyOSmJx+
         od7g==
X-Gm-Message-State: AFqh2kq12g6jaCIHmL9ejeRXIWJJay3W4yJyV7qPWn2SaCL2f9ecIocH
	nNmpLdF0hdFuFN1LNmRMR3mPGf5E0kujXsaSLqHKIQ==
X-Google-Smtp-Source: AMrXdXvbHVHozpchrZ4CeX9zV23v8gu6ze5x0q8sEBYOdMn3jkh5JF2UpYM+ROxk6lJdCZFAWjMwAAh3hoimr7umhp0=
X-Received: by 2002:a05:6870:9729:b0:14f:bcdb:3061 with SMTP id
 n41-20020a056870972900b0014fbcdb3061mr1577867oaq.152.1674490261334; Mon, 23
 Jan 2023 08:11:01 -0800 (PST)
MIME-Version: 1.0
References: <20230101220149.3035048-1-bero@baylibre.com> <20230101220149.3035048-8-bero@baylibre.com>
 <18e6d30d-15ee-3d88-e9d3-f8dad6034760@gmail.com>
In-Reply-To: <18e6d30d-15ee-3d88-e9d3-f8dad6034760@gmail.com>
From: =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Date: Mon, 23 Jan 2023 17:10:50 +0100
Message-ID: <CAP2ifjNpPFRGJ+dLJPw4tHP1vApyTeuynA_53V8xNQ9SpaxXnA@mail.gmail.com>
Subject: Re: [PATCH v7 7/7] arm64: dts: mediatek: Initial mt8365-evk support
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, tglx@linutronix.de, 
	maz@kernel.org, lee@kernel.org, linus.walleij@linaro.org, 
	chunfeng.yun@mediatek.com, gregkh@linuxfoundation.org, 
	angelogioacchino.delregno@collabora.com, allen-kh.cheng@mediatek.com, 
	nfraprado@collabora.com, sean.wang@mediatek.com, zhiyong.tao@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_081104_561213_365656C3 
X-CRM114-Status: GOOD (  11.78  )
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

On Fri, Jan 20, 2023 at 11:57 AM Matthias Brugger
<matthias.bgg@gmail.com> wrote:
> On 01/01/2023 23:01, Bernhard Rosenkr=C3=A4nzer wrote:
> > +             uart0: serial@11002000 {
> > +                     compatible =3D "mediatek,mt8365-uart", "mediatek,=
mt6577-uart";
>
> Unfortunately we are missing this compatible in the binding description.

True, overlooked that one.

> > +             ssusb: usb@11201000 {
> > +                     compatible =3D "mediatek,mt8365-mtu3", "mediatek,=
mtu3";
>
> Same here.

This is actually added by an earlier patch within this series (5/7),
but since it isn't used anywhere yet, might as well drop it for now,
"mediatek,mtu3" by itself works.

> > +                     usb_host: usb@11200000 {
> > +                             compatible =3D "mediatek,mt8365-xhci", "m=
ediatek,mtk-xhci";
>
> Same here.

Also added by an earlier patch within the series (6/7), and also not
used anywhere yet.

> > +     systimer: timer@10017000 {
> > +             compatible =3D "mediatek,mt6795-systimer";
>
> Why don't we use a compatible like
> "mediatek,mt8365-systimer", "mediatek,mt6795-systimer";

That was in an earlier revision and removed (because the binding
description wasn't merged yet). Can add it of course (but then
mediatek,mt8365-uart and friends should probably stay as well).

I'll post a new revision adding it back (along with the binding
description) and add the binding description for mt8365-uart as well
(getting it to the same place mediatek,mt8365-mtu3 and
mediatek,mt8365-xhci are now).
Let me know if you'd prefer a variant that drops mediatek,mt8365-uart,
mediatek,mt8365-mtu3, mediatek,mt8365-xhci and doesn't bring back
mediatek,mt8365-systimer -- either one works for me, the fallbacks are
sufficient to make it work.

ttyl
bero

