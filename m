Return-Path: <SRS0=x9ei=ZR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7907CC432C3
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Nov 2019 02:08:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AC132053B
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Nov 2019 02:08:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sig9TvkY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="S6BJTPJz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AC132053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CTWkdkAfXSOgKMb2sXPmxIzus7K8I31D5g9+6phSNDw=; b=Sig9TvkYF/1piq
	LMbrHkG3/seKxgi0/A+VEElfpiu1+fK+ysxHnGBcfXPbOQaGWU9hRp/0PkZTkmkk1Zr1KW7SoH04f
	kWYt/fo4GTfxYbi7z31y/rBziWSjwMx4eNCE72i+O4vQrjgM/UWkooIBW2oeuwlE8SyHDzEXd5QHi
	8/nj5E/RbWbqrNP4Ks1obAdxWuI1jN2EbJ24GFsZlq8cigWpoakOZfqn2GElgpG3E2AhHs4pbOgFh
	iD+JfDIJdQWTbQu3Fll9FhnDnkaWHwmtw98imMwwIQt7U3S/cO6pW5OMfvQ85U3zjjjen1zyq0igb
	pLGd/H5J5ytoO3p0zA9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZ3ny-0003r6-TI; Mon, 25 Nov 2019 02:08:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZ3nn-0003ii-P5; Mon, 25 Nov 2019 02:08:37 +0000
X-UUID: ef112c43c82444919c5bff0fde032784-20191124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=fqkSi9NknIDShb1QKQOMXUGDh0Q49rrogX0BLcZahGU=; 
 b=S6BJTPJzDnZA4kIaxuMdMnKZYKwsAsjdPV7CJmPU6ZdY0rI/jAXJDdEr9qteQ1IcXoZ2H3HHKMseICs9YiJaU0rX7PQFeAHz8CVG4dWMaFh2gN8TPXB+MqoRx2ETzvpCrlQC51DapXj3YhMcIgJq0S8gAjvIB0qMAdnAoSzTd6Y=;
X-UUID: ef112c43c82444919c5bff0fde032784-20191124
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 511817586; Sun, 24 Nov 2019 18:08:36 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 24 Nov 2019 18:08:38 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 25 Nov 2019 10:07:51 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 25 Nov 2019 10:08:09 +0800
Message-ID: <1574647703.4712.16.camel@mtksdaap41>
Subject: Re: [PATCH v1 07/12] soc: mediatek: cmdq: add write_s function
From: CK Hu <ck.hu@mediatek.com>
To: Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>
Date: Mon, 25 Nov 2019 10:08:23 +0800
In-Reply-To: <1574417507.11977.14.camel@mtkswgap22>
References: <1574327552-11806-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1574327552-11806-8-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1574412997.19450.16.camel@mtksdaap41>
 <1574417507.11977.14.camel@mtkswgap22>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191124_180835_824089_578AF1B7 
X-CRM114-Status: GOOD (  27.91  )
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

Hi, Dennis:

On Fri, 2019-11-22 at 18:11 +0800, Dennis-YC Hsieh wrote:
> Hi CK,
> 
> On Fri, 2019-11-22 at 16:56 +0800, CK Hu wrote:
> > Hi, Dennis:
> > 
> > On Thu, 2019-11-21 at 17:12 +0800, Dennis YC Hsieh wrote:
> > > add write_s function in cmdq helper functions which
> > > support large dma access.
> > > 
> > > Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> > > ---
> > >  drivers/soc/mediatek/mtk-cmdq-helper.c   |   34 ++++++++++++++++++++++++++++++
> > >  include/linux/mailbox/mtk-cmdq-mailbox.h |    2 ++
> > >  include/linux/soc/mediatek/mtk-cmdq.h    |   13 ++++++++++++
> > >  3 files changed, 49 insertions(+)
> > > 
> > > diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > > index d419e99..1b074a9 100644
> > > --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> > > +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > > @@ -15,6 +15,9 @@
> > >  #define CMDQ_EOC_CMD		((u64)((CMDQ_CODE_EOC << CMDQ_OP_CODE_SHIFT)) \
> > >  				<< 32 | CMDQ_EOC_IRQ_EN)
> > >  #define CMDQ_REG_TYPE		1
> > > +#define CMDQ_ADDR_HIGH(addr)	((u32)(((addr) >> 16) & GENMASK(31, 0)))
> > > +#define CMDQ_ADDR_LOW_BIT	BIT(1)
> > > +#define CMDQ_ADDR_LOW(addr)	((u16)(addr) | CMDQ_ADDR_LOW_BIT)
> > >  
> > >  struct cmdq_instruction {
> > >  	union {
> > > @@ -224,6 +227,37 @@ int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
> > >  }
> > >  EXPORT_SYMBOL(cmdq_pkt_write_mask);
> > >  
> > > +int cmdq_pkt_write_s(struct cmdq_pkt *pkt, dma_addr_t addr,
> > > +		     u32 value, u32 mask)
> > > +{
> > > +	struct cmdq_instruction inst = { {0} };
> > > +	int err;
> > > +	const u16 dst_reg_idx = CMDQ_SPR_TEMP;
> > > +
> > > +	err = cmdq_pkt_assign(pkt, dst_reg_idx, CMDQ_ADDR_HIGH(addr));
> > > +	if (err < 0)
> > > +		return err;
> > > +
> > > +	if (mask != U32_MAX) {
> > > +		inst.op = CMDQ_CODE_MASK;
> > > +		inst.mask = ~mask;
> > > +		err = cmdq_pkt_append_command(pkt, inst);
> > > +		if (err < 0)
> > > +			return err;
> > > +
> > > +		inst.op = CMDQ_CODE_WRITE_S_MASK;
> > > +	} else {
> > > +		inst.op = CMDQ_CODE_WRITE_S;
> > > +	}
> > > +
> > > +	inst.sop = dst_reg_idx;
> > > +	inst.offset = CMDQ_ADDR_LOW(addr);
> > > +	inst.value = value;
> > > +
> > > +	return cmdq_pkt_append_command(pkt, inst);
> > > +}
> > > +EXPORT_SYMBOL(cmdq_pkt_write_s);
> > > +
> > >  int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event)
> > >  {
> > >  	struct cmdq_instruction inst = { {0} };
> > > diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> > > index 121c3bb..8ef87e1 100644
> > > --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> > > +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> > > @@ -59,6 +59,8 @@ enum cmdq_code {
> > >  	CMDQ_CODE_JUMP = 0x10,
> > >  	CMDQ_CODE_WFE = 0x20,
> > >  	CMDQ_CODE_EOC = 0x40,
> > > +	CMDQ_CODE_WRITE_S = 0x90,
> > > +	CMDQ_CODE_WRITE_S_MASK = 0x91,
> > >  	CMDQ_CODE_LOGIC = 0xa0,
> > >  };
> > >  
> > > diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> > > index 8334021..8dbd046 100644
> > > --- a/include/linux/soc/mediatek/mtk-cmdq.h
> > > +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> > > @@ -12,6 +12,7 @@
> > >  #include <linux/timer.h>
> > >  
> > >  #define CMDQ_NO_TIMEOUT		0xffffffffu
> > > +#define CMDQ_SPR_TEMP		0
> > >  
> > >  struct cmdq_pkt;
> > >  
> > > @@ -103,6 +104,18 @@ int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
> > >  			u16 offset, u32 value, u32 mask);
> > >  
> > >  /**
> > > + * cmdq_pkt_write_s() - append write_s command with mask to the CMDQ packet
> > > + * @pkt:	the CMDQ packet
> > > + * @addr:	the physical address of register or dma
> > > + * @value:	the specified target value
> > > + * @mask:	the specified target mask
> > > + *
> > > + * Return: 0 for success; else the error code is returned
> > > + */
> > > +int cmdq_pkt_write_s(struct cmdq_pkt *pkt, dma_addr_t addr,
> > > +		     u32 value, u32 mask);
> > 
> > You have an API cmdq_pkt_read_s() which read data into gce internal
> > register, so I expect that cmdq_pkt_write_s() is an API which write data
> > from gce internal register, the expected prototype is
> > 
> > int cmdq_pkt_write_s(struct cmdq_pkt *pkt, phys_addr_t addr, u16
> > reg_idx);
> > 
> > Your version would confuse the user because you hide the internal
> > register parameter. If you want to provide this service, I would like
> > you to change the function name so that user would not be confused and
> > easily to understand what you want to do in this function.
> > 
> > Another choice is: cmdq_pkt_write_s() is implemented in my definition,
> > and user could call cmdq_pkt_assign() and cmdq_pkt_write_s() to achieve
> > this function.
> > 
> > Regards,
> > CK
> > 
> 
> Thanks for your comment.
> 
> Ok, we have to provide write constant value service to client, so I will
> change the function name to cmdq_pkt_write_s_value() in this patch.
> 
> And since it is better to provide consistent API so I will design
> another function with interface as your suggestion:
> int cmdq_pkt_write_s(struct cmdq_pkt *pkt, phys_addr_t addr, u16
> reg_idx);
> 
> In another patch I provide cmdq_pkt_mem_move(). I will move part of
> implementation to cmdq_pkt_write_s(), so that cmdq_pkt_mem_move() can be
> combination of cmdq_pkt_read_s() and cmdq_pkt_write_s().
> 
> How do you think?

So cmdq_pkt_read_s()/cmdq_pkt_write_s() are the basic function and
cmdq_pkt_write_s_value()/cmdq_pkt_mem_move() are combination function. I
would like to keep the basic function and drop the combination function
at first. I think what we place in helper is used by two or more
clients. It's strong believed that basic function could be used by two
or more client, but it's doubt that combination would be. If only one
client use this combination, just place the combination in that client.
If later second client use this combination, we then move the common
code in helper and both client call the helper function. If you could
prove that this combination is used by two or more clients now, just
show me.

Regards,
CK

> 
> 
> Regards,
> Dennis
> 
> > > +
> > > +/**
> > >   * cmdq_pkt_wfe() - append wait for event command to the CMDQ packet
> > >   * @pkt:	the CMDQ packet
> > >   * @event:	the desired event type to "wait and CLEAR"
> > 
> > 
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
