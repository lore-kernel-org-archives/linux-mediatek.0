Return-Path: <SRS0=NAie=2C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80042C43603
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 01:31:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 524D9208C3
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 01:31:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tUzy2uTy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="CvmyK1ZE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 524D9208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dfSkcgY3Y6M9FTeQ+U1IbyXEFtvwJ0KhiKVtk4m+iqo=; b=tUzy2uTydHcvxg
	yZWeRpcjRpQPJTlsGj9y2Tg8YNPKG76yzRgu94BXFDatt1xA0YwPJXcTrQBP021MYF0Fx4PV0dtr4
	0fSaIfFCqUpY+Gm/AQrGZya4grBR4w+yx3ktqvxhCxl6Omh+yy50CiL4+2f72FbKyS4KcTucZ7KHn
	BKKdbuxSS0KVIHsPhsBRV5D9pMqOb6nAZbyLo6X0zlDAMLnF4m6cDMAdAhqe8nVw+vJul2qFtisOI
	GIMkC85i26ZaIQ7X1s42JKBq6emmDbgmC96fLzpmqm8YVmruMzfyJEtAZnBqRMyyhMqJkA9sqUDGr
	VDdQoEMc34Xk2V8/wPtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifDK2-0006Ja-EF; Thu, 12 Dec 2019 01:31:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifDJs-0006CN-9w; Thu, 12 Dec 2019 01:31:09 +0000
X-UUID: 39b51ddc38b3454a99518209f46cf901-20191211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=z3jXfILSOt5N95Q9i/yWWMY8RXxe+WYzygOicgGVo+c=; 
 b=CvmyK1ZEyOxeN/Fs1neZS0/I5uk/WNBRs/4ovVFHQU1sdNZIqdvLk5np8L+xx+4nMPnGHm77tHoJOkyUHDzyH/2w0QgZ1ffEeaG6JX58m2dGJORDhKxV9we+Ou/A9XMCxZb0D4PQ3dwN5ctprDkISeM8rnHKKYrCBI2fT96wSF8=;
X-UUID: 39b51ddc38b3454a99518209f46cf901-20191211
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 276690656; Wed, 11 Dec 2019 17:31:07 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Dec 2019 17:31:21 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 12 Dec 2019 09:30:44 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 12 Dec 2019 09:30:59 +0800
Message-ID: <1576114263.17653.9.camel@mtkswgap22>
Subject: Re: [PATCH v2 08/14] soc: mediatek: cmdq: add write_s function
From: Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Date: Thu, 12 Dec 2019 09:31:03 +0800
In-Reply-To: <1575955103.31262.10.camel@mtksdaap41>
References: <1574819937-6246-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1574819937-6246-10-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1575955103.31262.10.camel@mtksdaap41>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_173108_359578_AB8A6602 
X-CRM114-Status: GOOD (  22.20  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
 Houlong Wei <houlong.wei@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi CK,

On Tue, 2019-12-10 at 13:18 +0800, CK Hu wrote:
> Hi, Dennis:
> 
> On Wed, 2019-11-27 at 09:58 +0800, Dennis YC Hsieh wrote:
> > add write_s function in cmdq helper functions which
> > writes value contains in internal register to address
> > with large dma access support.
> > 
> > Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mtk-cmdq-helper.c   | 40 ++++++++++++++++++++++++
> >  include/linux/mailbox/mtk-cmdq-mailbox.h |  2 ++
> >  include/linux/soc/mediatek/mtk-cmdq.h    | 12 +++++++
> >  3 files changed, 54 insertions(+)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > index 9cc234f08ec5..2edbc0954d97 100644
> > --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> > +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > @@ -15,11 +15,18 @@
> >  #define CMDQ_EOC_CMD		((u64)((CMDQ_CODE_EOC << CMDQ_OP_CODE_SHIFT)) \
> >  				<< 32 | CMDQ_EOC_IRQ_EN)
> >  #define CMDQ_REG_TYPE		1
> > +#define CMDQ_ADDR_HIGH(addr)	((u32)(((addr) >> 16) & GENMASK(31, 0)))
> > +#define CMDQ_ADDR_LOW_BIT	BIT(1)
> > +#define CMDQ_ADDR_LOW(addr)	((u16)(addr) | CMDQ_ADDR_LOW_BIT)
> >  
> >  struct cmdq_instruction {
> >  	union {
> >  		u32 value;
> >  		u32 mask;
> > +		struct {
> > +			u16 arg_c;
> > +			u16 arg_b;
> > +		};
> >  	};
> >  	union {
> >  		u16 offset;
> > @@ -224,6 +231,39 @@ int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
> >  }
> >  EXPORT_SYMBOL(cmdq_pkt_write_mask);
> >  
> > +int cmdq_pkt_write_s(struct cmdq_pkt *pkt, phys_addr_t addr, u16 reg_idx,
> > +		     u32 mask)
> > +{
> > +	struct cmdq_instruction inst = { {0} };
> > +	const u16 dst_reg_idx = CMDQ_SPR_TEMP;
> > +	int err;
> > +
> > +	if (mask != U32_MAX) {
> > +		inst.op = CMDQ_CODE_MASK;
> > +		inst.mask = ~mask;
> > +		err = cmdq_pkt_append_command(pkt, inst);
> > +		if (err < 0)
> > +			return err;
> > +
> > +		inst.mask = 0;
> > +		inst.op = CMDQ_CODE_WRITE_S_MASK;
> > +	} else {
> > +		inst.op = CMDQ_CODE_WRITE_S;
> > +	}
> > +
> > +	err = cmdq_pkt_assign(pkt, dst_reg_idx, CMDQ_ADDR_HIGH(addr));
> 
> You combine assign and write_s in this function, so you always occupy
> register CMDQ_SPR_TEMP for this purpose, client could not use
> CMDQ_SPR_TEMP for other purpose. So I would like you just do write_s in
> this function. So the code in client would be:
> 
> cmdq_pkt_assign(pkt, high_addr_reg_idx, CMDQ_ADDR_HIGH(addr));
> cmdq_pkt_write_s(pkt, high_addr_reg_idx, CMDQ_ADDR_LOW(addr),
> src_reg_idx, mask);
> 
> Let client to decide which register for high address.
> 
> Another benefit of not combining instruction is that client driver owner
> would be more clear about which command is in command buffer and it's
> easier for them to debug.
> 

ok, i will expose reg idx as parameter

> > +	if (err < 0)
> > +		return err;
> > +
> > +	inst.arg_b_t = CMDQ_REG_TYPE;
> > +	inst.sop = dst_reg_idx;
> > +	inst.offset = CMDQ_ADDR_LOW(addr);
> > +	inst.arg_b = reg_idx;
> 
> I seems arg_b has a meaningful name.
> 
> Regards,
> CK
> 

ok, will change name


Regards,
Dennis

> > +
> > +	return cmdq_pkt_append_command(pkt, inst);
> > +}
> > +EXPORT_SYMBOL(cmdq_pkt_write_s);
> > +
> >  int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event)
> >  {
> >  	struct cmdq_instruction inst = { {0} };
> > diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> > index 121c3bb6d3de..8ef87e1bd03b 100644
> > --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> > +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> > @@ -59,6 +59,8 @@ enum cmdq_code {
> >  	CMDQ_CODE_JUMP = 0x10,
> >  	CMDQ_CODE_WFE = 0x20,
> >  	CMDQ_CODE_EOC = 0x40,
> > +	CMDQ_CODE_WRITE_S = 0x90,
> > +	CMDQ_CODE_WRITE_S_MASK = 0x91,
> >  	CMDQ_CODE_LOGIC = 0xa0,
> >  };
> >  
> > diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> > index c66b3a0da2a2..56ff1970197c 100644
> > --- a/include/linux/soc/mediatek/mtk-cmdq.h
> > +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> > @@ -106,6 +106,18 @@ int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u32 value);
> >  int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
> >  			u16 offset, u32 value, u32 mask);
> >  
> > +/**
> > + * cmdq_pkt_write_s_mask() - append write_s command to the CMDQ packet
> > + * @pkt:	the CMDQ packet
> > + * @addr:	the physical address of register or dma
> > + * @reg_idx:	the CMDQ internal register ID which cache source value
> > + * @mask:	the specified target register mask
> > + *
> > + * Return: 0 for success; else the error code is returned
> > + */
> > +int cmdq_pkt_write_s(struct cmdq_pkt *pkt, phys_addr_t addr, u16 reg_idx,
> > +		     u32 mask);
> > +
> >  /**
> >   * cmdq_pkt_wfe() - append wait for event command to the CMDQ packet
> >   * @pkt:	the CMDQ packet
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
