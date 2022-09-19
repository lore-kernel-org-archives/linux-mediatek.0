Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16332ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 21:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kk7J0kbmWOo0ElCJGaFd9+RljsQo/irob0nXHRUh9g4=; b=K4UlYyI/styr/9bZY1aX2FauEN
	2YO5bWiXJl12fPj3h16n6IaQd58Ptmi1IpGOWvBdMwPHJFSJL28JFrmN42ZcQcG2jFA1muGL3fhTb
	JqPI/hbfc8BKqhODjiIeDJ0zjxXyC+0f/cizkxZHxsSH43QdjZMrVhjzOBQTaYJv3KLXY9tIqrywD
	7lix3+OPeFY4kTh/0BwGXa5NMdnGgjzfcULjowPxULga58c3geyN5KKKbXFkbRMvuQldXcV59ZuuX
	xEZ+lLi5ecwyK4G0NN8Nct0vlZSItozw9T8W4s4CMN+jN6X/+HxE2bbrlgRy4MXUnHx2jOuloooe3
	vfqUTqGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaOes-00Fi7c-Q5; Mon, 19 Sep 2022 21:50:30 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaOeg-00Fi1t-Uk; Mon, 19 Sep 2022 21:50:20 +0000
Received: by mail-pg1-x536.google.com with SMTP id t70so603003pgc.5;
        Mon, 19 Sep 2022 14:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=kk7J0kbmWOo0ElCJGaFd9+RljsQo/irob0nXHRUh9g4=;
        b=S5nLy3TPw7ILmHNMx1jaAOARf0AyNjNd2mXDIfB0S9mQVlHCa1B+dQxa3QQxTRKljE
         5IcUAjXgPyr1AzCH2r11GZBERiGm71sfcw9M96NJGoY/D1N58ftnabjaqkEchNUZp1ax
         YkNWr2B3x73QVIgDhkjptcFT7pw/MUspxnNzPysC3de7CAbK4TIKnKkQkjmJT8OOGd6r
         ILp7s4AegZ/w0ZY7uOel1bPwlBMSKElixjKtA+6WS8TDEz0h0/N/wPu6VSTfopRAtF2R
         LreLT/NcoyAeAy8ZrMGP3FsOVaMh79HiCK8n4isvbC+afGgXaYSXSSVanVBYk0uI4uHX
         Pj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date;
        bh=kk7J0kbmWOo0ElCJGaFd9+RljsQo/irob0nXHRUh9g4=;
        b=szCeG3+1iOQ4bW5wNzcKrZ2zhIshLhtU65BpmWrOMmiz+OM9raHiNDFcEZJ3Ls1Osm
         1MQsGSuTlsBSo/lzbICObxIVvKxRo86QQsQ2fBKrqMouejpMq7lr3LT/KlnaLt0qKEvu
         PYfoe+6lXq4dy6R0kLd8psUwrGF2RPtXoCUmP7avVK/ffLu03uPVHhg9mUjtsG0ts9r8
         +Xptk70nnrI3B53Q4u1N+YZtT7fpKB8HY7gml4/RgTuluFniQAIDkb3JQt7SXbyLwX99
         oDHacnBZ4Ba0PuCLyfvY9tHo3JZfSyKeT/7ojk0T94uAth3vm2knqs1+8SSGdcPeh2wn
         NF8g==
X-Gm-Message-State: ACrzQf1SBKrNMCNUo4u3XBJZeX5+hwh4Bjek0r1+M7WMZ7GxF0J2MfXe
	FT/veavEXRanmpBo4UlbWWU=
X-Google-Smtp-Source: AMsMyM6iftGnRzY+31jrAofx44FXCGKCcoJx9qjkQXDrx/KzZF6TV12z7StjR9+X2ADJmT4QVhfY6A==
X-Received: by 2002:aa7:8607:0:b0:53b:13b5:2b6a with SMTP id p7-20020aa78607000000b0053b13b52b6amr21041435pfn.52.1663624217009;
        Mon, 19 Sep 2022 14:50:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e11-20020a17090301cb00b00172a670607asm20560809plh.300.2022.09.19.14.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 14:50:15 -0700 (PDT)
Date: Mon, 19 Sep 2022 14:50:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Hannes Reinecke <hare@suse.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
	Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v8 09/23] ata: libahci_platform: Parse ports-implemented
 property in resources getter
Message-ID: <20220919215014.GA336081@roeck-us.net>
References: <20220909193621.17380-1-Sergey.Semin@baikalelectronics.ru>
 <20220909193621.17380-10-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909193621.17380-10-Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_145019_032911_2AFFF6C9 
X-CRM114-Status: GOOD (  22.05  )
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

On Fri, Sep 09, 2022 at 10:36:07PM +0300, Serge Semin wrote:
> The ports-implemented property is mainly used on the OF-based platforms
> with no ports mapping initialized by a bootloader/BIOS firmware. Seeing
> the same of_property_read_u32()-based pattern has already been implemented
> in the generic AHCI LLDD (glue) driver and in the Mediatek, St AHCI
> drivers let's move the property read procedure to the generic
> ahci_platform_get_resources() method. Thus we'll have the forced ports
> mapping feature supported for each OF-based platform which requires that,
> and stop re-implementing the same pattern in there a bit simplifying the
> code.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  drivers/ata/ahci_mtk.c         | 2 --
>  drivers/ata/ahci_platform.c    | 3 ---
>  drivers/ata/ahci_st.c          | 3 ---
>  drivers/ata/libahci_platform.c | 3 +++
>  4 files changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/ata/ahci_mtk.c b/drivers/ata/ahci_mtk.c
> index 1f6c85fde983..c056378e3e72 100644
> --- a/drivers/ata/ahci_mtk.c
> +++ b/drivers/ata/ahci_mtk.c
> @@ -118,8 +118,6 @@ static int mtk_ahci_parse_property(struct ahci_host_priv *hpriv,
>  				   SYS_CFG_SATA_EN);
>  	}
>  
> -	of_property_read_u32(np, "ports-implemented", &hpriv->force_port_map);
> -
>  	return 0;
>  }
>  
> diff --git a/drivers/ata/ahci_platform.c b/drivers/ata/ahci_platform.c
> index 28a8de5b48b9..9b56490ecbc3 100644
> --- a/drivers/ata/ahci_platform.c
> +++ b/drivers/ata/ahci_platform.c
> @@ -56,9 +56,6 @@ static int ahci_probe(struct platform_device *pdev)
>  	if (rc)
>  		return rc;
>  
> -	of_property_read_u32(dev->of_node,
> -			     "ports-implemented", &hpriv->force_port_map);
> -
>  	if (of_device_is_compatible(dev->of_node, "hisilicon,hisi-ahci"))
>  		hpriv->flags |= AHCI_HFLAG_NO_FBS | AHCI_HFLAG_NO_NCQ;
>  
> diff --git a/drivers/ata/ahci_st.c b/drivers/ata/ahci_st.c
> index 7526653c843b..068621099c00 100644
> --- a/drivers/ata/ahci_st.c
> +++ b/drivers/ata/ahci_st.c
> @@ -168,9 +168,6 @@ static int st_ahci_probe(struct platform_device *pdev)
>  
>  	st_ahci_configure_oob(hpriv->mmio);
>  
> -	of_property_read_u32(dev->of_node,
> -			     "ports-implemented", &hpriv->force_port_map);
> -

With arm:allmodconfig, this results in:

  CC [M]  drivers/ata/ahci_st.o
drivers/ata/ahci_st.c: In function 'st_ahci_probe':
drivers/ata/ahci_st.c:147:24: error: unused variable 'dev' [-Werror=unused-variable]
  147 |         struct device *dev = &pdev->dev;

Guenter

