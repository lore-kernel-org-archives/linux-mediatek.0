Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E929C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 17:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aYgIyvMvRWICpRScbQV/k/jY5uYOgDdkXOWDfquSjCo=; b=u6OjnQWUEd29Z8Dkcyit+mkSVh
	Hwp/W0lmIyzU/ca2UVdszECtepFKZfK8QVLl1rho6VJWRqq2p1dPDW19WZVlv9n/kveLkdmJjjlCW
	H5qdcuG9tdbPO4Gb5Jl+kRI17Bnq5HmNAHK9XAZ10n7cEAOwAodu1yuzG/oWiTd9H4Nl/y9m8mmhb
	toZbgLNnWcT/ddg+/aPPDrn65c/KotjrCOJ0ENo3ByWKBy6A3RHTJ4cdCuBHAOvqjnIxN0r4KhhfD
	Awp5kRWO8IXvv1gHTRbWUr9tw+CkkFOON2BDhQVvqLIJ4AU8MQTjaHcuPOhQtXLxxVEmwEzS5jTOR
	oWHFN+oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwQL5-00000009MPb-2AYc;
	Mon, 15 Apr 2024 17:41:55 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwQL0-00000009MNU-2XOT
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Apr 2024 17:41:53 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-dde0b30ebe2so3141618276.0
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Apr 2024 10:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713202908; x=1713807708; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYgIyvMvRWICpRScbQV/k/jY5uYOgDdkXOWDfquSjCo=;
        b=yH89h4plfAGlKxrhUQ/cpE3NHb/32pl/uve2n08K0b2x/RbovzF79MAo/+1zItJcT/
         YbdUNzZVF3mgMfzDmopD1zgbMel+thsduhmGyyPz2s5vJvlnhTwdNgA85bYmxOPmeDFM
         7AEj6HmOybe9PyPAIqirwHithSgBFZ7kt7JXK8F++0J1JRc1w+46+yjji2rs4jO8Srde
         EIv/RRgt+nA6Wk+9J6DRZZdBsiWQorLWqEgTyn/7bFfiTq/VzdcUkwsInGeFW9rPFgGl
         SzUp9qYUiSmIAjh18xl7lxefHC13GD3DQYIJr/fR3eITPKYExsD2MgyS7rhA00HqK81C
         0prQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713202908; x=1713807708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aYgIyvMvRWICpRScbQV/k/jY5uYOgDdkXOWDfquSjCo=;
        b=WGzr+n76pyq3OwqGZiD0oig3tVlK8A/ATkm8Q9X5t3n5HnuCD6JMPmk7oLYdKslcWB
         xkh7ef4cE7vkmlM9aFGk20qYde5ib/Z+d8Q4WqPmKqP9bAgwj0Az7WQLBpdi38e1Wv0O
         32iQI7/2MlPHvHm3ufAHdoeBAReo40BnixKuT7s9VKDxeJ19SrjrQHkNo/CiAPULcvZu
         VqKNaVjTJhGR1D81OjLlU4BJdAOGukflgIAezolXdTn6kRJ1pp4XhUmMH0GN87C+BBAb
         k5xxRblEfdog/yaPA+uaV++Aq9cdAQOfzK8QceyIgih0oZ7MD/ozAnp7jal53mwYPEAR
         RNEw==
X-Forwarded-Encrypted: i=1; AJvYcCUWd2rzcAnevrn7qtLFS56aWXiW1yj1PZmD2vh8E2NUa9xNVWm1vsZq2L2tepH0CyfGa52OU8Fkt6wdfDCY5xSOQKb6fQruICX2ERAIx7nr77ax
X-Gm-Message-State: AOJu0YwtCxqBC0lC/QF2i5J95cAkSdSrcoxrKtwvFwxrKd4lzWZCtNyn
	HaBNnFJu6cPhZu6oqyKwxmNhlbrFTwNL7oAzUkquDnDaxiHedB83rxVqam0JabatpZtBpgetiQK
	Vxs5qXnuzs2ApdN6X3OZS5DA9gfVKSLyWnbIuUA==
X-Google-Smtp-Source: AGHT+IHKpNfr2TaUgVv6Ugvchn9mUOD77xP6+GIEtmI5RLKRLLZLr1EmobTo6CX82MQ9pJIWGNHcl6abRXCvRtZsfeM=
X-Received: by 2002:a25:80c6:0:b0:dcb:aa26:50fe with SMTP id
 c6-20020a2580c6000000b00dcbaa2650femr10533953ybm.15.1713202908173; Mon, 15
 Apr 2024 10:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240412222857.3873079-1-robh@kernel.org> <Zh0vXinxy7woerJQ@hu-bjorande-lv.qualcomm.com>
 <CAA8EJpqL2T4bJZqtZ9KF=V2NLnFxUjouA6_Hu_H07DofifZaoQ@mail.gmail.com>
 <CAL_Jsq+q3OLEMT=d8=d9o1D9deKGQ5TAtZg_bgptDPQ1cWcctw@mail.gmail.com> <CAL_JsqKSz_WVTTi7+AgjgDzXAnAqaxXM3i2NUv93nZSpyuZK5g@mail.gmail.com>
In-Reply-To: <CAL_JsqKSz_WVTTi7+AgjgDzXAnAqaxXM3i2NUv93nZSpyuZK5g@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Apr 2024 20:41:36 +0300
Message-ID: <CAA8EJporYZBfDoN6m0Wu2wGqq=Y+TskNCguMOHtDAz05eXS6LA@mail.gmail.com>
Subject: Re: [PATCH] arm/arm64: dts: Drop "arm,armv8-pmuv3" compatible usage
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>, soc@kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <atenart@kernel.org>, 
	Khuong Dinh <khuong@os.amperecomputing.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Robert Richter <rric@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, "Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-fsd@tesla.com, 
	Michal Simek <michal.simek@amd.com>, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-realtek-soc@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_104150_655120_DFED4755 
X-CRM114-Status: GOOD (  15.82  )
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

On Mon, 15 Apr 2024 at 20:15, Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Apr 15, 2024 at 12:05=E2=80=AFPM Rob Herring <robh@kernel.org> wr=
ote:
> >
> > On Mon, Apr 15, 2024 at 11:52=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Mon, 15 Apr 2024 at 16:46, Bjorn Andersson <quic_bjorande@quicinc.=
com> wrote:
> > > >
> > > > On Fri, Apr 12, 2024 at 05:28:51PM -0500, Rob Herring wrote:
> > > > [..]
> > > > >  arch/arm64/boot/dts/qcom/qcm2290.dtsi                | 2 +-
> > > > >  arch/arm64/boot/dts/qcom/qdu1000.dtsi                | 2 +-
> > > > >  arch/arm64/boot/dts/qcom/sdm630.dtsi                 | 2 +-
> > > > >  arch/arm64/boot/dts/qcom/sdx75.dtsi                  | 2 +-
> > > >
> > > > Acked-by: Bjorn Andersson <andersson@kernel.org>
> > >
> > > Note, we'd need to override PMU compatibles in sdm636.dtsi and
> > > sdm660.dtsi. Ideally it should come as the same patch.
> >
> > Uh, that's an A for reuse, but an F for readability... It's sdm632 as
> > well. Will drop sdm630.
>
> Actually, aren't those Kryo cores just Cortex-A53 derivatives? So the
> A53 PMU compatible is an improvement over the generic one still. We
> can't just add kryo260-pmu compatibles because that breaks
> compatibility. We could have a fallback, but then that introduces a
> pattern we don't want.

I think it is believed that Gold cores are A73-derivatives.

--=20
With best wishes
Dmitry

