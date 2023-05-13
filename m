Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D37EC77B7D
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 May 2023 06:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJAHS0Zaj0yVKhfNHhf5jx/XvjbWQe6dR3+gBFASJBU=; b=cWkVNblxPJW/jnG+L7ZtWpkCcu
	H3uCN8xzuoiQJnrGgv8+r721F6Clndw9OqLt0oE+92pcPdzILByYfF3GBDyqMT6KgKVNk7q69yb9k
	A7Azv27hseI99qXOeTuWBko+YIjiKgHcEx5PcIPT7DfVjmOEVej7qbupVLWf6aAeyW23ZpwFt8rB+
	dR1W2P4KWHQkqAX2/lo9bLLoysdJloZ0naAqnBQwLrb2TOYTTVmzTRtoptcb9WGaVh+/wUeCyWY04
	nCWfDCj6XkxdEAR/IWgHms64GtZG+d+pkAa9j1p3tZQUe9lYLqRoyu6y+B21bOG/SMojhptkKiyMo
	xDsFeJxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxitL-00Dsai-0l;
	Sat, 13 May 2023 06:38:07 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxitH-00DsZj-0Q;
	Sat, 13 May 2023 06:38:04 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-969f90d71d4so893268766b.3;
        Fri, 12 May 2023 23:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683959880; x=1686551880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJAHS0Zaj0yVKhfNHhf5jx/XvjbWQe6dR3+gBFASJBU=;
        b=YFD59SfNwI80NXatbYx+VnyB6F8bgTWYF5cM6l+/+0MBybE4ati0s2sJJIOR2Dql7+
         p1amTvshUKIr2n/XCcTaSELHndPCCWo+owGMRBQcF/Dqmp+vlOOYoDOxZRpsvEpdJTTt
         uUWxOlqz2ZYWlYXn3eE74ooL2nOXT5Ihsd3l/9W6ncaGvgy3lVfZ82Ck9LaTltNt5dzg
         lJRmt1J1fdlgtxYrkXdL/DEI7/7ui+2QBZi4T4g0e30hckViwFx3A7ksKyFnKHVWrPK9
         jVMcj+eSseJrZuT5YwPN3F/Fco1dfu1OckFwiEsVHkkT4aZx7GvkIUR0MCgOw0J9PThd
         O3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683959880; x=1686551880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJAHS0Zaj0yVKhfNHhf5jx/XvjbWQe6dR3+gBFASJBU=;
        b=fKUTT+FTh5q+3eK6/FRCZ6KHvSOPqvKGAZtUCfTuVUr2VxMLEYSr+NjBwJWy73Fcpt
         FrD4ts4F1HuygNf4OuDNX6KXEq7nKOzGbOp0e81VD0rk4nW+F0i0HCT8OELdjEy5Ps6M
         Qzq6x/vihmbl9hYNSrfU70eW4sQ0Obivq54CZfGwMqZ2tUnIoyYUNs89rtxUScB4vIPs
         a/Tk4n4OhYfsK8B/qEl/e9nooaMOxmU3YP+LT1zTbGpKqQSiTHm8+dwxEbjK4O9BBcz6
         0jQJORDUnwUUNI6/rM8H1pKIIcaZdWrc1rbzEVfotUWaUBhqqeAAZkvPBXU15iu4/RDZ
         fHbg==
X-Gm-Message-State: AC+VfDyrj4PFY81GSoQvYwpzkPaC0F6qrjNqJrB5VOEXos6SkijH8m4V
	FBvfbHZHSerDItQ7LHsN230=
X-Google-Smtp-Source: ACHHUZ6ItNQrDwZ3aO2IHbDnGlrK+eX28iXA7zT5j5NaZuSZ7J3VBuL20juqQ/09jGy+jwM+MI5cag==
X-Received: by 2002:a17:906:5d0f:b0:96a:ec5c:687b with SMTP id g15-20020a1709065d0f00b0096aec5c687bmr248946ejt.64.1683959880013;
        Fri, 12 May 2023 23:38:00 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id b16-20020a170906195000b0094e96e46cc0sm6371733eje.69.2023.05.12.23.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 23:37:59 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>,
 Serge Semin <fancer.lancer@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 "open list:LIBATA SUBSYSTEM" <linux-ide@vger.kernel.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH] ata: libata: Make ata_platform_remove_one return void
Date: Sat, 13 May 2023 08:37:58 +0200
Message-ID: <4827684.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20230512204646.137746-1-u.kleine-koenig@pengutronix.de>
References: <20230512204646.137746-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_233803_166078_2E083C02 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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

Dne petek, 12. maj 2023 ob 22:46:46 CEST je Uwe Kleine-K=F6nig napisal(a):
> The function returned zero unconditionally, so the function returning an
> int is something between useless and irritating. With the goal to make
> platform drivers' remove function return void, it's helpful to convert
> the function accordingly. This converts several drivers to the new
> .remove_new callback that was introduced to smoothen the platform driver
> conversion.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/ata/ahci_brcm.c        | 6 +++---
>  drivers/ata/ahci_ceva.c        | 2 +-
>  drivers/ata/ahci_da850.c       | 2 +-
>  drivers/ata/ahci_dm816.c       | 2 +-
>  drivers/ata/ahci_dwc.c         | 2 +-
>  drivers/ata/ahci_imx.c         | 2 +-
>  drivers/ata/ahci_mtk.c         | 2 +-
>  drivers/ata/ahci_mvebu.c       | 2 +-
>  drivers/ata/ahci_platform.c    | 2 +-
>  drivers/ata/ahci_qoriq.c       | 2 +-
>  drivers/ata/ahci_seattle.c     | 2 +-
>  drivers/ata/ahci_st.c          | 2 +-
>  drivers/ata/ahci_sunxi.c       | 2 +-

=46or sunxi:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  drivers/ata/ahci_tegra.c       | 2 +-
>  drivers/ata/ahci_xgene.c       | 2 +-
>  drivers/ata/libata-core.c      | 4 +---
>  drivers/ata/pata_ixp4xx_cf.c   | 2 +-
>  drivers/ata/pata_of_platform.c | 2 +-
>  drivers/ata/pata_platform.c    | 2 +-
>  drivers/ata/sata_highbank.c    | 2 +-
>  include/linux/libata.h         | 2 +-




