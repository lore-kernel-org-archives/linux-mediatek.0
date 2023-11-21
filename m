Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22083C54FB9
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 10:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vvvVHM7viL1Jmzkz/E4yhNDYNAPR+6Zga/hBjsBolp0=; b=XDWj71ntIkU3bQZbZr1tOE9u3e
	+ceZ9uhZk4Vg8Wt6o3MtAjLFn/vYc4gnN0HrwLSuGXcjsoGGzXrY5NviGoCZ9z0idJ9XnmThk0VWk
	dSi6RacPAZP0vXFUCNVIkR9RA0JEFch4Bm4cjQyv2BJHnis3yRULaUSkgDpPIktNZ0NW3H6bLpwk1
	EqQ6jJy/eYvgdN3g9LMxx6kfLpEoa596CqyNc1xKcJTThBaAalm+zy+bX8lfIZ95dinTCkKPwQxG2
	w8mKm0LDdXfxYxkcKnxG/ucKId7qvlo6t5oFzazhVcyPVCNsDa5LveZT+RBD/0CTfSVwUDZ6LMoJ0
	Wjeg+RDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Nl5-00GEAX-0Y;
	Tue, 21 Nov 2023 10:13:31 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Nl2-00GE95-1Y
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Nov 2023 10:13:29 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5b3b17d36d5so49642607b3.0
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Nov 2023 02:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700561604; x=1701166404; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vvvVHM7viL1Jmzkz/E4yhNDYNAPR+6Zga/hBjsBolp0=;
        b=N6Cap3Jz9UGuxZigse8HtNCgiWjTArgM5qIlqeu2aFX8PLUYnQQyAoPqit/6JwB/Tg
         oSEIipNWTLkCgXLYqjwuGJOMAum4r1wVEhHUC1hNM6B1PungIJssziypkoynXv/uFlTy
         7TgqaCWYMXfNqFg5n8ycL5CKoYyn3xL7AqKX4Lbags+nwhz4y7s2MM8ajYR7u/NH8cfr
         6MjKJQ7g/GVhBrFvp8h1+8xQyQ/bKnbudW2bmnSsJL/Kcoql4aSOkmfZuwDSVAlN2Wzi
         SFLzpXPFmuVP2MUhYlpAHontZAOAW5csXc87UuMHxSI48/cqgMhkgywLyV5nHT+/abrc
         zMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700561604; x=1701166404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vvvVHM7viL1Jmzkz/E4yhNDYNAPR+6Zga/hBjsBolp0=;
        b=JBrDoAOxv4+8bHBptDiZ70t6HIwDqxNZaHTPik8xJArzkTsdeHOAxtCNVRKlde3rro
         Wi7fuHCECn6gXptypjohRRe9tZK8/Bsi3QZ+/Q9PHKzLFCyOg80Rj/QQYTe0kF4qSqJn
         WlzZhLZxuF55vgZuE3dZfwrWzTluFiaFWcstAvgRJH0YwkeM7mxsFoxH2zunWR80anvm
         c6BobIfJa6xsvhsmL+nNEhET5zi34gnlwgFNwHoSTQwa6/ahLa6weavCmLbbu2wR6EZl
         Gjm5K6nuJzId5L1z5m9Cq1NOMFD3Nx5fGnwpcCJ3Smdj5w16eogbEmIPigGy2QeATQKc
         sgcw==
X-Gm-Message-State: AOJu0YyCuRS4BlvEbq62m8aUfEhBpD3Sh5QvecCqpPG8Xi/InXiKtIYa
	51eB7VVz21V9K1IwjAq2TcfoOWUdT6R830ZwUc2P2w==
X-Google-Smtp-Source: AGHT+IGyl+3FXfVMW5/uo6prZ2T+50NtUsg/gYXLA7xT5MJNgeqZIoadaWE6u0rFfAURccalW4ny9xhVD7fTcYc7HiY=
X-Received: by 2002:a25:6088:0:b0:d9a:5f53:1732 with SMTP id
 u130-20020a256088000000b00d9a5f531732mr1584303ybb.18.1700561604504; Tue, 21
 Nov 2023 02:13:24 -0800 (PST)
MIME-Version: 1.0
References: <20231120084044.23838-1-krzysztof.kozlowski@linaro.org>
 <19358871-009d-4498-9c13-90d5338b1e9f@amd.com> <76fa8f61-fe31-4040-a38d-cc05be3f4f17@linaro.org>
 <CAMuHMdW4WPJT0Km7w8RWrGJaztk6QDGoFAn0bdGbrEsw81R1FA@mail.gmail.com>
 <acfdce81-f117-4a1a-a9fe-e2b4b8922adb@linaro.org> <bd49f17c-7ebf-4e19-b77b-b5ec95375f7d@amd.com>
 <b48293f3-16e3-4980-b900-add0cb7d69f6@linaro.org> <CAMuHMdV_gqmf2=cXmZmYgE3aLxvPBr1DVp0cz0C+YrfBVG-8mg@mail.gmail.com>
In-Reply-To: <CAMuHMdV_gqmf2=cXmZmYgE3aLxvPBr1DVp0cz0C+YrfBVG-8mg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 Nov 2023 12:13:13 +0200
Message-ID: <CAA8EJpo6w9N_opJkfDaF-20zwZmn6JHrYYhakqzLFqVtgXaV=Q@mail.gmail.com>
Subject: Re: [PATCH v2] docs: dt-bindings: add DTS Coding Style document
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michal Simek <michal.simek@amd.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Andrew Davis <afd@ti.com>, 
	Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Nishanth Menon <nm@ti.com>, Olof Johansson <olof@lixom.net>, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_021328_521812_A6B4AA78 
X-CRM114-Status: GOOD (  25.32  )
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

On Tue, 21 Nov 2023 at 10:09, Geert Uytterhoeven <geert@linux-m68k.org> wro=
te:
>
> Hi Krzysztof,
>
> On Tue, Nov 21, 2023 at 8:47=E2=80=AFAM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> > On 21/11/2023 08:33, Michal Simek wrote:
> > > On 11/20/23 20:31, Krzysztof Kozlowski wrote:
> > >> On 20/11/2023 20:18, Geert Uytterhoeven wrote:
> > >>> On Mon, Nov 20, 2023 at 3:53=E2=80=AFPM Krzysztof Kozlowski
> > >>> <krzysztof.kozlowski@linaro.org> wrote:
> > >>>> On 20/11/2023 15:01, Michal Simek wrote:> >
> > >>>>> On 11/20/23 09:40, Krzysztof Kozlowski wrote:
> > >>>>>> Document preferred coding style for Devicetree sources (DTS and =
DTSI),
> > >>>>>> to bring consistency among all (sub)architectures and ease in re=
views.
> > >>>
> > >>>>>> +Organizing DTSI and DTS
> > >>>>>> +-----------------------
> > >>>>>> +
> > >>>>>> +The DTSI and DTS files should be organized in a way representin=
g the common
> > >>>>>> +(and re-usable) parts of the hardware.  Typically this means or=
ganizing DTSI
> > >>>>>> +and DTS files into several files:
> > >>>>>> +
> > >>>>>> +1. DTSI with contents of the entire SoC (without nodes for hard=
ware not present
> > >>>>>> +   on the SoC).
> > >>>>>> +2. If applicable: DTSI with common or re-usable parts of the ha=
rdware (e.g.
> > >>>>>> +   entire System-on-Module).
> > >>>>>
> > >>>>> DTS/DTSI - SOMs can actually run as they are that's why it is fai=
r to say that
> > >>>>> there doesn't need to be DTS representing the board.
> > >>>>
> > >>>> I have never seen a SoM which can run without elaborate hardware-h=
acking
> > >>>> (e.g. connecting multiple wires to the SoM pins). The definition o=
f the
> > >>>> SoM is that it is a module. Module can be re-used, just like SoC.
> > >>>
> > >>> /me looks at his board farm...
>
> > >>> I guess there are (many) other examples...
> > >>
> > >> OK, I never had such in my hands. Anyway, the SoM which can run
> > >> standalone  has a meaning of a board, so how exactly you want to
> > >> rephrase the paragraph?
> > >
> > > What about?
> > >
> > > 2. If applicable: DTSI with common or re-usable parts of the hardware=
 (e.g.
> > > entire System-on-Module). DTS if runs standalone.
> >
> > OK, but then it's duplicating the option 3. It also suggests that SoM
> > should be a DTS, which is not what we want for such case. Such SoMs mus=
t
> > have DTSI+DTS.
>
> So you want us to have a one-line <SoM>.dts, which just includes <SoM>.dt=
si?

Well, I think it is impossible to run SoM directly. There is a carrier
board anyway, which includes at least regulators. So, I guess, the
SoM.dts will not be a oneline file.

> IMHO that adds more files for no much gain.
> Users of a SoM can easily include <SoM>.dts.
> 'git grep "#include .*dts\>"' tells you we have plenty of users of that s=
cheme.


--=20
With best wishes
Dmitry

