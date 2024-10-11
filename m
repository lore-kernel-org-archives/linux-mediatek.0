Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD7AD0EE3F
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Oct 2024 22:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KyQm37SkwQEwPVClTlp5zR8is3bgIveYYMdhrWyx0yc=; b=Jpy0PXPgL2phdV20g7hnJqL75E
	YJZ7qRchK+4jAZ56eKdK8EVmJ5G+dDk5/JdYI4z1skha/xFtCTKh3pUgagDoc9D4KqRhPH/4gF5Kw
	GLun4LeKP6ceNeeNXG4XZESoyP/hObP0r597qZhEC196GDvaALZP5FaeiTqUcHJ3/+9QEwqrAQA3Z
	Y0mc53nvlUd0yX/36tMfsKwYQAbB70bcDlH5m/PGrLJeZU6mwLohzqHn2SAA1cZfUWNr6D+42B7Qs
	luJNN0t3E7/ZpOpMT8QKlse/YhGJiQlzVsLypbdXQgpD7OlJaft4jHgrI2WPbndWcGcXm2wt4jq0e
	vRoVEUCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szNwH-000000004xW-3mT9;
	Fri, 11 Oct 2024 22:16:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szNus-000000004rt-3uRL;
	Fri, 11 Oct 2024 22:15:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E18BEA45131;
	Fri, 11 Oct 2024 22:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF1DEC4CED3;
	Fri, 11 Oct 2024 22:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728684920;
	bh=ELP8L478B16ztqydobuxgj5YxtYig7+S68KIYDDeqLY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Zjn5h6bxsTfHdSjmsw3xZzC9NnFt9LLBRiL1gLEZ9MPe2rHf2VFBr3wdq0x0zPlO0
	 TmhfWnV4qr9xzLDdO5oFi0dQ6r4vsHF1GbotmtsS9f6GJnv3zfyZjIYQMMSDn3hp/k
	 ZboIwLveYUg8zUwlImOW81JC2JSKpOSm/2gYCnynXm1r+f2phrg1TsIprInpBGxCPB
	 R9rql6nRINUG7I0zAG+4AGCkXnwhltA2nz9nxglxlbuAmvCQ6nLY3wH+i3IvS7SFZC
	 SoDq2bzKlC+4Cl/Ax8NoWbkJJTUKciau9ofuJsTa7IxaEekYlkjnQAc2CejxazXYkv
	 F3I91Ig4z+ckA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539e1543ab8so1747353e87.2;
        Fri, 11 Oct 2024 15:15:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU2xND/WHSoTor8DYKdCv/VNkM7rt1C24j+qOP5ybH59tUV+ILxT3yZN3D4NzrN3+CFaVjWUZ7cGbs5vRFoNIoR@lists.infradead.org, AJvYcCVwyZuwMwiVrM/1+oYzGB4emNCsCMemtbg3m/4PRSm73/9Mt/Fv0ztYnyxU04ZU1U24RhY5ex7s1GQVfmobqF8=@lists.infradead.org
X-Gm-Message-State: AOJu0YypZTiXunqVkxfNCTPXaFlHesgp3D4p1IV9sJZH8EGNbuZcliZJ
	tnkwn/VS7gGj3fAyIP+beOrfs+vBnThcg3zB0Ni8cbGitbUzbrWhlYiXirLkr04n7YnIEpObooh
	4DBaZVp2HBD2PpsCAzreEeucbzw==
X-Google-Smtp-Source: AGHT+IGF99XBUxkOenEdwmIQtOgExe7ME91mPqvFEk96liE+RiiXVBhJMUT6h/UsrdC6DJPbt++sPunoF7UITTYb8zQ=
X-Received: by 2002:a05:6512:e9d:b0:535:6a34:b8c3 with SMTP id
 2adb3069b0e04-539e54d772bmr770312e87.5.1728684918931; Fri, 11 Oct 2024
 15:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240610085735.147134-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240610085735.147134-1-angelogioacchino.delregno@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 11 Oct 2024 17:15:05 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+F_pwhVLD1HF7=sYLp2w5kpc53UmzzffxyKzwh8WZthw@mail.gmail.com>
Message-ID: <CAL_Jsq+F_pwhVLD1HF7=sYLp2w5kpc53UmzzffxyKzwh8WZthw@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] MediaTek DVFSRC Bus Bandwidth and Regulator knobs
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: djakov@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	keescook@chromium.org, gustavoars@kernel.org, henryc.chen@mediatek.com, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com, wenst@chromium.org, 
	amergnat@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_151523_125647_EDBF77E2 
X-CRM114-Status: GOOD (  28.20  )
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

On Mon, Jun 10, 2024 at 3:57=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Changes in v6:
>  - Fixed build with clang (thanks Nathan!)
>  - Removed unused mtk_rmw() macro in mtk-dvfsrc.c
>  - Added MODULE_DESCRIPTION() to mtk-dvfsrc-regulator.c
>
> Changes in v5:
>  - Fixed Kconfig dependencies in interconnect
>  - Fixed module build for dvfsrc and interconnect
>
> Changes in v4:
>  - Updated patch [3/7] to actually remove address/size cells
>    as the old version got unexpectedly pushed in v3.
>
> Changes in v3:
>  - Removed examples from interconnect and regulator bindings
>    and kept example node with interconnect and regulator in
>    the main DVFSRC binding as suggested
>  - Removed 'reg' from interconnect and regulator, removed both
>    address and size cells from the main DVFSRC binding as that
>    was not really needed
>  - Added anyOf-required entries in the regulator binding as it
>    doesn't make sense to probe it without any regulator subnode
>
> Changes in v2:
>  - Fixed issues with regulator binding about useless quotes and
>    wrong binding path (oops)
>  - Removed useless 'items' from DVFSRC main binding
>  - Allowed address/size cells to DVFSRC main binding to resolve
>    validation issues on the regulator and interconnect bindings
>  - Changed dvfsrc node name to `system-controller`, as the DVFSRC
>    is actually able to control multiple system components.
>  - Added a commit to remove mtk-dvfs-regulator.c before adding the
>    new, refactored regulator driver
>
>
> This series adds support for the MediaTek Dynamic Voltage and Frequency
> Scaling Resource Controller (DVFSRC), found on many MediaTek SoCs.
>
> This hardware collects requests from both software and the various remote
> processors embededd into the SoC, and decides about a minimum operating
> voltage and a minimum DRAM frequency to fulfill those requests, in an
> effort to provide the best achievable performance per watt.
>
> Such hardware IP is capable of transparently performing direct register
> R/W on all of the DVFSRC-controlled regulators and SoC bandwidth knobs.
>
> Summarizing how the DVFSRC works for Interconnect:
>
>              ICC provider         ICC Nodes
>                               ----          ----
>              _________       |CPU |   |--- |VPU |
>     _____   |         |-----  ----    |     ----
>    |     |->|  DRAM   |       ----    |     ----
>    |DRAM |->|scheduler|----- |GPU |   |--- |DISP|
>    |     |->|  (EMI)  |       ----    |     ----
>    |_____|->|_________|---.   -----   |     ----
>                /|\         `-|MMSYS|--|--- |VDEC|
>                 |             -----   |     ----
>                 |                     |     ----
>                 | change DRAM freq    |--- |VENC|
>              --------                 |     ----
>     SMC --> | DVFSRC |                |     ----
>              --------                 |--- |IMG |
>                                       |     ----
>                                       |     ----
>                                       |--- |CAM |
>                                             ----
>
> ...and for regulators, it's simply...
>    SMC -> DVFSRC -> Regulator voltage decider -> (vreg) Registers R/W
>
> Please note that this series is based on an old (abandoned) series from
> MediaTek [1], and reuses some parts of the code found in that.
>
> Besides, included in this series, there's also a refactoring of the
> mtk-dvfsrc-regulator driver, which never got compiled at all, and would
> not build anyway because of missing headers and typos: that commit did
> not get any Fixes tag because, well, backporting makes no sense at all
> as the DVFSRC support - which is critical for that driver to work - is
> introduced with *this series*! :-)
>
> P.S.: The DVFSRC regulator is a requirement for the MediaTek UFSHCI
>       controller's crypto boost feature, which is already upstream but
>       lacking the actual regulator to work....... :-)
>
> [1]: https://lore.kernel.org/all/20210812085846.2628-1-dawei.chien@mediat=
ek.com/
>
> AngeloGioacchino Del Regno (7):
>   dt-bindings: regulator: Add bindings for MediaTek DVFSRC Regulators
>   dt-bindings: interconnect: Add MediaTek EMI Interconnect bindings
>   dt-bindings: soc: mediatek: Add DVFSRC bindings for MT8183 and MT8195
>   soc: mediatek: Add MediaTek DVFS Resource Collector (DVFSRC) driver

Looks like the driver got picked up, but not the binding.
mediatek,mt8183-dvfsrc and mediatek,mt8195-dvfsrc show up in next as
undocumented.

Rob

