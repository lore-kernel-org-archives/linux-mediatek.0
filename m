Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA10C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Dec 2021 06:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OOYTPJIKPEi9qnwp2JR2n/akyD5cZLoZ3ejS4nTcS0U=; b=IMgXmu4OoTlUA3
	Jh52bQez+AtLogdUHMPpyXcYU6cJxH9ywhDvK4egufV4ctRUIRiohdOZ6j1oQBA8ZL2Jzl25FIRnT
	724/6Ig2X75aH4fRAlVhq+zOFVveFUzG5hgu+p/0W6lswp2Wp5bxedWyfV6M/mctXkqeghS3oqGpL
	D6JWowQpeBSok/Okw+Nsz2xlFVAVPvDxt6aOth/VvoE8aUmwGN3bN3iMs+xUY/D/EZINovgekxjGP
	tJYeMka5ybh/tKVwwgt4PSPUZsM1mbIfMNAh0dQ3oeJ4QNehA/L8sdtzMYKXoFgogyK4pD3CLrZoj
	3A9H8ypcXQf1YQ7lkmXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0HDm-00BuE9-Af; Thu, 23 Dec 2021 06:04:58 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0HDa-00BuBy-8i; Thu, 23 Dec 2021 06:04:47 +0000
Received: by mail-ua1-x933.google.com with SMTP id u6so949283uaq.0;
 Wed, 22 Dec 2021 22:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5XR6lLGbVM6j7f4TfkI4T9+Vc1GDEp24Th+tejsjoxM=;
 b=oCkF2NqSMEBD27LuyLui+c1YfgkjfBk8KbOz3NpkBbqBCGkH+Am255FfH3A/ZInq1i
 9YAZ+6HEjD1ePXpL4g6t2YLZZRYHBlZz3DRYmc6b4WU3KsEHqTP4cap8zD4odOcCuYgW
 B1M6rQAxQBHi/UXnk2FSr2cjl9ua/l/VygNdQTOm2xz3ruEWwr5oAF3VLK0mMShGLyGj
 V0vwQNy/4meKoBr87E2Ofwnmzw9hRKBqu4+2TVYAs1VPO0vc4WEZmDh1rFlG0u7L4dYN
 q2MabiPjPNsCUzTxWMJXt74g7/73nE2AedFxCs+Ga4MLRefdbZZdi9CU6nUo/JpYs10Q
 jdZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5XR6lLGbVM6j7f4TfkI4T9+Vc1GDEp24Th+tejsjoxM=;
 b=wbXnVYN6Yq6S8M4mY268nsXDGflF1allHlYjhuZK5JGkqWogm1lCuf8mmm/G2hwOzO
 OD5nk2IkjhgIqLb3JcJW5HyY+C+pbKNvN2JSMYTXeV+9NBm0hfjaFyOjJAHdi4EBWr57
 sS0e8Pk7zdzVHOaUsb7WQ8s8wP7dYqUbeBrUnFNnxcR5qzdbQELTxZ3dOXN9YmL6W2WJ
 hpV07fQP0iBu+a/i3WN6OY8HplW9X0HpwWPGRetaKh2zEpIGuL8+pXlthJpmJapL4Tvb
 oMfUrBMuDyVQs3LrKcixw6lv7ishhR2sW3QBPA7ICM2tP7QrU4QdOXTTBkZSfKo64O/2
 KdlQ==
X-Gm-Message-State: AOAM530C5wVQ50xZIZZBqqcbZGD3AcStmlNTduRN89fYm89qVZ3YA0Yy
 c2/vtoIs0Vep6cxCgF/8eMTnQajhjhLgG0zaHoU=
X-Google-Smtp-Source: ABdhPJwDbDuTISDqi+zhcgqOH8q9fsGiDk2NL6+HYKcHrWYWMNkFIpfqAnN28lPSHiN/kXqoasNjJlA6DBNeXSFbgL8=
X-Received: by 2002:a67:d51e:: with SMTP id l30mr255332vsj.1.1640239484159;
 Wed, 22 Dec 2021 22:04:44 -0800 (PST)
MIME-Version: 1.0
References: <20211223011054.1227810-1-helgaas@kernel.org>
 <20211223011054.1227810-17-helgaas@kernel.org>
In-Reply-To: <20211223011054.1227810-17-helgaas@kernel.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 23 Dec 2021 07:04:32 +0100
Message-ID: <CAMhs-H-nSTLiqgw4LxEPBiTGLh7L4n1mm4FbgOCdzCGxK5e47w@mail.gmail.com>
Subject: Re: [PATCH v2 16/23] PCI: mt7621: Make pci_ops static
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci <linux-pci@vger.kernel.org>, Fan Fei <ffclaire1224@gmail.com>, 
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-kernel-mentees@lists.linuxfoundation.org, 
 Shuah Khan <skhan@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_220446_350892_AAC93AB1 
X-CRM114-Status: GOOD (  16.31  )
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

Hi Bjorn,

On Thu, Dec 23, 2021 at 2:11 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> mt7621_pci_ops is used only in this file.  Make it static.
>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> ---
>  drivers/pci/controller/pcie-mt7621.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pci/controller/pcie-mt7621.c b/drivers/pci/controller/pcie-mt7621.c
> index b60dfb45ef7b..4138c0e83513 100644
> --- a/drivers/pci/controller/pcie-mt7621.c
> +++ b/drivers/pci/controller/pcie-mt7621.c
> @@ -148,7 +148,7 @@ static void __iomem *mt7621_pcie_map_bus(struct pci_bus *bus,
>         return pcie->base + RALINK_PCI_CONFIG_DATA + (where & 3);
>  }
>
> -struct pci_ops mt7621_pci_ops = {
> +static struct pci_ops mt7621_pci_ops = {
>         .map_bus        = mt7621_pcie_map_bus,
>         .read           = pci_generic_config_read,
>         .write          = pci_generic_config_write,
> --
> 2.25.1
>

This one was already sent and added to Lorenzo's tree. See:

https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/pci.git/commit/?h=pci/mt7621&id=8a0c1afb8560c2f64bcbdb559931f5ca8b83de87

Thanks,
    Sergio Paracuellos

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
