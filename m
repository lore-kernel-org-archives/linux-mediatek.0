Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BC9C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 17:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ealJCAc+UYG44nY/OAeaHpYrw1jWjb9Elz5lCWq2kF0=; b=BYYZ/Qt56gi0+L
	9MbkRhC+1RgefiPqlZaCA070nkPt0p5hpB8UpJE8fDFap4BC7cv3Mazp1wmZGs1FgjAD8LxPjjr9S
	uRge0urdJ9C3F+E1sidY2M6jyeivENxtsBlVOw/8Jf2KhLbTzopXQPYcpewDUG/0wCwVsyKOwBYgR
	Rk5e70MDobw04t/39UI+Za7OhjqWiZyq3yonY28TSFQlSVyUjTruLXq8ia1XNR5hvEvrc70huJyaN
	RaYA1qHamBnGQA8k/3rSmr9rTSbHAPGCKkBP353W+HC/Zut0aHchbwTdChxpHDDuYvmLTomtHL/z3
	J/YXzHaC9fp28zZdIb0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFJp1-00GQyK-Mv; Wed, 02 Feb 2022 17:53:35 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFJoy-00GQwq-W3
 for linux-mediatek@lists.infradead.org; Wed, 02 Feb 2022 17:53:34 +0000
Received: by mail-ed1-x52b.google.com with SMTP id w14so222014edd.10
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Feb 2022 09:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4UCJ1jUJ4zsq4RQrX6k+nXy4mHY8saVQioi5/XKVhkU=;
 b=LLr8ELYvbwUDr+aWKlSrG7aUEVXyzH50uh6oKTFF7ifbs0kTp+dePMb7OIOs/lJCtT
 qaJ8Z+yD1zBb3jPMgX+hcXZn8jnlqb+ScSFNJo0JtmS9p6QniJMseacEDgSDBtBsKBOU
 ZWAbLXI5JASZmkTiW0hegjZXUDbom39pQhwENiJcJAYXfMFJnASas543LR60wciqH+9t
 KobLEDbuFSmwRUoucGbr3iNZgHslL2pv1YGuXfqU3aUmB8ZtAG/av0CWvJzxEdGyFJng
 nefKqmCJBXsKClb/eskETv9fJXR90QdKQcDMyV0Dau4hVNITUOA4BtMNF9NCaZlxSzai
 jh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4UCJ1jUJ4zsq4RQrX6k+nXy4mHY8saVQioi5/XKVhkU=;
 b=UacXKjeDNVwb4zlQWt3JDCgNUzFtwXMzvys+OZm0AVDMQUcyXjZma0h5df4UFIzgEB
 BbLPZVGGb+i2TPFtZZ96HHb/jrU4JgK+eSDQKqKFoEICzb+dtfU9vKIl7prGBjKDhupw
 F7I98mhl5YF6Uf5vd2K1//I27iMsQrEByzipuOXGF5z1QemTtbNFT7xYn/qDCgbaGft/
 XRNw5g1qcourt6sbUFFFqbUx8eFI0sQfFeGvy4CFqVDiOt6ekY800wMtAgtvhFM40I1b
 /yx0pjbXbRlxxPCE+W5sk7lg2XdBXKkJsYsJJCBXmkjWtnRVPY+NQbqpt4Kf+FYge3xo
 frSg==
X-Gm-Message-State: AOAM530cJ3Bl9trV1qP6Rkf2ajGQ/PLDDthZ56bvni/Y4SZkCwVBbj77
 5VFdZwe9X3wqHnYrbkde9YDwc3h5bFzR5W47o62qLQ==
X-Google-Smtp-Source: ABdhPJzPLQuBlKBdAk3DgJxcL7/Vai1iSQbErpTS/hjbkdjk5vyySChn7iBuszxnIeVrklMcRWdQdnaOS2CYaap+n8M=
X-Received: by 2002:a05:6402:1c95:: with SMTP id
 cy21mr31387969edb.170.1643824410275; 
 Wed, 02 Feb 2022 09:53:30 -0800 (PST)
MIME-Version: 1.0
References: <20220124120915.41292-1-angelogioacchino.delregno@collabora.com>
 <20220124120915.41292-3-angelogioacchino.delregno@collabora.com>
 <20220201183612.GC2490199@p14s>
 <91fff43a-c85d-2934-b54b-67ffe6fc2f29@collabora.com>
In-Reply-To: <91fff43a-c85d-2934-b54b-67ffe6fc2f29@collabora.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 2 Feb 2022 10:53:17 -0700
Message-ID: <CANLsYkyWqKw9-QGO6oRLsk7=Gp2gU1bpHUzJWxCpVmx7Smhkcg@mail.gmail.com>
Subject: Re: [PATCH 3/3] remoteproc: mtk_scp: Use dev_err_probe() where
 possible
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: bjorn.andersson@linaro.org, matthias.bgg@gmail.com, 
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_095333_072753_F6526426 
X-CRM114-Status: GOOD (  29.81  )
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

On Wed, 2 Feb 2022 at 02:03, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 01/02/22 19:36, Mathieu Poirier ha scritto:
> > Hi Angelo,
> >
> > On Mon, Jan 24, 2022 at 01:09:15PM +0100, AngeloGioacchino Del Regno wrote:
> >> Simplify the probe function, where possible, by using dev_err_probe().
> >> While at it, as to increase human readability, also remove some
> >> unnecessary forced void pointer casts that were previously used in
> >> error checking.
> >
> > I am in favour of all 3 patches (please add a cover letter next time) but weary
> > about testing - do you have access to a Mediatek platform to try this on or
> > is it purely theoretical?
> >
> > I would definitely feel better to see a "Tested-by" tag by someone out there
> > with access to the HW.
> >
> > Thanks,
> > Mathieu
> >
>
> Hello Mathieu,
>
> I have multiple MediaTek platforms and I always test on all of them before
> pushing such commits upstream, so, even though this kind of patch is trivial,
> this is *not* purely theoretical and I confirm that this was successfully tested.

 I have applied all 3 patches.

>
> Regards,
> Angelo
>
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >> ---
> >>   drivers/remoteproc/mtk_scp.c | 28 ++++++++++++----------------
> >>   1 file changed, 12 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> >> index e40706b0e015..dcddb33e9997 100644
> >> --- a/drivers/remoteproc/mtk_scp.c
> >> +++ b/drivers/remoteproc/mtk_scp.c
> >> @@ -757,10 +757,8 @@ static int scp_probe(struct platform_device *pdev)
> >>      int ret, i;
> >>
> >>      rproc = devm_rproc_alloc(dev, np->name, &scp_ops, fw_name, sizeof(*scp));
> >> -    if (!rproc) {
> >> -            dev_err(dev, "unable to allocate remoteproc\n");
> >> -            return -ENOMEM;
> >> -    }
> >> +    if (!rproc)
> >> +            return dev_err_probe(dev, -ENOMEM, "unable to allocate remoteproc\n");
> >>
> >>      scp = (struct mtk_scp *)rproc->priv;
> >>      scp->rproc = rproc;
> >> @@ -770,21 +768,20 @@ static int scp_probe(struct platform_device *pdev)
> >>
> >>      res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
> >>      scp->sram_base = devm_ioremap_resource(dev, res);
> >> -    if (IS_ERR((__force void *)scp->sram_base)) {
> >> -            dev_err(dev, "Failed to parse and map sram memory\n");
> >> -            return PTR_ERR((__force void *)scp->sram_base);
> >> -    }
> >> +    if (IS_ERR(scp->sram_base))
> >> +            return dev_err_probe(dev, PTR_ERR(scp->sram_base),
> >> +                                 "Failed to parse and map sram memory\n");
> >> +
> >>      scp->sram_size = resource_size(res);
> >>      scp->sram_phys = res->start;
> >>
> >>      /* l1tcm is an optional memory region */
> >>      res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
> >>      scp->l1tcm_base = devm_ioremap_resource(dev, res);
> >> -    if (IS_ERR((__force void *)scp->l1tcm_base)) {
> >> -            ret = PTR_ERR((__force void *)scp->l1tcm_base);
> >> +    if (IS_ERR(scp->l1tcm_base)) {
> >> +            ret = PTR_ERR(scp->l1tcm_base);
> >>              if (ret != -EINVAL) {
> >> -                    dev_err(dev, "Failed to map l1tcm memory\n");
> >> -                    return ret;
> >> +                    return dev_err_probe(dev, ret, "Failed to map l1tcm memory\n");
> >>              }
> >>      } else {
> >>              scp->l1tcm_size = resource_size(res);
> >> @@ -792,10 +789,9 @@ static int scp_probe(struct platform_device *pdev)
> >>      }
> >>
> >>      scp->reg_base = devm_platform_ioremap_resource_byname(pdev, "cfg");
> >> -    if (IS_ERR((__force void *)scp->reg_base)) {
> >> -            dev_err(dev, "Failed to parse and map cfg memory\n");
> >> -            return PTR_ERR((__force void *)scp->reg_base);
> >> -    }
> >> +    if (IS_ERR(scp->reg_base))
> >> +            return dev_err_probe(dev, PTR_ERR(scp->reg_base),
> >> +                                 "Failed to parse and map cfg memory\n");
> >>
> >>      ret = scp->data->scp_clk_get(scp);
> >>      if (ret)
> >> --
> >> 2.33.1
> >>
>
>
> --
> AngeloGioacchino Del Regno
> Software Engineer
>
> Collabora Ltd.
> Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
> Registered in England & Wales, no. 5513718

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
