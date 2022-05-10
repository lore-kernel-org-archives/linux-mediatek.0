Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B108C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 08:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P/AH45yuHRME0Lnyb4spFXK0Y9F3w0qYgmTkrWycvrI=; b=J4JaYmtaujwqTm
	6ZK42a37SRyIU9GizTWDbTF4pwX0/dZq75+jRu30ZgYdwXSTsuHV6fUE1BQ3mpLyP3hfv5OikWbtc
	syNyMqm0oXyuM0a4X32pC0EoZDXK4S48Upm16T+Ho3caOPYt6HzMYnSm/0EbUhZUd47eDbmijWDem
	JhnWO3GubVmxzRtErqgvPD5G+xQhuyBp5l5IkvAhiWGycH5sfe0iQaY9J8C83YRsi/WJH5m8DI6O5
	/ENpHQ7/q1ymiCdEjfrBA/4S2qZF5F5bIixWP+U5DdNkp22sN8GVxnTCa9QwXF8YghPrzXM7RcUN1
	ELeHSYvNU1gcWa+hvlZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noKmu-000U4G-Cj; Tue, 10 May 2022 08:00:08 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noKme-000Tv4-Db; Tue, 10 May 2022 07:59:54 +0000
Received: from mail-yb1-f180.google.com ([209.85.219.180]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M3UhQ-1nnmYC46Ko-000YN0; Tue, 10 May 2022 09:59:47 +0200
Received: by mail-yb1-f180.google.com with SMTP id v59so29207897ybi.12;
 Tue, 10 May 2022 00:59:46 -0700 (PDT)
X-Gm-Message-State: AOAM533IWIlMIMcLJcEmQ67KuhjAM4Kl/FakA4paixz24AQHxZMZ+gOc
 QAOS/hBh1BgAKRN3+CfFyr2yHodLy5fp54Zl8pc=
X-Google-Smtp-Source: ABdhPJxZkma0O6QtReHOkgdZVslQ52BEo6cVnAkEKrGL7gi26GMpuYJF5exwXilUaUijrom5XbzZGHxoHSjm/Bt1+OA=
X-Received: by 2002:a25:c604:0:b0:645:d969:97a7 with SMTP id
 k4-20020a25c604000000b00645d96997a7mr16206286ybf.134.1652169585696; Tue, 10
 May 2022 00:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220510152020.1.I6094f0a935212eabc7d9348d6cb5a2517ccc2514@changeid>
 <CAGXv+5FBJScU_-YC=vhPVM0KEO5vtP=KOH_gRnpFivQaHziU_Q@mail.gmail.com>
In-Reply-To: <CAGXv+5FBJScU_-YC=vhPVM0KEO5vtP=KOH_gRnpFivQaHziU_Q@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 10 May 2022 09:59:29 +0200
X-Gmail-Original-Message-ID: <CAK8P3a06-fCBUAu3KWu75yBsdN9M4szkr+7Ngu8FcO+jW+PYhA@mail.gmail.com>
Message-ID: <CAK8P3a06-fCBUAu3KWu75yBsdN9M4szkr+7Ngu8FcO+jW+PYhA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8173: add aliases for mt8173 mmc device
 nodes
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Eizan Miyamoto <eizan@chromium.org>, LKML <linux-kernel@vger.kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>
X-Provags-ID: V03:K1:rdbBjRNi3/V2yGy6GvhFhsSdSajteiiy0B99D7DldqUSM2hMoDx
 2Nl+figpLfEDhU02w8Usa3dKnqGF26KBvcO+PN09BSNKQHz4778YWqX08+OIlAvB/4qGEDX
 gUZHTA+qFHdanp7ZdXzMPOcd8nM1cDTJj6A5qSdesObLBu+VaOsqF7KgUX50Y+EGp9YkN5w
 qcMLiO0TKr2m0O88avpyQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ymP+a+DaIYA=:ShCLXO48qIuh6Tkdo1FpJL
 mVwfIypwTuc+/1fCvvzFb45LPX6gKpjQtZjfTHKcK43QxX9v9Ti+XVYfMo+3SJIYcrQD+uJfS
 L5sTwX8Hj+X7oD0au+AVv/l4DugUvWvBb2mXTZB2XnJyRIdJ96n8QLORuaji5X/MYwH+IIFuh
 8+gPIrUd+vHllVySuF5SvCoPQchBRhAPNAE9hmlVg97Pz4fFTuRrJRqSi9czEI2wfeaQOvBtF
 8AKhiSWT1Op2IEfR9XKEVU0yzfAL3kAAQNXRX1LTk64Kw8VSEb38PLZXSdeLOoZAAnSkNGUim
 3MksEgNL6wXgFOEYun021yLXIxZ7nFfYJ4EK8dc0SKWK5/2ScZrm6XP1ulJfImveudAbDemKb
 xsua5oZPLGjSJ5PiiGKCAXBG8upI1XueO/5Jxez5jbzFLhatA9GPz+7l/zbHpSbcz+JK4tJqq
 w3StYqdUBFSs5/Rpu69y57IRZLghXU8gWv8XuQhTBB1Fij1d8XwmqcTOTKq++IKVM/5CtbLnp
 6poMJQASO6GypFVgC+8aDmfI/4acacfTWifGRrYFyBObvpT95TE4Kw5NeakDtQTkYqcqKGfQc
 7Or2PmBJeWIDq1Htz3gDXm6kneAhZP1gEZchUxCXx8Ezrl7IYPegcM8bVM1aBBbcFEd0tNVCp
 92h/tRHtK/BetHODmQ+g4zadjayDuQ72rASR1X4T0egsG1yv/Y+NgY7VXVWUSz5AVkXXVE6s1
 xnN1LYsIG+nEGRKf9dTHCu2yEzBfbecJFK32sQY92jsRaGtEr+fGs+nrT4gbK+NYzIuT565Z3
 lXVlpgfIB/Nk3VoSpKjtHs5L+FR5AZ1hqFzZxSj9OsZDpI++Ao=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_005952_793136_7CF8EE8B 
X-CRM114-Status: GOOD (  17.57  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, May 10, 2022 at 9:36 AM Chen-Yu Tsai <wenst@chromium.org> wrote:
> On Tue, May 10, 2022 at 1:21 PM Eizan Miyamoto <eizan@chromium.org> wrote:
> >
> > Doing this makes them get enumerated in a deterministic order so that
> > the assigned name in /dev that the mmc devices get assigned is
> > consistent across reboots.
>
> Arnd, one of the soc maintainers asked folks not to do this:
>
> https://lore.kernel.org/all/CAK8P3a3_uO23Y0tyfdh26tmCVcyp6XM+ur0WUd4khGUoBb32Hw@mail.gmail.com/
>
> and subsequently all mmc aliases for Rockchip were moved to the board level.

Right, please move the aliases into the per-board dts files, and make sure
to only list the ones that are actually connected on a given machine.

> > See ead9f7d7ea9 ("arm64: dts: qcom: sc7180: Assign numbers to eMMC and
> > SD") for similar work.
>
> I don't know why it didn't happen for Qualcomm though.

It takes a while to get things consistent, need to have another look there.

      Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
