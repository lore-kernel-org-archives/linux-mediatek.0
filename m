Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F53CCFA03
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Nov 2025 05:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t2vFD9QfkLV1VBP+0tHhWY7UETMkdp6hXOZQ1SGqke4=; b=Nuzd301x+AlWrbNtpLl0v1vDiq
	wrGHf6iPGJeDVGxnjLtzqzbIJx/oCFECoB8kOol/pK/bsqXIFGOcMayt4yJq63lJHUJQ+xueRLpQS
	9sheTDp2YNQ2qlcG/qoABJVQyS/Amgx4q+rLS3AkBp44wXTGgbVJCMFSqjB3rgk7U8x5W2yp/ak4/
	k/Pod/TcT7kuRQhGTmdhyERD7NTH5RfHiE3WmO55+/0pRWFkQ/Ilfvl9WHevExeE5ccMuQ6xHYdKH
	Jn9hxppj/WLyq06f/hF7ESQ/imKIafHDr+9Qp9tyEgzQiEZcsWSXpaFfooRkYyH5GtO6zouEKLHMQ
	+ABAOHGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGsv5-0000000EuE1-3Mlc;
	Thu, 06 Nov 2025 05:52:27 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGsv3-0000000EuDV-1eGS
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Nov 2025 05:52:26 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-594516d941cso86104e87.0
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Nov 2025 21:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1762408343; x=1763013143; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2vFD9QfkLV1VBP+0tHhWY7UETMkdp6hXOZQ1SGqke4=;
        b=SP5bmJR+wR72luVdTfQKtKaDpjIhN6oBMKLaaWay6OfXVp2apI4xIXlIzCiQ38m0by
         JlmTMqdbPDSJbJiEWVukqMix1jhV6kiJS54jAWLdQqidmns37tVeGMmQyDI5Aal2t7dr
         +ovkfXKtkM3bmk5/SimPf+OK2DB/h4D/iPJ6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762408343; x=1763013143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t2vFD9QfkLV1VBP+0tHhWY7UETMkdp6hXOZQ1SGqke4=;
        b=vozHI1BtoLn7ayav9dRlfJWl3UBzWjv859zaEUoBtYIuL/eEWa9Chgx2NRHDRC5WxR
         rt/InUEVGwSUeRaJWYincePeRhV3mg7TDaG/Maezjlv8xh10fj+63qyNvFit5pMicTkz
         whPafWovOVbQWXDIL9mdgt8kywMEVA4nW69VIE62LOjRtxGstmF5JpAdPuhNKEvBjW7X
         rsJFrB8+VRnj/BQFeRTQm55Y61Y5ir/owZt90DwCYRwA6HBUdmaBHE607OPGTEON9M4K
         1/xlk3evCi2l1hC3Lth/uoj8KZ+NbF9NLAlnHLJraJzHfh+u8iWjDsYZBxZRvEPlE+8+
         NkrA==
X-Forwarded-Encrypted: i=1; AJvYcCW3UZrgesPwUdL7MBZ+M0p4N48NOJl4H0fnv/PJuowPByDxMgxwni8aC6/tDcFaGUSzhn5fGaNqKCpFQ+7WLw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyO6kOs8Kh/cBW7+1BHwsZkd2irykjJLelglVg/mkjFnLyz9H/7
	1oNzF2S9MSxggUDjpYmkhma5zreDBERO7JFoZbEYvY0+yIVFsuw9f9Z7eJ2aw0FvKGnA4WxLfsw
	Uxsgi5x8RquBRE6/azbgF/e04NIFYOQNf0O/1mj91
X-Gm-Gg: ASbGncvckiWaKLUihfjIo/senemwkTNxJd1MdKPzr59sQu3QiuPZiVn0m4iD9JssdHy
	SW3rM3fRC8cRnmw4YEaFKhHs5lbdSQ3o15H+4nioOU2L/9B4oMWQ0SShQlnJb9BfxVHy2brcY2n
	2X5tGK87onB9ostX8oVwPdSDX2k234tbF3GEis7a4T/rc5bLo91fVJPggjFxxcRD1zFEj8whgYg
	KBsEYFxftfn8cSeqcuBHJOLpm/y2Jv1t/ISxHPa86xXfIhb7nWdfbowI6sx+7tjJgwF0edixUBe
	zJaIMNX5Bke0MA==
X-Google-Smtp-Source: AGHT+IHAob6MV1N00P20nCaMZ0Unl97QFU3xVJ0gGiBJjh2pPEuMa2JaMwEv5WW7Ej34ZKo8sZo0R1CpSdofm5d6p5s=
X-Received: by 2002:a05:6512:39d3:b0:594:29c8:9ae5 with SMTP id
 2adb3069b0e04-5943d8043damr2230852e87.53.1762408343267; Wed, 05 Nov 2025
 21:52:23 -0800 (PST)
MIME-Version: 1.0
References: <20251105062815.966716-1-wenst@chromium.org> <7250ae04-866f-489c-b1b6-b8a3d8200529@collabora.com>
 <CAGXv+5EwiL_-ozRARH2UBm5znHi1egBoCjmELN=17hvFF_oeoQ@mail.gmail.com> <3e1ffe72-b6a4-45cc-a053-190077818f19@collabora.com>
In-Reply-To: <3e1ffe72-b6a4-45cc-a053-190077818f19@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 6 Nov 2025 13:52:11 +0800
X-Gm-Features: AWmQ_bmokZWwcJ_dGdsfSVTeY3Z9us2jEl3U1CaBt3RNYP_UjKHxSJPC0zLeok0
Message-ID: <CAGXv+5GAyt6U710En_k=fq-CPrq_H6rmc=kpBNw4yXjj8qL2cw@mail.gmail.com>
Subject: Re: [PATCH] PCI: mediatek-gen3: Ignore link up timeout
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Manivannan Sadhasivam <mani@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Jianjun Wang <jianjun.wang@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_215225_497430_AEAFB5C3 
X-CRM114-Status: GOOD (  38.01  )
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

On Wed, Nov 5, 2025 at 7:32=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 05/11/25 10:21, Chen-Yu Tsai ha scritto:
> > On Wed, Nov 5, 2025 at 4:45=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 05/11/25 07:28, Chen-Yu Tsai ha scritto:
> >>> As mentioned in commit 886a9c134755 ("PCI: dwc: Move link handling in=
to
> >>> common code") come up later" in the code, it is possible for link up =
to
> >>> occur later:
> >>>
> >>>     Let's standardize this to succeed as there are usecases where dev=
ices
> >>>     (and the link) appear later even without hotplug. For example, a
> >>>     reconfigured FPGA device.
> >>>
> >>> Another case for this is the new PCIe power control stuff. The power
> >>> control mechanism only gets triggered in the PCI core after the drive=
r
> >>> calls into pci_host_probe(). The power control framework then trigger=
s
> >>> a bus rescan. In most driver implementations, this sequence happens
> >>> after link training. If the driver errors out when link training time=
s
> >>> out, it will never get to the point where the device gets turned on.
> >>>
> >>> Ignore the link up timeout, and lower the error message down to a
> >>> warning.
> >>>
> >>> This makes PCIe devices that have not-always-on power rails work.
> >>> However there may be some reversal of PCIe power sequencing, since no=
w
> >>> the PERST# and clocks are enabled in the driver, while the power is
> >>> applied afterwards.
> >>>
> >>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >>
> >> Ok, that's sensible.
> >>
> >> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@col=
labora.com>
> >>
> >>> ---
> >>> The change works to get my PCIe WiFi device working, but I wonder if
> >>> the driver should expose more fine grained controls for the link cloc=
k
> >>> and PERST# (when it is owned by the controller and not just a GPIO) t=
o
> >>> the power control framework. This applies not just to this driver.
> >>>
> >>> The PCI standard says that PERST# should hold the device in reset unt=
il
> >>> the power rails are valid or stable, i.e. at their designated voltage=
s.
> >>
> >> I completely agree with all of the above - and I can imagine multiple =
PCI-Express
> >> controller drivers doing the same as what's being done in MTK Gen3.
> >>
> >> This means that the boot process may get slowed down by the port start=
up sequence
> >> on multiple PCI-Express controllers (again not just MediaTek) and it's=
 something
> >> that must be resolved in some way... with the fastest course of action=
 imo being
> >> giving controller drivers knowledge of whether there's any device that=
 is expected
> >> to be powered off at that time (in order to at least avoid all those w=
aits that
> >> are expected to fail).
> >
> > That also requires some refactoring, since all the drivers _wait_ for l=
ink
> > up before going into the PCI core, which does the actual child node par=
sing.
> >
> > I would like some input from Bartosz, who introduced the PCI power cont=
rol
> > framework, and Manivannan, who added slot power control.
> >
> >> P.S.: Chen-Yu, did you check if the same applies to the MTK previous g=
en driver?
> >>         Could you please check and eventually send a commit to do the =
same there?
> >
> > My quick survey last week indicated that all the drivers except for the
> > dwc family error out if link up timed out.
> >
> > I don't have any hardware for the older generation though. And it looks
> > like for the previous gen, the driver performs even worse, since it can
> > support multiple slots, and each slot is brought up sequentially. A slo=
t
> > is discarded if link up times out. And the whole driver errors out if n=
o
> > slots are working.
> >
>
> Hey, that's bold.
>
> If only one driver (DWC) is working okay, there's something wrong that mu=
st be
> fixed before that behavior change goes upstream (which it already did, ug=
h).

To be fair one only runs into it if they convert over to the PCI slot power
description in the device tree, and their hardware isn't DWC based. This
is pretty new.

> This needs attention from both Bartosz and Mani really-right-now.
>
> I'm not sure about possible good solutions, and unfortunately I don't rea=
lly have
> any time to explore, so I'm not spitting any words on that - leaving this=
 to both
> Bartosz and Mani as that's also the right thing to do anyway.

Mani mentioned [1] that work towards moving the pwrctrl stuff into drivers
is almost complete. So I think we're covered.

ChenYu

[1] https://lore.kernel.org/all/rz6ajnl7l25hfl2u7lloywtw7sq7smhb63hg76wjsly=
uwyjb7a@fhuafuino5kv/

