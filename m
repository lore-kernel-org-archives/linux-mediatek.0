Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15F7C77B78
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 May 2023 19:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=prkycoKFrtYOB9sqzJph1/Wh7+dUYl73V0ySsrK86tE=; b=h15NUZVxWnCQ0d3cgcO7xFtkxr
	MSmUo5c5lDHDzj2Dq6PYYhVN7+6rkeJ1f+rY2I+NPAuB8n2Hd0zioHVodT8fjhlxZjSi3yQ9ICB8f
	+fzJh8TenfcNcvHHGgXbKeJLfBTjcPldzApkpW0WcAuba0/1S9XMVDXXx7hWxjc81kOnc7usfTIx3
	YuItBwD4AqSWNN8t/qpomhcQEB4HIw82LJtKFS2QDQ3xUQ27q6ajUihP6O/+bvAbzCSY8N5tzBGM/
	OKquT9ZX7XaaJCjOK1plfdtU6bt3KvcpHAwT9C/tBT6Wa2bXN85VN/+nztB/zXdp4vOwRYFYku9Yk
	VhFjMbrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptvFb-002QC9-0s;
	Tue, 02 May 2023 19:01:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptvFX-002Q9Z-0P;
	Tue, 02 May 2023 19:01:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 23FB062810;
	Tue,  2 May 2023 19:01:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12C38C433A7;
	Tue,  2 May 2023 19:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683054076;
	bh=prkycoKFrtYOB9sqzJph1/Wh7+dUYl73V0ySsrK86tE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rf/Ymu/EiSQOPePfJMJv1847ZBWRjnjneowURtOqNMODuCRTfcl2GQ0h/jO2AdmCs
	 leEyX7R6GR2dka6/IsiyySID/QcvyxsSv7fNtmEEy0Cm9A6hC1sqxMJ+9jfUBya5xj
	 ODLup2MnZzYCOUMdIZzoCrk5OSl4AOnL/7/DJbtkd5lptoW7/0YbgOkcgOH14mk6Au
	 qACeCdnoaBW8B9rF8o7n7shq7gT7w0jQTaVjP3mXHg69IyA+TLldeHm4Y1C5mj86Z3
	 uRYRPp4016gJq/2Xf9LklNYOIaWs99spKYSrk9MtOv6rk+8yKfvzOFwqXzWomFJ/+X
	 cezzz3yUhjKtA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4f00d41df22so30189113e87.1;
        Tue, 02 May 2023 12:01:15 -0700 (PDT)
X-Gm-Message-State: AC+VfDyG1CQwfwF5bTh/IltplGzpBM/o5QGv0LT4De8A8KsyI85aJvr8
	Whv4V/Cic/aAclh67qew4f4m2UJmmnGZaAL7Dw==
X-Google-Smtp-Source: ACHHUZ4aQAyOb+PGJ7PQfIp0PiLUMh7I0dBEHOyVsVppKRO7n40/yktfmotxwSexv0gCD3XVcEmYB9ah5iQIzUMa54Q=
X-Received: by 2002:a05:6512:3b07:b0:4eb:412e:b06a with SMTP id
 f7-20020a0565123b0700b004eb412eb06amr237890lfv.22.1683054074001; Tue, 02 May
 2023 12:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com> <CAFr9PXkgrRe-=E=GhNnZ4w1x_FMb97-_RmX6ND1vEd74_TbZSw@mail.gmail.com>
 <4ff4f171-c5f8-87af-aad1-5e7686292288@microchip.com> <45bc13a8-1442-2dd3-b9ea-1ed2f5962bac@arm.com>
In-Reply-To: <45bc13a8-1442-2dd3-b9ea-1ed2f5962bac@arm.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 2 May 2023 14:01:01 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL7t47x-5U6STynwW-+4wJUhs_R9wuaQ0YOgX59aJ=vew@mail.gmail.com>
Message-ID: <CAL_JsqL7t47x-5U6STynwW-+4wJUhs_R9wuaQ0YOgX59aJ=vew@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
To: Robin Murphy <robin.murphy@arm.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, Daniel Palmer <daniel@0x0f.com>, 
	Ansuel Smith <ansuelsmth@gmail.com>, Claudiu Beznea <Claudiu.Beznea@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Santiago Esteban <Santiago.Esteban@microchip.com>, 
	Cristian Birsan <Cristian.Birsan@microchip.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-actions@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@axis.com, 
	linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	kernel@dh-electronics.com, linux-mediatek@lists.infradead.org, 
	openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org, linux-oxnas@groups.io, 
	linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-realtek-soc@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_120119_261549_AB48403C 
X-CRM114-Status: GOOD (  20.64  )
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

On Tue, Apr 25, 2023 at 11:21=E2=80=AFAM Robin Murphy <robin.murphy@arm.com=
> wrote:
>
> On 29/03/2022 9:50 am, Nicolas Ferre wrote:
> > Ansuel, All,
> >
> > On 28/03/2022 at 10:55, Daniel Palmer wrote:
> >> Hi Ansuel
> >>
> >> On Mon, 28 Mar 2022 at 09:09, Ansuel Smith <ansuelsmth@gmail.com> wrot=
e:
> >>>
> >>> Hi,
> >>> as the title say, the intention of this ""series"" is to finally
> >>> categorize
> >>> the ARM dts directory in subdirectory for each oem.
> >>
> >> While I agree with this change and think it's for the good (browsing
> >> the ARM dts directory at the moment is frustrating..) I think
> >> buildroot and others need to be told about this as it'll potentially
> >> break their kernel build scripting for ARM and probably messes up the
> >> configs they have for existing boards.
> >
> > This aspect mustn't be underestimated and I anticipate lots of issues
> > during a long time on this particular topic of "build systems".
> >
> > Another aspect is CI and public or private testing farms we all have
> > running.
>
> Yet another is if this affects what `make dtbs_install` does (I don't
> know for sure, but I'd be inclined to suspect it might). Some distros
> use that to deliver the DTBs as part of their kernel package, so if
> paths suddenly change it could break end users' bootloader setups too.

Indeed, this came up last time. Turns out I had already implemented
support to maintain the flat install. I just re-wrote it since
Makefile.dtbinst changed completely since then.

Rob

