Return-Path: <SRS0=EkB4=4W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A6CFC3F2D1
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2020 00:51:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6141C20842
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2020 00:51:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JQKZzAxR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Xwj1loR4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6141C20842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BTZlkQvZrIHyB3y05qntD4rG7dyiruGZQUZvgbKgNrk=; b=JQKZzAxRETGHJ0
	lqfjmd9nsArIC5m/w9t+Y8zxjD7X/greo8sg0fbZUM5d6bDrQQ1E7KtCO0PzA7Yd5BHnV5cpY1Dix
	DX9am5Rl3UFCRBK6cgo3Uu8wuipWYQcLMIdogZ+K8ezZvGr7U/QVq5iD3O49U1OQiPCmQR1Q7BdQq
	H06wTH2CVAWDJKkYbpRjpEOPvSOoII9pGpS8VHePDk1A7qOGnrc/QvN1lfVNITnXR71qPRsd6YcLS
	teqqtlkMIdmEV0LfO99xKZoKVDueu+iPO4JSt4YiVke6+3AKHSbkhKv5qj0mbcdaxCWDzJQmHUZoJ
	6mtR5MnZL5wY7qNkmYWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9ejo-0003wi-8e; Thu, 05 Mar 2020 00:51:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9ejl-0003wJ-Hd; Thu, 05 Mar 2020 00:51:42 +0000
X-UUID: 1fcea33272864bf999b650ee934ed032-20200304
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Dt+NjDKJnvFkl8R5AeUjlcgnglhu+f9HBOgNSX0bmEE=; 
 b=Xwj1loR4Nq+7Sw402bvRcCWVaxghwi193wHlRv+MIMIqTepRD0jaBRlF5spKuX1dfN/9eybs2Zq1+/B4xrizQ6FY0O+OqjuwxoBPWbgk3EMfUjbqM6NwzD1MNP/FICR1hPoVYC3lWMFV5jWpTsupB8G/AUN03rZz6F2+wxLuV70=;
X-UUID: 1fcea33272864bf999b650ee934ed032-20200304
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 724649678; Wed, 04 Mar 2020 16:51:39 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Mar 2020 16:49:03 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 5 Mar 2020 08:47:54 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 5 Mar 2020 08:48:18 +0800
Message-ID: <1583369342.28558.0.camel@mtkswgap22>
Subject: Re: [PATCH v4 11/13] soc: mediatek: cmdq: add jump function
From: Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Date: Thu, 5 Mar 2020 08:49:02 +0800
In-Reply-To: <1583290652.1062.2.camel@mtksdaap41>
References: <1583233125-7827-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1583233125-7827-12-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1583290652.1062.2.camel@mtksdaap41>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200304_165141_592041_26AF7039 
X-CRM114-Status: GOOD (  17.02  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, wsd_upstream@mediatek.com, David
 Airlie <airlied@linux.ie>, Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 HS Liao <hs.liao@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Houlong Wei <houlong.wei@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi CK,

Thanks for your comment.

On Wed, 2020-03-04 at 10:57 +0800, CK Hu wrote:
> Hi, Dennis:
> 
> On Tue, 2020-03-03 at 18:58 +0800, Dennis YC Hsieh wrote:
> > Add jump function so that client can jump to any address which
> > contains instruction.
> > 
> > Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mtk-cmdq-helper.c | 12 ++++++++++++
> >  include/linux/soc/mediatek/mtk-cmdq.h  | 11 +++++++++++
> >  2 files changed, 23 insertions(+)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > index 59bc1164b411..f27c67034880 100644
> > --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> > +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > @@ -372,6 +372,18 @@ int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value)
> >  }
> >  EXPORT_SYMBOL(cmdq_pkt_assign);
> >  
> > +int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr)
> > +{
> > +	struct cmdq_instruction inst = { {0} };
> > +
> > +	inst.op = CMDQ_CODE_JUMP;
> > +	inst.offset = 1;
> 
> Symbolize the value '1'.

miss in v4, will add in next version, thanks.


Regards,
Dennis


> 
> Regards,
> CK
> 
> > +	inst.value = addr >>
> > +		cmdq_mbox_shift(((struct cmdq_client *)pkt->cl)->chan);
> > +	return cmdq_pkt_append_command(pkt, inst);
> > +}
> > +EXPORT_SYMBOL(cmdq_pkt_jump);
> > +
> >  int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
> >  {
> >  	struct cmdq_instruction inst = { {0} };
> > diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> > index 99e77155f967..1a6c56f3bec1 100644
> > --- a/include/linux/soc/mediatek/mtk-cmdq.h
> > +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> > @@ -213,6 +213,17 @@ int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
> >   */
> >  int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value);
> >  
> > +/**
> > + * cmdq_pkt_jump() - Append jump command to the CMDQ packet, ask GCE
> > + *		     to execute an instruction that change current thread PC to
> > + *		     a physical address which should contains more instruction.
> > + * @pkt:        the CMDQ packet
> > + * @addr:       physical address of target instruction buffer
> > + *
> > + * Return: 0 for success; else the error code is returned
> > + */
> > +int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr);
> > +
> >  /**
> >   * cmdq_pkt_finalize() - Append EOC and jump command to pkt.
> >   * @pkt:	the CMDQ packet
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
