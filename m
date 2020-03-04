Return-Path: <SRS0=cHEQ=4V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E11C3F2D1
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 03:09:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DDBA20866
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 03:09:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RGG5kbR9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GwQ6SaJ2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DDBA20866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N1fiHkoBWTDwn9xL9aFlTKCv4rkP5MUHHj4wenwWr9I=; b=RGG5kbR9fmmuYv
	bCObz0kvjO/6QZIseHc0VoO1w6XGcm/CKs284ZK5hCDBRNP4m48g6VA7qGxoXSsLJnlCr5u9+5VZY
	2TclgWsOqu6DaEKxlonpiKWLbRI9GgSAtRyPCRG62v8dO0VkUrzBkGrLe3qNeVQa/2UjOqcOQmysO
	cBgQqbhpZrqtWO9bq8PJDFoSzm/1WyLe2B/9cI4P2ga5l5s/fo96lAwo+ztYKJHIOXXrHQBQl11oK
	wnJNGnBEBHzWVlfm9cy3G30pnQrqHDLB6AYhfQaH50jN4mKIoc4ZFNBS2xmxoZQ67rGJKdzkj32VI
	eX3T3fEr8UICz6jHsPrw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9KPo-0000d2-6w; Wed, 04 Mar 2020 03:09:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9KPl-0000aO-Ih; Wed, 04 Mar 2020 03:09:42 +0000
X-UUID: b429d143596548d393db5c8dbf35aa86-20200303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Z1qeUZgtAaMPORZUPtFp+pNwtaKiDa0SS964FcwgJfA=; 
 b=GwQ6SaJ2wI2zLVOyHdna+OCeQrRKOqVRo7nsEYEQmGgHNSpANp+n6Qr191kgiycEGrZNgjv4V33/E9MBvtgScY/PZA2KfLhoTnR8lOx8r8iFKUcSb2Abj5fhd8v2eX/g3ppaVHXk10l/V0VdLUzhWTQSfDKrKgcYg9/FxwD5asg=;
X-UUID: b429d143596548d393db5c8dbf35aa86-20200303
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1378520758; Tue, 03 Mar 2020 19:09:40 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Mar 2020 18:59:36 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Mar 2020 11:00:52 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 4 Mar 2020 10:56:57 +0800
Message-ID: <1583290769.1062.4.camel@mtksdaap41>
Subject: Re: [PATCH v4 02/13] mailbox: cmdq: variablize address shift in
 platform
From: CK Hu <ck.hu@mediatek.com>
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
Date: Wed, 4 Mar 2020 10:59:29 +0800
In-Reply-To: <1583289170.32049.1.camel@mtksdaap41>
References: <1583233125-7827-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1583233125-7827-3-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1583289170.32049.1.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200303_190941_621572_2ABBF4A0 
X-CRM114-Status: GOOD (  14.86  )
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

Hi, Dennis:

On Wed, 2020-03-04 at 10:32 +0800, CK Hu wrote:
> Hi, Dennis:
> 
> On Tue, 2020-03-03 at 18:58 +0800, Dennis YC Hsieh wrote:
> > Some gce hardware shift pc and end address in register to support
> > large dram addressing.
> > Implement gce address shift when write or read pc and end register.
> > And add shift bit in platform definition.
> > 
> > Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> > ---
> >  drivers/mailbox/mtk-cmdq-mailbox.c       | 61 ++++++++++++++++++------
> >  drivers/soc/mediatek/mtk-cmdq-helper.c   |  3 +-
> >  include/linux/mailbox/mtk-cmdq-mailbox.h |  2 +
> >  3 files changed, 50 insertions(+), 16 deletions(-)
> > 
> 
> [snip]
> 
> >  
> > diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > index de20e6cba83b..2e1bc513569b 100644
> > --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> > +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > @@ -291,7 +291,8 @@ static int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
> >  
> >  	/* JUMP to end */
> >  	inst.op = CMDQ_CODE_JUMP;
> > -	inst.value = CMDQ_JUMP_PASS;
> > +	inst.value = CMDQ_JUMP_PASS >>
> > +		cmdq_mbox_shift(((struct cmdq_client *)pkt->cl)->chan);
> 
> Why not just cmdq_mbox_shift(pkt->cl->chan) ?

Sorry, the type of pkt->cl is 'void *', so you need to cast it.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Regards,
> CK
> 
> >  	err = cmdq_pkt_append_command(pkt, inst);
> >  
> >  	return err;
> > diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> > index a4dc45fbec0a..dfe5b2eb85cc 100644
> > --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> > +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> > @@ -88,4 +88,6 @@ struct cmdq_pkt {
> >  	void			*cl;
> >  };
> >  
> > +u8 cmdq_mbox_shift(struct mbox_chan *chan);
> > +
> >  #endif /* __MTK_CMDQ_MAILBOX_H__ */
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
