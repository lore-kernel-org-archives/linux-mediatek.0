Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6E8C54EE9
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Sep 2022 16:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J9KMqJi/q6W4clyZw0NlrkwRki9TMO0lxNcnvx1Dx7M=; b=VUFBK8OMvfKUTHTYJ9xmjGnNqJ
	FVBZFNkeVwOh49V4CiiWt4wsK7Y3+r53Jwq9Hj/h6wPCy6hAiJZIr0K/oDs0OI9HsqOB7dgTGXvpi
	33Y4iawRUkYKF5LSMftxVSJ0jdh4mziDZwxWLqPzMVChnJ64KDHR2gQzIBVM9v9kRTNcoo8j9sRgw
	PsvbTHWnfIicLH4TeAbE3wSWazEH2jgZLl5meY6EXYl1080oB82WERwVczyg/WhOxEZ6VYBZuU+XF
	y4nwPWf8H5OeJKPYycazU0ZK1hFIEyNY7pIl/eiQq2YYPSmXAAWH8eZ1iBfnWGaOmfsYIIxHQEV5t
	UzmVDYmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocUM4-00EpgR-D4; Sun, 25 Sep 2022 16:19:44 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocULs-00EpaU-L5; Sun, 25 Sep 2022 16:19:34 +0000
Received: by mail-lf1-x131.google.com with SMTP id a8so7376603lff.13;
        Sun, 25 Sep 2022 09:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=J9KMqJi/q6W4clyZw0NlrkwRki9TMO0lxNcnvx1Dx7M=;
        b=DSAJvMB5y7LrdMIgz2mEY5jZTvcYCFvJqeOmULmTDrFFtElW0jkSccyqTuaYDQHVA4
         jmJsWaKuoTEiQ5B71N4r6DHehQO4cf3se6jlQcU8VuOI71EJu9Zk5SwFRIE/SEyemsiF
         5tqdTPOd7QGho3eAGH6iuUFhFd2Lah9OWeLjsBm47AZwPck3xy+80e315dbPgaHK0NCh
         3nb+pK6mLbl5yH5AScwXh2/WbReQXoBDCGwECEGlNvv0E/DmpyAsiMvQ9v25HaFpmQ1A
         t0CdcPTqXWWodO83QxXbagw/+c5cfgZFo+f/YQTHKaQ9+MIWA2rKWTYTN2SNj6OfUREU
         5HXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=J9KMqJi/q6W4clyZw0NlrkwRki9TMO0lxNcnvx1Dx7M=;
        b=hl2ML0zP/aZwXXI6wEveWiTqJ6t98OAt4ZQkvdz+zgDfXGH3DPStVls6Jx9jrg4aF8
         YRehYtIqj4cLPi8X5UrJts1Jo5OzgsDmsTwE0Vb54a9d4I2oJx7a+4fZtH3PnYvmH3IZ
         nvckDR5iGkkVUowbKfTNZIGwp7ITryqUPpURVTHcHLx+UCeea9fSxRTKUYVXI/b8fOtX
         KrEhpUyAISoFb4lm7netpve3aiJeWiady4U0cLoaRBAGKmy8xv55286N13X2zHEsvwsP
         GHHdsn4H8hFr3AEIOwT+JpiI2SnECLC2QL8ZwYWSBMdFKoYzpSwJElXp/L7d7E4kuiU8
         y01A==
X-Gm-Message-State: ACrzQf2EDY4CSZTKQ91A12p8jpnNJ+bU+49LgvSPvuZLfGUTUg0l8f9l
	e3712/7KhzDLUr7Fm3RNDQM=
X-Google-Smtp-Source: AMsMyM4VQ4kfS/T8BAv5BTaYjOoI6VwKUlODD/pVTfaN8Ipg3GLRgOBNVr58j3q1TI/QIOB4wslv5Q==
X-Received: by 2002:a05:6512:3e13:b0:499:1829:5181 with SMTP id i19-20020a0565123e1300b0049918295181mr7363944lfv.71.1664122769424;
        Sun, 25 Sep 2022 09:19:29 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
        by smtp.gmail.com with ESMTPSA id c3-20020a05651221a300b0048b08e25979sm2248212lft.199.2022.09.25.09.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 09:19:28 -0700 (PDT)
Date: Sun, 25 Sep 2022 19:19:26 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Serge Semin <Sergey.Semin@baikalelectronics.ru>,
	Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Hannes Reinecke <hare@suse.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
	Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v8 09/23] ata: libahci_platform: Parse ports-implemented
 property in resources getter
Message-ID: <20220925161926.hc6txrf7yklqen7s@mobilestation>
References: <20220909193621.17380-1-Sergey.Semin@baikalelectronics.ru>
 <20220909193621.17380-10-Sergey.Semin@baikalelectronics.ru>
 <20220919215014.GA336081@roeck-us.net>
 <7872df9d-db4e-0617-84eb-e47394774322@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7872df9d-db4e-0617-84eb-e47394774322@opensource.wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220925_091932_739802_73FA6449 
X-CRM114-Status: GOOD (  26.09  )
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

On Tue, Sep 20, 2022 at 08:55:59AM +0900, Damien Le Moal wrote:
> On 9/20/22 06:50, Guenter Roeck wrote:
> > On Fri, Sep 09, 2022 at 10:36:07PM +0300, Serge Semin wrote:
> >> The ports-implemented property is mainly used on the OF-based platforms
> >> with no ports mapping initialized by a bootloader/BIOS firmware. Seeing
> >> the same of_property_read_u32()-based pattern has already been implemented
> >> in the generic AHCI LLDD (glue) driver and in the Mediatek, St AHCI
> >> drivers let's move the property read procedure to the generic
> >> ahci_platform_get_resources() method. Thus we'll have the forced ports
> >> mapping feature supported for each OF-based platform which requires that,
> >> and stop re-implementing the same pattern in there a bit simplifying the
> >> code.
> >>
> >> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> >> ---
> >>  drivers/ata/ahci_mtk.c         | 2 --
> >>  drivers/ata/ahci_platform.c    | 3 ---
> >>  drivers/ata/ahci_st.c          | 3 ---
> >>  drivers/ata/libahci_platform.c | 3 +++
> >>  4 files changed, 3 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/ata/ahci_mtk.c b/drivers/ata/ahci_mtk.c
> >> index 1f6c85fde983..c056378e3e72 100644
> >> --- a/drivers/ata/ahci_mtk.c
> >> +++ b/drivers/ata/ahci_mtk.c
> >> @@ -118,8 +118,6 @@ static int mtk_ahci_parse_property(struct ahci_host_priv *hpriv,
> >>  				   SYS_CFG_SATA_EN);
> >>  	}
> >>  
> >> -	of_property_read_u32(np, "ports-implemented", &hpriv->force_port_map);
> >> -
> >>  	return 0;
> >>  }
> >>  
> >> diff --git a/drivers/ata/ahci_platform.c b/drivers/ata/ahci_platform.c
> >> index 28a8de5b48b9..9b56490ecbc3 100644
> >> --- a/drivers/ata/ahci_platform.c
> >> +++ b/drivers/ata/ahci_platform.c
> >> @@ -56,9 +56,6 @@ static int ahci_probe(struct platform_device *pdev)
> >>  	if (rc)
> >>  		return rc;
> >>  
> >> -	of_property_read_u32(dev->of_node,
> >> -			     "ports-implemented", &hpriv->force_port_map);
> >> -
> >>  	if (of_device_is_compatible(dev->of_node, "hisilicon,hisi-ahci"))
> >>  		hpriv->flags |= AHCI_HFLAG_NO_FBS | AHCI_HFLAG_NO_NCQ;
> >>  
> >> diff --git a/drivers/ata/ahci_st.c b/drivers/ata/ahci_st.c
> >> index 7526653c843b..068621099c00 100644
> >> --- a/drivers/ata/ahci_st.c
> >> +++ b/drivers/ata/ahci_st.c
> >> @@ -168,9 +168,6 @@ static int st_ahci_probe(struct platform_device *pdev)
> >>  
> >>  	st_ahci_configure_oob(hpriv->mmio);
> >>  
> >> -	of_property_read_u32(dev->of_node,
> >> -			     "ports-implemented", &hpriv->force_port_map);
> >> -
> > 
> > With arm:allmodconfig, this results in:
> > 
> >   CC [M]  drivers/ata/ahci_st.o
> > drivers/ata/ahci_st.c: In function 'st_ahci_probe':
> > drivers/ata/ahci_st.c:147:24: error: unused variable 'dev' [-Werror=unused-variable]
> >   147 |         struct device *dev = &pdev->dev;
> > 
> > Guenter
> 

> Just pushed a fix for this in ata tree for-next and for-6.1 branches. The
> problem should be resolved with the next linux-next merge.

Once again thanks for sending the fix for my mistake.

Regards,
-Sergey

> 
> -- 
> Damien Le Moal
> Western Digital Research
> 

