Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478DDECAAD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Sep 2022 12:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYyYRhoJq7fWtmZNRUDZ326SnABMO3rCDovRyIC+c2k=; b=KbvzwZAwv/hrXgJrfhNh9l/zx1
	U/YckHjYegrSvBWR2HTFo6uDlBl57OXqwzQ62nRWTGeMqdT8s1Vaq6izVFd59ba5uyJz7A58MDGF1
	aZ+S3K8plOvfvVpzhFni1twhS/lmZ9nzp6pnvlZn9y/G+EFMoy3a/WElfzSO7vreBd24hhnE3Qfk6
	mNqyFKIyQUHdxpMJNsjA0qr8IqjFEoi3ag7Dsm5EGzuLLyaADfkuL2ALVkxV4elU+Ev1T2bWyJoEe
	CWOIEZgnV1V7+1BgBOdVRPXi4xH7nAsSRWfdVuamFxv8k8l+OUqeJ7aEutN6gNmQwNqIH2itFewCR
	XFjgW8dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZA1A-00CxhB-1h; Fri, 16 Sep 2022 12:00:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZA0q-00CxTL-Cs; Fri, 16 Sep 2022 12:00:06 +0000
X-UUID: 8c3a3c72a3a640b78e7d717307c62390-20220916
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=TYyYRhoJq7fWtmZNRUDZ326SnABMO3rCDovRyIC+c2k=;
	b=kncM31WKnOLsgTEKsKE/RJkyDjYVEa2dPq9mKhAREVtlkwJYUSfwiR8ftWlIFGLUYMbALORkQEhe7LN3fj3cHlmc76KGL8/PlMpII6kHck8iqjzBGs7wZ+tz9Le0FFeOuIWwz2Hp56Ah186dUazIBSRGKIsw7ledlw75W6H60/M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:bf01c9ad-5cdf-410b-af43-72f65054b17f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:56c76782-e1c0-45d0-a056-c64d28f12f02,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 8c3a3c72a3a640b78e7d717307c62390-20220916
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1100365095; Fri, 16 Sep 2022 04:59:53 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 16 Sep 2022 19:59:50 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 16 Sep 2022 19:59:50 +0800
Message-ID: <a5ecd1dd567ca58807b289f2488d933f27e087dd.camel@mediatek.com>
Subject: Re: [PATCH v2 4/9] remoteproc: mediatek: Support probing for the
 2nd core of dual-core SCP
From: TingHan Shen <tinghan.shen@mediatek.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<bjorn.andersson@linaro.org>, <bleung@chromium.org>,
	<chrome-platform@lists.linux.dev>, <devicetree@vger.kernel.org>,
	<dnojiri@chromium.org>, <enric.balletbo@collabora.com>,
	<groeck@chromium.org>, <gustavoars@kernel.org>, <keescook@chromium.org>,
	<krzk+dt@kernel.org>, <lee.jones@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-remoteproc@vger.kernel.org>,
	<matthias.bgg@gmail.com>, <pmalani@chromium.org>, <robh+dt@kernel.org>,
	<sebastian.reichel@collabora.com>, <weishunc@google.com>
Date: Fri, 16 Sep 2022 19:59:50 +0800
In-Reply-To: <CANLsYkx6kXk8u_ajFbnhdWTkZBLtrq_z02jryLBSVH0x--_ZFw@mail.gmail.com>
References: <20220829194247.GC2264818@p14s>
	 <20220908111757.14633-1-tinghan.shen@mediatek.com>
	 <CANLsYkx6kXk8u_ajFbnhdWTkZBLtrq_z02jryLBSVH0x--_ZFw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_050004_497783_0018F1A2 
X-CRM114-Status: GOOD (  48.56  )
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

On Thu, 2022-09-08 at 14:58 -0600, Mathieu Poirier wrote:
> On Thu, 8 Sept 2022 at 05:21, Tinghan Shen <tinghan.shen@mediatek.com>
> wrote:
> 
> > Hi Mathieu,
> > 
> > > > The mtk_scp.c driver only supports the single core SCP and the
> > > > 1st core of a dual-core SCP. This patch extends it for the 2nd core.
> > > > 
> > > > MT8195 SCP is a dual-core MCU. Both cores are housed in the same
> > 
> > subsys.
> > > 
> > > s/subsys/subsystem
> > > 
> > > > They have the same viewpoint of registers and memory.
> > > > 
> > > > Core 1 of the SCP features its own set of core configuration registers,
> > > > interrupt controller, timers, and DMAs. The rest of the peripherals
> > > > in this subsystem are shared by core 0 and core 1.
> > > > 
> > > > As for memory, core 1 has its own cache memory. the SCP SRAM is shared
> > > 
> > > /the/The
> > > 
> > > > by core 0 and core 1.
> > > > 
> > > > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > > > ---
> > > >  drivers/remoteproc/mtk_scp.c | 22 ++++++++++++++++++++--
> > > >  1 file changed, 20 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/remoteproc/mtk_scp.c
> > 
> > b/drivers/remoteproc/mtk_scp.c
> > > > index 3510c6d0bbc8..91b4aefde4ac 100644
> > > > --- a/drivers/remoteproc/mtk_scp.c
> > > > +++ b/drivers/remoteproc/mtk_scp.c
> > > > @@ -23,6 +23,10 @@
> > > >  #define MAX_CODE_SIZE 0x500000
> > > >  #define SECTION_NAME_IPI_BUFFER ".ipi_buffer"
> > > > 
> > > > +#define SCP_CORE_0 0
> > > > +#define SCP_CORE_1 1
> > > > +#define SCP_CORE_SINGLE 0xF
> > > > +
> > > >  /**
> > > >   * scp_get() - get a reference to SCP.
> > > >   *
> > > > @@ -836,6 +840,7 @@ static int scp_probe(struct platform_device *pdev)
> > > >     struct resource *res;
> > > >     const char *fw_name = "scp.img";
> > > >     int ret, i;
> > > > +   u32 core_id = SCP_CORE_SINGLE;
> > > > 
> > > >     ret = rproc_of_parse_firmware(dev, 0, &fw_name);
> > > >     if (ret < 0 && ret != -EINVAL)
> > > > @@ -851,8 +856,16 @@ static int scp_probe(struct platform_device *pdev)
> > > >     scp->data = of_device_get_match_data(dev);
> > > >     platform_set_drvdata(pdev, scp);
> > > > 
> > > > +   ret = of_property_read_u32_index(dev->of_node,
> > 
> > "mediatek,scp-core", 1, &core_id);
> > > > +   if (ret == 0)
> > > > +           dev_info(dev, "Boot SCP dual core %u\n", core_id);
> > > 
> > > Why is the DT property "mediatek,scp-core" needed at all?  Since the
> > 
> > compatible
> > > "mediatek,mt8195-scp-dual" has already been defined previously in this
> > 
> > patchset,
> > > initialising the second core, if present, is a matter of looking at the
> > > compatile string.
> > 
> > This idea of identify cores by the compatible looks workable.
> > I'll update this series at next version.
> > Thanks!
> > 
> > > 
> > > > +
> > > >     res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
> > > > -   scp->sram_base = devm_ioremap_resource(dev, res);
> > > > +   if (core_id == SCP_CORE_1)
> > > > +           scp->sram_base = devm_ioremap(dev, res->start,
> > 
> > resource_size(res));
> > > > +   else
> > > > +           scp->sram_base = devm_ioremap_resource(dev, res);
> > > > +
> > > 
> > > This looks very broken...  For this to work you would need to have two DT
> > > entries with the "mediatek,mt8195-scp-dual" compatible properly, one with
> > > "mediatek,scp-core = <&scp_dual1 0>;" and another one with
> > 
> > "mediatek,scp-core = <&scp_dual0 1>;".
> > > 
> > > Which is also very broken...  Here you have a binding whose first
> > 
> > argument is a
> > > reference to the core sibling while the second argument is a
> > 
> > characteristic of
> > > the current core, which is highly confusing.
> > > 
> > > I suggest what when you see the compatible binding
> > 
> > "mediatek,mt8195-scp", a
> > > single core is initialized.  If you see "mediatek,mt8195-scp-dual", both
> > 
> > cores
> > > are initialized as part of the _same_ probe.
> > > 
> > > If the above analysis is not correct it means I misinterpreted your
> > > work and if so, a serious amount of comments is needed _and_ a very
> > 
> > detailed
> > > example in "mtk,scp.yaml" that leaves no room for interpretation.
> > > 
> > > I will stop reviewing this patchset until you have clarified how this
> > 
> > works.
> > > 
> > > Thanks,
> > > Mathieu
> > 
> > There's one problem of initializng the CORE1 using the same probe flow.
> > The register space of CORE0 and CORE1 are overlapped in the device node.
> > Both cores need to use the 'cfg' registers defined in scp yaml.
> > The devm_ioremap_resource catches address overlapping and returns error
> > when
> > probing CORE1 driver.
> > 
> 
> That is exactly why I suggest to initialise both cores within the same
> probe() function.
> 

Hi Mathieu,

I'm thinking about how to initialise in the same probe() function.
I'm wondering if this implies that using one scp driver to initialize 2 cores?
If it is, I assume the dts descriptions for both cores should be contained in one node.

When there's one node for both cores, it looks like that there is a problem of 
using dma_allocate_coherent(). Each core has its own reserved memory region. 
When there's only one device for both cores, it's not able to identify the memory region 
by the device parameter of dma_allocate_coherent().

Is it acceptable to consider manually allocating core 1 device in the probe() when probing core 0?


Best regards,
TingHan









