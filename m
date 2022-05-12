Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0199DC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 14:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8xp0a/zE+gy/zknsTM2OIDzzFwCEmH6vQttVvj0Z8BI=; b=t+6hjT5PDLVEWA
	HgMTov34lVHrghOJ70i1uTglIS7KjwdR12Xz8pXR7ItXUVq1hQKVXwlSsAL1svv12nbw0EvyOkpft
	hdouzidiemA/NtmU73DRokUrP6RDoptsP0TcT20RNqYCJkE7nuT0hcSykTyzxDgDVunPIzW1UqVWf
	bCRUT3aRR/l2MRep5lOXnXVLie7sBgWI1Kzjx681LyqkphAXEIeHGUzSCjTYEd4UK6OkDTusut8a/
	g/S+e0nhQ85l6ZjpdOBVkCcn5PJ9sZ59Bp5fK06xNjraWXK2RpDYCFu5pEI3r2r1PF7S5vjOF4P7S
	Mgin5ywuCSiZYk5In99A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np9rT-00CPBc-If; Thu, 12 May 2022 14:32:15 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np9rG-00CP4I-MR; Thu, 12 May 2022 14:32:04 +0000
Received: by mail-lj1-x232.google.com with SMTP id m23so6795740ljc.0;
 Thu, 12 May 2022 07:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=manC7iWfn9O9mSZZf/Btg4vn4iIWLjuT6FYutQmRzFY=;
 b=ozDrfX1l+/RUW8QJ1TMix/At6wyNsvaD9ODXyDqQrCaB9eSbfLWUA6SeaDJXwGU4Ms
 Pee9Z2CzInoumsPAtCWVoFDjAFLl0hiFTaCzL49q+oSbtalZ5Vp+JSv9GheL57GfLYoF
 QvJI+Z9V2kwvSRlhCbx5WRrjJXXmfhA1+2nRHZTvR4nLsh3/McCXa93fs7uvzKi0cKL1
 2dm27fPhZL5zV6XBuRb+/owrt0DPbt92JcyFQZXLf/I/DoYIG9tMQCgxOXOvSjN0XCNK
 1eHGXg/tH/lS9uDyEa7LDlEgpmaPi7yfszTfc4Te0mdYbYmhmq67p3GgLiCjdnOytdFc
 8Blw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=manC7iWfn9O9mSZZf/Btg4vn4iIWLjuT6FYutQmRzFY=;
 b=OAFuUTjz071ff8ofEe1xQK/TPhyND79kLLznDS0doxlat10zDhWycqINg1f2wwQ0T/
 Cm3AZ+IiCwP6yx05aJGPObARWg1d+7nAkoH1edBdbGrz5VeIxKMB6T6Iw02b91DlOMet
 x3ZDthE4vO45g9HnWvkhBnVYCwM2yqi71MT6U4X7yZos/gCRf3WGUqM41TBWCwTnMa9B
 s/6SZFHO4MLPAJiWdXWL+BtMcuFD6AeXrcG6wAiGOXBYhNQnA3oNi5Q6I+iUWmGKyFka
 Evlvy8sgpH0XeF5E6JxdzPgAWbAwBOibYJkZGSQhdvqgVTEDmWGdiUQkLDR5SEHnWR2R
 lNqQ==
X-Gm-Message-State: AOAM530LesLZ4fFCaQ4ZMtmL4kdOy0TIhwvbQVbrV3hA2fBzmaN+It4Q
 azWHXCLT/np6CV266Or6QkE=
X-Google-Smtp-Source: ABdhPJxPMcqx1CMFsYmZMBXkj4J0Io9idgJtMFiS4ZUOw9GabuWBPo2zvHAFBH0SAeWcFpq0rvCz7A==
X-Received: by 2002:a2e:9019:0:b0:250:8205:dfb4 with SMTP id
 h25-20020a2e9019000000b002508205dfb4mr183915ljg.396.1652365918175; 
 Thu, 12 May 2022 07:31:58 -0700 (PDT)
Received: from mobilestation ([95.79.189.214])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a19c206000000b0047255d210f1sm814755lfc.32.2022.05.12.07.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 07:31:57 -0700 (PDT)
Date: Thu, 12 May 2022 17:31:55 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Hannes Reinecke <hare@suse.de>
Cc: Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>, linux-ide@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 10/23] ata: libahci_platform: Parse ports-implemented
 property in resources getter
Message-ID: <20220512143155.c6gbufrwju3z5wmi@mobilestation>
References: <20220511231810.4928-1-Sergey.Semin@baikalelectronics.ru>
 <20220511231810.4928-11-Sergey.Semin@baikalelectronics.ru>
 <1e349868-b302-1473-188a-1a6f2bb88cd5@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1e349868-b302-1473-188a-1a6f2bb88cd5@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_073202_753058_59DD75F2 
X-CRM114-Status: GOOD (  25.80  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, May 12, 2022 at 08:48:24AM +0200, Hannes Reinecke wrote:
> On 5/12/22 01:17, Serge Semin wrote:
> > The ports-implemented property is mainly used on the OF-based platforms
> > with no ports mapping initialized by a bootloader/BIOS firmware. Seeing
> > the same of_property_read_u32()-based pattern has already been implemen=
ted
> > in the generic AHCI LLDD (glue) driver and in the Mediatek, St AHCI
> > drivers let's move the property read procedure to the generic
> > ahci_platform_get_resources() method. Thus we'll have the forced ports
> > mapping feature supported for each OF-based platform which requires tha=
t,
> > and stop re-implementing the same pattern in there a bit simplifying the
> > code.
> > =

> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > ---
> >   drivers/ata/ahci_mtk.c         | 2 --
> >   drivers/ata/ahci_platform.c    | 3 ---
> >   drivers/ata/ahci_st.c          | 3 ---
> >   drivers/ata/libahci_platform.c | 3 +++
> >   4 files changed, 3 insertions(+), 8 deletions(-)
> > =

> > diff --git a/drivers/ata/ahci_mtk.c b/drivers/ata/ahci_mtk.c
> > index 1f6c85fde983..c056378e3e72 100644
> > --- a/drivers/ata/ahci_mtk.c
> > +++ b/drivers/ata/ahci_mtk.c
> > @@ -118,8 +118,6 @@ static int mtk_ahci_parse_property(struct ahci_host=
_priv *hpriv,
> >   				   SYS_CFG_SATA_EN);
> >   	}
> > -	of_property_read_u32(np, "ports-implemented", &hpriv->force_port_map);
> > -
> >   	return 0;
> >   }
> > diff --git a/drivers/ata/ahci_platform.c b/drivers/ata/ahci_platform.c
> > index 28a8de5b48b9..9b56490ecbc3 100644
> > --- a/drivers/ata/ahci_platform.c
> > +++ b/drivers/ata/ahci_platform.c
> > @@ -56,9 +56,6 @@ static int ahci_probe(struct platform_device *pdev)
> >   	if (rc)
> >   		return rc;
> > -	of_property_read_u32(dev->of_node,
> > -			     "ports-implemented", &hpriv->force_port_map);
> > -
> >   	if (of_device_is_compatible(dev->of_node, "hisilicon,hisi-ahci"))
> >   		hpriv->flags |=3D AHCI_HFLAG_NO_FBS | AHCI_HFLAG_NO_NCQ;
> > diff --git a/drivers/ata/ahci_st.c b/drivers/ata/ahci_st.c
> > index 7526653c843b..068621099c00 100644
> > --- a/drivers/ata/ahci_st.c
> > +++ b/drivers/ata/ahci_st.c
> > @@ -168,9 +168,6 @@ static int st_ahci_probe(struct platform_device *pd=
ev)
> >   	st_ahci_configure_oob(hpriv->mmio);
> > -	of_property_read_u32(dev->of_node,
> > -			     "ports-implemented", &hpriv->force_port_map);
> > -
> >   	err =3D ahci_platform_init_host(pdev, hpriv, &st_ahci_port_info,
> >   				      &ahci_platform_sht);
> >   	if (err) {
> > diff --git a/drivers/ata/libahci_platform.c b/drivers/ata/libahci_platf=
orm.c
> > index 4e54e19f07b2..f7f9cac10cb1 100644
> > --- a/drivers/ata/libahci_platform.c
> > +++ b/drivers/ata/libahci_platform.c
> > @@ -512,6 +512,9 @@ struct ahci_host_priv *ahci_platform_get_resources(=
struct platform_device *pdev,
> >   		goto err_out;
> >   	}

> > +	of_property_read_u32(dev->of_node,
> > +			     "ports-implemented", &hpriv->force_port_map);
> > +
> >   	if (child_nodes) {
> >   		for_each_child_of_node(dev->of_node, child) {
> >   			u32 port;
> =

> What happens on the other platforms?
> Won't they register an error if that property isn't implemented?

No. The force_port_map field will be left unmodified (zero by default) in c=
ase
if the optional 'ports-implemented' property is unavailable. See the
of_property_read_u32_array() method kdoc:
https://elixir.bootlin.com/linux/latest/source/include/linux/of.h#L1261

-Sergey

> =

> Cheers,
> =

> Hannes
> -- =

> Dr. Hannes Reinecke		           Kernel Storage Architect
> hare@suse.de			                  +49 911 74053 688
> SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=FCrnberg
> HRB 36809 (AG N=FCrnberg), GF: Felix Imend=F6rffer

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
