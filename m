Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14BDC83F2C
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 08:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oNIsfHc1SdlVlekDAdmQNJPM3ojAhpAJx0aOYVnwyus=; b=aQ21+GNqzHUdxLMpeCtSTd7S0d
	qrrsGrQ62rPs8VWQQ5uHtYLKgRl5wnPJRRloqIjPr6HJiUiRCfuRbKJitnYkGqlKSui/tPZ2rCvsv
	GxrT8LCgoMG2iDFuojm1ik9+P7f2vwBrFPxEH7bAmEBfvCxRaXVinly3MnQ8ZKJGqHt+7nNBEUOzK
	tVLS9IHfd44kGATnSW2hMeR1qGbOUeR8VHfAlwayyf8gmPj7CkIrMKwMuff4+9JVWfSYrlWYBtPvm
	CrWun6V17m3o2Gmfv3zK8nP20/btOZrT2ee1dnQdljsUe7zV9VEjIDapA3cCPjrlQKD8vpDgTXhes
	i0ebFIzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdRfH-005Yy4-24;
	Tue, 05 Sep 2023 08:44:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdRfD-005Ywa-2i
	for linux-mediatek@lists.infradead.org;
	Tue, 05 Sep 2023 08:44:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C917D60B10;
	Tue,  5 Sep 2023 08:43:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD5E4C433C7;
	Tue,  5 Sep 2023 08:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693903438;
	bh=DwiI5lyTh5bUNu73RK8eFU7X1ZQGBwm/VemwAZ1Cpb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iPyTX6BznVbDgamxksQvlZZd/yJ7wvYrwLTGZ8lOGFcK2o7cwvFZvbYfHsqR9UkRe
	 5E0ojMi78/TcC5yHF0Tq0YId7hb3VrVeiajU9MHCmL1YNHKQEg1cP2oC+7uh7R+rkm
	 ypendgexNlI8CLurRC8vPK3Jcju2UhI8OdtPDGwLQO5DV8Bq1+eh8F6ppICzMH9Q7U
	 8LFYc9dZ+p/iWyXNv3lgZ06zVf8jfYifatBj49V/e2mjsOY3wqYYDrNCq//zJPtt0r
	 yvb9Y3opK6kYL/jDayDqRvJmQ5eb/DWiXOpxH3bPqVtZd6Fech8tPCZ5PiVK/9cYDe
	 71t3zQ9eTSMzg==
Date: Tue, 5 Sep 2023 10:43:55 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Vignesh Raman <vignesh.raman@collabora.com>, 
	dri-devel@lists.freedesktop.org, helen.koike@collabora.com, guilherme.gallo@collabora.com, 
	sergi.blanch.torne@collabora.com, david.heidelberg@collabora.com, daniels@collabora.com, 
	gustavo.padovan@collabora.com, emma@anholt.net, robclark@freedesktop.org, robdclark@google.com, 
	anholt@google.com, robdclark@gmail.com, airlied@gmail.com, daniel@ffwll.ch, 
	jani.nikula@linux.intel.com, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	virtualization@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/7] drm: ci: Force db410c to host mode
Message-ID: <ueznsu2dlvq5zp3ls262fww54bnlqa3e2ssr6f65vrrionloms@ir2ywgeajj4w>
References: <20230904161516.66751-1-vignesh.raman@collabora.com>
 <20230904161516.66751-3-vignesh.raman@collabora.com>
 <CAA8EJpq_cmFQ6TGy1xELh3ButWKLfSkQcp5ix049s_iqKw6DvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAA8EJpq_cmFQ6TGy1xELh3ButWKLfSkQcp5ix049s_iqKw6DvQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_014359_961591_B631BB6C 
X-CRM114-Status: GOOD (  23.35  )
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

Hi,

On Mon, Sep 04, 2023 at 07:59:26PM +0300, Dmitry Baryshkov wrote:
> On Mon, 4 Sept 2023 at 19:16, Vignesh Raman <vignesh.raman@collabora.com>=
 wrote:
> >
> > Force db410c to host mode to fix network issue which results in failure
> > to mount root fs via NFS.
> > See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629b8c15c=
80a54dda510743cefd1c4b65b8
> >
> > Use fdtoverlay command to merge base device tree with an overlay
> > which contains the fix for USB controllers to work in host mode.
> >
> > Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> > ---
> >
> > v2:
> >   - Use fdtoverlay command to merge overlay dtbo with the base dtb inst=
ead of modifying the kernel sources
> >
> > ---
> >  drivers/gpu/drm/ci/build.sh                         |  5 +++++
> >  .../gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts  | 13 +++++++++++++
> >  2 files changed, 18 insertions(+)
> >  create mode 100644 drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.=
dts
> >
> > diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> > index 7b014287a041..92ffd98cd09e 100644
> > --- a/drivers/gpu/drm/ci/build.sh
> > +++ b/drivers/gpu/drm/ci/build.sh
> > @@ -92,6 +92,11 @@ done
> >
> >  if [[ -n ${DEVICE_TREES} ]]; then
> >      make dtbs
> > +    if [[ -e arch/arm64/boot/dts/qcom/apq8016-sbc.dtb ]]; then
> > +        dtc -@ -I dts -O dtb -o drivers/gpu/drm/ci/dt-overlays/apq8016=
-sbc-overlay.dtbo drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
> > +        fdtoverlay -i arch/arm64/boot/dts/qcom/apq8016-sbc.dtb -o arch=
/arm64/boot/dts/qcom/apq8016-sbc-overlay.dtb drivers/gpu/drm/ci/dt-overlays=
/apq8016-sbc-overlay.dtbo
> > +        mv arch/arm64/boot/dts/qcom/apq8016-sbc-overlay.dtb arch/arm64=
/boot/dts/qcom/apq8016-sbc.dtb
> > +    fi
> >      cp ${DEVICE_TREES} /lava-files/.
> >  fi
> >
> > diff --git a/drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts b/d=
rivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
> > new file mode 100644
> > index 000000000000..57b7604f1c23
> > --- /dev/null
> > +++ b/drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
> > @@ -0,0 +1,13 @@
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +/ {
> > +    fragment@0 {
> > +        target-path =3D "/soc@0";
> > +        __overlay__ {
> > +            usb@78d9000 {
> > +                dr_mode =3D "host";
> > +            };
> > +        };
> > +    };
> > +};
> > --
> > 2.40.1
>=20
> Can we use normal dtso syntax here instead of defining fragments manually?

What Dmitry is hinting about is to use the "Sugar Syntax". There a good doc=
umentation here:
https://source.android.com/docs/core/architecture/dto/syntax

Maxime

