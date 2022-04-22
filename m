Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDE2C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 02:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xbVKKuUon0IQPJltDs0NjoF9Yl99Q7aee/wNhpfBmfA=; b=UhJ9Ka/W8X8l0i
	Gp+34gvr/1J/vl5xhvWeFv7pUIjT5Jv5sJe/VF6thdqdAmaESX/ZOARvsdFDzI53/DNeUJiID+9xa
	ohmnEkgAHt0vETMqpO58cVt8OG3FHaua1kASUkXaIh48YEZuHOi7g0bRcERjiA2E48DvapY6D12VO
	qh1+lvTbZdouW1iPD5SKU8CbUSdW0gXIue4ZXoOAuKRvBkJmHGBuFd4pK8L+TLUuXITMNh9PNfQeI
	GPhxpbyTwOIQSN+nSVaofAmVD3L43x+/EywHl/JBliNxjwEokcTwRr0oxJIa10kLbf/wyb2ayxJ2u
	NmcMGEDJxJ8oANAidAsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhjPa-00FoFP-1C; Fri, 22 Apr 2022 02:52:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhjPW-00FoDG-VX; Fri, 22 Apr 2022 02:52:44 +0000
X-UUID: 7a0e5bea89654a2aad9668b8cdf9cb5c-20220421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=sz50C6AlmsJrrpadxRPhrdqgMkZJjmziP3uFLSNwf3g=; 
 b=jwfM9fdp1ggNqAXGClew28lEg1O/0R3zvy8yoTgGJN/YranLzPhKjXHAgfsX9xZxlLRQ5msnBidPI8v23J2fRom8nU7KVGRWdGLuktrL2tvqwbe5QIMqJ/SO6OZBfyyEh5oXhZeGDw3JxOx0aUx6ghAt1MuNjsJMHMBGRzH5gq0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:d52fbe31-a51f-4a98-9570-0847b3af58ff, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:8
X-CID-META: VersionHash:faefae9, CLOUDID:1a368cf0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 7a0e5bea89654a2aad9668b8cdf9cb5c-20220421
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 595584067; Thu, 21 Apr 2022 19:52:37 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Apr 2022 19:52:35 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 22 Apr 2022 10:52:28 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Apr 2022 10:52:27 +0800
Message-ID: <d77e445b764cab4085390c0dd09a69f9479aec05.camel@mediatek.com>
Subject: Re: [PATCH] media: platform: mtk-mdp: Fix mdp_ipi_comm structure
 alignment
From: Irui Wang <irui.wang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <minghsiu.tsai@mediatek.com>
CC: <houlong.wei@mediatek.com>, <andrew-ct.chen@mediatek.com>,
 <mchehab@kernel.org>, <matthias.bgg@gmail.com>, <hans.verkuil@cisco.com>,
 <linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <kernel@collabora.com>, <acourbot@chromium.org>
Date: Fri, 22 Apr 2022 10:52:27 +0800
In-Reply-To: <7658c8e4-596b-abfc-9255-854c16f920a7@collabora.com>
References: <20220307155653.460910-1-angelogioacchino.delregno@collabora.com>
 <7658c8e4-596b-abfc-9255-854c16f920a7@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_195243_055308_913170A4 
X-CRM114-Status: GOOD (  24.64  )
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

Dear Angelo,

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
The struct definition should be keep align between Kernel and
User(sizeof(kernel) == sizeof(md32)), for backward compatible, the new
"padding" variable can't be accessed by Kernel and md32, just for
alignment padding in kernel side.

Reviewed-by: Irui Wang <irui.wang@mediatek.com>
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
