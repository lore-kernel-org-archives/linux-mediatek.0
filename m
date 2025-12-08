Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDBCD3B7F3
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Dec 2025 15:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=koYXwoTEJsoPLyEPiz9nEdjQYdWChY6O9/DUrMalYaU=; b=r9AMuBSI9h7wV61nJVxWUk86kw
	pOPgvlFUVmopudFoCEGSmvrn09jL2ngKoGUuPQBzh0YuQX9xihUS9QziuSJ9D2+KI8dGFrX782Aca
	OjzghWJPPO/XFlupcBJi2av0fsvG7K+w6pye+9D8/W7dQZPrR9GbC4Qo1cITGmd+VQhVj7Iyx0hYm
	X1tkOciezXHQ9riNFCPJncLGe/5Pcn9F99IlDEXWji4aLdXHmJtkDtRFU/MU9dmSDBFRl3oB2WsPL
	R95WwDkLsA1d5xpZ/70Wz05UGv80VFZ8clLeqcH8NLgjllU4tjtUh5AaERsiPq5HqQ+OFNizRyReF
	9U+oPglw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vScpj-0000000DDrT-3HH4;
	Mon, 08 Dec 2025 15:07:27 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vScpg-0000000DDqb-3Bq3
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Dec 2025 15:07:26 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-642fcb9c16aso3836195d50.1
        for <linux-mediatek@lists.infradead.org>; Mon, 08 Dec 2025 07:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765206443; x=1765811243; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=koYXwoTEJsoPLyEPiz9nEdjQYdWChY6O9/DUrMalYaU=;
        b=aTzePrtzQqPtSNTqRBZcwpr0pXIvsKLpON+pryfpI2miTWQdz9Ib6yxY1USVSGduuf
         ZjZFPthblEIGNPTGS+iZDoUEdxtbUN7X8/KGL8NRFdIB+OiQdAhavV2NdoRCgQWT8+nR
         H0eIPoTWvIhParqEZF9tXSvWhx36D0AmMCrBqXqz49Oux8xOCsBv+NjD1j8i8BXbkID5
         TNmK8x+RSmhry5YyapMCvgH52d5+2Ed2PP0VFV5Q7xBDITmPk6bwj8ZltI4DLyWWt+ql
         T5dRbdQcS+S5o23huSNHo86bgsd2YuOkgRt9ogST2KlelAHxJ7Rt2kTSrtKEDU7dlhwH
         tnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765206443; x=1765811243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=koYXwoTEJsoPLyEPiz9nEdjQYdWChY6O9/DUrMalYaU=;
        b=uRdjcNVxDcLl2D0hDvm8S6rnL8p4PKHSMeizthLoWIc0YfRRV7dJw9ieXKMWLg6H94
         7Do3KvaxLxBeYOzyZiDsOlIoqFanNOqvnpUa76Jd0aBdzJ9Ga4ocoBkzfWEvi7+W2uT4
         bDBF5jEdgcQ27kXmiK4sLOs1TIVX+ie8dllh9WDlouV8vLO/vH2a8m0fiYuD+ncAbYuu
         kiXnwBqN7U6KX3tqrA+QuO3rfqewr8ynkf8W0ZeDQ5PYC896q5DZUCv1+VSXD9fYZxIs
         abpq0pgCabjQ3PYlv6WOQLGEs0vW0cMEg5bxnY9eLNI/KeFgqr+/XZW4UY/TYsNEh8E6
         RuQw==
X-Forwarded-Encrypted: i=1; AJvYcCWfi8ID84Wjtd2DZE2XyIGWGDGDLLmLEcJVDtsr3rorhs2pp/2DO6P3N21sQGLK02Pz1o9xTyXtEJeRK28APQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwNmxw/DvEKSLKzERucKLQisg4pDmDZm6zcu5EZ/YTO7IMeiQDB
	DOdDvXs23p3wotnfTQuIhd0yoCVModPtrijQ+iCMSVcEMgdSauvNWjPM3f2R0+TA8zB3Vc8OuHD
	a/haLdJMOiU+EOoSsRUu5mk3RrLTAfyQ=
X-Gm-Gg: ASbGncugQBXmbQ3QKVXpdFqPhv0fHAHaF/YW1/Q1ugSOn7JAC7Ck1ODJMYkOmJ1VoZ2
	TacOLZHoSwjUF5OS9JAZKOZPPr/sHGgOFSfMCaj35fvKhiaM6xh0ak53tA46Trr1EvS7ZvmWlp6
	ZiIJtBET8ZuWYcrcwh1NOepvpL73cMAtLH32Oa+FUk0A6cqlJH26Ou41quytgOhFth45T450per
	awcxgzUGIVYoxkUPYNfM8hZ8wNlp+ljwdrkxooqbLfkbKLJcdUPuvutttKP5MA0MFICIL2xxA==
X-Google-Smtp-Source: AGHT+IGYRXraUxNnTs25uPKI9qFKKJh9msu75YD1kNeHN+uqbvLo7zPFytcHo2xWkyYJWdyrK6Tt95u9MkZVGc/NOaA=
X-Received: by 2002:a05:690c:46c1:b0:78c:24d2:8e46 with SMTP id
 00721157ae682-78c33b641a6mr128823087b3.23.1765206442917; Mon, 08 Dec 2025
 07:07:22 -0800 (PST)
MIME-Version: 1.0
References: <20251207123447.93233-1-madhurkumar004@gmail.com>
In-Reply-To: <20251207123447.93233-1-madhurkumar004@gmail.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Mon, 8 Dec 2025 16:07:11 +0100
X-Gm-Features: AQt7F2pKE5CQRUA_xL32Yk7vUOwJ69Im78h8OWjd5vaMan4AvHfoEZP3-zr1coc
Message-ID: <CAOiHx=n8osZ=b=MVNsxAKEtxDvNgt1ESohLNMWoz43c9RwNfOA@mail.gmail.com>
Subject: Re: [PATCH] drivers: net: wireless: Replace deprecated PCI function
To: Madhur Kumar <madhurkumar004@gmail.com>
Cc: nbd@nbd.name, lorenzo@kernel.or, ryder.lee@mediatek.com, 
	shayne.chen@mediatek.com, sean.wang@mediatek.co, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-wireless@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_070724_809188_80A781F7 
X-CRM114-Status: GOOD (  13.76  )
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

Hi,

On Sun, Dec 7, 2025 at 1:35=E2=80=AFPM Madhur Kumar <madhurkumar004@gmail.c=
om> wrote:
>
> pcim_iomap_table() and pcim_iomap_regions() have been
> deprecated.
> Replace them with pcim_iomap_region().

The patch subject is wrong, please read
https://wireless.docs.kernel.org/en/latest/en/developers/documentation/subm=
ittingpatches.html

>
> Signed-off-by: Madhur Kumar <madhurkumar004@gmail.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/pci.c
> index ec9686183251..5a82c3bf471f 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> @@ -284,10 +284,6 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
>         if (ret)
>                 return ret;
>
> -       ret =3D pcim_iomap_regions(pdev, BIT(0), pci_name(pdev));
> -       if (ret)
> -               return ret;
> -
>         pci_read_config_word(pdev, PCI_COMMAND, &cmd);
>         if (!(cmd & PCI_COMMAND_MEMORY)) {
>                 cmd |=3D PCI_COMMAND_MEMORY;
> @@ -325,7 +321,7 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
>         dev->fw_features =3D features;
>         dev->hif_ops =3D &mt7921_pcie_ops;
>         dev->irq_map =3D &irq_map;
> -       mt76_mmio_init(&dev->mt76, pcim_iomap_table(pdev)[0]);
> +       mt76_mmio_init(&dev->mt76, pcim_iomap_region(pdev, 0, pci_name(pd=
ev)));

You are effectively removing the error checking by directly passing
the result of pcim_iomap_region() to mt76_mmio_init(). You need to
first make sure that pcim_iomap_region() succeeded.

Best regards,
Jonas

