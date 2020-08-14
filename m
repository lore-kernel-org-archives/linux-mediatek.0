Return-Path: <SRS0=jsh4=BY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15572C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 01:19:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB2E3206DA
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 01:19:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WJVUidjo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Izgi86lJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB2E3206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=af/WsI0Vl5WbIi08d5va7FudIOplXas1QNTNI/HPMag=; b=WJVUidjoVUEZkbrsQSF27w056
	/Yo4UHqrpHGy+PKK26To49kcBisvzySZmHOHdnCDIb/cDAVQ2/nTi5i3eB4A6ImjDLZBIt032y4Sf
	DfLwzHmV+j/kKewL0Rsr32YwSsdPpSi4lt/F5sFA6+C7lFutSWhmCHKwpVXMrkmxLRvURKgrz43jB
	KfpT/wZBu+BBoX6jsvD1UpLw7aSXoVArDRet3wbUCV+5cIV98CbKHdhNQ4NON7ZLQ0oCEYkdxs+1D
	Sni4UWxvyVFqVNbcAlVjrn++zDOtclHIdTlqWGZAisMbrwGHEzZVOsr8sLBZkKancbGIzrFQUdmrc
	D55u+WaEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6ONU-0003Lp-N2; Fri, 14 Aug 2020 01:19:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6ONQ-0003L0-2g; Fri, 14 Aug 2020 01:19:25 +0000
X-UUID: bae1e60b22e94bd082c1e71370d94327-20200813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=8ID4EfASv2yCTJeN/ScYKkSMihUHk0DUrytaknzcfkI=; 
 b=Izgi86lJ+ZO81e66RjyyEbEUV9rRPXcF8F969hhTL/FN683MDgWxX5Z29gk0MgkrYkXqq+OCGtGkQMuK/rjtw+VxOTWaDL0w9y0vDw1XM9BxqC/48nGU4z6wqQXUPrx6UYR4CznjNRWl2CQQsFrSNjdAR2BLcPtKSW3oi7bdxVk=;
X-UUID: bae1e60b22e94bd082c1e71370d94327-20200813
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1869407281; Thu, 13 Aug 2020 17:19:17 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Aug 2020 18:09:16 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 14 Aug 2020 09:09:09 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Aug 2020 09:09:11 +0800
Message-ID: <1597367294.5891.8.camel@mhfsdcap03>
Subject: Re: [RESEND,v4,3/3] mmc: mediatek: add optional module reset property
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Fri, 14 Aug 2020 09:08:14 +0800
In-Reply-To: <7337a174-169d-2dd1-ed91-f05291d4f3a6@gmail.com>
References: <20200813093811.28606-1-wenbin.mei@mediatek.com>
 <20200813093811.28606-4-wenbin.mei@mediatek.com>
 <7337a174-169d-2dd1-ed91-f05291d4f3a6@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 137A8128AEAC25F6B12D0DC97D4527C08E2816AFB625FBD12667D6AAEB2A51AD2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_211924_336869_73AB42F8 
X-CRM114-Status: GOOD (  24.14  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 srv_heupstream@mediatek.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Chaotian Jing <chaotian.jing@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Yes, I will add Philipp Zabels Reviewed-by tag in the next version.
On Thu, 2020-08-13 at 15:57 +0200, Matthias Brugger wrote:
> 
> On 13/08/2020 11:38, Wenbin Mei wrote:
> > This patch fixs eMMC-Access on mt7622/Bpi-64.
> > Before we got these Errors on mounting eMMC ion R64:
> > [   48.664925] blk_update_request: I/O error, dev mmcblk0, sector 204800 op 0x1:(WRITE)
> > flags 0x800 phys_seg 1 prio class 0
> > [   48.676019] Buffer I/O error on dev mmcblk0p1, logical block 0, lost sync page write
> > 
> > This patch adds a optional reset management for msdc.
> > Sometimes the bootloader does not bring msdc register
> > to default state, so need reset the msdc controller.
> > 
> > Cc: <stable@vger.kernel.org> # v5.4+
> > Fixes: 966580ad236e ("mmc: mediatek: add support for MT7622 SoC")
> > Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> > Tested-by: Frank Wunderlich <frank-w@public-files.de>
> 
> I think you missed to add Philipp Zabels Reviewed-by tag.
> 
> Regards,
> Matthias
> 
> 
> > ---
> >   drivers/mmc/host/mtk-sd.c | 13 +++++++++++++
> >   1 file changed, 13 insertions(+)
> > 
> > diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> > index 39e7fc54c438..fc97d5bf3a20 100644
> > --- a/drivers/mmc/host/mtk-sd.c
> > +++ b/drivers/mmc/host/mtk-sd.c
> > @@ -22,6 +22,7 @@
> >   #include <linux/slab.h>
> >   #include <linux/spinlock.h>
> >   #include <linux/interrupt.h>
> > +#include <linux/reset.h>
> >   
> >   #include <linux/mmc/card.h>
> >   #include <linux/mmc/core.h>
> > @@ -434,6 +435,7 @@ struct msdc_host {
> >   	struct msdc_save_para save_para; /* used when gate HCLK */
> >   	struct msdc_tune_para def_tune_para; /* default tune setting */
> >   	struct msdc_tune_para saved_tune_para; /* tune result of CMD21/CMD19 */
> > +	struct reset_control *reset;
> >   };
> >   
> >   static const struct mtk_mmc_compatible mt8135_compat = {
> > @@ -1516,6 +1518,12 @@ static void msdc_init_hw(struct msdc_host *host)
> >   	u32 val;
> >   	u32 tune_reg = host->dev_comp->pad_tune_reg;
> >   
> > +	if (host->reset) {
> > +		reset_control_assert(host->reset);
> > +		usleep_range(10, 50);
> > +		reset_control_deassert(host->reset);
> > +	}
> > +
> >   	/* Configure to MMC/SD mode, clock free running */
> >   	sdr_set_bits(host->base + MSDC_CFG, MSDC_CFG_MODE | MSDC_CFG_CKPDN);
> >   
> > @@ -2273,6 +2281,11 @@ static int msdc_drv_probe(struct platform_device *pdev)
> >   	if (IS_ERR(host->src_clk_cg))
> >   		host->src_clk_cg = NULL;
> >   
> > +	host->reset = devm_reset_control_get_optional_exclusive(&pdev->dev,
> > +								"hrst");
> > +	if (IS_ERR(host->reset))
> > +		return PTR_ERR(host->reset);
> > +
> >   	host->irq = platform_get_irq(pdev, 0);
> >   	if (host->irq < 0) {
> >   		ret = -EINVAL;
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
