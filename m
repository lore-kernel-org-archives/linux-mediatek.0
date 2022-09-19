Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77283ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 20:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W266CsOhutgk7baaRa4bGcyJXCHsN5O/vcMcc3H7co8=; b=MsqN6aHourB5vpWPIlJIGEs1O7
	B6Rv9yAqaa3/JCb5QJwNbjW6i/ej/3w2c2JA/XGJxfCaM2lW/+x23z+3lZD6CLV9Pjl3mzecS612V
	9ov8jC3PxaUoBxbypORhhJBvWZuabXQqVgyLavG4sbmB77SrQ1wdttu9mNrquyKCqUf9XbhaksUEc
	orH6jN3S0ZFE6CFWtmn06VWQ5PMIiSdDfVhwzIbusNXruG/mAzUuTbJ5xvEf8CJpwl7oAZ+fdqQe8
	tgDM2p37hmv0ZUP/sFaXwrQQMgdfKnaLb7m4uP/HlhkQ2XIuKZWVapCkErmr1K1332rMuYCB2iqgb
	Y7wNg5QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaNlw-00FPGO-0s; Mon, 19 Sep 2022 20:53:44 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaNls-00FPF4-A6
	for linux-mediatek@lists.infradead.org; Mon, 19 Sep 2022 20:53:42 +0000
Received: by mail-ej1-x629.google.com with SMTP id u9so1518457ejy.5
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Sep 2022 13:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=W266CsOhutgk7baaRa4bGcyJXCHsN5O/vcMcc3H7co8=;
        b=lQYC8C7PT2L5ccEPiyOtzVoS1tyE1s2zn/TMpgw+MKzgAqfwVu65a/AMk+xR56PgZ5
         KbqYOjiadwYezFpTWnKNK1ZVCHCwYs7eTsZosNzt5HaTeY55p6rxw0pU1c6QNl8sJQ8t
         BbP8ijZ5KN77+/AXkwKS8vRt0w51KbbjKp5fPELQm01mkPR2+OU8fW14k6/xkXASxPQL
         wPX85xEgLfbLly0/+azsaDQgF1WujIpsn9WRq/iL/y17Qa8uznTteai/E/VkWtPBE3Nr
         MHFkhLULhpmM6PUjiUB9tX4I32wv1mMjK8bjLmnD4QMJEmN5Or+S/dCcb5OCSBGMKXp5
         gxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=W266CsOhutgk7baaRa4bGcyJXCHsN5O/vcMcc3H7co8=;
        b=dGQsMdDdEWqSs8k3QpTQzfa6skuWc2gF3cnbOaQImwRr1TBIkCmGMjlwdHXMF1CpiO
         wdgB2nmlwNcRPN8AHMQGzbohFWma+FMQlSPk3IVs70IeSgB/uVeLBeMJVnGohJb4nHG8
         Uh+sotmdQyl0WSMcYjKFI1RoutL/dRcgjNX25nBNficq++U/o7vKEA99b1LpEanYtQpD
         cM3awqtMEWLky2IiP/gLg/czpywjGpoAjyAhqN3EHUtnT6XOhGNX/sMI6nzyvvJTUush
         V+kXw0tlNP62yAreIi4dxIoV9rPr763WZkO0Sl2/KRfQZDJRIyOfr4FKv1gOu8Qa61EF
         iwnA==
X-Gm-Message-State: ACrzQf0ADKB6CvU/jSKPOiZmVUIuhtBKlqBu650xh5ghKcqtPfJhMqtl
	P6gnZbm1V1uzIcxwJuw8UKNB/Pcpz/KKy8DQhTsawA==
X-Google-Smtp-Source: AMsMyM7ms866O2Gu/4j/k8xFQDTp00gtgV/cGGboFHXz2HCcymDH52lfNgYOCR8gdrAdIRRrHdV/2t2joYBdktcedbM=
X-Received: by 2002:a17:907:3fa5:b0:77d:41c0:e2f3 with SMTP id
 hr37-20020a1709073fa500b0077d41c0e2f3mr14229411ejc.741.1663620818717; Mon, 19
 Sep 2022 13:53:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220829194247.GC2264818@p14s> <20220908111757.14633-1-tinghan.shen@mediatek.com>
 <CANLsYkx6kXk8u_ajFbnhdWTkZBLtrq_z02jryLBSVH0x--_ZFw@mail.gmail.com>
 <a5ecd1dd567ca58807b289f2488d933f27e087dd.camel@mediatek.com>
 <CANLsYkxPdWErZErgGukvsMWcaGSRDpoKEkMeukvFi=BVTdpm8A@mail.gmail.com> <185edd1443dc85ea817027f15b7f90b1651c550f.camel@mediatek.com>
In-Reply-To: <185edd1443dc85ea817027f15b7f90b1651c550f.camel@mediatek.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 19 Sep 2022 14:53:27 -0600
Message-ID: <CANLsYkwrnvob=iBA561SKEc_60bR7TDq5+QOhjCGbCAi6W7StQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] remoteproc: mediatek: Support probing for the 2nd
 core of dual-core SCP
To: TingHan Shen <tinghan.shen@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, bleung@chromium.org, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	dnojiri@chromium.org, enric.balletbo@collabora.com, groeck@chromium.org, 
	gustavoars@kernel.org, keescook@chromium.org, krzk+dt@kernel.org, 
	lee.jones@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com, 
	pmalani@chromium.org, robh+dt@kernel.org, sebastian.reichel@collabora.com, 
	weishunc@google.com, Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_135340_376169_092BDB64 
X-CRM114-Status: GOOD (  56.17  )
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

On Mon, 19 Sept 2022 at 03:46, TingHan Shen <tinghan.shen@mediatek.com> wrote:
>
> On Fri, 2022-09-16 at 11:15 -0600, Mathieu Poirier wrote:
> > On Fri, 16 Sept 2022 at 06:00, TingHan Shen <tinghan.shen@mediatek.com> wrote:
> > >
> > > On Thu, 2022-09-08 at 14:58 -0600, Mathieu Poirier wrote:
> > > > On Thu, 8 Sept 2022 at 05:21, Tinghan Shen <tinghan.shen@mediatek.com>
> > > > wrote:
> > > >
> > > > > Hi Mathieu,
> > > > >
> > > > > > > The mtk_scp.c driver only supports the single core SCP and the
> > > > > > > 1st core of a dual-core SCP. This patch extends it for the 2nd core.
> > > > > > >
> > > > > > > MT8195 SCP is a dual-core MCU. Both cores are housed in the same
> > > > >
> > > > > subsys.
> > > > > >
> > > > > > s/subsys/subsystem
> > > > > >
> > > > > > > They have the same viewpoint of registers and memory.
> > > > > > >
> > > > > > > Core 1 of the SCP features its own set of core configuration registers,
> > > > > > > interrupt controller, timers, and DMAs. The rest of the peripherals
> > > > > > > in this subsystem are shared by core 0 and core 1.
> > > > > > >
> > > > > > > As for memory, core 1 has its own cache memory. the SCP SRAM is shared
> > > > > >
> > > > > > /the/The
> > > > > >
> > > > > > > by core 0 and core 1.
> > > > > > >
> > > > > > > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > > > > > > ---
> > > > > > >  drivers/remoteproc/mtk_scp.c | 22 ++++++++++++++++++++--
> > > > > > >  1 file changed, 20 insertions(+), 2 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/remoteproc/mtk_scp.c
> > > > >
> > > > > b/drivers/remoteproc/mtk_scp.c
> > > > > > > index 3510c6d0bbc8..91b4aefde4ac 100644
> > > > > > > --- a/drivers/remoteproc/mtk_scp.c
> > > > > > > +++ b/drivers/remoteproc/mtk_scp.c
> > > > > > > @@ -23,6 +23,10 @@
> > > > > > >  #define MAX_CODE_SIZE 0x500000
> > > > > > >  #define SECTION_NAME_IPI_BUFFER ".ipi_buffer"
> > > > > > >
> > > > > > > +#define SCP_CORE_0 0
> > > > > > > +#define SCP_CORE_1 1
> > > > > > > +#define SCP_CORE_SINGLE 0xF
> > > > > > > +
> > > > > > >  /**
> > > > > > >   * scp_get() - get a reference to SCP.
> > > > > > >   *
> > > > > > > @@ -836,6 +840,7 @@ static int scp_probe(struct platform_device *pdev)
> > > > > > >     struct resource *res;
> > > > > > >     const char *fw_name = "scp.img";
> > > > > > >     int ret, i;
> > > > > > > +   u32 core_id = SCP_CORE_SINGLE;
> > > > > > >
> > > > > > >     ret = rproc_of_parse_firmware(dev, 0, &fw_name);
> > > > > > >     if (ret < 0 && ret != -EINVAL)
> > > > > > > @@ -851,8 +856,16 @@ static int scp_probe(struct platform_device *pdev)
> > > > > > >     scp->data = of_device_get_match_data(dev);
> > > > > > >     platform_set_drvdata(pdev, scp);
> > > > > > >
> > > > > > > +   ret = of_property_read_u32_index(dev->of_node,
> > > > >
> > > > > "mediatek,scp-core", 1, &core_id);
> > > > > > > +   if (ret == 0)
> > > > > > > +           dev_info(dev, "Boot SCP dual core %u\n", core_id);
> > > > > >
> > > > > > Why is the DT property "mediatek,scp-core" needed at all?  Since the
> > > > >
> > > > > compatible
> > > > > > "mediatek,mt8195-scp-dual" has already been defined previously in this
> > > > >
> > > > > patchset,
> > > > > > initialising the second core, if present, is a matter of looking at the
> > > > > > compatile string.
> > > > >
> > > > > This idea of identify cores by the compatible looks workable.
> > > > > I'll update this series at next version.
> > > > > Thanks!
> > > > >
> > > > > >
> > > > > > > +
> > > > > > >     res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
> > > > > > > -   scp->sram_base = devm_ioremap_resource(dev, res);
> > > > > > > +   if (core_id == SCP_CORE_1)
> > > > > > > +           scp->sram_base = devm_ioremap(dev, res->start,
> > > > >
> > > > > resource_size(res));
> > > > > > > +   else
> > > > > > > +           scp->sram_base = devm_ioremap_resource(dev, res);
> > > > > > > +
> > > > > >
> > > > > > This looks very broken...  For this to work you would need to have two DT
> > > > > > entries with the "mediatek,mt8195-scp-dual" compatible properly, one with
> > > > > > "mediatek,scp-core = <&scp_dual1 0>;" and another one with
> > > > >
> > > > > "mediatek,scp-core = <&scp_dual0 1>;".
> > > > > >
> > > > > > Which is also very broken...  Here you have a binding whose first
> > > > >
> > > > > argument is a
> > > > > > reference to the core sibling while the second argument is a
> > > > >
> > > > > characteristic of
> > > > > > the current core, which is highly confusing.
> > > > > >
> > > > > > I suggest what when you see the compatible binding
> > > > >
> > > > > "mediatek,mt8195-scp", a
> > > > > > single core is initialized.  If you see "mediatek,mt8195-scp-dual", both
> > > > >
> > > > > cores
> > > > > > are initialized as part of the _same_ probe.
> > > > > >
> > > > > > If the above analysis is not correct it means I misinterpreted your
> > > > > > work and if so, a serious amount of comments is needed _and_ a very
> > > > >
> > > > > detailed
> > > > > > example in "mtk,scp.yaml" that leaves no room for interpretation.
> > > > > >
> > > > > > I will stop reviewing this patchset until you have clarified how this
> > > > >
> > > > > works.
> > > > > >
> > > > > > Thanks,
> > > > > > Mathieu
> > > > >
> > > > > There's one problem of initializng the CORE1 using the same probe flow.
> > > > > The register space of CORE0 and CORE1 are overlapped in the device node.
> > > > > Both cores need to use the 'cfg' registers defined in scp yaml.
> > > > > The devm_ioremap_resource catches address overlapping and returns error
> > > > > when
> > > > > probing CORE1 driver.
> > > > >
> > > >
> > > > That is exactly why I suggest to initialise both cores within the same
> > > > probe() function.
> > > >
> > >
> > > Hi Mathieu,
> > >
> > > I'm thinking about how to initialise in the same probe() function.
> > > I'm wondering if this implies that using one scp driver to initialize 2 cores?
> > > If it is, I assume the dts descriptions for both cores should be contained in one node.
> > >
> > > When there's one node for both cores, it looks like that there is a problem of
> > > using dma_allocate_coherent(). Each core has its own reserved memory region.
> > > When there's only one device for both cores, it's not able to identify the memory region
> > > by the device parameter of dma_allocate_coherent().
> > >
> > > Is it acceptable to consider manually allocating core 1 device in the probe() when probing core 0?
> >
> > Look at what Suman did for TI's K3 R5[1] and DSP[2] platforms.
> > Reviewing the bindings for both platforms will also give you a good
> > idea of how things work.
> >
> > [1]. https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v6.0-rc5/source/drivers/remoteproc/ti_k3_r5_remoteproc.c*L1683__;Iw!!CTRNKA9wMg0ARbw!zVcjdLSfKYGO5YQMNGqq339mle8u0VdULX30z0XV4vo3vCb9Wy-w5ixOTmzbv1akubM$
> > [2]. https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v6.0-rc5/source/drivers/remoteproc/ti_k3_dsp_remoteproc.c*L673__;Iw!!CTRNKA9wMg0ARbw!zVcjdLSfKYGO5YQMNGqq339mle8u0VdULX30z0XV4vo3vCb9Wy-w5ixOTmzbfE2dtBg$
> >
>
> Hi Mathieu,
>
> My plan is changing the dts as following,
>
> scp core 0 {
>         // Keep current properties untouched.
>         compatible = "mediatek,mt8195-scp";
>
>         // core 0 properties...
>
>         // Add a new property for multi-core scp.
>         // if not present, it's single core.
>         // if present and core id = 0, it's the main core, otherwise the sub cores.
>         mediatek,scp-core = <0>;
>
>         // add sub cores as sub node.
>         // sub nodes can find parent by OF API.
>         scp core 1 {
>                 // use the same compatile name as core 0.
>                 compatible = "mediatek,mt8195-scp";
>
>                 // assign id > 0 to sub cores.
>                 mediatek,scp-core = <1>;
>
>                 // core 1 properties...
>         };
> };
>
>
> The driver probe/remove behavior will be modified as below,
>
> scp probe() {
>         // common init...
>
>         // check core id to have different memory mapping flow
>         if (core id == 0)
>                 // mapping cfg, sram and others
>         else
>                 // mapping sram
>                 // reuse the cfg paddr/vaddr from core 0
>
>         // common init...
>
>         if (core id == 0) {
>                 ret = of_platform_populate(...)
>
>                 // boot core 0 and sub cores
>                 rproc_add();
>         } else {
>                 // add sub core as sub device to main core
>                 rproc_add_subdev()
>
>                 rproc->auto_boot = false;
>                 rpoc_add();
>         }
> }
>
> scp_remove() {
>
>         if (core id == 0)
>                 of_platform_depopulate()
>         else
>                 rproc_remove_subdev()
>
>         // remove core
> }
>

Unfortunately I do not have the bandwidth to look at inlined or pseudo
code.  I will review this code with the next revision.

>
>
> Best regards,
> TingHan
>
>
>
>

