Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57639C7EE31
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jun 2025 12:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L/kboISUHVl7C5fi/y0/ImSh6YAy6f5eQsfdMQeLy6w=; b=NQ9QAbfpN2RrsnJIrXRALia9h4
	3iZynick5oDtztSsSOayispvdcCQ8iHxQdWAaIkDYOiNl3dtDRfrT6gcK6seR4vSsy+NTnXzT/NKN
	8PeljfHtaIJ4oyFVA1sxxVaOxMrDOm0wTkaS/3KMq38fklR8UdBR6KQPvGw1EJU7qR0LZ/7GfuOU8
	/gW6F+WiXEaypbXNXSD5AA6rReo7cpo5vWD7y4c6sgBWdlQwLTAqcWSgsDWDTWmsNGPhjAdoCvY3F
	wEWJoFh+4g6R4Mi9k852ssl766yQJoXq+PUkE1zbnzPkhPT6K9ydnobWNcXAl+yrSV5SuCfLvRvq2
	OSFKTz2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV8dm-0000000Ehl6-2p3y;
	Fri, 27 Jun 2025 12:57:14 +0000
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV7xG-0000000Ebrp-3PlU
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Jun 2025 12:13:20 +0000
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-53164bd0df3so580714e0c.0
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Jun 2025 05:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751026397; x=1751631197; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/kboISUHVl7C5fi/y0/ImSh6YAy6f5eQsfdMQeLy6w=;
        b=T1KHWSR6g+M5zyp4xcJajcXFTogBCl8ssjP+iOrBipYSbK+hZCATS79EYZcfZm7CCP
         6lqezTyGg9GWS0rrVpYPzlNoDCxsS9SS7HS/ycphS7ZXByaGhit48fa3IRttFYyHrj+H
         lO5uRMc+tWgh/2OTUB12TiyYk+C1ASz6uLhVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751026397; x=1751631197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/kboISUHVl7C5fi/y0/ImSh6YAy6f5eQsfdMQeLy6w=;
        b=HUBh7noNMfKqEUMejIdegz57ta/pgSLgxsb0fl9QrDPbAgv9Aquys3JPOeGETlGkG0
         tTe1+7vtT3CZjWw9//rEeeyspuYUalTvwcOeLaE5PsQf3SA5KFde8x1QqTBaVDCZ5DGU
         LPsw3qPPDA05pb3D+eXxeH7r14zanKrmScvLXHYYwfF0lksRKc2HefCOAJiTU6jyk/4Q
         jx5L8UbuapGg0NUuXPXyDAwyYKVlQUzt7Dg/PvU7L7gHy5IqADvy8Ef3GacIZWbYLvjI
         5ikyM18bGulNQkPUpMPHQlSjkZWcA/TQOgdxb21rETv4p3mSHb43LdnsmQD5pKz+yl9t
         uqqw==
X-Gm-Message-State: AOJu0Yz3j78tcEjANcFndKCp0MZ7/x/XIQ+aivIuhyGCH/l45JF2HNpw
	QUqbZy68NJQkO80+eyWrw8ZZK91/VzaLLK0G02VoPSe8iD3Go/fwDnL9BH8YgopMwUXj/wayHRj
	CHCs=
X-Gm-Gg: ASbGncuCybOtzbzUaN5Ux9AggOumi7uomiqHJCHNwNOGt6akmWoHe8sI3Qh29PpQcvY
	/+8zUCmevrZVbPoYbxZKYuBZi1TBszsZposNsbHs9WASsHn5meRKf7djL6SrXGYBZox7exOObcy
	rlVuNovix5A+1DnOIhC326AiBjpd4s6pXj6SttQSiVFM8Ycl17i/bk15IRoi7S/4+61qqD/4Hq+
	eo/fUDDEXDIlzs0x8Ar4g5qrX9kLHjSfnp7uD1rVwLahoQeGnNoSiEMVabhCMyn/gjfVJNzRlEi
	OKFICZrsUIlYhFDNlp5MYlzqMEjEv5pcl1oTxYlaYxPwYTtlcQxUwXsDhWVL9HbFAVXlPDdviLp
	PMWjHcskybZlPWqL5ajPHBA==
X-Google-Smtp-Source: AGHT+IEoRLTvfmt6n0vIIwNbqYGpPfEmZJVUyt4anX8TnJOz4I2/prGoEdelH/QiZkLSpA510Tg8hQ==
X-Received: by 2002:a05:6122:3704:b0:531:2d55:7f54 with SMTP id 71dfb90a1353d-5330be3d630mr2179499e0c.3.1751026396824;
        Fri, 27 Jun 2025 05:13:16 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-533091edf7asm348564e0c.36.2025.06.27.05.13.15
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 05:13:15 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4c9cea30173so481316137.3
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Jun 2025 05:13:15 -0700 (PDT)
X-Received: by 2002:a05:6102:b10:b0:4e5:59ce:471b with SMTP id
 ada2fe7eead31-4ee4f8fa5cbmr2358879137.23.1751026395186; Fri, 27 Jun 2025
 05:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250623120154.109429-1-angelogioacchino.delregno@collabora.com> <20250623120154.109429-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250623120154.109429-3-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 27 Jun 2025 20:12:39 +0800
X-Gmail-Original-Message-ID: <CAC=S1njT6ygGuZDPU5KDW94Nu-TbM21DM-6HdR7Pio=WTD_eQA@mail.gmail.com>
X-Gm-Features: Ac12FXwNi69jmRwGOUm8UJ7WfMt6niSy4CkLT9-9z1YDS1Mi3aHTobxjbgMPxFw
Message-ID: <CAC=S1njT6ygGuZDPU5KDW94Nu-TbM21DM-6HdR7Pio=WTD_eQA@mail.gmail.com>
Subject: Re: [PATCH v1 02/13] pmdomain: mediatek: Refactor bus protection
 regmaps retrieval
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, ulf.hansson@linaro.org, 
	y.oudjana@protonmail.com, wenst@chromium.org, lihongbo22@huawei.com, 
	mandyjh.liu@mediatek.com, mbrugger@suse.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_051318_976544_1DCBC155 
X-CRM114-Status: GOOD (  35.65  )
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

On Mon, Jun 23, 2025 at 8:02=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In preparation to add support for new generation SoCs like MT8196,
> MT6991 and other variants, which require to set bus protection on
> different busses than the ones found on legacy chips, and to also
> simplify and reduce memory footprint of this driver, refactor the
> mechanism to retrieve and use the bus protection regmaps.
>
> This is done by removing the three pointers to struct regmap from
> struct scpsys_domain (allocated for each power domain) and moving
> them to the main struct scpsys (allocated per driver instance) as
> an array of pointers to regmap named **bus_prot.
>
> That deprecates the old devicetree properties to grab phandles to
> the three predefined busses (infracfg, infracfg-nao and smi) and
> replaces it with a new property "mediatek,bus-protection" that is
> meant to be an array of phandles holding the same busses where
> required (for now - for legacy SoCs).
>
> The new bus protection phandles are indexed by the bus_prot_index
> member of struct scpsys, used to map "bus type" (ex.: infra, smi,
> etc) to the specific *bus_prot[x] element.
>
> While the old per-power-domain regmap pointers were removed, the
> support for old devicetree was retained by still checking if the
> new property (in DT) and new-style declaration (in SoC specific
> platform data) are both present at probe time.
>
> If those are not present, a lookup for the old properties will be
> done in all of the children of the power controller, and pointers
> to regmaps will be retrieved with the old properties, but then
> will be internally remapped to follow the new style regmap anyway
> as to let this driver benefit of the memory footprint reduction.
>
> Finally, it was necessary to change macros in mtk-pm-domains.h and
> in mt8365-pm-domains.h to make use of the new style bus protection
> declaration, as the actual HW block is now recognized not by flags
> but by its own scpsys_bus_prot_block enumeration.
>
> The BUS_PROT_(STA)_COMPONENT_{INFRA,INFRA_NAO,SMI} flags were also
> removed since they are now unused, and because that enumeration was
> initially meant to vary the logic of bus protection and not the bus
> where work is performed, anyway!
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---

<snip>

>
> +static int scpsys_get_bus_protection_legacy(struct device *dev, struct s=
cpsys *scpsys)
> +{
> +       const u8 bp_blocks[3] =3D {
> +               BUS_PROT_BLOCK_INFRA, BUS_PROT_BLOCK_SMI, BUS_PROT_BLOCK_=
INFRA_NAO
> +       };
> +       struct device_node *np =3D dev->of_node;
> +       struct device_node *node, *smi_np;
> +       int num_regmaps =3D 0, i, j;
> +       struct regmap *regmap[3];
> +
> +       /*
> +        * Legacy code retrieves a maximum of three bus protection handle=
s:
> +        * some may be optional, or may not be, so the array of bp blocks
> +        * that is normally passed in as platform data must be dynamicall=
y
> +        * built in this case.
> +        *
> +        * Here, try to retrieve all of the regmaps that the legacy code
> +        * supported and then count the number of the ones that are prese=
nt,
> +        * this makes it then possible to allocate the array of bus_prot
> +        * regmaps and convert all to the new style handling.
> +        */
> +       node =3D of_find_node_with_property(np, "mediatek,infracfg");
> +       if (node) {
> +               regmap[0] =3D syscon_regmap_lookup_by_phandle(node, "medi=
atek,infracfg");
> +               of_node_put(node);
> +               num_regmaps++;
> +               if (IS_ERR(regmap[0]))
> +                       return dev_err_probe(dev, PTR_ERR(regmap[0]),
> +                                            "%pOF: failed to get infracf=
g regmap\n",
> +                                            node);
> +       } else {
> +               regmap[0] =3D NULL;
> +       }
> +
> +       node =3D of_find_node_with_property(np, "mediatek,smi");
> +       if (node) {
> +               smi_np =3D of_parse_phandle(node, "mediatek,smi", 0);
> +               of_node_put(node);
> +               if (!smi_np)
> +                       return -ENODEV;
> +
> +               regmap[1] =3D device_node_to_regmap(smi_np);
> +               num_regmaps++;
> +               of_node_put(smi_np);
> +               if (IS_ERR(regmap[1]))
> +                       return dev_err_probe(dev, PTR_ERR(regmap[1]),
> +                                            "%pOF: failed to get SMI reg=
map\n",
> +                                            node);
> +       } else {
> +               regmap[1] =3D NULL;
> +       }
> +
> +       node =3D of_find_node_with_property(np, "mediatek,infracfg-nao");
> +       if (node) {
> +               regmap[2] =3D syscon_regmap_lookup_by_phandle(node, "medi=
atek,infracfg-nao");
> +               num_regmaps++;
> +               of_node_put(node);
> +               if (IS_ERR(regmap[2]))
> +                       return dev_err_probe(dev, PTR_ERR(regmap[2]),
> +                                            "%pOF: failed to get infracf=
g regmap\n",
> +                                            node);
> +       } else {
> +               regmap[2] =3D NULL;
> +       }
> +
> +       scpsys->bus_prot =3D devm_kmalloc_array(dev, num_regmaps,
> +                                             sizeof(*scpsys->bus_prot), =
GFP_KERNEL);
> +       if (!scpsys->bus_prot)
> +               return -ENOMEM;
> +
> +       for (i =3D 0, j =3D 0; i < num_regmaps; i++) {

Did you mean BUS_PROT_BLOCK_COUNT?
Consider a case where only regmap[2] is configured.

Regards,
Fei

> +               enum scpsys_bus_prot_block bp_type;
> +
> +               if (!regmap[i])
> +                       continue;
> +
> +               bp_type =3D bp_blocks[i];
> +               scpsys->bus_prot_index[bp_type] =3D j;
> +               scpsys->bus_prot[j] =3D regmap[i];
> +
> +               j++;
> +       }
> +
> +       return 0;
> +}
> +

<snip>

