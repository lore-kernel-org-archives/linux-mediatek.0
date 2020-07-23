Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7788EC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 05:58:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44668207F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 05:58:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gHygfwIR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="A0jU3ejF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44668207F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h2fKS4JUhcFaZIJpB/2q7fcB0SLxDPZEFqReks3zalc=; b=gHygfwIRiC472bw1j0j2xtl9q
	DPZKYFkLdZkQzimHaL6qYasCrlXta1b/nk0wyHLCzD/atp8j+r0kD4YENmiNFgn0xq4z03fREA/lu
	JnI4zoed+vjTWkLOykswrt8AlX21ff2T8km3x47nWyriTqyr3MN782ES2C3tTzpTGTHFSUuNEakhw
	ad5mUSHJhc//9AMROay0Cj3sSdI03LfIvtTzG3FU8XZTrAPFoRtZ15sQaGc91FPHpUk6fNDYzpkd+
	rDCnpStHSNiJ/B2ztsv0FZEvZSSbrum16daMZ5nTOYz2i2I+qJKXDFEC5F8GRoBnL9KmiagDw2JYl
	zWYYAzThw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyUFk-0002lI-SK; Thu, 23 Jul 2020 05:58:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyUFf-0002kh-3u; Thu, 23 Jul 2020 05:58:44 +0000
X-UUID: 7dbce6b482bb4ca39f01349b17d8e586-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=avHxu0dEvObqmrR0tNdjaTp0S0v4rEX5l1fG2CDw6nw=; 
 b=A0jU3ejFug07WiLPB3VsLWud19SVmLpO+GfcGdYmkKFS+ctHYlq5suTP3kgrZUiOFJYq4Up4DMwbbAxpEg0CMwKUUoWO82DUFMSYo6Fmi0iaueRmSddgAt/39mggb8z3u6Ywj4aim6JfP0DkOR9x1KDqcG6Z1SIuJT8poJATodY=;
X-UUID: 7dbce6b482bb4ca39f01349b17d8e586-20200722
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 164602992; Wed, 22 Jul 2020 21:58:33 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 22:48:55 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 23 Jul 2020 13:48:53 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 13:48:52 +0800
Message-ID: <1595483265.16079.18.camel@mhfsdcap03>
Subject: Re: [PATCH 2/4] i2c: mediatek: Support DMA mask range over 33-bits
From: Qii Wang <qii.wang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Thu, 23 Jul 2020 13:47:45 +0800
In-Reply-To: <87429327-5d2e-e3f3-db22-04e225a31055@gmail.com>
References: <1595421106-10017-1-git-send-email-qii.wang@mediatek.com>
 <1595421106-10017-3-git-send-email-qii.wang@mediatek.com>
 <87429327-5d2e-e3f3-db22-04e225a31055@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5486F58D41C29B12797C4E71C6DEAC8B90AB18EC292FCB909DA017C6AD5D7D242000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_015843_366532_92A3D7E1 
X-CRM114-Status: GOOD (  19.19  )
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
Cc: qiangming.xia@mediatek.com, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, wsa@the-dreams.de, leilk.liu@mediatek.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-07-22 at 17:38 +0200, Matthias Brugger wrote:
> 
> On 22/07/2020 14:31, Qii Wang wrote:
> > Replace 'support_33bits with 'dma_max_support' for DMA mask
> > operation, and replace 'mtk_i2c_set_4g_mode' with 'upper_32_bits'.
> 
> Please explain more in detail what you are doing and how this fits to the way 
> the HW works.
> 

As Yingjoe sir said, Newer MTK chip support more than 8GB of dram, and
the register TX/RX_4G_MODE of APDMA has added corresponding bit to
support.So we Replace support_33bits with more general dma_max_support.I
will modify the title and commit as :
i2c: mediatek: Add access to more than 8GB dram in i2c driver
Newer MTK chip support more than 8GB of dram. Replace support_33bits
with more general dma_max_support and remove mtk_i2c_set_4g_mode.

> > 
> > Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> > ---
> >   drivers/i2c/busses/i2c-mt65xx.c | 37 +++++++++++++++++--------------------
> >   1 file changed, 17 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> > index e6b984a..e475877 100644
> > --- a/drivers/i2c/busses/i2c-mt65xx.c
> > +++ b/drivers/i2c/busses/i2c-mt65xx.c
> > @@ -209,6 +209,7 @@ struct mtk_i2c_compatible {
> >   	unsigned char dma_sync: 1;
> >   	unsigned char ltiming_adjust: 1;
> >   	unsigned char apdma_sync: 1;
> > +	unsigned char max_dma_support;
> >   };
> >   
> >   struct mtk_i2c_ac_timing {
> > @@ -311,11 +312,11 @@ struct i2c_spec_values {
> >   	.dcm = 1,
> >   	.auto_restart = 1,
> >   	.aux_len_reg = 1,
> > -	.support_33bits = 1,
> >   	.timing_adjust = 1,
> >   	.dma_sync = 0,
> >   	.ltiming_adjust = 0,
> >   	.apdma_sync = 0,
> > +	.max_dma_support = 33,
> >   };
> >   
> >   static const struct mtk_i2c_compatible mt6577_compat = {
> > @@ -325,11 +326,11 @@ struct i2c_spec_values {
> >   	.dcm = 1,
> >   	.auto_restart = 0,
> >   	.aux_len_reg = 0,
> > -	.support_33bits = 0,
> >   	.timing_adjust = 0,
> >   	.dma_sync = 0,
> >   	.ltiming_adjust = 0,
> >   	.apdma_sync = 0,
> > +	.max_dma_support = 32,
> >   };
> >   
> >   static const struct mtk_i2c_compatible mt6589_compat = {
> > @@ -339,11 +340,11 @@ struct i2c_spec_values {
> >   	.dcm = 0,
> >   	.auto_restart = 0,
> >   	.aux_len_reg = 0,
> > -	.support_33bits = 0,
> >   	.timing_adjust = 0,
> >   	.dma_sync = 0,
> >   	.ltiming_adjust = 0,
> >   	.apdma_sync = 0,
> > +	.max_dma_support = 32,
> >   };
> >   
> >   static const struct mtk_i2c_compatible mt7622_compat = {
> > @@ -353,11 +354,11 @@ struct i2c_spec_values {
> >   	.dcm = 1,
> >   	.auto_restart = 1,
> >   	.aux_len_reg = 1,
> > -	.support_33bits = 0,
> >   	.timing_adjust = 0,
> >   	.dma_sync = 0,
> >   	.ltiming_adjust = 0,
> >   	.apdma_sync = 0,
> > +	.max_dma_support = 32,
> >   };
> >   
> >   static const struct mtk_i2c_compatible mt8173_compat = {
> > @@ -366,11 +367,11 @@ struct i2c_spec_values {
> >   	.dcm = 1,
> >   	.auto_restart = 1,
> >   	.aux_len_reg = 1,
> > -	.support_33bits = 1,
> >   	.timing_adjust = 0,
> >   	.dma_sync = 0,
> >   	.ltiming_adjust = 0,
> >   	.apdma_sync = 0,
> > +	.max_dma_support = 33,
> >   };
> >   
> >   static const struct mtk_i2c_compatible mt8183_compat = {
> > @@ -380,11 +381,11 @@ struct i2c_spec_values {
> >   	.dcm = 0,
> >   	.auto_restart = 1,
> >   	.aux_len_reg = 1,
> > -	.support_33bits = 1,
> >   	.timing_adjust = 1,
> >   	.dma_sync = 1,
> >   	.ltiming_adjust = 1,
> >   	.apdma_sync = 0,
> > +	.max_dma_support = 33,
> >   };
> >   
> >   static const struct of_device_id mtk_i2c_of_match[] = {
> > @@ -796,11 +797,6 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
> >   	return 0;
> >   }
> >   
> > -static inline u32 mtk_i2c_set_4g_mode(dma_addr_t addr)
> > -{
> > -	return (addr & BIT_ULL(32)) ? I2C_DMA_4G_MODE : I2C_DMA_CLR_FLAG;
> 
> I2C_DMA_4G_MODE define could now be deleted as well.
> 
> Regards,
> Matthias
> 
> > -}
> > -
> >   static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
> >   			       int num, int left_num)
> >   {
> > @@ -885,8 +881,8 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
> >   			return -ENOMEM;
> >   		}
> >   
> > -		if (i2c->dev_comp->support_33bits) {
> > -			reg_4g_mode = mtk_i2c_set_4g_mode(rpaddr);
> > +		if (i2c->dev_comp->max_dma_support > 32) {
> > +			reg_4g_mode = upper_32_bits(rpaddr);
> >   			writel(reg_4g_mode, i2c->pdmabase + OFFSET_RX_4G_MODE);
> >   		}
> >   
> > @@ -908,8 +904,8 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
> >   			return -ENOMEM;
> >   		}
> >   
> > -		if (i2c->dev_comp->support_33bits) {
> > -			reg_4g_mode = mtk_i2c_set_4g_mode(wpaddr);
> > +		if (i2c->dev_comp->max_dma_support > 32) {
> > +			reg_4g_mode = upper_32_bits(wpaddr);
> >   			writel(reg_4g_mode, i2c->pdmabase + OFFSET_TX_4G_MODE);
> >   		}
> >   
> > @@ -954,11 +950,11 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
> >   			return -ENOMEM;
> >   		}
> >   
> > -		if (i2c->dev_comp->support_33bits) {
> > -			reg_4g_mode = mtk_i2c_set_4g_mode(wpaddr);
> > +		if (i2c->dev_comp->max_dma_support > 32) {
> > +			reg_4g_mode = upper_32_bits(wpaddr);
> >   			writel(reg_4g_mode, i2c->pdmabase + OFFSET_TX_4G_MODE);
> >   
> > -			reg_4g_mode = mtk_i2c_set_4g_mode(rpaddr);
> > +			reg_4g_mode = upper_32_bits(rpaddr);
> >   			writel(reg_4g_mode, i2c->pdmabase + OFFSET_RX_4G_MODE);
> >   		}
> >   
> > @@ -1232,8 +1228,9 @@ static int mtk_i2c_probe(struct platform_device *pdev)
> >   		return -EINVAL;
> >   	}
> >   
> > -	if (i2c->dev_comp->support_33bits) {
> > -		ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(33));
> > +	if (i2c->dev_comp->max_dma_support > 32) {
> > +		ret = dma_set_mask(&pdev->dev,
> > +				DMA_BIT_MASK(i2c->dev_comp->max_dma_support));
> >   		if (ret) {
> >   			dev_err(&pdev->dev, "dma_set_mask return error.\n");
> >   			return ret;
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
