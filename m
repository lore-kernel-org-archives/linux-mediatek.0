Return-Path: <SRS0=WlSZ=LD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE8BC4743D
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 02:44:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FD5361184
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 02:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FD5361184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RTcG9YVMPosjQQhPKr9fXLCfKm+PQ5lh3KvcZ/CXmM0=; b=WjA+oBkccqHxcc
	LBvUpiqTR32tOpNw08bSlGQ0eFfkXQuMzOAVaylK/W+G+w0zA/iDl7Ps95cetC3mhmMnPxCUOz7ko
	i6OMBzeJsl+fkJ3WMFyLQV9YgfxcHehXSQasR2siLL+KNbrfzVyjTrSbwzafLRmoklsIirN4fN1D5
	Wmyk1Dswsok5mpjvloNOWfwrHrWcuoq/Y9zNwdJdfakNFz8d4Aw9grYBYPvBD3E95hIYEbYNVRd+u
	ri2rvbjt1nstsOvL8ZlpRokx8X8afzjzs4+pbOxwmTpT4weyFGJ41y13NVYksLPWU/aNJ7aTIeZty
	aY7bmKhh7mr4Udbgw96A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqoCR-00BSHV-QS; Wed, 09 Jun 2021 02:44:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqoCB-00BSEV-Ng; Wed, 09 Jun 2021 02:43:58 +0000
X-UUID: 19a7b99ec2e04415b57178009c31bb77-20210608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=YlJZ3DSxIMXeeLudsnal26OpngdTHTMDMazjVteE63M=; 
 b=oXlRf4LYUNlbjKZsBgREzBjofsq6ZhYSeR7vwnYuiSt1XPWB2G2wPhUPLK8gKZHrXcN7wVEDg/+SVuC7pFLOwJRDzZ1W9R/jhrl8RKv9CPcBBFhs9FU/MECdWMVivq4ToyQg6fy48n+NlelLjPc/DCDV5zX4G6o+b22kHxCJNew=;
X-UUID: 19a7b99ec2e04415b57178009c31bb77-20210608
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 161118534; Tue, 08 Jun 2021 19:43:51 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 19:43:50 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 9 Jun 2021 10:43:47 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Jun 2021 10:43:44 +0800
Message-ID: <1623206624.14050.10.camel@mhfsdcap03>
Subject: Re: [PATCH 2/3] i2c: mediatek: Dump i2c/dma register when a timeout
 occurs
From: Kewei Xu <kewei.xu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: <wsa@the-dreams.de>, <robh+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
 <qii.wang@mediatek.com>, <qiangming.xia@mediatek.com>,
 <liguo.zhang@mediatek.com>
Date: Wed, 9 Jun 2021 10:43:44 +0800
In-Reply-To: <54301510-e0d5-0762-1979-b194b8fd5eb8@gmail.com>
References: <1623122200-1896-1-git-send-email-kewei.xu@mediatek.com>
 <1623122200-1896-3-git-send-email-kewei.xu@mediatek.com>
 <54301510-e0d5-0762-1979-b194b8fd5eb8@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 978AC84873E67237AE466C5D838E8CDB2EB7D777515206BE778ADE526AA155F82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_194357_211992_8BA279AD 
X-CRM114-Status: GOOD (  20.49  )
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

On Tue, 2021-06-08 at 16:01 +0200, Matthias Brugger wrote:
> 
> On 08/06/2021 05:16, Kewei Xu wrote:
> > From: "Kewei.Xu" <kewei.xu@mediatek.com>
> > 
> > When a timeout error occurs in i2c transter, it is usually related
> > to the i2c/dma IP hardware configuration. Therefore, the purpose of
> > this patch is to dump the key register values of i2c/dma when a
> > timeout occurs in i2c for debugging.
> > 
> > Signed-off-by: Kewei.Xu <kewei.xu@mediatek.com>
> > ---
> >  drivers/i2c/busses/i2c-mt65xx.c | 97 ++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 95 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> > index 5ddfa4e..e65a41e 100644
> > --- a/drivers/i2c/busses/i2c-mt65xx.c
> > +++ b/drivers/i2c/busses/i2c-mt65xx.c
> > @@ -125,6 +125,7 @@ enum I2C_REGS_OFFSET {
> >  	OFFSET_HS,
> >  	OFFSET_SOFTRESET,
> >  	OFFSET_DCM_EN,
> > +	OFFSET_MULTI_DMA,
> >  	OFFSET_PATH_DIR,
> >  	OFFSET_DEBUGSTAT,
> >  	OFFSET_DEBUGCTRL,
> > @@ -192,8 +193,9 @@ enum I2C_REGS_OFFSET {
> >  	[OFFSET_TRANSFER_LEN_AUX] = 0x44,
> >  	[OFFSET_CLOCK_DIV] = 0x48,
> >  	[OFFSET_SOFTRESET] = 0x50,
> > +	[OFFSET_MULTI_DMA] = 0x84,
> >  	[OFFSET_SCL_MIS_COMP_POINT] = 0x90,
> > -	[OFFSET_DEBUGSTAT] = 0xe0,
> > +	[OFFSET_DEBUGSTAT] = 0xe4,
> 
> Is this offset only for mt8192 or also for mt8183?
> In any case that should go in as another patch. Either a fix or a new
> mt_i2c_regs_v3[]
> 
> Regards,
  Matthias

Hi Matthias,

This offset value is suitable for the IC of mt_i2c_regs_v2 hardware
design similar to mt8192/8195, not for 8183.

The reason for the modification here is that the previous
offset information is incorrect, OFFSET_DEBUGSTAT = 0XE4 is
the correct value.

Regards,
Kewei


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
