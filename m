Return-Path: <SRS0=NAie=2C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87915C43603
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 01:37:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5509F2077B
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 01:37:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="as3nG7GG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="TwGczfOt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5509F2077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N4FqbZbvb8hfewMGH8OZEVFbwtKSrj6hCGjVl9ODHsU=; b=as3nG7GGmJieyv
	cAwGmX21SYDXBB46Iu/Ro/YQoR5dUHd3nqwKvexU7aqEephXJ66W/uCCU0yX8kMmGauGVTU4utz+y
	ypvIYkNAMaok1GhAWy3R0DNU7bVBhmJ12J4FrpIYfgDTrRZzL2pQ/5hIOjJUTFCECPpgW3i/VYTXp
	lxunKLDJVHAqIOs8pI1QKss0kpGCN2lP7VoUQnStR67EKjDJMCas6r710YowCrwFdBNRz1OrzKTTJ
	AKunRJ685mwZXFl5ZHkLPg+m+LhzvLPBoUY7a1sb2owkBNUwcmcMv0SUBvRKHN301lX0cc/Vep9mK
	yextcM72qNinhnuapXWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifDQK-00009H-Ar; Thu, 12 Dec 2019 01:37:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifDQ9-0008Ri-Td; Thu, 12 Dec 2019 01:37:39 +0000
X-UUID: 5cf04614c48e4202baa320f72e4f02c4-20191211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=PipsN9f6SWadwcwIrVs3U74QlgXQz8aVan1+C+FVNtA=; 
 b=TwGczfOt/sn2BvfIAJGPx0gzPpkXhck7/79SNxXautFLDURVlPDA85L38tAdur/DzjQjPtRQ2m/SnNHhx0H+ErsCyZd/gqWwDeTpGZbqNJlX51IC30sP8Je4AFlbbd51N3Jis56mgwfE1BU6kKXIZOYJSNazyOs8F+vf43DkqAU=;
X-UUID: 5cf04614c48e4202baa320f72e4f02c4-20191211
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 640138727; Wed, 11 Dec 2019 17:37:35 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Dec 2019 17:37:50 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 12 Dec 2019 09:37:17 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 12 Dec 2019 09:37:28 +0800
Message-ID: <1576114652.17653.13.camel@mtkswgap22>
Subject: Re: [PATCH v2 12/14] soc: mediatek: cmdq: add loop function
From: Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Date: Thu, 12 Dec 2019 09:37:32 +0800
In-Reply-To: <1576028899.19653.5.camel@mtksdaap41>
References: <1574819937-6246-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1574819937-6246-14-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1576028899.19653.5.camel@mtksdaap41>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_173737_966580_71FDBAEE 
X-CRM114-Status: GOOD (  17.33  )
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

On Wed, 2019-12-11 at 09:48 +0800, CK Hu wrote:
> Hi, Dennis:
> 
> On Wed, 2019-11-27 at 09:58 +0800, Dennis YC Hsieh wrote:
> > Add finalize loop function in cmdq helper functions which loop whole pkt
> > in gce hardware thread without cpu operation.
> > 
> > Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mtk-cmdq-helper.c | 22 ++++++++++++++++++++++
> >  include/linux/soc/mediatek/mtk-cmdq.h  |  8 ++++++++
> >  2 files changed, 30 insertions(+)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > index 38e0c13e1922..10a9b4481e58 100644
> > --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> > +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > @@ -414,6 +414,28 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
> >  }
> >  EXPORT_SYMBOL(cmdq_pkt_finalize);
> >  
> > +int cmdq_pkt_finalize_loop(struct cmdq_pkt *pkt)
> > +{
> > +	struct cmdq_client *cl = pkt->cl;
> > +	struct cmdq_instruction inst = { {0} };
> > +	int err;
> > +
> > +	/* insert EOC and generate IRQ for each command iteration */
> > +	inst.op = CMDQ_CODE_EOC;
> > +	err = cmdq_pkt_append_command(pkt, inst);
> > +	if (err < 0)
> > +		return err;
> 
> It looks like you want a pkt execute command repeatedly, but why do you
> repeatedly trigger IRQ? This IRQ would do nothing because this pkt would
> never finish.
> 

see following section

> > +
> > +	/* JUMP abaolute to begin */
> > +	inst.op = CMDQ_CODE_JUMP;
> > +	inst.offset = 1;
> > +	inst.value = pkt->pa_base >> cmdq_mbox_shift(cl->chan);
> > +	err = cmdq_pkt_append_command(pkt, inst);
> 
> Why not just export this function as cmdq_pkt_jump()? Let client decide
> where to jump would be more flexible.
> 
> Regards,
> CK
> 

ok, I will remove this part and expose cmdq_pkt_jump()


Regards,
Dennis

> > +
> > +	return err;
> > +}
> > +EXPORT_SYMBOL(cmdq_pkt_finalize_loop);
> > +
> >  static void cmdq_pkt_flush_async_cb(struct cmdq_cb_data data)
> >  {
> >  	struct cmdq_pkt *pkt = (struct cmdq_pkt *)data.data;
> > diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> > index 998bc90f9da9..d15d8c941992 100644
> > --- a/include/linux/soc/mediatek/mtk-cmdq.h
> > +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> > @@ -212,6 +212,14 @@ int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value);
> >   */
> >  int cmdq_pkt_finalize(struct cmdq_pkt *pkt);
> >  
> > +/**
> > + * cmdq_pkt_finalize_loop() - Append EOC and jump command to loop pkt.
> > + * @pkt:	the CMDQ packet
> > + *
> > + * Return: 0 for success; else the error code is returned
> > + */
> > +int cmdq_pkt_finalize_loop(struct cmdq_pkt *pkt);
> > +
> >  /**
> >   * cmdq_pkt_flush_async() - trigger CMDQ to asynchronously execute the CMDQ
> >   *                          packet and call back at the end of done packet
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
