Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EC8C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 17:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XombByiJRrLQEyo+gsqui4Tfdb8HW1KFzb4DaAWMywQ=; b=BkQQO94eI/kVq3BylNmbE3Z9oY
	g1RpWO2I34Yk958bMbGPsAw2IVZENz7TiIw3mgBycTEOQtEkrq9mBP6jxk25BPPRWgf/ST9gRD/fi
	VaSt71Zi2G6bhOFMu4mI09OPzL8VohH9iEYLcfxjF3lRdTJJYmxZPWFcWZZqhtqVtPt19WYHEKlQ1
	VVmc5hzzxt2k1lXzQjSEaLeOGT2AGOUYJ4o0zphKfrxF54O6JMgKgC4eSLMA6KC+Xe1k7dsZMTS5f
	MMC7zjFpzhpRKqueJBBE3gFZFbY46pOBLm3RYHjGs8N0lGeVJYTQ8h2ccQ1UtkoieMQ8VVFeqstHH
	bYj6xPmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPwG-00000009Igy-0HCC;
	Mon, 15 Apr 2024 17:16:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPwB-00000009IgC-2KEY;
	Mon, 15 Apr 2024 17:16:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B0AF060EE1;
	Mon, 15 Apr 2024 17:16:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AFE4C2BD10;
	Mon, 15 Apr 2024 17:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713201370;
	bh=clBNt8e+6YrryyfPUqSdkx19pn4NeG8mB3JuyFyvw8c=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=XiOTkWnpcikqzTLyG6q9HC8Yf1PFVtG1Dl1eBbOi2IQPINtjXOmksWhu/RyIA2nGG
	 bmfF3V54qeEX3IpXHIifv7E8ENg+5KnL+R8XaMweuzKjaDZ+inUH75nRkchBFJ1zJq
	 xcTNnQcKQAuY4CWnXeFDu9TkH67PCScmY0LNAtw8O/Y/6hMMHDk+5vuRw0Dcflmngp
	 Kn8kt8tslfLQjLc6fW/IUrtxp/l8xiJ4QnD1DBJyJ/H+QxkGzB/5YdqlSj8EGtAe+y
	 BOsg3L4kIx2VJCEoF7I/XvN6Kpyx1JSr0+stmnA4mSlqoXHDJFrvLCS6HtZhkO5Ava
	 W/HB1Pjdv6YXQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d48d75ab70so49029531fa.0;
        Mon, 15 Apr 2024 10:16:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX4S3sqWgqptNT5ezTw+npDjYTa8dWB2JUnJ3FvHXZjr7aGx4a3/uOATKAT/x+bJ66prcoEcCZj/+aiy4mY0DmwUqg1EgiuP+4XEDr9sSdPeloKMFRy38i8yWXDAaWUtMNOCQqHZ6Ht9S5q3q6wo37EWnocEMuXsbHyihnGaSJViCc2Q4gtNY/o9O6WU5ui9HRKdUh1T5wu/0T3utA/1VMFbN/c5BwhI+3K6xpS09PuEoyTxSFWyuwAu4LktOGcZxYPL6IAw6wBYonV0LI8Q+41Zmy/5Vhi7kbJV5fjVSjDObLv4OXWt5K+8A==
X-Gm-Message-State: AOJu0YytTH5mH8qI3A63MFqthYDYg0X88qv/ZDQ9IysTXcZt0ET4Zg1L
	jR4Yfwxv9asZ2eMAKysma9ueBvLnE++bFB2z9ONZa/MdZ4vnwToEco5YiXInMwMhgdCiullVEKJ
	mERoYzey8X18nR4e6Wi4tMc1O5g==
X-Google-Smtp-Source: AGHT+IEkz26w525DUde0Uob20fmQI4fd4Chc0AN6DRGivhpSGWQdBtr0Y20V2JMzBwteB/hWf3vT168YMa0bRGYd8lo=
X-Received: by 2002:ac2:41c6:0:b0:516:7738:bd5c with SMTP id
 d6-20020ac241c6000000b005167738bd5cmr6496177lfi.4.1713201348179; Mon, 15 Apr
 2024 10:15:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240412222857.3873079-1-robh@kernel.org> <Zh0vXinxy7woerJQ@hu-bjorande-lv.qualcomm.com>
 <CAA8EJpqL2T4bJZqtZ9KF=V2NLnFxUjouA6_Hu_H07DofifZaoQ@mail.gmail.com> <CAL_Jsq+q3OLEMT=d8=d9o1D9deKGQ5TAtZg_bgptDPQ1cWcctw@mail.gmail.com>
In-Reply-To: <CAL_Jsq+q3OLEMT=d8=d9o1D9deKGQ5TAtZg_bgptDPQ1cWcctw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 15 Apr 2024 12:15:34 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKSz_WVTTi7+AgjgDzXAnAqaxXM3i2NUv93nZSpyuZK5g@mail.gmail.com>
Message-ID: <CAL_JsqKSz_WVTTi7+AgjgDzXAnAqaxXM3i2NUv93nZSpyuZK5g@mail.gmail.com>
Subject: Re: [PATCH] arm/arm64: dts: Drop "arm,armv8-pmuv3" compatible usage
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
X-CRM114-CacheID: sfid-20240415_101611_804674_53905F8F 
X-CRM114-Status: GOOD (  13.61  )
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

On Mon, Apr 15, 2024 at 12:05=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Mon, Apr 15, 2024 at 11:52=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Mon, 15 Apr 2024 at 16:46, Bjorn Andersson <quic_bjorande@quicinc.co=
m> wrote:
> > >
> > > On Fri, Apr 12, 2024 at 05:28:51PM -0500, Rob Herring wrote:
> > > [..]
> > > >  arch/arm64/boot/dts/qcom/qcm2290.dtsi                | 2 +-
> > > >  arch/arm64/boot/dts/qcom/qdu1000.dtsi                | 2 +-
> > > >  arch/arm64/boot/dts/qcom/sdm630.dtsi                 | 2 +-
> > > >  arch/arm64/boot/dts/qcom/sdx75.dtsi                  | 2 +-
> > >
> > > Acked-by: Bjorn Andersson <andersson@kernel.org>
> >
> > Note, we'd need to override PMU compatibles in sdm636.dtsi and
> > sdm660.dtsi. Ideally it should come as the same patch.
>
> Uh, that's an A for reuse, but an F for readability... It's sdm632 as
> well. Will drop sdm630.

Actually, aren't those Kryo cores just Cortex-A53 derivatives? So the
A53 PMU compatible is an improvement over the generic one still. We
can't just add kryo260-pmu compatibles because that breaks
compatibility. We could have a fallback, but then that introduces a
pattern we don't want.

Rob

