Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC4AC0015E
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 05:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qfk54DMlNvTowlAzrrhl1ii93fn2Jh7ndQVWGDlwUgw=; b=zVvIefFd8D9B5bUZafS856MKvi
	C9R/UyMdKrirt2892Q8nDoCshXlMpmThl15o5cKbbkDuyo95PVYhs6Bt4xtePl37CVMvnSkQ8Gr8Y
	8r4IuWR6GzySnQ9qdWUe7qW5Y6CvZvrtSR2LnRYpaAOLGV+Cr4pNdaW206dEgZffNSRO/n3+sHcep
	gxsciuz3rnHmsdh5zQTeWbQoowSJmKD8vfUH/VTzLrQYIa8+LZhXCf9wzjw9jTDU585laHpcTqYBs
	COpdgMp9GIKtIYQX/fJ2yPQfwLfWq5d1BwvONs6jUS2i/j32Ymf4EjNvUwdxl2YA7CIftD/cSEMdD
	7jKKbDJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ5bR-00DiR6-2b;
	Tue, 11 Jul 2023 05:07:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ5bP-00DiQI-06;
	Tue, 11 Jul 2023 05:07:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4D03C61140;
	Tue, 11 Jul 2023 05:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CDABC433C7;
	Tue, 11 Jul 2023 05:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689052073;
	bh=wjkMoyAhJGd6T02GJdgC2lALppVBAQc+npo6LEKPwXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aoIrIlsiTv94suh1qMxzAazKBYXheLGtW+XdRvV07wGkjYJV67Asp7y6AHPR7Wqff
	 gPounYHIHTpsA16DkGo6pwtnX1v6JbMYO3Af9Wbm0qSwF5rX94chE6hkGEt2k76eCn
	 PWM5WYRcBZLOmmCgdZ2M6fO+qTDMc8jyDPlk1UnTekVkHcQI3zwmAMEUkL24X4KI8i
	 CJoI4hkYguxZBa7gcnXV2Z3GJ4F4A2nlOrp6v1tGDQhMH9wp3GDGTpFF0O9qHFQVjY
	 Hii5lDUt8sel6W/e7TqaVHgJfu51dBSRwZtzAopSkmoCVG1IlC7Ggh0wd6sWKK2822
	 Cz1Z4upEVXvRQ==
Date: Tue, 11 Jul 2023 10:37:49 +0530
From: Vinod Koul <vkoul@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yangtao Li <frank.li@vivo.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] phy: mediatek: tphy: Convert to
 devm_platform_ioremap_resource()
Message-ID: <ZKzjpebqy+J2b1hH@matsya>
References: <20230705090126.26854-1-frank.li@vivo.com>
 <20230705090126.26854-4-frank.li@vivo.com>
 <ddc05f70-7075-97ab-1c94-cb3d5839ef2b@collabora.com>
 <6a1bde36-fbf9-9ddd-e47f-f3c21a3528f7@vivo.com>
 <be88f6db-8b07-1767-f48c-24a215006a4f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be88f6db-8b07-1767-f48c-24a215006a4f@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_220755_169139_B0CEB3D4 
X-CRM114-Status: GOOD (  27.13  )
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

On 05-07-23, 12:00, AngeloGioacchino Del Regno wrote:
> Il 05/07/23 11:30, Yangtao Li ha scritto:
> > HI AngeloGioacchino,
> > 
> > On 2023/7/5 17:22, AngeloGioacchino Del Regno wrote:
> > > Il 05/07/23 11:01, Yangtao Li ha scritto:
> > > > Use devm_platform_ioremap_resource() to simplify code.
> > > > 
> > > > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> > > > ---
> > > >   drivers/phy/mediatek/phy-mtk-tphy.c | 10 +++-------
> > > >   1 file changed, 3 insertions(+), 7 deletions(-)
> > > > 
> > > > diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c
> > > > b/drivers/phy/mediatek/phy-mtk-tphy.c
> > > > index 0d110e50bbfd..cb7a4e6ea017 100644
> > > > --- a/drivers/phy/mediatek/phy-mtk-tphy.c
> > > > +++ b/drivers/phy/mediatek/phy-mtk-tphy.c
> > > > @@ -1554,7 +1554,6 @@ static int mtk_tphy_probe(struct platform_device *pdev)
> > > >       struct device_node *np = dev->of_node;
> > > >       struct device_node *child_np;
> > > >       struct phy_provider *provider;
> > > > -    struct resource *sif_res;
> > > >       struct mtk_tphy *tphy;
> > > >       struct resource res;
> > > >       int port, retval;
> > > > @@ -1576,15 +1575,12 @@ static int mtk_tphy_probe(struct platform_device *pdev)
> > > >       tphy->dev = dev;
> > > >       platform_set_drvdata(pdev, tphy);
> > > >   -    sif_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > >       /* SATA phy of V1 needn't it if not shared with PCIe or USB */
> > > > -    if (sif_res && tphy->pdata->version == MTK_PHY_V1) {
> > > > +    if (tphy->pdata->version == MTK_PHY_V1) {
> > > >           /* get banks shared by multiple phys */
> > > > -        tphy->sif_base = devm_ioremap_resource(dev, sif_res);
> > > > -        if (IS_ERR(tphy->sif_base)) {
> > > > -            dev_err(dev, "failed to remap sif regs\n");
> > > > +        tphy->sif_base = devm_platform_ioremap_resource(pdev, 0);
> > > > +        if (IS_ERR(tphy->sif_base) && PTR_ERR(tphy->sif_base) != -EINVAL)
> > > 
> > > That's wrong. You want to return any error unconditionally, as the V1 PHY *needs*
> > > the sif iospace and there's nothing afterwards retrying this.
> > 
> > 
> > When sif_res is not configured, an IOMEM_ERR_PTR(-EINVAL) error will be
> > returned in __devm_ioremap_resource.
> > 
> > This kind of error is ignored in the newly added code, and the driving
> > probe process will not be interrupted at this time.
> > 
> > What did I miss?
> > 
> 
> As I said, MTK_PHY_V1 *needs* sif; devm_platform_ioremap_resource() returns a
> handle to that iospace, or error.
> 
> tphy->sif_base = devm_platform_ioremap_resource(pdev, 0);
> if (IS_ERR(tphy->sif_base))
> 	return PTR_ERR(tphy->sif_base);

That does sound right to me

-- 
~Vinod

