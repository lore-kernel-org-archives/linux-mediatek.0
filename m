Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DA9C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 02:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m4axAENjkcJ9rY6NAUnLeRd8fAF9bvUr8ndTD2QwT4M=; b=A51jPadTnOJXDy
	Jo+c++QqF1K+Y3EJyIRlbtSyocoVY2DlawqXXACGk366n9HNVr62B7l/mLeX4KW5wly/Ku36diFZr
	dSa5hbCm8Mz+f2W0D4fR9OVRdzWlqR5YhX2s/kZzRhKu8ea8zBoFhsG7tRLWXlifud/UHxYM0OmQu
	eTLt8qALszIiPNXChuWtAbmvd3m8iFC9kcqDlgTlHrbCSzUIxOTM0wr7KNRSM9CGeF/slYONgp1qP
	kpoWGpzRCzRIx68D9/pHw6rBLeVnEFUvq5coXvu5fVELklShNwqscFXXQo+j1NSRds3uL5hu1p1rY
	H7A0eqbe/QIwJGrGKXpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhjOI-00FnrG-Gi; Fri, 22 Apr 2022 02:51:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhjOB-00FnoG-Um; Fri, 22 Apr 2022 02:51:25 +0000
X-UUID: 92f7cb725d6a4855b39650b8f4a15bb9-20220421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=tzXCGAxLRrdm3PJ2khDbtUK7hTfeeA+9bFIdBDIuWbc=; 
 b=hstW9wJ7acuky3bv2wFKQAGoKUVAg45SV2L21+U+xOLyB1ddSYpK6LvviFmJsa3qKJHOmG28d2B84oD7mYpzXOWPb/ajgLCPGRpMlxXTjMjYbY+GU6FzvBlX8DZlyPGFTGHEq1TaWn/ju47gV4IIPTp3bsaQ4lyM9Z9p1ptLnHY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:e7111b37-2d29-4bf9-8e43-1fe0bf2af457, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:2
X-CID-META: VersionHash:faefae9, CLOUDID:842db6ef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 92f7cb725d6a4855b39650b8f4a15bb9-20220421
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <houlong.wei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 569084767; Thu, 21 Apr 2022 19:51:13 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Apr 2022 19:51:12 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 22 Apr 2022 10:51:02 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Apr 2022 10:51:02 +0800
Message-ID: <6ffdf93599e0b55bd3640ef3f17a9255635f0b79.camel@mediatek.com>
Subject: Re: [PATCH] media: platform: mtk-mdp: Fix mdp_ipi_comm structure
 alignment
From: houlong.wei <houlong.wei@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <minghsiu.tsai@mediatek.com>
CC: <andrew-ct.chen@mediatek.com>, <mchehab@kernel.org>,
 <matthias.bgg@gmail.com>, <hans.verkuil@cisco.com>,
 <linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <kernel@collabora.com>, <acourbot@chromium.org>, <irui.wang@mediatek.com>,
 <houlong.wei@mediatek.com>
Date: Fri, 22 Apr 2022 10:51:02 +0800
In-Reply-To: <7658c8e4-596b-abfc-9255-854c16f920a7@collabora.com>
References: <20220307155653.460910-1-angelogioacchino.delregno@collabora.com>
 <7658c8e4-596b-abfc-9255-854c16f920a7@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_195124_259023_7C74F45E 
X-CRM114-Status: GOOD (  23.95  )
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

On Thu, 2022-04-21 at 13:03 +0200, AngeloGioacchino Del Regno wrote:
> Il 07/03/22 16:56, AngeloGioacchino Del Regno ha scritto:
> > The mdp_ipi_comm structure defines a command that is either
> > PROCESS (start processing) or DEINIT (destroy instance); we
> > are using this one to send PROCESS or DEINIT commands from Linux
> > to an MDP instance through a VPU write but, while the first wants
> > us to stay 4-bytes aligned, the VPU instead requires an 8-bytes
> > data alignment.
> > 
> > Keeping in mind that these commands are executed immediately
> > after sending them (hence not chained with others before the
> > VPU/MDP "actually" start executing), it is fine to simply add
> > a padding of 4 bytes to this structure: this keeps the same
> > performance as before, as we're still stack-allocating it,
> > while avoiding hackery inside of mtk-vpu to ensure alignment
> > bringing a definitely bigger performance impact.
> > 
> > Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
> > Signed-off-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> 
> Hello,
> is there any issue with this patch?
> 
> Regards,
> Angelo
> 

The 'padding' is added at the end of the struct, there will be no
problem in the VPU firmware. Thanks for the patch.

Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>

> > ---
> > 
> > This patch has been tested on Acer Chromebook R 13 (MT8173 Elm) on
> > Debian Sid.
> > 
> > This is an alternative solution to the mtk-vpu approach, found
> > here:
> > 
https://lore.kernel.org/all/20210920170408.1561-1-dafna.hirschfeld@collabora.com
> > 
> >   drivers/media/platform/mtk-mdp/mtk_mdp_ipi.h | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_ipi.h
> > b/drivers/media/platform/mtk-mdp/mtk_mdp_ipi.h
> > index 2cb8cecb3077..b810c96695c8 100644
> > --- a/drivers/media/platform/mtk-mdp/mtk_mdp_ipi.h
> > +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_ipi.h
> > @@ -40,12 +40,14 @@ struct mdp_ipi_init {
> >    * @ipi_id        : IPI_MDP
> >    * @ap_inst       : AP mtk_mdp_vpu address
> >    * @vpu_inst_addr : VPU MDP instance address
> > + * @padding       : Alignment padding
> >    */
> >   struct mdp_ipi_comm {
> >   	uint32_t msg_id;
> >   	uint32_t ipi_id;
> >   	uint64_t ap_inst;
> >   	uint32_t vpu_inst_addr;
> > +	uint32_t padding;
> >   };
> >   
> >   /**
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
