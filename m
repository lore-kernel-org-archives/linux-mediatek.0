Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8CCC25B78
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 May 2024 09:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hUAPlHyXrESwA904RoKrpKALi6/2HCs8vSayDwgxKvE=; b=YOnCfIC5AJ2b0iCSGa0CKpoyp2
	Epp/M0MchTogv3UfRK6BHSAq5ZkrgOzuZ/yfmL78kRmTa7Dtc5ivhUyP8jCR+LudYkQhEusghD2cA
	bF/ROwIzrsWWvxxtt23frxMNzuaVeGj1uDBryH2z56z9RSiOtdjbN4Qsc5Lc6HESaRclF3W1Jz0gV
	CIuIuRXpEu2uNYlo1wz+UWW2l+DsfQsrylTrDTiulSVqH5jIz7l6LcZD0jD8Rpj8hR1oUje8LbK8O
	a3FiDqbIHDMgtRB8LXQVxwLJqqr1Nb+s6/TZzgkv5A2cNx0Td5bMwT/65OEvXpzTNOTqv5owWZmUW
	qdnLAucw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7uDh-00000007Paw-4AZG;
	Fri, 17 May 2024 09:49:46 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7uDd-00000007PYC-0ZsF;
	Fri, 17 May 2024 09:49:43 +0000
Received: from localhost (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 05DF750B;
	Fri, 17 May 2024 11:49:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1715939369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
	 references:references; bh=hUAPlHyXrESwA904RoKrpKALi6/2HCs8vSayDwgxKvE=;
	b=IVhaQzs1ynu45luIOLSUzs2QpJIVfZo75dinI6rZBU+YAYAPv+kFqDGGXJ40WeEJGwGS+O
	0SZ3GW9++Y2sWVhRr7Mj5UD8PeySGEv23PIOhr0dzUv1gT8Jql4g6tKZFFyRGWCupqvRFM
	e96t0yHhFlumCnpE5wZQkzFCFdlHUDQ4Rb4u9GOaU/6kT2UhiPpWBP/X+4oRuuL+X9kQhH
	Nkorr+yQ7zcdKgALDUq0chynHRYtXaHO8gvP8p8qNepl15snhfkSrfYqI5morMt+6Zh7ss
	tofi8sCK4PmMcScbAci28a3Nprlk5vSI58LLJRO8Bw3hnk++oC3PnmkoUP55og==
Content-Type: multipart/signed;
 boundary=18dede9a640603fdcd5671b64893c8b65da4bac91be4f9f750e9f84ab4c5;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 17 May 2024 11:49:18 +0200
Message-Id: <D1BTQIQ2AQIS.G12ROFB149QB@walle.cc>
Subject: Re: [PATCH v4 3/3] drm/mediatek: Implement OF graphs support for
 display paths
Cc: <robh@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <conor+dt@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
 <shawn.sung@mediatek.com>, <yu-chang.lee@mediatek.com>,
 <ck.hu@mediatek.com>, <jitao.shi@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <wenst@chromium.org>,
 <kernel@collabora.com>
From: "Michael Walle" <michael@walle.cc>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 <chunkuang.hu@kernel.org>
X-Mailer: aerc 0.16.0
References: <20240516081104.83458-1-angelogioacchino.delregno@collabora.com>
 <20240516081104.83458-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240516081104.83458-4-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_024941_332424_D3254B41 
X-CRM114-Status: GOOD (  30.01  )
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

--18dede9a640603fdcd5671b64893c8b65da4bac91be4f9f750e9f84ab4c5
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Angelo,

On Thu May 16, 2024 at 10:11 AM CEST, AngeloGioacchino Del Regno wrote:
> Implement OF graphs support to the mediatek-drm drivers, allowing to
> stop hardcoding the paths, and preventing this driver to get a huge
> amount of arrays for each board and SoC combination, also paving the
> way to share the same mtk_mmsys_driver_data between multiple SoCs,
> making it more straightforward to add support for new chips.

paths might be optional, see comment in mtk_drm_kms_init(). But with
this patch, you'll get an -EINVAL with a disabled path. See my
proposals how to fix that below.

With these changes and the following two patches I was able to get
DisplayPort working on vdosys1. vdosys0 wasn't used at all.
https://lore.kernel.org/r/20240516145824.1669263-1-mwalle@kernel.org/
https://lore.kernel.org/r/20240517093024.1702750-1-mwalle@kernel.org/

I've already successfully tested a former version with DSI output on
vdosys0.

Thanks for working on this!

> +/**
> + * mtk_drm_of_ddp_path_build_one - Build a Display HW Pipeline for a CRT=
C Path
> + * @dev:          The mediatek-drm device
> + * @cpath:        CRTC Path relative to a VDO or MMSYS
> + * @out_path:     Pointer to an array that will contain the new pipeline
> + * @out_path_len: Number of entries in the pipeline array
> + *
> + * MediaTek SoCs can use different DDP hardware pipelines (or paths) dep=
ending
> + * on the board-specific desired display configuration; this function wa=
lks
> + * through all of the output endpoints starting from a VDO or MMSYS hard=
ware
> + * instance and builds the right pipeline as specified in device trees.
> + *
> + * Return:
> + * * %0       - Display HW Pipeline successfully built and validated
> + * * %-ENOENT - Display pipeline was not specified in device tree
> + * * %-EINVAL - Display pipeline built but validation failed
> + * * %-ENOMEM - Failure to allocate pipeline array to pass to the caller
> + */
> +static int mtk_drm_of_ddp_path_build_one(struct device *dev, enum mtk_cr=
tc_path cpath,
> +					 const unsigned int **out_path,
> +					 unsigned int *out_path_len)
> +{
> +	struct device_node *next, *prev, *vdo =3D dev->parent->of_node;
> +	unsigned int temp_path[DDP_COMPONENT_DRM_ID_MAX] =3D { 0 };
> +	unsigned int *final_ddp_path;
> +	unsigned short int idx =3D 0;
> +	bool ovl_adaptor_comp_added =3D false;
> +	int ret;
> +
> +	/* Get the first entry for the temp_path array */
> +	ret =3D mtk_drm_of_get_ddp_ep_cid(vdo, 0, cpath, &next, &temp_path[idx]=
);
> +	if (ret) {
> +		if (next && temp_path[idx] =3D=3D DDP_COMPONENT_DRM_OVL_ADAPTOR) {
> +			dev_err(dev, "Adding OVL Adaptor for %pOF\n", next);
> +			ovl_adaptor_comp_added =3D true;
> +		} else {
> +			if (next)
> +				dev_err(dev, "Invalid component %pOF\n", next);
> +			else
> +				dev_err(dev, "Cannot find first endpoint for path %d\n", cpath);
> +
> +			return ret;
> +		}
> +	}
> +	idx++;
> +
> +	/*
> +	 * Walk through port outputs until we reach the last valid mediatek-drm=
 component.
> +	 * To be valid, this must end with an "invalid" component that is a dis=
play node.
> +	 */
> +	do {
> +		prev =3D next;
> +		ret =3D mtk_drm_of_get_ddp_ep_cid(next, 1, cpath, &next, &temp_path[id=
x]);
> +		of_node_put(prev);
> +		if (ret) {
> +			of_node_put(next);
> +			break;
> +		}
> +
> +		/*
> +		 * If this is an OVL adaptor exclusive component and one of those
> +		 * was already added, don't add another instance of the generic
> +		 * DDP_COMPONENT_OVL_ADAPTOR, as this is used only to decide whether
> +		 * to probe that component master driver of which only one instance
> +		 * is needed and possible.
> +		 */
> +		if (temp_path[idx] =3D=3D DDP_COMPONENT_DRM_OVL_ADAPTOR) {
> +			if (!ovl_adaptor_comp_added)
> +				ovl_adaptor_comp_added =3D true;
> +			else
> +				idx--;
> +		}
> +	} while (++idx < DDP_COMPONENT_DRM_ID_MAX);

/* The device might not be disabled. In that case, don't check the last
 * entry but just report the missing device. */
if (ret =3D=3D -ENODEV)
	return ret;

> +
> +	/* If the last entry is not a final display output, the configuration i=
s wrong */
> +	switch (temp_path[idx - 1]) {
> +	case DDP_COMPONENT_DP_INTF0:
> +	case DDP_COMPONENT_DP_INTF1:
> +	case DDP_COMPONENT_DPI0:
> +	case DDP_COMPONENT_DPI1:
> +	case DDP_COMPONENT_DSI0:
> +	case DDP_COMPONENT_DSI1:
> +	case DDP_COMPONENT_DSI2:
> +	case DDP_COMPONENT_DSI3:
> +		break;
> +	default:
> +		dev_err(dev, "Invalid display hw pipeline. Last component: %d (ret=3D%=
d)\n",
> +			temp_path[idx - 1], ret);
> +		return -EINVAL;
> +	}
> +
> +	final_ddp_path =3D devm_kmemdup(dev, temp_path, idx * sizeof(temp_path[=
0]), GFP_KERNEL);
> +	if (!final_ddp_path)
> +		return -ENOMEM;
> +
> +	dev_dbg(dev, "Display HW Pipeline built with %d components.\n", idx);
> +
> +	/* Pipeline built! */
> +	*out_path =3D final_ddp_path;
> +	*out_path_len =3D idx;
> +
> +	return 0;
> +}
> +
> +static int mtk_drm_of_ddp_path_build(struct device *dev, struct device_n=
ode *node,
> +				     struct mtk_mmsys_driver_data *data)
> +{
> +	struct device_node *ep_node;
> +	struct of_endpoint of_ep;
> +	bool output_present[MAX_CRTC] =3D { false };
> +	int ret;
> +
> +	for_each_endpoint_of_node(node, ep_node) {
> +		ret =3D of_graph_parse_endpoint(ep_node, &of_ep);
> +		of_node_put(ep_node);
> +		if (ret) {
> +			dev_err_probe(dev, ret, "Cannot parse endpoint\n");
> +			break;
> +		}
> +
> +		if (of_ep.id >=3D MAX_CRTC) {
> +			ret =3D dev_err_probe(dev, -EINVAL,
> +					    "Invalid endpoint%u number\n", of_ep.port);
> +			break;
> +		}
> +
> +		output_present[of_ep.id] =3D true;
> +	}
> +
> +	if (ret)
> +		return ret;
> +
> +	if (output_present[CRTC_MAIN]) {
> +		ret =3D mtk_drm_of_ddp_path_build_one(dev, CRTC_MAIN,
> +						    &data->main_path, &data->main_len);
> +		if (ret)
if (ret && ret !=3D -ENODEV)

> +			return ret;
> +	}
> +
> +	if (output_present[CRTC_EXT]) {
> +		ret =3D mtk_drm_of_ddp_path_build_one(dev, CRTC_EXT,
> +						    &data->ext_path, &data->ext_len);
> +		if (ret)
likewise

> +			return ret;
> +	}
> +
> +	if (output_present[CRTC_THIRD]) {
> +		ret =3D mtk_drm_of_ddp_path_build_one(dev, CRTC_THIRD,
> +						    &data->third_path, &data->third_len);
> +		if (ret)
likewise

> +			return ret;
> +	}
> +
> +	return 0;
> +}

-michael

--18dede9a640603fdcd5671b64893c8b65da4bac91be4f9f750e9f84ab4c5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZkcoIBEcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+F0aAYD6W0fQ3ywOFdk0kyow3ETjztMvzk4VHslN
ZALjOF3Iw7ETvkf2VWhItnpJisgqsjsBgIIFEwBEUNRLm45iMHmXfClJJIdeKozJ
k8J5f1QXzzkE7Jo+XWuspumSoqBP20IRgg==
=NAvJ
-----END PGP SIGNATURE-----

--18dede9a640603fdcd5671b64893c8b65da4bac91be4f9f750e9f84ab4c5--

