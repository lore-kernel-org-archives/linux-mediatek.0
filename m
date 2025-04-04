Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF466C36014
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Apr 2025 14:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C2TPJrUENIZhg+jjkWL7t6plBZLQvnhMuJOgRGwcC7o=; b=nHZIkp8aKWpxKBc5RsIlWstruP
	HEJ9c5PkWGefRpj/4VCiG/W4qGS7WDC6pTKjHy8JPbfd41DaBrdL8K0pqSW7qrZwVVk6GiGKn79R5
	C+wiS6mwUB6B9zEXRdH+kmT9dBDWoN+FLPvQ29p4Q482HWrz2qvAV0dx9mUE6GILlqKlnBpQ5KYZg
	5D0oPzVmXoYAtQ/zxnJ7lZfeS4MpHnz7r/gCd8hjSwPQ5db4etj+amcWFxWuXZK8AV1GiElXcfNsz
	Cl3VxuCKfm06YRMVPYYtUr3XgFGrasNFydOjnZFyjGfM610CQjzY0NiIWwwtG2WAbYF9bObyZj72o
	pnpr6MnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0hkB-0000000BwkL-3Hi6;
	Fri, 04 Apr 2025 14:10:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0hfY-0000000BvxE-1IIp;
	Fri, 04 Apr 2025 14:05:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4526045076;
	Fri,  4 Apr 2025 14:05:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F935C4CEF5;
	Fri,  4 Apr 2025 14:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743775515;
	bh=sXc59e9oCS1JyARzmEkCFC/sWd+6b3k5Zd9xARKgKhU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nCGf3I9tEmCSvB0E76/BUXH6Nk1Q786Smv1KYQf7QmCCD9o9Vf7Jhiuw+t0LRBV69
	 fCQDUgY4uJnXj9Qtye3sGi5fSmLjQJjXNRK/EEEdrFO4FIOnMma7eAkGuyZRmfOSfg
	 hldrIX+bb9WXeeI5iiR1rh1rVUuQqiXwgbhatKkxVl4shFjEMD6B/1hgd5VDxXk3s1
	 2GLoeerZIcXyrkvsszXm+iKisJa7hv/VYq64834LR35wmHqQST9N7TujpLPgk8EdVT
	 UcAJ9djGAUQ/qu7XPoq1vjZ58Lh+q8niDbtBdREOB9J7EnKo65uRZQ9qCRO90Gcjnk
	 R08WFLmx941ew==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e6ff035e9aso4063983a12.0;
        Fri, 04 Apr 2025 07:05:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWJwCWvquNOqZx1+x6N7nRI3HOMGYjQMrfik0HNKkz7C4tfNhygELV+fo3QswR/eX41FLMq4LcT69cm9JO9l10=@lists.infradead.org, AJvYcCWKtnBlG3UOqe3oTLWHKHNygCUfVe5PlQNT7e1/gGXdRBkWO0j5qYLaPNGxBDNfCV5FjNOonxKhJHja/edwH10=@lists.infradead.org, AJvYcCX+tvt/jip5fJ0Q9xo48xvCaDI9ik9l8j8OUqW3aIZHf0Y5ImrMkjTsgcfS+vUK0YRdq6+J/D8qaXrrBfQo@lists.infradead.org, AJvYcCXdm0eYgirIqOUJUX4SNYsNrVm337ztQHpKfbsRBF3XpAw2hR7PzezYTL1zHILoT3cwIB7ypWFTN5IEEgf2WRSTLA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzVmPPgxbG4BvIAS5Uu5alYyFMJSkIw4qfOPY8EIH4CEOamlKVM
	dRL8e3EcI/zdGrbQuiBRc/jt2rB7abvI30PqIsWnghvo9+Ymo3CW+KG6LVi+RmYvonPA1PEzenH
	BFdna0+fe8z1ZYU4bf5p3XERFeQ==
X-Google-Smtp-Source: AGHT+IGvjzmo+S0oZ7wclO731FKO/yFH3v6rfa52+MwQrSf/9tdEEQ9A/kWSXMLtJKL4wmLWRjaXPrcr+vGPnUPbJIE=
X-Received: by 2002:a05:6402:5112:b0:5e7:8be5:d189 with SMTP id
 4fb4d7f45d1cf-5f0b3b62317mr2699905a12.4.1743775513430; Fri, 04 Apr 2025
 07:05:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-9-076be7171a85@kernel.org> <CAPDyKFoEEp8AZ7aJ8-wwp8=n+T4gbij15oYaCNhF1Bd-E1nMbg@mail.gmail.com>
In-Reply-To: <CAPDyKFoEEp8AZ7aJ8-wwp8=n+T4gbij15oYaCNhF1Bd-E1nMbg@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 4 Apr 2025 09:05:02 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLB7SpVNTVruAb98YEPC5sRpssjsSP=NkqdON6qP+74fw@mail.gmail.com>
X-Gm-Features: ATxdqUGVc4_Mt0PqKKmf21CRVRmw-a_zuqLCxbME19ZuBODzSy1GgUUs6hNAKo0
Message-ID: <CAL_JsqLB7SpVNTVruAb98YEPC5sRpssjsSP=NkqdON6qP+74fw@mail.gmail.com>
Subject: Re: [PATCH 09/19] arm: dts: qcom: sdx55/sdx65: Fix CPU power-domain-names
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
	Conor Dooley <conor@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_070516_385507_4DFD7504 
X-CRM114-Status: GOOD (  22.01  )
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

On Fri, Apr 4, 2025 at 5:31=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.org>=
 wrote:
>
> On Fri, 4 Apr 2025 at 05:02, Rob Herring (Arm) <robh@kernel.org> wrote:
> >
> > "rpmhpd" is not documented nor used anywhere. As the enable-method is
> > "psci" use "psci" for the power-domain name.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  arch/arm/boot/dts/qcom/qcom-sdx55.dtsi | 2 +-
> >  arch/arm/boot/dts/qcom/qcom-sdx65.dtsi | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi b/arch/arm/boot/dts=
/qcom/qcom-sdx55.dtsi
> > index 39530eb580ea..64d9858b4248 100644
> > --- a/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
> > +++ b/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
> > @@ -57,7 +57,7 @@ cpu0: cpu@0 {
> >                         enable-method =3D "psci";
> >                         clocks =3D <&apcs>;
> >                         power-domains =3D <&rpmhpd SDX55_CX>;
> > -                       power-domain-names =3D "rpmhpd";
> > +                       power-domain-names =3D "psci";
>
> As I understand it, this isn't for cpu-power-mgmt but for
> cpu-performance-scaling.
>
> I have been thinking of adding a common power-domain-name for this,
> but never reached to do it. I think the last one we added was the
> Airoha SoC [1] which uses "perf", which seems to be the most common
> one. Still I don't see that being documented.

It's all a mess and abuse of the power-domains binding...

"perf" is documented. I can add "rpmhpd" I suppose, but I don't see
anything using the name. Or I can remove it.

Rob

