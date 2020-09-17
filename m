Return-Path: <SRS0=Tto8=C2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 806DAC433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 10:56:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AF192074B
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 10:56:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1z0E70Nq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QB6L5K88"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AF192074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5BDyIQJHh90s4aszlMoAV11ifu2+rzOLe6dzjEEZo2Y=; b=1z0E70NqYXmCsPOpI8Ef9j/Oz
	69zkzVFszFpCgng7UB3er7c+NbdDFGBjntEAAGHW03Fxk9pnCLtLaReeDHkIGhfnn8zHcw0tViC9a
	pGzZ9X7I3RszpUj05PX/zLvEYgwPpnpmQlbX1YR29oYX+D9ARxRx4oOMeuCgDh4hWwmSJ+CucDxw8
	ipsj1fLH8ns+L4XxKgnSnY8QsTLG5YPbt0JYzHDar6nwG0DPRhQDgPdLcIM57+SMaNJmy8wA34oPo
	v6UpjudaMxm7Ra/GDqFZ4TlB80A5VnadTuMjgTTvV++TIzeMzyB1M+gkrDWTvWYW2+M3z4QE1WrAb
	8IWnctpvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIraV-0002YQ-8Q; Thu, 17 Sep 2020 10:56:27 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIraS-0002Xy-Qx; Thu, 17 Sep 2020 10:56:25 +0000
Received: by mail-wr1-x442.google.com with SMTP id w5so1554112wrp.8;
 Thu, 17 Sep 2020 03:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=T7o1O276VNvFCMXreEbeFlPYMFMj08O5QtDTtLf9+io=;
 b=QB6L5K889Bo72oCmXlPEd6RO0QFJaiOuUuQYNXSbkbKHLE0z4jthWl14REa3WCR0Bt
 7IHiIFNeD/Ta+yo/4I3eoGqh6G9kDPeQAYogqalpiHtq8aE0N2vVL/nLfC8G7fyUISnI
 HqZvSuiNmgZzkTOCBFRSXTB+sPRscquK8BzaCBsBZW04/6qzVITT/XTRzNX58D5ubsqj
 EBCDdFzw/4/+qKJ5jqHMFDrIQ6SPZ7RFWRnZTqbCA2A8CuvrZLIiZY8CyMBMGu+cZPGz
 +Xk5dHOFs8kS9Gn7mKXA7wGo6jD27ynEwYEI2R76ZDPCy8bCgvVnpggr26rleQIwiHel
 X5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=T7o1O276VNvFCMXreEbeFlPYMFMj08O5QtDTtLf9+io=;
 b=Suzy4JbK+6i/obAyaehZrzYEkMHK43VLxyI64lbt2852U3b9/LerY72vAygSDYixKh
 NAim55Y22M69KmxVHRr0VuIP2+zvdK+I9xtZJ4xgM3iYZqmpJMQZRiNPKD/xmXVubN3T
 fBuA0qer1JLjzySw1vkK9oadIHhcprhvszCdu5iMwIrUP0Ep78ed1giMt3lJ2boKiUg6
 rUOl5G3bKEbyow10wZbbkegieq8yYqcG/NqEWMHZMrqQpf1JaJfn18xVVSUJ+lLNeedV
 mmLE3D68s6F0KKSqdvfWNfTQ9QnPdvzdbHkwFSLAW7nKAzSiBO8fwOZWUJhc03/rn99A
 kfxw==
X-Gm-Message-State: AOAM531dcHWKigHEsASFtx6R6K0n1uQBXwrQzKVFR1soIndXtgjnv5Av
 dnwp+EMQNxSb+qUkJYhHz6o=
X-Google-Smtp-Source: ABdhPJwg7nkwQTaRBQuWwl0RcZSkUXHrdUc9WYlLoauvclz9jtCse6f5SG7t61si5y3RH63KecEA/w==
X-Received: by 2002:adf:e711:: with SMTP id c17mr32158269wrm.359.1600340183749; 
 Thu, 17 Sep 2020 03:56:23 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id d83sm10820463wmf.23.2020.09.17.03.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 03:56:22 -0700 (PDT)
Date: Thu, 17 Sep 2020 12:56:20 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 14/21] drm/tegra: Introduce GEM object functions
Message-ID: <20200917105620.GK3515672@ulmo>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-15-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20200915145958.19993-15-tzimmermann@suse.de>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_065624_883186_88149BDA 
X-CRM114-Status: GOOD (  12.92  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: hamohammed.sa@gmail.com, heiko@sntech.de, andrey.grodzovsky@amd.com,
 airlied@linux.ie, nouveau@lists.freedesktop.org,
 joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org,
 michal.simek@xilinx.com, eric@anholt.net, nirmoy.das@amd.com,
 robdclark@gmail.com, krzk@kernel.org, sam@ravnborg.org,
 sumit.semwal@linaro.org, emil.velikov@collabora.com,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 oleksandr_andrushchenko@epam.com, tomi.valkeinen@ti.com,
 linux-tegra@vger.kernel.org, linux@armlinux.org.uk,
 patrik.r.jakobsson@gmail.com, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, kgene@kernel.org, bskeggs@redhat.com,
 xen-devel@lists.xenproject.org, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, chunkuang.hu@kernel.org, andi.shyti@intel.com,
 daniel@ffwll.ch, linux-arm-msm@vger.kernel.org, marek.olsak@amd.com,
 tianci.yin@amd.com, maarten.lankhorst@linux.intel.com,
 etnaviv@lists.freedesktop.org, jani.nikula@linux.intel.com,
 inki.dae@samsung.com, hdegoede@redhat.com, christian.gmeiner@gmail.com,
 linux-mediatek@lists.infradead.org, mripard@kernel.org, rodrigo.vivi@intel.com,
 matthias.bgg@gmail.com, evan.quan@amd.com, sean@poorly.run,
 linux-arm-kernel@lists.infradead.org, tvrtko.ursulin@linux.intel.com,
 amd-gfx@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 hyun.kwon@xilinx.com, rodrigosiqueiramelo@gmail.com, aaron.liu@amd.com,
 Felix.Kuehling@amd.com, xinhui.pan@amd.com, sw0312.kim@samsung.com,
 hjc@rock-chips.com, chris@chris-wilson.co.uk, kyungmin.park@samsung.com,
 miaoqinglang@huawei.com, p.zabel@pengutronix.de, alexander.deucher@amd.com,
 Hawking.Zhang@amd.com, freedreno@lists.freedesktop.org,
 christian.koenig@amd.com, l.stach@pengutronix.de
Content-Type: multipart/mixed; boundary="===============6488123330015001982=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6488123330015001982==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NqNl6FRZtoRUn5bW"
Content-Disposition: inline


--NqNl6FRZtoRUn5bW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2020 at 04:59:51PM +0200, Thomas Zimmermann wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in tegra.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/tegra/drm.c | 4 ----
>  drivers/gpu/drm/tegra/gem.c | 8 ++++++++
>  2 files changed, 8 insertions(+), 4 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--NqNl6FRZtoRUn5bW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jQNQACgkQ3SOs138+
s6HfWQ//YmrWsVV1CJUAgb5t2QX4pCrujVRekVE/g1njlA/b4hb8UrTwixaZox4k
Y6ALc4RAngHpnPoebK9HTtI7eQ6gV3NzTvOZN432iqInp8UuFdrqwY9hkRcS5ak9
gNSHqMgl0BAkIdZ7VM5EWvVcbSkWsGbOR2uTx45m3hieqf80Jlyto/yqcH8yHm0Y
dNhlRIxSS23lHF4c79jOtCPyJjF2DaErfz+qFiFLmdV60AjeCfl6LZZSuSNSbSNv
Ht8OICXXHv9dKx6IbgyAAJIf77DsMDyXHzNC6YxoBH1c1X3JgEinuNaj8h+ZXxrT
klWtayTZ15xforiBumJH+Zi23DA+95v6eigfHDVje5APtRHxDgdnNOhW6zRF049I
powiLvCaS10xJVB7+4DlXmvdJTRaw8jNMcOYR0Yyg5fwrbkjkHyFsi2iQyzclBEJ
KM5kjLzpgBQpaEgpsCqxY0TJ0/bU/VdL532UpAyCK7D9RxN8sdhfU7A4xuwwAeNP
t63YCPEKs9kd0rKW4W6tUOEm9IeNiHL0CL55oYNDUNk0ddTtmdlQkFKSOfDbGBwe
X3RtJeu0oG5S40RXucqy2J4BJO5tKcymjFb3xqjaCP8nDF3ozvgmq/Hu4+MWkeL7
b/rNCCE8o02rDlLqOHqxccc+bQXs6tQBkwI0mESWxpdRfBPoyt8=
=1YYz
-----END PGP SIGNATURE-----

--NqNl6FRZtoRUn5bW--


--===============6488123330015001982==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6488123330015001982==--

