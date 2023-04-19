Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39591C77B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Apr 2023 15:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9xYRx4lxSwrTz8KomOP3X7PYWUvothv5g/ZoMajkQIs=; b=pwXucDshV0Vbz/6B/ERc97rOUj
	0Yj+VHpmFXzEsytnOM11tcmUbvmFndOTp4dVbuVhbAQ9jPZoD5XVKZ6QHfMBCTr9owb8VcMlxHJNQ
	wye2UvrQq9jZi7PmsAq+Bljxab5OO+0jJagoAeRFV8otIssw4YUSlXHx8tkk4eDBjYAd4/UUMwW8V
	D/aoEgHz2kGPgDY4TtSTDXelPtiS4t305jlzpOV3RT7d5PXd3Uh3dh2LibwUpTV2oFGlu2X6OdKKB
	d6snUT44dWkLoU29ZsTTOg0pQfNn8MVWZLtFUfY+yp2GPtwuhaEeUw2lhidzRR2Q0lS0gqKRRRSWt
	9r2KjRWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp9RU-005kSB-0H;
	Wed, 19 Apr 2023 15:09:56 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp9RQ-005kQu-1z
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Apr 2023 15:09:54 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-52160f75920so229584a12.2
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Apr 2023 08:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681916990; x=1684508990;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9xYRx4lxSwrTz8KomOP3X7PYWUvothv5g/ZoMajkQIs=;
        b=sXPBCslnv6R9uVZX7Gq3xtSsKpgzb0/01i98xXOZQx+KbP4KqVddhPYdcEVIH92o4/
         pmZSEaoq7K27ohwgJ+wenSjn0dMQerb+uCo2ZucB/ttrkOH+5nH3PbagzZ3PTu4MLinA
         TuKX/J6WZKuecdQ+SbtWPDBxIT9YSQFdk9EpXU82KxmWB7eepY+FOWYRQZw89n6lAOaK
         XrVRagqX0pIaFphG3FrY/Kf+S15ViKgyd1zdDEgbm2ZGDCRg5ygwZkCfIxnA/TylLYqo
         kupYb4zacsCkJMBL3td7FdPMMyd0LNOaVeCVWWXhum1Qx2Kzg3cACS2tSOJI8K/kMrPz
         X4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681916990; x=1684508990;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9xYRx4lxSwrTz8KomOP3X7PYWUvothv5g/ZoMajkQIs=;
        b=FTvkajl1UrlPCu1irXJJtTufoorFMqrEnTZfXzvWk1lsnDXhfrLSaGx02O2fSEFpEY
         mdFVJ6QiWkSAGVI4b0KQ+YFOG/c9hHsC2lIzcDkASd/BiIs3qepu5fHllTib0UhjzaIa
         a0tCh578DLYgN55g+dfnpo/2u+cS1CpkKTH3u7FhD0rlhjCIoQayJB1NTgybfrEFtmIs
         CZuofYNlebTZlmg9gCE8QX5ZM+C9coQdtylm97oT244ZMJKXhkQ/mHhOK7rLi9V7ZRWK
         OSF4h91MOx1Dr+mCsvBszxtIzAF4/fOSe1CUQ6xbcUc/WZfDLwIkPY2Bf3cibcGh5nr1
         OwJw==
X-Gm-Message-State: AAQBX9fMIbY+FTaF3tJIX1WuweMDk9NoCDf0Cf86koh4KZ4ED4bEjLAz
	NOLTseY7PGFVrLrFE75gcc6Few==
X-Google-Smtp-Source: AKy350ZOsj/rgDa7m85kCFSt/yyAxPXdtikhF0MU23Wn0WjNTH8dh6EXRwbGslBJniiqLHyCe3xjGQ==
X-Received: by 2002:a17:90a:72c8:b0:246:9bad:2354 with SMTP id l8-20020a17090a72c800b002469bad2354mr3110204pjk.43.1681916990193;
        Wed, 19 Apr 2023 08:09:50 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:302c:551a:91d2:840f])
        by smtp.gmail.com with ESMTPSA id ip11-20020a17090b314b00b00246626343aesm1541885pjb.25.2023.04.19.08.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 08:09:49 -0700 (PDT)
Date: Wed, 19 Apr 2023 09:09:47 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: TingHan Shen =?utf-8?B?KOayiOW7t+e/sCk=?= <TingHan.Shen@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"andersson@kernel.org" <andersson@kernel.org>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v9 05/11] remoteproc: mediatek: Extract remoteproc
 initialization flow
Message-ID: <ZEAEO3ZOptIoIskz@p14s>
References: <20230328022733.29910-1-tinghan.shen@mediatek.com>
 <20230328022733.29910-6-tinghan.shen@mediatek.com>
 <20230331174431.GA3504605@p14s>
 <46baff1f95fa13976d7a07b5e50ff2175e464baa.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46baff1f95fa13976d7a07b5e50ff2175e464baa.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_080953_114883_28B45C19 
X-CRM114-Status: GOOD (  34.01  )
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

On Wed, Apr 19, 2023 at 03:38:14AM +0000, TingHan Shen (沈廷翰) wrote:
> Hi Mathieu,
> 
> On Fri, 2023-03-31 at 11:44 -0600, Mathieu Poirier wrote:
> > External email : Please do not click links or open attachments until you have verified the sender or the content.
> > 
> > 
> > On Tue, Mar 28, 2023 at 10:27:27AM +0800, Tinghan Shen wrote:
> > > This is the preparation for probing multi-core SCP. The remoteproc
> > > initialization flow is similar on cores and is reused to avoid
> > > redundant code.
> > > 
> > > The registers of config and l1tcm are shared for multi-core
> > > SCP. Reuse the mapped addresses for all cores.
> > > 
> > > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > ---
> > >  drivers/remoteproc/mtk_scp.c | 64 +++++++++++++++++++++++++-----------
> > >  1 file changed, 45 insertions(+), 19 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> > > index a3b9bc158cd9..32ecd1450c6f 100644
> > > --- a/drivers/remoteproc/mtk_scp.c
> > > +++ b/drivers/remoteproc/mtk_scp.c
> > > @@ -23,6 +23,13 @@
> > >  #define MAX_CODE_SIZE 0x500000
> > >  #define SECTION_NAME_IPI_BUFFER ".ipi_buffer"
> > > 
> > > +struct mtk_scp_of_regs {
> > > +     void __iomem *reg_base;
> > > +     void __iomem *l1tcm_base;
> > > +     size_t l1tcm_size;
> > > +     phys_addr_t l1tcm_phys;
> > > +};
> > > +
> > 
> > This should represent the cluster with a list of mtk_scp instead of @cluster_cores as
> > introduced in the next patch.
> 
> If I'm understanding you correctly, you're suggesting that @cluster_cores should be included 
> as a member of this structure. Is that correct?

Correct.  Than this structure is allocated in probe() and added as driver data
for the platform device.  Its name should also be something like
mtk_scp_cluster or something like that.  I suggest you look at what has been
done in ti_k3_r5_remoteproc.c, your end design should be quite similar to that.
In fact you are close but a few things need to be addressed.

> 
> Best regards,
> TingHan
> 
> > 
> > >  /**
> > >   * scp_get() - get a reference to SCP.
> > >   *
> > > @@ -855,7 +862,8 @@ static void scp_remove_rpmsg_subdev(struct mtk_scp *scp)
> > >       }
> > >  }
> > > 
> > > -static int scp_probe(struct platform_device *pdev)
> > > +static int scp_rproc_init(struct platform_device *pdev,
> > > +                       struct mtk_scp_of_regs *of_regs)
> > >  {
> > >       struct device *dev = &pdev->dev;
> > >       struct device_node *np = dev->of_node;
> > > @@ -879,6 +887,11 @@ static int scp_probe(struct platform_device *pdev)
> > >       scp->data = of_device_get_match_data(dev);
> > >       platform_set_drvdata(pdev, scp);
> > > 
> > > +     scp->reg_base = of_regs->reg_base;
> > > +     scp->l1tcm_base = of_regs->l1tcm_base;
> > > +     scp->l1tcm_size = of_regs->l1tcm_size;
> > > +     scp->l1tcm_phys = of_regs->l1tcm_phys;
> > > +
> > >       res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
> > >       scp->sram_base = devm_ioremap_resource(dev, res);
> > >       if (IS_ERR(scp->sram_base))
> > > @@ -888,24 +901,6 @@ static int scp_probe(struct platform_device *pdev)
> > >       scp->sram_size = resource_size(res);
> > >       scp->sram_phys = res->start;
> > > 
> > > -     /* l1tcm is an optional memory region */
> > > -     res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
> > > -     scp->l1tcm_base = devm_ioremap_resource(dev, res);
> > > -     if (IS_ERR(scp->l1tcm_base)) {
> > > -             ret = PTR_ERR(scp->l1tcm_base);
> > > -             if (ret != -EINVAL) {
> > > -                     return dev_err_probe(dev, ret, "Failed to map l1tcm memory\n");
> > > -             }
> > > -     } else {
> > 
> >                 scp->l1tcm_base = NULL;
> > 
> > > -             scp->l1tcm_size = resource_size(res);
> > > -             scp->l1tcm_phys = res->start;
> > > -     }
> > > -
> > > -     scp->reg_base = devm_platform_ioremap_resource_byname(pdev, "cfg");
> > > -     if (IS_ERR(scp->reg_base))
> > > -             return dev_err_probe(dev, PTR_ERR(scp->reg_base),
> > > -                                  "Failed to parse and map cfg memory\n");
> > > -
> > >       ret = scp->data->scp_clk_get(scp);
> > >       if (ret)
> > >               return ret;
> > > @@ -957,6 +952,37 @@ static int scp_probe(struct platform_device *pdev)
> > >       return ret;
> > >  }
> > > 
> > > +static int scp_probe(struct platform_device *pdev)
> > > +{
> > > +     struct device *dev = &pdev->dev;
> > > +     struct mtk_scp_of_regs scp_regs;
> > > +     struct resource *res;
> > > +     int ret;
> > > +
> > > +     res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cfg");
> > > +     scp_regs.reg_base = devm_ioremap_resource(dev, res);
> > > +     if (IS_ERR(scp_regs.reg_base))
> > > +             return dev_err_probe(dev, PTR_ERR(scp_regs.reg_base),
> > > +                                  "Failed to parse and map cfg memory\n");
> > > +
> > > +     /* l1tcm is an optional memory region */
> > > +     res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
> > > +     scp_regs.l1tcm_base = devm_ioremap_resource(dev, res);
> > > +     if (IS_ERR(scp_regs.l1tcm_base)) {
> > > +             ret = PTR_ERR(scp_regs.l1tcm_base);
> > > +             if (ret != -EINVAL)
> > > +                     return dev_err_probe(dev, ret, "Failed to map l1tcm memory\n");
> > > +
> > > +             scp_regs.l1tcm_size = 0;
> > > +             scp_regs.l1tcm_phys = 0;
> > > +     } else {
> > > +             scp_regs.l1tcm_size = resource_size(res);
> > > +             scp_regs.l1tcm_phys = res->start;
> > > +     }
> > > +
> > > +     return scp_rproc_init(pdev, &scp_regs);
> > > +}
> > > +
> > >  static int scp_remove(struct platform_device *pdev)
> > >  {
> > >       struct mtk_scp *scp = platform_get_drvdata(pdev);
> > > --
> > > 2.18.0
> > > 
> 
> -- 
> Best regards,
> TingHan

