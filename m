Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591DBFEA835
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2026 09:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JlhSXELYE8vgX7qqunsSd6qJxJ59KW296nfLjRCFqek=; b=i8ZO3HaghSvo5kjwIMCg+Rl3M7
	gMPK+BYyCeqb+fkuEFGFpi7Q2xXKQWg5S3LOKqA9I7OWT35HxFFUdMGlpkUb4kZfxFVxMYyKjxE4f
	oUKIPmSuUokjxYE+gY6K39Tt2Hd4hIfsyniWcDlzLbN7WHtkulKhD69ApAyaCsUXCQJl1+W0kmgLz
	a6/TgVkeAy8zfa1R5pvbYfVsI9c8V6xwbMYh5w19Q6y3jThZNU1li6+FZ/tVWygie2KZhd7SKS6xC
	GFIyT1TXITn+OOQSIacT60l6PACJ8bhnLuuA2G7jlzKKiXoPBVwRDCdC9fuQ40zac/8ftSLzfpX8b
	6ak7E8Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5KNS-000000031Wh-3eif;
	Wed, 25 Mar 2026 09:18:14 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5KNQ-000000031Vq-1iRI
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Mar 2026 09:18:13 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-38ad26e3992so15620771fa.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Mar 2026 02:18:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774430290; cv=none;
        d=google.com; s=arc-20240605;
        b=jbhuE5dI4u4i+DTqT5wDWsDrEgCn3VUvdt+lvtDJ0QXqEflTwwmNHUwbXBosDaMFJM
         JhrlThBVXs82GsMfnlny/4YICwYS4Fs+7N5TQhgSJIuMYbT4IkW1FkBPbFChFEk+aEXl
         LsDu/Phc/xeLi2APhRT/w1bfXQJC828oSWXco6OtksAuu6iEGt1nUIZhCkfpGR61fFH+
         TEbcu6ySZUWzl/4DpqjLoVnB0hkRg6abPqprUAdVjXatbaK6aI7iGIL1gvnt4czSGLkH
         /TLpvqZ/8mm4jJ53bUAqAsDKTvW1F+CX/cMzMGl/te9cYcuIuwSgnSZzfVBfUjAecoZ7
         7KwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JlhSXELYE8vgX7qqunsSd6qJxJ59KW296nfLjRCFqek=;
        fh=YmkKy6QWP0m+P1Ucy77oygHlC2QZRfvqH6vsC8AELgM=;
        b=CJ6F02JNHwSct4r+Tid7mpWcoDZD7DQ9uwXnWIxBUMkxkQxkVSNYGHmmO7MXBVKHaJ
         3VCQx/p7FBqzZjICuOQYOYJxKPMtl+eQTRhfBkT89PJHGGnS3f7IZoxSqPtsSPLjxb2O
         O4JK4AGnOt1MgIJ3DHY8dQ9cD2Qo3pDICMGkFkE5mAlB7cVDrp41jc3RtCwUKeCyW0m6
         8Q/xGs1wEmiOhOI1NsOZXCuNZF2k+Eo9d/DtHM1zDdVMdsjGQKk/A9Rhm/yM4kH7NFOu
         8LOSbdwiFTD04dCu5RpPYwRmhiBX60zDoi3MwjSvrUjkvk8/qS8qXXgcRhd0bOKjlKcD
         NkjQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774430290; x=1775035090; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JlhSXELYE8vgX7qqunsSd6qJxJ59KW296nfLjRCFqek=;
        b=mx6b2bRYvSEtlWKMS2RKNgpCaPp+zkNJEOb5NrKOx1Thlrca9LdZd1cb3rfdOkExYt
         /REwIfiuTXtNfFQiwpnJpr07KFwgLlmXgteAgOkTr+IPRvUvX3rM+Rc+JxmQdJ27eyWB
         7259vtRoAZQk2/rZsSl/HVrgSA5g4twaLKjpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774430290; x=1775035090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JlhSXELYE8vgX7qqunsSd6qJxJ59KW296nfLjRCFqek=;
        b=iusr95rDNnulUvnr89teqc7qCLFceCWnywpzAUjYLaf/E5pA2GaY0KOMErSCo4Czux
         1gwaaVPG3fM7248/PF/4HNwZfMnhvFZE3M40Y1cOQw0GM7EZTjucV+qa6J5lntD+X1Dp
         xqfvmh7ABp5/swVIOzbwj1+RilVHdSjpVRyBVQLbQ2uh3bIQdw2Yb3147hjQTf5rWPe5
         1yb4jWcheX41vk3cnG7IZ0+BaPLHSK+qSnloyoBCerhVnH6gAnnlzqADjmv9w+yU2ML5
         gwzKSRe2SHfYJTcRGDRVCqqAyAko0Tu9SA1N3Nu3TqWtw03kBM3/BRU6dw09v/kqZWss
         U5EQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzqx3/inwlqnpX/ervPG2aa4+rwHmfllxf+6pJc7w/qU+dczus6tUWl4k/n7FzmMd4G2wRxKqyBJlGVZfYOA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ5dTSl84LqSmuv1YSsTlHiD9UArKW9dOX2R0hGQ+AYQNaOJ/u
	dv5yHAZzn02ujr9j7Wf9suIcT5ivym1UJxvuZGe0eYFLrdlrhbQnEnO5BKj94TKj5+EN6l/YPuW
	HOdYEfz3Qo0K6wM6MwCslLGM37gNEGGa+n+aHm/ya
X-Gm-Gg: ATEYQzwu+fo+g12BVL9nCU1/2miiendd081/GnXECIti8wRi7lK5s2XsHfmXlvD8qxq
	E6yZNDp1UbsGqmsTFd/0jfLMlViu/r7C5qD9JzmVzJj4A+Oj9uHWpkgRsxvKuPNIf7SwE+tQ3Uz
	YaOIAt9dM1YFzf5Xn8CZutr4fjdYk/ZxLkfuY6u0Nx7xMQPrlExDhKSxKPUYSHysFa/NWAHlRQ6
	FLaP844uf+0koNLEezvcrroR98mtv3jHKtFHbn8Zc4epE+REROx1XqKFHAYvAWhjwoGQ5MFi1ZA
	XGLRfPSQ8advKbvv4b63qeCpCQWlrNIXmnKU
X-Received: by 2002:a05:6512:1252:b0:5a2:8718:b322 with SMTP id
 2adb3069b0e04-5a29b97cb53mr1236317e87.15.1774430289060; Wed, 25 Mar 2026
 02:18:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260325071951.544031-1-wenst@chromium.org> <93c1d325461cc0ffad890d64870de680506338c4.camel@icenowy.me>
 <CAGXv+5FL2rs35V4F0bwq-a4ccvFaWKcr1cuKxT6sfTj9h+d6iA@mail.gmail.com>
 <0739597b7a9c162525c10d82c3993e37af1c8a75.camel@icenowy.me> <cb75a09ecc88972503f5ade8e1807122c48d8ac8.camel@icenowy.me>
In-Reply-To: <cb75a09ecc88972503f5ade8e1807122c48d8ac8.camel@icenowy.me>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 25 Mar 2026 17:17:57 +0800
X-Gm-Features: AQROBzAB2xsA--d1NrWuC5hnkU-nq8sFhsGVW2irjP7zw26EVL5TptjCi0fi-9g
Message-ID: <CAGXv+5EbFv5bybX4bkXOSiPZm4fG-dQy19dfUXJ6C8RE_tk6Cw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] powervr: MT8173 GPU support
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_021812_486407_86FBBC2E 
X-CRM114-Status: GOOD (  47.21  )
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

On Wed, Mar 25, 2026 at 4:42=E2=80=AFPM Icenowy Zheng <uwu@icenowy.me> wrot=
e:
>
> =E5=9C=A8 2026-03-25=E4=B8=89=E7=9A=84 16:30 +0800=EF=BC=8CIcenowy Zheng=
=E5=86=99=E9=81=93=EF=BC=9A
> > =E5=9C=A8 2026-03-25=E4=B8=89=E7=9A=84 16:08 +0800=EF=BC=8CChen-Yu Tsai=
=E5=86=99=E9=81=93=EF=BC=9A
> > > On Wed, Mar 25, 2026 at 4:04=E2=80=AFPM Icenowy Zheng <uwu@icenowy.me=
>
> > > wrote:
> > > >
> > > > =E5=9C=A8 2026-03-25=E4=B8=89=E7=9A=84 15:19 +0800=EF=BC=8CChen-Yu =
Tsai=E5=86=99=E9=81=93=EF=BC=9A
> > > > > Hi everyone,
> > > > >
> > > > > This is v2 of my MT8173 PowerVR GPU support series.
> > > > >
> > > > > Changes since v1:
> > > > > - Adapted to changed DT bindings
> > > > > - Dropped driver change
> > > > > - Use same power domain for "a" and "b" GPU power domains
> > > > >
> > > > > This update was requested by Icenowy.
> > > > >
> > > > >
> > > > > This series enables the PowerVR GPU found in the MT8173 SoC,
> > > > > found in
> > > > > some Chromebooks.
> > > > >
> > > > > This version is different from the initial powervr driver
> > > > > submission
> > > > > [1]
> > > > > in that it splits out the GPU glue layer support out of the
> > > > > powervr
> > > > > driver and into a separate clock and power domain driver. The
> > > > > glue
> > > > > code
> > > > > is otherwise the same, and also the same as found in the
> > > > > ChromeOS
> > > > > kernels, with some extra comments and macro names added where
> > > > > possible.
> > > > >
> > > > > Patch 1 adds a binding for the glue layer, called mfgtop. The
> > > > > glue
> > > > > layer
> > > > > contains clock and power controls for the GPU.
> > > > >
> > > > > Patch 2 adds a driver for the glue layer.
> > > > >
> > > > > Patch 3 adds an entry for the MT8173 GPU and 6XT series to the
> > > > > PowerVR
> > > > > binding.
> > > > >
> > > > > Patch 4 adds an entry for the PowerVR 6XT series GPU to the
> > > > > driver.
> > > > >
> > > > > Patch 5 corrects the clock for the GPU (called MFG) power
> > > > > domain.
> > > > >
> > > > > Patch 6 adds device nodes for the GPU and glue layer to the
> > > > > MT8173
> > > > > dtsi
> > > > > file.
> > > > >
> > > > > Patch 2 and 6 depend on patch 1 to build. I suppose some common
> > > > > immutable tree would be needed from the MediaTek maintainers.
> > > > >
> > > > > The kernel driver successfully probes the hardware and loads
> > > > > the
> > > > > "rogue_4.40.2.51_v1.fw" firmware provided by Imagination
> > > > > Technologies
> > > > > [2].
> > > > > Userspace was tested with Mesa 24.0.8 from Debian Trixie
> > > > > rebuilt
> > > > > with
> > > > > the powervr vulkan driver enabled. `vulkaninfo` gives some
> > > > > information
> > > > > about the GPU (attached at the end), but running the `triangle`
> > > > > example
> > > > > from the Sascha Willems demos [3] with -DUSE_D2D_WSI=3DON as
> > > > > recommended [4]
> > > > > failed with:
> > > > >
> > > > >     Can't find a display and a display mode!
> > > >
> > > > I think when using D2D the demos want width and height to be
> > > > explicitly
> > > > specified, otherwise it seems to hardcode 1280x720.
> > > >
> > > > If you're using an elm, could you try to add `-w 1920 -h 1080` or
> > > > for
> > > > hana `-w 1366 -h 768` ?
> > >
> > > I only did the basic `vulkaninfo` test this time around. To do
> > > anything
> > > interesting probably requires the Mesa 26.1 release.
> > >
> > >     PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 \
> > >         vkmark --winsys kms -D b81f54f8568deb0fb70a6a1ed845b65d
> > >
> > > just reports "Error: Device specified by uuid is not available"
> >
> > I am very sorry to tell you that, when I run Sascha's demo with Mesa
> > main, I got GPU lost immediately...
> >
> > ```
> > [  441.509433] powervr 13000000.gpu: [drm] *ERROR* GPU device lost
> > ```
>
> Sidenote: I think this is some power domain management issue, because I
> saw the kernel saying `vgpu: disabling` , which shouldn't happen if the
> GPU is active?

AFAICT "vgpu" is the vgpu output from the primary PMIC. This one is unused.
The actual regulator supplying the GPU is from the secondary PMIC. The
rail is called VBUCKB...


ChenYu


> >
> > Icenowy
> >
> > >
> > > This is with Mesa 26.0.2 packages from Debian testing. At least now
> > > have the powervr vulkan driver enabled by default, so I don't have
> > > to rebuild the packages again.
> > >
> > >
> > > ChenYu
> > >
> > > > Thanks
> > > > Icenowy
> > > >
> > > > >
> > > > > Same program worked correctly on a BeaglePlay and displayed a
> > > > > color
> > > > > gradient triangle. Not sure what went wrong here.
> > > > >
> > > > > Anyway, please have a look and test.
> > > > >
> > > > >
> > > > > Thanks
> > > > > ChenYu
> > > > >
> > > > > [1]
> > > > > https://lore.kernel.org/dri-devel/20220815165156.118212-2-sarah.w=
alker@imgtec.com/
> > > > > [2]
> > > > > https://gitlab.freedesktop.org/imagination/linux-firmware/-/tree/=
powervr
> > > > > [3] https://github.com/SaschaWillems/Vulkan
> > > > > [4]
> > > > > https://lore.kernel.org/dri-devel/f2b2671e-5acc-4dec-9c2e-3c9cd2e=
1f19e@imgtec.com/
> > > > >
> > > > > Chen-Yu Tsai (5):
> > > > >   dt-bindings: clock: mediatek: Add mt8173 mfgtop
> > > > >   clk: mediatek: Add mt8173-mfgtop driver
> > > > >   dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
> > > > >   arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain
> > > > > clock
> > > > >   arm64: dts: mediatek: mt8173: Add GPU device nodes
> > > > >
> > > > >  .../clock/mediatek,mt8173-mfgtop.yaml         |  70 +++++
> > > > >  .../bindings/gpu/img,powervr-rogue.yaml       |   1 +
> > > > >  arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  33 ++-
> > > > >  drivers/clk/mediatek/Kconfig                  |   9 +
> > > > >  drivers/clk/mediatek/Makefile                 |   1 +
> > > > >  drivers/clk/mediatek/clk-mt8173-mfgtop.c      | 243
> > > > > ++++++++++++++++++
> > > > >  include/dt-bindings/clock/mt8173-clk.h        |   7 +
> > > > >  7 files changed, 363 insertions(+), 1 deletion(-)
> > > > >  create mode 100644
> > > > > Documentation/devicetree/bindings/clock/mediatek,mt8173-
> > > > > mfgtop.yaml
> > > > >  create mode 100644 drivers/clk/mediatek/clk-mt8173-mfgtop.c

