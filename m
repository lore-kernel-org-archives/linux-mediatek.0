Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A91CCAC599
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Sep 2025 13:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ND6uRKjtUSs17GPslB1yvNqKC7Yi69ThDZJq4g2+4L4=; b=wQ9gpgGqrsjmWiobEYlXLNliDf
	yvYIO1cnekz6YKqAAFySeagwY/5eiUyTy4Qy2LZdqhgloWegHezG7/o3Ouma7O9SnJlbsgSzk/6K9
	/84EJFPTvjJU/KCZirI4DOjTMHzni4b2P6QFf8HPsC/bC/ESTat22WHCUFl7jOD84KPzCcbcUL9y0
	tAk+ll7eJBQrKWq/RhGH+a8ouKrGmt+8yD+U9MVqs6EQ7r1mSCfbI1woe9rJL+CU/9bX0Oj+3NLoa
	/iTaF+0MJBpw+/Mk68YgQogliOgOiX7Wsm9+PDDZR8eIhNCAtC1ldxru257UHVS9cidhRpaPVUPAM
	RoRJVy4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVsM-00000007xgl-0tC4;
	Tue, 16 Sep 2025 13:37:42 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVsI-00000007xez-2g09;
	Tue, 16 Sep 2025 13:37:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758029856;
	bh=6+H0620i//14BMDJN4u5g3Iolp5ZEUPqc6sC/ytDsag=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ATYnZIIieufqejsBctWTPxGu9fNRYE+0cCgaYXlTz+mJFaw3gJbtUMjD1Rpg8m1KX
	 HKXTVxOor2SlLQB17DfLn2clLnxloFLyuGVvDNNXjudiYViIHM5vPOkRGYrmGIevRI
	 o4G+bsqSygEMuLSkZvrMJIRakTn6y2BUZtZOKVY/2afyGmJvYeM/nqfRFgKd2DOrG5
	 xofgMrpb4ECHuOD4QgxIKsJERlXrdRglTslOJmjMn1W/YTiEmiG1S7AePa0dF4hghp
	 0P3IpGkOvOCpxtOJbvV2B6HEtUJ1x1dXfwmmr610bKvmkAp2GEUPqiUfgr4HDa/Rrt
	 D3ATygDiDQzOw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6FF3017E0147;
	Tue, 16 Sep 2025 15:37:35 +0200 (CEST)
Date: Tue, 16 Sep 2025 15:37:21 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Conor Dooley <conor@kernel.org>, Chia-I Wu <olvaffe@gmail.com>, Steven
 Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: gpu: mali-valhall-csf: add MediaTek
 MT8196 compatible
Message-ID: <20250916153721.5b09e993@fedora>
In-Reply-To: <6418135.lOV4Wx5bFT@workhorse>
References: <20250913002155.1163908-1-olvaffe@gmail.com>
	<20250915-deodorize-proxy-b18e41fa8668@spud>
	<CAPaKu7TEjG3sWamy3k_YLig=208oXLPhMmbCvPOf96iEL0-uig@mail.gmail.com>
	<6418135.lOV4Wx5bFT@workhorse>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_063738_835780_A716C49F 
X-CRM114-Status: GOOD (  26.52  )
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

On Tue, 16 Sep 2025 10:58:40 +0200
Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:

> On Tuesday, 16 September 2025 06:21:10 Central European Summer Time Chia-=
I Wu wrote:
> > On Mon, Sep 15, 2025 at 10:52=E2=80=AFAM Conor Dooley <conor@kernel.org=
> wrote: =20
> > >
> > > On Mon, Sep 15, 2025 at 06:51:16PM +0100, Conor Dooley wrote: =20
> > > > Acked-by: Conor Dooley <conor.dooley@microchip.com> =20
> > >
> > > Hmm, actually there seems to be a more complete binding proposed here:
> > > https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202509=
12-mt8196-gpufreq-v2-1-779a8a3729d9@collabora.com/ =20
> > Right. I tried to add the compatible to the binding (this patch)
> > before adding it to the driver (next patch).
> >=20
> > If this patch is not a prerequisite for the driver change, I can drop
> > this. Or perhaps there is a better way?
> >  =20
>=20
> Depends on what you want to do with the driver change; I could pull it
> into my patch series (I need it as a prerequisite now anyway, as v3
> will get rid of the clocks for MT8196 in the binding, which means it
> needs to have a flag for this in the soc_data struct you've added)
>=20
> I think that would be the easiest solution so that we don't step on
> each other's toes, as long as you think the driver change is
> basically in its final form right now and does not need major
> revisions you'd still like to make yourself without having to
> coordinate submission through me.
>=20
> Or, the most roundabout option: I split the bindings I submitted
> into a separate series, and then we can both declare them as deps
> for our driver changes. That might thoroughly confuse maintainers
> though. But then you can declare a dep on the bindings series and
> I can declare a dep on the bindings series and your patch.

The simplest option is probably to merge this series in drm-misc-next
and rebase your GPUEB changes on drm-misc-next.

