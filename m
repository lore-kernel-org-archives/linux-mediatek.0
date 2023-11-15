Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3F6C5ACB2
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Nov 2023 21:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ewEC6w4FNjvRn1QtThPipzsUOHfD/ElUE10YdHZBpE=; b=4plkt1qwSQoUWA7ZZQZKqg+w/m
	7QeJqlWTs5WhNYqNPhOuMh941qPZ+uYbFa1gTt7Hqd1S4cTvcovr94wbkAjGuymjIVwOuSVDTn64E
	DQGtEahaHmjE99xUBpyKpoXqJJlo4I4JHSvsYSEt0uJ2iogjQSs0u/Vm5B3zipQzm3OlFDFOasC9f
	IpGMP080suAq+qXgz225ZyYXNCQTModM08Q3ZH36DDhq1q3NkIdf8oDTsM0TWWRQJB3tzH7RZblwF
	pABzWtxe4Utm/j5zivnCdzimxsoX2ymN7Jd7hXoJ8iuZ0zlXu2+BnUAruqxenTM4N/HtETXMNnTQJ
	6PxmpvPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3NXU-001mer-2m;
	Wed, 15 Nov 2023 21:35:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3NXR-001mdN-2i;
	Wed, 15 Nov 2023 21:35:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B4246182C;
	Wed, 15 Nov 2023 21:35:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 132C6C433BA;
	Wed, 15 Nov 2023 21:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700084108;
	bh=RWdpyuo51tuvIqwMGTL3/I2DqmEZBZKqCR84EaR63Ic=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ax7GU+e8NoT5NkhfbCkd6P6Edug5yH+pW3/V5VyW1TLH2HPz/nr8R2GsxsPPVVGO/
	 lkVfE0amR6D0oREGacbWEFDSThlzJ3Pm0CER2NugqFfsP0Qye78NcoEx79ePWeiK/N
	 4GtOmqctClRVu77IayArzEX3uErPWajp+mdTfHt+FPR4QEM7HqzyFPPRgwQLnG59yu
	 yM1iH72Ttd3X+Ga/HmssO1USouNL74sFTlcfI0TMsslOwjnn0uMTkt/djrjl4wGANN
	 xaaIuNoJGhaqoIcWxPaLgWUy/WQzFirCRX3c5F+wRRn+5cKfxKkY9WyIEZvt/p5TbR
	 odUwMB52SGjpQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-507bd19eac8so153264e87.0;
        Wed, 15 Nov 2023 13:35:07 -0800 (PST)
X-Gm-Message-State: AOJu0YxF3xfmcVNNLhdUYSj9NQC7polFGAIACWPutMR4tFbg77Tojf7e
	rBLPqtP6yJ/A+N72PJQbjHtLRb9vIpzTcXBQIw==
X-Google-Smtp-Source: AGHT+IFl6KjrcRk1mQBCW5HE5cpfkWvGnPq2lzZKYvuAbqxy2DSLTn7CJKpIC3Dea3cgv04VsyssEPWyJ1Gce9eCWAA=
X-Received: by 2002:a05:6512:3f12:b0:507:a6a5:a87b with SMTP id
 y18-20020a0565123f1200b00507a6a5a87bmr12750059lfa.51.1700084106033; Wed, 15
 Nov 2023 13:35:06 -0800 (PST)
MIME-Version: 1.0
References: <20231109100606.1245545-1-wenst@chromium.org> <859ac058-c50a-4eb8-99b6-3011ef4e7529@collabora.com>
 <CAL_JsqK64w3+r_LJZoh50PzAUcsvH6ahSDCqgSiKrD3LBAXE9g@mail.gmail.com>
 <CAD=FV=VUZy9DaZgKafSpXXopD5k8ExGSR97BjAqC5tupPoxNfQ@mail.gmail.com>
 <CAL_Jsq+puq20EWkQg1RTs2zfmh4DGbqz1krp+19c=wPXnLT5dA@mail.gmail.com> <CAD=FV=X-17COQ2-tycV1bSuCrGy7MJ88Un8nA-a-ODexvgi9TQ@mail.gmail.com>
In-Reply-To: <CAD=FV=X-17COQ2-tycV1bSuCrGy7MJ88Un8nA-a-ODexvgi9TQ@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 15 Nov 2023 15:34:53 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKR_YD6hm4Lv+OuCKms8Ha61BZRKUuiLYPgSkz3_3NCFA@mail.gmail.com>
Message-ID: <CAL_JsqKR_YD6hm4Lv+OuCKms8Ha61BZRKUuiLYPgSkz3_3NCFA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/7] of: Introduce hardware prober driver
To: Doug Anderson <dianders@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, andriy.shevchenko@linux.intel.com, 
	Jiri Kosina <jikos@kernel.org>, linus.walleij@linaro.org, broonie@kernel.org, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, james.clark@arm.com, 
	james@equiv.tech, keescook@chromium.org, petr.tesarik.ext@huawei.com, 
	rafael@kernel.org, tglx@linutronix.de, Jeff LaBundy <jeff@labundy.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_133509_989632_03C612D6 
X-CRM114-Status: GOOD (  31.57  )
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

On Wed, Nov 15, 2023 at 2:45=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Wed, Nov 15, 2023 at 2:28=E2=80=AFPM Rob Herring <robh+dt@kernel.org> =
wrote:
> >
> > > So if we're searching the whole device tree for "failed-needs-probe"
> > > then we need to figure out which devices are related to each other. I=
f
> > > a given board has second sources for MIPI panels, touchscreens, and
> > > trackpads then we need to know which of the "failed-needs-probe"
> > > devices are trackpads, which are touchscreens, and which are MIPI
> > > panels. Do you have any suggestions for how we should do that? Maybe
> > > it was in some other thread that I missed? I guess we could have a
> > > board-specific table mapping (compatible + node name + reg) to a
> > > class, but that feels awkward.
> >
> > Node name is supposed to correspond to device class, so why not use
> > that (no path or unit-address.) and nothing else (well, besides
> > "status")?
>
> One problem is that I could imagine having two second source trackpads
> that both have the same i2c address. That would give them the same
> name, right? I guess you could maybe come up with some sort of suffix
> rule? Like
>
> trackpad-1@10 {
>   compatible =3D "elan,blah";
>   ret =3D <0x10>;
>   status =3D "failed-needs-probe";
>   ...
> }
> trackpad-2@10 {
>   compatible =3D "goodix,gt7375p";
>   ret =3D <0x10>;
>   status =3D "failed-needs-probe";
>   ...
> }
>
> Then I guess the class would be "trackpad"?

That issue is somewhat orthogonal because it is not following the spec.

I'm not sure mixing the 2 styles of node names is a good idea. While
not used too much, matching by node name does ignore the unit-address,
but I'm not sure we could ignore a '-N'.

I think our options are either add something to the unit-address or
use i2c-mux binding. Adding to the unit-address is not unprecedented.
I did that for some of the register bit level bindings where you have
a node for different bits at the same address. The downside is
unit-address is bus specific, so we'd have to add that for multiple
buses. For the i2c-mux, it's perhaps a bit complex and I'm not sure
what if anything you'd have to do to manage the mux that's not really
there.

Rob

