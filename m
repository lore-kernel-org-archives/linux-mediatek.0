Return-Path: <SRS0=6j47=7G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D3EC433E0
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 May 2020 17:39:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F19052073B
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 May 2020 17:39:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LYEVEfbm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uVtaZAO0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F19052073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6RNvmppcR9qE/Ff2c5WiyBJr4txDtMeiZPDMSydomao=; b=LYEVEfbmvQmgx0
	dC8rr/nbPzZQnO40A95owsXHFqtuNrOCfHaspdIdnvuYJsSN21VrEui57HebUgNr+Fh5j93KQu7KV
	mULqva0RwpNc4U67x6s/gvh8HREcLCmbVcSrLr5RuidlohoOUuy0u4JA0V4aOVOBEJwkzpondFWrb
	DVG0ckq8Awnh4txRzG48MpgOG5AMXSEgqw73pLaIZXm/tsjl3G1JvsWoF0KLoE+ZoI0NQAh2Bx6UB
	dyHgpFWHqFB/akSRJ7cHE0DT1s3x0O/4pZQJWkGYDNFmAW2dpysmp2XFDxU+or4/OOeyGuUpJntWI
	oMtfXGPWcD4dElfL04iA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcub0-00085r-F3; Sun, 24 May 2020 17:39:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcuax-00085Q-Qe; Sun, 24 May 2020 17:39:33 +0000
X-UUID: 3ad4a9a503d64c7987de6ef5e185629d-20200524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Budt1Q/YKyyHz1LfMtaltAftGMWuXZGR8k5sFbQgD9I=; 
 b=uVtaZAO0ztm5vjRXLPBVsHPSqkJDUZIT8Nku1f1uGLGcCikpf2MC6DJ/gmfZeJ0MeCFEAy7xDlaiL0bmnyCP0fgET1W/KvHNQHdIklTni3sMIPiLSHhAbNoH4R2GDlr7qdRcAW8vI+P1bdK98QyCkiNNdtt+8u4E6X3ufujFITo=;
X-UUID: 3ad4a9a503d64c7987de6ef5e185629d-20200524
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 257335477; Sun, 24 May 2020 09:38:59 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 24 May 2020 10:39:24 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 May 2020 01:39:22 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 May 2020 01:39:22 +0800
Message-ID: <1590341965.31286.27.camel@mtkswgap22>
Subject: Re: [PATCH v5 13/13] soc: mediatek: cmdq: add set event function
From: Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Mon, 25 May 2020 01:39:25 +0800
In-Reply-To: <d00dd874-edda-701a-2acc-540ed19d1300@gmail.com>
References: <1583664775-19382-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1583664775-19382-14-git-send-email-dennis-yc.hsieh@mediatek.com>
 <d00dd874-edda-701a-2acc-540ed19d1300@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200524_103931_871258_7721F1DC 
X-CRM114-Status: GOOD (  18.54  )
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
 Philipp Zabel <p.zabel@pengutronix.de>, wsd_upstream@mediatek.com,
 David Airlie <airlied@linux.ie>, Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 HS Liao <hs.liao@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Houlong Wei <houlong.wei@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Matthias,

Thanks for your comment.


On Sat, 2020-05-16 at 20:32 +0200, Matthias Brugger wrote:
> 
> On 08/03/2020 11:52, Dennis YC Hsieh wrote:
> > Add set event function in cmdq helper functions to set specific event.
> > 
> > Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mtk-cmdq-helper.c   | 15 +++++++++++++++
> >  include/linux/mailbox/mtk-cmdq-mailbox.h |  1 +
> >  include/linux/soc/mediatek/mtk-cmdq.h    |  9 +++++++++
> >  3 files changed, 25 insertions(+)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > index ec5637d43254..3294c9285994 100644
> > --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> > +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > @@ -327,6 +327,21 @@ int cmdq_pkt_clear_event(struct cmdq_pkt *pkt, u16 event)
> >  }
> >  EXPORT_SYMBOL(cmdq_pkt_clear_event);
> >  
> > +int cmdq_pkt_set_event(struct cmdq_pkt *pkt, u16 event)
> > +{
> > +	struct cmdq_instruction inst = { {0} };
> > +
> > +	if (event >= CMDQ_MAX_EVENT)
> > +		return -EINVAL;
> > +
> > +	inst.op = CMDQ_CODE_WFE;
> > +	inst.value = CMDQ_WFE_UPDATE | CMDQ_WFE_UPDATE_VALUE;
> > +	inst.event = event;
> > +
> > +	return cmdq_pkt_append_command(pkt, inst);
> > +}
> > +EXPORT_SYMBOL(cmdq_pkt_set_event);
> > +
> >  int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys,
> >  		  u16 offset, u32 value)
> >  {
> > diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> > index 42d2a30e6a70..ba2d811183a9 100644
> > --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> > +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> > @@ -17,6 +17,7 @@
> >  #define CMDQ_JUMP_PASS			CMDQ_INST_SIZE
> >  
> >  #define CMDQ_WFE_UPDATE			BIT(31)
> > +#define CMDQ_WFE_UPDATE_VALUE		BIT(16)
> >  #define CMDQ_WFE_WAIT			BIT(15)
> >  #define CMDQ_WFE_WAIT_VALUE		0x1
> >  
> > diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> > index d63749440697..ca70296ae120 100644
> > --- a/include/linux/soc/mediatek/mtk-cmdq.h
> > +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> > @@ -168,6 +168,15 @@ int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event, bool clear);
> >   */
> >  int cmdq_pkt_clear_event(struct cmdq_pkt *pkt, u16 event);
> >  
> > +/**
> > + * cmdq_pkt_set_event() - append set event command to the CMDQ packet
> > + * @pkt:	the CMDQ packet
> > + * @event:	the desired event to be set
> 
> Can we add the events and their code, so that later on, when a consumer calls
> cmdq_pkt_set_event() we don't have any magic values that are hard to understand?

Please see patch 02/13:
http://lists.infradead.org/pipermail/linux-mediatek/2020-March/027801.html

Definitions begin with CMDQ_EVENT_ is the event id to this function.
Since the event id is different between platform, client must parse it
from device tree. So no magic values require when call this function.


Regard,
Dennis


> 
> Regards,
> Matthias
> 
> > + *
> > + * Return: 0 for success; else the error code is returned
> > + */
> > +int cmdq_pkt_set_event(struct cmdq_pkt *pkt, u16 event);
> > +
> >  /**
> >   * cmdq_pkt_poll() - Append polling command to the CMDQ packet, ask GCE to
> >   *		     execute an instruction that wait for a specified
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
