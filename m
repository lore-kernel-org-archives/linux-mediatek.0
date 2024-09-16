Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0205C3ABA2
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Sep 2024 10:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBoJ/aDBBhI3ahCDgVAh3bSd7T0CrEUqPmb2aIf0Rw0=; b=fq0CpkWO3ZS3cJtNJwUmR1Xh3E
	yCCT1pzfUhB7FNiiWWIchmBK6i2LEHayLVfnMfwpfO8RTK3hcQUPA5ECt08ICDof76icTGCVvmC0p
	wNUndRaVpZA62xf1pZQzOK/w45KWjR6wRQd8hUEDBP1K8T0qE2NDaHgqtwqHd3zHb71SD3tiUV/wh
	172tGkLjGEfhOP5gwUU8chdEVAFe8tnSwRxWAIcA0EKATAsxa5k28XwEsCB+GEZkiDU84br07Bi3T
	jddk7f7gy/EqsF0n/BgykJsRh7kuIq3Mw9Ikk1bz2Thx8dCpzyiOIoj3b21UyLPJuYkV4pnKgq8/S
	Locq9L6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq9PY-00000003nli-1MK3;
	Mon, 16 Sep 2024 10:56:52 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sq9OO-00000003nX6-33fC;
	Mon, 16 Sep 2024 10:55:42 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4X6hY03zmLz6K5lT;
	Mon, 16 Sep 2024 18:51:16 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id E3D721400CB;
	Mon, 16 Sep 2024 18:55:27 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 16 Sep
 2024 12:55:27 +0200
Date: Mon, 16 Sep 2024 11:55:25 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>, Saravana
 Kannan <saravanak@google.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram
 Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>, Tzung-Bi Shih
	<tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood
	<lgirdwood@gmail.com>, <chrome-platform@lists.linux.dev>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Douglas
 Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>, Jiri
 Kosina <jikos@kernel.org>, <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v7 06/10] i2c: Introduce OF component probe function
Message-ID: <20240916115525.000078a3@Huawei.com>
In-Reply-To: <ZugKHrzs5BWoDr1c@smile.fi.intel.com>
References: <20240911072751.365361-1-wenst@chromium.org>
	<20240911072751.365361-7-wenst@chromium.org>
	<ZuQTFTNTBLCziD05@smile.fi.intel.com>
	<CAGXv+5HgkCZ=vdHGgvCW1U-nid=cQrVaxC+V+H2Gknf2pnTbYA@mail.gmail.com>
	<ZugKHrzs5BWoDr1c@smile.fi.intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_035541_065509_374F84C5 
X-CRM114-Status: GOOD (  24.65  )
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

On Mon, 16 Sep 2024 13:36:14 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Sun, Sep 15, 2024 at 12:44:13PM +0200, Chen-Yu Tsai wrote:
> > On Fri, Sep 13, 2024 at 12:25=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote: =20
> > > On Wed, Sep 11, 2024 at 03:27:44PM +0800, Chen-Yu Tsai wrote: =20
>=20
> ...
>=20
> > > > +int i2c_of_probe_component(struct device *dev, const struct i2c_of=
_probe_cfg *cfg, void *ctx)
> > > > +{
> > > > +     const struct i2c_of_probe_ops *ops;
> > > > +     const char *type;
> > > > +     struct device_node *i2c_node;
> > > > +     struct i2c_adapter *i2c;
> > > > +     int ret;
> > > > +
> > > > +     if (!cfg)
> > > > +             return -EINVAL;
> > > > +
> > > > +     ops =3D cfg->ops ?: &i2c_of_probe_dummy_ops;
> > > > +     type =3D cfg->type;
> > > > +
> > > > +     i2c_node =3D i2c_of_probe_get_i2c_node(dev, type); =20
> > >
> > >
> > >         struct device_node *i2c_node __free(of_node_put) =3D
> > >                 i2c_...; =20
> >=20
> > cleanup.h says to not mix the two styles (scoped vs goto). I was trying
> > to follow that, though I realize now that with the scoped loops it
> > probably doesn't help.

The problem pattern is (IIUC)

	if (x)
		goto bob;

	struct device_node *i2c_node __free(of_node_put) =3D i2c_....


bob:
	return ret;


So a goto that jumps over registration of a cleanup function.

Jonathan

> >=20
> > I'll revert back to having __free().
> >  =20
> > > > +     if (IS_ERR(i2c_node))
> > > > +             return PTR_ERR(i2c_node);
> > > > +
> > > > +     for_each_child_of_node_with_prefix(i2c_node, node, type) {
> > > > +             if (!of_device_is_available(node))
> > > > +                     continue;
> > > > +
> > > > +             /*
> > > > +              * Device tree has component already enabled. Either =
the
> > > > +              * device tree isn't supported or we already probed o=
nce.
> > > > +              */
> > > > +             ret =3D 0; =20
> > >
> > > Shouldn't you drop reference count for "node"? (See also below) =20
> >=20
> > This for-each loop the "scoped". It just doesn't have the prefix anymor=
e.
> > I believe you asked if the prefix could be dropped and then Rob agreed.=
 =20
>=20
> Hmm... I have looked into the implementation and I haven't found the evid=
ence
> that this is anyhow scoped. Can you point out what I have missed?
>=20
> > > > +             goto out_put_i2c_node;
> > > > +     }
> > > > +
> > > > +     i2c =3D of_get_i2c_adapter_by_node(i2c_node);
> > > > +     if (!i2c) {
> > > > +             ret =3D dev_err_probe(dev, -EPROBE_DEFER, "Couldn't g=
et I2C adapter\n");
> > > > +             goto out_put_i2c_node;
> > > > +     }
> > > > +
> > > > +     /* Grab resources */
> > > > +     ret =3D 0;
> > > > +     if (ops->get_resources)
> > > > +             ret =3D ops->get_resources(dev, i2c_node, ctx);
> > > > +     if (ret)
> > > > +             goto out_put_i2c_adapter;
> > > > +
> > > > +     /* Enable resources */
> > > > +     if (ops->enable)
> > > > +             ret =3D ops->enable(dev, ctx);
> > > > +     if (ret)
> > > > +             goto out_release_resources;
> > > > +
> > > > +     ret =3D 0;
> > > > +     for_each_child_of_node_with_prefix(i2c_node, node, type) {
> > > > +             union i2c_smbus_data data;
> > > > +             u32 addr;
> > > > +
> > > > +             if (of_property_read_u32(node, "reg", &addr))
> > > > +                     continue;
> > > > +             if (i2c_smbus_xfer(i2c, addr, 0, I2C_SMBUS_READ, 0, I=
2C_SMBUS_BYTE, &data) < 0)
> > > > +                     continue;
> > > > +
> > > > +             /* Found a device that is responding */
> > > > +             if (ops->free_resources_early)
> > > > +                     ops->free_resources_early(ctx);
> > > > +             ret =3D i2c_of_probe_enable_node(dev, node); =20
> > >
> > > Hmm... Is "node" reference count left bumped up for a reason? =20
> >=20
> > Same as above. =20
>=20
> Same as above.
>=20
> > > > +             break;
> > > > +     }
> > > > +
> > > > +     if (ops->cleanup)
> > > > +             ops->cleanup(dev, ctx);
> > > > +out_release_resources:
> > > > +     if (ops->free_resources_late)
> > > > +             ops->free_resources_late(ctx);
> > > > +out_put_i2c_adapter:
> > > > +     i2c_put_adapter(i2c);
> > > > +out_put_i2c_node:
> > > > +     of_node_put(i2c_node);
> > > > +
> > > > +     return ret;
> > > > +} =20
>=20


