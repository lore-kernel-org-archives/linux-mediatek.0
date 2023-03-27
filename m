Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3D2C76195
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 15:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WxXjXDVt250Dzp30WluOUfbIb760o1vY2QBgR+3iufI=; b=38A1gkIPAM2HF/5I7NVkzMAa1K
	lXCwQceWuKAEWM9ifvDv180TzJjFef5hqK7VePS5NfYrz4Jp4yZolabayowtk+Cznm6xU0UPxEwS6
	IoZp0149lDI9Bsu/M2Ib5IAMPire7qScRxiD+IDEE1rhdImIQa7rbOt9m/S20saJmt+NsPvM54JNq
	PIcl0NzLGQuaQ5zU2uo+hDKR9iIrcbOrYe69DiZvisVjM7XRXnxkPXMbj1as6L21baiup3cPuaipx
	JgABJGpY3QuXIUzp7SpRaYBxP/8fQVSrfUpdPmulVFZEsHy9XBVq48dTErBT1ExXnZoKBClamGZlU
	4F+I1hew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgob9-00BUa8-2c;
	Mon, 27 Mar 2023 15:17:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgob5-00BUZ8-1M;
	Mon, 27 Mar 2023 15:17:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2DEF460FC9;
	Mon, 27 Mar 2023 15:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E8EC433AC;
	Mon, 27 Mar 2023 15:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679930240;
	bh=WxXjXDVt250Dzp30WluOUfbIb760o1vY2QBgR+3iufI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DgSCKdzHtd3A8JummnAbCF0GnDlwtgZE6oSuVEtby2k6dFHawi07+eYzwPhFI/zPn
	 1IqdQXp31wiy/gxtYX6xIXwHsgB7dDWGbPo6yynzdtMX0Vzh+sZ7ApcD4v6Hrd7yJM
	 xTrafTzK5Qq9V8l3zkkyJ+yxFjRh4x26wz388XcMmrfyf1YhaCvtQo9lmQT6pcvAcA
	 bMYMFdx1Gz2tsb/AYwR47c26nxs8JIX5KkB8g9NdHo8PqeB5MQ2sLpGsRviMSYsdYc
	 EOg4Jv1ldxV8sUCYxJzAt8ZpOKQIeoGcrTIh8+8rqmOATAeYbhPniEhhLGy8a0zYPU
	 3q5KeUrdBoIzg==
Received: by mail-lj1-f179.google.com with SMTP id q14so9388270ljm.11;
        Mon, 27 Mar 2023 08:17:20 -0700 (PDT)
X-Gm-Message-State: AAQBX9c9PJNTfcCwMxXaOR4Ptj9XPg64VGpu1wNeBy+VJppBHTjql182
	F1OXChnTR0yYJuxW3sgvxEmSmgVBJNUFKwEfsg==
X-Google-Smtp-Source: AKy350ZJD8lXrATp34gVJQNtWOp95oG2v0KcgMEyjZm8N9VS0wqsbCWLENkFgqU2pL5ANEjL4W1+rI8dl98MGCb+WEw=
X-Received: by 2002:a2e:a304:0:b0:2a1:627a:70bb with SMTP id
 l4-20020a2ea304000000b002a1627a70bbmr3582823lje.10.1679930238193; Mon, 27 Mar
 2023 08:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230321121859.2355-1-nancy.lin@mediatek.com> <17831605-5c9d-9c92-d190-04f91060ace4@collabora.com>
 <CAAOTY_8ZAxVSLnJ1u5snsRgkszV7ixwhjUS2nDimE_Lpj=cUCA@mail.gmail.com> <97a5f383-38f5-e8ea-e1d8-489b690e4521@collabora.com>
In-Reply-To: <97a5f383-38f5-e8ea-e1d8-489b690e4521@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 27 Mar 2023 23:17:06 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9_vn-m2jTaaHkFDV+v2-LeaAxtCLNNnOxZq5Httb-TAQ@mail.gmail.com>
Message-ID: <CAAOTY_9_vn-m2jTaaHkFDV+v2-LeaAxtCLNNnOxZq5Httb-TAQ@mail.gmail.com>
Subject: Re: [PATCH v30 0/7] Add MediaTek SoC DRM (vdosys1) support for mt8195
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Nancy.Lin" <nancy.lin@mediatek.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, krzysztof.kozlowski+dt@linaro.org, 
	Daniel Vetter <daniel@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, CK Hu <ck.hu@mediatek.com>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, clang-built-linux@googlegroups.com, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, singo.chang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_081723_555335_9D8C27D5 
X-CRM114-Status: GOOD (  29.14  )
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

Hi, Angelo:

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2023=E5=B9=B43=E6=9C=8824=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:3=
8=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Il 24/03/23 00:25, Chun-Kuang Hu ha scritto:
> > Hi, Angelo:
> >
> > AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =
=E6=96=BC
> > 2023=E5=B9=B43=E6=9C=8823=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=
=884:58=E5=AF=AB=E9=81=93=EF=BC=9A
> >>
> >> Il 21/03/23 13:18, Nancy.Lin ha scritto:
> >>> The hardware path of vdosys1 with DPTx output need to go through by s=
everal modules, such as, OVL_ADAPTOR and MERGE.
> >>>
> >>> Add DRM and these modules support by the patches below:
> >>>
> >>
> >> I've tested v30 again on MT8173, MT8192 and MT8195 based Chromebooks.
> >> Green light from me.
> >
> > I'm curious about how you build code and test on Chromebooks. Do you
> > build in cros environment or pure linux
> > (https://archlinuxarm.org/platforms/armv8/mediatek/acer-chromebook-r13)=
.
> > I've a MT8183 based Chromebook (HP 11a) and I've tried to run a
> > upstream kernel on it. cros is too heavy for me and I doubt I could
> > use it. I've tried the pure linux and could boot up with console, but
> > display does not work. If you use the pure linux environment, could
> > you share how it works?
> >
>
> I haven't tested MT8183 (I don't actually have any 8183 machine in my han=
ds)... but
> yes, I can share my test environment.
>
> I have one MicroSD that I use either in the MicroSD slot of the target ma=
chine, or
> in a USB reader; this *single* system is what I boot on *all* Chromebooks=
 that I
> have: one kernel, multiple devicetrees, same Debian-based userspace.
>
> What we have to prepare this bootable media can be found at [1], but bewa=
re that
> it currently uses an outdated kernel, so, what I have locally is a symlin=
k to my
> kernel tree.
> You can change/add/remove the devicetree blobs that will get added to the=
 image
> by modifying `chromebook-setup.sh`; before tampering with kernel tree sym=
link,
> please run that script for the first time, as it will download a cross-co=
mpiler,
> a kernel tree (that you will replace for sure) and the (very old) Debian =
rootfs
> that you can update with `apt-get dist-upgrade` after booting the Chromeb=
ook.
>
> If you want to check about possible kernel configuration differences, wha=
t I use
> is at [2], so that you can compare.

Thanks for the information, I would try to compare the kernel config first.

>
> [1]: https://gitlab.collabora.com/google/chromebooks/-/tree/mtk-av1
> [2]:
> https://gitlab.collabora.com/google/chromeos-kernel/-/blob/mt8195-trackin=
g-master-rolling/arch/arm64/configs/defconfig
>
> Regards,
> Angelo

