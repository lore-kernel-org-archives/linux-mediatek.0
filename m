Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6AFAFB3CE2
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Mar 2026 09:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONNvpnHIrrlZOFnwwhyENzcT4/Pw+OdMUWkbXsdiH4Y=; b=gXXTy8qBIlXMVuHsH+aUReGtqa
	l8hSmvRfiaUM2Rn4GpvNnIAqpX1wek+indgwBeri6Wy76hhUADegwC1553glQDr3gTTTIDrBSzJ3d
	N69i0p/Q8oPkbwTCo8sEq6Ig/vb84NFbSek6q20cgRJq7CNXLBo+yFlDFmL2m5ufa2VbQlFWl/jGw
	xD/fXQBmG4pGixrQ6x94eBDBMltuJzG49xr7rxOVlMVlDBTrBS03soD5/GR+IkiX0Jm6Kc3EierSy
	kK46owBS92dvigy8ZqhhbIfw0rj9YAnKIrFbeMKocSHMqg7Uab54y5DJ297L28jDsRnaoVff2y/3b
	5qugNu7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w792Z-0000000AyRX-0xtB;
	Mon, 30 Mar 2026 09:36:11 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w792W-0000000AyQc-2GCz
	for linux-mediatek@lists.infradead.org;
	Mon, 30 Mar 2026 09:36:09 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5a0faa0d15cso4465551e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 30 Mar 2026 02:36:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774863366; cv=none;
        d=google.com; s=arc-20240605;
        b=ZHbDevKnfm1W7mg1qG/Vcf4UXc8ZUwRxnNI1i3CjqjKv03IvkUQ6exUFe9uNe7WWly
         GpZYTlrjT35Of3jp0AmVFgIsh7s20T19KP+G2Z9lowlpptjKxUR6c76P2EbpSH7jieWD
         6yP1oNfz/VyDbpLkBilaWurrS4ltftICww/xoqM7QJeLrd9n6YavU6Yr20y1wW5kcoG3
         NMH+KCniZ4l87rA5Wmq0ayy7VBXibyo87gjWcLyKOKBdnJzCANt74+mO44uz3TfyLiTx
         gdSMl+4i8Up/3C7eB+BPevA2vpGp+K18Kx+kGhg/T6C7oITNEN0Y//GsB5DrMOJ9+qiN
         aX9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ONNvpnHIrrlZOFnwwhyENzcT4/Pw+OdMUWkbXsdiH4Y=;
        fh=iCD3y10TIr2QCXo3b1RrMUCkcxJyQ3iwuzW4y8KLKqI=;
        b=IIy0Dgh1ovUMHIuHuWdyxc/tyDz7Hkh+hRovgiRJLiZuMeQp7de4AA5nEZlA0Ya/uO
         wVrqalqpoXpTJ5vrdBdq8AFsBUShqLgi1woqrpkSaVKdiUYKBVPp+jEUbkoCEsuLSz6w
         EwVRcE0EhjrO9jvmp0pBpPCTDkvZrWBNy05zYdTE2DCkSv2s4mr0D4Egt2yjzm3lRskb
         X+lAks1BID8slV8zaEwn1SHsZqMjMhUfcbEqZmtPws4csN3D1AK1CCjyPFrTSRP7B+cp
         xXbzPRQwZkizHZZ3bQrWSMNXkay0hqFXsbqutuW1SbXs5uJyDQq2e2ZiR8BWsTXeFdky
         I8mw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774863366; x=1775468166; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONNvpnHIrrlZOFnwwhyENzcT4/Pw+OdMUWkbXsdiH4Y=;
        b=Y9zGQ15zM9CQoO59R0MGHvzGQlFcuFPPfFvFwLUF7zQUZAfXYMDUChMyfR6YJVcHmp
         uxCtDCjjAQV0+A1p9EdH2NtbVdyfmLdjfcaBsS79L/xuWyKY9ZCY5ahI02YxA3mdHCJT
         uOEgRRWBJCpTqsqMrE4QSJ3M3sYhUSJF1X6Z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863366; x=1775468166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ONNvpnHIrrlZOFnwwhyENzcT4/Pw+OdMUWkbXsdiH4Y=;
        b=NhFuUM62Ybd8fBk8FF7V4BtS/6rw7qnGfMGWdvz2rYYAdDRylh4MxOMhrRHGJMB8Yk
         4jhSXMBVTMDgVbm1sWz7ghd+iGfqeOmYbOGblYo57LisfFuFZAu1SgLeoLvK7IifTr/o
         G8f1KeVeY58PiHmsUEZSMa7iuXvzFUg7DCj43wJqQ3mERy+eqgk5RmS/97QArTwVQWOA
         8E5h9reFGPNdEoiWqefVKKOCdoNAqNwRlGg1KlxIkKWAzW5dgCTK6UvI2kSllJzNI6UN
         Upzb4KusuRprLaTKmy8wjMbqaEhj+bzUVCPuC6/gcl3Wo6r6xrx9/ppxkPpjpPk9Brsz
         Dmeg==
X-Gm-Message-State: AOJu0Yx44PaIRKaTbKw7Q+PbvQ72D6qoF20oTwBiZnpeCEXRAdvvcaUR
	hA3q8YHmGA8O7nParv7JDSEs5+UZTqMoBkmfiQwFtsAF8R9Dg69R84EbV5rAzZx3C8BSQEAajy3
	C52oLsMGpYFoCE1G7to07xRUrhMtegrQdMv1SuxRkYcCs/45E/jE=
X-Gm-Gg: ATEYQzx2FP/CvP+yohDT4AVBIhUHlP7Hzva8ofekB2BUmg+kg5UB4UoSDHszxvPXMJj
	LaVDntdvKZBws6DFOGoxFZ9IKxcJaF9un/O/j2OsX5FAGHWJQ2sgZd+8rKopI3rwipu2X0/P2Kx
	OGncPY2DYgdM6Qtxr8USkyzjBwF6jgu4HVbHUjZP3gW0mTxq9OrhbgZO9PkNUbvCoeA6+sy9DbT
	wFuOJrAXWD/fNkxXGdx/pUm4JWejts/TLxlabJly75HrfQWCZ9sbaKlioz2gtyyUg4Ny/kVaKO+
	p9r4J9vKMxx/chn5KBWsifY2SX81KIUQpGNn
X-Received: by 2002:a05:6512:3f12:b0:5a2:7aeb:e7b3 with SMTP id
 2adb3069b0e04-5a2ab92ae11mr5011592e87.29.1774863365955; Mon, 30 Mar 2026
 02:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260317184507.523060-1-l.scorcia@gmail.com> <20260317184507.523060-8-l.scorcia@gmail.com>
 <CAGXv+5GmDtrtFHJXs+fDyF+dZ5YW-TSEqXnPs2xCH8cu-Xcn9w@mail.gmail.com> <CAORyz2J355NZH=7iQ9sTDBhAmtjP7xTpXe21_3Z9J_R5YvdXAQ@mail.gmail.com>
In-Reply-To: <CAORyz2J355NZH=7iQ9sTDBhAmtjP7xTpXe21_3Z9J_R5YvdXAQ@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 30 Mar 2026 17:35:54 +0800
X-Gm-Features: AQROBzDDuO289B2CM0DmVnpmaCFifXhpUymo-5rQ6aPBkZTqTiIMBWQIo9x2VA8
Message-ID: <CAGXv+5HRWRW=+Mk2z4qCPrF7zFax9zQJ70Q4ihR6PkWJP0OUrg@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] regulator: mt6392: Add support for MT6392 regulator
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Fabien Parent <parent.f@gmail.com>, 
	Val Packett <val@packett.cool>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Gary Bisson <bisson.gary@gmail.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Julien Massot <julien.massot@collabora.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_023608_634133_41B00138 
X-CRM114-Status: GOOD (  25.69  )
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

On Mon, Mar 30, 2026 at 3:39=E2=80=AFPM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:
>
> Il giorno gio 19 mar 2026 alle ore 06:04 Chen-Yu Tsai
> <wenst@chromium.org> ha scritto:
>
> > If this PMIC is anything like the MT6358, then it has 0.01V fine
> > tuning for most if not all the LDOs. It is sometimes needed as
> > a rail may have a 0.04V boost that would otherwise be invisible
> > to the system. And then if you have something like 3.04V set in
> > the DT constraints, you end up with something the regulator driver
> > doesn't support, but the hardware does.
> >
> > Please see how it's done in the MT6358 driver. I spent a lot of
> > time on that driver to make it actually support the full range
> > of voltages, and describing the supplies.
> >
>
> I had a good look at the datasheet (MT6392 PMIC Datasheet v1.0 08 Dec.
> 2016) and unfortunately I did not see any fine tuning option in there.
> I'm sure this data sheet is not perfect as it's missing some regulator
> registers that are clearly used in the Android sources, but there's no
> mention of fine tuning in that code either. I guess it does not have
> that capability.

Well, thanks for looking. FWIW on the MT6358 / MT6366, the main voltage
control and the fine tuning are mostly in the same register. The fine
tuning is described as "calibrates output voltage" from +00mV to +100mV.

I looked into this because the LDO table shows some of the default voltages
with 0.01V precision, but the main voltage controls only have 0.1V precisio=
n.


ChenYu

> I will shortly submit v4 that hopefully addresses the rest of the comment=
s.
>
> Thanks for your help!
> --
> Luca Leonardo Scorcia
> l.scorcia@gmail.com

