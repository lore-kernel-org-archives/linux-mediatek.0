Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DB2C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Mar 2023 06:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ht5I7OIX/IrJ6V0jccO0TzKRfXwvIOrcze/Fv6KOhG0=; b=lNJrDKu9sR+Ocs7HwLiVv0uCxs
	gfDyXYkjvaxtBycmL1Y0GBau/j6qqpIWz/VB5O9qevyK+8rwM+E5OTc51dG4pRrkjKKNqqQKtI4+v
	EHaDf5ltUYF1blYZHlFWwEFUeKtJqC6Vztz4qI86ewNeDoGFFnlSAJDlsAa5yB89vcD5Llv6xG5PE
	qPyVX/otA2W5jXGm/f4j5DPlgxOf6NOOymDx5GFSj4UQDo6WgS/XJ+VgUosHVXkYlgrrIpVlxmhCm
	V+soyeECeT9RviXjYr5Pl6Fq/3MDWXf4pzPQS6aZtvMNtlREigmTRutpNNUjk0d3cf3gZ/4wYVJ3P
	biXQex1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfEMU-000xzi-0o;
	Thu, 23 Mar 2023 06:23:46 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfEMQ-000xyQ-1B;
	Thu, 23 Mar 2023 06:23:43 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 103-20020a9d0870000000b0069f000acf40so9203714oty.1;
        Wed, 22 Mar 2023 23:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679552619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ht5I7OIX/IrJ6V0jccO0TzKRfXwvIOrcze/Fv6KOhG0=;
        b=dljZfMgzRnrEjH6xjxk9nSZDm/ZDZFj4GDRIuvgxwuS/Qxsp3tHXJ+/FLf+k13dhhN
         WQxTj5ZQlS+3do9MBtCaXGXOPoWyoyVGNCuyqZkYFGcWpSj0+0AS5Sjh+9GLV0i8ET0a
         NZgmgsiOqAoskQxVGBsGOy4BOKstvPX0Uwg2byzerzqsv1/yXAL0TPpc/9BAtYTj77En
         EAcO90gnPTDeZHKSuiEnC336/FkXr4b8tYLEdHTJQgYUBxEw6DvznDVh8MLQcI4waxtF
         joC1rFEruYUCYNtuwEqz1/BIy1gfz4wIOPCqMuMKM5sY+Nt3ngID2OuS/XySBjX2BWTT
         T+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679552619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ht5I7OIX/IrJ6V0jccO0TzKRfXwvIOrcze/Fv6KOhG0=;
        b=RsoCKbbWDPkPxoxUcCG+MTEcmcC9PfUQlc5eiemoCdvnJSlypLAtzWLWOYk1f2vSBa
         Veupqc5ds5FWAUg28XEzPbYwVP86Gutm82Q9jBSysEmeeGh4lGO69MFjb2qb04M26HVC
         DiH/K6YRcgJRKVNM0zi2/z1Qsc8oGXIlYKthptzWVwcbAi3J+pPzRbQeSCIpvJ/pkz7E
         QZeGnU49BCx7kKAebN/Q8lf9DXxBCqEmv26hE1wumJE9j8d3F8oz6hCx9IEOLzV0HY8Q
         brBI0dcrmQXpFuhfBm+Z5wU5J7gnpkuuJp2x5nYCtLvEc8gNlJySu4ypjrBx1UICLNlb
         IYPw==
X-Gm-Message-State: AO0yUKVQmD27l4zdFuKb6iHERqPd2mQ6/wKMgt3iAXbiEMaBdYF9LuI8
	iXy258MGwtYIumlUtRW/nGM4M6ULQGA6kA2Tt4o=
X-Google-Smtp-Source: AK7set/a3UdlvsYh0TlqcxTfXISjWC5Ygh/aCw/RURJS4SK3uhj3OzfAYD24wotJyRXS0LXuZMb2G+tzh0Gj2hn54cM=
X-Received: by 2002:a9d:7387:0:b0:69e:aa7:6b71 with SMTP id
 j7-20020a9d7387000000b0069e0aa76b71mr1892196otk.3.1679552619210; Wed, 22 Mar
 2023 23:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <202303231145121987818@zte.com.cn>
In-Reply-To: <202303231145121987818@zte.com.cn>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 23 Mar 2023 07:23:26 +0100
Message-ID: <CAMhs-H_-kQ0FGP3L1xJ=ec_xJ59a2OztMLLjEQmQfYFOEa4DfA@mail.gmail.com>
Subject: Re: [PATCH] PCI: mt7621: Use dev_err_probe()
To: ye.xingchen@zte.com.cn
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, bhelgaas@google.com, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_232342_422473_8EBA4835 
X-CRM114-Status: GOOD (  17.36  )
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

On Thu, Mar 23, 2023 at 4:45=E2=80=AFAM <ye.xingchen@zte.com.cn> wrote:
>
> From: Ye Xingchen <ye.xingchen@zte.com.cn>
>
> Replace the open-code with dev_err_probe() to simplify the code.
>
> Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
> ---
>  drivers/pci/controller/pcie-mt7621.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pci/controller/pcie-mt7621.c b/drivers/pci/controlle=
r/pcie-mt7621.c
> index 63a5f4463a9f..964de0e8c6a0 100644
> --- a/drivers/pci/controller/pcie-mt7621.c
> +++ b/drivers/pci/controller/pcie-mt7621.c
> @@ -220,10 +220,9 @@ static int mt7621_pcie_parse_port(struct mt7621_pcie=
 *pcie,
>         }
>
>         port->pcie_rst =3D of_reset_control_get_exclusive(node, NULL);
> -       if (PTR_ERR(port->pcie_rst) =3D=3D -EPROBE_DEFER) {
> -               dev_err(dev, "failed to get pcie%d reset control\n", slot=
);
> -               return PTR_ERR(port->pcie_rst);
> -       }
> +
> +       return dev_err_probe(dev, PTR_ERR(port->pcie_rst),
> +                            "failed to get pcie%d reset control\n", slot=
);
>
>         snprintf(name, sizeof(name), "pcie-phy%d", slot);
>         port->phy =3D devm_of_phy_get(dev, node, name);

So this code is unreachable now. Please fix your tools.

> --
> 2.25.1

Also, this is not a probe(), so I don't see a point of using
dev_err_probe() here.

Thanks,
    Sergio Paracuellos

