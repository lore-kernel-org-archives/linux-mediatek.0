Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4528C76196
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 03:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XFDJK+O6b4HFOKcAfQuQl4p4wuO9jnRvSF0HKVPNXU8=; b=KitF9SIs+q//Q1utzNfbrB669U
	n+t7uNAjoYey5JXdGlUZE9Cgj/sDvmr4wbS+nG4KHB1SnzI1sPE2HJvGhqrgajZ6Z/xcORVYCsjnf
	/LP8LSmvmmVxVf6NpB+mowl5sux4sGnIBIpknkY6BiN/B+/CTn9KEHnKNWarQ2yLOw0oqMmfdqNh1
	kgfc8nzS8P97yYEaUOJX+Hhj+VXXqIxkGqO1Ad2Q6kcxf23qiDNSZjCv1d2PPsPXI2LCK1BlAWCo6
	pl/7BdX1qreg4ENiUwDdxqDGfiUiD8HKcHDRWt8fielJsaoFT5jOB8bv7IJ2qDWtxOAtlTaZqRZ9v
	fp13274g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjAuZ-00E30m-2P;
	Mon, 03 Apr 2023 03:31:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjAuV-00E2zs-2K;
	Mon, 03 Apr 2023 03:31:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0C97C61451;
	Mon,  3 Apr 2023 03:31:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55D68C433A1;
	Mon,  3 Apr 2023 03:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680492670;
	bh=XFDJK+O6b4HFOKcAfQuQl4p4wuO9jnRvSF0HKVPNXU8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EBroFlBh0WrZPTUY9gGFPwiazQ8rJqOdGs9OOSyDIbHaNW9O96+hKKrju6N6QCF2z
	 QrQq3zXPsKwmUXkl5iYWQJIxFKVRgCyK6tXodZoRqiFpLikV3skwZhEQ+cVL3eaG8D
	 A7MvEHopu0PIjEnID3ILp9ly/F2UopGpmMlGj44xZ2HyXw7NYcKd7rvpmQSyQLr3UP
	 6nDzJT+lkinEi2v0e/V/WuOyt91zahDhRBJ536DPqTzjKvJkYnye9TetERuz6aCi9z
	 dUOZaxyB8JVdvzOa8Mw6LNHs7FsuO+oBj4lZCeFCPSGGvvs05Hu3hedFP+hs99JF0G
	 yoNO1CA6E1Zxg==
Received: by mail-lf1-f46.google.com with SMTP id g19so23125838lfr.9;
        Sun, 02 Apr 2023 20:31:10 -0700 (PDT)
X-Gm-Message-State: AAQBX9eBi7RqJH/qYR04KUjzs182N9nUle8VUZuLYfZRwzxiXs2Bl3NU
	qHW5D6+cD3Ehf0A4F1AvYdPZqwVSTWTbSZw3qw==
X-Google-Smtp-Source: AKy350b60je93Fp8ACgYD+IGmx2jUC2NXDaO2wPWl8QAhfUwxXgOh//lf4WQhYJln+d7xy3DKELl/d6gVGnR6WOBSc8=
X-Received: by 2002:a19:7419:0:b0:4d8:62e5:4f66 with SMTP id
 v25-20020a197419000000b004d862e54f66mr10062745lfe.7.1680492668344; Sun, 02
 Apr 2023 20:31:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230321121859.2355-1-nancy.lin@mediatek.com> <17831605-5c9d-9c92-d190-04f91060ace4@collabora.com>
 <CAAOTY_8ZAxVSLnJ1u5snsRgkszV7ixwhjUS2nDimE_Lpj=cUCA@mail.gmail.com>
 <97a5f383-38f5-e8ea-e1d8-489b690e4521@collabora.com> <CAAOTY_9_vn-m2jTaaHkFDV+v2-LeaAxtCLNNnOxZq5Httb-TAQ@mail.gmail.com>
 <CAGXv+5FJCuG_zHnaKZ=baNzKAWKLEe3jZnghNAxuGv7i7L6e7Q@mail.gmail.com>
In-Reply-To: <CAGXv+5FJCuG_zHnaKZ=baNzKAWKLEe3jZnghNAxuGv7i7L6e7Q@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 3 Apr 2023 11:30:56 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9Dbtubah3ndj9+FeYDh7D42k6-BtHrYMNc=CP6GL6uFA@mail.gmail.com>
Message-ID: <CAAOTY_9Dbtubah3ndj9+FeYDh7D42k6-BtHrYMNc=CP6GL6uFA@mail.gmail.com>
Subject: Re: [PATCH v30 0/7] Add MediaTek SoC DRM (vdosys1) support for mt8195
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, 
	singo.chang@mediatek.com, Nick Desaulniers <ndesaulniers@google.com>, 
	linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, "Nancy.Lin" <nancy.lin@mediatek.com>, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	krzysztof.kozlowski+dt@linaro.org, clang-built-linux@googlegroups.com, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_203111_831758_8D92A1BF 
X-CRM114-Status: GOOD (  37.74  )
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

Hi, Chen-yu:

Chen-Yu Tsai <wenst@chromium.org> =E6=96=BC 2023=E5=B9=B43=E6=9C=8830=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=887:05=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, Mar 27, 2023 at 11:17=E2=80=AFPM Chun-Kuang Hu <chunkuang.hu@kern=
el.org> wrote:
> >
> > Hi, Angelo:
> >
> > AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =
=E6=96=BC
> > 2023=E5=B9=B43=E6=9C=8824=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=
=884:38=E5=AF=AB=E9=81=93=EF=BC=9A
> > >
> > > Il 24/03/23 00:25, Chun-Kuang Hu ha scritto:
> > > > Hi, Angelo:
> > > >
> > > > AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com=
> =E6=96=BC
> > > > 2023=E5=B9=B43=E6=9C=8823=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=
=8D=884:58=E5=AF=AB=E9=81=93=EF=BC=9A
> > > >>
> > > >> Il 21/03/23 13:18, Nancy.Lin ha scritto:
> > > >>> The hardware path of vdosys1 with DPTx output need to go through =
by several modules, such as, OVL_ADAPTOR and MERGE.
> > > >>>
> > > >>> Add DRM and these modules support by the patches below:
> > > >>>
> > > >>
> > > >> I've tested v30 again on MT8173, MT8192 and MT8195 based Chromeboo=
ks.
> > > >> Green light from me.
> > > >
> > > > I'm curious about how you build code and test on Chromebooks. Do yo=
u
> > > > build in cros environment or pure linux
> > > > (https://archlinuxarm.org/platforms/armv8/mediatek/acer-chromebook-=
r13).
> > > > I've a MT8183 based Chromebook (HP 11a) and I've tried to run a
> > > > upstream kernel on it. cros is too heavy for me and I doubt I could
> > > > use it. I've tried the pure linux and could boot up with console, b=
ut
> > > > display does not work. If you use the pure linux environment, could
> > > > you share how it works?
> > > >
> > >
> > > I haven't tested MT8183 (I don't actually have any 8183 machine in my=
 hands)... but
> > > yes, I can share my test environment.
> > >
> > > I have one MicroSD that I use either in the MicroSD slot of the targe=
t machine, or
> > > in a USB reader; this *single* system is what I boot on *all* Chromeb=
ooks that I
> > > have: one kernel, multiple devicetrees, same Debian-based userspace.
> > >
> > > What we have to prepare this bootable media can be found at [1], but =
beware that
> > > it currently uses an outdated kernel, so, what I have locally is a sy=
mlink to my
> > > kernel tree.
> > > You can change/add/remove the devicetree blobs that will get added to=
 the image
> > > by modifying `chromebook-setup.sh`; before tampering with kernel tree=
 symlink,
> > > please run that script for the first time, as it will download a cros=
s-compiler,
> > > a kernel tree (that you will replace for sure) and the (very old) Deb=
ian rootfs
> > > that you can update with `apt-get dist-upgrade` after booting the Chr=
omebook.
> > >
> > > If you want to check about possible kernel configuration differences,=
 what I use
> > > is at [2], so that you can compare.
> >
> > Thanks for the information, I would try to compare the kernel config fi=
rst.
>
> Hi CK,
>
> Would you consider adding your repo to linux-next? That would let everyon=
e
> do integration testing, especially automated ones, earlier, before you se=
nd
> your PRs to drm maintainers.
>
> You can do so by sending an email to Stephen Rothwell to do so.

I don't understand what this process is. Does it means that I directly
upstream patches into linux-next? I prefer that my patches go through
drm maintainers' tree. Does any document introduce this process?


Regards,
Chun-Kuang.

>
>
> ChenYu
>
> > >
> > > [1]: https://gitlab.collabora.com/google/chromebooks/-/tree/mtk-av1
> > > [2]:
> > > https://gitlab.collabora.com/google/chromeos-kernel/-/blob/mt8195-tra=
cking-master-rolling/arch/arm64/configs/defconfig
> > >
> > > Regards,
> > > Angelo

