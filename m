Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B04C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jan 2024 07:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EOW57OUXuZU3/Ye+Ce6TauP/AqyMCBhkCXYeKvnbDiM=; b=YQFeihbtAALtfN0gJZM4j5N9Zx
	5p2O7A0FdFDYHDnnX8Nomt02oOlJmuBSVD/HzPdD3pqg0uAheq12/6qUGh/66s4SLXUtY8BuXMiDp
	uhjTKy2X0zaVxQRwp8oa0f9SXwicG0OrWvMMdnB4twLkXo3F9iAuEV2tNV92bn79r5rr7wcIzLjdq
	60QLEGK0/qIfCnPc/K0OWiZllDA7QNf/nArUbmi6PDMuEheg4fyTP4uJpGEs+xNtm2Ii44UN+Rv8e
	mwEu0DmXst9SXn7c27oXF7D0p+jvfd1vTwLO91Rh16c0BY1U3lHIKscIJpwxu/sfOQ7rUlA82LHjB
	YV6vAYqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNSpZ-00AaGc-2v;
	Wed, 10 Jan 2024 07:16:53 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNSpW-00AaFJ-0O
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jan 2024 07:16:51 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-2053f5e97b2so2522903fac.3
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Jan 2024 23:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704871005; x=1705475805; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOW57OUXuZU3/Ye+Ce6TauP/AqyMCBhkCXYeKvnbDiM=;
        b=ftsqumajVHa7r+kzb82OxY2uhaO4al0w2IyhY4z2PFmo7RW8z9AAk4W1U5XRFY5FBM
         HBxc4aplHeatkQIdoc1RbVjaUNlD/wZ1pgamk20fA17WAiwVGWdCvYWq9TowoyueVGBb
         K1ga5nA7Ip6Q92t89YxBBAl8E+Zp7i34gjTFdotXGDnKxqTsYbGWm+esoe+ov1amiI4i
         +RgOuO3SyKD9N55RwJq/NdQhO8kYbLeyE5wPUYVcz1Jy5M+OeJQoiCgaSjGR1HkoXD8S
         vpFDifALkJM8kv+qLC6VfVZf2EHO9VbLEHzSvAS236wIDX9B1d8ftBabvDQeofUZIU9/
         y6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704871005; x=1705475805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOW57OUXuZU3/Ye+Ce6TauP/AqyMCBhkCXYeKvnbDiM=;
        b=keIHC87B16xDmE4xi4GF+eMhfFIeEsv6XxUtTeXDlkmr1D8EABIsRPjUNtdd1XyFFm
         6riUPTyNkFUvzZAyDHZ64orMcjxrLH6ra/E/BSLEsh2bHYk1hG39Ur7pi58QfpZ/+xZL
         w6hnTh/9qtko0aF6r/RSbTA6v4WZv9kiieH/dM++9TrreAgkrtJc3IZV/j/jgSfBE0Qc
         yVy+lOeTZGDw79N1N0HRvqytGoGoHQ4AN8i3oJHU5g6JyWT+EdmnbIWrAso/O+kEVBsh
         nYWOu7AY2O4wg6U6A4rBRTvjwhaML5Jiyf9UlFRU238/FanP6uXveJgSQBJzQkV2UzpE
         87Cw==
X-Gm-Message-State: AOJu0YxhzscpLuRSQcHt200g0kQ/G+bJkqt8aVpqYAGsW4J46F+zVq20
	LAWl2o8XRRgmn8WUlpbc6cFzL09znBKF/0pRg/8=
X-Google-Smtp-Source: AGHT+IGbFlTQKx2TfF5clBJ9JA66JR2JWDmAGPOibvE5cwQq6NBl7iD5x8WXUwXlqfeGFyOutmMU4gZJ06dM/Lw3/sk=
X-Received: by 2002:a05:6871:7a3:b0:1fb:2c68:6c0b with SMTP id
 o35-20020a05687107a300b001fb2c686c0bmr356822oap.37.1704871005578; Tue, 09 Jan
 2024 23:16:45 -0800 (PST)
MIME-Version: 1.0
References: <20240109235148.GA2082000@bhelgaas>
In-Reply-To: <20240109235148.GA2082000@bhelgaas>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Wed, 10 Jan 2024 08:16:33 +0100
Message-ID: <CAMhs-H_7EovAntGwmDUDS3HNKV5H4w1UM=7cpk9GMi7Hi_kQVQ@mail.gmail.com>
Subject: Re: mt7621 static check warning
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_231650_157002_4C356F70 
X-CRM114-Status: GOOD (  15.80  )
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

Hi Bjorn,

Thanks for the report.

On Wed, Jan 10, 2024 at 12:51=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.org>=
 wrote:
>
> Hi Sergio,
>
> FYI:
>
>   $ make W=3D1 drivers/pci/
>     CC      drivers/pci/controller/pcie-mt7621.o
>   drivers/pci/controller/pcie-mt7621.c: In function =E2=80=98mt7621_pcie_=
probe=E2=80=99:
>   drivers/pci/controller/pcie-mt7621.c:228:49: error: =E2=80=98snprintf=
=E2=80=99 output may be truncated before the last format character [-Werror=
=3Dformat-truncation=3D]
>     228 |         snprintf(name, sizeof(name), "pcie-phy%d", slot);
>         |                                                 ^
>   drivers/pci/controller/pcie-mt7621.c:228:9: note: =E2=80=98snprintf=E2=
=80=99 output between 10 and 11 bytes into a destination of size 10
>     228 |         snprintf(name, sizeof(name), "pcie-phy%d", slot);
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>

Would you be happy if I just increment the buffer as follows?

diff --git a/drivers/pci/controller/pcie-mt7621.c
b/drivers/pci/controller/pcie-mt7621.c
index 79e225edb42a..d97b956e6e57 100644
--- a/drivers/pci/controller/pcie-mt7621.c
+++ b/drivers/pci/controller/pcie-mt7621.c
@@ -202,7 +202,7 @@ static int mt7621_pcie_parse_port(struct mt7621_pcie *p=
cie,
        struct mt7621_pcie_port *port;
        struct device *dev =3D pcie->dev;
        struct platform_device *pdev =3D to_platform_device(dev);
-       char name[10];
+       char name[11];
        int err;

        port =3D devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);

Or should I use scnprintf instead? Since the statement is not using
function return value at all snprintf looks more correct and simpler
at a first glance.

diff --git a/drivers/pci/controller/pcie-mt7621.c
b/drivers/pci/controller/pcie-mt7621.c
index 79e225edb42a..0eae1b5b079e 100644
--- a/drivers/pci/controller/pcie-mt7621.c
+++ b/drivers/pci/controller/pcie-mt7621.c
@@ -225,7 +225,7 @@ static int mt7621_pcie_parse_port(struct mt7621_pcie *p=
cie,
                return PTR_ERR(port->pcie_rst);
        }

-       snprintf(name, sizeof(name), "pcie-phy%d", slot);
+       scnprintf(name, sizeof(name), "pcie-phy%d", slot);
        port->phy =3D devm_of_phy_get(dev, node, name);
        if (IS_ERR(port->phy)) {
                dev_err(dev, "failed to get pcie-phy%d\n", slot);


Both of them silence the warning, so let me know your preference here.

> I know we'll never actually hit this, but it'd be nice to clean this
> up, and I don't think it would really cost us anything.  I think it's
> currently the only "W=3D1" warning in drivers/pci/.

I am also getting this:

drivers/pci/controller/dwc/pci-dra7xx.c: In function =E2=80=98dra7xx_pcie_p=
robe=E2=80=99:
drivers/pci/controller/dwc/pci-dra7xx.c:754:41: error: =E2=80=98%d=E2=80=99=
 directive
output may be truncated writing between 1 and 10 bytes into a region
of size 2 [-Werror=3Dformat-truncation=3D]
  754 |   snprintf(name, sizeof(name), "pcie-phy%d", i);
      |                                         ^~
drivers/pci/controller/dwc/pci-dra7xx.c:754:32: note: directive
argument in the range [0, 2147483646]
  754 |   snprintf(name, sizeof(name), "pcie-phy%d", i);
      |                                ^~~~~~~~~~~~
drivers/pci/controller/dwc/pci-dra7xx.c:754:3: note: =E2=80=98snprintf=E2=
=80=99 output
between 10 and 19 bytes into a destination of size 10
  754 |   snprintf(name, sizeof(name), "pcie-phy%d", i);
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Best regards,
    Sergio Paracuellos

>
> Bjorn

