Return-Path: <SRS0=3cxa=PP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E15C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 12:00:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 749336103C
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 12:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 749336103C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZ766+G//8fk0mY29I0T3J3oGGWO6fc8Fin8LhZxec0=; b=DXoXWAuq7SEh1x
	KSiTJcGcaDtBmnPZEZ1Of8Rt8O+2hbc6FLR+lE3O2YFeC5fctLqAvwZQ3lD6GirRHQqEJ6XwWwHZD
	xlXrCTyOG/lHflITsSYjSa/HYSPJ4qoM1npFaDCj5yFS+kzmDbYOPuhsbA3dMK/oVf9GXACEKBQT5
	Ut+2YbZMm2mrVC8picNLgstya+v/7vgPxNeEbe8n3wiP3WGjYipAsQHuJ5JahEB3453DWnuG5hrCE
	V3nCVlPTn4QCEj89VMKHeoYCxEVU4iDqfGgS6GWuNZ0NJ54gENeN498N/gNQMZigrhJmaPmLfV0Lr
	bd93Gl0Q1OApTsSnc4hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfhbY-004onu-O4; Wed, 27 Oct 2021 12:00:28 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfhbL-004okG-4r; Wed, 27 Oct 2021 12:00:16 +0000
Received: by mail-ua1-x935.google.com with SMTP id u9so4387181uac.8;
 Wed, 27 Oct 2021 05:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LpfMaUsIwWmMBkvjLoHELPmDG2TU2qiVaI7dHu5QUNU=;
 b=nPO8Yf1eO5Rcpi9Rg+fqHDkOE3qCrqg76UASShd3TLYS9jY/l7yWkUMt5598ZE7XVr
 1zwOJpBrFCFUz8ZTMNoJk6Gv5OgZedWkGRgHgfxapz3PioQFIJWoAcXK3c7xPdNJEFa1
 xwteg19Hi82jiLFmWHxabGitdWttvuoyrX/GUp0Hu3dhIArJDYyGryYP1i+tSwVDOY75
 DnvXCRnLle7IaiwZCUOP0+4HWMtWbAJaLPbdh6opU2nMxMyfRtUgu6/gu/jCTpSdZndL
 LU9zYNAeJJnBXioS1IVE0PBquPgyy1zrV2UDuub13Lf1ORTfPy2fTpGKOIeRl+Q/SJuI
 zYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LpfMaUsIwWmMBkvjLoHELPmDG2TU2qiVaI7dHu5QUNU=;
 b=WjAJNV4nl0zUwTFnf5fO7QZvFFE/IH8+BTlzmy+/sLBS1opYG1nUv72TpfZ9jEIcRN
 mo9VJZ8wssp8H7HwSJHhCwMOyGkwBnBw4WYBF/2pk27opLgf3lv+4i6QcNHq4w44GaTF
 EQStuhFH/6puQRwNNbAktXMD+xI486IVjlfp0nhXszRNhXRc+ZuUwK2KmazC0X/6nmGB
 N7XDwpPhPAG9gpRGifQkajLuJ5hbajBt+jcBsJlZXYGoNejgIcqjRCrpplfZmrHOljrw
 CcClf8+jGSpb4EoEEort449RDvVB4+wI7bTeydk4b/2xCtWuIQS2P3lR9o+zFL6egr2X
 xoPg==
X-Gm-Message-State: AOAM530yexvVJ1VmDLUzxUaZ/bO786W2iG5sVyz9wBadQ0Lp6oyi+AR/
 7+328zDAr1kxzuHtCZmPR7BKygwISGNFYlmPfPg=
X-Google-Smtp-Source: ABdhPJzBo2T3m7VvmKbxfyJ5pPb7UFwA97LM05HVmxPcVIqBFlRDZjw/G4ZpNQJm+qVT3XdfvF9O8AIFN05k38EmyUc=
X-Received: by 2002:ab0:61c4:: with SMTP id m4mr13693262uan.66.1635336010157; 
 Wed, 27 Oct 2021 05:00:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1635333327.git.siyanteng@loongson.cn>
 <50f5f509c15251fb10b0c87304d272e2c89841f0.1635333327.git.siyanteng@loongson.cn>
In-Reply-To: <50f5f509c15251fb10b0c87304d272e2c89841f0.1635333327.git.siyanteng@loongson.cn>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Wed, 27 Oct 2021 13:59:58 +0200
Message-ID: <CAMhs-H9MANfLThCC-m9Q5whAgRAbnzXjUpipQdnwRf0iqPwJuw@mail.gmail.com>
Subject: Re: [PATCH 1/2] PCI: mt7621: Add MODULE_* macros to MT7621 PCIe host
 controller driver
To: Yanteng Si <siyanteng01@gmail.com>
Cc: Yanteng Si <siyanteng@loongson.cn>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
 Rob Herring <robh@kernel.org>, kw@linux.com,
 Bjorn Helgaas <bhelgaas@google.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-pci <linux-pci@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "open list:MIPS" <linux-mips@vger.kernel.org>, 
 chenhuacai@kernel.org, sterlingteng@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_050015_211938_0727EB05 
X-CRM114-Status: GOOD (  18.44  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Wed, Oct 27, 2021 at 1:32 PM Yanteng Si <siyanteng01@gmail.com> wrote:
>
> Since commit 2bdd5238e756 ("PCI: mt7621: Add MediaTek MT7621 PCIe host controller driver")
> the MT7621 PCIe host controller driver is built as a module but no MODULE_*() attributes
> were specified, causing a build error due to missing license information.
>
> ERROR: modpost: missing MODULE_LICENSE() in drivers/pci/controller/pcie-mt7621.o
>
> Fix this by adding MODULE attributes to the driver.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  drivers/pci/controller/pcie-mt7621.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/pci/controller/pcie-mt7621.c b/drivers/pci/controller/pcie-mt7621.c
> index b60dfb45ef7b..668b737f86fb 100644
> --- a/drivers/pci/controller/pcie-mt7621.c
> +++ b/drivers/pci/controller/pcie-mt7621.c
> @@ -598,3 +598,5 @@ static struct platform_driver mt7621_pci_driver = {
>         },
>  };
>  builtin_platform_driver(mt7621_pci_driver);
> +
> +MODULE_LICENSE("GPL v2");

I guess this is needed for COMPILE_TEST scenarios?

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

> \ No newline at end of file
> --
> 2.27.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
