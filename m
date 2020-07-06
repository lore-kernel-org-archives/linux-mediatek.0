Return-Path: <SRS0=Wnqn=AR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B904C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2020 14:21:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBF3A20722
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2020 14:21:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FZlJpvoH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iDvNp8x5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBF3A20722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tK43FSBf9rGzB5NL08/HTVA1kjoG5OLxMrQcLG3Wga4=; b=FZlJpvoHhRfnk+GXV7aOAsq/P
	WOorFhBmYXPZM2l8jLRrsq0qQrHMlMEJb7VZ3H0mxo2rH3U9HHNOnMVtgb0AgmLYEsG2zFip6Aqrt
	TuNyMNe6G0d2XwFiPnga/IfNj7qi3fVI+VFJ9uWtzY63PeiqeUUXloV7FgXDMGu8r82H0uRURrz7n
	U8z81Y0KvH9y98aK+789GrmFpQ4rP7PkcKMs8x0+0SB2+Ysb2A5/F7ZXevRYVr1XvLONB+hOZU6gT
	SBDxe3eDg16LtEZ03nJKaLWK25kVW6eXx4MKwRCjdiaxtRPxHp0cmnS18nIfyIqueGNS3xa/mznJQ
	aVD6oTs8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsRzm-0003Q1-VF; Mon, 06 Jul 2020 14:21:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsRzj-0003Nx-9D; Mon, 06 Jul 2020 14:21:20 +0000
X-UUID: c50312828665432182c161e3adf8cf63-20200706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=OXs1SySUuohRlkO/f7ZMQ1WQrymho9U6t0SKN8dmd0A=; 
 b=iDvNp8x5hX0ZvvrjeLDjd0lBU/8azwNDYfNE+Dpei8W/G+GY/nWS1Dqxho2/2Zf7k3lmB4ZPURCOLNkvhVZAVdUk2iP825BmmTZyJpZ/mfRIMasNvCN6EGtNsDhCuZngUJPmxYlXYw6fL0c2mvhp8XXYu0t2W04JB5NYQkTPAgM=;
X-UUID: c50312828665432182c161e3adf8cf63-20200706
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 611928823; Mon, 06 Jul 2020 06:20:56 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Jul 2020 07:21:09 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Jul 2020 22:21:06 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 6 Jul 2020 22:21:07 +0800
Message-ID: <1594045270.19205.4.camel@mtkswgap22>
Subject: Re: [PATCH v2 1/8] soc: mediatek: cmdq: add address shift in jump
From: Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Mon, 6 Jul 2020 22:21:10 +0800
In-Reply-To: <31a41c40-10f5-260d-cebd-7cc2a432095d@gmail.com>
References: <1593931715-32761-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1593931715-32761-2-git-send-email-dennis-yc.hsieh@mediatek.com>
 <31a41c40-10f5-260d-cebd-7cc2a432095d@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D9D74A0864D11FB68CC9C721CD27F57DA020E8AE1AAB324BDCC36D49191540CF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200706_102119_487676_40FB47DB 
X-CRM114-Status: GOOD (  19.58  )
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
Cc: Daniel Vetter <daniel@ffwll.ch>, wsd_upstream@mediatek.com,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Houlong Wei <houlong.wei@mediatek.com>, HS Liao <hs.liao@mediatek.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Matthias,

thanks for your comment

On Mon, 2020-07-06 at 16:03 +0200, Matthias Brugger wrote:
> 
> On 05/07/2020 08:48, Dennis YC Hsieh wrote:
> > Add address shift when compose jump instruction
> > to compatible with 35bit format.
> > 
> > Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> 
> You are missing Bibby's Reviewed-by. Please honour the effort reviewers do by
> adding the appropriate tags.
> 
> Please double check the series and resend with all tags added.
> 
> Also, it would be good if you could provide a change log. That makes it easier
> for the maintainer to see which statements you addressed.

this patch changed since cmdq_mbox_shift() rename to cmdq_get_shift_pa()
by Bibby's comment [1], so I removed reviewed tags from this patch.

I'll provide change log to this patch and resend later, thanks.

[1]
http://lists.infradead.org/pipermail/linux-mediatek/2020-June/013387.html


Regards,
Dennis

> 
> Thanks,
> Matthias
> 
> > ---
> >  drivers/soc/mediatek/mtk-cmdq-helper.c |    3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > index dc644cfb6419..9faf78fbed3a 100644
> > --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> > +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > @@ -329,7 +329,8 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
> >  
> >  	/* JUMP to end */
> >  	inst.op = CMDQ_CODE_JUMP;
> > -	inst.value = CMDQ_JUMP_PASS;
> > +	inst.value = CMDQ_JUMP_PASS >>
> > +		cmdq_get_shift_pa(((struct cmdq_client *)pkt->cl)->chan);
> >  	err = cmdq_pkt_append_command(pkt, inst);
> >  
> >  	return err;
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
