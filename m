Return-Path: <SRS0=h+tY=YW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 716F5CA9EC3
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Oct 2019 15:58:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 410DC20856
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Oct 2019 15:58:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tNhcz5BO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="auxvEGz+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 410DC20856
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6cii9p4Jyh7bmEMWrshzdCbMzWeEEudTmwd29FpxP/U=; b=tNhcz5BOSVgEvd
	hH90HaGmx8L+6CB1e2egi/dHZudPfgHnljPMCtXZ5I/ur1LmP6ouehUyfJtFjzs6aVel1VBNNnXHf
	v0yBSf98yytIYWasHgYS1sRFa7/7VFC2lJCD0H7YSCcxyXFKtPOPGfSAGONU/rTGaVYrlCgevvPor
	sFBxFcp3qtQtfM59K0RUpjxtfxlBxv337Aw0WVugJyV4xgSCb6E48pQpfKRAWfbIJ9KijQFPP4wnt
	EIvzW3rKZdwdgN1GhsRokrwn8uWPCPJ2kaXJgrF84LZcNQhzE6XU2R02F62yKTGdmv+2KC8zSAtO0
	dSZdJY0iooTmv7PtDVSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPTtL-0001BK-Sv; Tue, 29 Oct 2019 15:58:43 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPTtI-00019p-Hz
 for linux-mediatek@lists.infradead.org; Tue, 29 Oct 2019 15:58:42 +0000
Received: by mail-wm1-x343.google.com with SMTP id c22so2991854wmd.1
 for <linux-mediatek@lists.infradead.org>; Tue, 29 Oct 2019 08:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ogyg03BfT8gaHZbuV4/3535qjZlsTqwkzaB+k+qmJSk=;
 b=auxvEGz+98ZDBi/3qT4estTcr/B0w8IzvpYRBlJghVDt+kEZTN1DrBp6hsX/szCm0S
 Ntg3b9Z1+ejknx7Ccrkleqkzjl8Ky11vHSpEAGmlWVbc6JJnMtLuoVbGHlLb8LrKT3cn
 uKPaHB3q+wCzJC2R81txkKTpwzgO4YZ3vvsV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ogyg03BfT8gaHZbuV4/3535qjZlsTqwkzaB+k+qmJSk=;
 b=NnoMsLvSj7SiSjlFtoi2swUWoCsujdY7u9ePVZ2hWtCk0sCYRHqXhf7qKJ2vVVT5P0
 pxLayF9Z2ZkBcu2MaF2L0jcPcGqrlj8qFhcthsjebBU7E7Get8bUVXgm9ksJwK0uGHCy
 ceOASDxULBpkrlVSKnWJ8jSb9J5yzdyl/ewSuE64XoCmx5tJHJhnoFlsYSKw8PIIDfUF
 z6V449J5WmfrJsn5qIbVhOLsa5FzgBTPupr0myWe/uTb9BKBTQQWab04k91akoU86Fp9
 +6dzt8sgzoHRlRjsA0V4eIEypfStyWV+B9lNOwJFqjTovx1vGat+uwpTifhNNFsizwF6
 feIw==
X-Gm-Message-State: APjAAAUOPiImp7RVi5MEkEePbGKGjhWHyOGExHZByQtQPDYF81a2nQ2i
 p6K3JQcDacNKgFd2LlWys/No5sx5aqcuDI7rIsGmFA==
X-Google-Smtp-Source: APXvYqxXBunHeyxtZsAWTCPejceTiGMbnnAGC4cBuQxzLelWDxFoP9zriSI9AupBxaoECqcivUoGxX1DNc3YZFr8rtQ=
X-Received: by 2002:a1c:6282:: with SMTP id w124mr4723287wmb.172.1572364718992; 
 Tue, 29 Oct 2019 08:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <20191028163256.8004-1-robh@kernel.org>
 <20191028163256.8004-8-robh@kernel.org>
In-Reply-To: <20191028163256.8004-8-robh@kernel.org>
From: Srinath Mannam <srinath.mannam@broadcom.com>
Date: Tue, 29 Oct 2019 21:28:27 +0530
Message-ID: <CABe79T4uF0vnxAbbR-ckr4uBpni3KmD2RYqSS_jUh-KRDFLvzQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/25] PCI: iproc: Use pci_parse_request_of_pci_ranges()
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191029_085840_596121_FDD0A337 
X-CRM114-Status: GOOD (  17.36  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Heiko Stuebner <heiko@sntech.de>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, linux-pci@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Toan Le <toan@os.amperecomputing.com>, Will Deacon <will@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Michal Simek <michal.simek@xilinx.com>, Christoph Hellwig <hch@infradead.org>,
 linux-rockchip@lists.infradead.org,
 BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
 Shawn Lin <shawn.lin@rock-chips.com>, Ray Jui <rjui@broadcom.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Ryder Lee <ryder.lee@mediatek.com>,
 linux-mediatek@lists.infradead.org, Andrew Murray <andrew.murray@arm.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>, Jingoo Han <jingoohan1@gmail.com>,
 rfi@lists.rocketboards.org, linux-renesas-soc@vger.kernel.org,
 Tom Joseph <tjoseph@cadence.com>, Simon Horman <horms@verge.net.au>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Ley Foon Tan <lftan@altera.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Rob,

I reviewed and verified this change.. It is working fine.

Regards,
Srinath.

On Mon, Oct 28, 2019 at 10:03 PM Rob Herring <robh@kernel.org> wrote:
>
> Convert the iProc host bridge to use the common
> pci_parse_request_of_pci_ranges().
>
> There's no need to assign the resources to a temporary list, so just use
> bridge->windows directly.
>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: Scott Branden <sbranden@broadcom.com>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Reviewed-by: Andrew Murray <andrew.murray@arm.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/pci/controller/pcie-iproc-platform.c | 8 ++------
>  drivers/pci/controller/pcie-iproc.c          | 5 -----
>  2 files changed, 2 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/pci/controller/pcie-iproc-platform.c b/drivers/pci/controller/pcie-iproc-platform.c
> index 9ee6200a66f4..375d815f7301 100644
> --- a/drivers/pci/controller/pcie-iproc-platform.c
> +++ b/drivers/pci/controller/pcie-iproc-platform.c
> @@ -43,8 +43,6 @@ static int iproc_pcie_pltfm_probe(struct platform_device *pdev)
>         struct iproc_pcie *pcie;
>         struct device_node *np = dev->of_node;
>         struct resource reg;
> -       resource_size_t iobase = 0;
> -       LIST_HEAD(resources);
>         struct pci_host_bridge *bridge;
>         int ret;
>
> @@ -97,8 +95,7 @@ static int iproc_pcie_pltfm_probe(struct platform_device *pdev)
>         if (IS_ERR(pcie->phy))
>                 return PTR_ERR(pcie->phy);
>
> -       ret = devm_of_pci_get_host_bridge_resources(dev, 0, 0xff, &resources,
> -                                                   &iobase);
> +       ret = pci_parse_request_of_pci_ranges(dev, &bridge->windows, NULL);
>         if (ret) {
>                 dev_err(dev, "unable to get PCI host bridge resources\n");
>                 return ret;
> @@ -113,10 +110,9 @@ static int iproc_pcie_pltfm_probe(struct platform_device *pdev)
>                 pcie->map_irq = of_irq_parse_and_map_pci;
>         }
>
> -       ret = iproc_pcie_setup(pcie, &resources);
> +       ret = iproc_pcie_setup(pcie, &bridge->windows);
>         if (ret) {
>                 dev_err(dev, "PCIe controller setup failed\n");
> -               pci_free_resource_list(&resources);
>                 return ret;
>         }
>
> diff --git a/drivers/pci/controller/pcie-iproc.c b/drivers/pci/controller/pcie-iproc.c
> index 2d457bfdaf66..223335ee791a 100644
> --- a/drivers/pci/controller/pcie-iproc.c
> +++ b/drivers/pci/controller/pcie-iproc.c
> @@ -1498,10 +1498,6 @@ int iproc_pcie_setup(struct iproc_pcie *pcie, struct list_head *res)
>                 return ret;
>         }
>
> -       ret = devm_request_pci_bus_resources(dev, res);
> -       if (ret)
> -               return ret;
> -
>         ret = phy_init(pcie->phy);
>         if (ret) {
>                 dev_err(dev, "unable to initialize PCIe PHY\n");
> @@ -1543,7 +1539,6 @@ int iproc_pcie_setup(struct iproc_pcie *pcie, struct list_head *res)
>                 if (iproc_pcie_msi_enable(pcie))
>                         dev_info(dev, "not using iProc MSI\n");
>
> -       list_splice_init(res, &host->windows);
>         host->busnr = 0;
>         host->dev.parent = dev;
>         host->ops = &iproc_pcie_ops;
> --
> 2.20.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
