Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A597C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 03:25:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC2CF2076C
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 03:25:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z8BGOjYm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iHV97fO7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC2CF2076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x1wy9rJp4NdRWYAHctKQzcnJGEIGJSPb/7I5x2HtaMk=; b=Z8BGOjYmcakUUTqkVGF/TsmtK
	TaDJ3B3lcnHLFW2qd8rb1mmabFdX+btgbMgFcZ+6KHrigjToUd1JpZVdKulQIElr2G2LGP1Ooivx0
	3CnmYDlDXelH1sD7GvGgFcG1jCT7TWTMskoRB1K0ET9rfTE/2hXgW2UsuMDF1PsfijqWpBsczNMQG
	Q/lL6HT7Rc/6ZhIIclBmuYfhF0sEhJx7hkPxvzyHa2ZIDJGXXU+8FBzRy67hXVcea76SqtOVg+5Jo
	dgLCkCXFCDPCOZRZHWxZcI+pR1K9F2303Wf6x2TCdfJgZXTMWh/GnA7+GYUfgK160dufprWb+ingh
	aKXHjQ/tA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRoSY-0007I8-C1; Mon, 12 Oct 2020 03:25:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRoSU-0007HF-2h; Mon, 12 Oct 2020 03:25:11 +0000
X-UUID: 48893f9d205e41aa870d082a350d7745-20201011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Bm72sr6Ouy/aEnxVTOQTJVItEbE2HZ45eGSUlY3+1i4=; 
 b=iHV97fO7VS8aMf3ROYlU++JLJjIQsfA5n5ZaaYPFHZanI88tjH4NgEBLV0cNbGaLVhF2pQi281WgwsnOvCRYZTgcg8j3Q+Ll/rrvVEis9js4hUo3EHAmCIINN4uiq3blb/Nzty8xaYzSYD5SFcgXOo+ANpSeO1r3UB7/3K8wL+Y=;
X-UUID: 48893f9d205e41aa870d082a350d7745-20201011
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1970765546; Sun, 11 Oct 2020 19:25:02 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Oct 2020 20:25:00 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Oct 2020 11:24:57 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Oct 2020 11:24:57 +0800
Message-ID: <1602473098.26774.5.camel@mtkswgap22>
Subject: Re: [PATCH v7 2/2] soc: mediatek: add mt6779 devapc driver
From: Neal Liu <neal.liu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Mon, 12 Oct 2020 11:24:58 +0800
In-Reply-To: <0ece983b-2e55-cf06-aca8-02a014fce090@gmail.com>
References: <1598497593-15781-1-git-send-email-neal.liu@mediatek.com>
 <1598497593-15781-3-git-send-email-neal.liu@mediatek.com>
 <c41ec664-73a0-3c63-a31c-48c89028dfac@gmail.com>
 <1602124514.28301.17.camel@mtkswgap22>
 <d8aec3a3-10b6-8c9e-6b2d-f9d9c0418b33@gmail.com>
 <1602149965.8784.6.camel@mtkswgap22>
 <0ece983b-2e55-cf06-aca8-02a014fce090@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A57CB5B722B96A24B6BC4E4DA5FC2FE3FA559752A9CF0861603F1BE94AA214DC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201011_232510_255973_7B048641 
X-CRM114-Status: GOOD (  25.80  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, wsd_upstream@mediatek.com,
 devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Neal Liu <neal.liu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-10-09 at 14:34 +0200, Matthias Brugger wrote:
> 
> On 08/10/2020 11:39, Neal Liu wrote:
> > On Thu, 2020-10-08 at 10:45 +0200, Matthias Brugger wrote:
> >>
> >> On 08/10/2020 04:35, Neal Liu wrote:
> >>> On Wed, 2020-10-07 at 12:44 +0200, Matthias Brugger wrote:
> >>>>
> >>>> On 27/08/2020 05:06, Neal Liu wrote:
> [...]
> 
> >>>>> +static int mtk_devapc_probe(struct platform_device *pdev)
> >>>>> +{
> >>>>> +	struct device_node *node = pdev->dev.of_node;
> >>>>> +	struct mtk_devapc_context *ctx;
> >>>>> +	u32 devapc_irq;
> >>>>> +	int ret;
> >>>>> +
> >>>>> +	if (IS_ERR(node))
> >>>>> +		return -ENODEV;
> >>>>> +
> >>>>> +	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
> >>>>> +	if (!ctx)
> >>>>> +		return -ENOMEM;
> >>>>> +
> >>>>> +	ctx->data = of_device_get_match_data(&pdev->dev);
> >>>>> +	ctx->dev = &pdev->dev;
> >>>>> +
> >>>>> +	ctx->infra_base = of_iomap(node, 0);
> >>>>
> >>>> Does this mean the device is part of the infracfg block?
> >>>> I wasn't able to find any information about it.
> >>>
> >>> I'm not sure why you would ask infracfg block. devapc is parts of our
> >>> SoC infra, it's different with infracfg.
> >>>
> >>
> >> I'm asking because I want to understand the HW better. I'm not able to find any
> >> information in the datasheets. I want to avoid a situation as we had with the
> >> MMSYS where a clock driver was submitted first and later on we realized that
> >> MMSYS is much more then that and we had to work hard to get the driver right.
> >>
> >> Now it's happening with SCPSYS, where a driver with the scpsys compatible was
> >> send years ago. But SCPSYS is much more then the driver submitted. In this case
> >> we opted to write a new driver, but moving from one driver to another one is
> >> painfull and full of problems. For that I want to make sure we fully understand
> >> Device APC (by the way, what does APC stands for?). Is it a totally independent
> >> HW block or is it part of a subsystem, like for example SCP?
> >>
> >> Regards,
> >> Matthias
> > 
> > It's a totally independent HW block instead of a subsystem.
> > I think it's more simple than MMSYS or SCPSYS. But if you would like to
> > understand more about this HW, we could find another way/channel to
> > introduce it.
> > 
> 
> If it's a independent HW block, then we are good. No further information needed 
> by me. I'd just advise to rename the infra_base to something like base, as it 
> made me confuse.
> 
> Thanks!
> Matthias

You can imagine that infra_base means infra devapc base address for
MT6779. In 5G platforms, MediaTek infrastructure would separate into
multiple parts, so does devapc HW. And devapc would be like:
infra_base, peri_base, peri2_base, ...

Thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
